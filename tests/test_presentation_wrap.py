#!/usr/bin/env python3
"""A presented text box narrower than its text wraps: the converter records the
line count and budgets the height Max will draw. Run: python3 tests/test_presentation_wrap.py"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _box(spec, cls):
    return next(w["box"] for w in s.convert_spec(spec)["patcher"]["boxes"] if w["box"]["maxclass"] == cls)


def test_lines_and_heights_match_corpus():
    assert s.wrapped_lines("abl.dsp.darkhall~ @mix 1. @size 0.5", 160) == 2
    assert s.wrapped_lines("vst~", 160) == 1
    assert [s.wrapped_height(n) for n in (1, 2, 3, 4, 5, 6)] == [22.0, 37.0, 52.0, 66.0, 81.0, 95.0]
    assert [s.wrapped_height(n, "newobj") for n in (2, 3)] == [35.0, 50.0]
    assert s.comment_min_height(11.0) == 20.0 and s.comment_min_height(13.0) == 21.0


def test_wrapped_newobj_gets_linecount_and_height():
    b = _box({"objects": {"o": {"type": "newobj", "text": "abl.dsp.darkhall~ @mix 1. @size 0.5",
                                "pos": [10, 10], "presentation": [10, 10, 160, 22]}}, "connections": []}, "newobj")
    assert b["presentation_linecount"] == 2 and b["presentation_rect"][3] == 35.0


def test_one_line_comment_gets_max_minimum_height():
    b = _box({"objects": {"c": {"type": "comment", "text": "master", "pos": [10, 10],
                                "presentation": [10, 10, 80, 18], "attrs": {"fontsize": 11.0}}},
              "connections": []}, "comment")
    assert "presentation_linecount" not in b and b["presentation_rect"][3] == 20.0


def test_one_line_message_keeps_authored_height():
    b = _box({"objects": {"m": {"type": "message", "text": "wet-only", "pos": [10, 10],
                                "presentation": [10, 10, 90, 24]}}, "connections": []}, "message")
    assert "presentation_linecount" not in b and b["presentation_rect"][3] == 24.0


def test_generous_height_is_not_shrunk():
    b = _box({"objects": {"o": {"type": "message", "text": "x" * 60, "pos": [10, 10],
                                "presentation": [10, 10, 100, 120]}}, "connections": []}, "message")
    assert b["presentation_linecount"] == 5 and b["presentation_rect"][3] == 120.0


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
    print("All tests passed.")
