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

- [in progress] **Max Userguide Topics Crawl — extract principles into `patching/` companions** — Systematically read the Max userguide topic files at `/Applications/Max.app/Contents/Resources/C74/docs/userguide/content/` (82 top-level `.json` files + subdirs `gen/`, `jitter/`, `m4l/`, `mc/`, `lua/`) and extract underlying principles into the existing `patching/*.md` knowledge files plus two new companions.

  *In progress (2026-05-07 — session 1): infrastructure built — `userguide/USERGUIDE_CRAWL_LOG.md`, `userguide/userguide_crawl_state.json` (147 topics enumerated; 7 extracted, 20 skipped UI/refpage-overlap, 120 pending), `userguide/userguide_insights.md` (26 entries from the foundational MAX_PATCHING.md cluster — patcher_lifecycle, patching_mechanics, scheduler, polyphony, abstractions, subpatchers, bpatchers; 9 flagged `[PROMOTION-CANDIDATE]`). Both new patching companions created as scoped stubs: `patching/JITTER_PATCHING.md` (16 jitter/ + 5 lua/ topics queued) and `patching/MC_PATCHING.md` (28 mc/ topics queued). CLAUDE.md updated with three new index entries (Key Files: JITTER_PATCHING, MC_PATCHING; Knowledge Resources: userguide_insights.md). Resume point: pick next cluster per `userguide/USERGUIDE_CRAWL_LOG.md` § Sessions § Resume point — strong candidates are "Data and state" (pattr, parameter_mode, presets, snapshots, dictionaries, prototypes), "Audio infrastructure" (audio_channels, frequency_domain, sample_accurate_messages, transport, non_realtime), or starting JITTER_PATCHING.md / MC_PATCHING.md fill.* **Refpages are deliberately out of scope** — they are already addressable on demand via `RefpageCache` and the `refpages/` tree. The userguide *topics* are the non-reference, principle-bearing material that explains *how Max works* (scheduler, threading, polyphony, message vs signal, patcher lifecycle, abstractions, parameter mode, dictionaries, etc.) — exactly the kind of cross-cutting knowledge that doesn't fit in a refpage.

  **Why this matters**: principles in the userguide are the "rules of the system" — they apply across many objects and shape correct patching at the level above per-object reference. They're also stable enough to be worth distilling once and stored, unlike refpages which are better looked up live. Without this pass, Claude is forced to either re-derive principles from scattered refpages (slow, error-prone) or proceed without them (silent gaps).

  **Approach (chunked across sessions, mirrors the forum/cookbook pattern)**:

  1. **New folder `userguide/`** alongside `c74-forum/` and `cookbook/`:
     - `USERGUIDE_CRAWL_LOG.md` — session recipe, progress, resume point
     - `userguide_crawl_state.json` — per-topic status (`pending` / `read` / `extracted` / `skipped`), with the topic title and target patching/*.md file
     - `userguide_insights.md` — extracted principles, topic-organized to mirror `forum_insights.md` / `cookbook_insights.md`

  2. **Two new patching companions to create** (confirmed with user 2026-05-07):
     - `patching/JITTER_PATCHING.md` — for the jitter topic cluster (matrix, textures, video, video_engine, graphics_engine, graphics_processing, geometry, render_passes, depth_layer_blend, jxs_file_format, jitter_expr). Parallel to the existing gen/jit-gen/m4l split.
     - `patching/MC_PATCHING.md` — for the mc/ cluster (channel topology, dynamic routing, function generators, gen integration, event wrappers).

  3. **Cluster topics by destination file** before starting:
     - `patching/MAX_PATCHING.md` — patcher_lifecycle, patching_mechanics, scheduler, polyphony, abstractions, subpatchers, bpatchers, message_types, messages, dictionaries, mapping, parameter_mode, pattr, presets_and_interpolation, snapshots, styles, prototypes, projects, snippets, scripting_overview, javascript, OSC, midi, audio_channels, frequency_domain, sample_accurate_messages, transport, time_value_syntax, debugging_and_probing, error_messages, etc.
     - `patching/GEN_PATCHING.md` — `gen/_gen_overview.json`, `gen/gen_common_operators.json`, `gen/gen_genexpr.json`, `gen/gen~_operators.json`
     - `patching/JIT_GEN_PATCHING.md` — `gen/gen_jitter_operators.json` + relevant jitter topics
     - `patching/M4L_PATCHING.md` — every file under `m4l/`
     - `patching/JITTER_PATCHING.md` (new) — jitter cluster as listed above
     - `patching/MC_PATCHING.md` (new) — mc cluster as listed above

  4. **Per-session shape** (chunk size: ~5-8 topics): pick a coherent cluster, read each JSON in full, distill principles into `userguide_insights.md` first under topic-organized headings (Audio/MSP, Jitter, Patching Patterns, Scheduler/Threading, M4L, etc.), then mark insights `[PROMOTION-CANDIDATE]` where they belong in a `patching/*.md` companion. Userguide content is C74 official, so the candidate bar is *lower* than for forum/cookbook crawls — official material is generally trustworthy — but still surface candidates for user review per the "Rules from Corrected Errors" pattern.

  5. **Promotion pass** at the end of each chunk — propose `[PROMOTION-CANDIDATE]` entries to user with target file and exact wording, write only the yeses.

  6. **Update `CLAUDE.md` Knowledge Resources** to add `userguide/userguide_insights.md` once the first chunk lands, and add the two new `patching/*.md` files (Jitter, MC) when they're created.

  **Skip rules**:
  - Topics whose content is purely UI/menu walkthrough (`action_menu`, `extras_menu`, `format_palette`, `inspector`, `documentation_window`, `web_browser`, `file_browser`, `sidebar_search`, `repl`, `external_text_editor`, `error_messages` — though `error_messages` may be worth a brief skim for diagnostic principles) — note in state, mark `skipped`.
  - Topics that overlap heavily with refpages (`object_reference`, `objects`) — skip; refpages are authoritative.
  - Topics already covered by an existing companion (gen overview if `GEN_PATCHING.md` already covers it) — read for completeness but only extract *additional* principles.

  **Prerequisites**:
  - `userguide/` folder doesn't exist; create at session start
  - Forum / cookbook crawl pattern is the template — copy that shape (`enumerate_*.py` is *not* needed here since the file list is local and finite — direct iteration over the directory is fine)
  - Per the model-selection rule in CLAUDE.md, the *analysis* of dense documentation can warrant Opus on a per-cluster basis (especially `scheduler.json`, `polyphony.json`, m4l/`live_api*.json`). At session start, eyeball the cluster and prompt the user to switch to Opus if the topics look dense; otherwise proceed on Sonnet.

  **First-session target**: enumerate all topics into `userguide_crawl_state.json`, classify each by destination file, and tackle the first cluster — the foundational MAX_PATCHING.md cluster (patcher_lifecycle, patching_mechanics, scheduler, polyphony, abstractions, subpatchers, bpatchers — ~7 topics).

  **Fits into the larger system**: fourth knowledge source alongside forum (Q&A), cookbook (curated educational), and projects (community gallery). Userguide is the *first-party* layer those three orbit around — the principles the community is implicitly drawing on. Capturing it explicitly closes the loop: principles flow into `patching/*.md`, examples flow in from cookbook/forum/projects, and refpages stay live-looked-up.

  **Source**: 2026-05-07 conversation. User confirmed (a) creating both new patching companions (`JITTER_PATCHING.md`, `MC_PATCHING.md`), and (b) the foundational MAX_PATCHING.md cluster as first session target.

- [pending] **Plugin/skills polish pass** — follow-up clean-up after the Opus "Borrow MaxMCP's plugin/skills surfacing pattern" task ships. Six focused subtasks; do them as a single session for coherence:

  1. **Move the queue hygiene** — *handled 2026-05-03 during a queue review pass*. The `/c2m-explain` Sonnet task and the parent Borrow MaxMCP Opus task are now in the Done section. The "Test claude2max-design skill" entry was **not** marked complete; instead it was merged with "Layout Engine Phase 3" into a single Opus task ("Return to claude2max-design skill — extend design sense + Phase 3 screenshot verification on current patches") because the skill is fundamentally incomplete (no generalized design sense, no principle extraction from samples, no implementation of the principles it does articulate). See the merged task for current scope.

  2. **Wire `/c2m-explain` as a slash command in this repo** — add `.claude/skills/c2m-explain/SKILL.md` (modeled on the other four), pointing at `c2m-explain/c2m_explain.py` at the repo root. Without this shim, `/c2m-explain` is not auto-discoverable as a slash command — only the CLI form (`python3 c2m-explain/c2m_explain.py …`) works. Alternative if intentional: leave the shim out and document explicitly in CLAUDE.md that `/c2m-explain` is CLI-only, not a slash command. Pick one and document.

  3. **Trim each new SKILL.md to ~40-60 lines** — current files at `.claude/skills/c2m-{design,package-search,tutorial,sync}/SKILL.md` duplicate large chunks of CLAUDE.md prose (sync-first rule, package consultation rule, presentation rules). Replace duplicated rule content with `CLAUDE.md § X` pointers so the skill body is a thin invocation guide + CLI sequence + see-also links. Single source of truth stays in CLAUDE.md; skills don't drift. Target shape: front-matter + 1-paragraph summary + numbered step list with shell commands + "see also" section. Avoid restating rules already in CLAUDE.md.

  4. **Distinguish in-repo skills from upstream-publishable manifests** — `c2m-themes/UPSTREAM-SKILL.md` and `c2m-explain/UPSTREAM-SKILL.md` are upstream-snapshot manifests intended to be copied to a separate `Claude2Max-design` repo (per `c2m-themes/README.md`). `.claude/skills/<name>/SKILL.md` are the in-repo Claude Code slash commands. A cloner reading the repo cold cannot tell these apart. Add a one-paragraph note distinguishing the two patterns — either in the new `## Plugin / Slash Commands` section of CLAUDE.md, or as a top-level `c2m-explain/README.md` matching the `c2m-themes/README.md` pattern.

  5. **(optional) Add `/c2m-refpage <object>` skill** — backed by a new `spec2maxpat.py refpage <object>` subcommand that calls `REFPAGE_CACHE.describe(name)` and prints the full canonical attribute/message/argument list. Reduces silent-failure risk of inventing Max attribute names — the single most-cited failure mode in `WORK_HISTORY.md` (live.gain~ color attrs, ezdac~ attrs, attribute-enable toggles, info outlets). Skill description should fire on phrases like "what attributes does <object> have", "show me the refpage for <object>". Makes verification a one-command action instead of an XML round-trip.

  6. **(optional) Add `.claude/skills/README.md` index** — 10-line list of the five skills + what each does + which CLAUDE.md section each implements. Helps cloners discover the set without reading CLAUDE.md first. Strictly a discovery aid; the SKILL.md files remain the authoritative per-skill docs.

  **Source**: 2026-05-01 review during the Opus plugin/skills task. The polish items were identified after building all four skills and observing that `/c2m-explain` was only half-wired and that skill bodies duplicated CLAUDE.md content.

  **Why split from the parent task**: keeping the parent task focused on "build the four skills + add a CLAUDE.md section" lets it finish cleanly; the polish work has a different shape (mechanical edits + queue hygiene) and benefits from a fresh session that can read the freshly-written skills with cold eyes.

- [pending] **`spec2maxpat.py` — sync silently drops live layout, convert silently ignores `presentation_rect`** — Two related bugs in `spec2maxpat.py` cause `extract → edit → convert` and `sync` workflows to silently lose every manual layout change a user has made in Max. Together they make claude2max's "Modify, Don't Rebuild" rule (CLAUDE.md) impossible to honor in practice — observed 2026-05-05 when generating ensemble-sequencer-v6 from a manually-edited v5: the embedded spec said `jit_cellblock = [15, 54, 350, 165]` and `jit_permlist = [385, 65, 320, 170]`, but the live boxes in the .maxpat had `[15, 54, 223, 165]` and `[258, 57, 432, 655]`. Working around it required reading `presentation_rect` directly from each live box and translating to the spec's `presentation` field.

  **Bug 1 — `reconcile_spec` does not fold live box rects back into the embedded spec.** `sync_spec()` calls `reconcile_spec(existing_spec, maxpat)` when an embedded spec is present, but `reconcile_spec` returns the existing spec largely unchanged with respect to per-box `presentation_rect` / `patching_rect` / `size` / `pos`. A user's manual moves and resizes in Max never make it back into the embedded spec, so the next `extract → convert` regenerates the patch with the *original* spec coordinates and silently destroys the manual layout. Reproduce: open any patch, move a box in presentation view, save, run `python3 spec2maxpat.py sync -i <patch>`, then `extract -o` — the extracted spec still has the old coordinates.

  **Bug 2 — `build_box` ignores `obj["presentation_rect"]` and reads only `obj["presentation"]`.** In `convert_patcher` → `build_box` (around line 873–881), the function checks `obj_spec.get("presentation")`: if the value is a list of length 4, it becomes the box's `presentation_rect`; if it's `True` or any non-list truthy value, only `presentation: 1` is set with no rect. There is no code path that reads a separate `presentation_rect` field from the spec object. But `extract_spec` emits *both* `presentation: True` *and* `presentation_rect: [x, y, w, h]` as sibling fields — so the round-trip `extract → convert` silently drops every rect unless the editor knows to merge them into `presentation`. This is also why someone editing the spec by hand and writing `"presentation_rect": [...]` (the obvious name) gets no error and no effect.

  **Fix — three coordinated changes:**

  1. In `reconcile_spec`: for every box in the live `.maxpat` that has a corresponding entry in `existing_spec.objects` (match by box `id`, or by `varname`, or by patching top-left if neither is available), copy its live `presentation_rect`, `patching_rect.x/y` (→ `pos`), and `patching_rect.w/h` (→ `size`) back into the spec object. Preserve the spec's `presentation` field as the 4-element list form so it survives a subsequent convert.

  2. In `build_box`: also accept `obj_spec.get("presentation_rect")` as an alternative to `obj_spec.get("presentation")`. When both are present, `presentation_rect` wins (it's more specific). This makes the `extract → edit → convert` round-trip lossless without requiring users to translate field names.

  3. In `extract_spec`: emit a single canonical form — `presentation: [x, y, w, h]` — instead of the current pair of `presentation: True` + `presentation_rect: [...]`. This eliminates the asymmetry at the source. Keep backward-compat reading of the pair form in convert.

  **Test:** add a regression test that opens a fixture .maxpat with a manually-resized presented box, runs sync, runs extract, runs convert, and asserts the live `presentation_rect` of the resized box is preserved end-to-end. The ensemble-sequencer-v5 → v6 case is a good real-world fixture (perm list resized to `[258, 57, 432, 655]`).

  **Why this matters:** every "Modify, Don't Rebuild" task in this repo depends on sync being lossless. A silent loss is worse than a noisy one — the regenerated patch *opens fine* in Max, just with all the user's manual layout work erased. The user only notices when the layout looks wrong, by which point the manual work is gone unless they had a backup.

---

## Done

- [complete] **Borrow MaxMCP's Claude Code plugin/skills surfacing pattern** — completed 2026-05-01. Built four skills in `.claude/skills/`: `/c2m-design`, `/c2m-package-search`, `/c2m-tutorial`, `/c2m-sync`. Added `## Plugin / Slash Commands` section to `CLAUDE.md` listing all five skills (including `/c2m-explain`). Compressed `CLAUDE.md` from 609 → 354 lines by moving reference content to `SPEC_REFERENCE.md` (v8/JS, converter handles, modifying external patches, MCT algorithm) and `packages/CURATION.md` (new file). Polish-pass follow-ups (skill trimming, /c2m-explain shim, upstream-vs-in-repo distinction) tracked separately in the Sonnet polish-pass entry.

- [complete] **Cross-link `/c2m-explain` from CLAUDE.md** — completed 2026-05-01. Listed in the `## Plugin / Slash Commands` table in `CLAUDE.md` alongside the four other c2m skills. Slash-command shim at `.claude/skills/c2m-explain/SKILL.md` was added in the same session as the parent task; the polish-pass entry's subtask 2 about that shim is therefore also satisfied.

- [complete] **Add `/c2m-explain` — first-class "explain this patch" skill** — completed 2026-05-01. Built `c2m-explain/c2m_explain.py` (read-only walkthrough generator) with two output modes: walkthrough (default) and `--summary`. Skill manifest at `.claude/skills/c2m-explain/SKILL.md` (Claude Code's auto-discovery scans `.claude/skills/`), parallel to the four sibling c2m skills; upstream-distribution copy at `c2m-explain/UPSTREAM-SKILL.md`. Bidirectional integration with `add_tutorial.py`: shared `describe_object` cascade (curated `OBJ_DESCRIPTIONS` → C74 refpage with `REFPAGE_ALIAS` for symbolic operators → installed-package digest) lives in `add_tutorial.py` and is now used by both tutorial step descriptions and the explain skill — tutorials get refpage + package digests for every object instead of just the ~50 hand-curated ones. The explain skill detects an embedded tutorial (`v8 <name>-tutorial.js` + companion JS file with `STEPS` array) and overlays the tutorial's authored step names + descriptions when cluster count matches exactly (mismatch → silently fall back to auto-generated, with a header note explaining the source). Tested on jit-grab-scale (overlay applies cleanly), drift-sequencer-soviet and drift-sequencer-lcars (tutorials drifted; correctly falls back).

- [complete] **Review youthful-austin branch** — completed 2026-04-27. No unique commits on the branch; fully behind main. Cleaned up worktree.

- [complete] **Extended `RefpageCache` metadata** — completed 2026-04-26. Extended `_parse()` in `spec2maxpat.py` to extract digest, attributes (type/size/default/get/set/label), messages (args/inlet), object arguments, output descriptions, and see-also in a single XML parse pass. Added `describe(name)` convenience method for quick verification. Return structure now includes all seven fields alongside the original I/O counts.

- [complete] **Permutation Summary Generator** — completed 2026-04-26. Created `perm-summary.js` with 10 analysis dimensions (role frequency, solos, co-occurrence, dominance, consecutive streaks, inverse pairs, group size variation, role transitions, sub-group recurrence, coverage gaps). Observations ranked by surprisingness; top 6 output as plain-English text to a `textedit` box. Added outlet 7 to `ensemble-v5.js` (`sendSummaryData()` called after generate). Integrated into `ensemble-sequencer-v5.maxpat` with textedit in presentation view (left panel, below transport controls).
