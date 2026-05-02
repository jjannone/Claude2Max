#!/usr/bin/env python3
"""
build_helpfile_objects.py — Extract metadata for packages whose objects are
documented via .maxhelp files instead of refpage XML.

Walks every *.maxhelp under a package directory, extracts comments and the
canonical object instance (matching the help-file basename), and emits a
JSON inventory keyed by package then object.

Usage:
    # Survey: dump a single package's help-derived inventory
    python3 build_helpfile_objects.py --package cv.jit

    # Merge into package_objects.json (preserves existing use_when)
    python3 packages/build_helpfile_objects.py --package cv.jit --merge packages/package_objects.json

The extractor pulls:
  - digest:        first comment box matching "<object>: ..." or the most
                   plausible introductory comment
  - description:   list of substantive comment boxes (longer than 30 chars)
  - args:          arguments seen on the canonical object instance
  - attrs_seen:    @<name> tokens seen on the canonical instance text
  - in_count, out_count: from the canonical instance (best available signal
                   when no refpage exists)

`use_when` is left empty for curation. Existing values are preserved on --merge.
"""

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from package_schema import normalize, OPTIONAL_KEYS  # canonical record shape

DEFAULT_ROOT = Path.home() / "Documents" / "Max 9" / "Packages"
_EXTERNAL_SUFFIXES = {".mxo", ".mxe", ".mxe64"}


def detect_kind(package_dir, object_name):
    found = {"external": False, "abstraction": False, "javascript": False}
    for path in package_dir.rglob(object_name + ".*"):
        suffix = path.suffix.lower()
        if suffix in _EXTERNAL_SUFFIXES:
            found["external"] = True
        elif suffix == ".maxpat":
            # Abstractions live alongside helps; a .maxhelp itself isn't one.
            found["abstraction"] = True
        elif suffix == ".js":
            found["javascript"] = True
    for kind in ("external", "abstraction", "javascript"):
        if found[kind]:
            return kind
    return ""


def _walk_boxes(patcher):
    """Yield every box dict in a patcher, recursing into subpatchers."""
    for entry in patcher.get("boxes", []):
        b = entry.get("box", {})
        yield b
        sub = b.get("patcher")
        if sub:
            yield from _walk_boxes(sub)


def parse_help(help_path, object_name):
    """Return a dict of {digest, description, args, attrs_seen, in_count, out_count}."""
    # Some legacy helpfiles ship with non-UTF-8 byte sequences (mostly old
    # macOS Roman encodings of accented characters in comments). Try utf-8
    # first, then fall back to latin-1 which can decode any byte sequence.
    for enc in ("utf-8", "latin-1"):
        try:
            with open(help_path, encoding=enc) as f:
                data = json.load(f)
            break
        except UnicodeDecodeError:
            continue
        except (json.JSONDecodeError, OSError):
            return None
    else:
        return None

    patcher = data.get("patcher", {})
    comments = []
    canonical = None  # the first newobj instance whose first token == object_name

    for box in _walk_boxes(patcher):
        cls = box.get("maxclass", "")
        text = (box.get("text") or "").strip()
        if cls == "comment" and text:
            comments.append(text)
        elif cls == "newobj" and text:
            first = text.split()[0] if text.split() else ""
            if first == object_name and canonical is None:
                canonical = box

    # Digest: prefer a comment of form "<obj>: description" or "<obj> ..."
    digest = ""
    for c in comments:
        if c.lower().startswith(object_name.lower() + ":") or \
           c.lower().startswith(object_name.lower() + " "):
            digest = c
            break
    if not digest and comments:
        # Fallback: longest single-line comment under 200 chars (likely intro)
        candidates = [c for c in comments if "\n" not in c and 20 < len(c) < 200]
        if candidates:
            digest = max(candidates, key=len)

    # Description: substantive comments (>30 chars) that aren't UI labels
    description = [c for c in comments if len(c) > 30 and not c.startswith("Input:") and not c.startswith("Output:")]
    description = description[:8]  # cap

    args = []
    attrs_seen = []
    in_count = 0
    out_count = 0
    if canonical:
        text = canonical.get("text", "")
        tokens = text.split()
        if len(tokens) > 1:
            for tok in tokens[1:]:
                if tok.startswith("@"):
                    attrs_seen.append(tok)
                else:
                    args.append(tok)
        in_count = canonical.get("numinlets", 0)
        out_count = canonical.get("numoutlets", 0)

    return {
        "digest":        digest,
        "description":   description,
        "args":          args,
        "attrs_seen":    sorted(set(attrs_seen)),
        "numinlets":     in_count,
        "numoutlets":    out_count,
        "outlettype":    canonical.get("outlettype", []) if canonical else [],
    }


def extract_package(package_dir):
    package_dir = Path(package_dir).expanduser()
    if not package_dir.is_dir():
        raise SystemExit(f"Not a directory: {package_dir}")

    objects = {}
    for help_path in sorted(package_dir.rglob("*.maxhelp")):
        name = help_path.name[: -len(".maxhelp")]
        parsed = parse_help(help_path, name)
        if parsed is None:
            continue

        # Schema is unified with build_package_objects.py. Helpfile-derived
        # entries don't carry refpage tags (the helpfile XML has no equivalent),
        # so `tags` is always an empty list here. `description`, `args`, and
        # `attrs_seen` from the canonical instance are extraction-time scratch
        # only — distilled into use_when by the curator and not persisted.
        record = {
            "digest":      parsed["digest"],
            "numinlets":   parsed["numinlets"],
            "numoutlets":  parsed["numoutlets"],
            "outlettype":  parsed["outlettype"],
            "kind":        detect_kind(package_dir, name),
            "tags":        [],
            "source":      "helpfile",
            "use_when":    "",
        }
        # Stash transient extraction context for the curator's first read,
        # stripped before persisting in merge_into.
        record["_description"] = parsed["description"]
        record["_args"]        = parsed["args"]
        record["_attrs_seen"]  = parsed["attrs_seen"]
        objects[name] = record

    return objects


def merge_into(existing, package_name, new_objects):
    """
    Merge new_objects into existing[package_name], preserving use_when.

    Every record going to disk passes through `normalize()` here — including
    untouched prior records that happen to be in the same bucket — so the
    library is guaranteed to conform to the canonical schema after any merge.
    Transient extractor-internal fields (`_description`, `_attrs_seen`, …)
    are dropped by `normalize`'s unknown-key filter.
    """
    bucket = existing.setdefault(package_name, {})
    for name, record in new_objects.items():
        prior = bucket.get(name, {})
        if prior.get("use_when"):
            record["use_when"] = prior["use_when"]
        # Carry forward optional curator-added fields from prior
        for key in OPTIONAL_KEYS:
            if key in prior and key not in record:
                record[key] = prior[key]
        bucket[name] = normalize(record)
    # Defensive: normalise prior records in this bucket that weren't touched
    # by the new extraction.
    for name, rec in list(bucket.items()):
        bucket[name] = normalize(rec)
    return existing


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--package", required=True, help="Package directory name")
    p.add_argument("--root", default=str(DEFAULT_ROOT))
    p.add_argument("--merge", help="Path to package_objects.json to merge into")
    args = p.parse_args()

    pkg_dir = Path(args.root).expanduser() / args.package
    new_objects = extract_package(pkg_dir)

    if args.merge:
        merge_path = Path(args.merge)
        existing = {}
        if merge_path.exists():
            with merge_path.open() as f:
                existing = json.load(f)
        merge_into(existing, args.package, new_objects)
        # No post-merge cleanup needed — normalize() inside merge_into has
        # already stripped any transient/unknown keys (`_description`,
        # `_attrs_seen`, legacy un-prefixed variants) per the canonical
        # schema in package_schema.py.
        with merge_path.open("w") as f:
            json.dump(existing, f, indent=2, sort_keys=True)
            f.write("\n")
        print(f"Wrote {len(new_objects)} objects from {args.package} into {merge_path}",
              file=sys.stderr)
    else:
        print(json.dumps({args.package: new_objects}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
