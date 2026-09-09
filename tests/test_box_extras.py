"""Box-level state Max writes that the spec has no field for (`vst~` snapshot,
parameter_enable, panel gradient keys) travels under the object's `box_extras`
through sync → convert, so convert no longer loses it."""
import copy, os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s

SNAP = {"filetype": "C74Snapshot", "version": 2, "snapshot": {"pluginname": "Podolski.vst3"}}


def _spec():
    return {"objects": {"vst": {"type": "newobj", "text": "vst~", "pos": [10, 10]},
                        "k": {"type": "kslider", "pos": [10, 60], "presentation": [0, 0, 300, 50]},
                        "lbl": {"type": "comment", "text": "keys", "presentation": [0, 54, 100, 20]},
                        "pnl": {"type": "panel", "pos": [10, 200], "presentation": [0, 0, 320, 80],
                                "attrs": {"background": 1}},
                        "sub": {"type": "newobj", "text": "p inner", "pos": [10, 300],
                                "patcher": {"objects": {}, "connections": []}}},
            "connections": []}


def _boxes(m):
    return {w["box"].get("text") or w["box"]["maxclass"]: w["box"] for w in m["patcher"]["boxes"]
            if w["box"].get("id") != "obj-spec-embed"}


def _max_saved(m):
    """What Max adds on save, from a real kslider-restrike.maxpat."""
    b = _boxes(m)
    b["vst~"].update({"snapshot": copy.deepcopy(SNAP), "autosave": 0, "saved_object_attributes": {"parameter_enable": 0}})
    b["kslider"]["parameter_enable"] = 0
    b["panel"].update({"angle": 270.0, "mode": 0, "proportion": 0.5})
    b["p inner"]["saved_object_attributes"] = {"description": "typed in Max", "digest": "", "globalpatchername": "", "tags": "x"}
    return m


def test_max_state_survives_sync_then_convert():
    m = _max_saved(s.convert_spec(_spec()))
    spec, synced = s.sync_spec(m)
    assert spec["objects"]["vst"]["box_extras"]["snapshot"] == SNAP
    assert spec["objects"]["k"]["box_extras"] == {"parameter_enable": 0}
    assert spec["objects"]["pnl"]["box_extras"] == {"angle": 270.0, "mode": 0, "proportion": 0.5}
    assert "attrs" in spec["objects"]["pnl"] and spec["objects"]["pnl"]["attrs"]["background"] == 1
    assert "box_extras" not in spec["objects"]["lbl"]
    b = _boxes(s.convert_spec(spec))
    assert b["vst~"]["snapshot"] == SNAP and b["vst~"]["autosave"] == 0
    assert b["kslider"]["parameter_enable"] == 0
    assert b["panel"]["angle"] == 270.0
    assert b["p inner"]["saved_object_attributes"]["description"] == "typed in Max"


def test_native_patch_keeps_state_too():
    m = _max_saved(s.convert_spec(_spec()))
    m["patcher"]["boxes"] = [w for w in m["patcher"]["boxes"] if w["box"].get("id") != "obj-spec-embed"]
    spec = s.maxpat_to_spec(m)
    vst = next(o for o in spec["objects"].values() if o.get("text") == "vst~")
    assert vst["box_extras"]["snapshot"] == SNAP
    assert _boxes(s.convert_spec(spec))["vst~"]["snapshot"] == SNAP


def test_state_removed_in_max_is_removed_from_spec():
    m = _max_saved(s.convert_spec(_spec()))
    spec, synced = s.sync_spec(m)
    for w in synced["patcher"]["boxes"]:
        w["box"].pop("snapshot", None)
    spec2, _ = s.sync_spec(synced)
    assert "snapshot" not in spec2["objects"]["vst"].get("box_extras", {})


def test_sync_mirrors_saved_ports():
    m = s.convert_spec(_spec())
    b = _boxes(m)
    b["kslider"]["outlettype"] = ["int", "int"]          # what Max saved, not the converter's guess
    b["panel"]["numoutlets"] = 0; b["panel"].pop("outlettype", None)
    spec, _ = s.sync_spec(m)
    assert spec["objects"]["k"]["outlettype"] == ["int", "int"]
    assert spec["objects"]["pnl"]["outlets"] == 0 and spec["objects"]["pnl"]["outlettype"] == []
    b2 = _boxes(s.convert_spec(spec))
    assert b2["kslider"]["outlettype"] == ["int", "int"] and b2["panel"]["outlettype"] == []


def test_derived_keys_never_leak_into_extras():
    m = s.convert_spec(_spec())
    spec, _ = s.sync_spec(m)
    for o in spec["objects"].values():
        assert not (set(o.get("box_extras", {})) & s._BOX_DERIVED_KEYS)
