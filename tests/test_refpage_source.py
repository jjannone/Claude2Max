#!/usr/bin/env python3
"""A refpage found in a user package is labelled as one, not as part of Max.
Run: python3 tests/test_refpage_source.py

Since RefpageCache started searching ~/Documents/Max 9/Packages, every hit was
still reported as "c74-refpage", so odot's o.route looked like a Max built-in
(found 2026-09-16). The label now follows where the file was found.
"""
import os
import sys
import tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s

_REFPAGE = """<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<c74object name="zz_sourcetest">
    <digest>Test object</digest>
    <inletlist><inlet id="0" type="INLET_TYPE"><digest>in</digest></inlet></inletlist>
    <outletlist><outlet id="0" type="OUTLET_TYPE"><digest>out</digest></outlet></outletlist>
</c74object>
"""


def _with_user_package(fn, link=False):
    with tempfile.TemporaryDirectory() as d:
        real = Path(d) / "real_pkg"
        (real / "docs").mkdir(parents=True)
        (real / "docs" / "zz_sourcetest.maxref.xml").write_text(_REFPAGE)
        root = Path(d) / "Packages"
        root.mkdir()
        if link:
            os.symlink(real, root / "zz_pkg")        # how Butter_tools is installed
        else:
            os.rename(real, root / "zz_pkg")
        return fn(s.RefpageCache(user_packages=root))


def test_user_package_refpage_is_labelled_as_such():
    for link in (False, True):
        src = _with_user_package(lambda rc: rc.refpage_source("zz_sourcetest"), link=link)
        assert src == "user-package-refpage", (link, src)


def test_resolver_carries_the_label():
    def run(rc):
        r = s._GateResolver(rc, s.PACKAGE_OBJECTS_CACHE, [])
        return r.resolve_object("zz_sourcetest")
    hit = _with_user_package(run)
    assert hit and hit["source"] == "user-package-refpage", hit


def test_max_objects_keep_the_c74_label():
    if s.REFPAGE_CACHE._c74 is None:
        return
    assert _with_user_package(lambda rc: rc.refpage_source("metro")) == "c74-refpage"
    assert s.REFPAGE_CACHE.refpage_source("no_such_object_zz") is None


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
