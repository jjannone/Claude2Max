#!/usr/bin/env python3
"""
Golden tests for claude2max_verify.

Each test constructs a spec with a known violation (or a clean spec) and asserts
verify_spec() reports exactly the expected rule ids. Run:

    python3 mcp_server/tests/test_verify.py        # plain (no pytest needed)
    pytest mcp_server/tests/test_verify.py          # also works under pytest
"""

import sys
from pathlib import Path

# import the package whether run from repo root or from mcp_server/
_MCP = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_MCP))

from claude2max_verify import format_report, verify_spec, verify_spec_json  # noqa: E402


def _rules(result):
    return {v["rule"] for v in result["violations"]}


# jbox base attrs every box inherits (subset, enough for tests) — mirrors what
# the real resolver unions in from jbox.maxref.xml.
FAKE_JBOX = {"textcolor", "background", "hidden", "varname", "presentation",
             "fontsize", "color", "annotation"}


class FakeResolver:
    """Deterministic stand-in for build_resolver() so the anti-guessing rules can
    be tested without Max installed. Mirrors the duck type the real resolver
    implements (see spec2maxpat._GateResolver), including the jbox base union."""

    def __init__(self, objects, attrs=None, abstractions=None, base=FAKE_JBOX):
        self._objs = set(objects)                 # resolvable object names
        self._attrs = attrs or {}                 # class -> set(own valid attrs) or None
        self._abs = set(abstractions or [])       # abstractions on disk
        self._base = set(base)                    # jbox base attrs

    def resolve_object(self, name):
        return {"source": "fake"} if name in self._objs else None

    def attrs_for(self, name):
        if name in self._attrs:
            return self._attrs[name] | self._base, "fake"  # own UNION jbox base
        return None, "no-refpage"

    def abstraction_exists(self, name):
        return name in self._abs


# ── ERROR rules ───────────────────────────────────────────────────────────────

def test_connection_missing_object():
    spec = {
        "objects": {"a": {"type": "newobj", "text": "metro 500"}},
        "connections": [["a", 0, "ghost", 0]],
    }
    r = verify_spec(spec)
    assert "connection-missing-object" in _rules(r)
    assert r["counts"]["error"] >= 1
    assert not r["ok"]


def test_connection_shape():
    spec = {
        "objects": {"a": {"type": "toggle"}, "b": {"type": "newobj", "text": "metro 500"}},
        "connections": [["a", 0, "b"]],  # 3 elements — malformed
    }
    assert "connection-shape" in _rules(verify_spec(spec))


def test_connection_attrs_not_dict():
    spec = {
        "objects": {"a": {"type": "toggle"}, "b": {"type": "newobj", "text": "metro 500"}},
        "connections": [["a", 0, "b", 0, "hidden"]],  # 5th not a dict
    }
    assert "connection-shape" in _rules(verify_spec(spec))


def test_io_index_range():
    spec = {
        "objects": {
            "a": {"type": "newobj", "text": "unpack 0 0", "outlets": 2},
            "b": {"type": "newobj", "text": "print"},
        },
        "connections": [["a", 5, "b", 0]],  # outlet 5 > declared 2
    }
    assert "io-index-range" in _rules(verify_spec(spec))


def test_io_index_range_silent_when_undeclared():
    # No declared outlets -> we must NOT guess / flag.
    spec = {
        "objects": {
            "a": {"type": "newobj", "text": "unpack 0 0"},
            "b": {"type": "newobj", "text": "print"},
        },
        "connections": [["a", 5, "b", 0]],
    }
    assert "io-index-range" not in _rules(verify_spec(spec))


def test_empty_newobj():
    spec = {"objects": {"a": {"type": "newobj", "text": "  "}}, "connections": []}
    assert "empty-newobj" in _rules(verify_spec(spec))


# ── WARNING rules ─────────────────────────────────────────────────────────────

def test_presentation_required():
    spec = {
        "objects": {
            "t": {"type": "toggle"},
            "m": {"type": "newobj", "text": "metro 500"},
        },
        "connections": [["t", 0, "m", 0]],
    }
    assert "presentation-required" in _rules(verify_spec(spec))


def test_presentation_satisfied():
    spec = {
        "objects": {
            "t": {"type": "toggle", "presentation": [10, 10, 20, 20]},
            "lbl": {"type": "comment", "text": "On/Off", "presentation": [40, 10, 60, 20]},
            "m": {"type": "newobj", "text": "metro 500"},
        },
        "connections": [["t", 0, "m", 0]],
    }
    assert "presentation-required" not in _rules(verify_spec(spec))


def test_presented_controls_need_labels():
    spec = {
        "objects": {
            "t": {"type": "toggle", "presentation": [10, 10, 20, 20]},
            "m": {"type": "newobj", "text": "metro 500"},
        },
        "connections": [["t", 0, "m", 0]],
    }
    rules = _rules(verify_spec(spec))
    assert "presented-controls-need-labels" in rules


def test_hidden_box_cord_must_be_hidden():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1", "attrs": {"hidden": 1}},
        },
        "connections": [["n", 0, "msg", 0]],  # visible cord into hidden box
    }
    assert "hidden-box-cord-visible" in _rules(verify_spec(spec))


def test_hidden_box_cord_ok_when_hidden():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1", "attrs": {"hidden": 1}},
        },
        "connections": [["n", 0, "msg", 0, {"hidden": 1}]],
    }
    assert "hidden-box-cord-visible" not in _rules(verify_spec(spec))


def test_redundant_message_box():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1"},
            "node": {"type": "newobj", "text": "node.script server.js"},
        },
        "connections": [["n", 0, "msg", 0], ["msg", 0, "node", 0]],
    }
    assert "redundant-message-box" in _rules(verify_spec(spec))


def test_preset_message_not_flagged_redundant():
    # Operator-clickable preset (no UI control upstream) — must NOT flag.
    spec = {
        "objects": {
            "preset": {"type": "message", "text": "setduration 30"},
            "node": {"type": "newobj", "text": "node.script server.js"},
        },
        "connections": [["preset", 0, "node", 0]],
    }
    assert "redundant-message-box" not in _rules(verify_spec(spec))


def test_subpatcher_label_missing():
    spec = {
        "objects": {
            "sub": {
                "type": "newobj", "text": "p VOICE",
                "patcher": {
                    "objects": {
                        "in0": {"type": "inlet"},  # no comment attr
                        "out0": {"type": "outlet", "attrs": {"comment": "out 0: signal"}},
                    },
                    "connections": [],
                },
            },
        },
        "connections": [],
    }
    rules = _rules(verify_spec(spec))
    assert "subpatcher-label-missing" in rules   # outside comment missing
    assert "io-label-missing" in rules           # inlet has no comment


def test_subpatcher_labels_ok():
    spec = {
        "objects": {
            "sub": {
                "type": "newobj", "text": "p VOICE",
                "attrs": {"comment": "in 0: bang | out 0: signal"},
                "patcher": {
                    "objects": {
                        "in0": {"type": "inlet", "attrs": {"comment": "in 0: bang"}},
                        "out0": {"type": "outlet", "attrs": {"comment": "out 0: signal"}},
                    },
                    "connections": [],
                },
            },
        },
        "connections": [],
    }
    rules = _rules(verify_spec(spec))
    assert "subpatcher-label-missing" not in rules
    assert "io-label-missing" not in rules


def test_debug_untracked():
    spec = {
        "objects": {
            "dbg": {"type": "newobj", "text": "print DBG",
                    "attrs": {"bgcolor": [1.0, 0.3, 0.8, 1.0]}},
        },
        "connections": [],
        # no debug_additions
    }
    assert "debug-untracked" in _rules(verify_spec(spec))


def test_debug_tracked_ok():
    spec = {
        "objects": {
            "dbg": {"type": "newobj", "text": "print DBG",
                    "attrs": {"bgcolor": [1.0, 0.3, 0.8, 1.0]}},
        },
        "connections": [],
        "debug_additions": ["dbg"],
    }
    assert "debug-untracked" not in _rules(verify_spec(spec))


def test_debug_in_presentation():
    spec = {
        "objects": {
            "dbg": {"type": "newobj", "text": "print DBG",
                    "attrs": {"bgcolor": [1.0, 0.3, 0.8, 1.0]},
                    "presentation": [10, 10, 40, 20]},
        },
        "connections": [],
        "debug_additions": ["dbg"],
    }
    assert "debug-in-presentation" in _rules(verify_spec(spec))


# ── STYLE rules ───────────────────────────────────────────────────────────────

def test_allcaps_name():
    spec = {
        "objects": {"s": {"type": "newobj", "text": "send tempo"}},
        "connections": [],
    }
    assert "allcaps-name" in _rules(verify_spec(spec))


def test_allcaps_name_ok():
    spec = {
        "objects": {"s": {"type": "newobj", "text": "send TEMPO"}},
        "connections": [],
    }
    assert "allcaps-name" not in _rules(verify_spec(spec))


def test_allcaps_name_skips_arg_substitution():
    spec = {
        "objects": {"s": {"type": "newobj", "text": "send #1"}},
        "connections": [],
    }
    assert "allcaps-name" not in _rules(verify_spec(spec))


def test_prefer_v8():
    spec = {
        "objects": {"j": {"type": "newobj", "text": "js logic.js"}},
        "connections": [],
    }
    assert "prefer-v8" in _rules(verify_spec(spec))


# ── clean spec / robustness ──────────────────────────────────────────────────

def test_clean_dsp_patch_has_no_warnings():
    # Pure DSP, no operator UI -> no presentation warning.
    spec = {
        "objects": {
            "osc": {"type": "newobj", "text": "saw~ 220"},
            "out": {"type": "newobj", "text": "dac~"},
        },
        "connections": [["osc", 0, "out", 0], ["osc", 0, "out", 1]],
    }
    r = verify_spec(spec)
    assert r["counts"]["error"] == 0
    assert r["counts"]["warning"] == 0


def test_invalid_json():
    r = verify_spec_json("{not valid")
    assert "invalid-json" in _rules(r)
    assert not r["ok"]


def test_non_dict_spec():
    r = verify_spec_json("[1, 2, 3]")
    assert "invalid-spec" in _rules(r)


def test_empty_spec_is_clean():
    r = verify_spec({"objects": {}, "connections": []})
    assert r["ok"]


def test_format_report_runs():
    spec = {"objects": {"a": {"type": "newobj", "text": "  "}}, "connections": []}
    txt = format_report(verify_spec(spec))
    assert "empty-newobj" in txt


# ── resolver-gated anti-guessing rules (deterministic FakeResolver) ───────────

def test_object_unresolved_blocks():
    spec = {"objects": {"o": {"type": "newobj", "text": "oscparse"}}, "connections": []}
    res = FakeResolver(objects={"metro", "udpreceive"})
    r = verify_spec(spec, resolver=res)
    assert "object-unresolved" in _rules(r)
    assert r["counts"]["error"] >= 1


def test_object_resolves_ok():
    spec = {"objects": {"o": {"type": "newobj", "text": "metro 500"}}, "connections": []}
    res = FakeResolver(objects={"metro"})
    assert "object-unresolved" not in _rules(verify_spec(spec, resolver=res))


def test_object_resolved_via_abstraction():
    spec = {"objects": {"o": {"type": "newobj", "text": "mySynth foo"}}, "connections": []}
    res = FakeResolver(objects=set(), abstractions={"mySynth"})
    assert "object-unresolved" not in _rules(verify_spec(spec, resolver=res))


def test_object_unverified_downgrades():
    spec = {"objects": {"o": {"type": "newobj", "text": "weird", "unverified": True}},
            "connections": []}
    res = FakeResolver(objects=set())
    r = verify_spec(spec, resolver=res)
    assert "object-unresolved" not in _rules(r)
    assert "object-unverified" in _rules(r)
    assert r["counts"]["error"] == 0  # style only, does not block


def test_subpatcher_p_not_flagged():
    spec = {"objects": {"sub": {"type": "newobj", "text": "p VOICE",
                               "attrs": {"comment": "in 0: x | out 0: y"},
                               "patcher": {"objects": {}, "connections": []}}},
            "connections": []}
    res = FakeResolver(objects=set())
    assert "object-unresolved" not in _rules(verify_spec(spec, resolver=res))


def test_live_attribute_invalid_blocks():
    spec = {"objects": {"g": {"type": "live.gain~", "attrs": {"bgcolor": [0, 0, 0, 1]}}},
            "connections": []}
    res = FakeResolver(objects={"live.gain~"},
                       attrs={"live.gain~": {"coldcolor", "warmcolor", "textcolor"}})
    r = verify_spec(spec, resolver=res)
    assert "attribute-invalid" in _rules(r)
    assert r["counts"]["error"] >= 1


def test_live_attribute_valid_ok():
    spec = {"objects": {"g": {"type": "live.gain~", "attrs": {"coldcolor": [0, 0, 0, 1]}}},
            "connections": []}
    res = FakeResolver(objects={"live.gain~"},
                       attrs={"live.gain~": {"coldcolor", "warmcolor"}})
    assert "attribute-invalid" not in _rules(verify_spec(spec, resolver=res))


def test_universal_attr_never_flagged():
    # hidden / varname are box-universal — must never be flagged on any object
    spec = {"objects": {"g": {"type": "live.gain~",
                              "attrs": {"hidden": 1, "varname": "G"}}},
            "connections": []}
    res = FakeResolver(objects={"live.gain~"}, attrs={"live.gain~": {"coldcolor"}})
    assert "attribute-invalid" not in _rules(verify_spec(spec, resolver=res))


def test_inherited_jbox_attr_not_blocked():
    # textcolor lives on the jbox base, not comment's own refpage — must be valid
    # via the own-UNION-jbox set, on a non-live object.
    spec = {"objects": {"c": {"type": "comment", "text": "hi",
                              "attrs": {"textcolor": [1, 1, 1, 1]}}},
            "connections": []}
    res = FakeResolver(objects={"comment"}, attrs={"comment": set()})  # jbox base has textcolor
    assert "attribute-invalid" not in _rules(verify_spec(spec, resolver=res))


def test_nonlive_bogus_attr_blocked():
    # An attr in neither the object's own refpage NOR jbox base IS blocked,
    # for non-live objects too (general, not live.*-scoped).
    spec = {"objects": {"n": {"type": "number",
                              "attrs": {"tribordercolor": [0, 0, 0, 1]}}},
            "connections": []}
    res = FakeResolver(objects={"number"}, attrs={"number": {"mindigits"}})
    r = verify_spec(spec, resolver=res)
    assert "attribute-invalid" in _rules(r)
    assert r["counts"]["error"] >= 1


def test_no_resolver_skips_anti_guessing():
    # Without a resolver, anti-guessing rules don't run (graceful degradation).
    spec = {"objects": {"o": {"type": "newobj", "text": "totallyfake"}}, "connections": []}
    assert "object-unresolved" not in _rules(verify_spec(spec))


# ── runner ────────────────────────────────────────────────────────────────────

def _run():
    fns = [v for k, v in sorted(globals().items()) if k.startswith("test_") and callable(v)]
    passed = failed = 0
    for fn in fns:
        try:
            fn()
            passed += 1
            print(f"  PASS  {fn.__name__}")
        except AssertionError as e:
            failed += 1
            print(f"  FAIL  {fn.__name__}: {e}")
        except Exception as e:  # noqa: BLE001
            failed += 1
            print(f"  ERROR {fn.__name__}: {e!r}")
    print(f"\n{passed} passed, {failed} failed of {len(fns)}")
    return failed == 0


if __name__ == "__main__":
    sys.exit(0 if _run() else 1)
