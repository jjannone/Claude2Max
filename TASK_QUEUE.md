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

- [ ] **Layout engine + screenshot verification (patching and presentation views)** — three-phase approach covering both views, each with its own emphasis:

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

  **Inlet/outlet labeling rule** (applies to all subpatchers, abstractions, and poly~ abstractions — not just those created by the layout engine): every `inlet` and `outlet` object must have a comment label immediately adjacent describing its purpose and expected type. Additionally, within the subpatcher, each inlet and outlet must have a `comment` object directly connected or placed next to it explaining what it receives/sends. This applies at creation time — never create an encapsulated unit without labels. Example: `inlet` labeled "0: bang — trigger generate" and a comment inside reading "← trigger: starts permutation generation".

  **Phase 3 — Screenshot verification**: after conversion, use computer-use MCP to:
  - Screenshot patching view — review for structural clarity, readable data flow, well-grouped functional units, encapsulation opportunities missed by the engine
  - Screenshot presentation view (Cmd-Shift-E) — review for overlapping objects, clipped text, misaligned labels, crowded groups
  - Fix issues found and re-screenshot to confirm
  - Requires computer-use MCP enabled in Claude Desktop; if unavailable, note what to check manually

  **Prerequisite**: computer-use MCP must be enabled and screen recording granted to Claude. Phases 1 and 2 (layout engines) work without it; Phase 3 (screenshots) requires it.

## Done

<!-- Completed tasks moved here with [x] and a completion date -->
