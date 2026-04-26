#!/usr/bin/env python3
"""
build_objects_db.py — Build max_objects.json from Cycling '74 maxref.xml files.

Parses the official Max reference XML files bundled with Max.app. No internet
connection required. Output always matches the installed version of Max.

Usage:
    python3 build_objects_db.py [--max-path /path/to/Max.app]

Output:
    max_objects.json  — dict of { "obj-name": { numinlets, numoutlets, outlettype } }

Source: /Applications/Max.app/Contents/Resources/C74/docs/refpages/
        /Applications/Max.app/Contents/Resources/C74/packages/*/docs/
"""

import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

DEFAULT_MAX_PATH = "/Applications/Max.app"
C74_ROOT        = "Contents/Resources/C74"

# Standard refpage domains (within docs/refpages/)
STD_DOMAINS = ["max-ref", "msp-ref", "jit-ref", "m4l-ref"]

# Package names whose refpages are included (all official C74 packages)
PACKAGE_NAMES = ["Gen", "RNBO", "Jitter Tools", "Jitter Geometry",
                 "jit.mo", "ableton-dsp", "maxforlive-elements", "mira",
                 "Node for Max", "VIDDLL"]


def outlet_type_str(type_attr):
    """Map a maxref.xml outlet type string to Claude2Max outlettype format."""
    t = (type_attr or "").strip()
    tl = t.lower()
    if tl == "signal":
        return "signal"
    if tl in ("multi-channel signal", "multichannelsignal"):
        return "multichannelsignal"
    # All control-rate types (OUTLET_TYPE, matrix, float, int, bang, list,
    # anything, disabled, inactive, dict, symbol, message, etc.) → ""
    return ""


def parse_refpage(xml_path):
    """
    Parse one maxref.xml file.
    Returns (object_name, {numinlets, numoutlets, outlettype}) or None on failure.
    """
    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
    except ET.ParseError:
        return None

    name = root.get("name")
    if not name:
        return None

    # Inlets
    inletlist = root.find("inletlist")
    if inletlist is not None:
        numinlets = len(inletlist.findall("inlet"))
    else:
        numinlets = 1  # Max default when undocumented

    # Outlets — sort by id to guarantee correct order
    outletlist = root.find("outletlist")
    if outletlist is not None:
        outlets = sorted(outletlist.findall("outlet"),
                         key=lambda o: int(o.get("id", 0)))
        numoutlets = len(outlets)
        outlettype = [outlet_type_str(o.get("type", "")) for o in outlets]
    else:
        numoutlets = 0
        outlettype = []

    return name, {
        "numinlets":  numinlets,
        "numoutlets": numoutlets,
        "outlettype": outlettype,
    }


def collect_xml_files(max_path):
    """
    Yield all maxref.xml paths from the standard refpages and C74 packages.
    Returns list of (domain_label, Path) tuples.
    """
    c74 = Path(max_path) / C74_ROOT
    sources = []

    # Standard domains
    refpages = c74 / "docs" / "refpages"
    for domain in STD_DOMAINS:
        d = refpages / domain
        if d.exists():
            for f in sorted(d.glob("*.maxref.xml")):
                sources.append((domain, f))

    # Package docs
    packages = c74 / "packages"
    if packages.exists():
        for pkg in sorted(packages.iterdir()):
            if not pkg.is_dir():
                continue
            for docs_dir in [pkg / "docs" / "refpages",
                             pkg / "docs" / "refpages1",
                             pkg / "docs"]:
                if docs_dir.exists():
                    for f in sorted(docs_dir.rglob("*.maxref.xml")):
                        sources.append((f"packages/{pkg.name}", f))
                    break  # only use first matching docs dir per package

    return sources


def build(max_path=DEFAULT_MAX_PATH):
    c74 = Path(max_path) / C74_ROOT
    if not c74.exists():
        print(f"Error: Max not found at {max_path}")
        print("Use --max-path /path/to/Max.app to specify the location.")
        sys.exit(1)

    output_path = Path(__file__).parent / "max_objects.json"

    print(f"Building max_objects.json from {max_path}\n")

    db = {}
    counts = {}

    for label, xml_path in collect_xml_files(max_path):
        result = parse_refpage(xml_path)
        if result is None:
            continue
        name, data = result
        if name not in db:               # first occurrence wins (std domains first)
            db[name] = data
            counts[label] = counts.get(label, 0) + 1

    # Print per-domain summary
    for label in (STD_DOMAINS + [f"packages/{p}" for p in PACKAGE_NAMES]):
        n = counts.get(label, 0)
        if n:
            print(f"  {label}: {n}")
    other = {k: v for k, v in counts.items()
             if k not in STD_DOMAINS and k not in [f"packages/{p}" for p in PACKAGE_NAMES]}
    for label, n in sorted(other.items()):
        if n:
            print(f"  {label}: {n}")

    print(f"\n  Total: {len(db)} objects")

    with open(output_path, "w") as f:
        json.dump(db, f, indent=2, sort_keys=True)

    print(f"  Written to {output_path}")
    print("Done.")


if __name__ == "__main__":
    max_path = DEFAULT_MAX_PATH
    if "--max-path" in sys.argv:
        idx = sys.argv.index("--max-path")
        if idx + 1 < len(sys.argv):
            max_path = sys.argv[idx + 1]
    build(max_path)
