#!/usr/bin/env python3
"""Measure the drawn height of each butter_comment block, with the object's own
parser, so the patch reserves the space the text actually needs.

Needs node and the Butter_tools package.  Writes tools/waveform_reference_notes_h.json.
Re-run it whenever the text in waveform_reference_notes.py changes.

    python3 tools/measure_butter_notes.py [Butter_tools path] [width]
"""
import json
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "waveform_reference_notes_h.json")
PREVIEW = os.path.join(HERE, "butter_preview.js")

sys.path.insert(0, HERE)
import waveform_reference_notes as N          # noqa: E402
import waveform_reference_builder as B        # noqa: E402

# The builder lays the blocks out at this width, so measuring at any other one
# reserves the wrong height.  Taken from the builder rather than repeated here:
# a default typed twice is a default that drifts.
DEFAULT_WIDTH = B.WIN_W - 60


def main():
    pkg = sys.argv[1] if len(sys.argv) > 1 else os.path.expanduser(
        "~/Documents/Max 9/Packages/Butter_tools")
    width = int(sys.argv[2]) if len(sys.argv) > 2 else DEFAULT_WIDTH
    heights = {}
    with tempfile.TemporaryDirectory() as tmp:
        for key, lines in N.ALL.items():
            f = os.path.join(tmp, key + ".md")
            with open(f, "w") as fh:
                fh.write("<br>".join(lines))
            r = subprocess.run(["node", PREVIEW, pkg, f, str(width)],
                               capture_output=True, text=True,
                               env=dict(os.environ, BC_QUIET="1"))
            if r.returncode:
                print("FAILED", key, r.stdout, r.stderr)
                return 1
            heights[key] = int(r.stdout.strip())
    heights["_width"] = width
    with open(OUT, "w") as fh:
        json.dump(heights, fh, indent=1, sort_keys=True)
    print("wrote", OUT, heights)
    return 0


if __name__ == "__main__":
    sys.exit(main())
