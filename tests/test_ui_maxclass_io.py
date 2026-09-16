#!/usr/bin/env python3
"""A UI box (spec `type` other than `newobj`) converts with the ports Max gives it.
Run: python3 tests/test_ui_maxclass_io.py

Before 2026-09-15 build_box consulted only MAXCLASS_DEFAULTS for UI classes, so
every class missing from that table got 1 inlet / 1 outlet: a `chooser` (6
outlets) wired from outlet 1 produced a cord from an outlet that did not exist.

- chooser converts with 1 inlet / 6 outlets, and a cord from outlet 1 is written
- a class the refpage under-documents takes its counts from its own help file
- a class whose help boxes disagree falls back to the refpage
- every UI class whose own help file is unanimous converts to exactly those counts
"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

HAVE_MAX = s.REFPAGE_CACHE._c74 is not None


def _box(maxclass, **extra):
    return s.build_box("x", {"type": maxclass, **extra}, 1, 0, 0)["box"]


def test_chooser_has_six_outlets():
    if not HAVE_MAX:
        print("  SKIP  (Max not installed)"); return
    spec = {"objects": {"ch": {"type": "chooser", "pos": [10, 10]},
                        "pr": {"type": "newobj", "text": "print", "pos": [10, 200]}},
            "connections": [["ch", 1, "pr", 0]]}
    m = s.convert_spec(spec)
    ch = next(w["box"] for w in m["patcher"]["boxes"] if w["box"]["maxclass"] == "chooser")
    assert ch["numinlets"] == 1
    assert ch["numoutlets"] == 6 and len(ch["outlettype"]) == 6
    line = m["patcher"]["lines"][0]["patchline"]
    assert line["source"] == [ch["id"], 1]


def test_refpage_underdocumented_class_uses_help_file():
    if not HAVE_MAX:
        return
    # live.scope~ refpage declares 1 inlet / 0 outlets; Max saves 2 / 1.
    b = _box("live.scope~")
    assert (b["numinlets"], b["numoutlets"]) == (2, 1)


def test_disagreeing_help_boxes_fall_back_to_refpage():
    if not HAVE_MAX:
        return
    # plot~.maxhelp holds plot~ boxes with 1 and 2 inlets (the plot count);
    # the refpage's 1 / 1 is the one-plot default.
    assert s.HELP_BOX_CACHE.lookup("plot~") is None
    b = _box("plot~")
    rp = s.REFPAGE_CACHE.lookup("plot~")
    assert (b["numinlets"], b["numoutlets"]) == (rp["numinlets"], rp["numoutlets"])


def test_spec_override_still_wins():
    b = _box("chooser", inlets=1, outlets=2, outlettype=["", ""])
    assert b["numoutlets"] == 2


def test_every_unanimous_help_file_class_matches():
    """Mechanical sweep: any non-newobj class not hand-listed in
    MAXCLASS_DEFAULTS converts with the counts its own help file saves."""
    if not HAVE_MAX:
        return
    wrong = []
    for name in sorted(s._c74_help_files(s.REFPAGE_CACHE._c74)):
        if name in s.MAXCLASS_DEFAULTS:
            continue
        saved = s.HELP_BOX_CACHE.lookup(name)
        if saved is None:
            continue
        b = _box(name)
        if (b["numinlets"], b["numoutlets"]) != (saved["numinlets"], saved["numoutlets"]):
            wrong.append((name, saved, b["numinlets"], b["numoutlets"]))
    assert not wrong, wrong


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
    print("All tests passed.")
