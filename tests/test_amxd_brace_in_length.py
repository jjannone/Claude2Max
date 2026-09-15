#!/usr/bin/env python3
"""read_patch_file must take a .amxd's patcher from the 'ptch' chunk by its length
field, not by scanning for the first '{': the little-endian u32 length can itself
contain 0x7b ('{'), and the scan then starts inside the header (2026-09-14,
butter_keymap.amxd at 69,243 bytes = 0x10E7B).
Run: python3 tests/test_amxd_brace_in_length.py"""
import json, struct, sys, tempfile, os
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _amxd(patcher_json):
    payload = patcher_json.encode() + b"\0"
    return (b"ampf" + struct.pack("<I", 4) + b"mmmm" + b"meta" + struct.pack("<I", 4) + b"\1\0\0\0"
            + b"ptch" + struct.pack("<I", len(payload)) + payload)


def test_length_byte_is_a_brace():
    # a patcher whose 'ptch' payload is exactly 0x7b bytes long, so the
    # little-endian length field begins with the byte '{'
    body = json.dumps({"patcher": {"boxes": [], "lines": [], "rect": [0, 0, 100, 100], "pad": ""}})
    body = body.replace('"pad": ""', '"pad": "' + "x" * (0x7b - len(body) - 1) + '"')
    raw = _amxd(body)
    assert raw[28:29] == b"{", raw[24:36]
    with tempfile.NamedTemporaryFile("wb", suffix=".amxd", delete=False) as fh:
        fh.write(raw); path = fh.name
    try:
        obj, raw_back = s.read_patch_file(path)
        assert obj["patcher"]["rect"] == [0, 0, 100, 100]
        assert raw_back == raw
        s.write_patch_file(path, obj, raw_back)        # a write keeps the header chunks
        obj2, raw2 = s.read_patch_file(path)
        assert obj2["patcher"]["rect"] == [0, 0, 100, 100] and raw2.startswith(b"ampf")
    finally:
        os.unlink(path)


if __name__ == "__main__":
    test_length_byte_is_a_brace(); print("All tests passed.")
