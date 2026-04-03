#!/usr/bin/env python3
"""
build_objects_db.py — Build max_objects.json from taylorbrook/MAX-MSP_CC_Framework data.

Fetches the upstream object database, converts to Claude2Max NEWOBJ_IO format,
applies expert overrides, and writes max_objects.json alongside this script.

Usage:
    python3 build_objects_db.py

Output:
    max_objects.json  — dict of { "obj-name": { numinlets, numoutlets, outlettype } }

The generated file is loaded by spec2maxpat.py at startup to supplement its
built-in NEWOBJ_IO table (built-in entries take precedence).

Source: https://github.com/taylorbrook/MAX-MSP_CC_Framework
"""

import json
import sys
import urllib.request
from pathlib import Path

BASE_URL = "https://raw.githubusercontent.com/taylorbrook/MAX-MSP_CC_Framework/main/.claude/max-objects"

DOMAIN_FILES = [
    "max/objects.json",
    "msp/objects.json",
    "jitter/objects.json",
    "mc/objects.json",
    "gen/objects.json",
    "m4l/objects.json",
    "rnbo/objects.json",
    "packages/objects.json",
]

OVERRIDES_FILE = "overrides.json"


def fetch(url):
    print(f"  Fetching {url} ...", end=" ", flush=True)
    try:
        with urllib.request.urlopen(url, timeout=30) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        print("OK")
        return data
    except Exception as e:
        print(f"FAILED ({e})")
        return None


def outlet_type_str(outlet):
    """Convert a taylorbrook outlet dict to a Claude2Max outlettype string."""
    if outlet.get("signal"):
        return "signal"
    t = outlet.get("type", "")
    # Normalize control/anything/empty to ""
    if t in ("", "control", "anything"):
        return ""
    # Pass through typed outlets as-is
    return t


def convert_object(obj_data):
    """Convert a taylorbrook object entry to Claude2Max NEWOBJ_IO format."""
    inlets = obj_data.get("inlets") or []
    outlets = obj_data.get("outlets") or []
    return {
        "numinlets": len(inlets),
        "numoutlets": len(outlets),
        "outlettype": [outlet_type_str(o) for o in outlets],
    }


def apply_override(base, override_data):
    """Apply an overrides.json entry (same inlets/outlets structure) to a base entry."""
    inlets = override_data.get("inlets")
    outlets = override_data.get("outlets")
    if inlets is not None:
        base["numinlets"] = len(inlets)
    if outlets is not None:
        base["numoutlets"] = len(outlets)
        base["outlettype"] = [outlet_type_str(o) for o in outlets]
    return base


def build():
    output_path = Path(__file__).parent / "max_objects.json"

    print("Building max_objects.json from taylorbrook/MAX-MSP_CC_Framework\n")

    # Collect all objects from domain files
    db = {}
    for domain_file in DOMAIN_FILES:
        url = f"{BASE_URL}/{domain_file}"
        data = fetch(url)
        if not data:
            continue
        count = 0
        for name, obj_data in data.items():
            if name.startswith("_"):  # skip sentinel keys
                continue
            if not isinstance(obj_data, dict):
                continue
            db[name] = convert_object(obj_data)
            count += 1
        domain = domain_file.split("/")[0]
        print(f"    → {count} objects from {domain}")

    print(f"\n  Total before overrides: {len(db)} objects")

    # Apply overrides
    overrides_url = f"{BASE_URL}/{OVERRIDES_FILE}"
    overrides_data = fetch(overrides_url)
    if overrides_data:
        objects_overrides = overrides_data.get("objects", {})
        applied = 0
        for name, override in objects_overrides.items():
            if name.startswith("_"):
                continue
            if not isinstance(override, dict):
                continue
            if name in db:
                db[name] = apply_override(db[name], override)
            else:
                # Override for an object not in the base data — add it
                converted = convert_object(override)
                if converted["numinlets"] > 0 or converted["numoutlets"] > 0:
                    db[name] = converted
                    applied += 1
                    continue
            applied += 1
        print(f"    → {applied} overrides applied")

    print(f"\n  Total objects: {len(db)}")

    # Write output
    with open(output_path, "w") as f:
        json.dump(db, f, indent=2, sort_keys=True)

    print(f"\n  Written to {output_path}")
    print("Done.")


if __name__ == "__main__":
    build()
