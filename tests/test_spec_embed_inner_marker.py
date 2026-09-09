"""A spec object whose text quotes the spec markers must still round-trip:
the extractor closes the embed at the LAST end marker, not the first."""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import spec2maxpat as s


def test_inner_markers_do_not_truncate_the_embed():
    stub = f"{s.SPEC_MARKER_BEGIN}\\n{{\\\"name\\\":\\\"x\\\"}}\\n{s.SPEC_MARKER_END}"
    spec = {"objects": {"note": {"type": "comment", "text": f"markers look like {stub}", "pos": [0, 0]},
                        "m": {"type": "newobj", "text": "metro 100", "pos": [0, 40]}},
            "connections": []}
    m = s.convert_spec(spec)
    out = s.extract_spec(m)
    assert set(out["objects"]) == {"note", "m"}
    assert s.SPEC_MARKER_END in out["objects"]["note"]["text"]
