# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `- [ ]` = pending, `- [x]` = complete (move to Done section).

## Pending

- [ ] **Forum Knowledge Crawl** — Systematically crawl the Cycling '74 forums in chunks, extracting Max principles, techniques, and approaches from experienced community members. Build a growing reference of non-obvious patching knowledge that supplements the official docs.

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

- [ ] **Package Objects Library** — Enumerate all installed Max packages, study their objects, and produce a reusable reference so Claude instances know when non-standard objects are worth reaching for.

  **What to build**:
  1. **Survey installed packages** — scan standard package locations (`~/Documents/Max 8/Packages`, `~/Documents/Max 9/Packages`, `/Applications/Max.app/Contents/Resources/C74/packages`) and list all packages with their included objects (from each package's `docs/refpages/` or `externals/` folder).
  2. **Study and annotate** — for each package's objects, extract digest/description, I/O counts, key attributes, and typical use cases from the refpage XML (same approach `RefpageCache` uses). Flag objects that solve problems commonly handled by longer native Max chains (e.g. a single `cv.jit.*` object vs. rolling your own computer vision).
  3. **Decide whether useful** — if the survey yields enough worthwhile objects (judgment call: is knowing about them likely to change patching decisions?), proceed to step 4. If packages are sparse or low-value, document that conclusion and stop.
  4. **Create `package_objects.json`** in the repo — structured as `{"package_name": {"object_name": {"digest": "...", "numinlets": N, "numoutlets": N, "use_when": "...", "tags": [...]}}}`. Include a `use_when` field (brief plain-English note on when to prefer this object over native Max alternatives).
  5. **Update `CLAUDE.md` or `SPEC_REFERENCE.md`** with a short section on consulting the library before reaching for long native chains.

  **Prerequisites**: Max installed at a standard path; packages already installed by the user.

  **Implementation notes**: reuse `RefpageCache._find_xml()` logic to locate refpages. The `use_when` field is the high-value output — written by Claude after reading the digest, not auto-generated. Skip objects that are pure alternatives with no advantage over built-ins.

- [ ] **Review youthful-austin branch** — open all files on the `claude/youthful-austin` worktree, compare each to `main`, and decide what is still useful/relevant to merge. Files to review: `CLAUDE.md`, `SPEC_REFERENCE.md`, `.claude/settings.json`, `spec2maxpat.py`, `patches/drift-sequencer.json`, `patches/drift-sequencer.maxpat`, `patches/face-capture.json`, `patches/face-capture.maxpat`, `TASK_QUEUE.md`, `TUTORIAL_GUIDELINES.md`, `WORK_HISTORY.md`, `add_tutorial.py`, `hooks/sync_maxpat.py`, `hooks/sync_pasted_maxpat.py`, and tutorial `.js` files. Merge what's good, discard or defer the rest, then clean up the worktree.

- [x] **Extended `RefpageCache` metadata** — extend `RefpageCache` in `spec2maxpat.py` to cache the following from each maxref.xml, in addition to I/O counts. All data is already in the XML; this task is purely parsing and structuring it. Each field is cached per object on first lookup, so no performance cost unless the data is requested.

  - **Attributes** — from `<attributelist><attribute>`. Cache: name, type (int/float/symbol/list), size, default value, enum values if present, get/set permissions. Enables programmatic verification before using any attribute — no more manual grep. The `align` / `justify` / `anchor_x` errors from this session would have been caught automatically.

  - **Messages** — from `<methodlist><method>`. Cache: message name, argument names and types, which inlet they apply to (from `<attribute name="inlet">`). Enables validation that message boxes send messages an object actually accepts, and with correct argument types.

  - **Arguments** — from `<objarglist><objarg>`. Cache: name, type, optional flag, units. Enables validation of object text in specs — e.g. confirming that `metro 500` is valid (one optional number argument) vs. `metro foo` (wrong type).

  - **Output descriptions** — from `<misc name="Output"><entry>`. Cache: outlet name/type as described in prose. Supplements the outlet type from `<outletlist>` with richer semantic info — e.g. "bang sent when file load completes" for `buffer~` outlet 1.

  - **See-also** — from `<seealsolist><seealso>`. Cache: list of related object names. Useful for suggesting alternatives when a requested object isn't found or when a better fit exists.

  **Implementation note**: `_parse()` in `RefpageCache` already reads the full XML root. Extend it to extract all five fields in the same pass — one XML parse covers everything. Return structure: `{"numinlets": ..., "numoutlets": ..., "outlettype": [...], "attributes": {...}, "messages": {...}, "arguments": [...], "outputs": [...], "seealso": [...]}`.

- [ ] **Layout engine Phase 3 — screenshot verification** (Phases 1 & 2 complete 2026-04-26) — three-phase approach covering both views, each with its own emphasis:

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

- [x] **Permutation Summary Generator** — add a `perm-summary.js` v8 object to `ensemble-sequencer-v4.maxpat` that analyzes the full permutation list and outputs a plain-English text summary highlighting statistically unusual patterns. Display in a `textedit` box in the patch.

  **Inputs**: receives the complete permutation list from the brain on demand (bang triggers summary output). Data format to match whatever ensemble-v4.js already produces for the permutation list.

  **Analysis dimensions** — generate a sentence only when a pattern is actually present; suppress boilerplate for normal distributions. Rank observations by how surprising they are and surface only the most notable (target 3–6 sentences total):

  - **Role frequency per performer** — count music vs dance appearances across all permutations; compute the norm (median); flag anyone significantly above or below (e.g. "Jaco only dances once")
  - **Co-occurrence** — for every pair, count shared permutations; flag pairs that never or rarely appear together (e.g. "John never plays music with Maya") and pairs that always appear together
  - **Solos** — flag permutations where the music or dance group has only one member; note which performers have solos and in which role (e.g. "Everyone has a music solo except Ellie")
  - **Dominance** — flag anyone who appears in every permutation in the same role
  - **Consecutive role streaks** — a performer who does the same role many times in a row across the sequence (e.g. "Maya plays music 5 times before dancing")
  - **Inverse pairs** — pairs that are always in opposite groups, never sharing a role (e.g. "John and Ellie are never both musicians")
  - **Group size variation** — whether music or dance groups are consistently larger, or one side is frequently just one or two people
  - **Role transitions** — how often each performer switches roles between consecutive permutations vs stays in the same role (high switchers vs stable performers)
  - **Sub-group recurrence** — trios or larger clusters that appear together frequently, suggesting a recurring unit (e.g. "John, Maya, and Ellie are musicians together in 6 of 12 permutations")
  - **Coverage gaps** — a performer who never gets a pairing or grouping that everyone else gets (generalizes the solo/no-solo case)

  **Implementation**: new file `perm-summary.js` in the ensemble repo. Receives permutation data via a message, stores it, outputs summary text on bang. Functions as a standard Max v8 object. No external dependencies. Brute-force analysis is fine — at 6–10 performers and 12–30 permutations, all dimensions are O(n × p²) or better and run instantly.

  **Files to read first**: `ensemble-v4.js` (permutation data structure and outlet routing), `ensemble-sequencer-v4.maxpat` (current layout, where to add the new object and textedit).

## Done

- [x] **Extended `RefpageCache` metadata** — completed 2026-04-26. Extended `_parse()` in `spec2maxpat.py` to extract digest, attributes (type/size/default/get/set/label), messages (args/inlet), object arguments, output descriptions, and see-also in a single XML parse pass. Added `describe(name)` convenience method for quick verification. Return structure now includes all seven fields alongside the original I/O counts.

- [x] **Permutation Summary Generator** — completed 2026-04-26. Created `perm-summary.js` with 10 analysis dimensions (role frequency, solos, co-occurrence, dominance, consecutive streaks, inverse pairs, group size variation, role transitions, sub-group recurrence, coverage gaps). Observations ranked by surprisingness; top 6 output as plain-English text to a `textedit` box. Added outlet 7 to `ensemble-v5.js` (`sendSummaryData()` called after generate). Integrated into `ensemble-sequencer-v5.maxpat` with textedit in presentation view (left panel, below transport controls).
