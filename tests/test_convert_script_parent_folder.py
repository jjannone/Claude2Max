#!/usr/bin/env python3
"""convert must find a shared script one folder up from the output patch, as sync
does, so patches in sibling folders (patches/shootouts/audio/ and video/) share
one copy of it instead of each needing its own.
Run: python3 tests/test_convert_script_parent_folder.py"""
import json, subprocess, sys, tempfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
SOURCE = "inlets = 1;\noutlets = 1;\nfunction msg_int(v) { outlet(0, v + 1); }\n"


def test_convert_embeds_a_script_from_the_parent_folder():
    root = Path(tempfile.mkdtemp())
    (root / "shared.js").write_text(SOURCE)
    (root / "video").mkdir()
    spec_dir = Path(tempfile.mkdtemp())          # the spec lives somewhere else, as the builders' do
    spec = {"objects": {"h": {"type": "newobj", "text": "v8 shared.js @embed 1", "pos": [30, 30],
                              "inlets": 1, "outlets": 1, "outlettype": [""]}}, "connections": []}
    (spec_dir / "s.json").write_text(json.dumps(spec))
    out = root / "video" / "p.maxpat"
    r = subprocess.run([sys.executable, str(REPO / "spec2maxpat.py"), "convert", "-i", str(spec_dir / "s.json"),
                        "-o", str(out), "--no-verify"], capture_output=True, text=True)
    assert r.returncode == 0, r.stderr
    boxes = [b["box"] for b in json.loads(out.read_text())["patcher"]["boxes"]]
    v8 = [b for b in boxes if b.get("text", "").startswith("v8 shared.js")]
    assert v8 and v8[0].get("textfile", {}).get("text") == SOURCE, "the parent folder's script was not embedded"
    assert not (root / "video" / "shared.js").exists(), "a second copy was written beside the patch"


if __name__ == "__main__":
    test_convert_embeds_a_script_from_the_parent_folder(); print("All tests passed.")
