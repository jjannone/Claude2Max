# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

**Also read the *Queue Analysis & Hygiene Notes* section at the bottom of this file** for current cross-task relationships, soft prerequisites, supersession notes, and recent hygiene decisions. The analysis is dated; if it's stale relative to the queue contents above, redo it.

Format: `[pending]` = not started, `[complete]` = done (move to Done section), `[in progress]` = currently being worked on.

**When starting a task**, change its marker to `[in progress]` and add a brief note of what has been done so far (e.g. `*In progress: crawled audio subforum, resuming at MIDI threads*`). This ensures that if the session is cut off, the next Claude instance knows where to pick up. Clear the `[in progress]` marker and note when the task is finished or paused.

---

## Pending — Opus

Tasks requiring deep analysis, architecture decisions, or sustained judgment. Prompt the user to run `/model claude-opus-4-7` before starting any of these.

- [pending] **`extract_spec` picks the first marker-bearing box — a stray stub shadows the real embed; repair `4step-sequencer.maxpat`** — Found 2026-08-18 while cleaning the gate-flagged attrs. Two defects, one in the converter and one in a patch, that compound into a silently destructive `convert`.

  **Defect 1 — no discriminator on the embed scan.** `extract_spec()` in `spec2maxpat.py` walks `maxpat["patcher"]["boxes"]` and returns the first box whose `code` or `text` contains `--- CLAUDE2MAX SPEC ---`. It does not check the box id or maxclass. Any other box carrying the marker — a leftover from a prior cycle, a comment quoting the format, a tutorial box explaining it — wins if it sorts earlier. `_SKIP_BOX_IDS` already names `obj-spec-embed` as canonical scaffolding, so the discriminator exists; the extractor just doesn't use it. Fix: prefer `id == "obj-spec-embed"`, fall back to the first `text.codebox` match, and when more than one candidate carries the marker, say so rather than silently choosing.

  **Defect 2 — `4step-sequencer.maxpat` carries both a decoy and a corrupt real embed.** `obj-22` is a `newobj` whose entire text is `--- CLAUDE2MAX SPEC ---\n{"name":"4-step-sequencer"}\n--- END SPEC ---` — a stub with no objects and no connections. Because it precedes `obj-spec-embed`, `extract_spec` returns it, so the patch reports `spec.objects = 0`. The real embed (`obj-spec-embed`, `code`, 4,403-char body) does not parse either: it truncates mid-string, and the truncation point shows why — the spec contains an object *named* `obj-spec-embed` whose `attrs.text` is itself a spec embed. A sync captured the spec-embed box as a spec object, producing self-reference. `_SKIP_BOX_IDS` should have prevented this, so either the spec predates that guard or a path bypasses it — determine which, because a live bypass would keep reproducing this.

  **Why this matters:** `convert` consumes whatever `extract_spec` returns. On this patch today that is a 27-character stub, so converting `4step-sequencer.maxpat` would emit an essentially empty patch and destroy all 24 boxes. The patch is currently intact and the gate reports it clean — the damage is latent, triggered by the next `convert`. Nothing warns.

  **Work**: (a) add the discriminator + a multi-candidate warning to `extract_spec`; (b) determine whether the `_SKIP_BOX_IDS` bypass is live by tracing which sync path wrote the self-referential object; (c) reconstruct `4step-sequencer.maxpat`'s spec from its 24 boxes via `sync` and delete the `obj-22` decoy; (d) add a rule to `claude2max_verify` for "more than one box carries the spec marker" and for "embed present but does not parse" — both are silent today. Item (d) overlaps the *embedded-spec presence* family scoped in the MCP-enforcement task **item 8**; build the detection rule there if that task runs first, and keep the converter-side `extract_spec` discriminator here.

  **Model**: Sonnet — the diagnosis is done, the remaining work is a discriminator, a trace, and a patch repair against a known-good box list.

- [in progress] **`.maxhelp` Corpus Crawl — extract canonical usage from Max's help patches** — Systematically read every `.maxhelp` file shipped with Max and installed packages, and extract canonical-usage knowledge into the corpus: which attributes/messages each object *actually uses*, real wiring idioms, default box sizes, and per-object gotchas. ~5,266 files total (~2,104 core: 973 in `help/` + 1,131 in bundled `packages/`; ~3,162 in user `~/Documents/Max 9/Packages/`). All are standard `.maxpat` JSON — parse with the existing box-walk approach (`json.load` → recurse `patcher.boxes`, including nested `patcher` subpatchers), no MCT decode needed; all local (no network / Cloudflare-WAF concerns).

  *In progress (2026-06-21): **mechanical attr-tally COMPLETE + JS API census COMPLETE + resolver integration (deliverable a) COMPLETE; prose-insight extraction NOT started.** Built `maxhelp/` folder — `extract_observed_attrs.py` (box-walk over `.maxhelp`+`.maxpat`+`.amxd`, ~6s; amxd via `ampf`-strip+`raw_decode`; `strict=False` JSON), `extract_js_api.py` (data-driven Max JS API census), `MAXHELP_CRAWL_LOG.md`, `maxhelp_insights.md`, `maxhelp_observed_attrs.json` (11,866 files / 797,407 boxes / 4,201 objects), `maxhelp_crawl_state.json` (per-file `{tier,kind,status}`), `maxhelp_js_api.json` (8,811 `.js`/`.mjs` → 477 in-process + 20 node classified). Cross-checked vs `build_resolver`: 498 refpage objects → 1,155 gap-attrs; 3,180 objects no-refpage (observed = sole attr source); the 4 gate-flagged production attrs confirmed silent no-ops across ~13K boxes/class. **Deliverable (a) DONE 2026-06-21**: `maxhelp_observed_attrs.json` wired into `spec2maxpat._GateResolver` via `_load_observed_attrs()` — filters `^rnbo`/`^frozen` keys, applies ≥3-box floor, unions into `attrs_for()` return value; also fixed alias gap in `attrs_for()` (operator/word aliases now resolve before `no-refpage` check). All 38/38 verify tests pass. **Three deliverables remain:** (b) **prose-insight extraction**, chunked — start core `help/max/` foundational objects, promote files to `analyzed` in the state JSON. Resume per `maxhelp/MAXHELP_CRAWL_LOG.md` § "Resume point"; (c) **CLAUDE.md "Knowledge Resources" index entry** for `maxhelp/` — propose wording to John before writing (proposed: a `maxhelp/maxhelp_insights.md` bullet pointing at the observed-attrs map + `extract_observed_attrs.py`); (d) **promote the JS census** (`maxhelp_js_api.json`) into `patching/JITTER_JS_PATCHING.md` + `SPEC_REFERENCE.md` v8 section — fold the ranked constructors (`JitterObject`/`Task`/`Dict`/`JitterMatrix`/`Buffer`/`Global`/`MGraphics`…) and lifecycle handlers (`bang`/`paint`/`onclick`/`msg_int`/`setvalueof`/`getvalueof`/`jit_matrix`/`onidle`…) into the JS guidance so future `v8` work mirrors observed convention; (e) **observed-MESSAGES corpus** — added 2026-08-21. Mine message-box text traced to its wiring target across the same corpus, producing an `object -> {message: count}` map alongside the existing observed-attrs map. This is the exact counterpart of deliverable (a), and it exists for the same reason: refpage `<methodlist>`s are materially incomplete, so `rule_message_resolves` can only report a SUSPICION (WARNING) today — there is no `jbox`-equivalent base set and no corpus backstop to union in, which is precisely the asymmetry that keeps it un-promotable. `message-unverified` is the largest warning family in the corpus sweep (4,717 hits / 964 files), so this is the highest-value remaining corpus deliverable. Reuse `extract_observed_attrs.py`'s box-walk; the new work is resolving each `message` box to the object(s) its patchlines feed, and applying the same hygiene deliverable (a) settled on (frequency floor, artifact-key filtering). Consumers: `_GateResolver.messages_for()` unions it in, and the rule-enforcement task's item 11 promotes `message-unverified` to ERROR once it exists — do not attempt that promotion before this lands.*

  **Why this matters**: a `.maxhelp` is Cycling '74's authoritative demonstration of how an object is *meant to be used* — higher-signal than the refpage for usage (the refpage lists attrs/messages; the help patch shows the canonical wiring, defaults, and combinations). Three concrete payoffs:
  1. **Strengthens the anti-guessing gate (direct follow-on to the 2026-06-21 jbox-union work).** The attribute checker uses `own refpage ∪ jbox`, which has a residual gap: object-specific attrs an object genuinely supports but its refpage under-documents (the `panel/locked_bgcolor`-class question — see DESIGN_DECISIONS.md § (h)). The set of attributes *actually set on each maxclass across all help patches* is a data-driven, authoritative supplement — build a `maxclass → observed-attrs` map and union it into `spec2maxpat.build_resolver` so the valid set becomes `own refpage ∪ jbox ∪ observed-in-help`, cutting false positives without weakening real-error detection. (Also gives ground truth on whether the 4 currently-flagged production-patch attrs are real no-ops or refpage gaps.)
  2. **Feeds `packages/package_objects.json` `use_when` judgments** with real usage patterns for package externals.
  3. **Adds canonical idioms** to `patching/MAX_PATCHING.md` — the help patches are where the "right way" to wire each object lives.

  **What to build** (mirror the `c74-forum/` / `cookbook/` / `c74-projects/` pattern):
  - New folder `maxhelp/` with `MAXHELP_CRAWL_LOG.md` (session recipe, progress, resume point), `maxhelp_crawl_state.json` (per-file status: `pending`/`scanned`/`analyzed`/`skipped` + maxclass coverage), `maxhelp_insights.md` (topic-organized like the other insight files; mark `[PROMOTION-CANDIDATE]`).
  - A `maxclass → observed-attrs` extractor (walk every help patch, tally attrs per maxclass) emitting a JSON the resolver can union in. **Highest-value deliverable — can run as a standalone mechanical pass over the whole corpus in one session, even before any prose-insight work.**
  - CLAUDE.md "Knowledge Resources — Consult Before Designing" index entry once the first session lands.

  **Chunking**: ~5,266 files is large — chunk prose-insight extraction across sessions (suggested order: core `help/` → bundled `packages/` → user `Packages/`; or by object family). Per-session target ~50–100 files for prose insights. The attr-tally extractor is mechanical and can cover the whole corpus in one pass.

  **Prereqs**: existing box-walk/extract tooling; `RefpageCache` for cross-checking; the jbox-union resolver (`spec2maxpat.build_resolver`) as the integration point for the observed-attrs map.

  **Source**: 2026-06-21, user — "have you read all the .maxhelp files?" The anti-guessing attribute work surfaced that help patches are the authoritative usage/attribute ground truth and aren't yet in the corpus.

- [in progress] **Claude2Max MCP server + global enforcement layer — knowledge as queryable tools, Max-file edits gated until tools fire** — Build a Model Context Protocol server (`claude2max-mcp`) that exposes Max-patching knowledge as first-class callable tools, paired with a global skill + PreToolUse hook that mechanically ensures Claude has consulted the tools before editing any Max file. Ship all three pieces designed together as one architecture: MCP for *knowledge representation*, skill for *active invocation*, hook for *enforcement*. The architecture replaces today's prose-pointer-and-hope-Claude-reads-it pattern with knowledge-as-tools-and-can't-act-without-them.

  *In progress (2026-06-21): **Phase (i) + (ii) + (iii) + (iv+) complete.**

  **Phase (iv+) — global skill + enforcement hook + one-command installer — done 2026-06-21**: Built `skills/max-patching/SKILL.md` (user-level global skill, source for installer), `hooks/claude2max_max_edit_gate.py` (PreToolUse hook, gates `.maxpat`/`.maxhelp`/`.amxd` and adjacent `.js`/`.mjs` until sentinel written; session key: `CLAUDE_CODE_SESSION_ID` env → stdin `session_id` → cwd-hash+1h-TTL; deny output is JSON stdout, exit 0), `install_global.py` (installs MCP + skill + hook; `--dry-run`, `--verify`, `--env KEY=VAL` flags), `uninstall_global.py` (symmetric, idempotent). Sentinel uses `tempfile.gettempdir()` for cross-platform portability. CLAUDE.md updated with global skill docs, `.c2m-current-project` pointer convention, and `install_global.py` offer in New User Setup Step 3.

  **Live Haiku routing test — CLOSED 2026-06-21**: the one verification still owed from Phase (ii). The `ANTHROPIC_API_KEY` is present in the registered MCP env (`~/.claude.json`), so `assess()` was re-confirmed live through the running server — three representative tasks all returned `method: "llm"` and routed correctly (6-domain case → `core, jitter, gen, networking, m4l, msp`; "granulate a recorded sound" → `core, msp` with no `~` object named; "fix the comment label alignment" → `core`-only). Combined with the 2026-06-20 8-case pass (documented in SMOKE_TEST_RESULTS.md), no `assess()` verification remains owed. (The prior "verification owed" markers in this entry and in SMOKE_TEST_RESULTS.md line 323 were stale — the test had actually passed 2026-06-20; bookkeeping now reconciled.)

  **Two "planned" knowledge-search tools — BUILT 2026-06-21**: `search_pitfalls(term)` and `lookup_rule(name_fragment)`, the last two tools from the original task surface (lines 97-98 above), are now implemented in `mcp_server/server.py`. Both deterministic (no LLM / no API-key dependency) — exact/token search over a small curated corpus where fuzzy matching isn't needed. `search_pitfalls` searches the `## Common Pitfalls` bullets + forum + cookbook insights (170 entries), whole-phrase > token ranking, honest curated-not-exhaustive no-match message. `lookup_rule` searches the 73 `## ` rule sections across CLAUDE.md / SPEC_REFERENCE.md / MAX_PATCHING.md, header matches outranking body matches, returns full rule text. Both smoke-tested (results in SMOKE_TEST_RESULTS.md § "Knowledge-Search Tools"); README tool surface + server docstring updated. **The server now exposes 10 tools and the full original tool surface is complete.**

  **Phase (iii) — `verify_spec()` + shared rule library — done 2026-06-21**: Built `mcp_server/claude2max_verify/` as a dependency-free package (no `mcp`, no `spec2maxpat` imports) so it backs BOTH the MCP `verify_spec()` tool AND `spec2maxpat.py convert` — single source of truth for the binding rules. 12 hand-coded rules across 3 severities: errors (connection refs to missing objects, malformed connection shape, out-of-range outlet/inlet indices), warnings (no presentation view despite UI, unlabelled presented controls, visible cords on hidden boxes, unhidden formatter message boxes, unlabelled subpatcher I/O, untracked debug scaffolding, empty newobj), style (non-ALL-CAPS user names, `[js]` over `[v8]`). Each Violation carries a `source` pointing back at the doc section it enforces. `verify_spec(spec_json)` returns `{ok, counts, violations, summary, report}`. Convert integration is non-blocking — prints `[verify]` findings to stderr, still builds, `--no-verify` opts out. Tuned for zero false positives on real patches (I/O-range fires only on declared counts; redundant-message fires only when every inbound is interactive; presentation check exempts pure-DSP). 27 golden tests in `mcp_server/tests/test_verify.py` all pass; verified clean on `drift-sequencer-{lcars,soviet,*}` (109–118 objects, 0 violations) and correctly flags `jit-grab-scale`'s genuinely-missing presentation view. Server now exposes 8 tools. Decisions captured in `DESIGN_DECISIONS.md` § (g).

  **Phase (iii) extension — anti-guessing convert GATE (2026-06-21)**: per maintainer ("Claude still invents things that don't work in Max even with knowledge loaded"), turned `convert` into a blocking gate. Added resolver-gated rules to `claude2max_verify` (object-name resolution + attribute validity against C74 refpages/package library, via an injected resolver from `spec2maxpat.build_resolver()`); `convert` now **refuses to build** (exit 1) on any error unless `--allow-unverified`. Escape hatches: per-object `"unverified": true`, abstraction-on-disk auto-OK. Key finding: object refpage `<attributelist>` lists only object-specific attrs; universal box attrs are inherited from the `jbox` base (jbox.maxref.xml) and knowable — so **attribute validity = own refpage ∪ jbox**, applied to ALL objects (not scoped to `live.*`). The jbox union cut false positives from ~90/patch to 0 while catching `bgcolor`-on-`live.gain~`; the 4 attrs still flagged on production patches (panel/locked_bgcolor, number/tribordercolor, multislider/contrast+bgfillcolor) are real silent no-ops (absent from refpage + jbox + every shipped C74 patch on that class) — gate working, patches need cleaning. Object resolution handles operator + word aliases (`t→trigger` etc.). 38/38 tests pass; `oscparse`/`bgcolor`-on-`live.gain~` blocked. "Operating stance" preamble added to `core` module. Decisions in `DESIGN_DECISIONS.md` § (h).

  **Resume at — NOTHING OWED ON THE ORIGINAL SURFACE.** All four phases shipped, the live Haiku routing test is closed (2026-06-21, above), both remaining "planned" tools (`search_pitfalls`, `lookup_rule`) are built, AND the attribute tools are now unified with the convert gate (see next note) — the server is at 10 tools and the full original tool surface is complete.

  **MCP attribute tools unified with the convert gate — DONE 2026-06-21**: fixed a tool-vs-gate inconsistency. `lookup_attribute`/`list_attributes` were refpage-only while the gate validates `refpage ∪ jbox ∪ observed-in-help`, so the same server reported universal jbox attrs (`hidden`, `presentation`, …) INVALID while convert accepted them. Both tools now decide validity through the same cached `_GateResolver` (`_resolver()`); two public accessors added to `_GateResolver` (`base_attrs`, `observed_attrs`); `verify_spec` uses the cached instance too. `lookup_attribute.source` ∈ `{c74-refpage, jbox-base, observed-in-help, no-refpage}`; `list_attributes` returns the full union partitioned into `refpage_attributes`/`base_attributes`/`observed_only`. New capability: no-refpage externals (`bach.roll` 95, `imubu` 127 attrs) now positively verifiable from the help corpus. Verified 0 tool-vs-gate disagreements; 38/38 tests pass; `bgcolor`-on-`live.gain~` trap preserved. Docs: SMOKE_TEST_RESULTS § "Attribute Tools Unified", DESIGN_DECISIONS § (h) two extension notes. This also satisfies `.maxhelp` deliverable-adjacent work: the observed-attrs map (deliverable (a)) is now consumed by the MCP query tools, not just the gate.

  **mtime-based cache invalidation — DONE 2026-06-21**: the README's "read once + watch mtimes" contract was aspirational — the code read-once with no invalidation, so a long-lived server served the startup snapshot until restart. Added `_FileCache` (mtime-signature-gated lazy value) + `_mtime_sig` in `mcp_server/server.py` and converted all six disk-backed caches to it: package library (`_pkg_raw`/`_pkg_idx`), object-name index (`_all_object_names`), the gate resolver (`_resolver`, watches `package_objects.json` + `maxhelp_observed_attrs.json`), rule sections (`_rule_sections`, watches the 3 rule docs), pitfall corpus (`_pitfall_chunks`, watches MAX_PATCHING.md + the 2 insight files). One `stat` per source per call; rebuild only on mtime change. (Max-install refpage XML not watched — doesn't change during patch work.) Verified live: a watched-file mtime bump triggers an in-process rebuild; rebuild-only-on-change confirmed with a call-counter; 38/38 verify tests pass; all functional numbers unchanged (73 rules / 170 pitfalls / 2795 pkg objs). README caching paragraph now accurate.

  Possible next MCP directions (none currently committed): a `search_pitfalls`/`lookup_rule` LLM-expansion variant if deterministic recall proves too narrow in practice. (Otherwise the MCP layer is feature-complete — 10 tools, gate-consistent attributes, live-refreshing caches.)

  ---

  **Earlier progress (2026-06-20): Phase (i) complete; Phase (ii) module system implemented.**

  Phase (i) retrospective revealed the reactive tool-call architecture (lookup_object / list_attributes before each object) is insufficient — it makes Claude look up names while building, but Max knowledge needs to be front-loaded the same way JavaScript knowledge is. Claude needs to *know* Max before touching a patch, not query reactively mid-build.

  **Phase (ii) — rethought architecture — implemented 2026-06-20**: Module system with two new primary tools:
  - `assess(task_description)` → evaluates which knowledge domains the task needs; returns domain list + reasoning
  - `load(domains)` → assembles and returns the full knowledge for those domains as readable markdown; front-loaded at session start; additive (call again when task scope grows)

  Module taxonomy: `core` (always — binding rules, Common Pitfalls, preferred objects), `gen` (GEN_PATCHING.md), `jitter` (JIT_GEN + JITTER_JS patching), `m4l` (M4L_PATCHING.md), `networking` (multi-user-template pattern), `msp` (audio signal chain), `spec` (SPEC_REFERENCE.md). Each domain maps to existing Claude2Max files — no duplication.

  Re-evaluation pathway: `core` module includes explicit recognition signals ("if you see `jit.` prefix → call `load(["jitter"])`") so Claude knows when to add modules mid-session without guessing upfront.

  `essentials()` kept as backward-compat alias for `load(["core"])`. All five Phase (i) tools unchanged.

  Smoke test: `assess("step sequencer with audio and jitter visuals")` → `["core", "jitter", "msp"]`. `load(["core"])` = 20K chars. `load(["core", "msp", "jitter"])` = 40K chars. All sections present, backward compat confirmed.

  **Resume at**: (1) ✓ DONE — `PROJECT_CLAUDE_SNIPPET.md` references `assess()`/`load()`. (2) ✓ DONE (2026-06-20) — end-to-end test of `assess()`/`load()`, documented in `mcp_server/SMOKE_TEST_RESULTS.md` Phase (ii) section. The test surfaced that keyword routing keyed on Max jargon, not beginner plain-English; per maintainer direction `assess()` was **changed to route by Claude reading task intent** (Anthropic API call, `claude-haiku-4-5`, env `CLAUDE2MAX_ASSESS_MODEL`; `ANTHROPIC_API_KEY` required via `claude mcp add --env`; degrades to a broadened keyword matcher + `method:"keyword-fallback"` without it). MCP sampling is unsupported by Claude Code ([#1785](https://github.com/anthropics/claude-code/issues/1785)), so the server makes its own API call. **Verification owed → CLOSED 2026-06-21** (see the "Live Haiku routing test — CLOSED" note above): live Haiku routing-quality test confirmed passing through the registered MCP server (fallback path + mocked LLM parse were already verified; `anthropic>=0.40.0` in requirements). (3) `verify_spec()` is now Phase (iii) — safety-net checker, not primary knowledge mechanism.*

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

  **Fits into the larger system**: this is the architecturally complete answer to "how do we ensure Claude has the Max knowledge it needs?" The strengthened global pointer (2026-05-28) closed what could be closed with prose. This task closes the remaining gap with mechanics: knowledge becomes tools, tool invocation becomes mandatory at Max-touching moments. Pairs with the Community Knowledge Pipeline task — incoming PRs from forks can include not just prose insights but also test cases that get added to `verify_spec`'s rule library, growing the MCP's coverage over time. **Supersedes** the proposed `/c2m-refpage` skill (was subtask 5 of the Plugin/skills polish pass, now struck) — MCP's `lookup_object(name)` does what that skill would have done, but as a first-class tool with authoritative-result semantics rather than skill-printed text. **Soft prerequisite**: running the Promotion-candidate review pass first improves the launch quality of `essentials()` by ensuring any insights still flagged `[PROMOTION-CANDIDATE]` in `forum_insights.md` / `cookbook_insights.md` have landed in the canonical docs the MCP reads from. Not a blocker, but cheap and worth doing in the session before Step 2.

  **Timeline note**: scoped during May 2026 with no students until September — sufficient runway to design the architecture properly, build all three layers, test against multiple project topologies, and verify behavior on a fresh machine before students arrive. Suggested phasing: (i) MCP server with `essentials()` + `lookup_object` + `lookup_attribute` shipping first as the foundation; (ii) `verify_spec` + the shared rule library second; (iii) skill + hook + installer third, gated on MCP being functional; (iv) integration with `spec2maxpat.py convert` last. Each phase independently testable.

  **Phase (i) Step-By-Step** (planned 2026-05-28 — the entry path into the MCP foundation; each step sized to be a single focused session):

  **Step 1 ✓ DONE (2026-06-13) — Research & decisions, cross-platform from the start (no code, ~1 hour)**. Lock in choices before code. The toolkit must work on macOS, Linux, and Windows — students will be on all three; assumptions about path conventions, shell, and temp directories cannot leak into the design. (a) MCP SDK: confirm Python MCP SDK is current standard (Python is the right language for everything here precisely because shell scripts don't cross platforms); pin a version in `mcp_server/requirements.txt`. (b) Claude Code MCP config location on **each supported OS** — exact path + JSON schema on macOS (typically under `~/Library/Application Support/Claude/`), Linux (typically `~/.config/Claude/`), Windows (typically `%APPDATA%\Claude\`); confirm the macOS path by inspecting an existing MCP server install on the available machine (e.g. one of the `mcp__*` servers already visible in active sessions like `mcp__ccd_session__*` or `mcp__Claude_in_Chrome__*`); confirm Linux and Windows paths by reading Claude Code's official docs (do NOT guess paths — Claude Code config locations have historically moved). Capture the per-OS resolution as a table in the deliverable. (c) `$CLAUDE_SESSION_ID` availability in the PreToolUse hook env on each OS — write a small Python hook that records the env to a file, trigger from a test session on macOS first (the available platform), confirm presence; flag Linux/Windows verification as a follow-up that the installer's `--verify` mode will exercise on student machines. If `$CLAUDE_SESSION_ID` is absent on any platform, design fallback sentinel using a portable scheme (per-cwd hash via Python's `hashlib`, stored in `tempfile.gettempdir()` so the path resolves correctly on every OS without hard-coded `/tmp`). (d) Implementation language for installer, hook, and any glue scripts: **Python, NOT shell** — bash/zsh won't run on Windows, PowerShell won't run on macOS/Linux, Python is the only language first-class on all three and is already the toolkit's language. The installer is `install_global.py`; the hook is `hooks/claude2max_max_edit_gate.py`. (e) Tool granularity locked to narrow tools per the design recommendation. (f) Caching locked to read-once + mtime watching. Deliverable: `mcp_server/DESIGN_DECISIONS.md` capturing the locked choices — especially the per-OS path table and the sentinel scheme — so future sessions don't re-litigate and so the Linux/Windows verification on a student machine has a concrete spec to test against.

  **Step 2 ✓ DONE (2026-06-13) — Server skeleton + `essentials()` (~1 short session)**. Smallest functional MCP server proving end-to-end wiring. Create `mcp_server/` with `server.py`, `__init__.py`, `requirements.txt`, `README.md` (stub). Implement the server with ONE tool: `essentials()` returning a structured-summary markdown (~1.5K tokens) extracted from the binding-rule sections of `CLAUDE.md`, `SPEC_REFERENCE.md`, and `patching/MAX_PATCHING.md`. Initial extraction can be a hand-written Python constant — automate later. `mcp_server/README.md` documents SDK install, manual Claude Code MCP registration (installer comes later), and the expected tool surface. Smoke test: register the server in Claude Code, open a fresh session in a non-Claude2Max directory, call `claude2max.essentials()`, verify the markdown returns and is sensible. Deliverable: working one-tool MCP server callable from any Claude session on the machine.

  **Step 3 ✓ DONE (2026-06-13) — `lookup_object()` (~1 session)**. The highest-value tool. Wraps existing infrastructure. Add `lookup_object(name: str)` to the server. Reuse `RefpageCache` from `spec2maxpat.py` for C74 objects; fall through to `packages/package_objects.json` for installed package externals (same lookup chain the converter already uses). Return shape: `{found, source ("c74-refpage" | "package" | "unknown"), numinlets, numoutlets, outlettype, digest, use_when, deprecated_by, refpage_text}`. Tool description leads with: *"Call this before adding any `newobj` to a Max patch. Returns authoritative existence + I/O signature + use_when. Skipping this call produces silent-failure patches when names that 'sound right' turn out to be wrong."* Smoke test cases: `lookup_object("metro")` → resolves from C74; `lookup_object("oscparse")` → reports unknown (the canonical example of a guess that lands as a red box); `lookup_object("cv.jit.faces")` → resolves via the package library. Deliverable: structured object knowledge accessible as a tool.

  **Step 4 ✓ DONE (2026-06-13) — `lookup_attribute()` + `list_attributes()` (~1 session)**. The attribute side of the silent-failure protection. Extend `RefpageCache` (or add a sibling) to parse `<attribute>` entries from the refpage XML for a given object — same caching pattern as objects. `lookup_attribute(object_name, attr)` returns `{valid: bool, value_type, valid_values, source}`. Critical use case: *"Does `bgcolor` exist on `live.gain~`?"* → `{valid: false, ...}` rather than silent success. `list_attributes(object_name)` returns all valid attrs as a list — useful when Claude is writing multiple attrs at once. Smoke test: `lookup_attribute("live.gain~", "bgcolor")` → invalid; `lookup_attribute("live.gain~", "coldcolor")` → valid (per the existing rule about `live.gain~` color attrs documented in CLAUDE.md). Deliverable: attribute verification as a tool. With this and `lookup_object`, the two highest-frequency silent-failure modes are addressable.

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

- [in progress] **Rule enforcement moves into the MCP server — one library, thin callers** — Make `mcp_server/` the single home for every mechanically-checkable and post-hoc-verifiable rule in the repo, and reduce `hooks/` to thin callers into it. Today the rule corpus lives as prose in six `*.md` files and is enforced (partially) by five independent hook scripts plus a gate inside `spec2maxpat.py`. This task ends the split: knowledge and checking logic live in one importable library; every entry point — MCP tool, hook, converter, CLI — calls that library rather than reimplementing it.

  *In progress (2026-08-20): **Item 1 — `verify_patch()` MCP tool + `verify` CLI — done.***

  **Item 1 done 2026-08-20**: Built `verify_patch_file(path, resolver=None, use_resolver=True)` in `spec2maxpat.py` (right after `gate_maxpat_file`, same reference shape) — runs the FULL rule library (structural + anti-guessing), not just the resolver-only rules `gate_maxpat_file` runs. Prefers the embedded Claude2Max spec when present (`extract_spec`, single scope, full fidelity); falls back to per-nested-subpatcher `_iter_patcher_scopes` conversion when no embed is found, which is what makes it usable on the C74 corpus (help patches, bundled packages, `.amxd`) that never had a Claude2Max spec to begin with. `iter_verify_targets(paths, kinds)` expands file/directory args into a sorted file list for sweeps. Three reachable surfaces, as scoped: (a) `verify_patch(path, sweep=False, use_resolver=True)` MCP tool in `server.py`, single-file or `sweep=True` directory aggregate with a `by_rule` hit table; (b) `python3 spec2maxpat.py verify <path...> [--summary] [--json] [--no-resolver] [--limit N] [--kinds ...]` CLI, same underlying function, one resolver built once and reused across a whole sweep; (c) importable directly for ad-hoc scripting (`from spec2maxpat import verify_patch_file`).

  Verified end-to-end, not just unit-level: `patches/drift-sequencer.maxpat` → clean (matches prior documented 0-violation result); `patches/jit-grab-scale.maxpat` → the same 3 warnings previously documented (`message-unverified` ×2, `presentation-required`) via both the CLI and the MCP tool function called directly; `patches/` directory sweep with `--summary` → matches the "1 warning total across `patches/*.maxpat`" figure from Phase (iii). Native-scopes fallback proven against the real Max install corpus (`/Applications/Max.app/.../help/max/metro.maxhelp` and a 25-file slice of `help/max/`) — surfaced the expected false-positive shape item 2 needs to measure (`presentation-required` firing routinely on C74's own help patches, which were never authored with Claude2Max conventions in mind) alongside genuine `object-unresolved`/`attribute-invalid` hits, confirming the resolver-tier rules also run correctly against native (non-embedded-spec) patches. `--no-resolver` confirmed to drop exactly the resolver-tier rules and keep structural ones. All 38 existing golden tests in `mcp_server/tests/test_verify.py` still pass unchanged. One bug caught and fixed during verification: the embedded-spec branch of `verify_patch_file` initially omitted the `report` key (only the native-scopes branch built it), which crashed the CLI's per-file report print — fixed by generating `report` in both branches.

  **Item 2 (Sonnet-run half) done 2026-08-20**: ran the full 11,873-file sweep (all three corpus roots — core `help/`, bundled `packages/`, user `~/Documents/Max 9/Packages`), reusing `maxhelp/maxhelp_crawl_state.json`'s file list so it's the exact same corpus the `.maxhelp` crawl already validated. **10.84s wall time for all 11,873 files** — scale was never going to be the constraint. 11,824 checked (99.6%), 49 unchecked (`not-a-patcher-file`, user-packages tier only). Full per-rule table (all 12 registered rules, hit counts, distinct-file counts, 5 sample locations each) + per-tier breakdown written to `mcp_server/CORPUS_SWEEP_RESULTS.md` (committed) and `mcp_server/corpus_sweep_summary.json` (committed, 8K). **Reproducibility caveat (2026-08-21):** macOS began denying reads under `~/Documents/Max 9/Packages` (`Operation not permitted`, TCC/Full-Disk-Access) partway through the session, so the later re-measurement covers only the 3,009 files inside `/Applications/Max.app`. Anyone re-running the full 11,873-file sweep must first grant the terminal/Claude Code Full Disk Access, or the user-packages tier (8,815 files — the majority of the corpus) silently drops out and the totals will not match this record. The 3.6MB per-file breakdown was NOT committed (scratch-regenerable in ~11s via the driver referenced in that file) — regenerate it if item 3 needs to drill into specific files.

  **Headline finding Opus needs to read before deciding anything**: ~44% of checked files (5,224 / 11,824) carry at least one `error`-severity violation — `object-unresolved` alone touches 5,053 distinct files, `attribute-invalid` 946. That is much higher than the task write-up's framing anticipated ("a rule that flags thousands of them is measuring our preference, not a defect" was written about the *principle* tier — `presentation-required`, which does land close to that framing at 8,676 distinct files). The `error` tier is NOT a new "should we promote this" question — those three rules (`object-unresolved`/`attribute-invalid`/`connection-missing-object`) are already ERROR and already block `spec2maxpat.py convert` today. This sweep is the first time they've been run at corpus scale, and a 44% file-level hit rate on C74's own corpus is either (a) correctly catching a lot of legitimately invented/outdated names across old help content, or (b) a false-positive problem already live in production, not merely a future promotion risk. Sonnet's read (not a decision — flagged for Opus in `CORPUS_SWEEP_RESULTS.md`'s "Immediate read" section) also flags `hidden-box-cord-visible` as the single largest hitter by volume (44,854 hits / 4,236 files) and worth a false-positive check given it dwarfs every other rule.

  **Item 3 (Opus read) done 2026-08-20 — and it INVERTS the task's premise. Full analysis in `mcp_server/CORPUS_SWEEP_RESULTS.md` § "Item 3 — Opus read".** The 44% error rate was investigated by decomposing every error-tier violation by root cause (`corpus_sweep_causes.json`) rather than trusting aggregates. Finding: **the error tier is ~98%+ false positive, and it is a live production defect, not a future promotion risk.**

  - **Sensitivity is intact** — `oscparse`, `jit.pwindo`, `metroo`, `bgcolorize` all correctly fail to resolve; `oscparse` still blocks convert. The gate catches invented names fine.
  - **Specificity is broken.** `attribute-invalid`: 21,185 of 21,487 hits (98.6%) are RNBO-stamped attrs (`rnbo_serial`, `rnbo_uniqueid`, `rnbo_classname`, `rnbo_extra_attributes`) plus `frozen_*_attributes` — tool-written structural metadata, not user attributes. `object-unresolved`: ~41% symbolic-operator aliases missing from the hand-maintained table (`/`, `&`, `|`, `>>`, `<<`, `!-`, `!/`, `!-~`, `/~`, all of `mc.*`), ~15% gen-domain vocabulary (the scope walker descends into `gen~`/`jit.gen`/`rnbo~` and checks their operators against the *Max* object set), ~12% local abstractions outside the search dirs.
  - **Live impact, verified end-to-end**: a spec containing `[/ 2]` and `[i]` is BLOCKED from converting with "'/' is not a known Max object" (exit 1, no file written). Division. The escape hatch is `--allow-unverified`, i.e. the misfire trains users to disable the anti-guessing layer wholesale.
  - **Key mechanism discovered**: C74 stores operator refpages under word filenames and declares the real name in the XML root's `name` attribute (`div.maxref.xml` → `name="/"`, `bitand` → `"&"`, `shiftright` → `">>"`, `rminus` → `"!-"`). So the alias table can be **harvested mechanically** instead of hand-maintained across two files — 56 aliases, zero collisions, versus the current 23; it also picks up `mc.*~`, `ggate`→`gswitch2`, `swap`→`fswap` that nobody would hand-write.
  - **Simulated fix measured** (`corpus_sweep_simulated_fix.json`, no repo edits): `object-unresolved` 8,291→1,101 (−87%), `attribute-invalid` 21,487→162 (−99.2%), files with residual errors ~5,224→645 (−88%). The 1,101 residual is *still* mostly real objects (`jit.gl.layer`, `jit.mo.*`, `jit.time.*`, `M4L.*`, `pluggo.*`, RNBO operators from `rnbo~` scopes). **No confirmed genuine invented-name detection was found anywhere in the 11,873-file corpus.**
  - **The corpus cannot authorize principle-tier promotion at all** — a finding about the plan, not just the rules. C74's patches are a *different population* from Claude2Max-authored ones; `presentation-required` (8,676 files) and `hidden-box-cord-visible` (4,236 files / 44,854 hits) fire at that rate because C74 never adopted these conventions, exactly as the task predicted. Both appear to work as designed. So the corpus gives an upper bound on noise and no signal on correctness-for-our-population. The original blocker stands: 5 in-repo patches / 1 warning is still too thin to promote on.

  **Item 3b (fix the block tier) DONE 2026-08-20 — approved by John, implemented, measured A/B.** Full detail in `mcp_server/CORPUS_SWEEP_RESULTS.md` § "Implemented — measured A/B". Headline: `attribute-invalid` 21,487→95 (**−99.6%**), `object-unresolved` 8,291→203 (**−97.6%**), files-with-≥1-error 1,590→169 (**−89.4%**), measured over an identical 3,009-file set with the "before" arm materialized from `git HEAD` (not a simulation). The `[/ 2]` + `[i]` spec that was blocked now builds.

  **The open question resolved better than either option offered.** John chose corpus-harvest-with-scope-tracking to fix real-but-unrefpaged objects without whitelisting gen operators. Neither was needed: **the Max install ships its own object database** — `interfaces/obj-qlookup.json` (1,323 core objects, each with an optional `alias` field: `v`→value, `i`→int, `t`→trigger) plus `packages/*/interfaces/obj-qlookup.json` and `packages/*/interfaces/max.db.json`'s `maxdb.aliases` registry (`jit.mo.sin`→jit.mo.func, `jit.gl.layer`→jit.gl.videoplane). 1,342 names / 361 aliases total. It resolves every real object in the residual AND rejects every negative control — `oscparse`, `metroo`, `jit.pwindo`, and the gen operators `clamp`/`history`/`swiz` are all absent from it because they are not Max objects. **The gen/Max boundary comes for free**, with no scope tracking and no harvesting. It is the database Max itself consults, so it outranks any inference from corpus contents.

  Seven changes landed: (1) `RefpageCache.object_db()` as a resolution source; (2) `RefpageCache.name_aliases()` harvests aliases from each refpage root's `name` attribute (`div.maxref.xml` declares `name="/"`), replacing both hand-maintained tables — `_VERIFIED_WORD_ALIASES` now holds only shorthands nothing mechanical can find (`t`,`sel`,`s`,`r`,`b`,`del`,`j`,`i`,`f`,`v`); (3) `_iter_patcher_scopes` no longer descends into `gen`/`gen~`/`jit.gen`/`jit.pix`/`jit.gl.pix`/`jit.gl.slab`/`jit.expr`/`rnbo~` (foreign languages); (4) `rnbo*`/`frozen*` skipped as tool-stamped, not authored, attributes; (5) bundled abstractions under `Max.app/.../patchers/**` + `packages/**` resolve, matched case-insensitively as Max does; (6) package refpages nested one level deeper found (RNBO ships `docs/refpages/max/rnbo~.maxref.xml`); (7) bare-numeric object text (`5`, `-1`, `1.`) treated as an int/float constant, and `linecount` added to universal box attrs (observed across unrelated classes, in no refpage).

  **Sensitivity re-verified after every fix** — `oscparse`/`metroo`/`jit.pwindo`/`bgcolorize` still unresolved and still block convert (exit 1); gen operators in a *Max* scope still flagged; `bgcolor`-on-`live.gain~` still invalid while `coldcolor` stays valid; 38/38 golden tests pass; the five in-repo patches verify identically to before.

  *Superseded plan (kept for context) — item 3b as originally scoped, pending sign-off:* Ordered by measured impact: (1) treat `rnbo_*` / `frozen_*` as structural keys, not attributes (−99% of `attribute-invalid`); (2) replace both hand-maintained alias tables (`_VERIFIED_WORD_ALIASES` in `spec2maxpat.py`, `REFPAGE_ALIAS` in `add_tutorial.py`) with harvesting from refpage `@name` (−41% of `object-unresolved`); (3) exclude gen/`rnbo~` scopes from Max-object checking (−15%); (4) widen abstraction search to package root (−12%). **Hold all warn→block promotion** until a Claude2Max-authored corpus exists to measure against; keep `prefer-v8` and `allcaps-name` at STYLE permanently. **Open question for John** (in the results doc): harvesting observed object names from the corpus would clear the remaining real-object residual automatically, mirroring the blessed `observed-attrs` pattern — but done indiscriminately it would whitelist gen operators (`history`, `swiz`, `clamp`) as valid *Max* objects, so `[clamp]` in a top-level patcher would silently pass. Mitigation is to record the scope each name was observed in and whitelist only genuine Max scopes. The two missing rule families (embedded-spec presence, spec-vs-patch object-count drift) still need writing regardless — now tracked as **item 8**.

  **Why this matters**: rules that are written but not mechanically checked are decorative, and rules checked in two places drift apart. The repo has already been bitten by the second failure: before 2026-06-21, `lookup_attribute`/`list_attributes` were refpage-only while the convert gate validated against `refpage ∪ jbox ∪ observed-in-help`, so the same server reported universal jbox attrs INVALID while convert accepted them — the query tools were *stricter than the gate*. That was fixed by routing both through one cached `_GateResolver`. This task applies the same fix to the whole rule corpus, before the drift recurs somewhere less visible.

  **The architectural constraint that shapes everything below**: an MCP server cannot block a tool call. It exposes tools Claude chooses to call. The only mechanism that can stop an action is a PreToolUse hook returning `permissionDecision: "deny"` (see `hooks/claude2max_max_edit_gate.py`). So "MCP does the work" means the *logic* lives in the server package; a thin hook layer remains, because it is the only thing that can be mandatory.

  **Do NOT have hooks call the MCP server over the protocol.** Hooks are short-lived subprocesses; the MCP server is stdio-bound to a Claude Code session and may not be running, may belong to a different session, and cannot be depended on for a sub-second PreToolUse decision. The shim is a plain Python import of the shared library — exactly what `hooks/claude2max_maxpat_content_gate.py` already does with `spec2maxpat.gate_maxpat_file`. That file is the reference shape for every shim this task produces.

  **The pattern already proven** (generalize this, do not invent a new one): `mcp_server/claude2max_verify/` is the anti-guessing rule library. It has three independent callers — `spec2maxpat.py convert` (blocks the build), the `verify_spec` MCP tool (reports), and the PostToolUse content-gate hook (feeds `additionalContext`). One library, three entry points, zero duplicated logic, no drift. Every work item below is "add a rule family to this library, then wire the callers."

  **Work items** (in dependency order — the sequence matters; see the note after item 7):

  1. **Build the repo-wide sweep: `verify_patch(path)` MCP tool + a CLI over the same library.** No prerequisites — it wraps rule functions that already exist. This lands first because it is the *measurement instrument* every later item depends on, not because it is the most interesting. Reachable three ways when done: on demand by Claude, at convert time, and across a directory in one pass. Already flagged as a wanted extension in `mcp_server/DESIGN_DECISIONS.md` § (j).

  2. **Validate against the 11,866-file patcher corpus the maxhelp crawl already built.** Point the item-1 sweep at the corpus enumerated in `maxhelp/maxhelp_crawl_state.json` (11,873 entries: `.maxhelp` + `.maxpat` + `.amxd` across the Max install, bundled packages, and `~/Documents/Max 9/Packages/`) and record a **per-rule false-positive rate**. Reuse the box-walk in `maxhelp/extract_observed_attrs.py` — it already parses all three file kinds, recurses nested subpatchers, and handles the `.amxd` `ampf`-header strip and `strict=False` recovery.

     This exists because the in-repo evidence is far too thin to promote anything on: running the full rule set over all 5 `patches/*.maxpat` embedded specs today yields **1 warning total** (`presentation-required` on `jit-grab-scale`). Five patches cannot distinguish "well-calibrated rule" from "rule that never fires." Cycling '74's own shipped patches are the adversarial set — they were authored without any knowledge of these conventions, so a rule that flags thousands of them is measuring our preference, not a defect. Output is a table: rule family × hit count × sampled examples. That table is the input to item 3, and it is what tells you whether item 3 is one session or three.

  3. **Promote the existing post-hoc rules from warn to block**, using item 2's table as the evidence. `mcp_server/claude2max_verify/rules.py` already implements 16 rule functions, and 8 are exactly the structural invariants this task cares about — `rule_presentation_required`, `rule_presented_controls_need_labels`, `rule_hidden_box_cords_hidden`, `rule_redundant_message_box`, `rule_subpatcher_labels`, `rule_debug_marking`, `rule_allcaps_names`, `rule_prefer_v8`. They run today at `WARNING`/`STYLE`, and `spec2maxpat.py convert` blocks only on `ERROR`, so they are visible but not binding. The work is not writing them; it is (a) fixing the genuine violations the sweep surfaces, (b) promoting each family whose false-positive rate is acceptable to `ERROR`, and (c) deciding which stay advisory forever — `rule_prefer_v8` is a preference, not an invariant, and should probably remain `STYLE`.

     Two families in this class are genuinely absent and do need writing — **embedded-spec presence** and **spec-vs-patch object-count drift**. They were described here originally; **moved to item 8** on 2026-08-21 so they are not buried inside a completed item. They do not depend on the promotion decision.

  4. **Classify the rule corpus by enforcement class.** ~75 `## ` rule sections across `CLAUDE.md` / `SPEC_REFERENCE.md` / `patching/MAX_PATCHING.md` (the set `lookup_rule` already indexes), plus `TUTORIAL_GUIDELINES.md` and `PRE_EDIT_CHECKLIST.md`. **Count it live rather than trusting this figure** — it was recorded as 73 on 2026-06-21 and was 75 by 2026-08-18; the corpus grows whenever a rule is enshrined. Tag each *mechanical* / *post-hoc* / *judgment*, and give judgment-class rules a trigger condition. Output is a machine-readable index, not a prose doc — `lookup_rule` should return a rule's enforcement class alongside its text.

     **Deliberately fourth, not first.** Classifying 73 rules in the abstract is the most speculative session in this list; doing it after items 1–3 means the categories are drawn from measured behavior rather than intuition. Nothing upstream waits on it — its only consumer is item 5.

  5. **Move the judgment layer into a `checklist(context)` tool.** `PRE_EDIT_CHECKLIST.md` is a flat 63-line file injected in full on every Edit/Write by `hooks/inject_admonitions.py`, so every item fires regardless of relevance and the signal degrades. Replace with a tool that returns only the items whose trigger matches, backed by item 4's trigger metadata. The `{!pre-edit}` (5) and `{!pre-commit}` (6) heading tags stay as the trigger vocabulary — they work, they are just too coarse.

  6. **Reduce the remaining hooks to shims.** After items 1–5, `hooks/*.py` (431 lines across 5 files) should hold argument parsing, the Claude Code JSON payload contract, and the exit-code / `permissionDecision` protocol — nothing else. Any Max or repo knowledge left in a hook after this task is a bug. Last because the shim signatures cannot settle until the library surface above them has.

  7. **Violation log, only if it earns its place.** The deleted predecessor task proposed `VIOLATIONS.md`. Add it only if item 4 surfaces judgment-class rules that genuinely cannot be moved into items 3 or 5 — a log nobody reads is worse than no log. Decide with the classification in hand.

  8. **Write the two missing rule families — round-trip integrity.** Two checks this task has always called for that do not exist in `rules.py` today. They were originally described inside item 3's body; promoted to their own numbered item 2026-08-21 because item 3 completed with "hold all promotion," which would have left them buried in a finished item where nobody would look for them. They are **independent of the promotion decision** — they need writing whether or not anything is ever promoted to blocking.

     **(a) Embedded-spec presence and integrity.** A `.maxpat` produced through Claude2Max must carry the hidden `text.codebox` (`id: "obj-spec-embed"`) holding the spec between `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---`. Three failure modes, all silent today: the embed is missing entirely; the embed is present but does not parse as JSON; more than one box carries the marker (the `extract_spec` first-match bug — a stray stub shadows the real embed and a subsequent `convert` emits an essentially empty patch).

     **The design question to settle first:** this rule must NOT fire on patches Claude2Max did not produce. The 11,873-file C74 corpus legitimately has no embed and is perfectly valid; a naive "no embed = violation" makes the rule useless noise on every native patch. So the rule needs a discriminator for "is this OURS?" — candidate signals: the patch was reached via `verify_patch_file`'s embedded-spec branch, an explicit caller flag, or a marker the converter always writes. Decide the discriminator before writing the check. The *integrity* halves — does not parse, more than one marker — are safe to fire unconditionally, because they only trigger where a marker already exists.

     **(b) Spec-vs-patch object-count drift.** Compare `len(spec["objects"])` to the number of boxes in the patch and flag divergence beyond a small threshold. This is the 1669-vs-135 orphan case documented in `CLAUDE.md` § "Sync preserves; it does not prune": an embedded spec accumulated 1,534 unwired duplicates of one message box, and converting it would have re-emitted every one into the operator's view. `CLAUDE.md` already tells the reader to run this comparison by hand after every sync; this item makes it mechanical. Note the legitimate-orphan carve-out that section documents — unreferenced `comment` / `panel` / `pwindow` / `bpatcher` boxes are valid UI orphans and must not count toward drift.

     **Where**: `mcp_server/claude2max_verify/rules.py`, registered in `REGISTRY` (not `RESOLVER_REGISTRY` — neither needs the authoritative resolver). Both ship with golden tests in `mcp_server/tests/test_verify.py`. Both land at `WARNING`, consistent with item 3's hold-all-promotion conclusion; revisit severity only when a Claude2Max-authored corpus exists to measure against.

     **Prerequisite met**: item 1 shipped `verify_patch_file()`, so once written these are reachable from all three entry points at once — the `verify_patch` MCP tool, `spec2maxpat.py verify`, and convert-time checking — with no additional wiring.

     **Overlaps** the `extract_spec` repair task (first entry in this queue), whose work item (d) is the same multiple-marker / unparseable-embed check. Whichever task runs first should build it in `rules.py` and the other should consume it rather than reimplementing. Note that the `extract_spec` task additionally needs the *converter-side* fix (a discriminator so `extract_spec` picks the real embed rather than the first marker-bearing box); this item covers only the detection rule.

  9. **Make the convert summary unmissable when only warnings fire.** From `DESIGN_DECISIONS.md` § (j). Today `convert` blocks loudly on errors but warnings print as individual `[verify]` lines into stderr scroll, where a long build buries them — the patch builds, the operator sees nothing, and a binding-rule violation ships. Add a single highlighted summary line even on a clean-but-warned build, naming the families rather than repeating each hit: `[verify] 3 warnings (presentation, 2 unlabelled controls) — not blocking`. Small, self-contained, no dependencies. Worth doing early precisely *because* item 3 held every principle rule at WARNING — a warning nobody reads is the same as no rule at all, so this is what keeps the held rules doing any work in the meantime.

  10. **Validate creation-argument arity against the refpage `<objarglist>`.** From `DESIGN_DECISIONS.md` § (j). `RefpageCache._parse()` already extracts object arguments (name / optional / type — see the "Extended `RefpageCache` metadata" entry in Done), so the data is in hand and unused by any rule. Catches a class the attribute and object-name rules structurally cannot see: a real object given the wrong number of creation args (`counter 0 3 5`, `metro 100 200`). Medium value, low false-positive risk — but confirm against the corpus before choosing a severity, because variadic objects and objects whose refpage under-documents their args will both look like violations. Start at WARNING per item 3's hold. Note the arity data must tolerate the documented value space (`size` can be the string `"variable"`) — see the parser rule in `CLAUDE.md`.

  11. **Promote `message-unverified` to ERROR — blocked on the observed-messages corpus.** From `DESIGN_DECISIONS.md` § (j) and § (i).1. The message rule is deliberately a *suspicion* today, not a block: refpage methodlists are materially more incomplete than attributelists, and unlike attributes there is no `jbox` base set or observed-corpus backstop to union in. That asymmetry is the whole reason it cannot block. **It is also the single largest warning family** — 4,717 hits across 964 files in the corpus sweep, more than `presentation-required` — so it is the biggest source of noise in the WARNING tier and the most valuable one to make trustworthy. Unblocked by the observed-messages corpus, tracked as deliverable (e) of the `.maxhelp` Corpus Crawl task; do not attempt promotion before that exists.

  **Deferred, not lost** — `DESIGN_DECISIONS.md` § (j)'s first suggestion (make `presentation-required` an ERROR when a patch has ≥N interactive controls and no presentation view at all) is a narrower proposal than the blanket promotion item 3 evaluated, and item 3's "hold until a Claude2Max-authored corpus exists" decision covers it. Re-evaluate it *with* that corpus, not before: the sweep showed the rule firing on 2,131 C74 files, which measures convention mismatch rather than defect, and cannot settle the narrower question either way.

  **Why this order**: item 1 is the instrument, item 2 is the measurement, item 3 is the change the measurement authorizes. Reversing 1–3 means promoting rules to blocking status on the evidence of 5 in-repo patches, which is how the jsui/v8ui regression happened. Item 4 is placed after the empirical work so the categories come from observed behavior; items 5–6 are downstream cleanup. Item 8 is independent of 1–7 — it can run at any point, including first.

  **Model per item** — this task spans both tiers; it sits under "Pending — Opus" by its hardest parts, not uniformly. Items 2 and 3 are worth running as a model switch mid-session rather than picking one.

  | Item | Model | Why |
  |---|---|---|
  | 1. Sweep CLI + `verify_patch` | Sonnet | Wiring over a library that already exists |
  | 2. Corpus validation | Sonnet to run · **Opus** to read | Running the sweep is mechanical; deciding what the table means is not |
  | 3. Promote warn→block | **Opus** decides · Sonnet writes | Promotion is a judgment call; the rule function and tests are typing |
  | 4. Classify ~75 rule sections | **Opus** | ~2,680 lines of dense rule prose, judgment throughout |
  | 5. `checklist(context)` tool | Sonnet | Implementation once item 4's metadata exists |
  | 6. Hooks → shims | Sonnet | Mechanical refactor |
  | 7. Violations log | Sonnet, or skip | Small and conditional |

  The dividing line: **Opus wherever the call is "is this flag a real defect or just our house style?"** — that question is the whole of items 2–4. Sonnet for everything that is building to a settled spec.

  **Soft prerequisite — DONE 2026-08-18.** *"Review the attribute conflicts the anti-guessing gate flags"* is complete: all 44 resolver errors across `patches/*.maxpat` were confirmed genuine and removed, so items 1–3 now start from a clean baseline (gate reports 0 errors on all 5 patches). That task also established the envelope figure items 1–2 build on: **66.5% of attribute occurrences are inspected**, with the no-refpage blind spot not yet biting because `patches/` contains no external-heavy patch. Expect that number to fall sharply once the sweep runs over the help corpus, where 3,180 objects have no enumerable refpage — quantifying that drop is exactly what item 2 is for.


  **Prerequisites**:
  - Read `mcp_server/DESIGN_DECISIONS.md` (especially § (h) tool/gate sharing and § (j) promotion suggestions) and `mcp_server/README.md` — the caching contract (`_FileCache`, mtime-gated) is what any new disk-backed rule source must use.
  - Read `mcp_server/claude2max_verify/rules.py` (863 lines) — the rule-function shape every new family must match.
  - Read `hooks/claude2max_maxpat_content_gate.py` — the reference shim.
  - Audit `.claude/settings.json` (repo) and the hook registration in `install_global.py` / `uninstall_global.py` — any hook signature change must land in all three.

  **What NOT to do**:
  - Do not build a parallel `RULES.yaml` that the prose renders from. The prose `*.md` files are the source of truth and `lookup_rule` already indexes them; the classification from item 1 is an index over that prose, not a replacement for it.
  - Do not add a rule to the library without a test. `mcp_server/tests` is at 38 passing; every family added in item 2 ships with cases.
  - Do not let a check block convert without first confirming it produces zero false positives on the existing `patches/` corpus — the 2026-06-21 jsui/v8ui false-positive (custom `declareattribute` names flagged as invalid, blocking convert) is the precedent.

  **Fits into the larger system**: this is the direct continuation of the MCP server task, extending it from "knowledge as tools" to "rules as one library." It replaces the removed Repo-as-Total-Scope Enforcement System task (deleted 2026-08-18), which proposed the same enforcement outcome via a parallel system of standalone scripts, registries, and logs living outside the MCP layer. Same goal, one home instead of two.

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

- [pending] **Creative proposal tool — `/c2m-propose`** — requested by John 2026-08-21. A skill that gets Claude2Max to *generate* rather than verify: to offer creative solutions, oblique angles, and interesting places to start. Everything else in this repo is built to stop Claude inventing things. This is the one tool whose job is to invent — which is exactly why it needs designing carefully rather than being left as "just ask Claude for ideas."

  **Four modes**, from John's original framing:

  | mode | input | output |
  |---|---|---|
  | **solve** | a stated problem ("the sequencer drifts out of time") | several genuinely different approaches, not variations of one |
  | **respond** | a prompt or brief (an assignment, a piece concept, a constraint) | several distinct responses to it |
  | **explore** | a seed idea, *or nothing at all* | interesting starting points for a new piece/patch |
  | **oblique** | an existing patch / piece / problem | sideways moves — angles that are orthogonal to the obvious next step |

  **The central design tension, and its resolution.** Claude2Max's entire architecture is anti-guessing: verify every name, block on invention, never write an API name from memory. A creative tool is in tension with that, and if the tension is left unresolved the tool fails in one of two ways — either the verification instinct neuters it into safe, boring suggestions, or it generates freely and names objects that don't exist, which is worse than useless because a student will try to build it. **The resolution: be generative about ideas, strict about names.** Propose freely at the concept level; every concrete Max object that appears in a proposal must still resolve through `lookup_object` / the package library before it ships. An exciting proposal built on `[oscparse]` is a trap, not an idea. Write this tension into the skill explicitly so a future session doesn't resolve it the wrong way by default.

  **Why this belongs in Claude2Max and not in a generic chat.** A generic brainstorm draws on training data. This repo has assets a generic brainstorm does not, and they are what make a proposal *surprising rather than generic*:

  - `packages/package_objects.json` — 2,795 installed objects with `use_when` judgments. **The single best source of creative surprise**, because students do not know what is already installed on their machine. "There is an object that already does this strange thing" is a better idea than any amount of free association.
  - `c74-projects/c74_projects_database.md` — who has already built something adjacent, and what they did with it.
  - `c74-forum/forum_insights.md`, `cookbook/cookbook_insights.md` — non-obvious techniques the docs do not teach.
  - `maxhelp/maxhelp_insights.md` + the observed-attrs corpus — what C74's own patches actually do with an object, which is often stranger than its refpage suggests.
  - For **oblique** mode: the patch itself, read via the `/c2m-explain` machinery, which already produces a stage-by-stage account of what a patch does. That is the correct input — proposing against a patch you have not read produces advice that ignores what is already working.

  **The hard part is diversity, not generation.** The failure mode of every brainstorming tool is N proposals that are secretly the same proposal ("add an LFO", "add another LFO to the LFO"). Generating five ideas is easy; generating five *different* ideas is the actual engineering. Specify a mechanism rather than hoping — candidate approach: require each proposal to originate from a **different source or lens**, and name the lens in the output. For instance one from the package library (an object they don't know they have), one from a constraint flip (remove something the patch depends on; make the slowest thing fastest), one from a different domain entirely (physical, visual, textual, social), one from the community corpora (someone already did an adjacent thing), one from scale/time inversion. Whatever the final lens set, the invariant is: **a proposal must be able to say what makes it different from the others**, or it should be cut.

  **Output contract per proposal** — the difference between a decorative idea and an actionable one:
  1. a one-line hook,
  2. what it actually does,
  3. why it is interesting / how it differs from the obvious move,
  4. the concrete Max objects involved — **verified**,
  5. **the smallest possible first step.** Item 5 is load-bearing. "Explore granular textures" is not a proposal; "have `[cv.jit.faces]` drive `[playlist~]` so a face's position scrubs the file" is. (Note the phrasing — **describe flow in Max's own directional vocabulary**, never "behind"/"in front of"; see the rule in `CLAUDE.md`.)

  Aim for **3–5 proposals, deliberately varied**, never a wall of twenty. A wall is a way of avoiding the judgment the tool exists to provide.

  **Guards.**
  - Proposals are **offers, not plans**. The tool proposes; the student chooses. It must not railroad, and it must not start building.
  - For **oblique** mode on an existing patch, honor **Modify, Don't Rebuild** and the observed-good-patterns rule: say explicitly what survives the change. An oblique angle that quietly implies a rewrite discards work that took sessions to get right.
  - `explore` with no seed must still produce something specific. "What are you interested in?" is a deflection, not a proposal — the mode exists precisely for the student who cannot answer that question yet.

  **Where it fits the larger system.** Slots into the Suggested Student Workflow at steps 1–3 (describe → plan → refine), and answers the gap that workflow currently assumes away: it begins with "student describes the patch they want," and has nothing to offer a student who does not yet know. Complements the existing skill family — `/c2m-explain` says what a patch *is*, `/c2m-design` shapes how it *looks*, `/c2m-package-search` answers a *known* question; this one supplies the question. Also useful in the instructor-review loop (step 5) as a way to bring several framed options rather than one.

  **Deliverable**: `.claude/skills/c2m-propose/SKILL.md`, following the in-repo manifest convention (see `CLAUDE.md` § "Plugin / Slash Commands", and the in-repo vs `UPSTREAM-SKILL.md` distinction). Add a row to that table when it lands. Consider whether it also warrants an `UPSTREAM-SKILL.md` export — it is arguably the most portable skill here, since the creative structure is not Max-specific even though its grounding sources are.

  **Decided by John 2026-08-21** (these were the open questions; answers are binding):

  - **Log the proposals — yes.** Keep a record of what was offered and, where known, what got built. Two payoffs: it feeds the Community Knowledge Pipeline task, and it is the only way to learn *which lenses actually pay off* — a lens that never produces anything anyone builds should be replaced. Decide the storage shape when building (a `proposals/` folder, or appended entries in `insights.md`); prefer whichever survives the fork/PR flow that pipeline already defines. Log the lens alongside the proposal, or the payoff is lost.
  - **Be opinionated — but the tool is optional, not standard.** Two halves, both load-bearing. *Opinionated:* when invoked, lead with a recommendation and say which proposal you would pursue and why — not a neutral menu. *Optional:* unlike `/c2m-sync` (mandatory before editing any existing patch) or the anti-guessing gate (unskippable), this skill fires **only when deliberately invoked**. Do not offer proposals unprompted, do not auto-trigger on a student sounding stuck, and do not fold it into the standard workflow. It is a tool the user reaches for, not a stage everything passes through.
  - **`oblique` may break the original concept — but never invites technical failure.** It is free to violate the piece's stated intent: invert the premise, discard the brief, propose the thing the student said they did not want. That is the mode's purpose and the prior art (Eno/Schmidt's Oblique Strategies) is deliberately willing to wreck the plan. What it may **not** do is propose something that cannot be built: conceptual risk yes, technical unsoundness no. This sharpens the generative/strict split above — *ideas* may be reckless, *names and wiring* stay verified. A proposal that abandons the concept and works is the point; one that keeps the concept and doesn't build is a bug.

  **Model**: Opus. Creative synthesis, package judgment, and reading a patch for what it is *not* doing all sit squarely in the model-selection rule's Opus triggers.

---

## Pending — Sonnet

Tasks that are primarily implementation, file editing, or verification — no deep architectural judgment required.

- [pending] **c2m.inspect v2 — two-way live message injection + targeted readback** — v1/v1.5 is *read-only inspection of named data structures*: it dumps `dict`/`buffer~`/`jit.matrix`/`coll`/`table` but cannot send a message into the patch or read back an arbitrary value (a number box's display, a `live.dial`, a `pattr`, a `value`). v2 adds a real debugging loop: **Claude sends a specific message to a specific place in the running patch and reads a specific response.** Design (planned 2026-06-21, John):

  **Transport.** Keep the proven one-way-over-disk return path (Max writes JSON to `/tmp`, Python polls mtime — no UDP reply dependency, survives headless). Add two OSC-in verbs to the existing `[udpreceive 7474] → [route]` chain:
  - `/inspect/send  <dest> <msg...>` — inject a message. `<dest>` is a Scripting Name (resolved via `this.patcher.getnamed`) or a `send`/`receive` symbol (resolved via `messnamed`). The v8 routes the remaining atoms to that destination's inlet. This is the "send realtime specific messages" half.
  - `/inspect/watch <tag> <dest> [<attr-or-outlet>]` — read back a specific live value. Implemented as: getnamed the object, then read via the appropriate accessor (`Maxobj` getters for box attrs; for outlet values, a v2 helper patch fragment that taps the outlet into a `[receive]` the v8 can read). Writes `/tmp/c2m_inspect_<tag>.json` like the dump path. This is the "receive specific realtime feedback" half.

  **Readback strategy (the hard part — needs a design spike).** Three candidate mechanisms, pick per target type:
  1. **Attribute getters via getnamed** — for any boxed object with queryable attrs (UI objects, `live.*`), `pat.getnamed(name)` then read attr; no patch wiring. Verify which attrs are JS-readable vs write-only.
  2. **`pattr`/`autopattr` tap** — for state already under a `pattr`, query it directly (pattr has a JS-reachable value). Cleanest for "what's the current value of X" when X is parameterized (which the repo already requires — "Always parameterize variables").
  3. **Wired probe convention** — for raw outlet values with no attr/pattr, a documented `[<source> → send <NAME>_PROBE]` wire (mirror of the v1.5 `_INSPECT` convention) that the v8 reads via a managed `[receive NAME_PROBE]`. Intrusive but universal.

  **Safety / scope guards.**
  - Injection into a live performance patch is destructive by nature — gate v2 send/watch behind an explicit `@allowinject 1` attribute on `[c2m.inspect]` (default 0), so a patch with the abstraction can't be poked unless the operator opted in.
  - All v2 additions stay debug-scaffolding (magenta marking, `debug_additions`, never in presentation) per the binding rule.
  - Keep v2 strictly additive: v1.5 dump/ping/scan verbs unchanged.

  **Open design questions for the spike:**
  - Outlet-value readback has no clean JS API — does the wired-probe convention scale, or should v2 lean on requiring `pattr` coverage (which the parameterize-everything rule already nudges toward)?
  - Should `/inspect/send` support a reply-await (send message, read the resulting state change in one round-trip) or stay fire-and-forget with a separate `/inspect/watch`?
  - Port reuse: v2 shares UDP 7474; confirm `route` can fan the two new addresses without disturbing the existing three.
  - Does this overlap enough with the multi-user-template's existing Max↔phone message surface to share code, or is it a separate concern?

  **Deliverables when built:** new verbs in `c2m_inspect.js`; matching `send`/`watch` subcommands in `tools/c2m_inspect_send.py`; `@allowinject` attr; skill doc update; a v2 section in `c2m_inspect_test.maxpat`; live verification. **Prereq:** finish + live-verify v1.5 coll/table first (above) so the dump path is trusted before layering injection on top.

  **Why this matters:** this is the difference between "inspect what the patch stored" and "drive the patch and observe it" — the latter is what makes c2m a genuine live-debugging harness (the question that prompted this: "should this be built into every patch so you can test live patches by sending messages and receiving responses?"). Note: the answer to "every patch" is still no — it stays opt-in debug scaffolding, removed before release; v2 just makes the opt-in far more capable.

  **Source:** 2026-06-21, John — "plan a live v2 that would allow c2m to send realtime specific messages and receive specific realtime feedback as needed for debugging."

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

- [complete] **Review the attribute conflicts the anti-guessing gate flags** — completed 2026-08-18. All three parts answered by measurement, and all 44 occurrences cleaned.

  **Part 1 — why only 4.** Measured the envelope rather than assuming it was narrow: across `patches/*.maxpat`, **1,196 of 1,798 attribute occurrences (66.5%) are actually inspected**. The remainder is 507 universal-box attrs (always valid by construction), 80 attr-less boxes, and 15 on `text.codebox` (custom-script class, deliberately exempt). **Zero** were skipped for "no refpage" — the envelope hole the task hypothesised does not bite on this corpus, because these patches use only well-documented built-ins. So "4 distinct pairs / 44 occurrences" is close to the true count *for these patches*; the no-refpage blind spot would only appear in patches using externals (bach, FluCoMa, …), none of which are in `patches/`.

  **Part 2 — the widening lever is already installed.** `_GateResolver.attrs_for()` in `spec2maxpat.py` already returns `own refpage ∪ jbox base ∪ help-corpus observed` (≥3-box floor, rnbo/frozen filtered). The `.maxhelp` observed-attrs map named as the key enabler was wired in on 2026-06-21. The 4 therefore survive the *widened* envelope, not the narrow one — three independent negatives each.

  **Part 3 — all 4 confirmed invalid, and all 4 are family-resemblance traps.** Each attr is real, on a different class: `locked_bgcolor` is real only on `p` (826 boxes corpus-wide, 0 of 12,920 `panel` boxes); `tribordercolor` on `live.slider`/`live.gain~`/`live.dial` (0 of 13,097 `number`); `bgfillcolor` on `panel`/`umenu`/`message` (0 of 2,535 `multislider`); `contrast` only on `gridmeter~` (0 of 2,535 `multislider`). All 44 removals were provably zero-visual-change — `locked_bgcolor` held the integer `1` (never a color) on panels that already set `bgcolor`+`bordercolor`; `tribordercolor` and `bgfillcolor` duplicated `tricolor`/`bgcolor` at identical rgba; `contrast` has no analogue. Verified after cleaning: every file semantically identical modulo the 4 attrs, gate reports 0 errors on all 5 patches, 38/38 verify tests pass.

  **Root cause found**: `_PRESERVE_ATTRS` in `spec2maxpat.py` documented `locked_bgcolor` under "panel chrome: bordercolor / border / rounded / locked_bgcolor" — reading as an assertion it is valid on `panel`. The list is class-agnostic (it is a sync whitelist of attr *names*), and `locked_bgcolor` is legitimately real on `p`, so the entry stays; the comment was corrected to say so explicitly.

  **Repeatable resolution procedure** (the gate will keep finding these):
  1. `S.gate_maxpat_file(path)` per patch → distinct `(class, attr)` pairs + occurrence counts.
  2. For each pair, check all three sources: `resolver.attrs_for(cls)`, `resolver.base_attrs()`, `resolver.observed_attrs(cls)`, plus the RAW count in `maxhelp/maxhelp_observed_attrs.json` under `["objects"][cls]["attrs"]` (note: `_meta` / `objects` / `maxclass_counts` are the top-level keys — the class map is nested under `objects`).
  3. Find where the attr IS real: scan the corpus for other classes using it. That names the family-resemblance source and usually the intended attr.
  4. Read the actual values and siblings before deleting. Safe when the correct attr is already present with the same value, or when the value was never of the right type.
  5. Remove from **both** the boxes and the embedded spec. The embed lives in `box["code"]` on `text.codebox` (id `obj-spec-embed`) — **not** `box["text"]`.
  6. Do **not** `convert` to apply the fix. Edit in place, then verify semantically: parse old and new, strip the removed attrs from both, assert deep equality.
  7. Re-run the gate + `python3 mcp_server/tests/test_verify.py`.

- [complete] **c2m.inspect coll/table support** — completed 2026-06-21. Wired the async coll/table dumpers into `c2m_inspect.js`'s `dump()` via `reachNamedWrite()` (getnamed→`Maxobj.message("write",file)` first, then `messnamed("NAME_INSPECT",…)` relay fallback); `SENTINEL` pre-write + `notReached()` turns an unreached object into a structured setup error, not a stale read. **Live-verified end-to-end** in `c2m_inspect_test.maxpat` (relay wires `[receive TEST_COLL_INSPECT]→[coll TEST_COLL]` + table equiv. added via sync→edit→convert): coll→`{1:alpha,…}`, table→`[100,…,800,0×8]`, error path→structured setup error. Two bugs found+fixed live during verification: (a) `parseTableText` rewritten for the **real** flat `table v0 v1 …` write format (was assuming a `data N …;` block); (b) JS `File` "write" mode doesn't truncate — added `f.eof = f.position` in `writefile()` so shorter dumps don't leave a stale tail. Both enshrined as pitfalls in `patching/MAX_PATCHING.md`. Skill/CLAUDE docs synced. v2 (two-way send/watch) remains queued.

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

### Hygiene note — 2026-06-21 (session 2)

Since the 2026-06-21 session 1 note: **MCP Phase (iv+) is fully complete** — global skill (`skills/max-patching/SKILL.md`), enforcement hook (`hooks/claude2max_max_edit_gate.py`), one-command installer/uninstaller (`install_global.py` / `uninstall_global.py`), and three CLAUDE.md additions (global skill docs, `.c2m-current-project` pointer, `install_global.py` offer in New User Setup Step 3) all shipped and committed. **`.maxhelp` deliverable (a) is complete** — `maxhelp_observed_attrs.json` wired into `_GateResolver` with alias fix, ≥3-box floor, `^rnbo`/`^frozen` filter. **`patches/4step-sequencer.maxpat`** committed (untracked file from prior session). TASK_QUEUE.md updated to reflect Phase (iv+) completion and deliverable (a) done. Queue structure otherwise unchanged — all pairings from 2026-06-20 remain valid. **Next Opus session**: review the 4 flagged attribute conflicts + `.maxhelp` prose-insight extraction (b) + JS census promotion (d).

### Hygiene note — 2026-06-20

Since the 2026-06-13 note: MCP Phase (i) is **fully complete** — all five steps done. Step 5 (end-to-end real-world test) run 2026-06-20; two issues found and fixed (search_packages silent-empty → dict with message; essentials() missing creation-arg warning). New files: `mcp_server/SMOKE_TEST_RESULTS.md`, `mcp_server/PROJECT_CLAUDE_SNIPPET.md`. Queue otherwise unchanged — all cross-references, pairings, and fold decisions from 2026-05-28 remain valid. **Next Opus session**: Phase (ii) — `verify_spec()` + shared rule library.

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
- *MCP server task* ↔ *Community Knowledge Pipeline*. Incoming PRs from forks can include not just prose insights but also test cases that get added to `verify_spec`'s rule library, growing MCP's coverage over time. Cross-reference already in MCP task body.

**Not combined (considered and rejected)**:
- *Forum Crawl + Cookbook Analysis + Cycling '74 Projects Crawl* — all `[in progress]` knowledge-corpus builds with shared session shape ("pick chunk → scrape → write insights → log resume point"). Each has its own state file and log; combining would mostly be cosmetic and could slow each by forcing context-switching. Left as-is.

**No tasks marked stale or deleted.** Queue is in good shape modulo the one redundancy (subtask 5, now struck) and the one merge (Package Library). The `[in progress]` tasks are real ongoing work, not abandoned.

**Position note**: the new MCP task is now top-priority *by position* (first under "Pending — Opus"). The other top-priority Opus task (Community Knowledge Pipeline) is still very relevant and pairs conceptually with MCP, but appears demoted in the list ordering. This is positional, not semantic — work on them in whatever sequence makes architectural sense, not strictly by list position.

**Tangential observations** (not action items now):
- *TouchOSC mk2 Integration* and *Return to claude2max-design skill* are unrelated to the MCP push but both could *consume* MCP's `verify_spec` once it lands — TouchOSC's parallel converter wants the same spec validation; the design skill's layout output would benefit from rule-level checks alongside Phase 3 screenshot verification. Long-term integration story, not action items now.

### How to use this section

- **Periodic review trigger**: when adding any new task to "Pending — Opus" or "Pending — Sonnet", scan the existing entries for overlap and update this section. Date-stamp the review.
- **Before starting a top-priority task**: read the latest dated review here for soft prerequisites and pairings before diving in.
- **When queue contents drift materially** (>~5 task additions/completions since the latest dated review), redo the analysis and date-stamp the new pass. Keep prior dated reviews for historical context unless they contradict.
- **Never use this section to track per-task progress** — that belongs in the task entry itself (`[in progress]` marker + inline note). This section is strictly for *relationships between tasks*.
