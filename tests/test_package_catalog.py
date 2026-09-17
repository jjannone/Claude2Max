#!/usr/bin/env python3
"""The package catalog builder and the abstraction extractor. Every package
folder here is temporary; the real Max install and Packages folder are never
read, except where a test says so.
Run: python3 tests/test_package_catalog.py"""
import json, struct, sys, tempfile
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "packages"))
import build_package_catalog as cat
import build_abstraction_objects as absx
from package_schema import validate


def _fat(*cputypes):
    head = struct.pack(">II", 0xCAFEBABE, len(cputypes))
    return head + b"".join(struct.pack(">IIIII", c, 0, 0, 0, 0) for c in cputypes)


def _bundle(root, name, data):
    macos = root / f"{name}.mxo" / "Contents" / "MacOS"
    macos.mkdir(parents=True)
    (macos / name).write_bytes(data)
    return root / f"{name}.mxo"


def test_macho_architectures_are_read_from_the_header():
    assert cat.macho_archs(_fat(0x01000007, 0x0100000C)) == {0x01000007, 0x0100000C}
    thin_intel = struct.pack("<II", 0xFEEDFACF, 0x01000007) + bytes(24)
    assert cat.macho_archs(thin_intel) == {0x01000007}
    assert cat.macho_archs(b"not a binary") == set()


def test_apple_silicon_column_values():
    tmp = Path(tempfile.mkdtemp())
    universal = _bundle(tmp, "uni", _fat(0x01000007, 0x0100000C))
    intel = _bundle(tmp, "old", struct.pack("<II", 0xFEEDFACF, 0x01000007) + bytes(24))
    assert cat.apple_silicon(universal) == "Yes"
    assert cat.apple_silicon(intel) == "No (Intel only)"
    assert cat.apple_silicon(None) == ""
    assert set(cat.mxo_bundles(tmp)) == {"uni", "old"}


def test_name_clashes_ignore_case_and_name_the_other_side():
    clashes = cat.name_clashes(
        {"PkgA": ["Pan~", "metro", "solo"], "PkgB": ["pan~"]},
        {"metro", "t"},
    )
    assert clashes[("PkgA", "Pan~")] == "also pan~ in PkgB"
    assert clashes[("PkgB", "pan~")] == "also Pan~ in PkgA"
    assert clashes[("PkgA", "metro")] == "same name as built-in metro"
    assert ("PkgA", "solo") not in clashes


def test_catalog_entries_are_validated():
    names = ["Spatial audio: panners", "Generative: random walks"]
    good = {"function": "Pans a sound.", "category": "Spatial audio: panners", "usefulness": 3,
            "wraps_builtin": "", "builtin_alternative": "", "superseded_by": "", "comments": ""}
    check = lambda e: cat.validate_entry(e, names)
    assert check(good) == []
    assert check({**good, "crossref": ["Generative: random walks"]}) == []
    assert any("category" in p for p in check({**good, "category": "Panning"}))
    assert any("usefulness" in p for p in check({**good, "usefulness": 6}))
    assert any("missing" in p for p in check({"category": "Spatial audio: panners", "usefulness": 2}))
    assert any("unknown crossref" in p for p in check({**good, "crossref": ["Randomness"]}))
    assert any("repeats" in p for p in check({**good, "crossref": ["Spatial audio: panners"]}))
    assert any("not a list" in p for p in check({**good, "crossref": "Generative: random walks"}))


def test_category_file_is_the_category_list():
    data = json.loads(cat.CATEGORY_FILE.read_text())
    assert data and all(set(c) == {"name", "description"} and c["name"] and c["description"] for c in data)
    assert [c["name"] for c in data] == cat.CATEGORY_NAMES
    assert len(set(cat.CATEGORY_NAMES)) == len(cat.CATEGORY_NAMES)


def test_superseded_and_deprecated_marks():
    current = ({}, {"superseded_by": ""})
    superseded = ({}, {"superseded_by": "pipe"})
    deprecated_no_replacement = ({"deprecated_by": ""}, {"superseded_by": ""})
    both = ({"deprecated_by": "o.route"}, {"superseded_by": "o.route (odot)"})
    assert cat.status_marks(*current) == ("", "")
    assert cat.status_marks(*superseded) == ("SUPERSEDED", "pipe")
    assert cat.status_marks(*deprecated_no_replacement) == ("DEPRECATED", "DEPRECATED")
    assert cat.status_marks(*both) == ("DEPRECATED SUPERSEDED", "o.route (odot)")


def test_check_reports_missing_and_orphan_entries():
    library = {"PkgA": {"one": {}, "two": {}}}
    entry = {"function": "x", "category": "Synthesis", "usefulness": 2, "wraps_builtin": "",
             "builtin_alternative": "", "superseded_by": "", "comments": ""}
    problems = cat.check(library, {"PkgA": {"one": entry, "ghost": entry}}, ["PkgA"], ["Synthesis"])
    assert problems == ["PkgA / two: no catalog entry",
                        "PkgA / ghost: catalog entry for an object not in the library"], problems


def _patch(boxes):
    return json.dumps({"patcher": {"boxes": [{"box": b} for b in boxes]}})


def test_abstraction_extractor_keeps_modules_and_skips_demos():
    pkg = Path(tempfile.mkdtemp()) / "Pkg"
    (pkg / "patchers").mkdir(parents=True)
    (pkg / "patchers" / "fx.chorus~.maxpat").write_text(_patch([
        {"maxclass": "inlet"}, {"maxclass": "inlet"}, {"maxclass": "outlet"},
        {"maxclass": "newobj", "text": "abl.dsp.chorus~"},
        {"maxclass": "comment", "text": "Stereo chorus built on Ableton's DSP"},
    ]))
    (pkg / "patchers" / "demo.maxpat").write_text(_patch([{"maxclass": "newobj", "text": "metro 100"}]))
    (pkg / "patchers" / "Pkg Overview.maxpat").write_text(_patch([{"maxclass": "inlet"}]))
    (pkg / "patchers" / "scripted~.maxpat").write_text(_patch([{"maxclass": "newobj", "text": "js wrap.js #1"}]))
    objects = absx.extract_package(pkg)
    assert set(objects) == {"fx.chorus~", "scripted~"}, set(objects)
    chorus = objects["fx.chorus~"]
    assert (chorus["numinlets"], chorus["numoutlets"]) == (2, 1)
    assert chorus["_inner"] == ["abl.dsp.chorus~"]
    assert chorus["digest"] == "Stereo chorus built on Ableton's DSP"
    assert (objects["scripted~"]["numinlets"], objects["scripted~"]["numoutlets"]) == (0, 0)


def test_abstraction_merge_never_overwrites_a_documented_record():
    refpage_record = {"digest": "from the refpage", "numinlets": 1, "numoutlets": 1, "outlettype": [""],
                      "kind": "abstraction", "tags": [], "source": "refpage", "use_when": "curated"}
    existing = {"Pkg": {"doc~": dict(refpage_record)}}
    new = {"doc~": {"digest": "from the patch", "numinlets": 0, "numoutlets": 0, "outlettype": [],
                    "kind": "abstraction", "tags": [], "source": "abstraction", "use_when": ""},
           "new~": {"digest": "new", "numinlets": 1, "numoutlets": 1, "outlettype": [],
                    "kind": "abstraction", "tags": [], "source": "abstraction", "use_when": "",
                    "_inner": ["cycle~"], "_paths": ["patchers/new~.maxpat"]}}
    absx.merge_into(existing, "Pkg", new)
    assert existing["Pkg"]["doc~"] == refpage_record
    assert "_inner" not in existing["Pkg"]["new~"]
    assert validate(existing["Pkg"]["new~"]) == []


def test_every_extractor_skips_removed_names():
    import package_schema, build_package_objects, build_helpfile_objects
    removed = Path(tempfile.mkdtemp()) / "removed_records.json"
    removed.write_text(json.dumps({"Pkg": {"ghost": "refpage with no object behind it"}}))
    saved = package_schema.REMOVED_RECORDS
    package_schema.REMOVED_RECORDS = removed
    try:
        for module in (build_package_objects, build_helpfile_objects, absx):
            record = {"digest": "d", "numinlets": 1, "numoutlets": 1, "outlettype": [""],
                      "kind": "external", "tags": [], "source": "refpage", "use_when": ""}
            existing = {}
            module.merge_into(existing, "Pkg", {"ghost": dict(record), "real": dict(record)})
            assert set(existing["Pkg"]) == {"real"}, (module.__name__, existing)
    finally:
        package_schema.REMOVED_RECORDS = saved
    assert package_schema.removed_names("Pkg", removed) == {"ghost"}
    assert package_schema.removed_names("Other", removed) == set()


if __name__ == "__main__":
    for fn in [v for k, v in dict(globals()).items() if k.startswith("test_")]:
        fn()
    print("All tests passed.")
