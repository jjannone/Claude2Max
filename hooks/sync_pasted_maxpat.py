#!/usr/bin/env python3
"""
UserPromptSubmit hook — detect pasted .maxpat JSON and auto-sync it.

If the user's message contains a valid .maxpat JSON object (bare paste or
inside a code fence), runs spec sync on it and injects the resulting spec
as additionalContext so Claude can work with it directly.
"""
import json
import os
import subprocess
import sys
import tempfile

data = json.load(sys.stdin)
prompt = data.get("prompt", "")


def find_maxpat(text):
    """Return the first dict in text that looks like a .maxpat, or None."""
    decoder = json.JSONDecoder()
    i = 0
    while i < len(text):
        i = text.find("{", i)
        if i == -1:
            break
        try:
            obj, _ = decoder.raw_decode(text, i)
            if (isinstance(obj, dict)
                    and "patcher" in obj
                    and isinstance(obj["patcher"], dict)
                    and "boxes" in obj["patcher"]):
                return obj
        except json.JSONDecodeError:
            pass
        i += 1
    return None


maxpat = find_maxpat(prompt)
if maxpat is None:
    sys.exit(0)

# Write to a temp file and sync
fd, tmp_path = tempfile.mkstemp(suffix=".maxpat")
try:
    with os.fdopen(fd, "w") as f:
        json.dump(maxpat, f)

    repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    converter = os.path.join(repo_root, "spec2maxpat.py")

    if not os.path.isfile(converter):
        sys.exit(0)

    result = subprocess.run(
        ["python3", converter, "sync", "-i", tmp_path],
        capture_output=True,
        text=True
    )

    if result.returncode != 0:
        sys.exit(0)

    spec_json = result.stdout.strip()
    summary = result.stderr.strip()

    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "UserPromptSubmit",
            "additionalContext": (
                f"[maxpat sync] Detected pasted .maxpat. {summary}\n\n"
                f"Extracted spec:\n{spec_json}"
            )
        }
    }))

finally:
    if os.path.exists(tmp_path):
        os.unlink(tmp_path)

sys.exit(0)
