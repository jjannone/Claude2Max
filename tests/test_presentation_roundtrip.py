"""
Regression test — sync/convert must preserve a manually-resized presented
box end-to-end. Documents the two bugs fixed alongside this file:

  Bug 1 (reconcile_spec): live presentation_rect / patching_rect changes
  were silently dropped from the embedded spec on sync.

  Bug 2 (build_box): obj["presentation_rect"] as a sibling spec field was
  ignored — only obj["presentation"] was read.

Run: python3 tests/test_presentation_roundtrip.py
Exits non-zero on any failed assertion.
"""

import copy
import json
import os
import sys

# Import spec2maxpat from the repo root regardless of cwd.
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, ROOT)

import spec2maxpat as s2m


def _find_box(maxpat, predicate):
    """Return the first box dict matching predicate, or None."""
    for wrapper in maxpat.get("patcher", {}).get("boxes", []):
        box = wrapper.get("box", {})
        if predicate(box):
            return box
    return None


def _build_initial_spec():
    """Spec with one presented control + label so the patch has presentation data."""
    return {
        "name": "presentation-roundtrip-fixture",
        "width": 600,
        "height": 400,
        "objects": {
            "TOG": {
                "type": "toggle",
                "pos": [30, 30],
                "presentation": [20, 20, 40, 40],
            },
            "LBL": {
                "type": "comment",
                "text": "tog",
                "pos": [80, 30],
                "presentation": [70, 25, 100, 22],
            },
        },
        "connections": [],
    }


def test_presentation_rect_sibling_field():
    """build_box accepts presentation_rect as a sibling field; it wins over presentation."""
    spec = _build_initial_spec()
    spec["objects"]["TOG"]["presentation_rect"] = [200, 100, 80, 80]
    # legacy presentation still present — sibling should win
    maxpat = s2m.convert_spec(spec)

    tog = _find_box(maxpat, lambda b: b.get("maxclass") == "toggle")
    assert tog is not None, "toggle missing from converted patch"
    assert tog.get("presentation") == 1, "presentation flag not set"
    assert tog["presentation_rect"] == [200.0, 100.0, 80.0, 80.0], (
        f"sibling presentation_rect should win — got {tog.get('presentation_rect')}"
    )
    print("PASS  build_box accepts sibling presentation_rect")


def test_sync_preserves_live_presentation_rect():
    """A live resize of a presented box survives sync → extract."""
    spec = _build_initial_spec()
    maxpat = s2m.convert_spec(spec)

    # Simulate a manual resize in Max: change the live toggle's presentation_rect.
    new_rect = [300.0, 150.0, 120.0, 120.0]
    tog = _find_box(maxpat, lambda b: b.get("maxclass") == "toggle")
    assert tog is not None
    tog["presentation_rect"] = new_rect

    # Sync: should fold the live rect back into the embedded spec.
    new_spec, new_maxpat = s2m.sync_spec(maxpat)
    assert new_spec["objects"]["TOG"]["presentation"] == [300, 150, 120, 120], (
        f"reconcile_spec did not capture live presentation_rect — "
        f"got {new_spec['objects']['TOG'].get('presentation')}"
    )
    print("PASS  sync folds live presentation_rect into embedded spec")


def test_sync_preserves_live_patching_size():
    """A live resize of patching_rect (w/h) survives sync."""
    spec = _build_initial_spec()
    maxpat = s2m.convert_spec(spec)

    # Resize the toggle's patching_rect.
    tog = _find_box(maxpat, lambda b: b.get("maxclass") == "toggle")
    assert tog is not None
    old_rect = tog["patching_rect"]
    tog["patching_rect"] = [old_rect[0], old_rect[1], 60.0, 60.0]

    new_spec, _ = s2m.sync_spec(maxpat)
    assert new_spec["objects"]["TOG"].get("size") == [60, 60], (
        f"reconcile_spec did not capture live patching_rect size — "
        f"got {new_spec['objects']['TOG'].get('size')}"
    )
    print("PASS  sync folds live patching_rect size into embedded spec")


def test_end_to_end_resize_survives_full_cycle():
    """
    The full Modify-Don't-Rebuild loop:
      convert → user resizes box → sync → extract → convert → check rect is
      still the resized value (not the original).
    """
    spec = _build_initial_spec()
    maxpat = s2m.convert_spec(spec)

    # Round 1: user resizes a presented box in Max.
    tog = _find_box(maxpat, lambda b: b.get("maxclass") == "toggle")
    tog["presentation_rect"] = [400.0, 200.0, 150.0, 150.0]
    tog["patching_rect"] = [tog["patching_rect"][0], tog["patching_rect"][1], 60.0, 60.0]

    # Sync captures the live state.
    synced_spec, synced_maxpat = s2m.sync_spec(maxpat)

    # Round 2: extract spec, convert again — must produce the resized rect.
    extracted = s2m.extract_spec(synced_maxpat)
    assert extracted is not None, "spec embed missing after sync"
    rebuilt = s2m.convert_spec(extracted)

    rebuilt_tog = _find_box(rebuilt, lambda b: b.get("maxclass") == "toggle")
    assert rebuilt_tog is not None
    assert rebuilt_tog.get("presentation") == 1
    assert rebuilt_tog["presentation_rect"] == [400.0, 200.0, 150.0, 150.0], (
        f"end-to-end roundtrip dropped the live resize — "
        f"got {rebuilt_tog.get('presentation_rect')}"
    )
    print("PASS  end-to-end convert→resize→sync→extract→convert preserves rect")


def main():
    test_presentation_rect_sibling_field()
    test_sync_preserves_live_presentation_rect()
    test_sync_preserves_live_patching_size()
    test_end_to_end_resize_survives_full_cycle()
    print("\nAll tests passed.")


if __name__ == "__main__":
    main()
