"""sync keeps an embedded v8 script and its .js in step (John's rules 1-4,
2026-09-10): same → nothing; disk differs and is not older → patch updated;
file missing → written from the patch; patch newer and different → conflict,
nothing written; --script-from-patch / --script-from-disk resolve it."""
import json, os, subprocess, sys, time, tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
import spec2maxpat as s

SRC = "inlets = 1; outlets = 1;\nfunction bang() { outlet(0, 1); }\n"
IO = {"inlets": 1, "outlets": 1, "outlettype": [""]}


def _setup(d):
    js = Path(d, "foo.js"); js.write_text(SRC)
    spec = {"objects": {"v": {"type": "newobj", "text": "v8 foo.js @embed 1", "pos": [10, 10], **IO}}, "connections": []}
    m = s.convert_spec(spec, script_dirs=[d])
    p = Path(d, "p.maxpat"); p.write_text(json.dumps(m))
    return p, js


def _embedded(p):
    m = json.loads(Path(p).read_text())
    return next(w["box"]["textfile"]["text"] for w in m["patcher"]["boxes"] if w["box"].get("text", "").startswith("v8"))


def _sync(p, *flags):
    return subprocess.run([sys.executable, str(ROOT / "spec2maxpat.py"), "sync", "-i", str(p), *flags],
                          capture_output=True, text=True)


def test_rule_1_same_is_silent():
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d)
        recs = s.reconcile_scripts(json.loads(p.read_text()), p)
        assert [r["action"] for r in recs] == ["same"]
        assert _sync(p).returncode == 0


def test_rule_2_newer_disk_edit_updates_patch():
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d)
        time.sleep(0.05); js.write_text(SRC + "// edited on disk\n")
        os.utime(js, None)
        r = _sync(p)
        assert r.returncode == 0 and "embedded copy refreshed" in r.stderr
        assert _embedded(p).endswith("// edited on disk\n")


def test_rule_3_missing_file_is_restored():
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d); js.unlink()
        r = _sync(p)
        assert r.returncode == 0 and "restored" in r.stderr
        assert js.read_text() == SRC


def test_rule_4_newer_patch_conflicts_and_writes_nothing():
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d)
        js.write_text(SRC + "// disk\n"); os.utime(js, (1, 1))          # file older than the patch
        m = json.loads(p.read_text())
        for w in m["patcher"]["boxes"]:
            if w["box"].get("text", "").startswith("v8"):
                w["box"]["textfile"]["text"] = SRC + "// edited in Max\n"
        p.write_text(json.dumps(m)); before = p.read_text()
        r = _sync(p)
        assert r.returncode == 1 and "SCRIPT CONFLICT" in r.stderr
        assert p.read_text() == before and js.read_text() == SRC + "// disk\n"
        assert _sync(p, "--check").returncode == 1
        # resolve toward the patch
        assert _sync(p, "--script-from-patch").returncode == 0
        assert js.read_text() == SRC + "// edited in Max\n"


def test_rule_4_resolve_from_disk():
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d)
        js.write_text(SRC + "// disk\n"); os.utime(js, (1, 1))
        m = json.loads(p.read_text())
        for w in m["patcher"]["boxes"]:
            if w["box"].get("text", "").startswith("v8"):
                w["box"]["textfile"]["text"] = SRC + "// max\n"
        p.write_text(json.dumps(m))
        assert _sync(p, "--script-from-disk").returncode == 0
        assert _embedded(p) == SRC + "// disk\n"
        spec = s.extract_spec(json.loads(p.read_text()))
        assert spec["objects"]["v"]["attrs"]["textfile"]["text"] == SRC + "// disk\n"


def test_max_save_that_dropped_the_copy_is_repaired_by_sync():
    # Max 9 writes embed 0 and no text when it saves a box whose .js was present
    with tempfile.TemporaryDirectory() as d:
        p, js = _setup(d)
        m = json.loads(p.read_text())
        for w in m["patcher"]["boxes"]:
            if w["box"].get("text", "").startswith("v8"):
                w["box"]["textfile"] = {"filename": "foo.js", "flags": 0, "embed": 0, "autowatch": 1}
        p.write_text(json.dumps(m))
        r = _sync(p)
        assert r.returncode == 0 and "stored copy was missing" in r.stderr
        m = json.loads(p.read_text())
        box = next(w["box"] for w in m["patcher"]["boxes"] if w["box"].get("text", "").startswith("v8"))
        assert box["textfile"]["embed"] == 1 and box["textfile"]["text"] == SRC
