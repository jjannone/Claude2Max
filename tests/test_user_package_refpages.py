#!/usr/bin/env python3
"""RefpageCache must find refpages and registry entries in user package folders
(~/Documents/Max 9/Packages), following symlinks, with built-in C74 packages
winning a name clash. Every folder here is temporary: the real home folder and
the real Max install are never consulted.
Run: python3 tests/test_user_package_refpages.py"""
import json, sys, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _refpage(name, inlets, outlets):
    ins = "".join(f'<inlet id="{i}" type="INLET_TYPE"/>' for i in range(inlets))
    outs = "".join(f'<outlet id="{i}" type="int"/>' for i in range(outlets))
    return (f'<?xml version="1.0"?><c74object name="{name}">'
            f'<digest>test object</digest><inletlist>{ins}</inletlist>'
            f'<outletlist>{outs}</outletlist></c74object>')


def _cache(tmp):
    """A cache whose C74 install and user packages both live under tmp."""
    c74 = tmp / "C74"
    (c74 / "docs" / "refpages" / "max-ref").mkdir(parents=True)
    (c74 / "packages").mkdir()
    users = tmp / "UserPackages"
    users.mkdir()
    cache = s.RefpageCache(user_packages=users)
    cache._c74 = c74   # isolate from the real Max install
    return cache, c74, users


def test_user_package_refpage_found_through_symlink():
    tmp = Path(tempfile.mkdtemp())
    cache, _c74, users = _cache(tmp)
    # The package lives elsewhere and is linked in, the way Butter_tools is.
    real = tmp / "checkout" / "MyPkg"
    (real / "docs").mkdir(parents=True)
    (real / "docs" / "ztest.maxref.xml").write_text(_refpage("ztest", 2, 4))
    (users / "MyPkg").symlink_to(real, target_is_directory=True)

    r = cache.lookup("ztest")
    assert r is not None, cache.search_roots()
    assert (r["numinlets"], r["numoutlets"]) == (2, 4), r
    assert r["outlettype"] == ["", "", "", ""], r


def test_nested_domain_folder_in_user_package():
    tmp = Path(tempfile.mkdtemp())
    cache, _c74, users = _cache(tmp)
    d = users / "NestPkg" / "docs" / "refpages" / "nest_ref"
    d.mkdir(parents=True)
    (d / "znest.maxref.xml").write_text(_refpage("znest", 3, 1))
    r = cache.lookup("znest")
    assert r is not None and (r["numinlets"], r["numoutlets"]) == (3, 1), r


def test_builtin_package_wins_name_clash():
    tmp = Path(tempfile.mkdtemp())
    cache, c74, users = _cache(tmp)
    (c74 / "packages" / "Builtin" / "docs").mkdir(parents=True)
    (c74 / "packages" / "Builtin" / "docs" / "clash.maxref.xml").write_text(_refpage("clash", 1, 1))
    (users / "AAA" / "docs").mkdir(parents=True)   # sorts first, still loses
    (users / "AAA" / "docs" / "clash.maxref.xml").write_text(_refpage("clash", 5, 5))
    r = cache.lookup("clash")
    assert (r["numinlets"], r["numoutlets"]) == (1, 1), r


def test_user_package_registry_is_read():
    tmp = Path(tempfile.mkdtemp())
    cache, _c74, users = _cache(tmp)
    iface = users / "RegPkg" / "interfaces"
    iface.mkdir(parents=True)
    (iface / "obj-qlookup.json").write_text(json.dumps({"zreal": {}, "zr": {"alias": "zreal"}}))
    (iface / "max.db.json").write_text(json.dumps({"maxdb": {"aliases": {"zshort": "zreal"}}}))
    names, aliases = cache.object_db()
    assert {"zreal", "zr", "zshort"} <= names, names
    assert aliases.get("zr") == "zreal" and aliases.get("zshort") == "zreal", aliases


def test_missing_user_root_is_reported_not_silent():
    tmp = Path(tempfile.mkdtemp())
    cache = s.RefpageCache(user_packages=tmp / "does-not-exist")
    cache._c74 = None
    assert cache.lookup("anything") is None
    roots = cache.search_roots()
    assert roots["user_packages_missing"] == [str(tmp / "does-not-exist")], roots
    assert "does-not-exist" in cache.describe("anything")


if __name__ == "__main__":
    for fn in [v for k, v in dict(globals()).items() if k.startswith("test_")]:
        fn()
    print("All tests passed.")
