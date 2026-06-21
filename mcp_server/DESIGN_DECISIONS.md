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

---

## Phasing note — the renumber after the Phase (ii) rethink

The original phasing (this file's "for Phase iii" labels on the hook mechanics
above) put `verify_spec` in Phase (ii) and the skill+hook+installer in Phase
(iii). The 2026-06-20 architecture rethink inserted the `assess()`/`load()`
module system as the new Phase (ii), which pushed everything down one:

- **Phase (i)** — `essentials` + `lookup_object` + `lookup_attribute` +
  `list_attributes` + `search_packages`. ✅ done.
- **Phase (ii)** — `assess()` + `load()` module system. ✅ done.
- **Phase (iii)** — `verify_spec()` + the shared rule library. ✅ done
  (2026-06-21).
- **Phase (iv+)** — global skill + PreToolUse enforcement hook + one-command
  installer. The "Hook mechanics — locked" section above still applies to that
  phase; only its number changed.

---

## (g) verify_spec rule library — locked (Phase iii, 2026-06-21)

**Rule extraction strategy — hand-coded, not markdown-parsed.** Per the main
task's open-decision #1. The binding rules are stable; hand-coding them in Python
is the only way to make `verify_spec` reliable. Parsing the prose docs at runtime
would be brittle (heading drift, wording changes) and could not check structural
invariants (connection shape, I/O index ranges) that aren't stated as prose at
all. Each rule carries a `source` string pointing back at the doc section it
enforces, so the prose stays the human-readable statement and the code stays the
executable check — they reference each other rather than one generating the other.

**Shared library, two consumers.** The rules live in
`mcp_server/claude2max_verify/` as a dependency-free package (no `mcp`, no
`spec2maxpat` imports). It backs BOTH the MCP `verify_spec()` tool AND
`spec2maxpat.py convert` (via a guarded optional import that degrades silently if
the package isn't importable). Single source of truth → convert-time and
tool-time findings always agree.

**Severity contract.** `error` = will break the patch or the converter (bad
connection refs, malformed connections, out-of-range outlet/inlet indices —
mirrors the ValueErrors `convert_patcher` already raises, but collected rather
than fatal). `warning` = binding-rule violation that loads but is wrong for the
operator (no presentation view despite UI, unlabelled presented controls, visible
cords on hidden boxes, unhidden formatter message boxes, unlabelled subpatcher
I/O, untracked debug scaffolding). `style` = convention nudge (ALL-CAPS user
names, `[v8]` over `[js]`).

**Convert integration prints to stderr.** `convert` prints `[verify]` findings to
**stderr** so stdout stays pure `.maxpat` JSON. `--no-verify` skips the check
entirely. Warnings/style never block; **errors block** (see § (h)).

**Conservatism over coverage.** Rules are tuned to avoid false positives on real
patches: the I/O-index check fires only when the spec explicitly declares
`inlets`/`outlets` (never guesses); the redundant-message-box check fires only
when every inbound source is an interactive control; the presentation check
exempts pure-DSP patches with no operator controls. Verified against the
production patches — `drift-sequencer-{lcars,soviet}` (114–118 objects) report
zero violations; `jit-grab-scale` correctly flags its genuinely-missing
presentation view.

---

## (h) The anti-guessing gate — convert BLOCKS on unresolved names (2026-06-21)

The motivating problem: even with all the knowledge loaded and correct sample
patches in front of it, Claude lapses into building Max objects/attributes from
training-data memory, and Max *silently accepts* the guesses (missing-object red
box, ignored attribute) — the failure surfaces hours later, out of session. The
problem is epistemic (Claude doesn't believe it needs to check), and prose can't
fix a belief problem. The only robust fix is to remove the possibility of acting
on a guess at the one chokepoint every patch passes through: `convert`.

**Decision: convert is a validating gate that blocks by default.** Maintainer
chose "block by default" over warn-loud. `_gate_spec` runs `verify_spec` WITH an
authoritative resolver; any `error` severity aborts the build (exit 1, nothing
written) unless `--allow-unverified`. This turns the silent, out-of-session
failure into a loud, in-session one — the feedback loop that actually retrains
"resolve first." The same checks run via the `verify_spec` MCP tool so the author
can pre-clear a spec.

**What blocks (resolver-gated, ERROR):**
- `object-unresolved` — a `newobj` name that resolves to no C74 refpage, no
  installed package external, and no abstraction on disk. The canonical
  invented-object case (`oscparse`).
- `attribute-invalid` — an attribute not in the object's complete valid set
  (see below). Applies to ALL objects, not just `live.*`.
- plus the structural errors from § (g) (bad/dangling connections).

**Attribute validity = own refpage ∪ jbox base — the load-bearing finding.** A
Max object's refpage `<attributelist>` lists only its OBJECT-SPECIFIC attributes;
the universal box attributes (textcolor, background, hidden, varname,
presentation, …) are inherited from the `jbox` base class and live once in
`jbox.maxref.xml`, never re-listed per object. Checking against the per-object
refpage ALONE produced ~90 false positives per production patch (textcolor on
`comment`, background on `panel`, …). The fix is to union the jbox base attrs
(parsed from `jbox.maxref.xml`; `_JBOX_FALLBACK_ATTRS` when Max is absent) into
the valid set: `valid(O) = own_refpage(O) ∪ jbox`. This is fully knowable from
the docs — "not re-listed on the per-object refpage" does not mean "unknowable."
With the union, attribute validation is correct for ALL objects and still catches
the canonical trap (`bgcolor` on `live.gain~` — bgcolor is in neither
live.gain~'s refpage nor jbox; its real color attrs are coldcolor / warmcolor /
…). Objects with no refpage at all can't be enumerated, so their attrs aren't
checked (lookup_attribute remains the tool there).

**Validation finding (the gate caught real bugs).** Applied generally, the gate
flagged 4 attrs in the production patches — `panel/locked_bgcolor`,
`number/tribordercolor`, `multislider/contrast`, `multislider/bgfillcolor`. Each
is absent from the object's refpage AND jbox AND from every shipped Cycling '74
patch on that class — three independent signals that they are silent no-ops a
prior session introduced (the exact family-resemblance error the gate targets),
not refpage gaps. So "0 errors on production patches" was the WRONG success
criterion — it had been masking real latent bugs. Residual limitation: if some
object family inherits a valid attr from a base layer other than jbox, it could
be flagged; the `"unverified"` flag / `--allow-unverified` cover that, and such a
case should be reported so the base set can be extended.

**Object resolution handles aliases.** Operators (`+`→`plus.maxref.xml`, …) come
from `add_tutorial.REFPAGE_ALIAS`; common abbreviations (`t`→trigger, `sel`→
select, `s`→send, `r`→receive, `b`→bangbang, `del`→delay, `j`→join) from a small
map in `spec2maxpat._VERIFIED_WORD_ALIASES`, each verified to resolve. Without
these, every `t i i` / `+ 1` in a real patch would false-positive.

**Extension — valid set is now `own refpage ∪ jbox ∪ observed-in-help`
(2026-06-21).** The `.maxhelp` corpus crawl (deliverable (a)) produced a
`maxclass → observed-attrs` map (`maxhelp/maxhelp_observed_attrs.json`): every
attribute set on each class across ~12K shipped help/abstraction/M4L patches,
filtered to a ≥3-box floor and with `rnbo*`/`frozen*` export artifacts dropped.
`_GateResolver._load_observed_attrs()` unions this into `attrs_for()`, so a
refpage-under-documented-but-real attr no longer false-positives. For **no-refpage**
objects the observed set is a **positive allowlist only** — `attrs_for()` still
returns `None` (full space unknown), so the gate never flags an attr absent from
it, but the set can positively confirm one. This is what lets the tools verify
high-vocab externals (`bach.roll` 95, `imubu` 127 attrs) that have no enumerable
refpage.

**Extension — the MCP attribute tools share this resolver (2026-06-21).**
`lookup_attribute` / `list_attributes` were originally refpage-only, so they were
*stricter than the gate* — reporting universal jbox attrs (`hidden`,
`presentation`, …) INVALID while convert accepted them. They now decide validity
through the SAME cached `_GateResolver` (`mcp_server.server._resolver()`; two
public accessors `base_attrs()` / `observed_attrs()` added for provenance
labelling), and `verify_spec` uses the cached instance too. Verified: **0
tool-vs-gate disagreements**. The single server can no longer give two different
answers about the same attribute — which was the whole point of the gate.

**Escape hatches (all explicit, none silent):**
- `"unverified": true` on an object → downgrades its unresolved error to a STYLE
  note (a deliberate, auditable "I confirmed this abstraction exists" assertion).
- a matching `<name>.maxpat` on the search path (cwd, output dir, spec dir, repo
  `patches/`) → auto-OK (real abstraction).
- `--allow-unverified` on convert → build despite errors (emergency override).

**Dependency-free via injection.** The verify package still imports nothing heavy;
`run_all(spec, resolver=...)` takes the resolver as a duck-typed object.
`spec2maxpat.build_resolver()` constructs it from the converter's existing
`RefpageCache` + `PackageObjectsCache` + an on-disk abstraction check + a one-time
scan of the refpage attribute universe. The MCP server passes the same resolver.
