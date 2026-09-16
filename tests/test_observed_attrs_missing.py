#!/usr/bin/env python3
"""A missing help-corpus attribute map is reported, never silently empty.
Run: python3 tests/test_observed_attrs_missing.py

`_GateResolver._load_observed_attrs` used to return {} on any read error, which
looks exactly like "no attributes observed" — so a moved or deleted
scans/maxhelp/maxhelp_observed_attrs.json weakened every attribute check with no
sign. Rule: CLAUDE.md > A Silent Fallback Is Indistinguishable From a Genuine
No-Match.

- the real map loads, with no error recorded
- a missing map records the cause, warns on stderr once per process, and loads nothing
- a verify run over a patch carries the note in its result
"""
import io
import sys
from contextlib import redirect_stderr
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

_REPO = Path(__file__).resolve().parent.parent
_MISSING = _REPO / "scans" / "maxhelp" / "no_such_observed_attrs.json"


def _with_missing_map(fn):
    saved_path, saved_flag = s._GateResolver.OBSERVED_ATTRS_PATH, s._OBSERVED_WARNED
    s._GateResolver.OBSERVED_ATTRS_PATH, s._OBSERVED_WARNED = _MISSING, False
    try:
        return fn()
    finally:
        s._GateResolver.OBSERVED_ATTRS_PATH, s._OBSERVED_WARNED = saved_path, saved_flag


def test_real_map_loads_without_error():
    r = s.build_resolver()
    assert r.observed_error is None
    assert len(r._observed) > 1000, len(r._observed)


def test_missing_map_is_reported_once():
    def run():
        err = io.StringIO()
        with redirect_stderr(err):
            first = s.build_resolver()
            second = s.build_resolver()
        return first, second, err.getvalue()
    first, second, stderr = _with_missing_map(run)
    assert first._observed == {}
    assert first.observed_error and "FileNotFoundError" in first.observed_error, first.observed_error
    assert "no_such_observed_attrs.json" in first.observed_error
    assert second.observed_error == first.observed_error
    assert stderr.count("[resolver] WARNING") == 1, stderr


def test_verify_result_carries_the_note():
    patch = _REPO / "patches" / "drift-sequencer.maxpat"
    def run():
        with redirect_stderr(io.StringIO()):
            r = s.build_resolver()
            return s.verify_patch_file(str(patch), resolver=r)
    result = _with_missing_map(run)
    assert "resolver_note" in result and "not loaded" in result["resolver_note"], result.get("resolver_note")
    with redirect_stderr(io.StringIO()):
        clean = s.verify_patch_file(str(patch), resolver=s.build_resolver())
    assert "resolver_note" not in clean


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
