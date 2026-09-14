#!/usr/bin/env python3
"""write_patch_file must give a .amxd back with every header chunk intact and only
the 'ptch' payload replaced — Live's device wrapper is 'ampf' + type, 'meta',
'ptch' (JSON + NUL). Run: python3 tests/test_amxd_roundtrip.py"""
import json, struct, sys, tempfile, os
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import spec2maxpat as s


def _amxd(patcher):
    body = json.dumps({"patcher": patcher}).encode() + b"\0"
    return (b"ampf" + struct.pack("<I", 4) + b"mmmm"
            + b"meta" + struct.pack("<I", 4) + struct.pack("<I", 1)
            + b"ptch" + struct.pack("<I", len(body)) + body)


def test_roundtrip():
    raw = _amxd({"boxes": [], "lines": [], "rect": [0, 0, 100, 100]})
    d = tempfile.mkdtemp(); p = os.path.join(d, "x.amxd")
    open(p, "wb").write(raw)
    m, raw_in = s.read_patch_file(p)
    assert raw_in == raw and m["patcher"]["rect"] == [0, 0, 100, 100]
    m["patcher"]["boxes"].append({"box": {"id": "obj-1", "maxclass": "newobj", "text": "midiin",
                                          "numinlets": 1, "numoutlets": 1, "outlettype": [""],
                                          "patching_rect": [10, 10, 50, 22]}})
    s.write_patch_file(p, m, raw_in)
    out = open(p, "rb").read()
    chunks = s._amxd_chunks(out)
    assert [t for t, _ in chunks] == [b"ampf", b"meta", b"ptch"], chunks
    assert chunks[0][1] == b"mmmm" and chunks[1][1] == struct.pack("<I", 1)
    assert chunks[2][1].endswith(b"\0")
    assert struct.unpack("<I", out[out.find(b"ptch") + 4:out.find(b"ptch") + 8])[0] == len(chunks[2][1])
    m2, _ = s.read_patch_file(p)
    assert m2["patcher"]["boxes"][0]["box"]["text"] == "midiin"
    # a plain .maxpat path writes plain JSON
    p2 = os.path.join(d, "y.maxpat"); s.write_patch_file(p2, m2, None)
    assert open(p2, "rb").read().startswith(b"{")


if __name__ == "__main__":
    test_roundtrip(); print("All tests passed.")
