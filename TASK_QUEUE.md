# Task Queue

Pending tasks for future sessions. Claude reads this at session start and
reports any incomplete items to the user before beginning other work.

Format: `- [ ]` = pending, `- [x]` = complete (move to Done section).

## Pending

- [ ] **Extended `RefpageCache` metadata** — extend `RefpageCache` in `spec2maxpat.py` to cache the following from each maxref.xml, in addition to I/O counts. All data is already in the XML; this task is purely parsing and structuring it. Each field is cached per object on first lookup, so no performance cost unless the data is requested.

  - **Attributes** — from `<attributelist><attribute>`. Cache: name, type (int/float/symbol/list), size, default value, enum values if present, get/set permissions. Enables programmatic verification before using any attribute — no more manual grep. The `align` / `justify` / `anchor_x` errors from this session would have been caught automatically.

  - **Messages** — from `<methodlist><method>`. Cache: message name, argument names and types, which inlet they apply to (from `<attribute name="inlet">`). Enables validation that message boxes send messages an object actually accepts, and with correct argument types.

  - **Arguments** — from `<objarglist><objarg>`. Cache: name, type, optional flag, units. Enables validation of object text in specs — e.g. confirming that `metro 500` is valid (one optional number argument) vs. `metro foo` (wrong type).

  - **Output descriptions** — from `<misc name="Output"><entry>`. Cache: outlet name/type as described in prose. Supplements the outlet type from `<outletlist>` with richer semantic info — e.g. "bang sent when file load completes" for `buffer~` outlet 1.

  - **See-also** — from `<seealsolist><seealso>`. Cache: list of related object names. Useful for suggesting alternatives when a requested object isn't found or when a better fit exists.

  **Implementation note**: `_parse()` in `RefpageCache` already reads the full XML root. Extend it to extract all five fields in the same pass — one XML parse covers everything. Return structure: `{"numinlets": ..., "numoutlets": ..., "outlettype": [...], "attributes": {...}, "messages": {...}, "arguments": [...], "outputs": [...], "seealso": [...]}`.

- [ ] **Presentation layout engine + screenshot verification** — two-phase approach:

  **Phase 1 — Layout engine**: add a `presentation_layout()` function to `spec2maxpat.py` that computes `presentation_rect` for every presented object automatically from the spec, so manual rect calculation is no longer needed. The engine should:
  - Accept logical layout hints in the spec: column/row grouping, margins, object sizes
  - Compute x/y positions using consistent margins (15px outer, 10–15px between groups) and the label-width estimation rules already in CLAUDE.md
  - Handle the two-panel pattern common in ensemble-style patches (setup panel left, performance panel right)
  - Output `presentation_rect` values directly into the generated .maxpat JSON, replacing the current manual post-processing step

  **Phase 2 — Screenshot verification**: after conversion, use computer-use MCP to:
  - Take a screenshot of the patch in patching view
  - Switch to presentation mode (Cmd-Shift-E or View menu), take a screenshot
  - Review both for: overlapping objects, text clipped by box boundaries, misaligned labels, crowded groups
  - Fix any issues found and re-screenshot to confirm
  - Requires computer-use MCP enabled in Claude Desktop; if unavailable, note what to check manually

  **Prerequisite**: computer-use MCP must be enabled and screen recording granted to Claude. Layout engine (Phase 1) works without it; screenshot verification (Phase 2) requires it.

## Done

<!-- Completed tasks moved here with [x] and a completion date -->
