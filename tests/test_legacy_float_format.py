#!/usr/bin/env python3
"""Old Max (the Max 7 era) wrote every float with a trailing dot and no digit
(`"rect" : [ 460., 44., 253., 245. ]`), which Python's json rejects. The reader
must repair that on read, say it did, and leave dots inside strings alone.
Fixture: Cycling '74's own legacy example fft-spect1024.maxpat (2026-09-16).
Run: python3 tests/test_legacy_float_format.py"""
import io, json, sys, tempfile, os
from contextlib import redirect_stderr
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

FIXTURE = Path(__file__).parent / "fixtures" / "legacy-float-fft-spect1024.maxpat"


def test_fixture_is_really_the_old_format():
    text = FIXTURE.read_text()
    assert "460.," in text
    try:
        json.loads(text)
    except json.JSONDecodeError:
        return
    raise AssertionError("fixture parses as strict JSON; it no longer tests the repair")


def test_legacy_file_loads_and_says_so():
    err = io.StringIO()
    with redirect_stderr(err):
        obj, _ = s.read_patch_file(str(FIXTURE))
    assert obj["patcher"]["rect"] == [460.0, 44.0, 253.0, 245.0]
    assert len(obj["patcher"]["boxes"]) == 25, len(obj["patcher"]["boxes"])
    assert "old float format" in err.getvalue()


def test_dots_inside_strings_are_untouched():
    text = '{"patcher": {"rect": [1., 2.], "boxes": [{"box": {"text": "* 2. ", "c": "a 5.]"}}]}}'
    notes = []
    obj = s._load_maxpat_json(text, notes)
    assert obj["patcher"]["rect"] == [1.0, 2.0]
    assert obj["patcher"]["boxes"][0]["box"]["text"] == "* 2. "
    assert obj["patcher"]["boxes"][0]["box"]["c"] == "a 5.]"
    assert notes == ["legacy-float-repair"]


def test_modern_patch_is_unchanged_and_silent():
    data = {"patcher": {"rect": [460.0, 44.0, 253.0, 245.0], "boxes": [], "lines": []}}
    with tempfile.NamedTemporaryFile("w", suffix=".maxpat", delete=False) as fh:
        json.dump(data, fh); path = fh.name
    try:
        err = io.StringIO()
        with redirect_stderr(err):
            obj, _ = s.read_patch_file(path)
        assert obj == data
        assert err.getvalue() == ""
    finally:
        os.unlink(path)


def test_not_json_still_fails():
    assert s._load_maxpat_json("hello 5. world") is None


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("ok", name)
