#!/usr/bin/env python3
"""`sync --check` reports an attribute whose value the spec and the boxes
disagree about.

Before 2026-09-21 spec_matches_patch compared object content, connections and
presentation rects only. So a device whose two `v8ui` boxes had just been given
an embedded script — a 39k `textfile.text` that the spec still said was
`embed: 0` with no text — reported "spec matches boxes", and the next convert
would have thrown the embed away.

Two boundaries the check holds to, both load-bearing:

  * one side only is not drift, in either direction. Max writes defaults on
    save and sync mirrors only _PRESERVE_ATTRS, so a spec-only attribute is the
    author's request and a box-only one is the spec being quiet. Reporting
    either makes files stale that `sync` cannot un-stale.
  * boxes that share a content key — every `panel` and every `v8ui` keys the
    same, having no text — are paired by position, and only when both sides
    agree about the whole set of positions. Guessing does not under-report, it
    mis-attributes: one recoloured panel reads as every panel's colour rotated
    by one.

Run: python3 tests/test_spec_attribute_drift.py"""
import copy, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _patch(spec):
    """A .maxpat built from `spec`, carrying `spec` as its embedded spec."""
    return s.convert_spec(copy.deepcopy(spec))


def _check(spec, edit_boxes=None):
    """Report for a patch built from `spec` whose boxes are then edited in place
    — which is what a user editing the patch in Max amounts to."""
    m = _patch(spec)
    if edit_boxes:
        edit_boxes(m)
    return s.spec_matches_patch(m)


TWO_COMMENTS = {
    "objects": {
        "a": {"type": "comment", "text": "first", "pos": [30, 30],
              "attrs": {"bgcolor": [1.0, 0.0, 0.0, 1.0]}},
        "b": {"type": "comment", "text": "second", "pos": [30, 60],
              "attrs": {"fontsize": 10.0}},
    },
    "connections": [],
}


def _box(m, pred):
    return next(w["box"] for w in m["patcher"]["boxes"] if pred(w["box"]))


def test_an_unedited_patch_matches():
    rep = _check(TWO_COMMENTS)
    assert rep["matches"], rep["summary"]
    assert rep["attribute_drift"] == [], rep["attribute_drift"]


def test_a_changed_value_is_drift():
    def repaint(m):
        _box(m, lambda b: b.get("text") == "first")["bgcolor"] = [0.0, 0.0, 1.0, 1.0]
    rep = _check(TWO_COMMENTS, repaint)
    assert not rep["matches"], rep["summary"]
    assert [d["attr"] for d in rep["attribute_drift"]] == ["bgcolor"], rep["attribute_drift"]
    assert "attribute(s) drifted" in rep["summary"], rep["summary"]


def test_int_and_float_are_the_same_value():
    """Max writes 10 and 10.0 for the same attribute; that is not an edit."""
    def retype(m):
        _box(m, lambda b: b.get("text") == "second")["fontsize"] = 10
    assert _check(TWO_COMMENTS, retype)["matches"]


def test_float_noise_below_six_places_is_not_an_edit():
    """A round trip through JSON and Max's own printing moves the last bits of
    a float. 10.0 vs 10.0000000001 is the same font size, and a check that
    calls it drift reports every patch stale forever."""
    def jitter(m):
        _box(m, lambda b: b.get("text") == "second")["fontsize"] = 10.0000000001
    assert _check(TWO_COMMENTS, jitter)["matches"]


def test_a_real_difference_in_the_sixth_place_is_still_seen():
    """The tolerance must not swallow the colour values Max actually writes:
    0.039216 and 0.039217 are different numbers, not noise."""
    spec = {"objects": {"c": {"type": "comment", "text": "x", "pos": [30, 30],
                              "attrs": {"bgcolor": [0.039216, 0.0, 0.0, 1.0]}}},
            "connections": []}
    def nudge(m):
        _box(m, lambda b: b.get("maxclass") == "comment")["bgcolor"] = [0.039217, 0.0, 0.0, 1.0]
    assert not _check(spec, nudge)["matches"]


def test_an_attribute_only_the_box_has_is_not_drift():
    def add(m):
        _box(m, lambda b: b.get("text") == "second")["textcolor"] = [1.0, 1.0, 1.0, 1.0]
    assert _check(TWO_COMMENTS, add)["matches"]


def test_an_attribute_only_the_spec_has_is_not_drift():
    """Max drops an attribute equal to the style default. The spec keeps asking
    for it and the next convert re-asserts it — that is the design, and `sync`
    (box → spec only) could never clear the finding if it were reported."""
    def drop(m):
        del _box(m, lambda b: b.get("text") == "first")["bgcolor"]
    assert _check(TWO_COMMENTS, drop)["matches"]


def test_a_long_value_is_reported_as_length_and_hash():
    """An embedded script must not be printed into the report, on either side."""
    spec = {"objects": {"j": {"type": "newobj", "text": "v8 x.js", "pos": [30, 30],
                              "attrs": {"textfile": {"embed": 1, "text": "A" * 5000}}}},
            "connections": []}
    def swap(m):
        _box(m, lambda b: b.get("maxclass") == "newobj")["textfile"] = {"embed": 1, "text": "B" * 5000}
    rep = _check(spec, swap)
    assert not rep["matches"], rep["summary"]
    shown = str(rep["attribute_drift"])
    assert "AAAA" not in shown and "BBBB" not in shown, shown[:200]
    assert "5000 chars" in shown, shown[:200]


# --- twins: same content key, told apart by position -------------------------

TWO_PANELS = {
    "objects": {
        "p1": {"type": "panel", "pos": [30, 30], "size": [100, 50],
               "attrs": {"bgcolor": [1.0, 0.0, 0.0, 1.0]}},
        "p2": {"type": "panel", "pos": [30, 200], "size": [100, 50],
               "attrs": {"bgcolor": [0.0, 1.0, 0.0, 1.0]}},
    },
    "connections": [],
}


def _panels(m):
    return [w["box"] for w in m["patcher"]["boxes"] if w["box"].get("maxclass") == "panel"]


def test_twins_at_known_positions_are_compared():
    """Two panels have the same content key — `panel` with no text. Without the
    position pairing neither would ever be compared, which is how the v8ui
    embed slipped through."""
    def repaint(m):
        top = min(_panels(m), key=lambda b: b["patching_rect"][1])
        top["bgcolor"] = [0.0, 0.0, 1.0, 1.0]
    rep = _check(TWO_PANELS, repaint)
    assert not rep["matches"], rep["summary"]
    assert len(rep["attribute_drift"]) == 1, rep["attribute_drift"]


def test_unedited_twins_match():
    assert _check(TWO_PANELS)["matches"]


def test_a_moved_twin_stops_the_comparison_rather_than_guessing():
    """Move one panel and the two sides no longer agree about the set of
    positions. Reporting drift then would name the wrong panel, so the group is
    left alone — the behaviour every twin group had before."""
    def move_and_repaint(m):
        ps = sorted(_panels(m), key=lambda b: b["patching_rect"][1])
        ps[0]["patching_rect"][1] = 999.0
        ps[0]["bgcolor"] = [0.0, 0.0, 1.0, 1.0]
    rep = _check(TWO_PANELS, move_and_repaint)
    assert rep["attribute_drift"] == [], rep["attribute_drift"]


def test_twins_stacked_at_one_spot_are_not_guessed_at():
    spec = copy.deepcopy(TWO_PANELS)
    spec["objects"]["p2"]["pos"] = [30, 30]
    def repaint(m):
        _panels(m)[0]["bgcolor"] = [0.0, 0.0, 1.0, 1.0]
    assert _check(spec, repaint)["attribute_drift"] == []


def test_the_report_renders_the_drift():
    def repaint(m):
        _box(m, lambda b: b.get("text") == "first")["bgcolor"] = [0.0, 0.0, 1.0, 1.0]
    text = s.format_spec_match_report(_check(TWO_COMMENTS, repaint))
    assert "attribute drift" in text and "bgcolor" in text, text


if __name__ == "__main__":
    fails = 0
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            try:
                fn(); print(f"  ok   {name}")
            except Exception as e:
                fails += 1; print(f"  FAIL {name}: {type(e).__name__}: {e}")
    print("all passed" if not fails else f"{fails} failed")
    sys.exit(1 if fails else 0)
