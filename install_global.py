#!/usr/bin/env python3
"""One-command installer for Claude2Max global MCP + enforcement layer.

Installs three pieces:
  1. MCP server  — registers 'claude2max' in Claude Code's user-scope MCP config
                   (~/.claude.json) via `claude mcp add --scope user`
  2. Global skill — copies skills/max-patching/SKILL.md to ~/.claude/skills/max-patching/
                    so the max-patching skill is discoverable from any cwd
  3. Enforcement hook — merges a PreToolUse hook entry into ~/.claude/settings.json
                        that blocks Max-file edits until the skill has been invoked

Usage:
  python3 install_global.py                         # install everything
  python3 install_global.py --dry-run               # show what would change
  python3 install_global.py --verify                # post-install verification
  python3 install_global.py --env ANTHROPIC_API_KEY=sk-...  # pass env to MCP server
"""
import argparse
import json
import os
import shutil
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent
HOOK_SCRIPT = REPO_ROOT / "hooks" / "claude2max_max_edit_gate.py"
CONTENT_GATE_SCRIPT = REPO_ROOT / "hooks" / "claude2max_maxpat_content_gate.py"
SKILL_SRC   = REPO_ROOT / "skills" / "max-patching" / "SKILL.md"
MCP_SERVER  = REPO_ROOT / "mcp_server" / "server.py"
MCP_NAME    = "claude2max"

HOME              = Path.home()
CLAUDE_JSON       = HOME / ".claude.json"
CLAUDE_SETTINGS   = HOME / ".claude" / "settings.json"
GLOBAL_SKILLS_DIR = HOME / ".claude" / "skills"

_HOOK_MATCHER = "Edit|Write"


def _dry(msg: str, dry: bool) -> None:
    print(f"{'[dry-run] ' if dry else ''}{msg}")


# ── MCP registration ──────────────────────────────────────────────────────────

def install_mcp(env_pairs: list, dry: bool) -> bool:
    _dry(f"Registering MCP server '{MCP_NAME}' via `claude mcp add --scope user`", dry)
    if dry:
        print(f"  command: python3 {MCP_SERVER}")
        for kv in env_pairs:
            print(f"  --env {kv}")
        return True

    cmd = ["claude", "mcp", "add", "--scope", "user"]
    for kv in env_pairs:
        cmd += ["--env", kv]
    cmd += [MCP_NAME, "--", "python3", str(MCP_SERVER)]

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"  ✓ MCP server registered ('{MCP_NAME}')")
        return True
    combined = (result.stderr + result.stdout).lower()
    if "already" in combined or "exists" in combined:
        print(f"  ✓ MCP server already registered ('{MCP_NAME}') — skipping")
        return True
    print(f"  ✗ MCP registration failed: {(result.stderr or result.stdout).strip()}")
    print("    Tip: is `claude` on your PATH? Run `which claude` to check.")
    return False


# ── Global skill ──────────────────────────────────────────────────────────────

def install_skill(dry: bool) -> bool:
    dest_dir = GLOBAL_SKILLS_DIR / "max-patching"
    dest = dest_dir / "SKILL.md"
    _dry(f"Installing skill: {SKILL_SRC} → {dest}", dry)
    if not SKILL_SRC.exists():
        print(f"  ✗ Source skill not found: {SKILL_SRC}")
        return False
    if dry:
        return True
    dest_dir.mkdir(parents=True, exist_ok=True)
    shutil.copy2(SKILL_SRC, dest)
    print(f"  ✓ Skill installed: {dest}")
    return True


# ── Enforcement hook ──────────────────────────────────────────────────────────

def _hook_entry() -> dict:
    return {
        "type": "command",
        "command": f"python3 {HOOK_SCRIPT}",
        "statusMessage": "Checking Claude2Max knowledge sentinel...",
    }


def _hook_already_installed(settings: dict) -> bool:
    hook_cmd = str(HOOK_SCRIPT)
    for block in settings.get("hooks", {}).get("PreToolUse", []):
        if block.get("matcher") == _HOOK_MATCHER:
            for h in block.get("hooks", []):
                if hook_cmd in h.get("command", ""):
                    return True
    return False


def install_hook(dry: bool) -> bool:
    _dry(f"Merging enforcement hook into {CLAUDE_SETTINGS}", dry)
    if dry:
        print(f"  matcher: {_HOOK_MATCHER}")
        print(f"  command: python3 {HOOK_SCRIPT}")
        return True

    CLAUDE_SETTINGS.parent.mkdir(parents=True, exist_ok=True)
    settings: dict = {}
    if CLAUDE_SETTINGS.exists():
        try:
            settings = json.loads(CLAUDE_SETTINGS.read_text())
        except json.JSONDecodeError:
            print(f"  ✗ {CLAUDE_SETTINGS} is not valid JSON — cannot merge hook safely.")
            return False

    if _hook_already_installed(settings):
        print(f"  ✓ Hook already installed — skipping")
        return True

    hooks = settings.setdefault("hooks", {})
    pre   = hooks.setdefault("PreToolUse", [])

    # Append into an existing Edit|Write block, or create a new one
    for block in pre:
        if block.get("matcher") == _HOOK_MATCHER:
            block.setdefault("hooks", []).append(_hook_entry())
            break
    else:
        pre.append({"matcher": _HOOK_MATCHER, "hooks": [_hook_entry()]})

    CLAUDE_SETTINGS.write_text(json.dumps(settings, indent=4))
    print(f"  ✓ Hook merged into {CLAUDE_SETTINGS}")
    return True


# ── Content gate (PostToolUse) ────────────────────────────────────────────────
# Anti-guessing check of a HAND-EDITED .maxpat — the half the convert gate can't
# see. Registered globally so it fires on patch edits in ANY project.

def _content_gate_entry() -> dict:
    return {
        "type": "command",
        "command": f"python3 {CONTENT_GATE_SCRIPT}",
        "statusMessage": "Checking patch for invented names...",
    }


def _content_gate_already_installed(settings: dict) -> bool:
    cmd = str(CONTENT_GATE_SCRIPT)
    for block in settings.get("hooks", {}).get("PostToolUse", []):
        if block.get("matcher") == _HOOK_MATCHER:
            for h in block.get("hooks", []):
                if cmd in h.get("command", ""):
                    return True
    return False


def install_content_gate(dry: bool) -> bool:
    _dry(f"Merging PostToolUse content gate into {CLAUDE_SETTINGS}", dry)
    if dry:
        print(f"  matcher: {_HOOK_MATCHER}")
        print(f"  command: python3 {CONTENT_GATE_SCRIPT}")
        return True

    CLAUDE_SETTINGS.parent.mkdir(parents=True, exist_ok=True)
    settings: dict = {}
    if CLAUDE_SETTINGS.exists():
        try:
            settings = json.loads(CLAUDE_SETTINGS.read_text())
        except json.JSONDecodeError:
            print(f"  ✗ {CLAUDE_SETTINGS} is not valid JSON — cannot merge gate safely.")
            return False

    if _content_gate_already_installed(settings):
        print("  ✓ Content gate already installed — skipping")
        return True

    post = settings.setdefault("hooks", {}).setdefault("PostToolUse", [])
    for block in post:
        if block.get("matcher") == _HOOK_MATCHER:
            block.setdefault("hooks", []).append(_content_gate_entry())
            break
    else:
        post.append({"matcher": _HOOK_MATCHER, "hooks": [_content_gate_entry()]})

    CLAUDE_SETTINGS.write_text(json.dumps(settings, indent=4))
    print(f"  ✓ Content gate merged into {CLAUDE_SETTINGS}")
    return True


# ── Verification ──────────────────────────────────────────────────────────────

def verify() -> None:
    ok = True

    print("\n── MCP server ──────────────────────────────────────")
    if CLAUDE_JSON.exists():
        try:
            cfg = json.loads(CLAUDE_JSON.read_text())
            if MCP_NAME in cfg.get("mcpServers", {}):
                entry = cfg["mcpServers"][MCP_NAME]
                print(f"  ✓ '{MCP_NAME}' registered in {CLAUDE_JSON}")
                args = entry.get("args", [])
                server_path = Path(args[0]) if args else None
                if server_path and server_path.exists():
                    print(f"  ✓ server.py found: {server_path}")
                else:
                    print(f"  ✗ server.py not found: {server_path}")
                    ok = False
            else:
                print(f"  ✗ '{MCP_NAME}' not in {CLAUDE_JSON}")
                ok = False
        except json.JSONDecodeError:
            print(f"  ✗ {CLAUDE_JSON} is not valid JSON")
            ok = False
    else:
        print(f"  ✗ {CLAUDE_JSON} not found")
        ok = False

    print("\n── Global skill ────────────────────────────────────")
    skill_dest = GLOBAL_SKILLS_DIR / "max-patching" / "SKILL.md"
    if skill_dest.exists():
        print(f"  ✓ Skill installed: {skill_dest}")
    else:
        print(f"  ✗ Skill not found: {skill_dest}")
        ok = False

    print("\n── Enforcement hook ────────────────────────────────")
    if CLAUDE_SETTINGS.exists():
        try:
            settings = json.loads(CLAUDE_SETTINGS.read_text())
            if _hook_already_installed(settings):
                print(f"  ✓ Hook registered in {CLAUDE_SETTINGS}")
            else:
                print(f"  ✗ Hook not found in {CLAUDE_SETTINGS}")
                ok = False
        except json.JSONDecodeError:
            print(f"  ✗ {CLAUDE_SETTINGS} is not valid JSON")
            ok = False
    else:
        print(f"  ✗ {CLAUDE_SETTINGS} not found")
        ok = False

    if HOOK_SCRIPT.exists():
        print(f"  ✓ Hook script exists: {HOOK_SCRIPT}")
    else:
        print(f"  ✗ Hook script missing: {HOOK_SCRIPT}")
        ok = False

    print("\n── Session ID env var ──────────────────────────────")
    sid = os.environ.get("CLAUDE_CODE_SESSION_ID")
    if sid:
        print(f"  ✓ CLAUDE_CODE_SESSION_ID = {sid[:8]}…")
    else:
        print("  ⚠ CLAUDE_CODE_SESSION_ID not set in this process")
        print("    (Expected in Claude Code subprocesses; hook falls back to stdin session_id)")

    print()
    if ok:
        print("All checks passed.")
    else:
        print("Some checks failed — re-run `python3 install_global.py` to fix.")
    sys.exit(0 if ok else 1)


# ── Main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would change without writing anything")
    parser.add_argument("--verify", action="store_true",
                        help="Post-install verification check (no installs)")
    parser.add_argument("--env", action="append", default=[], metavar="KEY=VAL",
                        help="Env var to pass to the MCP server (repeatable); "
                             "e.g. --env ANTHROPIC_API_KEY=sk-...")
    args = parser.parse_args()

    if args.verify:
        verify()
        return

    dry = args.dry_run
    print(f"Claude2Max global install {'(dry run) ' if dry else ''}— repo: {REPO_ROOT}\n")

    results = [
        install_mcp(args.env, dry),
        install_skill(dry),
        install_hook(dry),
        install_content_gate(dry),
    ]

    print()
    if all(results):
        if dry:
            print("Dry run complete. Run without --dry-run to apply.")
        else:
            print("Installation complete.")
            print("\nNext steps:")
            print("  1. Restart Claude Code (or open a new session) to load the MCP server.")
            print("  2. Run `python3 install_global.py --verify` to confirm everything is wired.")
            print("  3. In any Max project, open a session and invoke the max-patching skill")
            print("     before editing .maxpat files — or add the snippet from")
            print(f"     {REPO_ROOT / 'mcp_server' / 'PROJECT_CLAUDE_SNIPPET.md'}")
            print("     to your project CLAUDE.md for automatic front-loading.")
    else:
        print("Installation completed with errors — see above.")
        sys.exit(1)


if __name__ == "__main__":
    main()
