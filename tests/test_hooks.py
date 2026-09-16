#!/usr/bin/env python3
"""The two PreToolUse hooks fire when they should and stay quiet otherwise.
Run: python3 tests/test_hooks.py

hooks/inject_admonitions.py pre-commit used to match the substring "git commit",
so the words inside a quoted string, a heredoc body or a grep pattern injected
~1.3k tokens of reminders into commands that commit nothing.

hooks/sync_maxpat.py used to run a full sync on every Read of a .maxpat, so
reading a patch rewrote it — risky with two sessions in one folder — and it
ignored .maxhelp and .amxd. It now runs `sync --check`, writes nothing, and asks
before re-syncing (John, 2026-09-16).
"""
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

_REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_REPO / "hooks"))
import inject_admonitions  # noqa: E402

_SYNC_HOOK = _REPO / "hooks" / "sync_maxpat.py"


# ── pre-commit trigger ───────────────────────────────────────────────────────
COMMITS = [
    'git commit -m "x"',
    "git add -A && git commit -q -F - <<'MSG'\nbody line\nMSG",
    'git -C "/path with space/repo" commit -q -m "y"',
    "cd somewhere; git commit",
    "FOO=1 git commit -m z",
    "(cd x && git commit -am 'wip')",
    "/usr/bin/git commit --amend --no-edit",
]
NOT_COMMITS = [
    'python3 -c "print(\'per git commit\')"',
    'echo "git commit"',
    "python3 - <<'PY'\nprint(\"tokens per git commit\")\nPY",
    'grep -n "git commit" CLAUDE.md',
    'git log --grep "git commit" --oneline',
    "git status --short",
    "cat notes.txt  # remember to git commit later",
]


def test_real_commits_trigger():
    for cmd in COMMITS:
        assert inject_admonitions.runs_git_commit(cmd), cmd


def test_mentions_of_commit_do_not_trigger():
    for cmd in NOT_COMMITS:
        assert not inject_admonitions.runs_git_commit(cmd), cmd


def test_hook_entry_point_matches_the_function():
    def run(cmd):
        p = subprocess.run([sys.executable, str(_REPO / "hooks" / "inject_admonitions.py"), "pre-commit"],
                           input=json.dumps({"tool_input": {"command": cmd}}),
                           capture_output=True, text=True)
        return p.stdout.strip()
    assert run(COMMITS[0]).startswith("{")
    assert run(NOT_COMMITS[0]) == ""


# ── read hook ────────────────────────────────────────────────────────────────
def _read_hook(path):
    p = subprocess.run([sys.executable, str(_SYNC_HOOK)],
                       input=json.dumps({"tool_input": {"file_path": str(path)}}),
                       capture_output=True, text=True)
    assert p.returncode == 0, p.stderr
    return p.stdout.strip()


def _patch_without_scripts():
    """A repo patch whose check passes in a bare temp folder (no .js beside it needed)."""
    for f in sorted((_REPO / "patches").glob("*.maxpat")):
        if '"v8 ' in f.read_text(errors="replace") or '"js ' in f.read_text(errors="replace"):
            continue
        with tempfile.TemporaryDirectory() as d:
            copy = Path(d) / f.name
            shutil.copy(f, copy)
            r = subprocess.run([sys.executable, str(_REPO / "spec2maxpat.py"), "sync", "-i", str(copy), "--check"],
                               capture_output=True, text=True)
            if r.returncode == 0:
                return f
    raise AssertionError("no script-free patch in patches/ passes sync --check")


def test_matching_patch_is_silent_and_untouched():
    src = _patch_without_scripts()
    with tempfile.TemporaryDirectory() as d:
        for ext in (".maxpat", ".maxhelp"):
            copy = Path(d) / (src.stem + ext)
            shutil.copy(src, copy)
            before = copy.read_bytes()
            assert _read_hook(copy) == "", ext
            assert copy.read_bytes() == before, ext


def test_stale_patch_asks_and_writes_nothing():
    src = _patch_without_scripts()
    with tempfile.TemporaryDirectory() as d:
        copy = Path(d) / src.name
        shutil.copy(src, copy)
        data = json.loads(copy.read_text())
        box = next(w["box"] for w in data["patcher"]["boxes"] if w["box"].get("maxclass") == "newobj")
        box["text"] = box["text"] + " 99"          # an edit made "in Max", not in the spec
        copy.write_text(json.dumps(data, indent=1))
        before = copy.read_bytes()
        out = _read_hook(copy)
        assert "out of step" in out and "ask the user before re-syncing" in out, out
        assert copy.read_bytes() == before


def test_patch_without_spec_asks_and_writes_nothing():
    with tempfile.TemporaryDirectory() as d:
        copy = Path(d) / "bare.maxpat"
        copy.write_text(json.dumps({"patcher": {"boxes": [{"box": {"id": "obj-1", "maxclass": "newobj",
                                                                   "text": "metro 500", "numinlets": 2,
                                                                   "numoutlets": 1, "outlettype": ["bang"],
                                                                   "patching_rect": [10, 10, 60, 22]}}],
                                               "lines": []}}))
        before = copy.read_bytes()
        out = _read_hook(copy)
        assert "no embedded Claude2Max spec" in out and "ask the user" in out, out
        assert copy.read_bytes() == before


def test_non_patch_files_are_ignored():
    assert _read_hook(_REPO / "CLAUDE.md") == ""


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn(); print("  PASS ", name)
