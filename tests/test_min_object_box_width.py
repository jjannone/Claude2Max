#!/usr/bin/env python3
"""An object box is at least 24 + 15 px per port on its busier side.
Rule: MAX_PATCHING.md > Give every port room (John, 2026-09-16).
Run: python3 tests/test_min_object_box_width.py"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "mcp_server"))
import spec2maxpat as s
from claude2max_verify import verify_spec


def _rect(spec, pred):
    for w in s.convert_spec(spec)["patcher"]["boxes"]:
        if pred(w["box"]):
            return w["box"]["patching_rect"]
    raise AssertionError("box not found")


def _one(obj):
    return {"objects": {"o": dict(obj, pos=[30, 30])}, "connections": []}


def test_object_box_widened_to_its_ports():
    # unjoin 3 has 4 outlets: 24 + 15 * 4 = 84 px, above its 76 px text estimate
    r = _rect(_one({"type": "newobj", "text": "unjoin 3"}), lambda b: b.get("text") == "unjoin 3")
    assert r[2] == 84, r


def test_spec_size_below_minimum_is_widened():
    r = _rect(_one({"type": "newobj", "text": "unjoin 3", "size": [30, 22]}),
              lambda b: b.get("text") == "unjoin 3")
    assert r[2:] == [84, 22], r


def test_wide_enough_box_is_unchanged():
    r = _rect(_one({"type": "newobj", "text": "unjoin 3", "size": [200, 22]}),
              lambda b: b.get("text") == "unjoin 3")
    assert r[2] == 200, r


def test_message_and_ui_boxes_are_not_covered():
    r = _rect(_one({"type": "message", "text": "x"}), lambda b: b.get("maxclass") == "message")
    assert r[2] == 40, r
    r = _rect(_one({"type": "toggle"}), lambda b: b.get("maxclass") == "toggle")
    assert r[2] == 24, r


def test_sync_records_a_narrow_saved_box():
    box = {"maxclass": "newobj", "text": "unjoin 3", "numinlets": 1, "numoutlets": 4,
           "patching_rect": [30, 30, 76, 22]}
    assert s._box_to_spec_obj(box).get("size") == [76, 22]
    box["patching_rect"] = [30, 30, 84, 22]
    assert "size" not in s._box_to_spec_obj(box)


def test_verifier_reports_a_narrow_size():
    def hits(obj):
        return [v for v in verify_spec(_one(obj))["violations"] if v["rule"] == "box-too-narrow"]
    assert hits({"type": "newobj", "text": "unjoin 3", "outlets": 4, "size": [76, 22]})
    assert not hits({"type": "newobj", "text": "unjoin 3", "outlets": 4, "size": [84, 22]})
    assert not hits({"type": "newobj", "text": "unjoin 3", "size": [76, 22]})   # ports unknown
    assert not hits({"type": "message", "text": "x", "outlets": 4, "size": [30, 22]})


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("ok", name)
