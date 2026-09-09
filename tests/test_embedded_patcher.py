#!/usr/bin/env python3
"""A spec object's `maxpat` field embeds a raw patcher verbatim (what pasting a
clipping does). Run: python3 tests/test_embedded_patcher.py"""
import copy, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

RAW = {"fileversion": 1, "boxes": [
    {"box": {"id": "obj-1", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1, "outlettype": ["signal"], "patching_rect": [10, 10, 30, 30]}},
    {"box": {"id": "obj-2", "maxclass": "inlet", "numinlets": 0, "numoutlets": 1, "outlettype": ["signal"], "patching_rect": [60, 10, 30, 30]}},
    {"box": {"id": "obj-3", "maxclass": "live.dial", "varname": "Dry", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"], "patching_rect": [10, 60, 40, 48]}},
    {"box": {"id": "obj-4", "maxclass": "outlet", "numinlets": 1, "numoutlets": 0, "outlettype": [], "patching_rect": [10, 120, 30, 30]}},
], "lines": []}


def _spec():
    return {"objects": {"mod": {"type": "bpatcher", "pos": [50, 50], "size": [200, 100],
                                 "attrs": {"varname": "RV_MOD", "viewvisibility": 1},
                                 "maxpat": copy.deepcopy(RAW)}}, "connections": []}


def _box(m):
    return next(w["box"] for w in m["patcher"]["boxes"] if w["box"]["maxclass"] == "bpatcher")


def test_convert_embeds_verbatim_with_ports():
    b = _box(s.convert_spec(_spec()))
    assert b["embed"] == 1 and b["patcher"] == RAW
    assert b["numinlets"] == 2 and b["numoutlets"] == 1
    assert b["varname"] == "RV_MOD" and b["viewvisibility"] == 1


def test_spec_port_override_wins():
    spec = _spec(); spec["objects"]["mod"]["inlets"] = 5
    assert _box(s.convert_spec(spec))["numinlets"] == 5


def test_sync_roundtrip_and_refresh():
    m = s.convert_spec(_spec())
    spec2, _ = s.sync_spec(m)
    assert spec2["objects"]["mod"]["maxpat"] == RAW
    # the operator turned a dial inside the module: the live patcher wins
    changed = copy.deepcopy(m)
    _box(changed)["patcher"]["boxes"][2]["box"]["varname"] = "Dry2"
    spec3, _ = s.sync_spec(changed)
    assert spec3["objects"]["mod"]["maxpat"]["boxes"][2]["box"]["varname"] == "Dry2"
    # no embed at all: reverse-engineered from boxes
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"]["id"] != "obj-spec-embed"]
    mod = next(o for o in s.maxpat_to_spec(m)["objects"].values() if o["type"] == "bpatcher")
    assert mod["maxpat"] == RAW and mod["inlets"] == 2 and mod["outlets"] == 1


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
    print("All tests passed.")
