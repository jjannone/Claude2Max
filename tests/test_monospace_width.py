#!/usr/bin/env python3
"""Text boxes are planned for a monospace font: 10 px per character + 10 px.
The converter writes that width, the verifier models the same width, and a
spec whose boxes were written at the old 7 px/char estimate is reported stale
until sync records their real size, so a sync -> convert round trip keeps them.
Rule: MAX_PATCHING.md > Plan every width for a monospace font (John, 2026-09-27).
Run: python3 tests/test_monospace_width.py"""
import copy
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "mcp_server"))
import spec2maxpat as s
from claude2max_verify import verify_spec
from claude2max_verify.rules import SpecContext, _text_width

# (text, width) written out by hand: 10 px per character + 10, never under 40.
EXPECTED = [
    ("", 40),
    ("x", 40),
    ("abc", 40),
    ("abcd", 50),
    ("loop start ms", 140),
    ("loadmess 0.5 0.5 1.", 200),
]


def _box(m, pred):
    return next(w["box"] for w in m["patcher"]["boxes"] if pred(w["box"]))


def _rules(spec, rule):
    return [v for v in verify_spec(spec)["violations"] if v["rule"] == rule]


def test_converter_estimate():
    for text, w in EXPECTED:
        assert s.estimate_text_width(text) == w, (text, s.estimate_text_width(text), w)


def test_verifier_models_the_same_width():
    for text, w in EXPECTED:
        assert _text_width(text) == w, (text, _text_width(text), w)
        r = SpecContext.box_rect({"type": "comment", "text": text, "pos": [0, 0]})
        assert r == [0.0, 0.0, float(w), 22.0], (text, r)


def test_convert_writes_the_width():
    spec = {"objects": {"c": {"type": "comment", "text": "loop start ms", "pos": [30, 30]}},
            "connections": []}
    r = _box(s.convert_spec(spec), lambda b: b.get("maxclass") == "comment")["patching_rect"]
    assert r[2:] == [140, 22], r


def test_overlap_caught_where_the_old_estimate_missed_it():
    # the groove~ snippet: a comment placed at the old 7 px/char width (153 px)
    # of `loadmess 0.5 0.5 1.`, which now ends at 30 + 200 = 230
    def spec(cx):
        return {"objects": {"lm": {"type": "newobj", "text": "loadmess 0.5 0.5 1.", "pos": [30, 30]},
                            "lab": {"type": "comment", "text": "speed", "pos": [cx, 30]}},
                "connections": []}
    assert _rules(spec(190), "patching-overlap")
    assert not _rules(spec(245), "patching-overlap")      # 15 px clear of the box


def test_old_width_is_stale_until_synced_then_round_trips():
    spec = {"objects": {"lm": {"type": "newobj", "text": "loadmess 0.5 0.5 1.", "pos": [30, 30]}},
            "connections": []}
    m = s.convert_spec(spec)
    box = _box(m, lambda b: b.get("text") == "loadmess 0.5 0.5 1.")
    assert box["patching_rect"][2] == 200
    assert s.spec_matches_patch(m, spec=spec)["matches"] is True
    box["patching_rect"][2] = 153                          # written by the old estimate
    rep = s.spec_matches_patch(m, spec=spec)
    assert rep["matches"] is False
    assert rep["size_drift"] == [{"spec": None, "patch": [153, 22], "key": "newobj loadmess 0.5 0.5 1."}], rep["size_drift"]
    synced = s.reconcile_spec(copy.deepcopy(spec), m)
    assert synced["objects"]["lm"]["size"] == [153, 22], synced["objects"]["lm"]
    assert s.spec_matches_patch(m, spec=synced)["matches"] is True
    again = _box(s.convert_spec(synced), lambda b: b.get("text") == "loadmess 0.5 0.5 1.")
    assert again["patching_rect"][2] == 153, again["patching_rect"]


def test_spec_size_unlike_the_box_is_stale():
    spec = {"objects": {"n": {"type": "flonum", "pos": [30, 30], "size": [70, 22]}}, "connections": []}
    m = s.convert_spec(spec)
    _box(m, lambda b: b.get("maxclass") == "flonum")["patching_rect"][2] = 90
    assert s.spec_matches_patch(m, spec=spec)["size_drift"] == [{"spec": [70, 22], "patch": [90, 22], "key": "flonum"}]


def test_label_above_its_box_in_the_cord_path():
    # loadmess -> flonum, with the flonum's label in the gap between them
    def spec(lab_pos):
        return {"objects": {"lm": {"type": "newobj", "text": "loadmess 1.", "pos": [30, 30]},
                            "f": {"type": "flonum", "pos": [30, 100], "size": [70, 22]},
                            "lab": {"type": "comment", "text": "speed", "pos": lab_pos}},
                "connections": [["lm", 0, "f", 0]]}
    hits = _rules(spec([30, 75]), "label-in-cord-path")
    assert len(hits) == 1 and "directly above 'f'" in hits[0]["message"], hits
    assert not _rules(spec([115, 100]), "label-in-cord-path")   # to the right, same row
    # above the flonum but clear of the cord, which enters at x = 30 + 19 = 49
    assert not _rules(spec([60, 75]), "label-in-cord-path")


def test_number_box_left_at_default_width():
    def spec(obj):
        return {"objects": {"n": dict(obj, pos=[30, 30])}, "connections": []}
    assert _rules(spec({"type": "flonum"}), "number-box-default-width")
    assert _rules(spec({"type": "number", "size": [50, 22]}), "number-box-default-width")
    assert _rules(spec({"type": "live.numbox"}), "number-box-default-width")
    assert not _rules(spec({"type": "flonum", "size": [70, 22]}), "number-box-default-width")
    assert not _rules(spec({"type": "toggle"}), "number-box-default-width")


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("ok", name)


def test_wrapping_uses_the_same_width_per_character():
    """A box exactly as wide as its text at 10 px/char holds it on one line;
    one character narrower wraps. Wrapping once assumed 7 px/char."""
    text = "x" * 30
    w = 30 * s.TEXT_PX_PER_CHAR + s._BOX_TEXT_PAD
    assert s.wrapped_lines(text, w) == 1
    assert s.wrapped_lines(text, w - s.TEXT_PX_PER_CHAR) == 2
