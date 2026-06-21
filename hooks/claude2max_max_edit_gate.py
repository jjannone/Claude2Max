#!/usr/bin/env python3
"""PreToolUse hook: block Max-file edits until the max-patching skill has been invoked.

Registered in ~/.claude/settings.json under hooks.PreToolUse with matcher Edit|Write.
Only gates .maxpat / .maxhelp / .amxd files, plus .js/.mjs files that sit next to
one of those (e.g. a tutorial JS or server.js adjacent to a .maxpat).

When the gate fires, Claude is told to invoke the max-patching skill, which calls
mcp__claude2max__load() and writes the sentinel this hook checks for.

Install: python3 install_global.py
Remove:  python3 uninstall_global.py
"""
import json
import os
import sys
import tempfile
import time
from pathlib import Path


def _session_key(payload: dict) -> tuple[str, bool]:
    """Derive a session key + whether we have a real (non-TTL) session id.

    Priority matches the skill's sentinel-writing logic:
      1. CLAUDE_CODE_SESSION_ID env var (confirmed present in Claude Code subprocs)
      2. session_id from hook stdin JSON  (documented-reliable fallback)
      3. sha1 of cwd                      (last-resort; carries a 1-hour TTL)
    """
    sid = os.environ.get("CLAUDE_CODE_SESSION_ID") or payload.get("session_id", "")
    if sid:
        return sid, True
    import hashlib
    cwd = payload.get("cwd") or os.getcwd()
    return hashlib.sha1(cwd.encode()).hexdigest()[:16], False


def _sentinel_path(key: str) -> Path:
    return Path(tempfile.gettempdir()) / f"claude2max_loaded_{key}.flag"


def _is_max_file(path_str: str) -> bool:
    if not path_str:
        return False
    p = Path(path_str)
    suffix = p.suffix.lower()
    if suffix in (".maxpat", ".maxhelp", ".amxd"):
        return True
    if suffix in (".js", ".mjs"):
        return any(
            (p.parent / (p.stem + ext)).exists()
            for ext in (".maxpat", ".maxhelp", ".amxd")
        )
    return False


def main() -> None:
    raw = sys.stdin.read()
    try:
        payload = json.loads(raw)
    except (json.JSONDecodeError, ValueError):
        sys.exit(0)  # Malformed payload — allow rather than blocking on parse error

    file_path = payload.get("tool_input", {}).get("file_path", "")
    if not _is_max_file(file_path):
        sys.exit(0)  # Not a Max-adjacent file — pass through

    key, has_real_sid = _session_key(payload)
    sentinel = _sentinel_path(key)

    # Sentinel valid?
    if sentinel.exists():
        if has_real_sid:
            sys.exit(0)  # Session-id sentinel — no TTL needed; session is the scope
        if (time.time() - sentinel.stat().st_mtime) < 3600:
            sys.exit(0)  # cwd-hash sentinel still within 1-hour TTL

    # Sentinel missing or expired — deny and instruct Claude to invoke the skill
    result = {
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": (
                "Edit blocked: Claude2Max Max knowledge not yet loaded this session.\n"
                "Invoke the max-patching skill first:\n"
                "  1. Call mcp__claude2max__assess(task_description='...') → domains\n"
                "  2. Call mcp__claude2max__load(domains=[...]) → read the result\n"
                "  3. Write the session sentinel (Step 3 of the skill)\n"
                "Then retry the edit.\n"
                f"Target file: {file_path}"
            ),
        }
    }
    print(json.dumps(result))
    sys.exit(0)


if __name__ == "__main__":
    main()
