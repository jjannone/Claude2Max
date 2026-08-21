"""
Regression test — extract_spec must pick the canonical spec-embed box, and must
refuse a corrupt one rather than hand back something partial.

The defect this documents: extract_spec returned the FIRST box carrying
'--- CLAUDE2MAX SPEC ---', checking neither id nor maxclass. In
patches/4step-sequencer.maxpat a stray newobj (obj-22) holding a 27-character
stub spec sorts before the real obj-spec-embed, so the patch reported zero
objects. Because convert writes whatever spec it is given, converting from that
stub would have emitted a near-empty patch and erased all 24 boxes — silently.

Run: python3 tests/test_spec_embed_discriminator.py
Exits non-zero on any failed assertion.
"""

import io
import json
import os
import sys

# Import spec2maxpat from the repo root regardless of cwd.
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)

import spec2maxpat as s2m


def _embed_text(spec):
    return f"{s2m.SPEC_MARKER_BEGIN}\n{json.dumps(spec)}\n{s2m.SPEC_MARKER_END}"


def _maxpat(*boxes):
    return {"patcher": {"boxes": [{"box": b} for b in boxes]}}


REAL = {"name": "real-spec", "objects": {"obj-1": {"type": "newobj", "text": "metro 500"}}}
STUB = {"name": "decoy-stub"}


def _decoy_newobj():
    """A stray newobj carrying the marker in its `text` — the 4step obj-22 shape."""
    return {"id": "obj-22", "maxclass": "newobj", "text": _embed_text(STUB)}


def _real_embed():
    return {"id": "obj-spec-embed", "maxclass": "text.codebox", "code": _embed_text(REAL)}


def test_canonical_id_wins_over_earlier_decoy():
    got = s2m.extract_spec(_maxpat(_decoy_newobj(), _real_embed()), stream=None)
    assert got == REAL, f"decoy shadowed the real embed — got {got}"
    print("PASS  canonical obj-spec-embed wins even when a decoy sorts first")


def test_maxclass_fallback_when_id_was_renamed():
    """A hand-renamed embed still wins on maxclass — the second discriminator."""
    renamed = dict(_real_embed(), id="obj-99")
    got = s2m.extract_spec(_maxpat(_decoy_newobj(), renamed), stream=None)
    assert got == REAL, f"text.codebox fallback did not fire — got {got}"
    print("PASS  text.codebox maxclass wins when the canonical id is absent")


def test_multiple_candidates_are_reported():
    buf = io.StringIO()
    s2m.extract_spec(_maxpat(_decoy_newobj(), _real_embed()), stream=buf)
    out = buf.getvalue()
    assert "2 boxes carry" in out, f"multi-candidate warning missing — got {out!r}"
    assert "obj-22" in out, f"ignored candidate not named — got {out!r}"
    assert "obj-spec-embed" in out, f"chosen candidate not named — got {out!r}"
    print("PASS  more than one marker-bearing box is reported, not chosen quietly")


def test_single_candidate_is_silent():
    buf = io.StringIO()
    got = s2m.extract_spec(_maxpat(_real_embed()), stream=buf)
    assert got == REAL
    assert buf.getvalue() == "", f"unexpected chatter on a clean patch: {buf.getvalue()!r}"
    print("PASS  the ordinary one-embed case stays silent")


def test_no_embed_returns_none():
    plain = {"id": "obj-1", "maxclass": "newobj", "text": "metro 500"}
    assert s2m.extract_spec(_maxpat(plain), stream=None) is None
    print("PASS  a patch with no embed still returns None")


def test_corrupt_embed_raises_rather_than_falling_back():
    """The 4step failure mode: canonical embed truncated mid-JSON.

    Falling through to the decoy would 'succeed' and then destroy the patch.
    """
    truncated = json.dumps(REAL)[: len(json.dumps(REAL)) // 2]
    corrupt = {
        "id": "obj-spec-embed",
        "maxclass": "text.codebox",
        "code": f"{s2m.SPEC_MARKER_BEGIN}\n{truncated}\n{s2m.SPEC_MARKER_END}",
    }
    try:
        s2m.extract_spec(_maxpat(_decoy_newobj(), corrupt), stream=None)
    except s2m.SpecEmbedError as exc:
        assert "obj-spec-embed" in str(exc), f"error does not name the box — {exc}"
        print("PASS  a corrupt canonical embed raises instead of yielding the decoy")
        return
    raise AssertionError("corrupt embed did not raise SpecEmbedError")


def test_missing_end_marker_raises():
    unterminated = {
        "id": "obj-spec-embed",
        "maxclass": "text.codebox",
        "code": f"{s2m.SPEC_MARKER_BEGIN}\n{json.dumps(REAL)}",
    }
    try:
        s2m.extract_spec(_maxpat(unterminated), stream=None)
    except s2m.SpecEmbedError as exc:
        assert s2m.SPEC_MARKER_END in str(exc)
        print("PASS  a missing END marker raises instead of throwing ValueError")
        return
    raise AssertionError("unterminated embed did not raise SpecEmbedError")


def test_verify_patch_file_degrades_on_corrupt_embed(tmp_name="_corrupt_fixture.maxpat"):
    """verify_patch_file must fall back to the boxes, not crash the gate."""
    import tempfile

    corrupt = {
        "id": "obj-spec-embed",
        "maxclass": "text.codebox",
        "code": f"{s2m.SPEC_MARKER_BEGIN}\n{{\"name\": \"x\"\n{s2m.SPEC_MARKER_END}",
    }
    real_box = {"id": "obj-1", "maxclass": "newobj", "text": "metro 500",
                "patching_rect": [10.0, 10.0, 80.0, 22.0]}
    with tempfile.TemporaryDirectory() as d:
        path = os.path.join(d, tmp_name)
        with open(path, "w") as f:
            json.dump(_maxpat(real_box, corrupt), f)
        buf = io.StringIO()
        result = s2m.verify_patch_file(path, stream=buf)
    assert result["mode"] == "native-scopes", (
        f"expected fallback to box-level checking, got mode={result['mode']}")
    assert "[spec] WARNING" in buf.getvalue(), "corrupt embed was not reported"
    print("PASS  verify_patch_file reports the corrupt embed and checks the boxes")


def main():
    test_canonical_id_wins_over_earlier_decoy()
    test_maxclass_fallback_when_id_was_renamed()
    test_multiple_candidates_are_reported()
    test_single_candidate_is_silent()
    test_no_embed_returns_none()
    test_corrupt_embed_raises_rather_than_falling_back()
    test_missing_end_marker_raises()
    test_verify_patch_file_degrades_on_corrupt_embed()
    print("\nAll tests passed.")


if __name__ == "__main__":
    main()
