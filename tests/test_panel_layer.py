#!/usr/bin/env python3
"""Presentation panels live in the background layer — converter half of the rule
(MAX_PATCHING.md). Run: python3 tests/test_panel_layer.py

- convert emits every `panel` box after every non-panel box, whatever the spec order
- a root `bglocked: 1` reaches the patcher; without it the key is not written
- sync (maxpat_to_spec and reconcile_spec) carries the patcher's bglocked back
- `tab` / `live.tab` convert with three outlets (were falling to the 1-outlet default)
- a live.tab's saved_attribute_attributes block survives convert → sync → convert
"""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _spec(bglocked=None):
    spec = {"width": 400, "height": 300, "objects": {
        "pan_a": {"type": "panel", "pos": [10, 10], "presentation": [0, 0, 200, 100],
                  "attrs": {"background": 1}},
        "n": {"type": "number", "pos": [30, 30], "presentation": [10, 10, 50, 22]},
        "lbl": {"type": "comment", "text": "n", "pos": [90, 30], "presentation": [70, 10, 50, 18]},
        "pan_b": {"type": "panel", "pos": [10, 150], "presentation": [0, 110, 200, 100],
                  "attrs": {"background": 1}},
        "t": {"type": "toggle", "pos": [30, 170], "presentation": [10, 120, 24, 24]},
    }, "connections": []}
    if bglocked is not None:
        spec["bglocked"] = bglocked
    return spec


def _classes(m):
    return [w["box"]["maxclass"] for w in m["patcher"]["boxes"]]


def test_panels_emitted_last():
    m = s.convert_spec(_spec(1))
    classes = _classes(m)
    last_non_panel = max(i for i, c in enumerate(classes) if c not in ("panel", "text.codebox"))
    first_panel = min(i for i, c in enumerate(classes) if c == "panel")
    assert first_panel > last_non_panel, classes
    # the spec embed still sits after the panels (it is not part of the graph)
    assert classes[-1] == "text.codebox"


def test_reorder_keeps_wiring():
    spec = _spec(1)
    spec["objects"]["b"] = {"type": "button", "pos": [30, 60], "presentation": [10, 40, 24, 24]}
    spec["connections"] = [["b", 0, "n", 0]]
    m = s.convert_spec(spec)
    by_id = {w["box"]["id"]: w["box"]["maxclass"] for w in m["patcher"]["boxes"]}
    line = m["patcher"]["lines"][0]["patchline"]
    assert by_id[line["source"][0]] == "button" and by_id[line["destination"][0]] == "number"


def test_bglocked_written_only_when_asked():
    assert s.convert_spec(_spec(1))["patcher"].get("bglocked") == 1
    assert "bglocked" not in s.convert_spec(_spec())["patcher"]
    assert "bglocked" not in s.convert_spec(_spec(0))["patcher"]


def test_sync_captures_bglocked_both_ways():
    m = s.convert_spec(_spec(1))
    spec_back, _ = s.sync_spec(m)          # reconcile path (embed present)
    assert spec_back.get("bglocked") == 1
    m["patcher"]["bglocked"] = 0           # operator unlocked it in Max
    spec_back, _ = s.sync_spec(m)
    assert "bglocked" not in spec_back
    # reverse-engineer path (no embed)
    m = s.convert_spec(_spec(1))
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"]["id"] != "obj-spec-embed"]
    assert s.maxpat_to_spec(m).get("bglocked") == 1


def test_tab_outlets():
    spec = {"objects": {"t": {"type": "tab", "pos": [10, 10]},
                        "lt": {"type": "live.tab", "pos": [10, 60]}}, "connections": []}
    boxes = {w["box"]["maxclass"]: w["box"] for w in s.convert_spec(spec)["patcher"]["boxes"]}
    assert boxes["tab"]["numoutlets"] == 3 and boxes["tab"]["outlettype"] == ["int", "", ""]
    assert boxes["live.tab"]["numoutlets"] == 3 and boxes["live.tab"]["outlettype"] == ["", "", "float"]


def test_saved_attribute_attributes_roundtrip():
    block = {"valueof": {"parameter_longname": "live.tab", "parameter_shortname": "live.tab",
                         "parameter_type": 2, "parameter_enum": ["a", "b"]}}
    spec = {"objects": {"lt": {"type": "live.tab", "pos": [10, 10],
                               "attrs": {"saved_attribute_attributes": block}}}, "connections": []}
    m = s.convert_spec(spec)
    box = next(w["box"] for w in m["patcher"]["boxes"] if w["box"]["maxclass"] == "live.tab")
    assert box["saved_attribute_attributes"] == block
    spec2, _ = s.sync_spec(m)
    assert spec2["objects"]["lt"]["attrs"]["saved_attribute_attributes"] == block
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"]["id"] != "obj-spec-embed"]
    lt = next(o for o in s.maxpat_to_spec(m)["objects"].values() if o["type"] == "live.tab")
    assert lt["attrs"]["saved_attribute_attributes"] == block


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
    print("All tests passed.")
