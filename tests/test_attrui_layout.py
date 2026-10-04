"""tools/attrui_layout.py: cords from a column of controls into one inlet.

A column whose line is directly over the inlet runs its cords straight down,
and a row beside it joins that line with no bend at the bottom. A column off
to the side keeps the bend that brings its line across to the inlet.
(John, 2026-10-03: "omit the lower bend — just route them to join the
vertical stack of cords".)
"""
import json, subprocess, sys, tempfile
from pathlib import Path

TOOL = Path(__file__).resolve().parent.parent / "tools" / "attrui_layout.py"


def box(i, cls, x, y, w=60, h=22, text=""):
    return {"box": {"id": i, "maxclass": cls, "text": text, "numinlets": 2, "numoutlets": 1,
                    "patching_rect": [x, y, w, h]}}


def line(a, b):
    return {"patchline": {"source": [a, 0], "destination": [b, 0]}}


def run(column_x):
    """Three message boxes stacked at column_x, a fourth beside the first, all
    into one object at x 20. Returns {source id: midpoints} after the tool."""
    boxes = [box("m1", "message", column_x, 20, text="a"), box("m2", "message", column_x, 43, text="b"),
             box("m3", "message", column_x, 66, text="c"), box("r1", "message", column_x + 70, 20, text="d"),
             box("dest", "newobj", 20, 200, 200, 22, "print")]
    P = {"patcher": {"boxes": boxes, "lines": [line(s, "dest") for s in ("m1", "m2", "m3", "r1")]}}
    with tempfile.NamedTemporaryFile("w", suffix=".maxpat", delete=False) as f:
        json.dump(P, f)
    subprocess.run([sys.executable, str(TOOL), "--messages", f.name], check=True, capture_output=True)
    out = json.load(open(f.name))["patcher"]["lines"]
    return {l["patchline"]["source"][0]: l["patchline"].get("midpoints") for l in out}


def test_column_over_the_inlet_runs_straight():
    m = run(20)
    assert m["m1"] == [] and m["m2"] == [] and m["m3"] == [], m
    # the row's cord goes along the gap under it to the column's line, then
    # straight down: its last point is on the inlet's x, at the gap's height
    # (box x 20 + the 9.5 px port inset Max 9's saved cords show)
    assert len(m["r1"]) == 4 and m["r1"][2] == 29.5, m["r1"]


def test_column_beside_the_inlet_keeps_its_bend():
    m = run(320)
    assert all(len(m[k]) == 4 for k in ("m1", "m2", "m3")), m
    assert len(m["r1"]) == 8, m["r1"]


def test_a_heading_between_rows_is_set_in_clear_of_the_line():
    boxes = [box("m1", "message", 20, 20, text="a"), box("h", "comment", 20, 50, 200, 20, "heading"),
             box("m2", "message", 20, 76, text="b"), box("dest", "newobj", 20, 200, 200, 22, "print")]
    P = {"patcher": {"boxes": boxes, "lines": [line(s, "dest") for s in ("m1", "m2")]}}
    with tempfile.NamedTemporaryFile("w", suffix=".maxpat", delete=False) as f:
        json.dump(P, f)
    subprocess.run([sys.executable, str(TOOL), "--messages", f.name], check=True, capture_output=True)
    out = {b["box"]["id"]: b["box"]["patching_rect"] for b in json.load(open(f.name))["patcher"]["boxes"]}
    assert out["h"][0] >= 20 + 12, out["h"]


def test_a_label_beside_a_row_moves_with_it():
    boxes = [box("m1", "message", 20, 20, text="a"), box("m2", "message", 90, 20, text="b"),
             box("l", "comment", 160, 20, 100, 20, "label"),
             box("m3", "message", 20, 80, text="c"), box("l3", "comment", 90, 80, 100, 20, "label 3"),
             box("dest", "newobj", 20, 300, 200, 22, "print")]
    P = {"patcher": {"boxes": boxes, "lines": [line(s, "dest") for s in ("m1", "m2", "m3")]}}
    with tempfile.NamedTemporaryFile("w", suffix=".maxpat", delete=False) as f:
        json.dump(P, f)
    subprocess.run([sys.executable, str(TOOL), "--messages", f.name], check=True, capture_output=True)
    out = {b["box"]["id"]: b["box"]["patching_rect"] for b in json.load(open(f.name))["patcher"]["boxes"]}
    assert out["m3"][1] != 80, "the column was not restacked"
    assert out["l3"][1] == out["m3"][1], (out["l3"], out["m3"])
    assert out["l"][1] == out["m1"][1], (out["l"], out["m1"])
