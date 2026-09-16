#!/usr/bin/env python3
"""
PreToolUse hook — surfaces admonitions tagged in repo *.md files.

Usage: inject_admonitions.py <event>
where <event> is e.g. "pre-edit" or "pre-commit".

Behavior: scans every *.md file at the repo root for headings tagged
`{!<event>}` and injects each tagged section (heading + body until the
next heading at the same or higher level) as additionalContext.

This means rules and their at-action-point reminders are the *same text*
in CLAUDE.md (and SPEC_REFERENCE.md, patching/MAX_PATCHING.md, etc.) — adding a
new admonition is a one-tag edit. No Python checklist to maintain.

Event-specific gating:
  - pre-edit:   skips when the target is /tmp/, /var/folders/, or another scratch path.
  - pre-commit: only fires when the Bash command actually runs `git commit`
                (see runs_git_commit) — not when the words appear in a quoted
                string, a heredoc body, or a grep pattern.
"""
import json
import os
import re
import shlex
import sys


# Shell operators that end one simple command and start the next.
_COMMAND_SEPARATORS = {"&&", "||", ";", "|", "&", "(", ")"}
# git's global options that take their value as the next token (`git -C <path> commit`).
_GIT_OPTIONS_WITH_VALUE = {"-C", "-c", "--git-dir", "--work-tree", "--namespace", "--exec-path"}
_ENV_ASSIGNMENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*=")


def _is_git_commit(tokens) -> bool:
    """True when one simple command's tokens are `[VAR=x ...] git [global options] commit ...`."""
    i = 0
    while i < len(tokens) and _ENV_ASSIGNMENT.match(tokens[i]):
        i += 1
    if i >= len(tokens) or os.path.basename(tokens[i]) != "git":
        return False
    i += 1
    while i < len(tokens) and tokens[i].startswith("-"):
        i += 2 if tokens[i] in _GIT_OPTIONS_WITH_VALUE else 1
    return i < len(tokens) and tokens[i] == "commit"


def runs_git_commit(command: str) -> bool:
    """True when some simple command in `command` runs `git commit`.

    The old test was the substring "git commit", which also matched the words
    inside a quoted string, a heredoc body or a grep pattern, and injected the
    reminder into commands that commit nothing. Each line is tokenised the way
    a shell would (quotes kept whole), split on shell operators, and each piece
    is checked for a git invocation whose subcommand is `commit`. A line with
    an unbalanced quote — usually heredoc prose such as "John's" — is split on
    whitespace instead.
    """
    for line in command.splitlines():
        try:
            lexer = shlex.shlex(line, posix=True, punctuation_chars=True)
            lexer.whitespace_split = True
            tokens = list(lexer)
        except ValueError:
            tokens = line.split()
        simple: list = []
        for tok in tokens + [";"]:
            if tok in _COMMAND_SEPARATORS:
                if _is_git_commit(simple):
                    return True
                simple = []
            else:
                simple.append(tok)
    return False


def main():
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
        if not runs_git_commit(tool_input.get("command", "")):
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


if __name__ == "__main__":
    main()
