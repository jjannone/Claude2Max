#!/usr/bin/env python3
"""A codebox's `code` is a real box key, and sync keeps it.
Run: python3 tests/test_codebox_code_attr.py

Max writes a codebox's text as `code` on the box (gen.codebox~.maxhelp:
{"maxclass": "gen.codebox~", "code": "Param amp(0.5);..."}). No refpage lists
it, and the help corpus saw gen.codebox~ on one box only, under a 3-box
minimum, so the gate reported `'code' is not a valid attribute of 'gen.codebox~'`
and blocked butter.carve~.maxpat (2026-10-03). The minimum is gone: every key
Max saved on a Max box is evidence, however rare.

- `code` is valid on every codebox class, each named here by hand
- a guessed attribute on the same class is still an error
- sync keeps the code of a codebox added in Max, and of one edited in Max
"""
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "mcp_server"))
import spec2maxpat as s
from claude2max_verify import rules

# Each confirmed against its own help file in the Max install, 2026-10-03.
CODEBOX_CLASSES = ["gen.codebox~", "gen.codebox", "v8.codebox", "jit.gen.codebox",
                   "jit.gl.pix.codebox", "jit.pix.codebox", "text.codebox"]


def _attr_errors(maxclass, attrs):
    spec = {"objects": {"cb": {"type": maxclass, "pos": [10, 10], "attrs": attrs}},
            "connections": []}
    ctx = rules.SpecContext(spec)
    return [v for v in rules.rule_attribute_resolves(ctx, s.build_resolver())
            if v.rule == "attribute-invalid"]


def test_code_is_valid_on_every_codebox_class():
    for cls in CODEBOX_CLASSES:
        errs = _attr_errors(cls, {"code": "out1 = in1;"})
        assert errs == [], (cls, [v.message for v in errs])


def test_a_guessed_attribute_is_still_an_error():
    errs = _attr_errors("gen.codebox~", {"code": "out1 = in1;", "codetext": "x"})
    assert [v.message.split("'")[1] for v in errs] == ["codetext"], errs


def _codebox(bid, code):
    return {"box": {"id": bid, "maxclass": "gen.codebox~", "numinlets": 1,
                    "numoutlets": 1, "outlettype": ["signal"],
                    "patching_rect": [10, 10, 200, 100], "code": code}}


def _spec_codes(maxpat):
    spec = s.extract_spec(maxpat)
    spec = json.loads(spec) if isinstance(spec, str) else spec
    return sorted((o.get("attrs") or {}).get("code", "<none>")
                  for o in spec["objects"].values() if o.get("type") == "gen.codebox~")


def test_sync_keeps_code_added_and_edited_in_max():
    m = {"patcher": {"rect": [0, 0, 400, 300], "boxes": [_codebox("obj-1", "out1 = in1;")],
                     "lines": []}}
    _, m = s.sync_spec(m)
    assert _spec_codes(m) == ["out1 = in1;"]
    # Edit the existing box and add a second one, as if in Max, then sync.
    m["patcher"]["boxes"][0]["box"]["code"] = "out1 = in1 * 0.5;"
    m["patcher"]["boxes"].append(_codebox("obj-2", "out1 = in1 * 2;"))
    _, m = s.sync_spec(m)
    assert _spec_codes(m) == ["out1 = in1 * 0.5;", "out1 = in1 * 2;"]


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn()
            print("ok", name)
