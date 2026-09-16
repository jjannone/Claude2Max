#!/usr/bin/env python3
"""`expr` / `vexpr` convert with one inlet per `$` argument.
Run: python3 tests/test_expr_inlets.py

The guesser gave every `expr` / `vexpr` one inlet (their refpages say one), so
`patches/jit-grab-scale.maxpat` carried `vexpr $f1 / $f2 @scalarmode 1` with
numinlets 1 and a cord into inlet 1 that the verifier reported out of range.
Max saves the highest `$` index as the inlet count (2026-09-16).
"""
import json
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

C74 = s.REFPAGE_CACHE._c74


def test_dollar_arguments_set_the_inlet_count():
    cases = {
        "vexpr $f1 / $f2 @scalarmode 1": 2,
        "expr $i1 + $i2 + $i3": 3,
        "expr $f2 * 2": 2,
        "expr $i1": 1,
    }
    for text, want in cases.items():
        assert s.guess_newobj_io(text)["numinlets"] == want, text


def test_gen_style_expr_is_left_alone():
    assert s.guess_newobj_io("expr 2*(in1-in2)")["numinlets"] == s._guess_newobj_io_base("expr 2*(in1-in2)")["numinlets"]


def test_matches_every_expr_box_max_saved():
    if C74 is None:
        return
    checked = 0
    for f in sorted((C74 / "help").glob("**/*.maxhelp")):
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
                if re.match(r"^v?expr\b", t) and re.search(r"\$[ifs]\d", t):
                    assert s.guess_newobj_io(t)["numinlets"] == b.get("numinlets"), (f.name, t)
                    checked += 1
                if isinstance(b.get("patcher"), dict):
                    stack.append(b["patcher"])
    assert checked >= 50, checked


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
