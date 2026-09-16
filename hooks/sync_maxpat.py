#!/usr/bin/env python3
"""
PreToolUse hook on Read — check a patch's embedded spec before Claude reads it.

For every Read of a .maxpat, .maxhelp or .amxd file this runs
`spec2maxpat.py sync --check`, which writes nothing:

  - spec matches the boxes      → silent.
  - spec does not match, or an  → tells Claude, and says to ask the user before
    embedded script has drifted    re-syncing.
  - no embedded spec            → tells Claude, and says to ask the user before
                                   adding one.
  - the check itself failed     → says so, with the converter's last error line.

Until 2026-09-16 this hook ran a full `sync` on every read, so reading a patch
rewrote it. With two sessions in one folder, or Max saving the file, that could
overwrite someone else's edit, and it never looked at .maxhelp or .amxd. John
chose a check that asks instead.

Exits 0 always — never blocks the read.
"""
import json
import os
import subprocess
import sys

PATCH_EXTENSIONS = (".maxpat", ".maxhelp", ".amxd")


def message_for(path, returncode, stdout, stderr):
    """The context line to show Claude, or None when the spec matches."""
    name = os.path.basename(path)
    sync_cmd = f"python3 spec2maxpat.py sync -i '{path}'"
    out = (stdout or "").strip()
    err = (stderr or "").strip()
    if returncode == 0:
        return None
    if "no embedded spec" in out:
        return (f"[maxpat check] {name} has no embedded Claude2Max spec. Nothing was written. "
                f"If you are going to edit or convert it, ask the user before adding one with `{sync_cmd}`.")
    if "Corrupt Claude2Max spec embed" in err:
        return (f"[maxpat check] {name}: {err.splitlines()[-1]} Nothing was written. "
                f"Ask the user how to proceed before syncing.")
    if out:
        return (f"[maxpat check] {name}: the embedded spec is out of step with the patch. {out} "
                f"Nothing was written. The file may have been edited in Max or by another session, "
                f"so ask the user before re-syncing with `{sync_cmd}`.")
    last = err.splitlines()[-1] if err else f"exit code {returncode}"
    return f"[maxpat check] Warning: could not check {name} — {last}"


def main():
    data = json.load(sys.stdin)
    path = data.get("tool_input", {}).get("file_path", "")
    if not path.endswith(PATCH_EXTENSIONS) or not os.path.isfile(path):
        sys.exit(0)

    repo_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    converter = os.path.join(repo_root, "spec2maxpat.py")
    if not os.path.isfile(converter):
        sys.exit(0)

    result = subprocess.run(["python3", converter, "sync", "-i", path, "--check"],
                            capture_output=True, text=True)
    msg = message_for(path, result.returncode, result.stdout, result.stderr)
    if msg:
        print(json.dumps({"hookSpecificOutput": {"hookEventName": "PreToolUse",
                                                 "additionalContext": msg}}))
    sys.exit(0)


if __name__ == "__main__":
    main()
