#!/usr/bin/env python3
"""sync must carry a jsui/v8ui box's `filename` and `jsarguments` into the spec,
so a following convert re-emits a linked object. Run: python3 tests/test_sync_preserves_script_attrs.py"""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

def test_roundtrip():
    spec = {"objects": {"ui": {"type": "jsui", "pos": [50, 50], "size": [200, 100],
                               "attrs": {"filename": "helpdetails.js", "jsarguments": ["buddy"]}}},
            "connections": []}
    m = s.convert_spec(spec)
    box = next(w["box"] for w in m["patcher"]["boxes"] if w["box"].get("maxclass") == "jsui")
    assert box.get("filename") == "helpdetails.js" and box.get("jsarguments") == ["buddy"], box
    # forget the spec, reverse-engineer it from the boxes (what sync does for a native patch)
    for w in m["patcher"]["boxes"]:
        w["box"].pop("code", None)
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"].get("id") != "obj-spec-embed"]
    spec2 = s.maxpat_to_spec(m)
    ui = next(o for o in spec2["objects"].values() if o["type"] == "jsui")
    assert ui["attrs"].get("filename") == "helpdetails.js", ui
    assert ui["attrs"].get("jsarguments") == ["buddy"], ui
    m2 = s.convert_spec(spec2)
    box2 = next(w["box"] for w in m2["patcher"]["boxes"] if w["box"].get("maxclass") == "jsui")
    assert box2.get("filename") == "helpdetails.js"

if __name__ == "__main__":
    test_roundtrip(); print("All tests passed.")
