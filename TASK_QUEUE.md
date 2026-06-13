# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

**Also read the *Queue Analysis & Hygiene Notes* section at the bottom of this file** for current cross-task relationships, soft prerequisites, supersession notes, and recent hygiene decisions. The analysis is dated; if it's stale relative to the queue contents above, redo it.

Format: `[pending]` = not started, `[complete]` = done (move to Done section), `[in progress]` = currently being worked on.

**When starting a task**, change its marker to `[in progress]` and add a brief note of what has been done so far (e.g. `*In progress: crawled audio subforum, resuming at MIDI threads*`). This ensures that if the session is cut off, the next Claude instance knows where to pick up. Clear the `[in progress]` marker and note when the task is finished or paused.

---

## Pending — Opus

Tasks requiring deep analysis, architecture decisions, or sustained judgment. Prompt the user to run `/model claude-opus-4-7` before starting any of these.

- [in progress] **Claude2Max MCP server + global enforcement layer — knowledge as queryable tools, Max-file edits gated until tools fire** — Build a Model Context Protocol server (`claude2max-mcp`) that exposes Max-patching knowledge as first-class callable tools, paired with a global skill + PreToolUse hook that mechanically ensures Claude has consulted the tools before editing any Max file. Ship all three pieces designed together as one architecture: MCP for *knowledge representation*, skill for *active invocation*, hook for *enforcement*. The architecture replaces today's prose-pointer-and-hope-Claude-reads-it pattern with knowledge-as-tools-and-can't-act-without-them.

  *In progress (2026-06-13): **Phase (i) Steps 3+4 complete** (all five tools shipped). Step 3: `lookup_object(name)` + `search_packages(term, limit=5)`. Step 4: `lookup_attribute(object_name, attr)` + `list_attributes(object_name)`. Key discovery during Step 4: Max refpage XML carries `enumvals` fields but they are always null — enum valid-value strings are not stored in the refpage XML and cannot be extracted programmatically. The `label` inner-attribute field is the Inspector UI display name (e.g. "Cold Signal Color"), not a list of valid values. `valid_values` is therefore always `[]` in v1; `inspector_label` exposes the display name as a separate informational field. All five smoke tests passed: `lookup_attribute("live.gain~", "bgcolor")` → invalid; `lookup_attribute("live.gain~", "coldcolor")` → valid, type=float, size=4; `list_attributes("live.gain~")` → 32 attrs, coldcolor present/bgcolor absent; package-only objects (no refpage) get "CANNOT VERIFY" response; unknown objects get "OBJECT NOT FOUND". README updated (tool surface table). **Resume at Step 5** — end-to-end real-world test: fresh Claude session in a non-Claude2Max directory, build a small Max patch, verify Claude calls `lookup_object`/`lookup_attribute` during build. Step 5 can be done on Sonnet.*

  **Why this matters**: today's failure mode is well-understood — Claude instances in repos that reference Claude2Max via the global pointer routinely skip the actual consultation step and proceed with training-data Max knowledge. Strengthening the pointer text (2026-05-28) moved persuasion as far as prose can go. The next step has to leave persuasion behind. Two orthogonal problems compound: (a) the knowledge is *prose*, which Claude reads-or-doesn't and remembers-or-doesn't across turns; (b) the consultation is *advisory*, with no mechanical guarantee. This task addresses both at once: MCP turns the prose into queryable tools (knowledge representation), and the skill+hook makes the queries unmissable (enforcement). Either piece alone is incomplete — better tools Claude doesn't call don't help; enforcement of stale prose-loading doesn't fix the brittleness of memorized text. They're designed and shipped together so the architecture is coherent from day one.

  **Architecture — three pieces, one design**:

  1. **MCP server (`mcp_server/`)** — Python, MCP SDK, lives in the Claude2Max repo. Stateless. Reads from the existing source-of-truth files: C74 refpages (`/Applications/Max.app/Contents/Resources/C74/docs/refpages/`), `packages/package_objects.json`, the binding-rule sections of `CLAUDE.md` / `SPEC_REFERENCE.md` / `patching/MAX_PATCHING.md`, `forum_insights.md`, `cookbook_insights.md`. Cached in-memory with mtime-based invalidation. Exposes the tool surface below.

     Tool surface (`claude2max.*`):
     - `essentials() → markdown` — bootstrap; returns the must-load rules. Replaces "read these three files." Called by the skill at session start.
     - `lookup_object(name: str) → {found, source, numinlets, numoutlets, outlettype, digest, use_when, deprecated_by, refpage_text}` — authoritative answer about whether an object exists and how to wire it. THE primary call before any `newobj`.
     - `lookup_attribute(object_name: str, attr: str) → {valid: bool, value_type, valid_values, source}` — explicit query that inverts the silent-failure protection. "Does `bgcolor` exist on `live.gain~`?" answered authoritatively.
     - `list_attributes(object_name: str) → [attr_name, ...]` — full valid-attr list; useful when writing many attrs at once.
     - `search_packages(term: str, limit: int = 5) → [{name, package, digest, use_when}, ...]` — wraps `packages/query_packages.py search`. The "before composing a chain of 3+ native objects" rule made queryable.
     - `verify_spec(spec_json: str) → {violations: [{rule, location, severity, message}, ...]}` — static check against the spec format + binding rules. Severity: `error` (will break), `warning` (binding-rule violation), `style` (convention nudge).
     - `search_pitfalls(term: str) → [{pitfall, context, fix, source}, ...]` — searches Common Pitfalls + forum_insights + cookbook_insights for matches.
     - `lookup_rule(name_fragment: str) → [{rule_name, body, source_file}, ...]` — finds binding rules by name.

  2. **Global skill (`~/.claude/skills/max-patching/SKILL.md`)** — discoverable from any cwd. Description tuned to fire on ANY Max-adjacent trigger (`.maxpat`/`.maxhelp`/`.amxd` mention, Max object name, gen~, jit.*, Node-for-Max, OSC+Max, "build me a Max patch", "edit this patch"). Description leads with silent-failure stakes — same "you will fail silently" framing — so Claude has visible reason to invoke it preemptively.

     Skill body calls `claude2max.essentials()` (MCP) to load the rules into context, then writes a sentinel file at the platform-appropriate temp dir (Python `tempfile.gettempdir()` resolves correctly on macOS/Linux/Windows) — e.g. `<tempdir>/claude2max_loaded_<sessionid>.flag` — that the hook checks. If the MCP server is unreachable, the skill falls back to reading the canonical prose files directly (so the enforcement layer keeps working even if MCP setup is broken). Either way, sentinel gets written if essentials were loaded.

  3. **PreToolUse hook (`hooks/claude2max_max_edit_gate.py`)** — registered in Claude Code's settings under `hooks.PreToolUse` (per-OS path locked in Step 1). Python implementation (not bash/zsh/PowerShell — Python is the only language first-class on all three OSes). Matches `Edit` + `Write` tool calls where target is `.maxpat`/`.maxhelp`/`.amxd` OR `.js`/`.mjs` adjacent to a `.maxpat`. If matched AND the sentinel file in `tempfile.gettempdir()` does NOT exist → hook exits non-zero with stderr: *"Edit blocked: Claude2Max essentials not loaded this session. Invoke the max-patching skill first."* Claude sees the block, invokes the skill (which calls MCP + writes sentinel), retries. Session-id from `$CLAUDE_SESSION_ID` env var; verify availability per-OS in the hook environment; fall back to a per-cwd hash via Python `hashlib` if not present.

  4. **One-command installer (`install_global.py` at the repo root)** — Python for cross-platform parity (a `.sh` would exclude Windows, a `.bat`/`.ps1` would exclude macOS/Linux; Python runs everywhere and is already the toolkit's language). Detects the user's Claude Code config directory (per-OS path table from Step 1), registers the MCP server in their Claude Code MCP config (pointing at `mcp_server/server.py` in the cloned Claude2Max), copies (or symlinks where the OS supports it) the skill into the user-level skills directory, merges the hook entry into Claude Code's settings (idempotent), and confirms in plain English what was installed and how to verify. Re-runnable safely. `--dry-run` shows what would change without writing. `--verify` runs a post-install check that exercises each layer (MCP reachable + skill discoverable + hook fires on a test .maxpat path) — and the `--verify` mode is what student machines run to confirm the install worked on Linux/Windows where the developer machine couldn't test directly. Symmetric `uninstall_global.py` for clean removal.

  **Design space — open decisions**:

  1. **Rule extraction strategy for `verify_spec`** — hand-coded rule classes vs. parsing the markdown rules. Recommendation: hand-coded, because the binding rules are stable enough to enshrine in code and that's the only way to make `verify_spec` reliable. The rules then become a Python package (`mcp_server/claude2max_verify/`) used by BOTH the MCP server AND `spec2maxpat.py convert` — so verification fires at convert time too, not only via MCP.

  2. **What `essentials()` returns** — full prose dump (5K-10K tokens, comprehensive but expensive) vs. structured rule summary (1K-2K tokens, terse but skill can call `lookup_rule` for details). Recommendation: structured summary by default, with `essentials(verbose=true)` for the full dump.

  3. **Caching strategy** — read source files once per server startup and watch mtimes vs. read on every call. Recommendation: read once + watch mtimes (cheap, source files are small, refresh on edit).

  4. **Sentinel scheme if `$CLAUDE_SESSION_ID` isn't available** — per-day file vs. per-cwd file vs. always require explicit skill invocation. Recommendation: probe at install time, fall back to per-cwd (`/tmp/claude2max_loaded_$(echo "$PWD" | md5sum).flag`).

  5. **Tool granularity** — separate tools for `lookup_object` vs. `lookup_attribute` vs. `list_attributes`, or one omnibus `lookup(object, attr=None)` that does all three. Recommendation: separate tools, because the MCP tool descriptions are themselves prompts that bias Claude's behavior — narrower tools with clearer descriptions trigger more reliably.

  6. **Project-level CLAUDE.md snippet** — a template for the user to drop into their own project that says *"Before adding any `newobj` or attribute, call `claude2max.lookup_object` / `claude2max.lookup_attribute`."* This is the prose half of the architecture; the MCP tools are the mechanical half. Snippet maintained alongside the installer.

  7. **MCP server distribution** — runs from the user's local Claude2Max clone (simplest, no packaging) vs. pip-installable package (cleaner for non-cloners). Recommendation: runs from the clone for v1, evaluate pip packaging once usage patterns settle.

  **What to deliver**:
  - `mcp_server/server.py` — MCP server entry point (Python, MCP SDK)
  - `mcp_server/claude2max_verify/` — shared rule library, importable by both MCP and `spec2maxpat.py`
  - `mcp_server/README.md` — install, configure, tool surface, examples
  - `mcp_server/tests/` — golden specs with known violations; assert `verify_spec` returns expected results; tool-call test harness
  - Global skill at the user-level skills directory (per-OS path; see Step 1 path table) installed from `skills/max-patching/SKILL.md` in the repo
  - `hooks/claude2max_max_edit_gate.py` — hook implementation (Python for cross-platform parity)
  - `install_global.py` — one-command installer (Python — not `.sh` because Windows; not `.bat`/`.ps1` because macOS/Linux) with `--dry-run` and `--verify`
  - `uninstall_global.py` — symmetric clean removal
  - `spec2maxpat.py convert` updated to optionally surface verification results from `claude2max_verify`
  - `CLAUDE.md` "Global Enforcement + MCP Knowledge Layer" section documenting the full architecture, install flow, verification, debugging
  - `CLAUDE.md` "New User Setup" Step 3 area — after pointer install, offer to also run `install_global.sh` (with explanation)
  - Real-world verification: build a small patch using ONLY MCP tools (no prose-reading of Claude2Max) in a fresh project on a fresh machine, verify the result conforms to binding rules and the hook blocks edits-without-skill-invocation in each test scenario

  **Prerequisites**:
  - Confirm Claude Code's PreToolUse hook + Edit/Write matcher pattern works as needed (likely yes — existing repo hooks use this surface).
  - Confirm `$CLAUDE_SESSION_ID` is available in hook environment; design fallback sentinel if not.
  - Decide rule-extraction strategy upfront (hand-coded vs. markdown-parsing) — changing later is a refactor.
  - Decide `essentials()` default verbosity (structured summary recommended).
  - Verify MCP Python SDK is stable + Claude Code's MCP host supports the tool patterns needed.
  - Decide tool granularity (recommendation: narrow tools).

  **Working in the c2m repo**: yes, the MCP server can live entirely in the Claude2Max repo. `mcp_server/` as a new top-level directory. The server is invoked by Claude Code's MCP host pointing at `mcp_server/server.py`; the host manages the long-lived process. No external infrastructure needed. The server reads the existing source-of-truth files on disk. The installer wires Claude Code's MCP config to point at the server's path on the user's machine (resolved from the same Claude2Max-clone path the existing global pointer references).

  **Fits into the larger system**: this is the architecturally complete answer to "how do we ensure Claude has the Max knowledge it needs?" The strengthened global pointer (2026-05-28) closed what could be closed with prose. This task closes the remaining gap with mechanics: knowledge becomes tools, tool invocation becomes mandatory at Max-touching moments. Pairs with the Community Knowledge Pipeline task — incoming PRs from forks can include not just prose insights but also test cases that get added to `verify_spec`'s rule library, growing the MCP's coverage over time. Pairs with the Repo-as-Total-Scope Enforcement task — that task addresses the same persuasion-vs-enforcement gap from the *inside-the-repo* direction; this task addresses it from the *outside-the-repo* direction. Together they close the loop on "Claude2Max defines the operating environment whenever Max is involved, wherever the cwd happens to be." **Supersedes** the proposed `/c2m-refpage` skill (was subtask 5 of the Plugin/skills polish pass, now struck) — MCP's `lookup_object(name)` does what that skill would have done, but as a first-class tool with authoritative-result semantics rather than skill-printed text. **Soft prerequisite**: running the Promotion-candidate review pass first improves the launch quality of `essentials()` by ensuring any insights still flagged `[PROMOTION-CANDIDATE]` in `forum_insights.md` / `cookbook_insights.md` have landed in the canonical docs the MCP reads from. Not a blocker, but cheap and worth doing in the session before Step 2.

  **Timeline note**: scoped during May 2026 with no students until September — sufficient runway to design the architecture properly, build all three layers, test against multiple project topologies, and verify behavior on a fresh machine before students arrive. Suggested phasing: (i) MCP server with `essentials()` + `lookup_object` + `lookup_attribute` shipping first as the foundation; (ii) `verify_spec` + the shared rule library second; (iii) skill + hook + installer third, gated on MCP being functional; (iv) integration with `spec2maxpat.py convert` last. Each phase independently testable.

  **Phase (i) Step-By-Step** (planned 2026-05-28 — the entry path into the MCP foundation; each step sized to be a single focused session):

  **Step 1 — Research & decisions, cross-platform from the start (no code, ~1 hour)**. Lock in choices before code. The toolkit must work on macOS, Linux, and Windows — students will be on all three; assumptions about path conventions, shell, and temp directories cannot leak into the design. (a) MCP SDK: confirm Python MCP SDK is current standard (Python is the right language for everything here precisely because shell scripts don't cross platforms); pin a version in `mcp_server/requirements.txt`. (b) Claude Code MCP config location on **each supported OS** — exact path + JSON schema on macOS (typically under `~/Library/Application Support/Claude/`), Linux (typically `~/.config/Claude/`), Windows (typically `%APPDATA%\Claude\`); confirm the macOS path by inspecting an existing MCP server install on the available machine (e.g. one of the `mcp__*` servers already visible in active sessions like `mcp__ccd_session__*` or `mcp__Claude_in_Chrome__*`); confirm Linux and Windows paths by reading Claude Code's official docs (do NOT guess paths — Claude Code config locations have historically moved). Capture the per-OS resolution as a table in the deliverable. (c) `$CLAUDE_SESSION_ID` availability in the PreToolUse hook env on each OS — write a small Python hook that records the env to a file, trigger from a test session on macOS first (the available platform), confirm presence; flag Linux/Windows verification as a follow-up that the installer's `--verify` mode will exercise on student machines. If `$CLAUDE_SESSION_ID` is absent on any platform, design fallback sentinel using a portable scheme (per-cwd hash via Python's `hashlib`, stored in `tempfile.gettempdir()` so the path resolves correctly on every OS without hard-coded `/tmp`). (d) Implementation language for installer, hook, and any glue scripts: **Python, NOT shell** — bash/zsh won't run on Windows, PowerShell won't run on macOS/Linux, Python is the only language first-class on all three and is already the toolkit's language. The installer is `install_global.py`; the hook is `hooks/claude2max_max_edit_gate.py`. (e) Tool granularity locked to narrow tools per the design recommendation. (f) Caching locked to read-once + mtime watching. Deliverable: `mcp_server/DESIGN_DECISIONS.md` capturing the locked choices — especially the per-OS path table and the sentinel scheme — so future sessions don't re-litigate and so the Linux/Windows verification on a student machine has a concrete spec to test against.

  **Step 2 — Server skeleton + `essentials()` (~1 short session)**. Smallest functional MCP server proving end-to-end wiring. Create `mcp_server/` with `server.py`, `__init__.py`, `requirements.txt`, `README.md` (stub). Implement the server with ONE tool: `essentials()` returning a structured-summary markdown (~1.5K tokens) extracted from the binding-rule sections of `CLAUDE.md`, `SPEC_REFERENCE.md`, and `patching/MAX_PATCHING.md`. Initial extraction can be a hand-written Python constant — automate later. `mcp_server/README.md` documents SDK install, manual Claude Code MCP registration (installer comes later), and the expected tool surface. Smoke test: register the server in Claude Code, open a fresh session in a non-Claude2Max directory, call `claude2max.essentials()`, verify the markdown returns and is sensible. Deliverable: working one-tool MCP server callable from any Claude session on the machine.

  **Step 3 — `lookup_object()` (~1 session)**. The highest-value tool. Wraps existing infrastructure. Add `lookup_object(name: str)` to the server. Reuse `RefpageCache` from `spec2maxpat.py` for C74 objects; fall through to `packages/package_objects.json` for installed package externals (same lookup chain the converter already uses). Return shape: `{found, source ("c74-refpage" | "package" | "unknown"), numinlets, numoutlets, outlettype, digest, use_when, deprecated_by, refpage_text}`. Tool description leads with: *"Call this before adding any `newobj` to a Max patch. Returns authoritative existence + I/O signature + use_when. Skipping this call produces silent-failure patches when names that 'sound right' turn out to be wrong."* Smoke test cases: `lookup_object("metro")` → resolves from C74; `lookup_object("oscparse")` → reports unknown (the canonical example of a guess that lands as a red box); `lookup_object("cv.jit.faces")` → resolves via the package library. Deliverable: structured object knowledge accessible as a tool.

  **Step 4 — `lookup_attribute()` + `list_attributes()` (~1 session)**. The attribute side of the silent-failure protection. Extend `RefpageCache` (or add a sibling) to parse `<attribute>` entries from the refpage XML for a given object — same caching pattern as objects. `lookup_attribute(object_name, attr)` returns `{valid: bool, value_type, valid_values, source}`. Critical use case: *"Does `bgcolor` exist on `live.gain~`?"* → `{valid: false, ...}` rather than silent success. `list_attributes(object_name)` returns all valid attrs as a list — useful when Claude is writing multiple attrs at once. Smoke test: `lookup_attribute("live.gain~", "bgcolor")` → invalid; `lookup_attribute("live.gain~", "coldcolor")` → valid (per the existing rule about `live.gain~` color attrs documented in CLAUDE.md). Deliverable: attribute verification as a tool. With this and `lookup_object`, the two highest-frequency silent-failure modes are addressable.

  **Step 5 — End-to-end real-world test (~1 short session)**. Prove the foundation works without prose-reading. Open a fresh Claude session in a non-Claude2Max directory. Ask the session to build a small Max patch (something like "make me a 4-step sequencer playing MIDI notes"). Verify Claude calls `lookup_object` / `lookup_attribute` during the build — this likely requires a CLAUDE.md snippet in the test project telling it to (that's the "project-level CLAUDE.md snippet" deliverable from the main task's design space). Compare the resulting patch against what an unguided Claude (no MCP) would produce: fewer unknown-object red boxes, correct attribute names, presentation conventions respected. Document findings in `mcp_server/SMOKE_TEST_RESULTS.md` for the next phase. Deliverable: real-world evidence the foundation works; informs Phase (ii) (`verify_spec` + rule library) and Phase (iii) (skill + hook + installer). **Pairing note**: this test scenario overlaps with the "Refine the student/user setup process" Sonnet task — both want to validate a fresh-machine, fresh-project Claude session against a real onboarding flow. Run them in the same session window if convenient; the fresh-machine setup the Student Setup task wants to test is the same fresh-machine setup MCP Step 5 needs.

  After these five steps the MCP foundation is in place. Remaining phases build on it without needing redesign.

- [pending] **Community Knowledge Pipeline — auto-gather usage data per fork, auto-PR back to upstream** — Every cloned Claude2Max fork should passively gather *structured* observations during use — what skills were invoked, which workflows fired, errors hit and how they were resolved, surprising Max behaviors, friction points, ideas the student articulated, instructor corrections — into a community-knowledge file on the student's `insights/<name>` branch. Periodically (after N entries, on natural commit moments, or via an explicit `/c2m-share-insights` skill), Claude opens a pull request against `jjannone/Claude2Max` to merge the generally-useful entries back into upstream knowledge files.

  **Why this matters**: the rule "Never use local Claude memory as a substitute for repo documentation" already says the repo is the canonical knowledge base. But knowledge currently only flows ONE way — upstream-down. Every student session generates real signal (their errors, their workarounds, the Max gotchas they hit, the workflows that did or didn't fit) that disappears unless they manually write a PR. This pipeline closes the loop. The "Default Workflow — Your Own GitHub Fork" section in CLAUDE.md was added to make this possible — every student now has a fork, so every student now has a PR origin.

  **Design space**:

  1. **Data model** — extend the existing `insights.md` with a more structured companion (e.g. `community-data/observations.jsonl`) carrying: timestamp, category (`error-and-fix` / `workflow-observation` / `max-behavior` / `friction-point` / `feature-request` / `instructor-correction`), session context (file/skill), summary, optional `[shareable]` flag. JSONL keeps it append-only and machine-iterable; the prose `insights.md` stays for human-readable narrative.

  2. **Capture moments** — Claude appends to the log when: a user corrects Claude's approach (already covered by the "Rules from Corrected Errors" rule, but currently only writes to CLAUDE.md proposals, not the log); an error surfaces in tool output that gets diagnosed and resolved; the student articulates a workflow preference; an instructor's response contains a non-obvious correction. Each capture is in-band, not a separate "tell Claude to log this" step.

  3. **Anonymization / scope filter** — entries flagged `[shareable]` must be scrubbed of personal data (file paths inside the student's home dir, names of their pieces, student name, instructor name unless they consent) before going into a PR. Entries scoped to the specific student's project stay on their fork. Decide whether Claude does this at write time (better hygiene) or at PR time (less intrusive — but the raw log on the fork still leaks).

  4. **PR cadence** — three triggers worth designing for: (a) automatic at natural commit moments when N shareable entries accumulate (N tunable, default ~5); (b) explicit via a new `/c2m-share-insights` skill the student invokes; (c) at session end if any shareable entries are unshared. Whichever fires, the student must see the PR draft (title, body, diff) and approve before `gh pr create` runs.

  5. **Merging on the upstream side** — incoming PRs land observations into a `community-observations/` folder organized by category, with each contribution preserved as a dated entry. A separate review pass (manual, or via an `/c2m-promote-observations` skill) periodically lifts reusable insights into the canonical reference docs (`patching/MAX_PATCHING.md`, `SPEC_REFERENCE.md`, `cookbook/cookbook_insights.md`, etc.) — same promotion-candidate model already used for forum/cookbook insights.

  6. **Branch model** — observations live on `insights/<name>`. PRs go from that branch on the student's fork → `community-observations/` on upstream main. Each PR is additive, not editing existing files — keeps conflict surface near zero.

  7. **Skill surface** — at minimum `/c2m-share-insights` (review + anonymize + open PR) and `/c2m-log-observation <category> <text>` (the explicit-capture form for entries Claude would otherwise miss). The passive capture path is the primary one; the explicit form is the escape hatch.

  **What to deliver**:
  - `community-data/observations.jsonl` schema documented in CLAUDE.md
  - `.claude/skills/c2m-share-insights/SKILL.md` + helper script
  - `.claude/skills/c2m-log-observation/SKILL.md` + helper script
  - PostToolUse hook (or equivalent) that recognizes capture moments and appends structured entries
  - Upstream-side `community-observations/` folder layout + README
  - CLAUDE.md "Community Knowledge — Insights Flow Upstream" section describing the pipeline end-to-end
  - Update existing "Default Workflow — Your Own GitHub Fork" section to point at this pipeline as one of the reasons to fork (already named in passing — make the reference concrete once the pipeline exists)

  **Prerequisites**:
  - "Default Workflow — Your Own GitHub Fork" must be live (done 2026-05-27).
  - Decide whether anonymization is at write time or PR time.
  - Decide the JSONL category vocabulary up front; changing it later requires migrating every fork's log.

  **Fits into the larger system**: closes the knowledge loop. Currently every Claude2Max convention propagates downstream (upstream → fork → session). With this pipeline, real-world friction propagates upstream (session → fork → PR → upstream knowledge files), so the next student inherits everyone else's lessons. Pairs naturally with the existing promotion-candidate review pass.

- [pending] **Repo-as-Total-Scope Enforcement System** — Design and implement a system that makes the Claude2Max repo's rules, guidelines, workflows, and resource libraries *the entire operating environment* for any Claude session whose cwd is this repo. The goal is that "in this repo" means: the repo defines the work scope, the procedures, the thought-process, the resource libraries, and the action vocabulary. There is no independent thought except as it relates to the repo — improvements to the repo can be *proposed*, but until they are implemented, behavior conforms exactly to the repo as currently written.

  **Why this matters**: rules and guidelines that are written but not enforced are decorative. The repo currently has hundreds of lines of rules in CLAUDE.md, patching/MAX_PATCHING.md, SPEC_REFERENCE.md, TUTORIAL_GUIDELINES.md, PRE_EDIT_CHECKLIST.md, and others. The rules are correct, but compliance depends on the model noticing the rule applies and choosing to follow it. The "Partial Answers Are Not Consent" violation on 2026-05-02 is a recent example: the rule existed, the rule was visible in CLAUDE.md, the rule did not fire because action mode overrode noticing. Any rule that depends on noticing has a failure mode. The repo means something only if the rules are mechanically guaranteed.

  **Design space — what to investigate**:

  1. **Categorize every existing rule by enforcement class**:
     - **Mechanical** — can be enforced by a hook or script (path conventions, ALL CAPS naming, sync-before-edit, embedded-spec presence, hidden-codebox marker, no `.json` specs in project root, no `cd` in Bash commands).
     - **Verifiable post-hoc** — can be checked after the fact (every presented control has a comment label, every inlet/outlet has both inside and outside labels, every new attribute appears in the refpage XML).
     - **Judgment-only** — no mechanical check possible, depends on model self-discipline (re-ask unanswered question parts, propose before enshrining, generalize before writing rules, observe-good-pattern preservation).

  2. **Build the enforcement layer for the mechanical class**:
     - Audit all existing hooks in `.claude/settings.json`. What's enforced? What isn't?
     - For each mechanical rule, decide: PreToolUse hook (blocks the action), PostToolUse hook (validates after), or Bash wrapper (validates command before run).
     - Add hooks to cover every mechanical rule. A rule with no enforcement is a rule that can be silently broken.

  3. **Build the verification layer for the post-hoc class**:
     - A `verify_repo_invariants.py` script that walks the repo and validates every checkable invariant (every `.maxpat` has embedded spec, every presented box has comment label, etc.).
     - Run automatically via hook at session end, or before every commit, or both. Block commits that fail invariants.

  4. **Build the discipline layer for the judgment-only class**:
     - Self-audit prompts surfaced at the right moment. Existing PRE_EDIT_CHECKLIST.md is the prototype but it's flat — every item fires for every Edit, regardless of relevance.
     - Investigate: trigger-tagged rules. Each rule declares its trigger condition (e.g. `trigger: prior_turn_ended_with_multi_part_question`). The hook injects only triggering rules.
     - Investigate: forcing-function checklists at category transitions (about to commit → re-read commit-time rules; about to design UI → re-read presentation rules; about to start new session → re-read session-start rules).

  5. **Rule registry / single source of truth**:
     - Should rules live in one structured file (`RULES.yaml` with id, statement, trigger, enforcement-class, rationale) and the prose `*.md` files render from that? Pro: one canonical list, machine-iterable, prevents drift between files. Con: forces structure on prose that currently flows naturally.
     - Or stay with prose `*.md` and add a `rule_index.py` that scrapes them into a structured form? Less invasive, more brittle.
     - Decide.

  6. **Violation log and auto-improvement loop**:
     - Every caught violation gets appended to `VIOLATIONS.md` (date, rule violated, what triggered the failure mode, what mitigation was added).
     - Read at session start so the next session sees the failure pattern explicitly.
     - The mitigation is *always* a repo change (hook, rule, checklist item) — never just "I'll try to remember." If the mitigation is "remember harder," the failure will recur.

  7. **The "no independent thought" frame**:
     - Add an explicit declaration to CLAUDE.md: while in this repo, the repo's rule corpus is total. Behavior outside the corpus is either (a) a covered case I missed (find the rule and follow it), (b) a gap in the corpus (propose a rule extension; do not act until it's enshrined), or (c) a violation. There is no fourth option.
     - This is the meta-rule that frames every other rule. Without it, every rule is opt-in.

  8. **Scope boundary**:
     - "In the repo" means cwd is the repo or a subdirectory of it. At session start, detect this and switch into total-scope mode. Outside the repo, normal Claude operation.
     - What about external tools (web fetch, package search, refpage lookup)? These are *resources the repo declares*, so they're in-scope. Anything not declared is out of scope until added.

  **What to deliver**:
  - An `ENFORCEMENT.md` design doc enumerating every existing rule, its enforcement class, and its enforcement mechanism (existing or proposed).
  - Hook implementations for all mechanical rules currently lacking enforcement.
  - A `verify_repo_invariants.py` script for the post-hoc class.
  - A trigger-tagged rule registry (or scraper) for the judgment-only class.
  - A `VIOLATIONS.md` log seeded with the known failure modes from `WORK_HISTORY.md` (partial-answer-as-consent, family-resemblance attribute guessing, modify-don't-rebuild, observed-good-binding, etc.).
  - A new top-level CLAUDE.md section ("**The Repo Is Total**") declaring the no-independent-thought principle and the propose-before-act gate.

  **Prerequisites**:
  - Read every `*.md` rule file in the repo to assemble the full rule inventory.
  - Audit current `.claude/settings.json` hooks and `hooks/` scripts to know what's already enforced.
  - Read `PRE_EDIT_CHECKLIST.md` and `hooks/inject_admonitions.py` carefully — the trigger-tagged-admonition pattern is the existing prototype for the judgment-layer mechanism.

  **Fits into the larger system**: this is the spine that makes every other rule load-bearing. Without it, every other entry in TASK_QUEUE.md, every CLAUDE.md rule, every checklist item is advisory. With it, the repo defines a strict operating environment that any Claude instance — current or future, this user or another — is bound to.

- [in progress] **Cycling '74 Projects Crawl** — Systematically crawl `https://cycling74.com/projects` (the community projects gallery), build a searchable database of user projects organized by topic/interest area, and read accompanying patches (`.maxpat` / `.maxproj`) where available to extract patching insights into the same knowledge corpus as the forum and cookbook crawls.

  *In progress (2026-05-03c): pages 1-21 surveyed = **210 projects of 1822 captured (~11.5%)**. Final classification after triage: **37 free-extractable** (15 GitHub + 4 MaxForLive.com + 2 Google Drive + 1 direct-download + 15 author-site free/academic), 118 commercial, 49 showcase, 6 still-ambiguous, 0 inline. **Era-split confirmed**: pages 1-11 (2024-26) yield ~11% free; pages 12-21 (2021-23) yield ~25% — older era is **5× more open-source**. **3 patches analyzed** so far in `c74_projects_insights.md`: transient_crossfade (gen~ envelope split — 3 promotion-candidate gen~ patterns), !SHAKE! (parent/child multi-outlet abstraction + sub-Hz cycle~), Dirigera Max (exemplar community-package layout). 34 free candidates queued in insights "Future-analysis queue". Database maintains an Observations section with 8 named gallery-shape findings.*

  **Next-session options**:
  1. **Continue analysis pass on the queued 34 free-extractable** (native-Max only — three georgeNikmus repos excluded per 2026-05-04 user decision; they're Pd-shim or binary ports, not native Max idiom). Top priorities: Facet (mjcella, ★★, 109 stars — active live-coding system), sonus (★★, C++ algorithmic composition package), DGMD (★★, ML training-data generator), SwiftRNBO (★★, Swift↔RNBO host-integration), the 4 free MaxForLive devices, and the academic author-site set (MMM4Live, Cosmolab, ATTRACTORS).
  2. **Continue forward — pages 22-31** — extends the older-era sample; based on the era-split trend, expected ~25-30% free yield rate.
  3. **Sample-deep — pages 50, 100, 150** — confirms whether the era-trend is monotonic or hits a floor.
  4. **Promotion-candidate review pass** for the 5 PROMOTION-CANDIDATEs already flagged in `c74_projects_insights.md` (gen~ slide envelope follower; gen~ samplerate→ms idiom; gen~ equal-power vs linear crossfade with selector; sub-Hz cycle~ as canonical slow LFO; community-package layout reference). All await user confirmation before promotion to `patching/MAX_PATCHING.md`.

  **What this is**: The Projects gallery is community-submitted Max work — instruments, performances, installations, tools, generative systems, video pieces, etc. It's a different surface from the forums (questions/answers) and the cookbook (curated educational examples): it's *finished work* tagged by author with descriptions, screenshots, audio/video, and often downloadable patches. High-signal source for "how do experienced users actually structure a complete patch?"

  **What to build** (mirrors the `c74-forum/` and `cookbook/` patterns):

  1. **New folder `c74-projects/`**:
     - `C74_PROJECTS_CRAWL_LOG.md` — session recipe, progress tracking, resume point (modeled on `c74-forum/FORUM_CRAWL_LOG.md` and `cookbook/COOKBOOK_CRAWL_LOG.md`)
     - `c74_projects_crawl_state.json` — per-project status (`pending` / `enumerated` / `downloaded` / `analyzed` / `skipped`), with metadata: title, author, tags, description URL, attachment URLs, last-seen date
     - `c74_projects_database.md` — the searchable project catalog itself, organized by interest area (audio synthesis, sequencing, video/Jitter, installations, controllers, AI/ML, generative composition, live coding, instrument design, etc.). Each entry: title, author, one-line summary, tags, link, date, "patches available: yes/no"
     - `c74_projects_insights.md` — patching insights extracted from downloaded patches, organized by topic to match `c74-forum/forum_insights.md` and `cookbook/cookbook_insights.md` (Audio/MSP, Jitter, JS/v8, Patching Patterns, UI, MIDI, Performance). Mark entries `[PROMOTION-CANDIDATE]` where they'd improve the reference docs.

  2. **Crawl approach** — chunked across sessions:
     - Enumerate the projects gallery (paginated; track total project count)
     - For each project: scrape title, author, description, tags, attachment URLs
     - Download any `.maxpat` / `.maxproj` / `.zip` containing patches (with user permission per the download rules)
     - Open patches and analyze: trace signal flow, identify non-obvious patterns, capture techniques worth reusing
     - Update `c74_projects_database.md` with the catalog entry; update `c74_projects_insights.md` with any patching insights

  3. **Searchable database design**: Markdown table or topic-grouped sections — searchable by `grep` like the existing knowledge files. Optionally: a `query_c74_projects.py` CLI mirroring `packages/query_packages.py` (search by tag, author, has-patch).

  4. **Refresh cadence**: Re-enumerate the gallery periodically (monthly?) and append new projects. The crawl state JSON tracks `last-seen date` so re-runs only process new entries.

  5. **CLAUDE.md "Knowledge Resources" section update**: add `c74-projects/c74_projects_database.md` and `c74-projects/c74_projects_insights.md` to the index once first session completes.

  **Prerequisites**:
  - Cookbook crawl pattern (`cookbook/enumerate_cookbook_recipes.py`, `cookbook/COOKBOOK_CRAWL_LOG.md`) is the closest template — copy that shape
  - `python3 spec2maxpat.py mct_decode` for any embedded MCT blocks
  - Download permission rules apply per CLAUDE.md (ask before downloading attachments)

  **Fits into the larger system**: third source of community Max knowledge alongside `c74-forum/` (Q&A) and `cookbook/` (curated educational). Together these give Claude a much broader sense of "how is Max actually used in the wild" than refpages alone. Insights flow upward into `patching/MAX_PATCHING.md` / `SPEC_REFERENCE.md` via the existing promotion-candidate review pass.

- [pending] **TouchOSC mk2 Integration** — Add a parallel converter (`spec2tosc.py`) to Claude2Max that generates a TouchOSC mk2 `.tosc` layout file from the same spec used to generate a Max patch. The goal is a single spec that produces both a Max presentation mode UI and a matching (or partial) TouchOSC control surface, with the Max patch auto-wired to receive OSC messages from the TouchOSC layout.

  **What to build**:
  1. **Research the `.tosc` binary format** — find and evaluate existing Python libraries (search for `touchosc-tools`, `tosc`, or similar). If a reliable library exists, use it. If not, implement a writer based on the community-documented binary spec. Document findings in a `TOSC_FORMAT.md` reference file.
  2. **Spec extensions** — add TouchOSC-specific fields to the existing spec format so a single spec can drive both converters. New per-object fields: `osc_address`, `value_range` (min/max), `tosc_type` (fader, button, xy, label, encoder, etc.), `tosc_page`, `tosc_group`, `tosc_color`, `tosc_script` (Lua), `tosc_link` (control linking). A `tosc: false` flag excludes an object from the TouchOSC layout. Objects with no `tosc_*` fields but with `presentation` coordinates default to being included with sensible TouchOSC mappings.
  3. **`spec2tosc.py` converter** — parallel to `spec2maxpat.py`, same CLI pattern (`convert`, `extract`, `sync`). Reads the embedded spec from a `.maxpat` (or a standalone `.json`), produces a `.tosc` file alongside the `.maxpat`. Full mk2 feature support: pages, groups, Lua scripting, control linking, color themes.
  4. **Max receive side** — when generating the Max patch, auto-add `receive` and `route` objects for each OSC address defined in the spec, wiring them to the appropriate controls. This keeps the Max and TouchOSC sides in sync without manual wiring.
  5. **Subset selection** — the spec can mark controls as Max-only, TouchOSC-only, or both. The default (no flag) is both. This lets complex patches expose a curated performance subset on TouchOSC while keeping full controls in the Max presentation view.
  6. **SPEC_REFERENCE.md and CLAUDE.md updates** — document all new spec fields, the TouchOSC workflow, and the OSC address convention (e.g. `/patch-name/control-name`).

  **Prerequisites**:
  - TouchOSC mk2 installed and tested on a device
  - Research the `.tosc` format before writing any code — do not guess at binary structure
  - Existing `spec2maxpat.py` infrastructure (RefpageCache, spec embedding, CLI pattern) should be reused or shared where possible

  **Fits into the larger system**: Claude2Max already generates Max patches from specs. This adds a second output target (TouchOSC) from the same source of truth. The long-term vision is: describe a patch once, get a Max patch + presentation UI + TouchOSC surface, all in sync.

- [in progress] **Max Cookbook Analysis** — Systematically crawl https://music.arts.uci.edu/dobrian/maxcookbook/ (Chris Dobrian / UC Irvine), open every example patch, and extract patching insights to a new `cookbook/` knowledge folder.

  *In progress (2026-05-02): infrastructure built — `cookbook/enumerate_cookbook_recipes.py` (Drupal-markup parser), `cookbook_crawl_state.json` (status: pending → scanned → downloaded → scraped/skipped), `COOKBOOK_CRAWL_LOG.md`, `cookbook_insights.md` (topic-organized like `forum_insights.md`).*

  **Progress as of 2026-05-02 — most of the work is still ahead.**

  - **Enumeration**: 741 recipes total. 6 unreachable (5 no-attachment, 1 404 on slug `204`). **735 viable.**
  - **Page-metadata scan** (cheap first pass — title + attachment URL identified): 723 scanned, 12 downloaded, 5 skipped, 1 pending. Effectively complete.
  - **Patch download**: only 12 recipes have status `downloaded`. The patches mined for insights below appear to have been processed outside the state machine and are not reflected in the on-disk status counts.
  - **Insight extraction (the substantive work)**: **23 of 735 viable recipes analyzed (~3%)**. Two chunks done — (1) MSP envelope/amplitude — 11 recipes, 16 insights, 3 PROMOTION-CANDIDATEs (2026-05-01h); (2) Jitter matrix manipulation — 12 recipes, 12 insights, 3 PROMOTION-CANDIDATEs (2026-05-01k). **0 recipes have reached the final `scraped` status flag** — the state machine's terminal status is unused; the log is the source of truth for what's been analyzed.
  - **Remaining**: ~712 viable recipes to open, trace, and mine.

  **Per-session target (updated 2026-05-03)**: aim for **20 recipes per session** (was 12). Rationale per user: gather more data per session and see what shape the insight stream takes at higher throughput before deciding the project's long-term cadence. State-machine `scraped` flag should be set as recipes are processed so the on-disk count matches reality (currently the log is the source of truth — fix this drift inline with the next chunk).

  **Resume point**: pick the next chunk per `cookbook/COOKBOOK_CRAWL_LOG.md` — candidate clusters include Jitter GL/3D, Jitter video-sources/feedback, MSP buffer/loop, MSP synthesis, Max sequencer/composition, MIDI.*

  **What this is**: The Max Cookbook is a curated educational reference covering foundational and advanced Max patching patterns. Each section has text explanations plus downloadable example patches. **Insights live in the patches, not the text** — every example patch must be downloaded and read in full, not just the page descriptions.

  **What to build**:
  1. **New folder `cookbook/`** alongside `c74-forum/` — holds all crawl state and outputs:
     - `COOKBOOK_CRAWL_LOG.md` — session recipe, progress tracking (modeled on `c74-forum/FORUM_CRAWL_LOG.md`)
     - `cookbook_crawl_state.json` — per-section status: `pending` / `downloaded` / `scraped` / `skipped`
     - `cookbook_insights.md` — extracted insights, topic-organized to match `c74-forum/forum_insights.md` (Audio/MSP, Jitter, JS/v8, Patching Patterns, UI, MIDI, Performance)
  2. **Crawl approach** — chunked across sessions like the forum crawl:
     - Enumerate all sections and linked pages
     - For each section: read the page text, then download/decode every example patch (MCT block or `.maxpat` link)
     - Analyze each patch in full: trace signal flow, read all box text, identify non-obvious patterns
     - Extract insights to `cookbook_insights.md` with the source section title
     - Mark entries `[PROMOTION-CANDIDATE]` where they'd improve `SPEC_REFERENCE.md`, `packages/package_objects.json`, or `patching/MAX_PATCHING.md`
  3. **Link-following protocol** — on every page, follow linked external resources and classify:
     - **Small resource** (single page, self-contained doc): scan immediately and add insights inline
     - **Large resource not already addressed** (multi-page site, book, course): note it in `COOKBOOK_CRAWL_LOG.md` and surface a task proposal to the user — do not auto-add to queue
     - **Already addressed** (forum.cycling74.com, installed package docs): note the overlap and skip
  4. **Promotion pass** — at the end of each session, scan for `[PROMOTION-CANDIDATE]` entries and propose adding them to the appropriate repo file

  **Session format**: read `cookbook/COOKBOOK_CRAWL_LOG.md` to see what's covered, pick a focused section cluster, download + analyze patches, write insights, update state and log.

  **Prerequisites**:
  - `python3 spec2maxpat.py mct_decode` for any MCT blocks on the site
  - CLAUDE.md already updated with `cookbook/cookbook_insights.md` in the Knowledge Resources index
  - `cookbook/` folder does not exist yet — create it at the start of the first session

- [pending] **Return to claude2max-design skill — extend design sense + Phase 3 screenshot verification on current patches** — merger of "Test claude2max-design skill" and "Layout Engine Phase 3" (both 2026-04-26/27 era). The c2m-design skill in its current form is fundamentally incomplete — it has no generalized design sense, cannot extract design principles from sample references, and cannot reliably implement the principles it does understand. Phase 3 (screenshot verification of presentation views) is the natural verification half of this same loop: design intent in, screenshot out, gap measured.

  **What's broken / missing in c2m-design**:
  1. **No principle extraction from samples** — the skill can't take a reference image (a real LCARS screen, a Swiss poster, a Constructivist composition) and back out the visual rules driving it (hierarchy, alignment, proportional system, color rhythm, type scale). It only consumes rules someone else articulated up front.
  2. **Weak generalization** — given the 10 themes in `c2m-themes/themes/*.css`, the skill applies token values literally but can't compose new layouts that obey the underlying philosophy without being told the philosophy explicitly.
  3. **Implementation gap** — even when the skill correctly states a design rule (e.g. "use an 8px baseline grid", "labels right-align with their controls"), it doesn't enforce that rule in the generated `presentation_rect` coordinates.

  **Phase 3 — screenshot verification (originally a separate Sonnet task)**:
  - Use computer-use MCP to screenshot current patches' presentation views and compare against design intent
  - Catch: overlapping objects, clipped text, label/control misalignment, broken visual hierarchy, color contrast failures, comment-padding compensation drift
  - Fix issues found and re-screenshot to confirm
  - Patches in scope (current repo state — replaces 2026-04-27 references to face-capture which was rebuilt as jit-grab-scale on 2026-04-30):
    - `patches/drift-sequencer-lcars.maxpat`
    - `patches/drift-sequencer-soviet.maxpat`
    - `patches/jit-grab-scale.maxpat`
    - `patches/ensemble-sequencer-v5.maxpat`
    - `patches/lcars.maxpat`

  **What to build / explore**:
  1. **Sample → principles extractor** — feed reference images (a screenshot of a real LCARS console, a Swiss poster scan, a Bauhaus layout), extract explicit rules: alignment grid spacing, type scale ratios, color palette in token form, spacing rhythm, hierarchical weight assignment. Output writable as additions/refinements to a theme CSS file.
  2. **Principles → coordinates emitter** — take an articulated rule set + the spec object list, emit `presentation_rect` tuples that obey the rules. The "Layout Engine Phase 1" function (`presentation_layout()` in `spec2maxpat.py` — Phases 1 & 2 complete 2026-04-26) is the existing seam to extend.
  3. **Verification step** — screenshot the resulting patch, compare against the principles, flag drift. This closes the loop and is the original Phase 3 deliverable.

  **Prerequisites**:
  - Computer-use MCP enabled and screen recording granted
  - Familiarity with `c2m-themes/` token contract (`tokens.css` + per-theme overrides)
  - Existing `presentation_layout()` function in `spec2maxpat.py`
  - Per CLAUDE.md model-selection rule #6: this task warrants Opus or a Claude Design hand-off — prompt the user before starting

  **Inlet/outlet labeling rule** (carries forward from Phase 2): every subpatcher / abstraction / poly~ must label inlets and outlets in two places — `@comment` attr on the `p` / `poly~` box (outside) AND a `comment` box adjacent to each `inlet`/`outlet` (inside). Never create an encapsulated unit without both.

  **Source**: 2026-05-03 queue review with user. Merging makes the design loop end-to-end: principles in, layout out, screenshot verified, drift caught.

- [in progress] **Forum Knowledge Crawl** — Systematically crawl the Cycling '74 forums in chunks, extracting Max principles, techniques, and approaches from experienced community members. Build a growing reference of non-obvious patching knowledge that supplements the official docs.

  *In progress (2026-05-06 — pass-5 chunk done): **1708 threads total in state** (1177 pre-pass-5 + 548 added in pass-5 — split 204 artifact-bearing / 344 zero-artifact). Pass-5 covered Gen pp.16-25 + Jitter pp.23-32 + MaxMSP pp.25-34 + Javascript pp.20-27 + RNBO pp.13-19 + Max For Live pp.16-22 + Misc pp.13-18. 180 artifact files saved to `/tmp/forum-pass5/`. 19 insights written across 5 sections of `c74-forum/forum_insights.md` from selective WebFetch on the top 20 artifact-richest threads (95% hit rate). 10 PROMOTION-CANDIDATEs swept into reference docs in the same pass. State decisions: 726 downloaded / 976 skipped-no-artifact / 6 phase-C-scraped. **Pass-5 was Jitter-heavy**: 12 of 19 written insights are Jitter, reflecting both the candidate-range volume and the surface area for non-obvious GL pipeline gotchas (texture-as-attribute persistence, normalised-coords ±2 range, fixed-vs-shader pipeline migration, jit.glue plane-match requirement).*

  **Resume point**: pick the next subforum chunk per `c74-forum/FORUM_CRAWL_LOG.md`. Candidate areas now: Gen pp.26+, Jitter pp.33+, MaxMSP pp.35+, Javascript pp.28+, RNBO pp.20+, Max For Live pp.23+, Misc pp.19+. Java pp.6+ remains deprioritised. Use `enumerate_forum_threads.py --diff` against `c74-forum/forum_crawl_state.json` to surface only NEW or UPDATED threads. Run from local laptop (or any non-Cloudflare-WAF egress); the Anthropic cloud env is blocked.

  **Approach (chunked across sessions)**:
  - Each session picks a focused area: one subforum, one topic thread cluster, or one search query (e.g. "jit.matrix best practices", "audio synthesis techniques", "v8 patterns"). Track progress in `c74-forum/FORUM_CRAWL_LOG.md` so each session knows where to resume.
  - Prioritize threads with: high reply counts, sample patches (MCT blocks), "tips & tricks" / "how do you..." framing, or posts from long-tenured members.
  - Extract: non-obvious object behaviors, preferred patterns for common tasks, performance pitfalls, community-preferred alternatives to naive Max approaches, and any sample patches worth studying.

  **Output**:
  - `c74-forum/forum_insights.md` — running notes, organized by topic (audio, video/Jitter, JS/v8, MIDI, UI, performance). Each entry: the insight, source thread title, and why it matters.
  - Where an insight is specific to an object, also add it to the relevant section of `SPEC_REFERENCE.md`.
  - If enough package-object insights accumulate, fold them into `packages/package_objects.json` (see Package Objects Library task).

  **What to skip**: basic "how do I" posts with obvious answers, unanswered threads, posts that just link to docs.

  **Forum starting point**: `https://cycling74.com/forums`

  **Naming note**: the folder was renamed from `forum/` to `c74-forum/` on 2026-05-02 to match the `c74-projects/` companion task. Internal files (`forum_insights.md`, `FORUM_CRAWL_LOG.md`, `enumerate_forum_threads.py`, `forum_crawl_state.json`) keep their unprefixed names since the folder provides scope.

  **Session format**: start each chunk by reading `c74-forum/FORUM_CRAWL_LOG.md` to see what's been covered, do one focused crawl pass, append new entries to `c74-forum/forum_insights.md`, update the log with what was covered and what to do next.

- [in progress] **Package Library — operational quality pass (per-object `use_when` upgrade + per-package concept sections)** — merged 2026-05-28 from two separate tasks: the per-object `use_when` quality upgrade for `packages/package_objects.json`, and the per-package paradigm backfill for `packages/package_concepts.md`. Same audience, same files mostly, same goal: elevate package knowledge from "everything extracted" to "everything decision-useful." Both layers feed the same downstream consumers (MCP `lookup_object` + `search_packages`, the converter's `PackageObjectsCache` fallback, the `/c2m-package-search` skill).

  **Layer A — per-object `use_when` quality upgrade** (status: in progress). Every extractable installed package is in `packages/package_objects.json` (2,795 records across 68 of 79 installed packages, refpage + helpfile sources). Library validates clean. Foundational/decision-relevant objects across the major packages are at HISSTools-tier operational quality; the remaining ~1,869 templated entries (mostly utility wrappers — math/trig, panners, list utilities) consist of `<digest>. <package framing>.` and are adequate for utility wrappers but could be upgraded for substantive objects.

  **A — what's done**:
  - All 56 extractable refpage-XML packages curated (1,369 entries from the mass pass + 241 from bach's full pass).
  - All 10 extractable helpfile-only packages curated (533 entries).
  - Tooling: `packages/query_packages.py` (list / search / validate); unified schema in `packages/package_schema.py` with `normalize()` chokepoint preventing drift; `PackageObjectsCache` in `spec2maxpat.py` as final I/O fallback (2,051 resolvable objects); two-stage `_supplemental_io()` probe in the refpage extractor for packages whose refpages don't carry `<inletlist>`/`<outletlist>` (helpfile canonical instance, then abstraction `.maxpat` inlet/outlet count, both case-insensitive).

  **A — what's left**:
  1. **Quality upgrade for substantive templated entries** — pick objects with >5 attributes, >3 distinct messages, or known alternatives in other packages, and write fuller operational entries (HISSTools-baseline tier). Skip pure utility wrappers (math/trig). See conversation `2026-05-01` for the prioritisation heuristic.
  2. **Help-less packages (11)** — ABL Effect Modules, AudioMix, Delicious Tutorials, Gen CV Tools, JitLygia, Jitter Recipes, MC Movement Studies, PGS-1, adsr221, gen~ Plugin Export, µK Bundle. No refpages and no `.maxhelp` files. Would need a third extractor approach (inspect example abstractions / source patcher metadata) — deferred.

  **A — tooling notes**: `RefpageCache._find_xml()` and the `_supplemental_io()` probe are the entry points for any new extractor. The `use_when` field is the high-value output — written by Claude after reading refpage attrs/methods, not auto-generated for substantive objects. The canonical schema and `normalize()` chokepoint live in `packages/package_schema.py`; new extractors must import and use them.

  **Layer B — per-package concept sections in `packages/package_concepts.md`** (status: partial backfill done; substantial paradigms still pending).

  **B — already covered** (concept sections written): bach, cage, dada (bach extensions), FrameLib, ears (HISSTools-aligned pointer), odot, MuBu For Max, PeRColate, grainflow, Digital Orchestra Toolbox, Vsynth, RNBO Synth Building Blocks, EAMIR SDK.

  **B — still pending — packages with substantial paradigms worth capturing**:
  - **HISSTools (HIRT)** — convolution-domain workflow (zero-padding vs circular, magnitude/phase deconvolution modes, IR file management); buffer-vs-realtime split; tail handling. The ears section already points here; should be standalone.
  - **FFTease** — pvoc paradigm, FFT framing, magnitude/phase fork in spectral processors, gain compensation across windowing schemes.
  - **zsa.descriptors** — sigmund~/yin~ analysis pipeline, descriptor categories (low-level vs perceptual), framing.
  - **Sound Design Toolkit (SDT)** — physical-modelling architecture (resonator + interaction + control), the "control object" pattern (e.g. sdt.scraping~ → sdt.friction~), parameter ranges.
  - **FluidCorpusManipulation (FluCoMa)** — corpus-based concatenative synthesis paradigm; buf/realtime split; JIT-Lib integration; dataset/labelset/kdtree workflow; fluid.transients vs fluid.harmonic vs fluid.percussive decomposition philosophy.
  - **CNMAT Externals** — beyond the existing odot section, capture: resonators~ paradigm; SDIF integration; deprecation pointers for the older OSC objects.
  - **catart-mubu** — concatenative synthesis paradigm, MuBu container abstraction (cross-reference the MuBu section), descriptor pipeline, granular vs corpus selection.
  - **cv.jit** — computer-vision pipeline conventions (greyscale matrix → analysis → annotation), info-outlet pattern (`getnfaces` → `route nfaces`), image-coordinate conventions.
  - **RTC-lib** — Karlheinz Essl's compositional algorithms: Koenig selection principles, ED rhythm objects, twelve-tone tools.

  **B — likely no concepts to capture** (verify first, then document the decision):
  - **ejies** — Erbe's general-purpose utilities; mostly thin idiomatic wrappers.
  - **modulo** — utility wrappers.

  **B — what to write**: same shape as the bach section — one-line summary, then named subsections for each foundational concept, ending with a "common gotchas" pair where applicable. Read tutorials/intro patchers first, not just refpages.

  **B — prerequisites**: package installed locally; foundational tutorials/help patchers present.

  **Why the combine**: both layers are about elevating package knowledge to higher operational quality, both write into the `packages/` tree, both serve the same downstream consumers, and a session that's loading a package's docs to write `use_when` for its objects has the same context loaded to write its concept section. Doing them as one task lets a session opportunistically advance whichever layer is the higher-value next move for the package in front of it.

---

## Pending — Sonnet

Tasks that are primarily implementation, file editing, or verification — no deep architectural judgment required.

- [pending] **Refine the student/user setup process and the Description→Plan→Instructor-Review→First-Draft workflow** — first pass landed 2026-05-22 in `CLAUDE.md` ("Local-Folder Use Is Fully Supported", "Suggested Student Workflow", gated New User Setup, "State-File Location for External Projects") and `README.md` ("Two Operating Modes", optional-Setup note). These are a starting point — they describe the intent but have not yet been tested against a real student-from-scratch onboarding. Open questions to resolve on the next pass:

  1. **Onboarding script.** Should there be a top-level `setup.sh` (or `python3 setup.py`) that runs the conditional flow — detect git vs local-only, ask the student where their Max project lives, write a `.c2m-current-project` pointer if external, offer to remove `origin`, install the optional git diff filter only if wanted? Right now this is all manual prose in CLAUDE.md and depends on Claude noticing each branch at session start.

  2. **External-project pointer mechanism.** The "tell Claude my project lives at X" convention is currently informal — the student has to say it in chat each session. A persistent pointer file (`.c2m-current-project` at the repo root, or `$HOME/.c2m-config`) would survive across sessions. Decide format and lifecycle (overwritten freely, or append-only history of projects).

  3. **Student workflow steps 5–6 (instructor handoff).** Currently the student manually copies the proposal out of the Claude conversation and pastes the instructor's response back. Worth investigating whether a small helper would smooth this — e.g. a `c2m-export-proposal` command that snapshots the current plan to a file the student can email or paste into an LMS, and a matching `c2m-import-response` that re-attaches the instructor's reply to the conversation. Cost vs benefit unclear; skip if it adds more friction than it removes.

  4. **Workflow step ordering and skip conditions.** The 9-step flow is linear. Test with a real student build to find out which steps actually fire, which get skipped, and whether the loop on steps 7–8 ever terminates cleanly in practice. Especially: does step 5 (instructor handoff) work for solo students with no instructor? Add an explicit "self-review" branch if so.

  5. **Wording and tone for the local-only greeting.** The current greeting ("you're working locally without a GitHub remote — that's a fully supported setup") may read as defensive. Try alternative wording with at least one real first-time student before settling.

  6. **State-file convention enforcement.** The "State-File Location for External Projects" rule currently says Claude should default state files into the external project folder if one has been declared. There is no mechanical enforcement — Claude could still write `WORK_HISTORY.md` to the toolkit repo by habit. Decide whether to add a PreToolUse hook that flags writes to `WORK_HISTORY.md` / `TASK_QUEUE.md` / `insights.md` at the toolkit root when an external project is active.

  **Prerequisites**: ideally test with at least one new student before refining. The current pass is "intent captured, mechanics untested."

  **Why this matters**: the local-folder workflow is the on-ramp for every student who clones this repo without a GitHub account. If it's smooth, students self-onboard; if it isn't, the friction shows up as confusion in their first session and Claude has to compensate with extra prompting every time. A small invested cost here pays off across every future student.

---

## Done

- [complete] **`spec2maxpat.py` — sync silently drops live layout, convert silently ignores `presentation_rect`** — completed 2026-06-05. Two related round-trip bugs fixed in one pass. `reconcile_spec` now folds live `presentation_rect` (canonical 4-element form) and live `patching_rect` size back into the embedded spec — manual resizes/moves in Max survive `sync → extract → convert` instead of being silently dropped on the next regen. `build_box` accepts `presentation_rect` as a sibling spec field (wins over `presentation` when both are present), so hand-edited specs are forgiving when the author writes the obvious field name. `has_presentation` and `openinpresentation` are triggered by either field. Bug 3 in the original task body (extract emitting `presentation: True` + sibling `presentation_rect`) was stale — `_box_to_spec_obj` already emitted canonical 4-element form. Added `tests/test_presentation_roundtrip.py` (4 assertions, all pass). Smoke-tested against `patches/drift-sequencer-lcars.maxpat` — 38 presented boxes round-trip clean, 0 orphan `presentation_rect` siblings. `SPEC_REFERENCE.md` Object Fields table documents both forms.

- [complete] **Plugin/skills polish pass** — completed 2026-06-05. Trimmed three SKILL.md files (c2m-sync 70→58, c2m-design 85→66, c2m-tutorial 93→91) by replacing duplicated CLAUDE.md rule prose with section pointers. Left c2m-explain (99), c2m-inspect (93), c2m-package-search (67) at length — their bulk is skill-specific operational content (script output shape, OSC kind/cap tables, search workflow), not rule duplication. Added in-repo-vs-`UPSTREAM-SKILL.md` distinguishing paragraph to `CLAUDE.md` § "Plugin / Slash Commands". Added `.claude/skills/README.md` discovery index. Subtask 5 (`/c2m-refpage` skill) stays struck — superseded by the pending MCP `lookup_object` Opus task.

- [complete] **Promotion-candidate review pass** — completed 2026-06-04. All flagged entries in `c74-forum/forum_insights.md` (35 total) and `cookbook/cookbook_insights.md` processed. 9 new entries promoted to target docs; 24 stale `[PROMOTION-CANDIDATE]` flags on already-promoted entries cleaned up; 0 flags remaining. New additions: 5 Audio entries (phasor edge detector, preset interpolation, mass-spring-damper, uzi buffer scan, cpuclock) + 1 Jitter (PBR full transparency stack) → `patching/MAX_PATCHING.md`; codebox intro + buffer-as-config-table + ODE integrator template → `patching/GEN_PATCHING.md`; "Always Use Absolute Paths in Bash" rule → `CLAUDE.md`. Cookbook items and M4L LOM chain/getpath confirmed already in target docs.

- [complete] **Borrow MaxMCP's Claude Code plugin/skills surfacing pattern** — completed 2026-05-01. Built four skills in `.claude/skills/`: `/c2m-design`, `/c2m-package-search`, `/c2m-tutorial`, `/c2m-sync`. Added `## Plugin / Slash Commands` section to `CLAUDE.md` listing all five skills (including `/c2m-explain`). Compressed `CLAUDE.md` from 609 → 354 lines by moving reference content to `SPEC_REFERENCE.md` (v8/JS, converter handles, modifying external patches, MCT algorithm) and `packages/CURATION.md` (new file). Polish-pass follow-ups (skill trimming, /c2m-explain shim, upstream-vs-in-repo distinction) tracked separately in the Sonnet polish-pass entry.

- [complete] **Cross-link `/c2m-explain` from CLAUDE.md** — completed 2026-05-01. Listed in the `## Plugin / Slash Commands` table in `CLAUDE.md` alongside the four other c2m skills. Slash-command shim at `.claude/skills/c2m-explain/SKILL.md` was added in the same session as the parent task; the polish-pass entry's subtask 2 about that shim is therefore also satisfied.

- [complete] **Add `/c2m-explain` — first-class "explain this patch" skill** — completed 2026-05-01. Built `c2m-explain/c2m_explain.py` (read-only walkthrough generator) with two output modes: walkthrough (default) and `--summary`. Skill manifest at `.claude/skills/c2m-explain/SKILL.md` (Claude Code's auto-discovery scans `.claude/skills/`), parallel to the four sibling c2m skills; upstream-distribution copy at `c2m-explain/UPSTREAM-SKILL.md`. Bidirectional integration with `add_tutorial.py`: shared `describe_object` cascade (curated `OBJ_DESCRIPTIONS` → C74 refpage with `REFPAGE_ALIAS` for symbolic operators → installed-package digest) lives in `add_tutorial.py` and is now used by both tutorial step descriptions and the explain skill — tutorials get refpage + package digests for every object instead of just the ~50 hand-curated ones. The explain skill detects an embedded tutorial (`v8 <name>-tutorial.js` + companion JS file with `STEPS` array) and overlays the tutorial's authored step names + descriptions when cluster count matches exactly (mismatch → silently fall back to auto-generated, with a header note explaining the source). Tested on jit-grab-scale (overlay applies cleanly), drift-sequencer-soviet and drift-sequencer-lcars (tutorials drifted; correctly falls back).

- [complete] **Review youthful-austin branch** — completed 2026-04-27. No unique commits on the branch; fully behind main. Cleaned up worktree.

- [complete] **Extended `RefpageCache` metadata** — completed 2026-04-26. Extended `_parse()` in `spec2maxpat.py` to extract digest, attributes (type/size/default/get/set/label), messages (args/inlet), object arguments, output descriptions, and see-also in a single XML parse pass. Added `describe(name)` convenience method for quick verification. Return structure now includes all seven fields alongside the original I/O counts.

- [complete] **Permutation Summary Generator** — completed 2026-04-26. Created `perm-summary.js` with 10 analysis dimensions (role frequency, solos, co-occurrence, dominance, consecutive streaks, inverse pairs, group size variation, role transitions, sub-group recurrence, coverage gaps). Observations ranked by surprisingness; top 6 output as plain-English text to a `textedit` box. Added outlet 7 to `ensemble-v5.js` (`sendSummaryData()` called after generate). Integrated into `ensemble-sequencer-v5.maxpat` with textedit in presentation view (left panel, below transport controls).

---

## Queue Analysis & Hygiene Notes

Cross-task relationships, soft prerequisites, supersession notes, and hygiene decisions discovered during periodic reviews. Read alongside the task entries above — this section is where the *relationships between* tasks live, vs. the per-task bodies which describe each task in isolation. Re-do the analysis when the queue contents above have drifted materially from the dates below.

### Review — 2026-05-28

Triggered by adding the new top-priority Opus task ("Claude2Max MCP server + global enforcement layer — knowledge as queryable tools, Max-file edits gated until tools fire"). Reviewed all 12 active tasks (3 in progress, 9 pending at time of review; combined to 11 after one merge).

**Fold-ins executed**:
- *Plugin/skills polish pass → subtask 5 (`/c2m-refpage` skill)* — struck through with a supersession note. MCP's `lookup_object(name)` does what that skill would have done, but as a first-class tool with authoritative-result semantics rather than skill-printed text. Polish-pass items 1–4 and 6 remain valid.

**Merges executed**:
- *Package Objects Library quality upgrade pass* + *Backfill `packages/package_concepts.md`* → merged into one entry **"Package Library — operational quality pass (per-object `use_when` upgrade + per-package concept sections)"**. Both layers are about elevating package knowledge to higher operational quality, both write into the `packages/` tree, both serve the same downstream consumers (MCP `lookup_object` + `search_packages`, the converter's `PackageObjectsCache` fallback, the `/c2m-package-search` skill). Same session context loads both. Internal sub-headings Layer A (per-object) / Layer B (per-package) preserve the original structure.

**Soft prerequisites identified (not blockers, but improve launch quality if done first)**:
- *Promotion-candidate review pass* → *MCP server task Step 2 (essentials() tool)*. The MCP's `essentials()` reads from `CLAUDE.md` / `SPEC_REFERENCE.md` / `patching/MAX_PATCHING.md`. Any insights still flagged `[PROMOTION-CANDIDATE]` in `forum_insights.md` / `cookbook_insights.md` are missing from the canonical docs and therefore from `essentials()`. Cross-reference added to the MCP task's "Fits into the larger system" paragraph.
- *`spec2maxpat.py` sync/convert layout bug* (Sonnet task) → indirectly relevant to MCP Phase (ii) (`verify_spec`). Bug is in a different code path from the `RefpageCache` that MCP reuses, so doesn't strictly block MCP, but if `verify_spec` ends up consuming sync output downstream, the bug compounds. Worth fixing in the same general timeframe.
- The in-progress knowledge crawls (*Forum Knowledge Crawl*, *Cookbook Analysis*, *Cycling '74 Projects Crawl*, *Package Library quality pass*) feed the MCP's source corpus. More in the source files = richer MCP at startup. Not blockers — MCP reads what's there when the server starts.

**Pairings noted in task bodies**:
- *MCP server Phase (i) Step 5 (end-to-end real-world test)* ↔ *Refine the student/user setup process (Sonnet)*. Both want to validate a fresh-machine, fresh-project Claude session against a real onboarding flow. Running them in the same session window lets one fresh-machine setup exercise both. Cross-reference added to MCP Step 5.
- *MCP server task* ↔ *Repo-as-Total-Scope Enforcement System*. Both address the persuasion-vs-enforcement gap, but from opposite directions — MCP for outside-the-repo, Repo-as-Total-Scope for inside-the-repo. They share infrastructure (hooks, rule registries, mechanical enforcement). Once MCP ships, Repo-as-Total-Scope can reuse the rule-extraction code. Cross-reference already in MCP task body.
- *MCP server task* ↔ *Community Knowledge Pipeline*. Incoming PRs from forks can include not just prose insights but also test cases that get added to `verify_spec`'s rule library, growing MCP's coverage over time. Cross-reference already in MCP task body.

**Not folded (considered and rejected)**:
- *Repo-as-Total-Scope Enforcement* — significant overlap with MCP enforcement layer, but Repo-as-Total-Scope is broader (rule categorization, violation logs, "no independent thought" frame, in-repo behavior gating). Folding would dilute MCP's focus. Kept separate with explicit cross-references in both directions.

**Not combined (considered and rejected)**:
- *Forum Crawl + Cookbook Analysis + Cycling '74 Projects Crawl* — all `[in progress]` knowledge-corpus builds with shared session shape ("pick chunk → scrape → write insights → log resume point"). Each has its own state file and log; combining would mostly be cosmetic and could slow each by forcing context-switching. Left as-is.

**No tasks marked stale or deleted.** Queue is in good shape modulo the one redundancy (subtask 5, now struck) and the one merge (Package Library). The `[in progress]` tasks are real ongoing work, not abandoned.

**Position note**: the new MCP task is now top-priority *by position* (first under "Pending — Opus"). The two prior top-priority Opus tasks (Community Knowledge Pipeline, Repo-as-Total-Scope) are still very relevant and pair conceptually with MCP, but appear demoted in the list ordering. This is positional, not semantic — work on them in whatever sequence makes architectural sense, not strictly by list position.

**Tangential observations** (not action items now):
- *TouchOSC mk2 Integration* and *Return to claude2max-design skill* are unrelated to the MCP push but both could *consume* MCP's `verify_spec` once it lands — TouchOSC's parallel converter wants the same spec validation; the design skill's layout output would benefit from rule-level checks alongside Phase 3 screenshot verification. Long-term integration story, not action items now.

### How to use this section

- **Periodic review trigger**: when adding any new task to "Pending — Opus" or "Pending — Sonnet", scan the existing entries for overlap and update this section. Date-stamp the review.
- **Before starting a top-priority task**: read the latest dated review here for soft prerequisites and pairings before diving in.
- **When queue contents drift materially** (>~5 task additions/completions since the latest dated review), redo the analysis and date-stamp the new pass. Keep prior dated reviews for historical context unless they contradict.
- **Never use this section to track per-task progress** — that belongs in the task entry itself (`[in progress]` marker + inline note). This section is strictly for *relationships between tasks*.
