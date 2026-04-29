#!/usr/bin/env python3
"""
PreToolUse hook — surfaces a CLAUDE.md compliance checklist before any git commit.

Fires on every Bash tool call that contains "git commit". Outputs an additionalContext
message listing the automatic behaviors Claude must verify before proceeding.
Does not block the commit — it prompts Claude to self-review and act if needed.
"""
import json
import sys

data = json.load(sys.stdin)
command = data.get("tool_input", {}).get("command", "")

if "git commit" not in command:
    sys.exit(0)

checklist = """[pre-commit review] Before committing, verify all CLAUDE.md automatic behaviors:

  1. WORK_HISTORY.md — updated with a summary of this session's work
  2. Docs in sync — any new Max knowledge added to SPEC_REFERENCE.md or MAX_PATCHING.md; tutorial lessons to TUTORIAL_GUIDELINES.md
  3. Task queue — in-progress markers current; completed tasks moved to Done
  4. New rules — any rules derived this session confirmed with user and enshrined in the correct file

If any of the above are missing, handle them before this commit or in a follow-up commit."""

print(json.dumps({
    "hookSpecificOutput": {
        "hookEventName": "PreToolUse",
        "additionalContext": checklist
    }
}))

sys.exit(0)
