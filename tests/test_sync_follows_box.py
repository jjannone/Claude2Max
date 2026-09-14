#!/usr/bin/env python3
"""sync follows the box, not the spec, for (1) a box width that convert would not
reproduce and (2) an attr the spec already names whose value changed in Max.
Both were dropped on 2026-09-12: a 560 px `v8` box lost its size, and a v8ui's
`range` stayed at the spec's old value after the box said 128.
Run: python3 tests/test_sync_follows_box.py"""
import copy, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _box(m, pred):
    return next(w["box"] for w in m["patcher"]["boxes"] if pred(w["box"]))


def test_widened_newobj_keeps_its_size():
    spec = {"objects": {"logic": {"type": "newobj", "text": "counter 0 7", "pos": [30, 30], "size": [560, 22]},
                        "num": {"type": "number", "pos": [30, 100]}},
            "connections": [["logic", 0, "num", 0]]}
    m = s.convert_spec(spec)
    box = _box(m, lambda b: b.get("text") == "counter 0 7")
    assert box["patching_rect"][2] == 560, box["patching_rect"]
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    assert out["objects"]["logic"].get("size") == [560, 22], out["objects"]["logic"]
    # a box left at the converter's own width carries no size field
    box["patching_rect"][2] = s.estimate_text_width("counter 0 7")
    out2 = s.reconcile_spec(copy.deepcopy(spec), m)
    assert "size" not in out2["objects"]["logic"], out2["objects"]["logic"]


def test_attr_named_in_spec_follows_box():
    spec = {"objects": {"kb": {"type": "v8ui", "pos": [30, 30], "size": [600, 100], "inlets": 2, "outlets": 3,
                               "attrs": {"filename": "zkeyboard.js", "offset": 36, "range": 61}}},
            "connections": []}
    m = s.convert_spec(spec)
    box = _box(m, lambda b: b.get("maxclass") == "v8ui")
    assert box["range"] == 61
    box["offset"], box["range"] = 0, 128          # edited in Max
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    a = out["objects"]["kb"]["attrs"]
    assert a["offset"] == 0 and a["range"] == 128, a
    assert a["filename"] == "zkeyboard.js"


if __name__ == "__main__":
    test_widened_newobj_keeps_its_size(); test_attr_named_in_spec_follows_box(); print("All tests passed.")
