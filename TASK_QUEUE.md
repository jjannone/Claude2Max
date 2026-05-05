# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `[pending]` = not started, `[complete]` = done (move to Done section), `[in progress]` = currently being worked on.

**When starting a task**, change its marker to `[in progress]` and add a brief note of what has been done so far (e.g. `*In progress: crawled audio subforum, resuming at MIDI threads*`). This ensures that if the session is cut off, the next Claude instance knows where to pick up. Clear the `[in progress]` marker and note when the task is finished or paused.

---

## Pending — Opus

Tasks requiring deep analysis, architecture decisions, or sustained judgment. Prompt the user to run `/model claude-opus-4-7` before starting any of these.

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

  *In progress (2026-05-04 — pass-2 chunk done): **321 threads total in state** (81 from 2026-05-01e + 240 from 2026-05-04). Pass-2 covered MaxMSP pp.2-5 + Jitter pp.4-7 + RNBO pp.2-5 + Javascript pp.4-7 + Gen pp.1-4 (NEW subforum) + Misc pp.1-3 + Max For Live pp.1-2. 103 artifact-bearing threads in pass-2 yielded 212 files (167 .maxpat from MCT, 18 .zip, 24 other, plus .js / .jxs / .rnbopack). ~30 new insights written across the existing sections + a fresh "Gen / gen~" section (10 entries). 5 new [PROMOTION-CANDIDATE] flags planted on this pass; 20 [PROMOTION-CANDIDATE]s from prior passes were promoted to patching/MAX_PATCHING.md / SPEC_REFERENCE.md / patching/GEN_PATCHING.md (new) on the same date. State decisions: 147 downloaded / 168 skipped-no-artifact / 6 phase-C-scraped.*

  **Resume point**: pick the next subforum chunk per `c74-forum/FORUM_CRAWL_LOG.md`. Candidate areas now: MaxMSP pp.6+, Jitter pp.8+, RNBO pp.6+, Javascript pp.8+, Gen pp.5+, Misc pp.4+, Max For Live pp.3+. Java subforum entirely unscanned. Use `enumerate_forum_threads.py --diff` against `c74-forum/forum_crawl_state.json` to surface only NEW or UPDATED threads when revisiting a prior subforum.

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

- [in progress] **Package Objects Library — quality upgrade pass** — every extractable installed package is now in `packages/package_objects.json` (2,795 records across 68 of 79 installed packages, refpage + helpfile sources). Library validates clean. Foundational/decision-relevant objects across the major packages are at HISSTools-tier operational quality; the remaining ~1,869 templated entries (mostly utility wrappers — math/trig, panners, list utilities) consist of `<digest>. <package framing>.` and are adequate for utility wrappers but could be upgraded for substantive objects.

  **What's done**:
  - All 56 extractable refpage-XML packages curated (1,369 entries from the mass pass + 241 from bach's full pass).
  - All 10 extractable helpfile-only packages curated (533 entries).
  - 12 packages have concept sections in `packages/package_concepts.md`: bach, cage, dada, FrameLib, ears, odot, MuBu For Max, PeRColate, grainflow, Digital Orchestra Toolbox, Vsynth, RNBO Synth Building Blocks, EAMIR SDK.
  - Tooling: `packages/query_packages.py` (list / search / validate); unified schema in `packages/package_schema.py` with `normalize()` chokepoint preventing drift; `PackageObjectsCache` in `spec2maxpat.py` as final I/O fallback (2,051 resolvable objects); two-stage `_supplemental_io()` probe in the refpage extractor for packages whose refpages don't carry `<inletlist>`/`<outletlist>` (helpfile canonical instance, then abstraction `.maxpat` inlet/outlet count, both case-insensitive).

  **What's left**:
  1. **Quality upgrade for substantive templated entries** — pick objects with >5 attributes, >3 distinct messages, or known alternatives in other packages, and write fuller operational entries (HISSTools-baseline tier). Skip pure utility wrappers (math/trig). See conversation `2026-05-01` for the prioritisation heuristic.
  2. **Help-less packages (11)** — ABL Effect Modules, AudioMix, Delicious Tutorials, Gen CV Tools, JitLygia, Jitter Recipes, MC Movement Studies, PGS-1, adsr221, gen~ Plugin Export, µK Bundle. No refpages and no `.maxhelp` files. Would need a third extractor approach (inspect example abstractions / source patcher metadata) — deferred.

  **Tooling notes**: `RefpageCache._find_xml()` and the `_supplemental_io()` probe are the entry points for any new extractor. The `use_when` field is the high-value output — written by Claude after reading refpage attrs/methods, not auto-generated for substantive objects. The canonical schema and `normalize()` chokepoint live in `packages/package_schema.py`; new extractors must import and use them.

---

- [pending] **Promotion-candidate review pass** — sweep `c74-forum/forum_insights.md`, `cookbook/cookbook_insights.md`, and any other scraped resources for entries flagged `[PROMOTION-CANDIDATE]`, propose each to the user with target file (`SPEC_REFERENCE.md` / `patching/MAX_PATCHING.md` / `CLAUDE.md` / `packages/package_objects.json`), and write the confirmed ones. Per the "Rules from Corrected Errors" rule in CLAUDE.md, every promotion is user-confirmed before writing — never auto-promoted.

  **Currently queued candidates**:

  *From `cookbook/cookbook_insights.md` (2026-05-01h)*:
  1. **dB-mapped slider with `select 0` short-circuit + `gain~`** as the canonical perceptually-linear amplitude control → `patching/MAX_PATCHING.md` UI section, as the default volume-control pattern.
  2. **Cookbook poly~-ready abstraction template uses BOTH `inlet`/`outlet` AND `in N`/`out~ N`/`in~ N`** so the same patch works as a regular subpatch OR a poly~ voice → cite `subpatch-suitable-use-poly` (`FMsynth~.maxpat`) as the canonical reference example in CLAUDE.md's existing "Subpatcher, abstraction, and poly~ inlet/outlet labeling" rule. Confirms the rule is standard Max practice, not a Claude2Max stylistic preference.

  *From `cookbook/cookbook_insights.md` Video/Jitter (2026-05-01k)*:
  3. **Named `jit.matrix NAME` boxes share memory** — the matrix analog of `send`/`receive` (messages) and `pv`/`v` (variables). Matches the existing CLAUDE.md ALL-CAPS naming rule (covers buffer~ and coll names too). Propose: extend the CLAUDE.md "Naming Convention" section's coverage list to explicitly mention `jit.matrix NAME` and reaffirm that named matrices ARE shared storage by design, plus a `patching/MAX_PATCHING.md` data-storage entry pointing to `bidirectional-jitmatrix-scroll` as the canonical scrolling-buffer reference.
  4. **Cheap blur via downsample-then-upsample-with-interp** (`jit.matrix 4 char 16 12 → jit.window @interp 1` or `jit.matrix … @interp 1`) → `patching/MAX_PATCHING.md` video-patterns section as the default soft-blur idiom over rolling a `jit.fastblur` chain or a custom shader.
  5. **`jit.matrix` as a general multi-dimensional data buffer (not video-only)** — plane = "axis", dim_x × dim_y = arbitrary 2D structure. Faster and more memory-efficient than `coll`/`zl`/JS arrays for large numeric datasets (sequencer state, particle systems, FFT bins). → `patching/MAX_PATCHING.md` data-storage section.

  *From the 2026-05-01h session (proposed in chat, awaiting confirmation)*:
  3. **"Don't `cd` Away From the Project Root"** — propose to CLAUDE.md as a new rule. Underlying concern: cwd-relative tool configs (hooks, build scripts, env-var-sensitive imports) silently break the moment cwd shifts. The Bash tool's cwd persists across calls within a session, so a single `cd subdir/` poisons every subsequent tool call until cwd is restored — including the very `cd` command needed to recover. The defensive pattern is absolute paths in every Bash command, plus the documented base-dir env var when a tool's command genuinely needs one (for instance, `$CLAUDE_PROJECT_DIR/...` for Claude Code hooks — verified via the official hooks docs at `https://code.claude.com/docs/en/hooks.md`). Tag decision (`{!pre-edit}` vs no tag): TBD — leans no-tag because it's a Bash-time concern, not edit-time.

  *From `c74-forum/forum_insights.md` (2026-05-01e — 13 candidates flagged)*:
  4. Various Jitter/MSP/JS rules. Walk the file with `grep '\[PROMOTION-CANDIDATE\]' c74-forum/forum_insights.md` to enumerate.

  **How to run a session**:
  - `grep -n '\[PROMOTION-CANDIDATE\]' c74-forum/forum_insights.md cookbook/cookbook_insights.md` — list every candidate with line numbers.
  - For each candidate: read the entry, propose the target file + exact wording in chat, get user yes/no, write only the yeses.
  - When a candidate is promoted, drop the `[PROMOTION-CANDIDATE]` flag from the source insight (it's now also in the target file). When rejected, leave the flag if there's a chance of revisiting, or remove it and add a one-line "skipped because X" note.
  - Update this section as candidates land.

---

- [pending] **Backfill `packages/package_concepts.md` for remaining packages** — partial backfill complete; the substantial-paradigm packages still need full concept sections.

  **Already covered in `packages/package_concepts.md`** (concept sections written): bach, cage, dada (bach extensions), FrameLib, ears (HISSTools-aligned pointer), odot, MuBu For Max, PeRColate, grainflow, Digital Orchestra Toolbox, Vsynth, RNBO Synth Building Blocks, EAMIR SDK.

  **Still pending — packages with substantial paradigms worth capturing**:
  - **HISSTools (HIRT)** — convolution-domain workflow (zero-padding vs circular, magnitude/phase deconvolution modes, IR file management); buffer-vs-realtime split; tail handling. The ears section already points here; should be standalone.
  - **FFTease** — pvoc paradigm, FFT framing, magnitude/phase fork in spectral processors, gain compensation across windowing schemes.
  - **zsa.descriptors** — sigmund~/yin~ analysis pipeline, descriptor categories (low-level vs perceptual), framing.
  - **Sound Design Toolkit (SDT)** — physical-modelling architecture (resonator + interaction + control), the "control object" pattern (e.g. sdt.scraping~ → sdt.friction~), parameter ranges.
  - **FluidCorpusManipulation (FluCoMa)** — corpus-based concatenative synthesis paradigm; buf/realtime split; JIT-Lib integration; dataset/labelset/kdtree workflow; fluid.transients vs fluid.harmonic vs fluid.percussive decomposition philosophy.
  - **CNMAT Externals** — beyond the existing odot section, capture: resonators~ paradigm; SDIF integration; deprecation pointers for the older OSC objects.
  - **catart-mubu** — concatenative synthesis paradigm, MuBu container abstraction (cross-reference the MuBu section), descriptor pipeline, granular vs corpus selection.
  - **cv.jit** — computer-vision pipeline conventions (greyscale matrix → analysis → annotation), info-outlet pattern (`getnfaces` → `route nfaces`), image-coordinate conventions.
  - **RTC-lib** — Karlheinz Essl's compositional algorithms: Koenig selection principles, ED rhythm objects, twelve-tone tools.

  **Likely no concepts to capture** (verify first, then document the decision):
  - **ejies** — Erbe's general-purpose utilities; mostly thin idiomatic wrappers.
  - **modulo** — utility wrappers.

  **What to write**: same shape as the bach section — one-line summary, then named subsections for each foundational concept, ending with a "common gotchas" pair where applicable. Read tutorials/intro patchers first, not just refpages.

  **Prerequisites**: package installed locally; foundational tutorials/help patchers present.

## Pending — Sonnet

Tasks that are primarily implementation, file editing, or verification — no deep architectural judgment required.

- [pending] **Plugin/skills polish pass** — follow-up clean-up after the Opus "Borrow MaxMCP's plugin/skills surfacing pattern" task ships. Six focused subtasks; do them as a single session for coherence:

  1. **Move the queue hygiene** — *handled 2026-05-03 during a queue review pass*. The `/c2m-explain` Sonnet task and the parent Borrow MaxMCP Opus task are now in the Done section. The "Test claude2max-design skill" entry was **not** marked complete; instead it was merged with "Layout Engine Phase 3" into a single Opus task ("Return to claude2max-design skill — extend design sense + Phase 3 screenshot verification on current patches") because the skill is fundamentally incomplete (no generalized design sense, no principle extraction from samples, no implementation of the principles it does articulate). See the merged task for current scope.

  2. **Wire `/c2m-explain` as a slash command in this repo** — add `.claude/skills/c2m-explain/SKILL.md` (modeled on the other four), pointing at `c2m-explain/c2m_explain.py` at the repo root. Without this shim, `/c2m-explain` is not auto-discoverable as a slash command — only the CLI form (`python3 c2m-explain/c2m_explain.py …`) works. Alternative if intentional: leave the shim out and document explicitly in CLAUDE.md that `/c2m-explain` is CLI-only, not a slash command. Pick one and document.

  3. **Trim each new SKILL.md to ~40-60 lines** — current files at `.claude/skills/c2m-{design,package-search,tutorial,sync}/SKILL.md` duplicate large chunks of CLAUDE.md prose (sync-first rule, package consultation rule, presentation rules). Replace duplicated rule content with `CLAUDE.md § X` pointers so the skill body is a thin invocation guide + CLI sequence + see-also links. Single source of truth stays in CLAUDE.md; skills don't drift. Target shape: front-matter + 1-paragraph summary + numbered step list with shell commands + "see also" section. Avoid restating rules already in CLAUDE.md.

  4. **Distinguish in-repo skills from upstream-publishable manifests** — `c2m-themes/UPSTREAM-SKILL.md` and `c2m-explain/UPSTREAM-SKILL.md` are upstream-snapshot manifests intended to be copied to a separate `Claude2Max-design` repo (per `c2m-themes/README.md`). `.claude/skills/<name>/SKILL.md` are the in-repo Claude Code slash commands. A cloner reading the repo cold cannot tell these apart. Add a one-paragraph note distinguishing the two patterns — either in the new `## Plugin / Slash Commands` section of CLAUDE.md, or as a top-level `c2m-explain/README.md` matching the `c2m-themes/README.md` pattern.

  5. **(optional) Add `/c2m-refpage <object>` skill** — backed by a new `spec2maxpat.py refpage <object>` subcommand that calls `REFPAGE_CACHE.describe(name)` and prints the full canonical attribute/message/argument list. Reduces silent-failure risk of inventing Max attribute names — the single most-cited failure mode in `WORK_HISTORY.md` (live.gain~ color attrs, ezdac~ attrs, attribute-enable toggles, info outlets). Skill description should fire on phrases like "what attributes does <object> have", "show me the refpage for <object>". Makes verification a one-command action instead of an XML round-trip.

  6. **(optional) Add `.claude/skills/README.md` index** — 10-line list of the five skills + what each does + which CLAUDE.md section each implements. Helps cloners discover the set without reading CLAUDE.md first. Strictly a discovery aid; the SKILL.md files remain the authoritative per-skill docs.

  **Source**: 2026-05-01 review during the Opus plugin/skills task. The polish items were identified after building all four skills and observing that `/c2m-explain` was only half-wired and that skill bodies duplicated CLAUDE.md content.

  **Why split from the parent task**: keeping the parent task focused on "build the four skills + add a CLAUDE.md section" lets it finish cleanly; the polish work has a different shape (mechanical edits + queue hygiene) and benefits from a fresh session that can read the freshly-written skills with cold eyes.

---

## Done

- [complete] **Borrow MaxMCP's Claude Code plugin/skills surfacing pattern** — completed 2026-05-01. Built four skills in `.claude/skills/`: `/c2m-design`, `/c2m-package-search`, `/c2m-tutorial`, `/c2m-sync`. Added `## Plugin / Slash Commands` section to `CLAUDE.md` listing all five skills (including `/c2m-explain`). Compressed `CLAUDE.md` from 609 → 354 lines by moving reference content to `SPEC_REFERENCE.md` (v8/JS, converter handles, modifying external patches, MCT algorithm) and `packages/CURATION.md` (new file). Polish-pass follow-ups (skill trimming, /c2m-explain shim, upstream-vs-in-repo distinction) tracked separately in the Sonnet polish-pass entry.

- [complete] **Cross-link `/c2m-explain` from CLAUDE.md** — completed 2026-05-01. Listed in the `## Plugin / Slash Commands` table in `CLAUDE.md` alongside the four other c2m skills. Slash-command shim at `.claude/skills/c2m-explain/SKILL.md` was added in the same session as the parent task; the polish-pass entry's subtask 2 about that shim is therefore also satisfied.

- [complete] **Add `/c2m-explain` — first-class "explain this patch" skill** — completed 2026-05-01. Built `c2m-explain/c2m_explain.py` (read-only walkthrough generator) with two output modes: walkthrough (default) and `--summary`. Skill manifest at `.claude/skills/c2m-explain/SKILL.md` (Claude Code's auto-discovery scans `.claude/skills/`), parallel to the four sibling c2m skills; upstream-distribution copy at `c2m-explain/UPSTREAM-SKILL.md`. Bidirectional integration with `add_tutorial.py`: shared `describe_object` cascade (curated `OBJ_DESCRIPTIONS` → C74 refpage with `REFPAGE_ALIAS` for symbolic operators → installed-package digest) lives in `add_tutorial.py` and is now used by both tutorial step descriptions and the explain skill — tutorials get refpage + package digests for every object instead of just the ~50 hand-curated ones. The explain skill detects an embedded tutorial (`v8 <name>-tutorial.js` + companion JS file with `STEPS` array) and overlays the tutorial's authored step names + descriptions when cluster count matches exactly (mismatch → silently fall back to auto-generated, with a header note explaining the source). Tested on jit-grab-scale (overlay applies cleanly), drift-sequencer-soviet and drift-sequencer-lcars (tutorials drifted; correctly falls back).

- [complete] **Review youthful-austin branch** — completed 2026-04-27. No unique commits on the branch; fully behind main. Cleaned up worktree.

- [complete] **Extended `RefpageCache` metadata** — completed 2026-04-26. Extended `_parse()` in `spec2maxpat.py` to extract digest, attributes (type/size/default/get/set/label), messages (args/inlet), object arguments, output descriptions, and see-also in a single XML parse pass. Added `describe(name)` convenience method for quick verification. Return structure now includes all seven fields alongside the original I/O counts.

- [complete] **Permutation Summary Generator** — completed 2026-04-26. Created `perm-summary.js` with 10 analysis dimensions (role frequency, solos, co-occurrence, dominance, consecutive streaks, inverse pairs, group size variation, role transitions, sub-group recurrence, coverage gaps). Observations ranked by surprisingness; top 6 output as plain-English text to a `textedit` box. Added outlet 7 to `ensemble-v5.js` (`sendSummaryData()` called after generate). Integrated into `ensemble-sequencer-v5.maxpat` with textedit in presentation view (left panel, below transport controls).
