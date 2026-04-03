#!/usr/bin/env python3
"""
PreToolUse hook — auto-sync .maxpat files before Claude reads them.

For every Read tool call on a .maxpat file:
  - No embedded spec  → reverse-engineers one from boxes/patchlines, embeds it.
  - Has embedded spec → reconciles it with current box state (picks up manual edits).

The file is updated in-place. Claude then reads the version with a current spec.
Exits 0 always — never blocks the read.
"""
import json
import os
import subprocess
import sys

data = json.load(sys.stdin)
path = data.get("tool_input", {}).get("file_path", "")

if not path.endswith(".maxpat") or not os.path.isfile(path):
    sys.exit(0)

# spec2maxpat.py lives at the repo root, one level above this hooks/ directory
repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
converter = os.path.join(repo_root, "spec2maxpat.py")

if not os.path.isfile(converter):
    sys.exit(0)

result = subprocess.run(
    ["python3", converter, "sync", "-i", path],
    capture_output=True,
    text=True
)

msg = result.stderr.strip() if result.returncode == 0 else f"Warning: sync failed — {result.stderr.strip()}"

print(json.dumps({
    "hookSpecificOutput": {
        "hookEventName": "PreToolUse",
        "additionalContext": f"[maxpat sync] {msg}"
    }
}))

sys.exit(0)
