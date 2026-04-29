# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `[pending]` = not started, `[complete]` = done (move to Done section), `[in progress]` = currently being worked on.

**When starting a task**, change its marker to `[in progress]` and add a brief note of what has been done so far (e.g. `*In progress: crawled audio subforum, resuming at MIDI threads*`). This ensures that if the session is cut off, the next Claude instance knows where to pick up. Clear the `[in progress]` marker and note when the task is finished or paused.

---

## Pending — Opus

Tasks requiring deep analysis, architecture decisions, or sustained judgment. Prompt the user to run `/model claude-opus-4-7` before starting any of these.

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

- [pending] **Forum Knowledge Crawl** — Systematically crawl the Cycling '74 forums in chunks, extracting Max principles, techniques, and approaches from experienced community members. Build a growing reference of non-obvious patching knowledge that supplements the official docs.

  **Approach (chunked across sessions)**:
  - Each session picks a focused area: one subforum, one topic thread cluster, or one search query (e.g. "jit.matrix best practices", "audio synthesis techniques", "v8 patterns"). Track progress in a `FORUM_CRAWL_LOG.md` so each session knows where to resume.
  - Prioritize threads with: high reply counts, sample patches (MCT blocks), "tips & tricks" / "how do you..." framing, or posts from long-tenured members.
  - Extract: non-obvious object behaviors, preferred patterns for common tasks, performance pitfalls, community-preferred alternatives to naive Max approaches, and any sample patches worth studying.

  **Output**:
  - `forum_insights.md` — running notes, organized by topic (audio, video/Jitter, JS/v8, MIDI, UI, performance). Each entry: the insight, source thread title, and why it matters.
  - Where an insight is specific to an object, also add it to the relevant section of `SPEC_REFERENCE.md`.
  - If enough package-object insights accumulate, fold them into `package_objects.json` (see Package Objects Library task).

  **What to skip**: basic "how do I" posts with obvious answers, unanswered threads, posts that just link to docs.

  **Forum starting point**: `https://cycling74.com/forums`

  **Session format**: start each chunk by reading `FORUM_CRAWL_LOG.md` to see what's been covered, do one focused crawl pass, append new entries to `forum_insights.md`, update the log with what was covered and what to do next.

- [pending] **Package Objects Library** — Enumerate all installed Max packages, study their objects, and produce a reusable reference so Claude instances know when non-standard objects are worth reaching for.

  **What to build**:
  1. **Survey installed packages** — scan standard package locations (`~/Documents/Max 8/Packages`, `~/Documents/Max 9/Packages`, `/Applications/Max.app/Contents/Resources/C74/packages`) and list all packages with their included objects (from each package's `docs/refpages/` or `externals/` folder).
  2. **Study and annotate** — for each package's objects, extract digest/description, I/O counts, key attributes, and typical use cases from the refpage XML (same approach `RefpageCache` uses). Flag objects that solve problems commonly handled by longer native Max chains (e.g. a single `cv.jit.*` object vs. rolling your own computer vision).
  3. **Decide whether useful** — if the survey yields enough worthwhile objects (judgment call: is knowing about them likely to change patching decisions?), proceed to step 4. If packages are sparse or low-value, document that conclusion and stop.
  4. **Create `package_objects.json`** in the repo — structured as `{"package_name": {"object_name": {"digest": "...", "numinlets": N, "numoutlets": N, "use_when": "...", "tags": [...]}}}`. Include a `use_when` field (brief plain-English note on when to prefer this object over native Max alternatives).
  5. **Update `CLAUDE.md` or `SPEC_REFERENCE.md`** with a short section on consulting the library before reaching for long native chains.

  **Prerequisites**: Max installed at a standard path; packages already installed by the user.

  **Implementation notes**: reuse `RefpageCache._find_xml()` logic to locate refpages. The `use_when` field is the high-value output — written by Claude after reading the digest, not auto-generated. Skip objects that are pure alternatives with no advantage over built-ins.

---

## Pending — Sonnet

Tasks that are primarily implementation, file editing, or verification — no deep architectural judgment required.

- [in progress] **Layout engine Phase 3 — screenshot verification** (Phases 1 & 2 complete 2026-04-26) — three-phase approach covering both views, each with its own emphasis:

  *In progress (2026-04-27): drift-sequencer reviewed and fixed (presentation layout, monospace font, ignoreclick on note display, content-driven multislider width). face-capture not yet reviewed — resume there.*

  **Phase 1 — Layout engine (presentation view)**: add a `presentation_layout()` function to `spec2maxpat.py` that computes `presentation_rect` for every presented object automatically from the spec, replacing manual post-processing. The engine should:
  - Accept logical layout hints in the spec: column/row grouping, margins, object sizes
  - Compute x/y positions using consistent margins (15px outer, 10–15px between groups) and the label-width estimation rules already in CLAUDE.md
  - Handle common patterns such as the two-panel layout (setup left, performance right)
  - Output `presentation_rect` values directly into the generated .maxpat JSON

  **Phase 2 — Layout engine (patching view)**: apply layout logic to the patching view as well, with different goals. Patching view emphasis is on:
  - **Structural logic** — data flow reads top-to-bottom, left-to-right; signal path is visually distinct from control path
  - **Readability** — related objects grouped spatially; consistent spacing; no crossing patchcords where avoidable
  - **Functional units** — logically related clusters of objects are visually grouped and clearly separated from other clusters
  - **Encapsulation** — where a functional unit is self-contained, consider wrapping it in a subpatcher (`p`) to reduce clutter and reinforce the logical boundary. The spec already supports subpatchers; the layout engine should identify candidates and apply encapsulation where it improves clarity. See inlet/outlet labeling rule below.

  **Inlet/outlet labeling rule** (applies to all subpatchers, abstractions, and poly~ abstractions — not just those created by the layout engine):
  1. **Outside**: set `@comment` on the `p`/`poly~` object itself (via `attrs: {"comment": "..."}` in the spec) describing all inlets and outlets — index, type, purpose. E.g. `"in 0: bang — trigger generate  |  out 0: list — permutation"`.
  2. **Inside**: place an actual `comment` box immediately adjacent to each `inlet` and `outlet` object. E.g. `"← bang: trigger generate"` next to the inlet, `"→ list: permutation result"` next to the outlet.
  Never create an encapsulated unit without both levels of labeling. Applies at creation time.

  **Phase 3 — Screenshot verification**: after conversion, use computer-use MCP to:
  - Screenshot patching view — review for structural clarity, readable data flow, well-grouped functional units, encapsulation opportunities missed by the engine
  - Screenshot presentation view (Cmd-Shift-E) — review for overlapping objects, clipped text, misaligned labels, crowded groups
  - Fix issues found and re-screenshot to confirm
  - Requires computer-use MCP enabled in Claude Desktop; if unavailable, note what to check manually

  **Prerequisite**: computer-use MCP must be enabled and screen recording granted to Claude. Phases 1 and 2 (layout engines) work without it; Phase 3 (screenshots) requires it.

---

## Done

- [complete] **Review youthful-austin branch** — completed 2026-04-27. No unique commits on the branch; fully behind main. Cleaned up worktree.

- [complete] **Extended `RefpageCache` metadata** — completed 2026-04-26. Extended `_parse()` in `spec2maxpat.py` to extract digest, attributes (type/size/default/get/set/label), messages (args/inlet), object arguments, output descriptions, and see-also in a single XML parse pass. Added `describe(name)` convenience method for quick verification. Return structure now includes all seven fields alongside the original I/O counts.

- [complete] **Permutation Summary Generator** — completed 2026-04-26. Created `perm-summary.js` with 10 analysis dimensions (role frequency, solos, co-occurrence, dominance, consecutive streaks, inverse pairs, group size variation, role transitions, sub-group recurrence, coverage gaps). Observations ranked by surprisingness; top 6 output as plain-English text to a `textedit` box. Added outlet 7 to `ensemble-v5.js` (`sendSummaryData()` called after generate). Integrated into `ensemble-sequencer-v5.maxpat` with textedit in presentation view (left panel, below transport controls).
