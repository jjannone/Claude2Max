#!/usr/bin/env python3
"""PostToolUse hook: anti-guessing check of a HAND-EDITED .maxpat / .maxhelp / .amxd.

The convert gate (spec2maxpat.py convert) only covers patches produced THROUGH the
converter. Editing a .maxpat's JSON by hand — the most tempting shortcut for an
overconfident model — bypasses it. This hook closes that hole: after any Edit/Write
to a patcher file, it runs the SAME anti-guessing resolver rules (object name +
attribute + message, via spec2maxpat.gate_maxpat_file) and, if it finds invented
names, feeds them back to Claude as PostToolUse additionalContext so they get fixed
in-session.

Non-blocking by design: the edit already happened, and PostToolUse can't undo it —
so this informs rather than blocks (exit 0 + hookSpecificOutput.additionalContext,
the documented PostToolUse feedback channel). It is also bulletproof: any error →
exit 0 with no output, so a hook bug can never disrupt the session.

Registered under hooks.PostToolUse with matcher Edit|Write (repo .claude/settings.json
for in-repo coverage; install_global.py for cross-project coverage). Because this
file lives in <claude2max>/hooks/, __file__ always locates the Claude2Max clone even
when the edited patch is in another project.
"""
import json
import sys
from collections import Counter
from pathlib import Path

_PATCHER_SUFFIXES = (".maxpat", ".maxhelp", ".amxd")
_MAX_LINES = 14  # cap the report so a messy legacy patch can't flood the context


def _report(result: dict, name: str) -> str:
    """Dedupe violations by (severity, rule, offending-name) and render a report."""
    errs, warns = Counter(), Counter()
    for v in result.get("violations", []):
        msg = v.get("message", "")
        token = msg.split("'")[1] if "'" in msg else (msg[:24] + "…")
        key = (v.get("rule", ""), token)
        (errs if v.get("severity") == "error" else warns)[key] += 1

    lines = [f"⚠ Claude2Max content gate — {name}",
             "This hand-edited patch contains names Max does NOT have. Max accepts "
             "them silently and then misbehaves (no error at load) — the exact "
             "failure this gate exists to catch."]
    if errs:
        lines.append("ERRORS (will silently fail — fix before relying on the patch):")
        for (rule, tok), n in errs.most_common(_MAX_LINES):
            what = ("object" if rule == "object-unresolved"
                    else "attribute" if rule == "attribute-invalid"
                    else "maxclass" if rule == "maxclass-unresolved" else rule)
            lines.append(f"  • {what} '{tok}'" + (f"  (×{n})" if n > 1 else ""))
    if warns:
        lines.append("WARNINGS (verify — may be invented OR real-but-undocumented):")
        for (rule, tok), n in warns.most_common(_MAX_LINES):
            lines.append(f"  • message '{tok}'" + (f"  (×{n})" if n > 1 else ""))
    lines.append("Resolve each with lookup_object / list_attributes (the real "
                 "name), or set \"unverified\": true on an abstraction you have "
                 "confirmed exists. Then re-edit the file.")
    return "\n".join(lines)


def main() -> None:
    try:
        payload = json.loads(sys.stdin.read())
    except Exception:
        return  # malformed payload — never disrupt the session

    if payload.get("tool_name") not in ("Edit", "Write"):
        return
    file_path = (payload.get("tool_input") or {}).get("file_path", "")
    if not file_path or Path(file_path).suffix.lower() not in _PATCHER_SUFFIXES:
        return

    # Locate the Claude2Max clone (this file lives in <clone>/hooks/) and import
    # the shared gate. Done lazily so a missing/old clone can't break the hook.
    try:
        repo_root = Path(__file__).resolve().parent.parent
        sys.path.insert(0, str(repo_root))
        from spec2maxpat import gate_maxpat_file
    except Exception:
        return  # toolkit not importable — degrade silently (PreToolUse skill gate still applies)

    try:
        # Stream warnings to stderr (shown in transcript, not parsed as the result).
        result = gate_maxpat_file(file_path, stream=sys.stderr)
    except Exception:
        return  # a checker bug must never disrupt the edit

    if not result.get("checked") or result.get("ok"):
        return  # couldn't check, or clean — say nothing

    context = _report(result, Path(file_path).name)
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PostToolUse",
            "additionalContext": context,
        }
    }))


if __name__ == "__main__":
    main()
