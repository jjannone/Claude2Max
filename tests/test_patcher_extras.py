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


def test_tab_keys_pass_through_on_root_and_subpatcher():
    """Max's patcher-window tabs: `showontab` on a `p` sub-spec, and the root's
    `showrootpatcherontab`, are written by convert and mirrored by sync."""
    spec = {"objects": {"tab1": {"type": "newobj", "text": 'p "1 One"', "pos": [50, 50],
                                 "patcher": {"objects": {"c": {"type": "comment", "text": "hi", "pos": [10, 10]}},
                                             "connections": [], "patcher_extras": {"showontab": 1}}}},
            "connections": [], "patcher_extras": {"showontab": 0, "showrootpatcherontab": 0}}
    mp = s2m.convert_spec(spec)
    root = mp["patcher"]
    assert root["showrootpatcherontab"] == 0 and root["showontab"] == 0
    sub = [b["box"] for b in root["boxes"] if b["box"].get("text") == 'p "1 One"'][0]["patcher"]
    assert sub["showontab"] == 1
    synced = s2m.extract_spec(s2m.sync_spec(mp)[1])
    assert synced["patcher_extras"]["showrootpatcherontab"] == 0
    assert s2m.convert_spec(synced)["patcher"]["showrootpatcherontab"] == 0
