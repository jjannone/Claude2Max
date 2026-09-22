#!/usr/bin/env python3
"""A `v8ui` / `jsui` box embeds its script the way an object box does.

Before 2026-09-21 convert only ever embedded a `v8` / `js` box, because
`_embed_script` read the script name out of the box TEXT and a UI box has none
— it names its script in `filename`. A device built from a spec therefore
shipped without the source for every keyboard, slider or scope it drew, and
opened dead on any machine without the package.

The on-disk shape is not invented here. Of the 8,488 jsui/v8ui boxes in the Max
install and the installed packages, none carries a box-level `embed` key; the
one embedded example, C74's own v8ui.maxhelp, stores it as
textfile {filename, flags, embed: 1, autowatch, text}. So a spec asks with
`attrs.embed` and convert moves the request into the textfile block.

Run: python3 tests/test_v8ui_script_embed.py"""
import sys, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

SOURCE = "// a tiny script\nfunction bang() { outlet(0, 1); }\n"


def _convert(spec, script_dir):
    return s.convert_spec(spec, script_dirs=[str(script_dir)])


def _box(m, cls):
    return next(w["box"] for w in m["patcher"]["boxes"] if w["box"].get("maxclass") == cls)


def _spec(maxclass, attrs):
    return {"objects": {"ui": {"type": maxclass, "pos": [30, 30], "size": [200, 100],
                               "inlets": 1, "outlets": 1, "outlettype": [""],
                               "attrs": dict(attrs)}},
            "connections": []}


def _with_script(name=None):
    d = Path(tempfile.mkdtemp())
    (d / (name or "demo.js")).write_text(SOURCE, encoding="utf-8")
    return d


def test_v8ui_embeds_the_script_it_names():
    d = _with_script()
    m = _convert(_spec("v8ui", {"filename": "demo.js", "embed": 1}), d)
    tf = _box(m, "v8ui")["textfile"]
    assert tf["text"] == SOURCE, tf.get("text")
    assert tf["embed"] == 1 and tf["filename"] == "demo.js", tf


def test_jsui_embeds_it_too():
    """The classes are named literally, not read from s._SCRIPT_UI_CLASSES: a
    test that loops over the constant under test passes when it is emptied."""
    for cls in ("v8ui", "jsui"):
        assert cls in s._SCRIPT_UI_CLASSES, cls
        d = _with_script()
        m = _convert(_spec(cls, {"filename": "demo.js", "embed": 1}), d)
        assert _box(m, cls)["textfile"]["text"] == SOURCE, cls


def test_the_box_level_embed_key_is_removed():
    """Max never writes `embed` as a box key on a UI script box (0 of 8,488 in
    the corpus). Leaving the spec's request there would put a key in the file
    that no saved patch has."""
    d = _with_script()
    box = _box(_convert(_spec("v8ui", {"filename": "demo.js", "embed": 1}), d), "v8ui")
    assert "embed" not in box, sorted(box)
    assert box["filename"] == "demo.js", box["filename"]


def test_no_embed_asked_means_no_textfile():
    d = _with_script()
    box = _box(_convert(_spec("v8ui", {"filename": "demo.js"}), d), "v8ui")
    assert "textfile" not in box, box.get("textfile")


def test_a_prior_embedded_copy_survives_when_the_file_is_gone():
    """Sync captures the copy Max saved; convert must not drop it just because
    the .js is not on disk this time."""
    spec = _spec("v8ui", {"filename": "demo.js",
                          "textfile": {"filename": "demo.js", "flags": 0,
                                       "embed": 1, "autowatch": 1, "text": SOURCE}})
    box = _box(_convert(spec, Path(tempfile.mkdtemp())), "v8ui")
    assert box["textfile"]["text"] == SOURCE, box["textfile"].get("text")


def test_the_spec_that_gets_embedded_keeps_up():
    d = _with_script()
    spec = _spec("v8ui", {"filename": "demo.js", "embed": 1})
    _convert(spec, d)
    assert spec["objects"]["ui"]["attrs"]["textfile"]["text"] == SOURCE


def test_object_boxes_are_untouched():
    """The v8 path is what worked before; adding the UI path must not steal it."""
    d = _with_script()
    m = s.convert_spec({"objects": {"o": {"type": "newobj", "text": "v8 demo.js @embed 1",
                                          "pos": [30, 30]}}, "connections": []},
                       script_dirs=[str(d)])
    assert _box(m, "newobj")["textfile"]["text"] == SOURCE


if __name__ == "__main__":
    fails = 0
    for name, fn in sorted(globals().items()):
        if name.startswith("test_") and callable(fn):
            try:
                fn(); print(f"  ok   {name}")
            except AssertionError as e:
                fails += 1; print(f"  FAIL {name}: {e}")
    print("all passed" if not fails else f"{fails} failed")
    sys.exit(1 if fails else 0)
