#!/usr/bin/env python3
"""Mechanical extractor for the .maxhelp / .maxpat / .amxd corpus crawl.

Walks every Max patcher document shipped with Max (core `help/`, bundled
`packages/`) and installed under the user's `Packages/`, recursing into
nested subpatchers, and tallies the attributes that Cycling '74's own
patches actually set on each object. The output JSON is the highest-value
deliverable of the corpus crawl: a data-driven `object -> observed-attrs`
map that `spec2maxpat.build_resolver` can union into the valid-attribute
set (`own refpage ∪ jbox ∪ observed-in-corpus`) to cut false positives in
the anti-guessing attribute checker without weakening real-error detection.

Three document kinds, all the same `.maxpat` JSON structure:
  * `.maxhelp`  — help patches (the canonical "how to use this object" demo).
  * `.maxpat`   — abstractions, bpatchers, and example patches (objects in
    their own right; same attribute ground truth as help patches).
  * `.amxd`     — Max for Live devices. A small `ampf` binary header precedes
    the embedded maxpat JSON; we locate the first `{` and `raw_decode` one
    JSON object, ignoring trailing binary. High-value for `live.*` attrs.

No MCT decode is needed and everything is local (no network). See
`maxhelp/MAXHELP_CRAWL_LOG.md` for how this fits the session workflow and
`TASK_QUEUE.md` ("`.maxhelp` Corpus Crawl") for the full rationale.

Usage:
    python3 maxhelp/extract_observed_attrs.py             # full corpus, all kinds
    python3 maxhelp/extract_observed_attrs.py --kinds maxhelp   # help patches only
    python3 maxhelp/extract_observed_attrs.py --limit 50 # quick smoke test
    python3 maxhelp/extract_observed_attrs.py --summary   # print top objects/attrs

Outputs (written next to this script):
    maxhelp_observed_attrs.json  -- object -> {boxes, attrs:{name:count}}
    maxhelp_crawl_state.json     -- per-file status + maxclass coverage

Stdlib only.
"""

import argparse
import datetime
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path

# Document kinds, by file extension. All parse to the same patcher JSON.
KIND_EXTENSIONS = {
    "maxhelp": ".maxhelp",
    "maxpat": ".maxpat",
    "amxd": ".amxd",
}
DEFAULT_KINDS = ("maxhelp", "maxpat", "amxd")

# --- Corpus roots ----------------------------------------------------------
# Order matters: core help first (highest signal), then bundled packages,
# then user-installed packages. Each root is tagged so coverage can be
# reported per-tier.
CORPUS_ROOTS = [
    ("core",
     Path("/Applications/Max.app/Contents/Resources/C74/help")),
    ("bundled-packages",
     Path("/Applications/Max.app/Contents/Resources/C74/packages")),
    ("user-packages",
     Path(os.path.expanduser("~/Documents/Max 9/Packages"))),
]

HERE = Path(__file__).resolve().parent
OBSERVED_OUT = HERE / "maxhelp_observed_attrs.json"
STATE_OUT = HERE / "maxhelp_crawl_state.json"

# --- Structural keys -------------------------------------------------------
# Box-level JSON keys that are NOT user-facing attributes: geometry, wiring
# arity, identity, object text, and the nested subpatcher payload. These are
# managed by the converter directly and must not pollute the observed-attrs
# map (they would never appear as a typo'd attribute in a spec's `attrs`).
# Everything else on a box IS a settable attribute Max chose to serialize,
# which is exactly the ground truth we want.
STRUCTURAL_KEYS = frozenset({
    "id", "maxclass", "text", "numinlets", "numoutlets", "outlettype",
    "patching_rect", "presentation_rect", "patcher", "saved_object_attributes",
    "saved_attribute_attributes", "prototypename",
})


def object_name(box):
    """Resolve a box to the name the converter's resolver looks up.

    For object boxes (`newobj`) the name is the first whitespace token of the
    object text (the class name, e.g. `metro` in `metro 100 @active 1`). For
    everything else the maxclass IS the name (`toggle`, `flonum`, `message`,
    `comment`, `live.gain~`). Returns None for an unusable box (empty newobj).
    """
    mc = box.get("maxclass")
    if mc == "newobj":
        text = (box.get("text") or "").strip()
        if not text:
            return None
        return text.split()[0]
    return mc


def walk_boxes(patcher):
    """Yield every box dict in a patcher, recursing into nested subpatchers."""
    for entry in patcher.get("boxes", []):
        box = entry.get("box")
        if not isinstance(box, dict):
            continue
        yield box
        sub = box.get("patcher")
        if isinstance(sub, dict):
            yield from walk_boxes(sub)


def box_attrs(box):
    """The observed-attribute key set for one box.

    Top-level non-structural keys UNION the keys nested under
    `saved_object_attributes` (where many objects stash their persisted
    attribute values, e.g. UI colors, range, parameter_* flags).
    """
    keys = set(box.keys()) - STRUCTURAL_KEYS
    # saved_object_attributes nests an object's persisted attribute values.
    soa = box.get("saved_object_attributes")
    if isinstance(soa, dict):
        keys |= set(soa.keys())
    # saved_attribute_attributes is keyed by attribute NAME (e.g. "linecolor"),
    # each mapping to parameter-system meta. The top-level keys are real
    # attribute names; the nested meta (parameter_*, expression) is not.
    saa = box.get("saved_attribute_attributes")
    if isinstance(saa, dict):
        keys |= {k for k in saa.keys() if k != "valueof"}
    return keys


def load_patcher(path, kind):
    """Return the patcher dict for one corpus file, or raise on failure.

    `.maxhelp` / `.maxpat` are plain JSON. `.amxd` (Max for Live) prefixes the
    maxpat JSON with a binary `ampf` chunk header, so we find the first `{` and
    decode exactly one JSON object, ignoring the trailing binary the device may
    carry (frozen attachments, etc.).
    """
    # strict=False: Max patchers legitimately carry raw control characters
    # inside string values (e.g. literal tabs/newlines in comment text), which
    # the strict JSON parser rejects. Allowing them recovers ~40 otherwise-
    # unreadable files without masking genuine corruption.
    decoder = json.JSONDecoder(strict=False)
    if kind == "amxd":
        raw = path.read_bytes()
        start = raw.find(b"{")
        if start < 0:
            raise ValueError("no JSON object in amxd")
        text = raw[start:].decode("utf-8", errors="replace")
        doc, _ = decoder.raw_decode(text)
    else:
        doc = decoder.decode(path.read_text(encoding="utf-8", errors="replace"))
    patcher = doc.get("patcher")
    if not isinstance(patcher, dict):
        raise ValueError("no patcher root")
    return patcher


def iter_corpus(kinds, limit=None):
    """Yield (tier, kind, path) for every selected-kind file under the roots.

    A single rglob per (root, kind). Deterministic order: roots in CORPUS_ROOTS
    order, kinds in the given order, paths sorted within each.
    """
    n = 0
    for tier, root in CORPUS_ROOTS:
        if not root.exists():
            continue
        for kind in kinds:
            ext = KIND_EXTENSIONS[kind]
            for path in sorted(root.rglob(f"*{ext}")):
                yield tier, kind, path
                n += 1
                if limit and n >= limit:
                    return


def extract(kinds=DEFAULT_KINDS, limit=None, verbose=False):
    # object_name -> Counter(attr -> count)
    attrs_by_obj = defaultdict(Counter)
    # object_name -> number of boxes seen
    boxes_by_obj = Counter()
    # maxclass -> count (coverage stat, independent of object_name resolution)
    maxclass_counts = Counter()
    state = {}  # path -> {tier, kind, status, boxes, objects, error}
    kind_counts = Counter()  # kind -> files scanned

    files_scanned = files_failed = total_boxes = 0

    for tier, kind, path in iter_corpus(kinds, limit=limit):
        key = str(path)
        try:
            patcher = load_patcher(path, kind)
        except Exception as exc:  # malformed / unreadable
            files_failed += 1
            state[key] = {"tier": tier, "kind": kind, "status": "skipped",
                          "error": str(exc)[:200]}
            if verbose:
                print(f"  SKIP {path.name}: {exc}", file=sys.stderr)
            continue

        file_objs = set()
        file_boxes = 0
        for box in walk_boxes(patcher):
            mc = box.get("maxclass")
            if mc:
                maxclass_counts[mc] += 1
            name = object_name(box)
            if name is None:
                continue
            file_boxes += 1
            total_boxes += 1
            boxes_by_obj[name] += 1
            file_objs.add(name)
            for attr in box_attrs(box):
                attrs_by_obj[name][attr] += 1

        files_scanned += 1
        kind_counts[kind] += 1
        state[key] = {
            "tier": tier,
            "kind": kind,
            "status": "scanned",
            "boxes": file_boxes,
            "objects": sorted(file_objs),
        }

    observed = {
        "_meta": {
            "generated": datetime.date.today().isoformat(),
            "kinds_scanned": list(kinds),
            "files_scanned": files_scanned,
            "files_by_kind": dict(kind_counts),
            "files_failed": files_failed,
            "total_boxes": total_boxes,
            "distinct_objects": len(attrs_by_obj),
            "corpus_roots": [str(r) for _, r in CORPUS_ROOTS],
            "structural_excluded": sorted(STRUCTURAL_KEYS),
            "note": ("attrs map: object name (newobj -> first text token; "
                     "else maxclass) -> {attr: occurrence count} across the "
                     "corpus (.maxhelp + .maxpat + .amxd). Union into "
                     "spec2maxpat valid-attr set."),
        },
        "objects": {
            name: {
                "boxes": boxes_by_obj[name],
                "attrs": dict(counter.most_common()),
            }
            for name, counter in sorted(attrs_by_obj.items())
        },
        "maxclass_counts": dict(maxclass_counts.most_common()),
    }
    return observed, state


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--kinds", default=",".join(DEFAULT_KINDS),
                    help="comma-separated doc kinds to scan: "
                         f"{','.join(KIND_EXTENSIONS)} (default: all)")
    ap.add_argument("--limit", type=int, default=None,
                    help="process only the first N files (smoke test)")
    ap.add_argument("--summary", action="store_true",
                    help="print top objects/attrs after extracting")
    ap.add_argument("--no-write", action="store_true",
                    help="don't write output JSON (use with --summary)")
    ap.add_argument("--verbose", action="store_true",
                    help="report each skipped/failed file")
    args = ap.parse_args()

    kinds = tuple(k.strip() for k in args.kinds.split(",") if k.strip())
    bad = [k for k in kinds if k not in KIND_EXTENSIONS]
    if bad:
        ap.error(f"unknown kind(s): {bad}; valid: {list(KIND_EXTENSIONS)}")

    observed, state = extract(kinds=kinds, limit=args.limit, verbose=args.verbose)
    meta = observed["_meta"]

    if not args.no_write:
        OBSERVED_OUT.write_text(json.dumps(observed, indent=2) + "\n")
        STATE_OUT.write_text(json.dumps(state, indent=2) + "\n")

    print(f"kinds scanned : {meta['kinds_scanned']}")
    print(f"files scanned : {meta['files_scanned']}  by-kind={meta['files_by_kind']}")
    print(f"files failed  : {meta['files_failed']}")
    print(f"total boxes   : {meta['total_boxes']}")
    print(f"distinct objs : {meta['distinct_objects']}")
    if not args.no_write:
        print(f"wrote         : {OBSERVED_OUT.name}, {STATE_OUT.name}")

    if args.summary:
        print("\nTop 25 objects by box count:")
        ranked = sorted(observed["objects"].items(),
                        key=lambda kv: kv[1]["boxes"], reverse=True)
        for name, rec in ranked[:25]:
            top_attrs = list(rec["attrs"].items())[:6]
            shown = ", ".join(f"{a}({c})" for a, c in top_attrs)
            print(f"  {name:<22} boxes={rec['boxes']:<5} attrs={len(rec['attrs']):<3} {shown}")


if __name__ == "__main__":
    main()
