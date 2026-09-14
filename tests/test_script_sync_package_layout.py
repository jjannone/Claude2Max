#!/usr/bin/env python3
"""sync must find a device's script in the package's javascript/ folder beside
devices/, not write a second copy next to the device.
Run: python3 tests/test_script_sync_package_layout.py"""
import os, sys, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def test_parent_javascript_folder_is_found():
    root = Path(tempfile.mkdtemp())
    (root / "javascript").mkdir(); (root / "devices").mkdir()
    (root / "javascript" / "engine.js").write_text("inlets = 1; outlets = 1;\n")
    spec = {"objects": {"e": {"type": "newobj", "text": "v8 engine.js @embed 1", "pos": [30, 30],
                              "inlets": 1, "outlets": 1, "outlettype": [""]}}, "connections": []}
    m = s.convert_spec(spec, script_dirs=[root / "javascript"]) if "script_dirs" in s.convert_spec.__code__.co_varnames else s.convert_spec(spec)
    patch = root / "devices" / "d.maxpat"
    import json; patch.write_text(json.dumps(m))
    recs = s.reconcile_scripts(m, patch)
    assert recs and recs[0]["file"].endswith(os.path.join("javascript", "engine.js")), recs
    assert not (root / "devices" / "engine.js").exists(), "a second copy was written beside the device"


if __name__ == "__main__":
    test_parent_javascript_folder_is_found(); print("All tests passed.")
