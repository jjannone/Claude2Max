"""Patcher-level `snapshot` / `parameters` survive sync → convert (see
`_PATCHER_PASSTHROUGH` in spec2maxpat.py)."""
import copy, json, os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s2m

SNAP = {"filetype": "C74Snapshot", "version": 2, "snapshot": {"valuedictionary": {"parameter_values": {"Mix": 100.0}}}}
PARAMS = {"obj-1::obj-2": ["Mix", "Mix", 0]}


def _built():
    spec = {"objects": {"g": {"type": "live.gain~", "presentation": [0, 0, 100, 40]},
                        "lbl": {"type": "comment", "text": "gain", "presentation": [0, 44, 100, 20]},
                        "pnl": {"type": "panel", "presentation": [0, 0, 120, 80], "attrs": {"background": 1}}},
            "connections": [], "bglocked": 1}
    return s2m.convert_spec(spec)


def test_extras_round_trip_through_sync_and_convert():
    mp = _built()
    mp["patcher"]["snapshot"] = copy.deepcopy(SNAP)
    mp["patcher"]["parameters"] = copy.deepcopy(PARAMS)
    _, synced = s2m.sync_spec(mp)                   # what `sync -i` does
    spec = s2m.extract_spec(synced)
    assert spec["patcher_extras"]["snapshot"] == SNAP
    assert spec["patcher_extras"]["parameters"] == PARAMS
    rebuilt = s2m.convert_spec(spec)                 # what `convert` does
    assert rebuilt["patcher"]["snapshot"] == SNAP
    assert rebuilt["patcher"]["parameters"] == PARAMS


def test_no_extras_when_patcher_has_none():
    mp = _built()
    spec = s2m.extract_spec(s2m.sync_spec(mp)[1])
    assert "patcher_extras" not in spec
    assert "snapshot" not in s2m.convert_spec(spec)["patcher"]


def test_extras_removed_when_operator_deletes_them():
    mp = _built()
    mp["patcher"]["snapshot"] = copy.deepcopy(SNAP)
    spec = s2m.extract_spec(s2m.sync_spec(mp)[1])
    assert "snapshot" in spec["patcher_extras"]
    mp2 = s2m.convert_spec(spec)
    del mp2["patcher"]["snapshot"]                   # operator removed the snapshot in Max
    spec2 = s2m.extract_spec(s2m.sync_spec(mp2)[1])
    assert "patcher_extras" not in spec2
