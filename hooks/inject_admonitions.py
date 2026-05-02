#!/usr/bin/env python3
"""
PreToolUse hook — surfaces admonitions tagged in repo *.md files.

Usage: inject_admonitions.py <event>
where <event> is e.g. "pre-edit" or "pre-commit".

Behavior: scans every *.md file at the repo root for headings tagged
`{!<event>}` and injects each tagged section (heading + body until the
next heading at the same or higher level) as additionalContext.

This means rules and their at-action-point reminders are the *same text*
in CLAUDE.md (and SPEC_REFERENCE.md, MAX_PATCHING.md, etc.) — adding a
new admonition is a one-tag edit. No Python checklist to maintain.

Event-specific gating:
  - pre-edit:   skips when the target is /tmp/, /var/folders/, or another scratch path.
  - pre-commit: only fires when the Bash command contains "git commit".
"""
import json
import os
import re
import sys

if len(sys.argv) < 2:
    sys.exit(0)
event = sys.argv[1]
tag = "{!" + event + "}"

data = json.load(sys.stdin)
tool_input = data.get("tool_input", {})

if event == "pre-edit":
    fp = tool_input.get("file_path", "")
    if fp.startswith("/tmp/") or fp.startswith("/var/folders/"):
        sys.exit(0)
elif event == "pre-commit":
    cmd = tool_input.get("command", "")
    if "git commit" not in cmd:
        sys.exit(0)

repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

heading_re = re.compile(r"^(#+)\s+(.*)$")

def extract_tagged_sections(md_path, tag):
    """Return list of (heading_line, body) for headings containing tag."""
    with open(md_path) as f:
        lines = f.readlines()
    sections = []
    i = 0
    while i < len(lines):
        m = heading_re.match(lines[i])
        if m and tag in lines[i]:
            level = len(m.group(1))
            start = i
            j = i + 1
            while j < len(lines):
                m2 = heading_re.match(lines[j])
                if m2 and len(m2.group(1)) <= level:
                    break
                j += 1
            sections.append("".join(lines[start:j]).rstrip())
            i = j
        else:
            i += 1
    return sections

all_sections = []
for fname in sorted(os.listdir(repo_root)):
    if not fname.endswith(".md"):
        continue
    fpath = os.path.join(repo_root, fname)
    if not os.path.isfile(fpath):
        continue
    sections = extract_tagged_sections(fpath, tag)
    for s in sections:
        all_sections.append(f"--- from {fname} ---\n{s}")

if not all_sections:
    sys.exit(0)

header = f"[{event} review] Re-read these rules from the repo *.md files before proceeding. " \
         f"They are the same rules visible to you in CLAUDE.md (etc.) — surfacing them here " \
         f"to make them salient at this decision point.\n\n"

context = header + "\n\n".join(all_sections)

print(json.dumps({
    "hookSpecificOutput": {
        "hookEventName": "PreToolUse",
        "additionalContext": context
    }
}))

sys.exit(0)
