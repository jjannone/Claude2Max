#!/usr/bin/env python3
"""A UI maxclass with no UI_SIZES entry is sized from its own C74 help file, not
from the text-width estimate, and every caller resolves that size the same way.

Before 2026-09-15 `{"type": "chooser"}` converted to a 40 x 22 box, because the
fallback for a class missing from UI_SIZES was estimate_text_width(text) x 22 —
the rule for a box that displays its own text, which a UI object does not. 71 UI
classes that have boxes in their own help file were in that state, and the repo's
own shootout patches carry 268 attrui boxes stuck at 40 x 22 as a result.

Run: python3 tests/test_ui_default_size.py"""
import copy, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _box(m, pred):
    return next(w["box"] for w in m["patcher"]["boxes"] if pred(w["box"]))


def test_chooser_is_not_sized_by_the_text_estimate():
    """The bug this change fixes, stated as the task named it."""
    m = s.convert_spec({"objects": {"c": {"type": "chooser", "pos": [30, 30]}}, "connections": []})
    w, h = _box(m, lambda b: b.get("maxclass") == "chooser")["patching_rect"][2:4]
    assert (w, h) != (s.estimate_text_width(""), 22), "chooser still text-estimated"
    assert (w, h) == tuple(s.HELP_SIZE_CACHE.lookup("chooser")), (w, h)
    assert w > 40 and h > 22, (w, h)


def test_text_bearing_classes_keep_the_text_estimate():
    """message.maxhelp and comment.maxhelp have boxes (205x23, 129x25), so
    without the TEXT_SIZED_CLASSES guard every comment and message in every
    patch would get one fixed width whatever its text says."""
    short, long = "hi", "a considerably longer comment than that one"
    # named here, not read from s.TEXT_SIZED_CLASSES: a test that takes its
    # cases from the constant under test passes vacuously when that constant
    # is emptied, which is exactly the regression it is meant to catch.
    for maxclass in ("newobj", "message", "comment"):
        assert maxclass in s.TEXT_SIZED_CLASSES, maxclass
        ws = []
        for text in (short, long):
            spec = {"objects": {"o": {"type": maxclass, "text": text, "pos": [30, 30]}}, "connections": []}
            b = _box(s.convert_spec(spec), lambda b: b.get("maxclass") == maxclass)
            assert b["patching_rect"][2] == s.estimate_text_width(text), (maxclass, text, b["patching_rect"])
            ws.append(b["patching_rect"][2])
        assert ws[0] < ws[1], f"{maxclass} width does not follow its text"


def test_ui_sizes_still_overrides_the_help_file():
    assert s.resolve_box_size("toggle", "") == tuple(s.UI_SIZES["toggle"])
    assert s.resolve_box_size("chooser", "", [10, 11]) == (10, 11)   # spec wins over both


def test_resized_box_survives_sync_then_convert():
    """The round trip the single resolver exists to protect: sync must not drop a
    `size` that convert would then fail to reproduce."""
    spec = {"objects": {"c": {"type": "chooser", "pos": [30, 30], "size": [420, 300]}}, "connections": []}
    m = s.convert_spec(spec)
    assert _box(m, lambda b: b.get("maxclass") == "chooser")["patching_rect"][2:4] == [420.0, 300.0]
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    assert out["objects"]["c"].get("size") == [420, 300], out["objects"]["c"]
    # and it survives a second lap
    m2 = s.convert_spec(out)
    assert _box(m2, lambda b: b.get("maxclass") == "chooser")["patching_rect"][2:4] == [420.0, 300.0]


def test_sync_drops_only_a_size_convert_reproduces():
    """A box left at the resolved default carries no `size`; dropping it is safe
    precisely because _size_is_default and build_box ask the same function."""
    spec = {"objects": {"c": {"type": "chooser", "pos": [30, 30]}}, "connections": []}
    m = s.convert_spec(spec)
    out = s.reconcile_spec(copy.deepcopy(spec), m)
    assert "size" not in out["objects"]["c"], out["objects"]["c"]


def test_every_caller_agrees_with_build_box():
    """_size_is_default, build_box and presentation_layout must never
    disagree, for any class the converter can be handed."""
    classes = sorted(set(s.UI_SIZES) | set(s.MAXCLASS_DEFAULTS) | set(s.TEXT_SIZED_CLASSES)
                     | {"chooser", "attrui", "playlist~", "filtergraph~", "jit.cellblock", "v8ui"})
    for mc in classes:
        text = "some text" if mc in s.TEXT_SIZED_CLASSES else ""
        spec_obj = {"type": mc, "text": text, "pos": [0, 0], "presentation": [5, 5]}
        b = s.build_box("o", spec_obj, 1, 0, 0)["box"]
        w, h = int(b["patching_rect"][2]), int(b["patching_rect"][3])
        assert s._size_is_default(mc, text, w, h), f"{mc}: build_box wrote {(w, h)}, sync calls it non-default"
        pres = s.presentation_layout({"o": spec_obj}, {})["o"]
        assert (int(pres[2]), int(pres[3])) == (w, h), f"{mc}: presentation {pres[2:4]} != patching {(w, h)}"


if __name__ == "__main__":
    for name, fn in sorted(globals().items()):
        if name.startswith("test_"):
            fn(); print("ok", name)
    print("all passed")
