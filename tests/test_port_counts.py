#!/usr/bin/env python3
"""Fixed, flexible and not-yet-known port counts.
Run: python3 -m pytest tests/test_port_counts.py

Some Max objects always have the same inlets and outlets; others change with
their arguments, attributes or contents. The registry records which, from boxes
Max itself saved: the converter uses a fixed class's counts without looking
further, reads a flexible class's counts from context, and sync learns about
the rest (John, 2026-09-16).
"""
import json
import os
import sys
import tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

MAX9 = {"major": 9, "minor": 1}


def _box(text=None, maxclass="newobj", ni=1, no=1, types=None, patcher=None):
    b = {"maxclass": maxclass, "numinlets": ni, "numoutlets": no, "outlettype": types or [""] * no}
    if text is not None:
        b["text"] = text
    if patcher is not None:
        b["patcher"] = patcher
    return b


def _patch(*boxes, namespace="box"):
    return {"patcher": {"appversion": MAX9, "classnamespace": namespace,
                        "boxes": [{"box": b} for b in boxes]}}


def _fresh():
    return s.PortCounts({"objects": {}}, {"observations": []})


def test_saved_by_max_reads_the_indentation():
    assert s.saved_by_max(b'{\n    "patcher": {\n        "fileversion": 1')     # Max 9
    assert s.saved_by_max(b'{\n\t"patcher" : \t{\n\t\t"fileversion" : 1')     # Max 8
    assert not s.saved_by_max(b'{\n  "patcher": {\n    "fileversion": 1')    # write_patch_file


def test_only_the_installed_major_version_is_evidence():
    if s.installed_max_major() is None:
        return
    raw = b'{\n    "patcher": {\n        "fileversion": 1'
    same = {"patcher": {"appversion": {"major": s.installed_max_major()}}}
    older = {"patcher": {"appversion": {"major": s.installed_max_major() - 2}}}
    assert s.counts_as_port_evidence(same, raw)
    assert not s.counts_as_port_evidence(older, raw)


def test_classification_from_evidence():
    from collections import Counter, defaultdict
    ev = defaultdict(lambda: {"ui": False, "keys": defaultdict(Counter),
                              "texts": defaultdict(Counter), "types": Counter()})
    def add(cls, args, counts):
        e = ev[cls]; e["keys"][args][counts] += 1; e["texts"][args][counts] += 1
        e["types"][(counts, ("",) * counts[1])] += 1
    for args in ("100", "250", "500"):                  # arguments change nothing
        add("zz_fixed", args, (2, 1))
    add("zz_flex", "2", (2, 1)); add("zz_flex", "3", (3, 1))
    add("zz_once", "7", (1, 1))                         # one argument list: too little to say
    reg = s.PortCounts.from_evidence(ev)
    assert reg.kind("zz_fixed") == "fixed" and reg.fixed("zz_fixed")["numinlets"] == 2
    assert reg.kind("zz_flex") == "flexible" and reg.fixed("zz_flex") is None
    assert reg.for_text("zz_flex 3")["numinlets"] == 3     # exact text Max saved
    assert reg.for_text("zz_flex 9") is None               # unseen: falls to context rules
    assert reg.kind("zz_once") == "unmarked"
    assert reg.kind("zz_never_seen") == "unmarked"


def test_fixed_class_short_circuits_the_converter():
    reg = s.PortCounts({"objects": {"zz_fixed": {"kind": "fixed", "numinlets": 5, "numoutlets": 3,
                                                 "outlettype": ["", "", ""]}}})
    saved, s.PORT_COUNTS = s.PORT_COUNTS, reg
    try:
        assert s.guess_newobj_io("zz_fixed 1 2 3")["numinlets"] == 5
    finally:
        s.PORT_COUNTS = saved


def test_real_registry_examples():
    reg = s.PortCounts.load()
    if reg.load_error:
        return
    assert reg.kind("metro") == "fixed" and (reg.fixed("metro")["numinlets"], reg.fixed("metro")["numoutlets"]) == (2, 1)
    for flexible in ("join", "unjoin", "route", "selector~"):
        assert reg.kind(flexible) == "flexible", flexible
    assert reg.kind("p") == "flexible" and "by_text" not in reg.data["objects"]["p"]   # ports from contents


def test_route_has_an_inlet_per_argument():
    cases = {"route a b c": (4, 4), "routepass x y": (3, 3), "route": (2, 2),
             'route center edge "rim tip"': (4, 4)}
    for text, want in cases.items():
        got = s.guess_newobj_io(text)
        assert (got["numinlets"], got["numoutlets"]) == want, (text, got)


def test_learning_moves_unmarked_to_fixed_and_flags_contradictions():
    reg = _fresh()
    assert reg.observe(_box("zz_new 1", ni=2, no=1))
    assert reg.kind("zz_new") == "unmarked"
    reg.observe(_box("zz_new 2", ni=2, no=1))
    reg.observe(_box("zz_new 3", ni=2, no=1))
    assert reg.kind("zz_new") == "fixed"
    assert not reg.observe(_box("zz_new 4", ni=2, no=1))    # agreeing box: nothing re-examined
    assert reg.observe(_box("zz_new 5", ni=3, no=1))        # disagreeing box: not fixed after all
    assert reg.kind("zz_new") == "flexible"


def test_same_text_different_ports_is_not_trusted():
    reg = _fresh()
    reg.observe(_box("zz_text a", ni=1, no=1))
    assert reg.for_text("zz_text a") is not None
    reg.observe(_box("zz_text a", ni=2, no=1))
    assert reg.for_text("zz_text a") is None


def test_learn_from_patch_skips_other_languages_and_converter_output():
    if s.installed_max_major() is None:
        return
    gen = {"classnamespace": "dsp.gen", "boxes": [{"box": _box("zz_gen_op", ni=1, no=1)}]}
    rnbo_unmarked = {"boxes": [{"box": _box("zz_rnbo_op", ni=9, no=9)}]}
    patch = _patch(_box("zz_max_obj 1", ni=2, no=1),
                   _box("gen~", ni=1, no=1, patcher=gen),
                   _box("rnbo~", ni=1, no=1, patcher=rnbo_unmarked))
    patch["patcher"]["appversion"] = {"major": s.installed_max_major()}
    max_raw = b'{\n    "patcher": {'
    with tempfile.TemporaryDirectory() as d:
        reg = _fresh()
        reg.LOCAL_PATH = Path(d) / "local.json"
        assert reg.learn_from_patch(patch, b'{\n  "patcher": {') == 0      # converter's own output
        added = reg.learn_from_patch(patch, max_raw)
        names = {o["cls"] for o in reg.local["observations"]}
        assert "zz_max_obj" in names
        assert "zz_gen_op" not in names and "zz_rnbo_op" not in names
        assert added and json.loads(reg.LOCAL_PATH.read_text())["observations"]


def test_local_learned_file_is_not_the_real_one_during_tests():
    assert "c2m-ports-" in str(s.PortCounts.LOCAL_PATH) or os.environ.get("C2M_PORT_COUNTS_LOCAL") is None


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
