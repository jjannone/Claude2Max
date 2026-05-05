# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Rules from Corrected Errors {!pre-commit}

After fixing any error, derive a general rule that would have prevented it. Present the proposed rule(s) to the user in plain language before writing them to CLAUDE.md or SPEC_REFERENCE.md. Only enshrine rules the user confirms. This keeps the knowledge base accurate and user-approved rather than accumulating unreviewed assumptions.

**Always generalize before enshrining — regardless of where the rule comes from.** This applies to rules derived from errors, rules stated by the user, rules observed in practice, and rules inferred from context. Before writing any rule, ask: what is the underlying concern this is guarding against? A rule scoped to the specific incident only helps when that exact incident recurs. A rule scoped to the underlying concern applies across a much broader range of situations. Do not wait for the user to ask for generalization — it is always the right default.

**When writing rules, state the general principle — not the specific fix.** A rule that says "do X in situation Y" only helps when Y recurs exactly. A rule that identifies the underlying concern applies across a broader range of circumstances. Ask: what is the real problem this rule is guarding against? Write the rule around that.

**Lead with intent, follow with example.** State what you're trying to achieve in plain terms first, then illustrate with a concrete case introduced as "for instance." This keeps the principle readable and applicable broadly, while still giving actionable guidance. Rules that lead with a specific method risk being read as recipes rather than principles.

## Verify External State — Never Assert from Memory

Before making any claim about the state of an external or shared system — GitHub repo visibility, remote branch status, CI results, whether a file exists on a remote, whether a service is available — verify it with the appropriate tool first. Memory, inference from local context, and reasonable assumptions are not sufficient. A wrong assertion is worse than a delayed one.

For example: don't say a repo is private because it looks like a personal project; run `gh repo view --json visibility` and check. Don't say a branch exists remotely without `git ls-remote`. Don't say a URL is unreachable without trying it.

This applies beyond GitHub to any external state that can change independently of the local working directory.

## Never Write API Names From Memory

Never write a method name, property name, attribute name, function name, CSS property, shell flag, environment variable, or any other API identifier from memory. If the name didn't come from a documentation page, header file, refpage, autocomplete, or other authoritative source within the last few seconds, it is a guess — and a guess is forbidden. This applies across every language and every environment, not just Max.

The reason this rule needs to be explicit: environments differ only in *how loudly they catch a guess*. Typed languages throw at compile time; untyped languages throw at runtime; Max attributes, CSS properties, and similar APIs **fail silently** — the wrong name is accepted and quietly ignored, doing nothing. **Silent failure is more dangerous than loud failure, not less**, because there is no error message to surface the mistake. The discipline must therefore be the same across all environments: do not write the name unless you have just confirmed it exists.

The recognition signal: **if I find myself reaching for an attribute or method name because it "sounds right" for this kind of object, that is the exact moment verification is non-optional.** Family resemblance ("it's a UI control, surely it has `bgcolor`") is not evidence that the name exists on this specific object. Each object's vocabulary is its own.

For instance: writing `bgcolor`, `peakcolor`, `knobcolor`, or `needlecolor` on `live.gain~` because those names exist on other UI objects is the same kind of mistake as writing `arr.contains()` in JavaScript because it sounds right (the actual method is `arr.includes()`). JS throws `TypeError`. Max silently accepts the unknown attribute and ignores it — the mistake survives a code review I would never let it survive in JS. The valid `live.gain~` color attrs are `coldcolor`, `warmcolor`, `hotcolor`, `overloadcolor`, `slidercolor`, `textcolor`, `tricolor`, `trioncolor`, `tribordercolor`, `focusbordercolor`, `modulationcolor`, `inactivecoldcolor`, `inactivewarmcolor` — confirmed by reading `/Applications/Max.app/Contents/Resources/C74/docs/refpages/m4l-ref/live.gain~.maxref.xml`.

The verification mechanics for Max specifically — the refpage paths, the `grep` patterns, the `RefpageCache.lookup()` API — live in `MAX_PATCHING.md`. This rule states *why*; that file states *how*.

**Verification is per-attribute, not per-object.** If I am writing N attributes for an object, I must verify N names against the refpage. Batching N attrs into one edit without per-name verification is the failure mode this rule is designed to prevent.

## Parsers Must Tolerate the Schema's Full Value Space, Not Just the Sample You Tested Against

When parsing third-party data (XML, JSON, configs, refpages), don't coerce a field's type based on the values you happened to see in your test sample. The first input you didn't test against is the one that breaks. Fields that look numeric in examples may legitimately carry string sentinels like `"variable"`, `"auto"`, `"none"`, or `"all"`. Either confirm the documented schema's full value space before coercing, or accept the textual form and only coerce at the point of use, with a fallback for non-numeric values.

For instance: a Max refpage attribute's `size` is usually an integer, but `"variable"` is also valid. `int(attr.get("size", 1))` crashes the parser the first time it meets such a refpage; a `try int → fall back to the original string` pattern preserves both numeric and sentinel cases without losing information.

## Reference Instances Illustrate Principles — They Don't Constitute Them

When a rule, checklist, or repair procedure refers to "what correct looks like," enshrine the **structural contract** (the attributes, invariants, shape) — not a specific file as the source of truth. Specific files are illustrations introduced as "for instance," and they may be renamed, edited, or deleted without the rule needing to change. A rule pinned to a file becomes wrong the moment that file moves; a rule pinned to the contract stays correct as long as the contract holds.

This is a corollary of "always generalize before enshrining." It applies anywhere a working example is being used as a reference: tutorial structure, patch conventions, file layout, JS module shape, anything. Before writing "match the way `<file>` does it," ask: what are the actual properties this file has that make it correct? Write those. Then mention the file as one place to see them, not as the rule itself.

## Partial Answers Are Not Consent — Re-Ask the Unanswered Part

When asking the user a multi-part clarifying question (e.g. "should I do A like X or Y? and should B be P or Q?"), and the user replies addressing only some of the parts, the silence on the others is **not** authorization to proceed with my best guess. The right behavior is to act on what was answered, then re-ask the unanswered parts — or hold all action until the full picture is clarified.

Acting on my own interpretation of an un-answered branch produces work the user didn't authorize and that may need to be undone. The cost of one short follow-up question is much lower than the cost of restoring an unintended change.

## Flag Natural Commit Moments — Proactively Suggest Commit, Sync, and New Session

Long conversations accumulate uncommitted work and stale context — both compound. The default cadence is: commit early, sync often, restart frequently. When the work reaches a natural commit boundary — a self-contained chunk that could land as one logical commit — **proactively suggest committing, pushing to origin, and starting a new session**. Don't wait to be asked, and err on the side of suggesting more often rather than less.

A commit moment is "natural" when ALL of the following hold:

- A coherent unit of work is complete — a feature, a fix, a refactor, a doc pass, a knowledge-base chunk, a queued task. No in-flight iteration; no "I'll fix that next."
- All decisions, rules, and learnings have been propagated to the relevant repo files (`CLAUDE.md`, `SPEC_REFERENCE.md`, `MAX_PATCHING.md`, `TUTORIAL_GUIDELINES.md`, `WORK_HISTORY.md`, etc.) — the next session can rebuild context purely from disk.
- `WORK_HISTORY.md` has the work logged.
- No pending verification is owed (e.g. "check that this works in Max and let me know").
- The user is not mid-decision on something where the conversation's recent reasoning is the working memory.

When such a moment arrives, surface it concretely. For instance: "This looks like a natural commit point — want me to commit `<short description>` and push to origin? After that, you can clear and pick up the next chunk cold." Include the proposed commit subject so the user can accept or redirect quickly.

Bad commit moments (do NOT suggest here): mid-debug, mid-iteration, after a partial fix that hasn't been verified, when external verification is pending, or when the user is exploring options whose tradeoffs are still actively in conversation.

When the user does commit at one of these moments, the follow-up is: (a) confirm `WORK_HISTORY.md` has the session's summary; (b) verify any pending changes in the actual application before clearing — easier to iterate while context is warm than after a cold restart; (c) note any chips/follow-ups that should survive into the next session via files rather than memory.

## Modify, Don't Rebuild — and Treat Observed-Good Patterns as Binding

When the task is a new version of an existing patch, the default workflow is `extract → edit → convert`: pull the embedded spec, modify only what is changing, write back. Rebuilding the spec from scratch is the wrong default — it silently drops every working detail of the original that does not make it into the new build. Alignment offsets, init defaults, wiring patterns, sub-systems, naming conventions, and dozens of micro-decisions that took prior sessions to get right vanish without warning. Only build from scratch when the new version shares less than half its structure with the original.

**The companion rule: observed-good patterns are binding.** Any pattern noticed as "what's working" in analysis or critique creates an obligation to preserve that pattern in any subsequent implementation. Praising-without-applying is worse than not noticing at all — it proves the information was available and ignored. Marking something as good is an implicit commitment to keep it.

For instance: writing in design critique that "the comment-padding compensation gives clean visual alignment of labels with controls" creates a binding constraint on any redesign that follows. The compensation must survive into the new version. The robust fix is not "remember to re-apply it" — that is the failure mode this rule names. The robust fix is to start from the existing spec so the pattern survives by default, and only deviate where the change is intentional.

**Two practical consequences:**

1. **Default to spec extraction, not spec construction.** The phrase "build a new spec" should trigger the question "why not extract and edit?" before any code is written. Construction is reserved for genuinely new patches.

2. **Critique creates checkpoints.** Anything noted as good during analysis is a checkpoint that must be revisited before declaring the implementation done. Did the new build preserve every observed-good pattern from the original? If no, either restore it or document why it was deliberately dropped.

## When Building a New Version from an Existing Patch

- **Retain all default values.** Any `loadbang → init` chain, `loadmess`, or hardcoded default in the JS must survive unchanged into the new version. Defaults represent deliberate configuration — they are not incidental and must not be silently dropped.

- **Preserve wiring integrity when modifying patches programmatically.** Patchlines reference boxes by `id`, so renaming a box that has connections silently breaks all wiring to and from it. Keep original IDs intact; only assign new IDs to newly added boxes.

## Never Regress Functionality When Changing Modality

**General rule**: when any working feature — display, control, behavior, format — is moved, replaced, or reimplemented in a different modality, it must arrive at least as capable as it left. A change of modality is not a reason to lose functionality.

This applies to: switching UI objects, reformatting data for a new display, replacing a message with a UI element, moving logic from patch to JS or vice versa, or any other substitution. If the user didn't ask for a feature to be removed, it must survive the transition.

**Specific case — display format**: when moving information from one display context to another (Max console → cellblock, message box → UI element, etc.), carry over all essential elements of the working format — indexing, orientation, field order, readable structure. Do not drop features just because the new modality doesn't force you to include them.

Before implementing any new display for existing data, inventory every piece of information in the current format and confirm all of it is present in the new one.

## Model Selection — When to Use Opus vs Sonnet

Claude Sonnet is the default and handles most tasks. **Do not proceed silently on Sonnet when Opus is warranted** — pause and prompt the user first. Use the exact phrasing below so the prompt is unambiguous.

### Prompt to switch to Opus

When any of the following tasks arises, stop before beginning and say:

> "This task warrants Opus for better results — run `/model claude-opus-4-7`, then let me know and I'll continue."

Trigger cases:

1. **Analyzing a dense or complex existing patch** — non-obvious signal flow, reverse-engineering intent, structural problems
2. **Studying complex documentation** — Max refpages, third-party package docs, API references where subtle distinctions matter
3. **Analyzing installed packages** — evaluating objects, writing `use_when` judgments for `packages/package_objects.json`
4. **Reading complex Cycling '74 forum threads** — synthesizing community knowledge, distinguishing good advice from outdated workarounds
5. **Planning a new complex patch** — architecture decisions, subpatcher decomposition, signal flow design before any spec is written
6. **Designing a presentation mode UI** — layout hierarchy, panel grouping, visual weight, control placement. Stop and offer the user two options:

   > "Before we design the presentation UI, choose an approach:
   > - **Option A** — run `/model claude-opus-4-7` and we'll design it here (Opus = same model as Claude Design)
   > - **Option B** — take the design to [claude.ai/design](https://claude.ai/design), which has separate usage included with your account, then bring the layout back and I'll translate it into spec coordinates
   >
   > Which would you prefer?"

   Wait for the user's choice before proceeding. If they choose Option B, ask them to describe or paste the layout when they return and you'll handle the spec translation on Sonnet.

   **Periodic check**: Claude Design is evolving rapidly. At the start of any session involving presentation UI work, do a quick web search for recent Claude Design news — new capabilities, API availability, Claude Code integration, or workflow changes. If anything materially affects how it can be used here, update this rule before proceeding.

### Prompt to switch back to Sonnet

When the analytical or design phase is complete and implementation begins (spec writing, conversion, file editing), say:

> "The analysis/design phase is done — you can switch back to Sonnet now: `/model claude-sonnet-4-6`."

## Before Beginning Any Work

Read and review the entire Claude2Max repo before starting — `CLAUDE.md`, `SPEC_REFERENCE.md`, `TUTORIAL_GUIDELINES.md`, and `spec2maxpat.py` — so your understanding of the current spec format, converter behavior, and conventions is fully up to date. Do not rely on prior session knowledge alone; the repo is the authoritative source.

**Before constructing or editing any patch**, read `MAX_PATCHING.md`. It contains all patching principles, presentation view guidelines, documentation verification rules, and common pitfalls. Treat its presentation section as a checklist before starting any presentation layout.

**Before designing or analyzing anything inside a `gen~` / `gen` box**, also read `GEN_PATCHING.md`. gen~ is a separate dataflow language with its own object set and per-sample evaluation model — patterns from MSP do not necessarily translate.

**Before designing or analyzing anything inside a `jit.gen` / `jit.gl.pix` box**, read `JIT_GEN_PATCHING.md`. Same gen language as gen~, but iteration is per-cell or per-pixel rather than per-sample — `samplerate` and audio-time idioms do not apply; position primitives (`norm`, `cell`, `dim`) and texture sampling do.

**Before working on a Max for Live device**, read `M4L_PATCHING.md`. M4L adds the Live Object Model, `live.*` UI objects, device-lifecycle considerations, and `.amxd` packaging — none of which appear in standalone Max patches.

## Workflow

### Working on an existing patch — sync first, always

**Before any work on an existing .maxpat**, run sync to capture manual edits the user made in Max. No exceptions — not even for small fixes. `convert` regenerates the .maxpat from scratch and will silently destroy moved objects, added/deleted objects, hidden objects, and hidden cords.

**The sync-first rule applies to any source of edits — not just user GUI changes.** Any direct modification to a .maxpat — whether a user edit in Max's GUI or a programmatic post-processing script — is invisible to the embedded spec and will be silently overwritten on the next `convert`. Use `/c2m-sync` or run `python3 spec2maxpat.py sync -i <patch>` immediately after any direct .maxpat modification.

### Spec files are temporary — do not leave them in the project

The spec is embedded inside every `.maxpat`. Standalone `.json` spec files are only needed as a scratch file during `convert`. Write them to `/tmp/` rather than the project folder, then delete after converting. The `.maxpat` is the single source of truth.

### New patch (from scratch)

1. User describes a Max patch they want
2. Write a JSON spec following `SPEC_REFERENCE.md`
3. Convert: `python3 spec2maxpat.py convert -i /tmp/spec.json -o patches/patch.maxpat`
4. User opens in Max, gives feedback, iterate

### Existing patch (externally sourced or manually edited)

Run `/c2m-sync` first. Extract, edit, convert. All patches live in `patches/`.

## Max Compressed Text (MCT)

**Produce MCT only when the user requests it, or when the user has already provided MCT in the conversation.** Never paste raw `.maxpat` JSON — users can't open it. MCT is the format Max uses for "Copy Compressed": the user copies the block and does **File > New From Clipboard** to reconstruct the patch.

```bash
python3 spec2maxpat.py mct -i patches/patch.maxpat   # produce MCT
```

To decode MCT received in the conversation: `python3 -c "from spec2maxpat import mct_decode; import sys,json; print(json.dumps(json.loads(mct_decode(sys.stdin.read())),indent=2))"` piped from the MCT block. See `SPEC_REFERENCE.md` § "MCT Encoding Algorithm" for the encoding detail.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format, object types, connection format, layout guidelines, v8/JS objects, MCT encoding, worked examples.
- `MAX_PATCHING.md` — Patching principles, presentation guidelines, documentation verification rules, common pitfalls. Read before any patch work.
- `GEN_PATCHING.md` — gen~ / gen programming model (audio rate / control rate), canonical idioms (slide envelope follower, samplerate→ms, equal-power crossfade), latency-compensation discipline. Read before any work inside a `gen~` / `gen` box.
- `JIT_GEN_PATCHING.md` — jit.gen / jit.gl.pix programming model (per-cell / per-pixel), position primitives (`norm`, `cell`, `dim`), texture sampling, distance-field idioms. Read before any work inside a `jit.gen` / `jit.gl.pix` box.
- `M4L_PATCHING.md` — Max for Live patterns: Live Object Model access chain, `live.thisdevice` init signal, `getpath` + `deferlow` race, Push 3 polyphonic pressure, `live.*` UI styling, `.amxd` packaging. Read before any M4L device work.
- `spec2maxpat.py` — The converter. I/O data from C74 maxref.xml via `RefpageCache`; no external database.
- `TUTORIAL_GUIDELINES.md` — Tutorial structural contract, panel/annotation attrs, comment-pile pattern, breakage diagnostic.
- `packages/package_objects.json` — Curated reference of installed Max package objects with `use_when` judgments.
- `packages/package_concepts.md` — Per-package paradigms (bach lllls, FrameLib frames, FluCoMa corpus workflow, etc.).
- `packages/package_schema.py` — Canonical schema; `normalize()`/`validate()` for `package_objects.json`.
- `packages/query_packages.py` — `list`, `search <term>`, `validate`. Read-only CLI for the package library.
- `packages/CURATION.md` — How to extend package coverage: extractor CLIs, schema norms, `use_when` quality bar.
- `c74-forum/forum_insights.md` / `cookbook/cookbook_insights.md` / `c74-projects/c74_projects_database.md` — Community knowledge, non-obvious patterns, real examples, and a catalog of community projects.

## Knowledge Resources — Consult Before Designing

When designing or debugging a patch, consult these curated sources — not just the official docs:

- **`packages/package_objects.json`** — 2,795 package objects with `use_when`. Search: `python3 packages/query_packages.py search "<term>"`. Check before building any multi-object native chain.
- **`packages/package_concepts.md`** — Paradigms for packages with custom types (bach lllls, FrameLib chains, FluCoMa workflow). Read when using a new package.
- **`c74-forum/forum_insights.md`** — Non-obvious behaviors, preferred patterns, performance pitfalls from Cycling '74 forums.
- **`cookbook/cookbook_insights.md`** — Insights from Max Cookbook examples (Dobrian/UCI).
- **`c74-projects/c74_projects_database.md`** — Catalog of community projects from <https://cycling74.com/projects>. Search this when answering "is there an existing Max for Live device that does X?" or "who has built something like Y?". Note: most gallery entries link to commercial products (paid M4L on gumroad / vstopia / vendor stores) — patch source is rarely available. Free patches that are extracted go to `c74-projects/c74_projects_insights.md`.

_Add new scraped resources here. Every knowledge folder: `<source>/CRAWL_LOG.md`, `<source>/crawl_state.json`, `<source>/<source>_insights.md`._

## Consult Installed Packages Before Long Native Chains

Check `packages/package_objects.json` before composing any 3+ native-object chain. The `use_when` field is the load-bearing entry — it tells you when and how to drive the object. Use `/c2m-package-search` or `python3 packages/query_packages.py search "<term>"`.

**Library schema:**

| Key | Type | Notes |
|-----|------|-------|
| `digest` | str | One-line description. |
| `numinlets` | int | 0 = unknown; consult refpage. |
| `numoutlets` | int | 0 = unknown; consult refpage. |
| `outlettype` | list[str] | Per-outlet type. |
| `kind` | str | `external`, `abstraction`, `javascript`, or "". |
| `source` | str | `refpage` or `helpfile`. |
| `use_when` | str | The curated judgement — load-bearing field. |
| `deprecated_by` | str | Optional. Present when refpage flagged the object. |

**Converter fallback.** `spec2maxpat.py` consults `package_objects.json` as final I/O fallback — externals like `cv.jit.faces` work in a spec without overrides if curated. To extend coverage, see `packages/CURATION.md`.

## Converter Design Rule — Match Max's Defaults, Never Exceed Them

The converter should only add attributes that Max doesn't set by default. The goal is to match what you'd get from a fresh object instantiation in Max, plus whatever the spec explicitly requests. Injecting "helpful" extras — even well-intentioned ones — overrides Max's defaults and can lock controls, suppress normal behavior, or produce states the user never asked for.

For instance: `live.*` objects were getting `parameter_enable: 1` and `saved_attribute_attributes` unconditionally, but a freshly placed `live.gain~` in Max has neither. The injected attrs forced parameter automation state on load, locking the gain slider. The correct behavior: don't add them unless the spec asks for them.

**When adding any auto-generated attr to the converter, verify first by creating the object fresh in Max and inspecting its JSON — only inject what's absent but required for correct wiring, never what's absent because Max intentionally leaves it unset.**

## What You Must Handle

- **Object text, connections, layout** — write text exactly as you'd type it in Max. Get outlet/inlet indices right. Use explicit `pos`. See `SPEC_REFERENCE.md` and `MAX_PATCHING.md` for all rules.
- **Presentation** — see `MAX_PATCHING.md` for all layout, spacing, and design rules. Key invariants: every presented control needs a comment label; set `openinpresentation: 1`; exclude infrastructure objects; use screenshots (computer-use MCP) to verify.
- **Subpatcher, abstraction, and poly~ inlet/outlet labeling** — every `inlet` and `outlet` in a subpatcher/abstraction/poly~ must be labeled in two places: (1) **outside** — `attrs: {"comment": "in 0: bang — purpose | out 0: list — result"}` on the `p`/`poly~` object; (2) **inside** — `attrs: {"comment": "..."}` on each inlet/outlet spec entry AND an adjacent `comment` box. Never create an encapsulated unit without both levels.
- **Objects not in converter's tables** — supply `inlets`, `outlets`, `outlettype` in the spec.
- **Always embed the spec** — every .maxpat produced via Claude2Max must include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects, with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters. This applies whether the output is from the converter or assembled manually.

## Naming Convention

Use **ALL CAPS** for all user-defined names: `send TEMPO`, `receive PITCH`, `pv CURRENT_STATE`, `buffer~ LOOPBUF`, `var STEP_COUNT = 0;`. Applies to patcher names, send/receive names, pv/v variables, buffer~ names, coll names, JS variables. Does NOT apply to Max built-in names, object names, or message selectors.

## Tutorial System

To add an interactive step-by-step tutorial to a patch, invoke `/c2m-tutorial`. The skill handles the full two-pass workflow (sync → analyze → enhance descriptions → generate). Read `TUTORIAL_GUIDELINES.md` for the structural contract, panel/annotation attrs, comment-pile pattern, and breakage diagnostic before modifying any tutorial code.

## Plugin / Slash Commands

These skills ship with the repo in `.claude/skills/` — cloners get slash commands automatically:

| Command | Fires when | What it does |
|---------|-----------|--------------|
| `/c2m-sync` | Explicit sync request; "did my edits make it back?"; pasting in external .maxpat | Runs `sync -i <patch>` to capture manual edits before any convert |
| `/c2m-tutorial` | Add tutorial; "walk through this patch"; make self-teaching | Two-pass: sync → analyze → enhance descriptions → generate |
| `/c2m-package-search` | "Is there a package for X?"; before building 3+ native chain | Searches `package_objects.json`, recommends or falls back |
| `/c2m-design` | Design presentation UI; panel layout; themed UI; jsui canvas | Reads c2m-themes, designs layout, translates to spec coordinates |
| `/c2m-explain` | Explain a patch; "what does this do?" | Single-pass explanation without modifying the patch |

## Admonition Tags

Headings in any `*.md` at the repo root tagged `{!pre-edit}` or `{!pre-commit}` are re-surfaced by `hooks/inject_admonitions.py` as `additionalContext` at the matching moment — `pre-edit` fires on Edit/Write tool calls; `pre-commit` fires when a Bash command contains `git commit`. To add a new at-action-point reminder: append the tag to any heading. No Python changes needed.

## Keeping Docs in Sync {!pre-commit}

Whenever you learn something new about Max behavior, fix a bug, or add/change a feature, **immediately** propagate that knowledge to all relevant files before committing:

- `SPEC_REFERENCE.md` — object behavior, .maxpat format details, layout rules; object-specific behavioral notes and pitfalls
- `MAX_PATCHING.md` — patching principles, presentation guidelines, documentation rules, common pitfalls
- `TUTORIAL_GUIDELINES.md` — tutorial generation lessons and conventions
- `CLAUDE.md` — workflow, process rules, cross-cutting conventions
- `WORK_HISTORY.md` — session summary (create it if absent)

**Before every commit/push**, check: did this session produce insights that belong in the reference docs? If so, update them in the same commit. Do not wait for the user to ask — this is automatic.

## New User Setup

**At the start of every conversation**, after the long-gap check, run this:

```bash
USER_EMAIL=$(git config user.email)
echo "$USER_EMAIL"
```

If `USER_EMAIL` is `jannone@mac.com`, skip this section entirely.

Otherwise:

```bash
USER_NAME=$(git config user.name | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
BRANCH="insights/${USER_NAME}"
git branch --list "$BRANCH"
```

If the branch does not exist (empty output):

```bash
git checkout -b "$BRANCH"
```

Then greet the new user:

> "Welcome to Claude2Max. I've created a branch **`insights/<your-name>`** to track your session. As we work together, I'll log useful discoveries, workflow improvements, and corrections to `insights.md` on this branch. If anything seems worth sharing with other users, I'll let you know — it only takes a PR to contribute it back."

Create `insights.md` if it doesn't exist:

```markdown
# Claude2Max Insights — <user name>

Discoveries, corrections, and workflow improvements gathered during use.
Candidates for upstream PRs are marked **[PR candidate]**.

## Log

```

From that point forward in the session:
- Append any confirmed new rule, correction, or non-obvious workflow insight to `insights.md` under the `## Log` section with today's date
- Mark entries `**[PR candidate]**` when they seem broadly useful (not just specific to this user's patch)
- At the end of the session, if there are any PR candidates, remind the user: "There are N entries in `insights.md` marked as PR candidates — consider opening a pull request to share them upstream."

## Work History {!pre-commit}

**At the start of every conversation, and after any gap of more than one hour within a conversation:**
1. Read `WORK_HISTORY.md` to get up to date with recent changes.
2. Read `TASK_QUEUE.md` and report any pending tasks to the user before beginning other work. Say something like: "There are N pending tasks in the queue — [list them briefly]. Want to work on any of these, or something else?"

To detect a long gap within a conversation, run this on every incoming message:
```bash
LAST=/tmp/claude2max_session_check
NOW=$(date +%s)
if [ ! -f "$LAST" ] || [ $(( NOW - $(cat "$LAST") )) -gt 3600 ]; then
    echo "CHECK_NEEDED"
    echo $NOW > "$LAST"
else
    echo "OK"
fi
```
If the output is `CHECK_NEEDED`, run the session-start checks above. If `OK`, proceed normally. This resets on reboot, which is fine — a reboot implies a fresh start.

When a queued task is completed, mark it `- [x]` and move it to the Done section with a completion date.

**Task queue notation** — always use plain English markers, never checkbox symbols:
- `[pending]` — not yet started
- `[in progress]` — currently being worked on (include a brief note of where things stand)
- `[complete]` — finished (move to Done section)

When adding a task to the queue, always write a full expanded description — enough for any Claude instance to pick it up cold without this conversation's context. Include: what to build, where (file/function), why it's needed, implementation notes, prerequisites, and how it fits into the larger system. Also present the expanded description to the user in chat so they can confirm it captures the intent correctly before it's committed.

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <1-2 sentence summary>`

**If `WORK_HISTORY.md` does not exist, create it** with a minimal header before appending:

```markdown
# Work History
```

**Do not rely solely on the stop hook.** Sessions that hit the context limit are cut off without firing the hook. Instead, update `WORK_HISTORY.md` proactively — after any significant milestone within a session, not only at the very end.
