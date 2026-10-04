#!/usr/bin/env python3
"""Ports that follow a box's arguments or attributes.
Run: python3 tests/test_argument_ports.py

`groove~ LOOPBUF @loop 1` converted with 3 outlets. Max saves it with 2: one
signal channel plus the loop-sync outlet. The channel count is the first
positional argument after the buffer name (default 1), and @attributes are not
positional. NEWOBJ_IO gave groove~ three outlets whatever its argument, and the
registry had wave~ and record~ as fixed at one channel (2026-09-27).

The same holds far beyond the audio objects: `select`, `route`, `cycle`,
`jit.pack`, `pak`, `join`, `jit.scissors`, `jit.glue` and many others take
their ports from their arguments (John, 2026-10-01). The registry now fits a
formula per class from the boxes Max saved, and classes with too little saved
evidence have a rule written from the refpage.
"""
import copy
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

C74 = s.REFPAGE_CACHE._c74


def _ports(text):
    info = s.guess_newobj_io(text)
    return info["numinlets"], info["numoutlets"]


def test_groove_outlets_are_channels_plus_sync():
    cases = {
        "groove~ X": (3, 2),
        "groove~ X @loop 1": (3, 2),
        "groove~ X 2": (3, 3),
        "groove~ X 4 @loop 1": (3, 5),
        "groove~ LOOPBUF @loop 1": (3, 2),
    }
    for text, want in cases.items():
        assert _ports(text) == want, (text, _ports(text))
    assert s.guess_newobj_io("groove~ X 2")["outlettype"] == ["signal"] * 3


def test_other_channel_count_objects():
    cases = {
        "play~ X": (1, 2),
        "play~ X @loop 1": (1, 2),
        "play~ X 2": (1, 3),
        "wave~ X": (3, 1),
        "wave~ X 700 2300": (3, 1),
        "wave~ X 0 1000 2": (3, 2),
        "2d.wave~ X 0. 0. 2 4": (4, 2),
        "record~ X": (3, 1),
        "record~ X 2": (4, 1),
        "sfrecord~": (1, 1),
        "sfrecord~ 8": (8, 1),
        "sfplay~": (2, 2),
        "sfplay~ @audiofile x.aif @loop 1": (2, 2),
        "sfplay~ 2": (2, 3),
        "sfplay~ 2 60000 1": (2, 4),
        "sfplay~ LIST 2 60000 2 NAME": (2, 5),
    }
    for text, want in cases.items():
        assert _ports(text) == want, (text, _ports(text))
    assert s.guess_newobj_io("play~ X 2")["outlettype"] == ["signal", "signal", "bang"]


def test_every_named_class_is_in_the_constant():
    for name in ("groove~", "play~", "wave~", "2d.wave~", "record~", "sfrecord~", "sfplay~",
                 "jit.scissors", "jit.glue"):
        assert name in s.ARGUMENT_PORT_CLASSES, name
        assert s.PORT_COUNTS.kind(name) != "fixed", name


def test_refpage_rules_match_every_box_max_saved():
    if C74 is None:
        return
    checked = 0
    for f in sorted(C74.glob("**/*.max*")):
        if f.suffix not in (".maxpat", ".maxhelp"):
            continue
        try:
            data = json.loads(f.read_text(errors="replace"))
        except (OSError, ValueError):
            continue
        stack = [data.get("patcher", {})]
        while stack:
            p = stack.pop()
            for w in p.get("boxes", []):
                b = w.get("box", {})
                t = b.get("text") or ""
                if b.get("maxclass") == "newobj" and t.split()[:1] and t.split()[0] in s.ARGUMENT_PORT_CLASSES:
                    assert _ports(t) == (b.get("numinlets"), b.get("numoutlets")), (f.name, t)
                    checked += 1
                if isinstance(b.get("patcher"), dict) and (b.get("text") or "").split()[:1] not in (
                        ["gen~"], ["rnbo~"], ["jit.gen"], ["jit.gl.pix"]):
                    stack.append(b["patcher"])
    assert checked >= 50, checked


# ── formulas fitted from saved boxes ─────────────────────────────────────────

def test_classes_whose_ports_follow_their_arguments():
    cases = {
        "select 1 2 3 4 5 6 7": (8, 8),
        "sel 0 1": (3, 3),
        "route a b c": (4, 4),
        "cycle 3": (1, 3),
        "cycle 7": (1, 7),
        "jit.pack 3": (3, 2),
        "jit.pack": (4, 2),
        "jit.unpack 5": (1, 6),
        "pack 0 0 0": (3, 1),
        "pak 0. 0. 0.": (3, 1),
        "pak a b c d e": (5, 1),
        "join 3": (3, 1),
        "join @triggers -1": (2, 1),
        "join 5 @triggers -1": (5, 1),
        "unjoin 3": (1, 4),
        "gate 4": (2, 4),
        "switch 4": (5, 1),
        "spray 16": (1, 16),
        "combine a b c": (3, 2),
        "mc.unpack~ 4": (1, 4),
        "mc.pack~ 4": (4, 1),
        "unpack 0 0 0 0": (1, 4),
        "t b i s": (1, 3),
        "b 3": (1, 3),
        "jit.gl.multiple CTX 3 @glparams position scale": (3, 2),
        "bangbang 5": (1, 5),
        "sprintf %s-%d": (2, 1),
        "sprintf set %s %s %s": (3, 1),
        "if $i1 > $i2 then 1 else 0": (2, 1),
        "if $i1 > 5 then bang else out2 $i1": (1, 2),
        "expr $f1 * $f3": (3, 1),
        "dict.pack FOO: BAR: BAZ:": (4, 1),
        "dict.unpack FOO: BAR:": (1, 3),
        "r SOME_NAME": (0, 1),
        "receive SOME_NAME": (0, 1),
        "r": (1, 1),
        "notein": (1, 3),
        "notein 5": (1, 2),
        "pipe 250": (2, 1),
        "pipe 0 0 0 250": (4, 3),
        "pvar SOMETHING 3": (1, 3),
        "matrix~ 6 3": (6, 4),
        "mc.matrix~ 3 5": (3, 7),
        "mc.gate~ 6": (2, 6),
        "midiformat @hires 1": (7, 2),
        "timer @format bbu": (2, 2),
        "<= 3": (2, 1),
        "!-~ 1": (2, 1),
    }
    for text, want in cases.items():
        assert _ports(text) == want, (text, _ports(text))
    assert s.guess_newobj_io("sel 0 1")["outlettype"] == ["bang", "bang", ""]
    assert s.guess_newobj_io("jit.unpack 2")["outlettype"] == ["jit_matrix", "jit_matrix", ""]


def test_refpage_formulas_for_classes_with_few_saved_boxes():
    cases = {
        "funnel": (2, 1),
        "funnel 6": (6, 1),
        "router 3 4": (4, 5),
        "router 8 2": (9, 3),
        "decode": (3, 1),
        "decode 6": (3, 6),
        "mc.deinterleave~": (1, 2),
        "mc.deinterleave~ 5": (1, 5),
        "mc.interleave~ 4": (4, 1),
        "mc.transpose~": (2, 2),
        "mc.transpose~ 3 5": (3, 5),
        "mpeformat": (16, 2),
        "mpeformat 4 @masterchan 1": (5, 2),
        "array.routepass red green blue": (4, 4),
        "string.withpass red blue": (3, 3),
    }
    for text, want in cases.items():
        assert _ports(text) == want, (text, _ports(text))
    for name in ("funnel", "router", "decode", "mc.deinterleave~", "mc.interleave~",
                 "mc.transpose~", "mpeformat", "array.routepass", "string.withpass"):
        assert name in s.REFPAGE_PORT_FORMULAS and name in s.ARGUMENT_PORT_CLASSES, name


def test_jit_scissors_and_glue_multiply_rows_by_columns():
    cases = {
        "jit.scissors": (1, 2),
        "jit.scissors @rows 3": (1, 4),
        "jit.scissors @columns 3 @rows 2": (1, 7),
        "jit.scissors @rows 3 @columns 5": (1, 16),
        "jit.glue": (1, 2),
        "jit.glue @rows 3": (3, 2),
        "jit.glue @columns 2 @rows 2": (4, 2),
    }
    for text, want in cases.items():
        assert _ports(text) == want, (text, _ports(text))


def test_the_named_classes_have_a_fitted_formula():
    objs = s.PORT_COUNTS.data["objects"]
    for name in ("select", "sel", "route", "cycle", "jit.pack", "jit.unpack", "pak", "pack",
                 "join", "unjoin", "gate", "switch", "spray", "combine", "mc.unpack~", "t",
                 "trigger", "b", "bangbang", "unpack", "sprintf", "if", "expr", "dict.pack",
                 "dict.unpack", "r", "receive", "notein", "pipe", "matrix~", "mc.matrix~"):
        assert objs.get(name, {}).get("formula"), name


def _fit(pairs):
    """pairs: [(args text, count)] or [(args text, count, boxes)]."""
    rows = [(*s._box_features(p[0]), p[1], p[2] if len(p) > 2 else 1) for p in pairs]
    return s._fit_port_formula(rows)[0]


def _value(formula, args_text):
    return s._port_formula_value(formula, *s._box_features(args_text))


def test_fit_reads_an_argument_as_a_count():
    f = _fit([("2", 2), ("3", 3), ("5", 5), ("", 1), ("4 @x 1", 4)])
    assert f == [["arg", 0], 0, 1], f
    assert _value(f, "9 @y 2") == 9
    assert _value(f, "") == 1
    assert _value(f, "@y 2") == 1


def test_fit_counts_arguments_and_quoted_phrases():
    f = _fit([("a", 2), ("a b", 3), ("a b c", 4), ('"two words" b', 3)])
    assert f == [["nargs"], 1, None], f
    assert _value(f, "a b c d @attr 1 2") == 5
    assert _value(f, "") is None            # no bare box was saved, so no answer


def test_fit_skips_a_leading_name_and_multiplies_attributes():
    f = _fit([("ctx 3", 3), ("4", 4), ("other 2 @p x", 2), ("", 2)])
    assert f == [["int", 0], 0, 2], f
    g = _fit([("@rows 2 @columns 3", 7), ("@rows 3", 4), ("@columns 5 @rows 3", 16), ("@columns 2", 3)])
    assert g == [["attrprod", "columns", "rows"], 1, None], g


def test_fit_reads_the_text_itself():
    # sprintf: one inlet per % conversion, %% is not one
    f = _fit([("%s", 1), ("%s %d", 2), ("a %s b %d c %f", 3), ("%d%% of %s", 2), ("plain", 1)])
    assert f == [["percent"], 0, 1], f
    assert _value(f, "%s%s%s%s") == 4
    # if: the highest $ index; a second outlet when `out2` is written
    f = _fit([("$i1 > 0 then 1", 1), ("$i1 > $i2 then 1", 2), ("$f3 then $i1", 3), ("$i2 then 0 else 1", 2)])
    assert f == [["dollar"], 0, None], f
    g = _fit([("$i1 then 1 else out2 2", 2), ("$i2 then 1 else out2 bang", 2),
              ("$f1 then 0 else out2 $f1", 2), ("$i1 then 1", 1), ("$i1 then 1 else 0", 1), ("$i3 then bang", 1)])
    assert g == [["word", "out2"], 1, 1], g
    # dict.pack: one inlet per key, plus one
    f = _fit([("a:", 2), ("a: b:", 3), ("a: 1 b: 2 c: 3", 4), ("a : b : c : d :", 5)])
    assert f == [["colons"], 1, None], f
    # receive: no inlet once it is named
    f = _fit([("FOO", 0), ("BAR", 0), ("BAZ", 0), ("", 1), ("@x 1", 1)])
    assert f == [["hasargs"], 0, 1], f
    # pipe: one argument behaves as two
    f = _fit([("200", 2), ("0 200", 2), ("0 0 200", 3), ("0 0 0 200", 4), ("", 2)])
    assert f == [["nargs", 2], 0, 2], f
    # an attribute that adds an outlet when it is switched on
    f = _fit([("", 2, 50), ("1.", 2, 9), ("@activeout 1", 3), ("0. @activeout 1", 3), ("@activeout 0", 2)])
    assert f == [["flag", "activeout"], 2, 2], f


def test_fit_needs_enough_evidence():
    assert _fit([("2", 2), ("3", 3), ("4", 4)]) is None                 # three texts
    assert _fit([("2", 2), ("2 a", 2), ("2 b", 2), ("c", 3)]) is None   # one value of the term
    assert _fit([("2", 6), ("3", 6)]) == ["const", 6]


def test_fit_tolerates_a_few_odd_boxes_and_no_more():
    good = [(" ".join("a" * n), n + 1) for n in range(1, 31)]            # nargs + 1, thirty texts
    assert _fit(good + [("a a a", 9)]) == [["nargs"], 1, None]           # one odd box in 31
    assert _fit(good[:8] + [("a a a", 9)]) is None                       # one in 9 is too many


def test_fit_refuses_a_term_that_explains_nothing():
    # 40 boxes with one count and 4 with another, for no reason the text shows:
    # a term absent from nearly every box must not pass as the explanation.
    rows = [("name%d" % i, 1) for i in range(40)] + [("x%d @k 1" % i, 2 if i < 2 else 1) for i in range(4)]
    assert _fit(rows) is None


def test_the_count_without_the_term_needs_a_plain_box():
    f = _fit([("1 2 3", 3), ("1 2 3 4", 4), ("5 6", 2), ("@chans 4", 4), ("1 2 3 4 5", 5),
              ("1 2 3 4 5 6", 6), ("1", 1), ("2", 1), ("3", 1), ("4", 1), ("1 1", 2), ("2 2", 2),
              ("3 3", 2), ("4 4", 2), ("1 1 1", 3), ("2 2 2", 3)])
    assert f == [["nargs"], 0, None], f        # `@chans 4` alone does not say what a bare box has


def _evidence(cls, boxes):
    from collections import Counter, defaultdict
    ev = defaultdict(lambda: {"ui": False, "keys": defaultdict(Counter),
                              "texts": defaultdict(Counter), "types": Counter()})
    for args, counts, types in boxes:
        e = ev[cls]
        e["keys"][" ".join(s._positional_args(args.split()))][counts] += 1
        e["texts"][args][counts] += 1
        e["types"][(counts, tuple(types))] += 1
    return ev


def test_registry_answers_an_unseen_text_from_the_formula():
    reg = s.PortCounts.from_evidence(_evidence("zz_split", [
        ("2", (1, 3), ["signal", "signal", "bang"]),
        ("3", (1, 4), ["signal", "signal", "signal", "bang"]),
        ("5", (1, 6), ["signal"] * 5 + ["bang"]),
        ("", (1, 2), ["signal", "bang"]),
    ]))
    assert reg.kind("zz_split") == "flexible"
    assert reg.for_text("zz_split 7 @loop 1") == {
        "numinlets": 1, "numoutlets": 8, "outlettype": ["signal"] * 7 + ["bang"]}
    assert reg.for_text("zz_split @loop 1")["numoutlets"] == 2
    # A box Max saved that the formula gets wrong retires the formula.
    reg._apply({"cls": "zz_split", "args": "6", "text": "6", "counts": [1, 2], "types": [], "ui": False})
    assert "formula" not in reg.data["objects"]["zz_split"]
    assert reg.for_text("zz_split 7") is None
    assert reg.for_text("zz_split 6")["numoutlets"] == 2          # the exact text is still known


def test_aliases_are_fitted_together():
    """`b` and `bangbang` are one object; two boxes of one and three of the
    other are five boxes of evidence. A family alias (`mc.gate~` -> `mc.*~`)
    is not that."""
    short = s._short_name_aliases()
    for alias, full in (("b", "bangbang"), ("t", "trigger"), ("sel", "select"), ("r", "receive")):
        assert short.get(alias) == full, alias
    assert "mc.gate~" not in short and "zl.rev" not in short
    ev = _evidence("bangbang", [("3", (1, 3), ["bang"] * 3), ("", (1, 2), ["bang"] * 2)])
    ev.update(_evidence("b", [("4", (1, 4), ["bang"] * 4), ("5", (1, 5), ["bang"] * 5),
                              ("1", (1, 1), ["bang"])]))
    reg = s.PortCounts.from_evidence(ev)
    assert reg.for_text("bangbang 7")["numoutlets"] == 7
    assert reg.for_text("b 9")["numoutlets"] == 9


def test_a_new_attribute_keeps_the_saved_ports():
    reg = s.PortCounts.from_evidence(_evidence("zz_fmt", [("", (7, 2), ["", ""]), ("", (7, 2), ["", ""])]))
    assert reg.kind("zz_fmt") == "unmarked"
    assert reg.for_text("zz_fmt @hires 1")["numinlets"] == 7
    assert reg.for_text("zz_fmt 3") is None                      # other arguments: not known
    # When an attribute is seen to change the ports, that argument list is no longer trusted.
    reg2 = s.PortCounts.from_evidence(_evidence("zz_ln", [("", (2, 2), ["", ""]), ("@activeout 1", (2, 3), ["", "", ""])]))
    assert reg2.for_text("zz_ln @other 1") is None


def test_a_class_that_varies_without_its_text_gets_no_formula():
    reg = s.PortCounts.from_evidence(_evidence("zz_holder", [
        ("a", (1, 1), [""]), ("b", (1, 1), [""]), ("c", (1, 1), [""]), ("d", (1, 1), [""]),
        ("e", (1, 1), [""]), ("e", (3, 2), ["", ""]),        # same text, two port counts
    ]))
    assert reg.kind("zz_holder") == "flexible"
    assert "formula" not in reg.data["objects"]["zz_holder"]


def test_formulas_match_every_box_max_saved():
    """The formula alone, with the exact-text memory taken away, against the
    boxes of Max's own help files for the classes named here."""
    if C74 is None or s.installed_max_major() is None:
        return
    named = ("select", "sel", "route", "cycle", "jit.pack", "jit.unpack", "pak", "join",
             "unjoin", "gate", "switch", "spray", "combine", "mc.unpack~", "t", "trigger",
             "sprintf", "if", "expr", "dict.pack", "dict.unpack", "r", "receive", "notein",
             "pipe", "matrix~", "b", "unpack", "funnel", "router", "mc.interleave~")
    bare = s.PortCounts(copy.deepcopy(s.PORT_COUNTS.data))
    for e in bare.data["objects"].values():
        e.pop("by_text", None)
    real, s.PORT_COUNTS = s.PORT_COUNTS, bare
    try:
        checked = _check_saved_boxes(named)
    finally:
        s.PORT_COUNTS = real
    assert checked >= 1500, checked


def _check_saved_boxes(named):
    checked = 0
    for f in sorted((C74 / "help").glob("**/*.maxhelp")):
        try:
            raw = f.read_bytes()
            data = json.loads(raw.decode("utf-8", "replace"))
        except (OSError, ValueError):
            continue
        if not s.counts_as_port_evidence(data, raw):
            continue
        for b in s.iter_boxes(data.get("patcher") or {}, max_only=True):
            t = b.get("text") or ""
            if b.get("maxclass") == "newobj" and t.split()[:1] and t.split()[0] in named:
                assert _ports(t) == (b["numinlets"], b["numoutlets"]), (f.name, t)
                checked += 1
    return checked


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
