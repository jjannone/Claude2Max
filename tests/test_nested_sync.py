"""Edits made inside a `p` subpatcher in Max are captured by sync (and a patch
that arrives with subpatchers gets nested sub-specs). Before 2026-09-13 the
staleness check saw such edits but reconcile kept the old sub-spec."""
import copy, os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s2m


def _spec():
    return {"objects": {"sub": {"type": "newobj", "text": 'p "1 One"', "pos": [50, 50],
                                "inlets": 0, "outlets": 0, "outlettype": [],
                                "patcher": {"objects": {"c": {"type": "comment", "text": "hi", "pos": [10, 10]},
                                                        "kb": {"type": "kslider", "pos": [10, 60], "size": [336, 53]}},
                                            "connections": [], "patcher_extras": {"showontab": 1}}}},
            "connections": [], "patcher_extras": {"showontab": 0, "showrootpatcherontab": 0}}


def _sub(mp):
    return [b["box"] for b in mp["patcher"]["boxes"] if b["box"].get("text") == 'p "1 One"'][0]["patcher"]


def _add_attrui_in_max(sub):
    kb = [b["box"] for b in sub["boxes"] if b["box"]["maxclass"] == "kslider"][0]
    sub["boxes"].append({"box": {"id": "obj-99", "maxclass": "attrui", "attr": "mode", "numinlets": 1,
                                 "numoutlets": 1, "outlettype": [""], "patching_rect": [400.0, 60.0, 169.0, 22.0],
                                 "text_width": 63.0}})
    sub["lines"].append({"patchline": {"source": ["obj-99", 0], "destination": [kb["id"], 0]}})


def test_edit_inside_p_subpatcher_is_captured_by_sync():
    mp = s2m.convert_spec(_spec())
    _add_attrui_in_max(_sub(mp))
    spec, synced = s2m.sync_spec(mp)
    subspec = spec["objects"]["sub"]["patcher"]
    attruis = [k for k, o in subspec["objects"].items() if o.get("type") == "attrui"]
    assert len(attruis) == 1
    assert subspec["connections"] == [[attruis[0], 0, "kb", 0]]
    assert subspec["patcher_extras"]["showontab"] == 1          # nested extras mirrored
    assert subspec["objects"]["kb"]["type"] == "kslider"          # existing entry kept by id
    assert s2m.spec_matches_patch(synced)["matches"]
    rebuilt = s2m.convert_spec(spec)                              # the edit survives a convert
    rsub = _sub(rebuilt)
    assert any(b["box"]["maxclass"] == "attrui" for b in rsub["boxes"])
    assert len(rsub["lines"]) == 1 and rsub.get("showontab") == 1


def test_patch_with_subpatchers_and_no_spec_gets_nested_subspecs():
    mp = s2m.convert_spec(_spec())
    mp["patcher"]["boxes"] = [b for b in mp["patcher"]["boxes"] if b["box"].get("id") != "obj-spec-embed"]
    spec = s2m.maxpat_to_spec(mp)
    p_objs = [o for o in spec["objects"].values() if o.get("type") == "newobj" and o.get("text", "").startswith("p ")]
    assert len(p_objs) == 1
    nested = p_objs[0]["patcher"]
    assert {o["type"] for o in nested["objects"].values()} == {"comment", "kslider"}
    assert nested["patcher_extras"]["showontab"] == 1


def test_deleting_a_box_inside_the_subpatcher_is_captured():
    mp = s2m.convert_spec(_spec())
    sub = _sub(mp)
    sub["boxes"] = [b for b in sub["boxes"] if b["box"]["maxclass"] != "comment"]
    spec, synced = s2m.sync_spec(mp)
    assert "c" not in spec["objects"]["sub"]["patcher"]["objects"]
    assert s2m.spec_matches_patch(synced)["matches"]
