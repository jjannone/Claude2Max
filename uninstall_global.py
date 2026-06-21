#!/usr/bin/env python3
"""Remove the Claude2Max global MCP server, skill, and enforcement hook.

Symmetric reversal of install_global.py. Safe to re-run — each step is
idempotent and reports "nothing to remove" if the piece was never installed.

Usage:
  python3 uninstall_global.py           # remove everything
  python3 uninstall_global.py --dry-run # show what would change
"""
import argparse
import json
import subprocess
import sys
from pathlib import Path

REPO_ROOT   = Path(__file__).resolve().parent
HOOK_SCRIPT = REPO_ROOT / "hooks" / "claude2max_max_edit_gate.py"
MCP_NAME    = "claude2max"

HOME              = Path.home()
CLAUDE_JSON       = HOME / ".claude.json"
CLAUDE_SETTINGS   = HOME / ".claude" / "settings.json"
GLOBAL_SKILLS_DIR = HOME / ".claude" / "skills"

_HOOK_MATCHER = "Edit|Write"


def _dry(msg: str, dry: bool) -> None:
    print(f"{'[dry-run] ' if dry else ''}{msg}")


def remove_mcp(dry: bool) -> None:
    _dry(f"Removing MCP server '{MCP_NAME}' from Claude Code config", dry)
    if dry:
        return
    result = subprocess.run(
        ["claude", "mcp", "remove", "--scope", "user", MCP_NAME],
        capture_output=True, text=True,
    )
    if result.returncode == 0:
        print(f"  ✓ MCP server '{MCP_NAME}' removed")
    elif "not found" in (result.stderr + result.stdout).lower():
        print(f"  ✓ '{MCP_NAME}' was not registered — nothing to remove")
    else:
        print(f"  ✗ MCP removal failed: {(result.stderr or result.stdout).strip()}")


def remove_skill(dry: bool) -> None:
    dest = GLOBAL_SKILLS_DIR / "max-patching"
    _dry(f"Removing skill directory: {dest}", dry)
    if dry:
        return
    if dest.exists():
        import shutil
        shutil.rmtree(dest)
        print(f"  ✓ Skill removed: {dest}")
    else:
        print(f"  ✓ Skill was not installed — nothing to remove")


def remove_hook(dry: bool) -> None:
    _dry(f"Removing enforcement hook from {CLAUDE_SETTINGS}", dry)
    if dry:
        return
    if not CLAUDE_SETTINGS.exists():
        print(f"  ✓ {CLAUDE_SETTINGS} not found — nothing to remove")
        return
    try:
        settings = json.loads(CLAUDE_SETTINGS.read_text())
    except json.JSONDecodeError:
        print(f"  ✗ {CLAUDE_SETTINGS} is not valid JSON — cannot edit safely")
        return

    hook_cmd = str(HOOK_SCRIPT)
    pre = settings.get("hooks", {}).get("PreToolUse", [])
    changed = False
    new_pre = []
    for block in pre:
        if block.get("matcher") == _HOOK_MATCHER:
            original = block.get("hooks", [])
            filtered = [h for h in original if hook_cmd not in h.get("command", "")]
            if len(filtered) != len(original):
                changed = True
            if filtered:
                new_pre.append({**block, "hooks": filtered})
            # Drop the block entirely if it becomes empty
        else:
            new_pre.append(block)

    if changed:
        settings["hooks"]["PreToolUse"] = new_pre
        CLAUDE_SETTINGS.write_text(json.dumps(settings, indent=4))
        print(f"  ✓ Hook removed from {CLAUDE_SETTINGS}")
    else:
        print(f"  ✓ Hook was not installed — nothing to remove")


def remove_content_gate(dry: bool) -> None:
    _dry(f"Removing PostToolUse content gate from {CLAUDE_SETTINGS}", dry)
    if dry:
        return
    if not CLAUDE_SETTINGS.exists():
        print(f"  ✓ {CLAUDE_SETTINGS} not found — nothing to remove")
        return
    try:
        settings = json.loads(CLAUDE_SETTINGS.read_text())
    except json.JSONDecodeError:
        print(f"  ✗ {CLAUDE_SETTINGS} is not valid JSON — cannot edit safely")
        return

    cmd = str(REPO_ROOT / "hooks" / "claude2max_maxpat_content_gate.py")
    post = settings.get("hooks", {}).get("PostToolUse", [])
    changed, new_post = False, []
    for block in post:
        if block.get("matcher") == _HOOK_MATCHER:
            original = block.get("hooks", [])
            filtered = [h for h in original if cmd not in h.get("command", "")]
            if len(filtered) != len(original):
                changed = True
            if filtered:
                new_post.append({**block, "hooks": filtered})
        else:
            new_post.append(block)

    if changed:
        settings["hooks"]["PostToolUse"] = new_post
        CLAUDE_SETTINGS.write_text(json.dumps(settings, indent=4))
        print(f"  ✓ Content gate removed from {CLAUDE_SETTINGS}")
    else:
        print(f"  ✓ Content gate was not installed — nothing to remove")


def main() -> None:
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    dry = args.dry_run
    print(f"Claude2Max global uninstall {'(dry run) ' if dry else ''}— repo: {REPO_ROOT}\n")

    remove_mcp(dry)
    remove_skill(dry)
    remove_hook(dry)
    remove_content_gate(dry)

    print()
    if dry:
        print("Dry run complete. Run without --dry-run to apply.")
    else:
        print("Uninstall complete. Restart Claude Code for changes to take effect.")


if __name__ == "__main__":
    main()
