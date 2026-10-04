"""Fixes from the 2026-10-04 audit of rules and thresholds with no source.
Each case is spelled out by hand (CLAUDE.md > A Test Spells Out Its Own Examples)."""
import os
import sys
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))
sys.path.insert(0, os.path.dirname(os.path.dirname(HERE)))
from claude2max_verify import rules
import server


def test_display_only_objects_are_not_controls():
    for mc in ("meter~", "scope~", "spectroscope~", "live.meter~"):
        assert not rules.is_interactive(mc), mc
    for mc in ("toggle", "live.dial", "number", "gain~"):
        assert rules.is_interactive(mc), mc


def test_jit_expr_attributes_are_checked():
    assert "jit.expr" not in rules._CUSTOM_ATTR_OBJECTS
    for mc in ("v8", "v8ui", "mxj", "jit.gl.slab"):   # these declare their own
        assert mc in rules._CUSTOM_ATTR_OBJECTS, mc


def test_one_character_query_terms_are_kept_as_words():
    assert server._query_tokens("+ operator") == ["+", "operator"]
    assert server._token_in("t", "use t b b here")
    assert not server._token_in("t", "the cat")
    assert server._token_in("+", "a + b")


def test_content_gate_says_how_many_it_hid():
    sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(HERE)), "hooks"))
    import claude2max_maxpat_content_gate as gate
    n = gate._MAX_LINES + 3
    result = {"violations": [{"severity": "error", "rule": "object-unresolved",
                              "message": f"'obj{i}' is not a known Max object"} for i in range(n)]}
    out = gate._report(result, "x.maxpat")
    assert "and 3 more not shown" in out, out
