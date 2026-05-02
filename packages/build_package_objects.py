#!/usr/bin/env python3
"""
build_package_objects.py — Extract refpage metadata for installed Max packages.

Walks every *.maxref.xml under a package directory, reuses RefpageCache._parse
from spec2maxpat.py, and emits a JSON inventory keyed by package then object.

Usage:
    # Dump a single package's raw inventory to stdout
    python3 build_package_objects.py --package FluidCorpusManipulation

    # Same, but tell it where to look (defaults to ~/Documents/Max 9/Packages)
    python3 build_package_objects.py --package PeRColate --root "~/Documents/Max 9/Packages"

    # Merge into package_objects.json without overwriting existing use_when fields
    python3 packages/build_package_objects.py --package ears --merge packages/package_objects.json

The extractor only fills mechanical fields (digest, numinlets, numoutlets,
outlettype, attributes, messages, arguments, tags). The `use_when` field is
left empty on first extraction — a human or Claude writes it later. On --merge,
existing `use_when` values are preserved.
"""

import argparse
import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from spec2maxpat import RefpageCache  # reuse the parser
from package_schema import normalize, OPTIONAL_KEYS  # canonical record shape

DEFAULT_ROOT = Path.home() / "Documents" / "Max 9" / "Packages"


def parse_tags(xml_path):
    """Return the package's `tag` metadata values as a list of strings."""
    try:
        root = ET.parse(xml_path).getroot()
    except ET.ParseError:
        return []
    tags = []
    for md in root.findall("metadatalist/metadata"):
        if md.get("name") == "tag" and md.text:
            tags.append(md.text.strip())
    return tags


# File suffixes Max uses for the three implementation kinds. .mxo is macOS,
# .mxe / .mxe64 are Windows; we treat any of them as "external".
_EXTERNAL_SUFFIXES = {".mxo", ".mxe", ".mxe64"}


def _walk_boxes(patcher):
    """Recursively yield every box dict in a patcher, descending into subpatchers."""
    for entry in patcher.get("boxes", []):
        b = entry.get("box", {})
        yield b
        sub = b.get("patcher")
        if sub:
            yield from _walk_boxes(sub)


def _supplemental_io(package_dir, object_name):
    """
    Recover I/O when a refpage doesn't carry structured inletlist/outletlist
    tags. Tries two auxiliary sources in order:

    1. **Matching .maxhelp** — walk the helpfile for a canonical instance
       (a `newobj` whose first token equals `object_name`). Works when the
       help patcher actually instantiates the object (typical for externals
       documented prose-style, e.g. FrameLib).

    2. **Matching abstraction .maxpat** — when the package implements the
       object as an abstraction patch, the help file may not contain a
       direct instance. Open the abstraction's own .maxpat and count its
       top-level `inlet` and `outlet` objects (the abstraction's exported
       I/O). Works for abstraction-based packages like Upshot.

    Returns {numinlets, numoutlets, outlettype} or None if both probes miss.
    """
    package_dir = Path(package_dir)
    target = object_name.lower()  # canonical-instance match is case-insensitive
                                  # because some packages (MIAP) ship refpages
                                  # under one case and helpfiles under another

    # ── 1. Helpfile canonical instance ────────────────────────────────────
    # Iterate all helpfiles and case-insensitively compare basenames so we
    # find e.g. MIAP~.maxhelp when looking for miap~.
    candidate_helps = [p for p in package_dir.rglob("*.maxhelp")
                       if p.name[: -len(".maxhelp")].lower() == target]
    for help_path in candidate_helps:
        try:
            with help_path.open() as f:
                data = json.load(f)
        except (json.JSONDecodeError, OSError):
            continue
        for box in _walk_boxes(data.get("patcher", {})):
            if box.get("maxclass") != "newobj":
                continue
            text = (box.get("text") or "").strip()
            first = text.split()[0] if text.split() else ""
            if first.lower() == target:
                return {
                    "numinlets":  box.get("numinlets", 0),
                    "numoutlets": box.get("numoutlets", 0),
                    "outlettype": box.get("outlettype", []),
                }
        break  # first matching helpfile wins; no need to probe others

    # ── 2. Abstraction .maxpat I/O via inlet/outlet counts ────────────────
    candidate_abs = [p for p in package_dir.rglob("*.maxpat")
                     if p.name[: -len(".maxpat")].lower() == target]
    for abs_path in candidate_abs:
        # Skip helpfiles that happen to share the basename and live next door
        if abs_path.name.endswith(".maxhelp"):
            continue
        try:
            with abs_path.open() as f:
                data = json.load(f)
        except (json.JSONDecodeError, OSError):
            continue
        # Count only TOP-level inlet/outlet boxes — those are the abstraction's
        # exposed I/O. Recursing would catch nested subpatcher inlets too,
        # which would over-count.
        ninlets, outlets = 0, []
        for entry in data.get("patcher", {}).get("boxes", []):
            b = entry.get("box", {})
            cls = b.get("maxclass", "")
            if cls == "inlet":
                ninlets += 1
            elif cls == "outlet":
                outlets.append(b)
        # Sort outlets by their `index` attribute (1-based) so output order
        # matches what users see in the abstraction
        outlets.sort(key=lambda b: int(b.get("index", 1)))
        if ninlets > 0 or outlets:
            return {
                "numinlets":  ninlets,
                "numoutlets": len(outlets),
                # Outlet type isn't reliably recoverable from an abstraction
                # — Max infers it from connections. Default to "" per outlet.
                "outlettype": [""] * len(outlets),
            }
        break

    return None


# Keep old name as alias for backwards compatibility within this file
_canonical_help_io = _supplemental_io


def detect_kind(package_dir, object_name):
    """
    Return 'external', 'abstraction', 'javascript', or '' if no implementation
    file is found. Externals win over abstractions over JS, since a package
    sometimes ships an abstraction wrapper alongside an external for tutorial
    patchers — the external is what the patcher instantiates by name.
    """
    found = {"external": False, "abstraction": False, "javascript": False}
    for path in package_dir.rglob(object_name + ".*"):
        suffix = path.suffix.lower()
        if suffix in _EXTERNAL_SUFFIXES:
            found["external"] = True
        elif suffix == ".maxpat":
            found["abstraction"] = True
        elif suffix == ".js":
            found["javascript"] = True
    for kind in ("external", "abstraction", "javascript"):
        if found[kind]:
            return kind
    return ""


def detect_deprecated(xml_path):
    """
    Return True if the refpage's discussion/description text contains the
    word "deprecated" (case-insensitive). Curators fill in the actual
    replacement object name in `deprecated_by`.
    """
    try:
        root = ET.parse(xml_path).getroot()
    except ET.ParseError:
        return False
    for tag in ("digest", "description", "discussion"):
        for el in root.iter(tag):
            text = "".join(el.itertext()).lower()
            if "deprecated" in text:
                return True
    return False


def extract_package(package_dir):
    """Return {object_name: metadata_dict} for every *.maxref.xml found."""
    cache = RefpageCache()
    package_dir = Path(package_dir).expanduser()
    if not package_dir.is_dir():
        raise SystemExit(f"Not a directory: {package_dir}")

    objects = {}
    for xml_path in sorted(package_dir.rglob("*.maxref.xml")):
        # Object name is the filename minus '.maxref.xml'
        name = xml_path.name[: -len(".maxref.xml")]
        parsed = cache._parse(xml_path)
        if parsed is None:
            continue

        # Slim the record: attributes, messages, seealso, arguments, and
        # output-per-outlet descriptions are available from the refpage XML
        # on demand and are not needed for "should I reach for this object?"
        # decisions. Anything decision-relevant should be written into
        # use_when prose during curation.
        # Schema is unified with build_helpfile_objects.py: every record has
        # the same key set so downstream consumers don't branch on source.

        # I/O fallback: when a refpage doesn't carry structured inletlist/
        # outletlist tags, the parser falls back to numinlets=1 (default) and
        # numoutlets=0 — uninformative sentinels. In that case, try the
        # matching .maxhelp file's canonical instance for real I/O numbers.
        # This handles packages like FrameLib whose refpages document I/O
        # only in prose.
        numinlets, numoutlets, outlettype = (
            parsed["numinlets"], parsed["numoutlets"], parsed["outlettype"]
        )
        if numoutlets == 0 and not outlettype:
            help_io = _canonical_help_io(package_dir, name)
            if help_io is not None:
                numinlets  = help_io["numinlets"]  or numinlets
                numoutlets = help_io["numoutlets"]
                outlettype = help_io["outlettype"]

        record = {
            "digest":     parsed["digest"],
            "numinlets":  numinlets,
            "numoutlets": numoutlets,
            "outlettype": outlettype,
            "kind":       detect_kind(package_dir, name),
            "tags":       parse_tags(xml_path),
            "source":     "refpage",
            "use_when":   "",  # filled in by curation
        }
        if detect_deprecated(xml_path):
            record["deprecated_by"] = ""  # filled in by curation

        objects[name] = record

    return objects


def merge_into(existing, package_name, new_objects):
    """
    Merge new_objects into existing[package_name], preserving use_when.

    Every record going to disk passes through `normalize()` here — including
    untouched prior records that happen to be in the same bucket — so the
    library is guaranteed to conform to the canonical schema after any merge,
    regardless of what state it was in before.
    """
    bucket = existing.setdefault(package_name, {})
    for name, record in new_objects.items():
        prior = bucket.get(name, {})
        if prior.get("use_when"):
            record["use_when"] = prior["use_when"]
        # Preserve any optional curator-added fields from the prior record
        # (e.g. deprecated_by replacement names) that the extractor doesn't
        # know about. Optional keys live in a known set; everything else has
        # already been re-derived from the source and should be overwritten.
        for key in OPTIONAL_KEYS:
            if key in prior and key not in record:
                record[key] = prior[key]
        bucket[name] = normalize(record)
    # Defensive: normalise prior records in this bucket that weren't touched
    # by the new extraction (e.g. an object removed from the package). They
    # stay, but they conform.
    for name, rec in list(bucket.items()):
        bucket[name] = normalize(rec)
    return existing


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--package", required=True, help="Package directory name")
    p.add_argument("--root", default=str(DEFAULT_ROOT),
                   help=f"Packages parent dir (default: {DEFAULT_ROOT})")
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
        with merge_path.open("w") as f:
            json.dump(existing, f, indent=2, sort_keys=True)
            f.write("\n")
        print(f"Wrote {len(new_objects)} objects from {args.package} into {merge_path}",
              file=sys.stderr)
    else:
        print(json.dumps({args.package: new_objects}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
