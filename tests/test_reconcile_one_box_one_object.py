"""reconcile_spec: a box matches at most one spec object, so stale spec entries
stacked at a live box's position are dropped on sync instead of kept forever."""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s


def test_stale_entries_at_same_position_are_pruned():
    spec = {"objects": {"lbl": {"type": "comment", "text": "live", "pos": [10, 10]}},
            "connections": []}
    m = s.convert_spec(spec)
    stale = dict(spec)
    stale["objects"] = dict(spec["objects"])
    for i in range(5):   # annotations that were stripped from the patch but not the spec
        stale["objects"][f"tut-ann-{i}"] = {"type": "comment", "text": f"gone {i}", "pos": [10, 10]}
    out = s.reconcile_spec(stale, m)
    assert set(out["objects"]) == {"lbl"}
    assert out["objects"]["lbl"]["text"] == "live"
