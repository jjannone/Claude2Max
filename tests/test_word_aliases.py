#!/usr/bin/env python3
"""Short object names come from Max's own registry, and only from it.
Run: python3 tests/test_word_aliases.py

A hand table used to map `j` to `join`. Max has no `j` (not in obj-qlookup.json
or init/max-objectmappings.txt, no box in any shipped patch), so the gate
accepted `j 3`, which loads as a red box. Removed 2026-10-04.
"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def test_registry_shorthands_resolve():
    _, db = s.REFPAGE_CACHE.object_db()
    if not db:
        return   # no Max install
    for short, full in {"t": "trigger", "i": "int", "f": "float", "sel": "select",
                        "b": "bangbang", "s": "send", "r": "receive", "v": "value",
                        "del": "delay"}.items():
        assert db.get(short) == full, short


def test_j_is_not_an_object():
    _, db = s.REFPAGE_CACHE.object_db()
    if not db:
        return
    assert "j" not in db
    assert not hasattr(s, "_VERIFIED_WORD_ALIASES")


if __name__ == "__main__":
    for name, fn in sorted(globals().items()):
        if name.startswith("test_"):
            fn(); print("ok", name)
