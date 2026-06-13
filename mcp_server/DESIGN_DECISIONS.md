# MCP Server — Locked Design Decisions (Phase i, Step 1)

Research-and-decisions pass for the Claude2Max MCP server + global enforcement
layer. **No code is written in this step** beyond pinning the SDK version in
`requirements.txt`. The choices below are *locked* — future sessions build
against them rather than re-litigating. Where a fact could not be confirmed on
all three target platforms from the single available machine (macOS), it is
flagged **[verify on Linux/Windows]** and the installer's `--verify` mode is the
mechanism that will exercise it on student machines.

Researched 2026-06-13 on macOS 15 (Darwin 25.4.0), Claude Code desktop-app
build `2.1.160`, Python 3.14.3. Sources are cited inline: **[doc]** = official
Claude Code / PyPI documentation; **[local]** = verified by inspecting this
machine; **[corrects-task]** = supersedes an assumption written into the
TASK_QUEUE.md task body.

---

## Provenance note — two corrections to the task body

The task body in `TASK_QUEUE.md` made two reasonable-but-wrong guesses. Both are
exactly the silent-failure class the repo's "Never Write API Names From Memory"
rule guards against, so they are called out explicitly:

1. **Session-id env var name.** The task body assumed `$CLAUDE_SESSION_ID`. The
   actual env var exposed to subprocesses is **`CLAUDE_CODE_SESSION_ID`**
   (verified live in a Bash subprocess — value `95b9…`, matching the
   `~/.claude/session-env/<uuid>/` directory name). A hook keying off
   `$CLAUDE_SESSION_ID` would have read an empty string and silently failed the
   sentinel handshake. **[corrects-task] [local]**

2. **Claude Code MCP config path.** The task body guessed
   `~/Library/Application Support/Claude/` (macOS). That path is **Claude
   *Desktop*'s** config, *not* Claude *Code*'s. Claude Code (CLI) uses
   `~/.claude.json`. The two are distinct registration surfaces and the
   installer must not conflate them. **[corrects-task] [doc] [local]**

---

## (a) MCP SDK — locked

| Decision | Value |
|---|---|
| Package | `mcp` (official Anthropic Python SDK) **[doc: pypi.org/project/mcp]** |
| Pinned floor | `mcp>=1.27.0` (current stable `1.27.2`, released 2026-05-29) |
| Install extra | `pip install "mcp[cli]"` (the `[cli]` extra provides the dev runner) |
| Server idiom | `FastMCP` — now folded into the official `mcp` package; the standard way to declare tools via decorators |
| Python floor | **3.10+** (SDK requirement). This machine runs 3.14.3; CI/students must be ≥3.10 |

`mcp` is **not** currently installed on this machine (`ModuleNotFoundError`) —
expected; it gets installed from `requirements.txt` when the server is first
run. `requirements.txt` is written alongside this doc as the one concrete
artifact of Step 1.

Rationale for FastMCP over the low-level `Server` API: tool **descriptions are
themselves prompts** that bias whether Claude invokes them (see open-decision #5
in the task — narrow tools with clear descriptions trigger more reliably). The
decorator idiom keeps each tool's docstring/description adjacent to its
implementation, which is the right ergonomics for tuning those descriptions.

---

## (b) Config & install paths, per OS — locked

There are **two distinct MCP registration surfaces** and the installer targets
both, because students may run either Claude Code (CLI) or the Claude Desktop
app, on any of the three OSes.

### Surface 1 — Claude Code (CLI). Primary target.

User-scoped MCP servers live under the `mcpServers` key of **`~/.claude.json`**
on every platform. The supported, version-stable way to write it is the
`claude mcp add` CLI, **not** hand-editing the JSON. **[doc] [local]**

| OS | User-scope MCP config | Resolves to |
|---|---|---|
| macOS | `~/.claude.json` | `/Users/<u>/.claude.json` **[local: confirmed, `mcpServers` key present, empty]** |
| Linux | `~/.claude.json` | `/home/<u>/.claude.json` **[doc] [verify on Linux]** |
| Windows | `~/.claude.json` | `C:\Users\<u>\.claude.json` **[doc] [verify on Windows]** |

Install command the installer will shell out to (user scope so the server is
reachable from **any** cwd — the whole point of global enforcement):

```
claude mcp add --scope user claude2max -- python3 <CLONE>/mcp_server/server.py
```

Stdio server JSON schema (what `claude mcp add` writes; also the shape if we ever
hand-edit): **[doc]**

```json
{
  "mcpServers": {
    "claude2max": {
      "type": "stdio",
      "command": "python3",
      "args": ["<CLONE>/mcp_server/server.py"],
      "env": {},
      "timeout": 30000
    }
  }
}
```

### Surface 2 — Claude Desktop app. Secondary target.

Registers MCP under `mcpServers` in **`claude_desktop_config.json`**. **[local:
confirmed present on this machine, `mcpServers` empty — this machine's connected
servers come from the desktop app's managed/connector layer, not this file]**

| OS | Desktop-app MCP config | Resolves to |
|---|---|---|
| macOS | `~/Library/Application Support/Claude/claude_desktop_config.json` | **[local: confirmed exists]** |
| Linux | `~/.config/Claude/claude_desktop_config.json` | **[doc] [verify on Linux]** |
| Windows | `%APPDATA%\Claude\claude_desktop_config.json` | **[doc] [verify on Windows]** |

Installer behavior: detect which surface(s) exist on the machine; prefer the CLI
(`claude mcp add`) when the `claude` binary is on PATH; offer the desktop-app
JSON edit as a fallback/addition with a plain-English note that the app must be
restarted to pick it up. `--dry-run` prints which surface(s) it would touch.

### Hook registration path (distinct from MCP registration)

The enforcement hook must fire in **every** repo, not just Claude2Max, so it
registers in the **user-level** settings file, not project settings:

| OS | User-level Claude Code settings | Resolves to |
|---|---|---|
| macOS | `~/.claude/settings.json` | **[local: confirmed exists, no `hooks` key yet — clean merge]** |
| Linux | `~/.claude/settings.json` | **[doc] [verify on Linux]** |
| Windows | `~/.claude/settings.json` | **[doc] [verify on Windows]** |

Two consequences locked here:

- The hook `command` references an **absolute path** to the installed hook
  script (resolved at install time to the Claude2Max clone), **not**
  `$CLAUDE_PROJECT_DIR` — because from another repo `$CLAUDE_PROJECT_DIR` points
  at *that* repo, not Claude2Max. (Contrast the repo's own
  `.claude/settings.json`, which legitimately uses `$CLAUDE_PROJECT_DIR` because
  it only ever runs with Claude2Max as cwd.)
- The installer **merges idempotently** into the existing `hooks.PreToolUse`
  array. Claude Code allows multiple hooks per matcher, so adding the gate hook
  under an `Edit|Write` matcher must append, never overwrite. Re-running the
  installer must not duplicate the entry (match on the command's script path).

---

## (c) Session identity & the sentinel scheme — locked

The skill writes a sentinel when it loads essentials; the hook checks for that
sentinel before allowing a Max-file edit. Both sides must derive the **same
key**. Resolution, in priority order:

1. **Primary — `CLAUDE_CODE_SESSION_ID` env var.** Confirmed present in Bash
   subprocesses on macOS desktop build 2.1.160 **[local]**. Both the skill's
   helper (a Bash/Python step) and the hook subprocess inherit it.
   **[verify on Linux/Windows]** — the env var name is the same per docs, but
   presence in the hook subprocess specifically is the thing `--verify` checks.
2. **Fallback for the hook — `session_id` from stdin JSON.** The PreToolUse hook
   receives a JSON payload on stdin containing `session_id`, `cwd`,
   `permission_mode`, `hook_event_name`, `tool_name`, `tool_input`. **[doc]**
   This is the *documented-reliable* identifier for the hook even if the env var
   is ever absent. The hook reads env first, falls back to stdin `session_id`.
3. **Last-resort — per-cwd hash.** If neither is available on some platform,
   both sides compute `hashlib.sha1(cwd.encode()).hexdigest()[:16]` from `cwd`
   (`$PWD` for the skill, stdin `cwd` for the hook). Coarser than per-session
   (persists across same-dir sessions) so it carries a **TTL**: a sentinel older
   than 1 hour is treated as stale (aligns with the repo's existing 1-hour
   long-gap convention). The env-var/stdin paths don't need the TTL.

Sentinel file location and name (both scripts use the identical computation):

```python
import tempfile, os
sentinel = os.path.join(tempfile.gettempdir(), f"claude2max_loaded_{session_key}.flag")
```

`tempfile.gettempdir()` is used on **both** sides rather than a hard-coded
`/tmp`, so the path resolves correctly on Windows and respects Claude Code's
session-scoped `TMPDIR` (on this machine it is `/tmp/claude-501`, not `/tmp`)
**[local]**. Both subprocesses run under the same Claude Code parent and inherit
the same `TMPDIR`, so they agree.

**Decision:** key = env `CLAUDE_CODE_SESSION_ID` → stdin `session_id` →
cwd-hash+TTL. No standalone `$CLAUDE_SESSION_ID` anywhere (it does not exist).

---

## (d) Implementation language — locked: Python everywhere

Installer (`install_global.py`), uninstaller (`uninstall_global.py`), the hook
(`hooks/claude2max_max_edit_gate.py`), and all glue are **Python, not shell**.
bash/zsh exclude Windows; `.bat`/`.ps1` exclude macOS/Linux; Python ≥3.10 is
first-class on all three and is already the toolkit's language. No decision to
revisit here — it is forced by cross-platform parity.

---

## (e) Tool granularity — locked: narrow tools

Separate tools (`lookup_object`, `lookup_attribute`, `list_attributes`, …)
rather than one omnibus `lookup(object, attr=None)`. The MCP tool description is
a prompt; a narrow tool with a sharp description ("call this before any
`newobj`") triggers more reliably than a broad one whose description must hedge
across several use-cases. Matches open-decision #5's recommendation.

---

## (f) Caching — locked: read-once + mtime watch

Source files (`CLAUDE.md`, `SPEC_REFERENCE.md`, `patching/MAX_PATCHING.md`,
`packages/package_objects.json`, C74 refpage XML) are read once at server
startup and cached in memory, with mtime-based invalidation on each call (cheap
`os.stat`; re-read only when mtime advances). Source files are small and change
rarely; this avoids re-reading on every tool call while staying fresh across
edits.

---

## Hook mechanics — locked (for Phase iii, captured now while researched)

- **Matcher is tool-name-level, not path-level.** Register under matcher
  `Edit|Write`; the hook *script* inspects `tool_input.file_path` to decide
  whether the target is a Max file (`.maxpat`/`.maxhelp`/`.amxd`, or
  `.js`/`.mjs` adjacent to a `.maxpat`). The repo's existing hooks already use
  the `Edit|Write` matcher, confirming the surface. **[local] [doc]**
- **Deny mechanism — primary:** emit stdout JSON
  `{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"<msg>"}}`.
  The reason string is fed back to Claude, prompting it to invoke the
  `max-patching` skill and retry. **Fallback:** exit code `2` with the message
  on stderr (older/simpler convention; same blocking effect). **[doc]**
- **Non-Max edits and the already-loaded case:** exit `0` with no output (allow
  silently). The hook must be a near-no-op on the overwhelming majority of edits.

---

## Confirmed-vs-uncertain summary (drives `--verify`)

| Item | macOS | Linux | Windows |
|---|---|---|---|
| `~/.claude.json` user MCP scope | ✅ local | ⚠️ doc only | ⚠️ doc only |
| `claude mcp add --scope user` writes it | ✅ doc | ⚠️ | ⚠️ |
| Desktop config path | ✅ local | ⚠️ doc only | ⚠️ doc only |
| `~/.claude/settings.json` user hooks | ✅ local | ⚠️ doc only | ⚠️ doc only |
| `CLAUDE_CODE_SESSION_ID` in hook subprocess env | ⚠️ confirmed in Bash; verify in hook | ⚠️ | ⚠️ |
| `session_id` on hook stdin | ✅ doc | ✅ doc | ✅ doc |
| `tempfile.gettempdir()` agreement across subprocs | ✅ local | ⚠️ | ⚠️ |
| `mcp>=1.27` installs & runs | ⚠️ not yet installed | ⚠️ | ⚠️ |

Every ⚠️ is what `install_global.py --verify` exercises on a student machine.

---

## What Step 1 produced

- `mcp_server/DESIGN_DECISIONS.md` (this file) — the locked choices + per-OS
  path table + corrected sentinel scheme.
- `mcp_server/requirements.txt` — pins `mcp>=1.27.0`.

## What Step 2 starts from

Server skeleton with one tool, `essentials()`, returning a ~1.5K-token
structured summary of the binding rules. Uses FastMCP per (a); reads source
files per (f); registered for testing via `claude mcp add --scope user` per (b).
