"""`v8 name.js @embed 1` makes convert store the script in the box's `textfile`
block, so the patch runs without the .js on disk (CLAUDE.md > Embed the Script
in Every v8 Box). Run: python3 -m pytest tests/test_script_embed.py"""
import copy, os, sys, tempfile
from pathlib import Path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s

SRC = 'inlets = 1; outlets = 1;\nfunction bang() { outlet(0, "hi"); }\n'
IO = {"inlets": 1, "outlets": 1, "outlettype": [""]}


def _v8box(m):
    return next(w["box"] for w in m["patcher"]["boxes"] if w["box"].get("text", "").startswith("v8"))


def _spec(text):
    return {"objects": {"v": {"type": "newobj", "text": text, "pos": [10, 10], **IO}}, "connections": []}


def test_script_ref_parses_name_args_and_embed():
    assert s.script_ref("v8 foo.js") == ("foo.js", False)
    assert s.script_ref("v8 foo.js @embed 1") == ("foo.js", True)
    assert s.script_ref("v8 foo.js 15 @embed 1") == ("foo.js", True)
    assert s.script_ref("v8 foo.js @embed 0") == ("foo.js", False)
    assert s.script_ref("v8 @embed 1") == (None, True)
    assert s.script_ref("metro 100") == (None, False)


def test_embed_reads_script_from_disk_and_mirrors_into_spec():
    with tempfile.TemporaryDirectory() as d:
        Path(d, "foo.js").write_text(SRC)
        spec = _spec("v8 foo.js 15 @embed 1")
        box = _v8box(s.convert_spec(spec, script_dirs=[d]))
        assert box["filename"] == "foo.js"
        assert box["textfile"] == {"filename": "foo.js", "flags": 0, "autowatch": 1, "embed": 1, "text": SRC}
        assert spec["objects"]["v"]["attrs"]["textfile"]["text"] == SRC   # embedded spec stays in step


def test_no_embed_request_leaves_box_alone():
    with tempfile.TemporaryDirectory() as d:
        Path(d, "foo.js").write_text(SRC)
        box = _v8box(s.convert_spec(_spec("v8 foo.js"), script_dirs=[d]))
        assert "textfile" not in box and "filename" not in box


def test_missing_file_keeps_copy_the_spec_carries():
    spec = _spec("v8 foo.js @embed 1")
    spec["objects"]["v"]["attrs"] = {"textfile": {"filename": "foo.js", "flags": 0, "embed": 1,
                                                  "autowatch": 1, "text": SRC}}
    box = _v8box(s.convert_spec(spec, script_dirs=["/nonexistent"]))
    assert box["textfile"]["text"] == SRC and box["textfile"]["embed"] == 1


def test_disk_wins_over_stale_copy():
    with tempfile.TemporaryDirectory() as d:
        Path(d, "foo.js").write_text(SRC)
        spec = _spec("v8 foo.js @embed 1")
        spec["objects"]["v"]["attrs"] = {"textfile": {"filename": "foo.js", "flags": 0, "embed": 1,
                                                      "autowatch": 1, "text": "// old"}}
        assert _v8box(s.convert_spec(spec, script_dirs=[d]))["textfile"]["text"] == SRC


def test_textfile_survives_sync_then_convert_without_the_file():
    with tempfile.TemporaryDirectory() as d:
        Path(d, "foo.js").write_text(SRC)
        m = s.convert_spec(_spec("v8 foo.js @embed 1"), script_dirs=[d])
    # patch travels alone: sync (reconcile) then convert with no .js anywhere
    spec2, synced = s.sync_spec(m)
    assert spec2["objects"]["v"]["attrs"]["textfile"]["text"] == SRC
    assert _v8box(s.convert_spec(spec2, script_dirs=["/nonexistent"]))["textfile"]["text"] == SRC
    # and for a patch with no embedded spec at all (native), reverse-engineering keeps it too
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"].get("id") != "obj-spec-embed"]
    native = s.maxpat_to_spec(m)
    v = next(o for o in native["objects"].values() if o.get("text", "").startswith("v8"))
    assert v["attrs"]["textfile"]["text"] == SRC


def test_max_saved_embed_without_text_attribute_is_honored():
    # Max wrote textfile.embed = 1 (Inspector checkbox) but the box text has no @embed
    with tempfile.TemporaryDirectory() as d:
        Path(d, "foo.js").write_text(SRC)
        spec = _spec("v8 foo.js")
        spec["objects"]["v"]["attrs"] = {"textfile": {"filename": "foo.js", "flags": 0, "embed": 1, "autowatch": 1}}
        assert _v8box(s.convert_spec(spec, script_dirs=[d]))["textfile"]["text"] == SRC
