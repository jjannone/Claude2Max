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
                               "attrs": {"filename": "zslider.js", "offset": 36, "range": 61}}},
            "connections": []}
    m = s.convert_spec(spec)
    box = _box(m, lambda b: b.get("maxclass") == "v8ui")
    assert box["range"] == 61
    box["offset"], box["range"] = 0, 128          # edited in Max
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    a = out["objects"]["kb"]["attrs"]
    assert a["offset"] == 0 and a["range"] == 128, a
    assert a["filename"] == "zslider.js"


def test_new_attrui_keeps_its_attr():
    """An attrui added in Max (no spec entry yet) must reach the spec bound to
    its attribute; before 2026-09-14 `_box_to_spec_obj` dropped `attr` and the
    next convert wrote an attrui bound to nothing."""
    spec = {"objects": {"kb": {"type": "v8ui", "pos": [30, 200], "size": [600, 100], "inlets": 2, "outlets": 3,
                               "attrs": {"filename": "zslider.js"}}},
            "connections": []}
    m = s.convert_spec(spec)
    kb = _box(m, lambda b: b.get("maxclass") == "v8ui")
    m["patcher"]["boxes"].append({"box": {"id": "obj-77", "maxclass": "attrui", "numinlets": 1, "numoutlets": 1,
                                          "outlettype": [""], "patching_rect": [30.0, 30.0, 250.0, 22.0],
                                          "attr": "z_displaymode", "text_width": 120.0}})
    m["patcher"].setdefault("lines", []).append({"patchline": {"source": ["obj-77", 0], "destination": [kb["id"], 0]}})
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    new = [o for o in out["objects"].values() if o["type"] == "attrui"]
    assert len(new) == 1 and new[0]["attrs"]["attr"] == "z_displaymode", new
    assert new[0]["attrs"]["text_width"] == 120.0, new
    # and the same box, reverse-engineered with no spec at all
    fresh = s.maxpat_to_spec(m)
    assert [o["attrs"]["attr"] for o in fresh["objects"].values() if o["type"] == "attrui"] == ["z_displaymode"]


if __name__ == "__main__":
    test_widened_newobj_keeps_its_size(); test_attr_named_in_spec_follows_box(); test_new_attrui_keeps_its_attr(); print("All tests passed.")
