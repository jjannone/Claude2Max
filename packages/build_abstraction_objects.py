#!/usr/bin/env python3
"""
build_abstraction_objects.py — Extract metadata for packages that ship
abstractions with neither refpages nor help files (AudioMix, ABL Effect
Modules, Gen CV Tools, MC Movement Studies, ...).

An abstraction is a .maxpat under the package's `patchers/` or `externals/`
folder; Max finds it by file name, so the object name is the file stem.
Overview and launch patchers are skipped, and so is any patcher with no
top-level inlet or outlet: nothing can be wired to it, so it is a demo patch
opened on its own, not an object. The exception is a patcher with a `js` or
`v8` box at its top level, which may build its ports by script when it loads
(abclib's wrappers are one such box); it is kept, with 0 / 0 meaning unknown.
Records carry:

  - numinlets / numoutlets: the top-level `inlet` / `outlet` boxes
  - digest:  the patcher's own `description`, else its longest short comment
  - _paths:  every file with that name (two files sharing a name is a clash:
             Max loads whichever it finds first)
  - _inner:  the object classes used inside, for judging what it wraps

Usage:
    python3 packages/build_abstraction_objects.py --package AudioMix
    python3 packages/build_abstraction_objects.py --package AudioMix --merge packages/package_objects.json

A name already in the library from a refpage or help file keeps that record:
those sources say more than an abstraction's box counts.
"""

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from package_schema import normalize, OPTIONAL_KEYS, removed_names

DEFAULT_ROOT = Path.home() / "Documents" / "Max 9" / "Packages"
SEARCH_DIRS = ("patchers", "externals")
SKIP_NAME = re.compile(r"overview|launch", re.IGNORECASE)
PLUMBING = {
    "inlet", "outlet", "comment", "message", "panel", "button", "toggle",
    "number", "flonum", "t", "trigger", "s", "send", "r", "receive", "p",
    "patcher", "loadbang", "loadmess", "route", "prepend", "sel", "select",
    "gate", "pack", "pak", "unpack", "join", "unjoin", "b", "bangbang",
    "thispatcher", "patcherargs", "pattr", "autopattr", "pattrstorage",
    "pvar", "pattrforward", "print", "i", "f", "int", "float", "v", "value",
    "pv", "deferlow", "defer", "zl", "routepass", "sprintf", "substitute",
    "change", "speedlim", "qlim", "line", "fpic", "bpatcher", "live.comment",
}


def load_patch(path):
    try:
        return json.loads(path.read_text(errors="replace"), strict=False)
    except (json.JSONDecodeError, OSError):
        return None


def _walk_boxes(patcher):
    for entry in patcher.get("boxes", []):
        box = entry.get("box", {})
        yield box
        if "patcher" in box:
            yield from _walk_boxes(box["patcher"])


def box_class(box):
    if box.get("maxclass") == "newobj":
        text = (box.get("text") or "").split()
        return text[0] if text else ""
    return box.get("maxclass", "")


def describe(patcher, name):
    desc = (patcher.get("description") or "").strip()
    if desc:
        return desc
    comments = [
        (b.get("text") or "").strip()
        for e in patcher.get("boxes", [])
        for b in [e.get("box", {})]
        if b.get("maxclass") == "comment"
    ]
    comments = [c for c in comments if 12 <= len(c) <= 240 and c != name]
    return max(comments, key=len) if comments else ""


def extract_package(package_dir):
    package_dir = Path(package_dir).expanduser()
    if not package_dir.is_dir():
        raise SystemExit(f"Not a directory: {package_dir}")

    objects = {}
    for sub in SEARCH_DIRS:
        for path in sorted((package_dir / sub).rglob("*.maxpat")):
            name = path.stem
            if name.startswith("_") or SKIP_NAME.search(name):
                continue
            data = load_patch(path)
            if data is None or "patcher" not in data:
                continue
            patcher = data["patcher"]
            rel = str(path.relative_to(package_dir))
            if name in objects:
                objects[name]["_paths"].append(rel)
                continue
            top = [e.get("box", {}) for e in patcher.get("boxes", [])]
            numinlets = sum(1 for b in top if b.get("maxclass") == "inlet")
            numoutlets = sum(1 for b in top if b.get("maxclass") == "outlet")
            scripted = any(box_class(b) in ("js", "v8") for b in top)
            if not numinlets and not numoutlets and not scripted:
                continue
            inner = sorted({box_class(b) for b in _walk_boxes(patcher)} - PLUMBING - {""})
            objects[name] = {
                "digest":     describe(patcher, name),
                "numinlets":  numinlets,
                "numoutlets": numoutlets,
                "outlettype": [],
                "kind":       "abstraction",
                "tags":       [],
                "source":     "abstraction",
                "use_when":   "",
                "_paths":     [rel],
                "_inner":     inner,
            }
    return objects


def merge_into(existing, package_name, new_objects):
    bucket = existing.setdefault(package_name, {})
    skip = removed_names(package_name)
    for name, record in new_objects.items():
        if name in skip:
            continue
        prior = bucket.get(name, {})
        if prior.get("source") in ("refpage", "helpfile"):
            continue
        if prior.get("use_when"):
            record["use_when"] = prior["use_when"]
        for key in OPTIONAL_KEYS:
            if key in prior and key not in record:
                record[key] = prior[key]
        bucket[name] = normalize(record)
    for name, rec in list(bucket.items()):
        bucket[name] = normalize(rec)
    return existing


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--package", required=True, help="Package directory name")
    p.add_argument("--root", default=str(DEFAULT_ROOT))
    p.add_argument("--merge", help="Path to package_objects.json to merge into")
    args = p.parse_args()

    new_objects = extract_package(Path(args.root).expanduser() / args.package)

    if args.merge:
        merge_path = Path(args.merge)
        existing = json.loads(merge_path.read_text()) if merge_path.exists() else {}
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
