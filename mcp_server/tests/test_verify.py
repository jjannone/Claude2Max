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

# spec2maxpat lives at the repo root; the spec-vs-boxes tests need it.
_REPO = _MCP.parent
sys.path.insert(0, str(_REPO))
import spec2maxpat  # noqa: E402

_FIXTURES = Path(__file__).resolve().parent / "fixtures"


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


def test_hidden_cord_flagged():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1"},
        },
        "connections": [["n", 0, "msg", 0, {"hidden": 1}]],
    }
    assert "hidden-cord" in _rules(verify_spec(spec))


def test_hidden_box_flagged():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1", "attrs": {"hidden": 1}},
        },
        "connections": [["n", 0, "msg", 0]],
    }
    assert "hidden-box" in _rules(verify_spec(spec))


def test_visible_cords_and_boxes_ok():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "msg": {"type": "message", "text": "setport $1"},
        },
        "connections": [["n", 0, "msg", 0]],
    }
    rules = _rules(verify_spec(spec))
    assert "hidden-cord" not in rules and "hidden-box" not in rules


def test_spec_embed_box_exempt_from_hidden_rule():
    spec = {
        "objects": {
            "n": {"type": "number"},
            "obj-spec-embed": {"type": "text.codebox", "attrs": {"hidden": 1}},
        },
        "connections": [],
    }
    assert "hidden-box" not in _rules(verify_spec(spec))


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


# ── spec-vs-boxes staleness (spec2maxpat.spec_matches_patch) ─────────────────
#
# Fixture: patches/kslider-restrike.maxpat as committed at fab50b0 — its
# embedded spec describes the previous commit (27 objects) while the boxes
# (28) carry a later session's s/r rework, a `print v8`, the loaded plug-in on
# `vst~`, and two presentation rects Max resized. The exact case the check
# exists for.

def _load_fixture(name):
    import json
    return json.loads((_FIXTURES / name).read_text())


def test_spec_stale_fixture_detected():
    m = _load_fixture("kslider-restrike-stale-spec.maxpat")
    rep = spec2maxpat.spec_matches_patch(m)
    assert rep["has_spec"] and rep["matches"] is False
    assert (rep["spec_objects"], rep["boxes"]) == (27, 28)
    only_patch = {d["key"] for d in rep["only_in_patch"]}
    only_spec = {d["key"] for d in rep["only_in_spec"]}
    assert {"newobj s VST", "newobj r VST", "newobj print v8",
            "newobj vst~ C74_VST3:/Podolski"} <= only_patch
    assert {"newobj prepend set", "message (none)", "newobj vst~"} <= only_spec
    drift = {d["key"]: (d["spec"], d["patch"]) for d in rep["presentation_drift"]}
    assert drift["kslider"] == ([22.0, 104.0, 576.0, 70.0], [22.0, 104.0, 560.0, 83.0])
    assert drift["live.gain~"] == ([22.0, 330.0, 200.0, 39.0], [22.0, 330.0, 200.0, 47.0])
    assert rep["connection_diff"]["only_in_patch"] and rep["connection_diff"]["only_in_spec"]
    assert "STALE" in rep["summary"]
    # the report renders, and tells the reader what to do
    txt = spec2maxpat.format_spec_match_report(rep)
    assert "sync" in txt and "only in patch" in txt


def test_spec_matches_after_sync():
    m = _load_fixture("kslider-restrike-stale-spec.maxpat")
    _spec, synced = spec2maxpat.sync_spec(m)
    rep = spec2maxpat.spec_matches_patch(synced)
    assert rep["matches"] is True, rep["summary"]
    assert not rep["only_in_spec"] and not rep["only_in_patch"]
    assert not rep["presentation_drift"]


def test_spec_match_no_spec():
    m = {"patcher": {"boxes": [{"box": {"id": "obj-1", "maxclass": "toggle",
                                        "patching_rect": [10, 10, 24, 24]}}],
                     "lines": []}}
    rep = spec2maxpat.spec_matches_patch(m)
    assert rep["has_spec"] is False and rep["matches"] is None


def test_spec_match_by_content_not_id():
    # Spec ids are semantic, box ids are obj-N: identical content must match.
    spec = {"objects": {"go": {"type": "toggle"},
                        "clock": {"type": "newobj", "text": "metro 500"}},
            "connections": [["go", 0, "clock", 0]]}
    m = spec2maxpat.convert_spec(spec)
    rep = spec2maxpat.spec_matches_patch(m)
    assert rep["matches"] is True, rep["summary"]
    # now edit a box "in Max": change metro's text
    for w in m["patcher"]["boxes"]:
        if w["box"].get("text") == "metro 500":
            w["box"]["text"] = "metro 250"
    rep = spec2maxpat.spec_matches_patch(m)
    assert rep["matches"] is False
    assert [d["key"] for d in rep["only_in_spec"]] == ["newobj metro 500"]
    assert [d["key"] for d in rep["only_in_patch"]] == ["newobj metro 250"]


def test_verify_patch_file_reports_stale_first():
    path = _FIXTURES / "kslider-restrike-stale-spec.maxpat"
    r = spec2maxpat.verify_patch_file(str(path), use_resolver=False)
    assert r["checked"] and r["mode"] == "embedded-spec"
    assert r["violations"] and r["violations"][0]["rule"] == "spec-stale"
    assert r["violations"][0]["severity"] == "warning"
    assert not r["ok"]
    assert r["summary"].startswith("SPEC STALE")
    assert r["spec_matches_patch"]["matches"] is False


def test_verify_patch_file_clean_after_sync(tmp_path=None):
    import json, tempfile
    m = _load_fixture("kslider-restrike-stale-spec.maxpat")
    _spec, synced = spec2maxpat.sync_spec(m)
    with tempfile.NamedTemporaryFile("w", suffix=".maxpat", delete=False) as f:
        json.dump(synced, f)
        name = f.name
    r = spec2maxpat.verify_patch_file(name, use_resolver=False)
    assert "spec-stale" not in {v["rule"] for v in r["violations"]}
    assert r["spec_matches_patch"]["matches"] is True


# ── item 13 rules (2026-09-08) ────────────────────────────────────────────────
# Each rule: one spec that fires, one that is clean, and a negative case for
# every stated exemption. Specs carry `pos` so geometry rules can measure.

def _panel(x, y, w, h):
    return {"type": "panel", "presentation": [x, y, w, h]}


def _pres(t, rect, **kw):
    o = {"type": t, "presentation": rect}
    o.update(kw)
    return o


def test_nominal_ui_sizes_mirror_converter():
    import spec2maxpat
    from claude2max_verify.rules import _NOMINAL_UI_SIZES
    assert _NOMINAL_UI_SIZES == spec2maxpat.UI_SIZES, "rules._NOMINAL_UI_SIZES drifted from spec2maxpat.UI_SIZES"


# (a) presentation-overlap ---------------------------------------------------
def test_presentation_overlap_kslider_restrike_geometry():
    spec = {"objects": {
        "panel": _panel(10, 90, 600, 150),
        "kslider": _pres("kslider", [22, 104, 560, 83]),
        "hint": _pres("comment", [22, 178, 560, 20], text="click keys"),
    }, "connections": []}
    r = verify_spec(spec)
    hits = [v for v in r["violations"] if v["rule"] == "presentation-overlap"]
    assert len(hits) == 1 and "9 px" in hits[0]["message"]


def test_presentation_overlap_clean_when_kslider_original_size():
    spec = {"objects": {
        "panel": _panel(10, 90, 600, 150),
        "kslider": _pres("kslider", [22, 104, 576, 70]),
        "hint": _pres("comment", [22, 178, 560, 20], text="click keys"),
    }, "connections": []}
    assert "presentation-overlap" not in _rules(verify_spec(spec))


def test_presentation_outside_panel():
    spec = {"objects": {
        "panel": _panel(10, 10, 200, 100),
        "n": _pres("number", [300, 300, 50, 22]),
        "lbl": _pres("comment", [300, 280, 50, 18], text="n"),
    }, "connections": []}
    assert "presentation-outside-panel" in _rules(verify_spec(spec))


def test_presentation_no_panels_no_containment_check():
    spec = {"objects": {
        "n": _pres("number", [300, 300, 50, 22]),
        "lbl": _pres("comment", [300, 280, 50, 18], text="n"),
    }, "connections": []}
    assert "presentation-outside-panel" not in _rules(verify_spec(spec))


def test_two_overlapping_panels_not_reported():
    spec = {"objects": {"outer": _panel(0, 0, 400, 400), "inner": _panel(20, 20, 100, 100)},
            "connections": []}
    assert "presentation-overlap" not in _rules(verify_spec(spec))


# (b) comment-contrast -------------------------------------------------------
def test_comment_contrast_fires_dark_on_dark():
    spec = {"objects": {"c": {"type": "comment", "text": "note",
                              "attrs": {"bgcolor": [0.13, 0.13, 0.15, 1.0],
                                        "textcolor": [0.13, 0.13, 0.15, 1.0]}}},
            "connections": []}
    assert "comment-contrast" in _rules(verify_spec(spec))


def test_comment_contrast_clean_and_single_attr_skipped():
    ok = {"objects": {"c": {"type": "comment", "text": "note",
                            "attrs": {"bgcolor": [0.13, 0.13, 0.15, 1.0],
                                      "textcolor": [0.92, 0.92, 0.92, 1.0]}}},
          "connections": []}
    assert "comment-contrast" not in _rules(verify_spec(ok))
    one = {"objects": {"c": {"type": "comment", "text": "note",
                             "attrs": {"textcolor": [0.13, 0.13, 0.15, 1.0]}}},
           "connections": []}
    assert "comment-contrast" not in _rules(verify_spec(one))


# (s) control-unlabelled ------------------------------------------------------
def test_control_unlabelled_per_control():
    spec = {"objects": {
        "near": _pres("toggle", [20, 40, 24, 24]),
        "near_lbl": _pres("comment", [20, 20, 60, 18], text="on"),
        "far": _pres("dial", [500, 400, 40, 48]),
        "self": _pres("attrui", [500, 500, 150, 22]),     # draws its own label
    }, "connections": []}
    r = verify_spec(spec)
    hits = {v["location"] for v in r["violations"] if v["rule"] == "control-unlabelled"}
    assert hits == {"far"}


def test_control_unlabelled_coarse_case_once():
    spec = {"objects": {"a": _pres("toggle", [20, 40, 24, 24]),
                        "b": _pres("dial", [80, 40, 40, 48])}, "connections": []}
    r = verify_spec(spec)
    assert [v["rule"] for v in r["violations"]].count("presented-controls-need-labels") == 1
    assert "control-unlabelled" not in _rules(r)


# (h) template-on-right-inlet -------------------------------------------------
def test_template_on_right_inlet():
    spec = {"objects": {"t": {"type": "newobj", "text": "t b i"},
                        "m": {"type": "message", "text": "dim 1 $1"},
                        "plain": {"type": "message", "text": "dim 1 5"}},
            "connections": [["t", 1, "m", 1], ["t", 1, "plain", 1]]}
    r = verify_spec(spec)
    hits = [v for v in r["violations"] if v["rule"] == "template-on-right-inlet"]
    assert len(hits) == 1 and hits[0]["location"] == "connections[0]"
    ok = {"objects": spec["objects"], "connections": [["t", 1, "m", 0]]}
    assert "template-on-right-inlet" not in _rules(verify_spec(ok))


# (l) textedit-into-template --------------------------------------------------
def test_textedit_into_template():
    base = {"te": {"type": "textedit"}, "m": {"type": "message", "text": "setcloudurl $1"},
            "route": {"type": "newobj", "text": "route text"}}
    fires = {"objects": base, "connections": [["te", 0, "m", 0]]}
    assert "textedit-into-template" in _rules(verify_spec(fires))
    mode1 = {"objects": {**base, "te": {"type": "textedit", "attrs": {"outputmode": 1}}},
             "connections": [["te", 0, "m", 0]]}
    assert "textedit-into-template" not in _rules(verify_spec(mode1))
    routed = {"objects": base, "connections": [["te", 0, "route", 0], ["route", 0, "m", 0]]}
    assert "textedit-into-template" not in _rules(verify_spec(routed))


# (m) select-float-needs-fuzzy -------------------------------------------------
def test_select_float_needs_fuzzy():
    objs = {"d": {"type": "dial"}, "sel": {"type": "newobj", "text": "select 0.5"},
            "fz": {"type": "newobj", "text": "select 0.5 @fuzzy 0.001"},
            "msg": {"type": "message", "text": "0.5"}}
    assert "select-float-needs-fuzzy" in _rules(verify_spec({"objects": objs, "connections": [["d", 0, "sel", 0]]}))
    assert "select-float-needs-fuzzy" not in _rules(verify_spec({"objects": objs, "connections": [["d", 0, "fz", 0]]}))
    assert "select-float-needs-fuzzy" not in _rules(verify_spec({"objects": objs, "connections": [["msg", 0, "sel", 0]]}))


# (k) script-object-declarations ----------------------------------------------
def test_script_object_declarations():
    ok = {"objects": {"ui": {"type": "jsui", "attrs": {"filename": "foo.js"}},
                      "v": {"type": "newobj", "text": "v8 x.js", "inlets": 1, "outlets": 2,
                            "outlettype": ["", ""]}}, "connections": []}
    rs = _rules(verify_spec(ok))
    assert "script-filename-missing" not in rs and "script-io-undeclared" not in rs
    bad = {"objects": {"ui": {"type": "jsui"},
                       "ui2": {"type": "newobj", "text": "jsui foo.js"},
                       "v": {"type": "newobj", "text": "v8 x.js", "inlets": 1, "outlets": 2}},
           "connections": []}
    r = verify_spec(bad)
    assert [v["rule"] for v in r["violations"]].count("script-filename-missing") == 2
    io = [v for v in r["violations"] if v["rule"] == "script-io-undeclared"]
    assert len(io) == 1 and "outlettype" in io[0]["message"]
    # native-derived specs carry neither field: rule is silent there
    assert "script-filename-missing" not in _rules(verify_spec(bad, native=True))


# (o) attribute-group-incomplete ----------------------------------------------
def test_attribute_group_incomplete():
    fires = {"objects": {"m": {"type": "newobj", "text": "jit.matrix 4 char 640 360 @usedstdim 1"},
                         "w": {"type": "newobj", "text": "jit.world"}}, "connections": []}
    rs = _rules(verify_spec(fires))
    assert "attribute-group-incomplete" in rs and "attribute-required" in rs
    ok = {"objects": {"m": {"type": "newobj", "text": "jit.matrix 4 char 640 360 @usedstdim 1 "
                                                       "@dstdimstart 0 0 @dstdimend 319 179"},
                      "w": {"type": "newobj", "text": "jit.world @enable 1"}}, "connections": []}
    rs = _rules(verify_spec(ok))
    assert "attribute-group-incomplete" not in rs and "attribute-required" not in rs


# (v) kslider-demo-range ------------------------------------------------------
def test_kslider_demo_range():
    objs = {"k": {"type": "kslider"},   # defaults 36..83
            "ok": {"type": "message", "text": "chord 60 100"},
            "bad": {"type": "message", "text": "chord 100 100"},
            "tmpl": {"type": "message", "text": "set $1"}}
    conns = [["ok", 0, "k", 0], ["bad", 0, "k", 0], ["tmpl", 0, "k", 0]]
    r = verify_spec({"objects": objs, "connections": conns})
    hits = [v["location"] for v in r["violations"] if v["rule"] == "kslider-demo-range"]
    assert hits == ["bad"]


# (n) jit-matrix-fan-in (resolver-gated) --------------------------------------
class _MatrixResolver(FakeResolver):
    def resolve_object(self, name):
        if name == "jit.noise":
            return {"source": "fake", "outlettype": ["jit_matrix", ""]}
        return super().resolve_object(name)


def test_jit_matrix_fan_in():
    objs = {"a": {"type": "newobj", "text": "jit.noise"}, "b": {"type": "newobj", "text": "jit.noise"},
            "v": {"type": "newobj", "text": "v8 x.js", "inlets": 2, "outlets": 1, "outlettype": [""]}}
    res = _MatrixResolver(["jit.noise", "v8"])
    fires = verify_spec({"objects": objs, "connections": [["a", 0, "v", 0], ["b", 0, "v", 0]]}, resolver=res)
    assert "jit-matrix-fan-in" in _rules(fires)
    ok = verify_spec({"objects": objs, "connections": [["a", 0, "v", 0], ["b", 0, "v", 1]]}, resolver=res)
    assert "jit-matrix-fan-in" not in _rules(ok)
    notypes = verify_spec({"objects": objs, "connections": [["a", 0, "v", 0], ["b", 0, "v", 0]]},
                          resolver=FakeResolver(["jit.noise", "v8"]))
    assert "jit-matrix-fan-in" not in _rules(notypes)


# (r) io-comment-box-missing --------------------------------------------------
def test_io_comment_box_inside_subpatcher():
    def sub(with_box):
        objs = {"in": {"type": "inlet", "pos": [50, 40], "attrs": {"comment": "in 0: bang"}},
                "out": {"type": "outlet", "pos": [50, 200], "attrs": {"comment": "out 0: int"}},
                "c": {"type": "newobj", "text": "counter", "pos": [50, 120]}}
        if with_box:
            objs["lbl_in"] = {"type": "comment", "text": "bang in", "pos": [90, 44]}
            objs["lbl_out"] = {"type": "comment", "text": "int out", "pos": [90, 204]}
        return {"objects": objs, "connections": [["in", 0, "c", 0], ["c", 0, "out", 0]]}

    def top(with_box):
        return {"objects": {"p": {"type": "newobj", "text": "p COUNT", "patcher": sub(with_box),
                                  "attrs": {"comment": "in 0: bang | out 0: int"}}},
                "connections": []}
    assert "io-comment-box-missing" not in _rules(verify_spec(top(True)))
    r = verify_spec(top(False))
    assert [v["rule"] for v in r["violations"]].count("io-comment-box-missing") == 2
    assert "io-label-missing" not in _rules(r)


# (c) cord-crosses-unrelated-box ----------------------------------------------
def test_cord_crosses_unrelated_box():
    objs = {"src": {"type": "message", "text": "plug", "pos": [100, 40]},
            "mid": {"type": "newobj", "text": "midiformat", "pos": [100, 200]},
            "dst": {"type": "newobj", "text": "vst~", "pos": [100, 400]}}
    fires = verify_spec({"objects": objs, "connections": [["src", 0, "dst", 0]]})
    hit = [v for v in fires["violations"] if v["rule"] == "cord-crosses-unrelated-box"]
    assert hit and "mid" in hit[0]["message"]
    objs2 = dict(objs, s={"type": "newobj", "text": "s VST", "pos": [100, 80]},
                 r={"type": "newobj", "text": "r VST", "pos": [100, 360]})
    ok = verify_spec({"objects": objs2, "connections": [["src", 0, "s", 0], ["r", 0, "dst", 0]]})
    assert "cord-crosses-unrelated-box" not in _rules(ok)
    beside = {"objects": {"a": {"type": "newobj", "text": "metro 500", "pos": [100, 40]},
                          "b": {"type": "newobj", "text": "counter", "pos": [100, 200]},
                          "c": {"type": "comment", "text": "clock", "pos": [300, 120]},
                          "bg": {"type": "panel", "pos": [0, 0], "size": [600, 600]}},
              "connections": [["a", 0, "b", 0]]}
    assert "cord-crosses-unrelated-box" not in _rules(verify_spec(beside))


# (d) feeder-below-target -----------------------------------------------------
def test_feeder_below_target():
    objs = {"m": {"type": "message", "text": "1", "pos": [100, 300]},
            "metro": {"type": "newobj", "text": "metro 500", "pos": [100, 200]},
            "n": {"type": "newobj", "text": "counter", "pos": [100, 300]}}
    assert "feeder-below-target" in _rules(verify_spec({"objects": objs, "connections": [["m", 0, "metro", 0]]}))
    objs2 = dict(objs, m={"type": "message", "text": "1", "pos": [100, 100]})
    assert "feeder-below-target" not in _rules(verify_spec({"objects": objs2, "connections": [["m", 0, "metro", 0]]}))
    assert "feeder-below-target" not in _rules(verify_spec({"objects": objs, "connections": [["n", 0, "metro", 0]]}))


# (e) fanout-order ------------------------------------------------------------
def test_fanout_order():
    objs = {"t": {"type": "newobj", "text": "t i i", "pos": [200, 40]},
            "left": {"type": "newobj", "text": "print A", "pos": [100, 120]},
            "right": {"type": "newobj", "text": "print B", "pos": [300, 120]}}
    wrong = verify_spec({"objects": objs, "connections": [["t", 1, "left", 0], ["t", 0, "right", 0]]})
    assert "fanout-order" in _rules(wrong)
    right = verify_spec({"objects": objs, "connections": [["t", 0, "left", 0], ["t", 1, "right", 0]]})
    assert "fanout-order" not in _rules(right)
    same = {"objects": {"u": {"type": "newobj", "text": "unjoin 2", "pos": [100, 40]},
                        "j": {"type": "newobj", "text": "join 2", "pos": [100, 120]}},
            "connections": [["u", 0, "j", 0], ["u", 1, "j", 1]]}
    assert "fanout-order" not in _rules(verify_spec(same))


# (f) cord-too-short ----------------------------------------------------------
def test_cord_too_short():
    def spec(gap):
        return {"objects": {"a": {"type": "newobj", "text": "metro 500", "pos": [100, 100]},
                            "b": {"type": "newobj", "text": "counter", "pos": [100, 100 + 22 + gap]}},
                "connections": [["a", 0, "b", 0]]}
    assert "cord-too-short" in _rules(verify_spec(spec(8)))
    assert "cord-too-short" not in _rules(verify_spec(spec(40)))


# (g) button-side-tap ---------------------------------------------------------
def test_button_side_tap():
    objs = {"metro": {"type": "newobj", "text": "metro 500"}, "cnt": {"type": "newobj", "text": "counter"},
            "b": {"type": "button"}}
    tap = verify_spec({"objects": objs, "connections": [["metro", 0, "cnt", 0], ["metro", 0, "b", 0]]})
    assert "button-side-tap" in _rules(tap)
    inline = verify_spec({"objects": objs, "connections": [["metro", 0, "b", 0], ["b", 0, "cnt", 0]]})
    assert "button-side-tap" not in _rules(inline)
    objs2 = dict(objs, b={"type": "button", "presentation": [10, 10, 24, 24]})
    presented = verify_spec({"objects": objs2, "connections": [["metro", 0, "cnt", 0], ["metro", 0, "b", 0]]})
    assert "button-side-tap" not in _rules(presented)


# (j) preferred-object --------------------------------------------------------
def test_preferred_object_rows_and_chains():
    for text in ("pack 0 0", "pak 0 0", "unpack 0 0", "send FOO", "receive FOO", "send~ X",
                 "receive~ X", "adc~", "dac~", "delay~ 44100"):
        r = verify_spec({"objects": {"o": {"type": "newobj", "text": text}}, "connections": []})
        assert "preferred-object" in _rules(r), text
    assert "preferred-object" not in _rules(verify_spec({"objects": {"o": {"type": "newobj", "text": "join 2"}}, "connections": []}))
    chain = {"objects": {"mf": {"type": "newobj", "text": "midiformat"}, "mo": {"type": "newobj", "text": "midiout"},
                         "vst": {"type": "newobj", "text": "vst~"}}, "connections": [["mf", 0, "mo", 0]]}
    assert "preferred-object" in _rules(verify_spec(chain))
    chain["connections"] = [["mf", 0, "vst", 0]]
    assert "preferred-object" not in _rules(verify_spec(chain))


# (p) print-needs-name --------------------------------------------------------
def test_print_needs_name():
    assert "print-needs-name" in _rules(verify_spec({"objects": {"p": {"type": "newobj", "text": "print"}}, "connections": []}))
    assert "print-needs-name" not in _rules(verify_spec({"objects": {"p": {"type": "newobj", "text": "print HELD"}}, "connections": []}))


# (q) patching-size-override --------------------------------------------------
def test_patching_size_override():
    r = verify_spec({"objects": {"t": {"type": "toggle", "size": [60, 60]},
                                 "c": {"type": "comment", "text": "x", "size": [300, 40]},
                                 "i": {"type": "inlet", "size": [40, 40]},
                                 "a": {"type": "attrui", "size": [200, 22]},
                                 "nominal": {"type": "toggle", "size": [24, 24]}}, "connections": []})
    locs = {(v["rule"], v["location"]) for v in r["violations"]}
    assert ("patching-size-override", "t") in locs
    assert ("io-box-resized", "i") in locs
    assert not any(l in ("c", "a", "nominal") for _r, l in locs if _r in ("patching-size-override", "io-box-resized"))


# (t) control-init-on-load ----------------------------------------------------
def test_control_init_on_load():
    bare = {"objects": {"n": {"type": "number"}}, "connections": []}
    assert "control-init-on-load" in _rules(verify_spec(bare))
    fed = {"objects": {"n": {"type": "number"}, "lm": {"type": "newobj", "text": "loadmess 5"}},
           "connections": [["lm", 0, "n", 0]]}
    assert "control-init-on-load" not in _rules(verify_spec(fed))
    ap = {"objects": {"n": {"type": "number"}, "ap": {"type": "newobj", "text": "autopattr"}}, "connections": []}
    assert "control-init-on-load" not in _rules(verify_spec(ap))
    live = {"objects": {"d": {"type": "live.dial"}}, "connections": []}
    assert "control-init-on-load" not in _rules(verify_spec(live))


# (u) declareattribute-conventions (JS scanner) --------------------------------
def test_declareattribute_conventions_scanner():
    from claude2max_verify import jsattrs
    fixture = _FIXTURES / "declareattribute-bench.js"
    findings = jsattrs.check_script(fixture)
    rules = [x["rule"] for x in findings]
    assert rules.count("attr-label-leading-word") == 1, findings        # displaymode's label
    assert rules.count("attr-style-mismatch") == 2, findings            # displaymode onoff, keycolor rgba
    assert rules.count("script-io-unlabelled") == 1, findings           # outlet 1 has no assist
    spec = {"objects": {"v": {"type": "newobj", "text": "v8 declareattribute-bench.js", "inlets": 1,
                              "outlets": 2, "outlettype": ["", ""]},
                        "ghost": {"type": "newobj", "text": "v8 missing.js", "inlets": 1, "outlets": 1,
                                  "outlettype": [""]}}, "connections": []}
    r = verify_spec(spec, base_dir=str(_FIXTURES))
    locs = {v["location"] for v in r["violations"]
            if v["rule"].startswith("attr-") or v["rule"] == "script-io-unlabelled"}
    assert locs == {"v (declareattribute-bench.js)"}
    r0 = verify_spec(spec)          # no base_dir → scanner silent
    assert not any(v["rule"].startswith("attr-") for v in r0["violations"])


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
