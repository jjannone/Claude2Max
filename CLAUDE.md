# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Before Beginning Any Work

Read and review the entire Claude2Max repo before starting — `CLAUDE.md`, `SPEC_REFERENCE.md`, `TUTORIAL_GUIDELINES.md`, and `spec2maxpat.py` — so your understanding of the current spec format, converter behavior, and conventions is fully up to date. Do not rely on prior session knowledge alone; the repo is the authoritative source.

## Workflow

### Working on an existing patch — sync first, always

**Before any work on an existing .maxpat**, run sync to capture manual edits the user made in Max:

```bash
python3 spec2maxpat.py sync -i patches/patch.maxpat
```

Update your working spec from the sync output, then make changes, then convert. No exceptions — not even for small fixes. `convert` regenerates the .maxpat from scratch and will silently destroy moved objects, added/deleted objects, hidden objects, and hidden cords.

### Spec files are temporary — do not leave them in the project

The spec is embedded inside every `.maxpat`. Standalone `.json` spec files are only needed as a scratch file during `convert`. Write them to `/tmp/` (or any temp location) rather than the project folder, then delete after converting. The `.maxpat` is the single source of truth; extract the spec from it whenever you need to read or edit it.

```bash
python3 spec2maxpat.py extract -i patch.maxpat > /tmp/spec.json
# edit /tmp/spec.json
python3 spec2maxpat.py convert -i /tmp/spec.json -o patch.maxpat
```

### New patch (from scratch)
1. User describes a Max patch they want
2. You write a JSON spec following the format in `SPEC_REFERENCE.md`
3. You convert it with: `python3 spec2maxpat.py convert -i /tmp/spec.json -o patches/patch.maxpat`
4. User opens in Max, gives feedback, you iterate

The spec is embedded in the `.maxpat` — no separate `.json` file needed. Extract it anytime:

```bash
python3 spec2maxpat.py extract -i patches/patch.maxpat
```

### Existing patch (externally sourced or manually edited)

**Before doing any work on a patch**, sync it to ensure the embedded spec is current:

```bash
python3 spec2maxpat.py sync -i patch.maxpat
```

- **No embedded spec** — reverse-engineers one from boxes and patchlines, embeds it, prints it to stdout.
- **Has embedded spec** — reconciles it with the current box positions, text, and wiring (picks up any manual edits made in Max), updates the embed, prints the updated spec to stdout.

After `sync`, the embedded spec is authoritative. Read it, edit it, then convert:

```bash
python3 spec2maxpat.py convert -i updated-spec.json -o patch.maxpat
```

The `.maxpat` is the single source of truth. All patches live in `patches/`.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format reference with all object types, connection format, layout guidelines, presentation view, and worked examples.
- `spec2maxpat.py` — The converter. Handles inlet/outlet profiles for 1,694 Max objects (via `max_objects.json`), auto-layout, subpatchers, and spec embedding.
- `max_objects.json` — Object database with inlet/outlet/outlettype for 1,694 objects. Generated from taylorbrook/MAX-MSP_CC_Framework. Regenerate with `python3 build_objects_db.py`.
- `build_objects_db.py` — Fetches the upstream object database and regenerates `max_objects.json`.

## What the Converter Handles for You

- Correct `numinlets`, `numoutlets`, `outlettype` for known objects
- Variable-argument objects (trigger, pack, unpack, select, route, gate, etc.)
- `parameter_enable` and `saved_attribute_attributes` for `live.*` objects
- Spec embedding as hidden `text.codebox` for round-tripping
- Auto-layout (but always use explicit `pos` — auto-layout is a fallback)

## Modifying Externally-Sourced Patches

When a patch is pasted in from an external source and you modify it:

- **Highlight changed objects** — amber background (`"bgcolor": [1.0, 0.82, 0.45, 1.0]`) + black text (`"textcolor": [0.0, 0.0, 0.0, 1.0]`) on changed message boxes; orange border (`"color": [1.0, 0.55, 0.0, 1.0]`) on changed newobj boxes
- **Color affected patchcords** — apply the same orange (`"color": [1.0, 0.55, 0.0, 1.0]`) to any patchlines that were added or rerouted
- **Annotate changes** — add comment objects labeling what changed (e.g. `"← was: 11clicks"`). Place comments at the right margin (x ≥ 565) or inline only where clearly clear of patchcords. No bgcolor on comments.
- **Embed the spec** — include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters

## What You Must Handle

- **Object text** — write it exactly as you'd type it in Max (e.g. `"metro 500"`, `"cycle~ 440"`, `"jit.noise 4 char 320 240"`)
- **Connections** — get outlet/inlet indices right. Max objects have specific inlet/outlet meanings; know them.
- **Layout** — use explicit `pos` for every object. Follow the layout guidelines in SPEC_REFERENCE.md.
- **Presentation** — use `presentation` field for user-facing layouts. Every presented control needs a comment label. **Always design presentation views as functional, logical, and aesthetic UIs** — not just a copy of the patching layout. Apply these principles:
  - **Hierarchy of importance**: the most critical information (e.g. countdown, next cue) should be largest and most prominent. Controls the user rarely touches should be small and out of the way.
  - **Logical grouping**: cluster related controls (e.g. setup vs. performance, input vs. output). Use spatial separation — columns or rows — to make groups obvious without needing extra labels.
  - **Consistent alignment**: align labels flush to their controls (label left of or above the object). Use consistent margins (15px outer, 10–15px between groups).
  - **Label placement**: put labels to the right of buttons/toggles or above number boxes. Keep labels short.
  - **Set `openinpresentation: 1`** on the patcher (post-process the .maxpat JSON) so the patch opens in presentation mode by default.
  - **`presentation_rect` must be post-processed** — the converter sets the `presentation` flag but does not write `presentation_rect` to the .maxpat. After converting, iterate all boxes by their `id`, match them to spec objects by text/class, and write `presentation_rect` as **`[x, y, w, h]`** — same format as `patching_rect`, not two corners. (Note: `getrect` *responses* use two corners `x1 y1 x2 y2`, but JSON storage attributes always use `x y w h`.)
  - **Exclude infrastructure**: metros, routers, loadbangs, print objects, and wiring intermediaries should not appear in presentation view.
- **Objects not in the converter's lookup tables** — use `inlets`, `outlets`, and `outlettype` overrides in the spec. This is common for third-party externals.
- **Always embed the spec** — every .maxpat produced using the Claude2Max workflow must include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) placed below all other objects, containing the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters. This applies whether the output is from the converter or assembled manually — if you used Claude2Max thinking (read SPEC_REFERENCE, wrote or modified a spec), embed it.

## v8 / JavaScript Objects

`v8` (Chrome V8 engine) and `js` (SpiderMonkey) objects share the same Max JS API. Prefer `v8` for new patches.

**Spec usage** — `v8` is not in the converter's lookup table; always specify inlet/outlet counts:

```json
{
  "type": "newobj",
  "text": "v8 onesound.js",
  "inlets": 1, "outlets": 6,
  "outlettype": ["", "", "", "bang", "bang", "int"]
}
```

**External JS files** — place `.js` files in the same directory as the `.maxpat`. Max resolves them relative to the patch file.

**jsui objects** — use `"type": "jsui"` with `attrs: {"filename": "script.js"}`, not `type: "newobj", text: "jsui script.js"`. The `filename` attribute is how Max natively associates a JS file with a jsui; omitting it leaves the object unlinked and non-functional. Always include it:

```json
{
  "type": "jsui",
  "pos": [10, 28], "size": [560, 340],
  "inlets": 1, "outlets": 2,
  "outlettype": ["", ""],
  "attrs": { "filename": "script.js" }
}
```

Use just the filename (not an absolute path) so the patch is portable — Max finds the file in the patch's own directory.

**Message routing** — Max dispatches incoming messages by selector (first word) to JS functions of the same name. Arguments follow as function parameters:

| Max message | JS function called |
|-------------|--------------------|
| `bang`       | `function bang()` |
| `setmode 1`  | `function setmode(val)` where `val=1` |
| `parsetarget 13:00:00` | `function parsetarget(str)` where `str="13:00:00"` |

- Set `inlets` and `outlets` globals at the top: `inlets = 1; outlets = 6;`
- Output with `outlet(n, value)`. To send a bang: `outlet(n, "bang")`.
- Use `post("message\n")` for Max console output.
- Extra message arguments beyond the function's parameters are silently ignored.

**When to use v8** — replace chains of `date`, `sprintf`, `match`, `change`, `fromsymbol`, `pack/unpack` logic with a single v8 object when the logic involves string parsing, date/time arithmetic, or stateful comparisons. v8 is not a DSP object — do not put signal processing inside JS.

## Naming Convention

All arbitrary names that Claude creates must be in **ALL CAPS**. This applies to:
- Patcher names (subpatchers, abstractions)
- `send` / `receive` names
- `pv` (patcher variable) and `v` (global variable) names
- `buffer~` names
- `coll` names
- JavaScript variable names in `v8` / `js` files
- Any other user-defined symbol or identifier

Examples: `send TEMPO`, `receive PITCH`, `pv CURRENT_STATE`, `buffer~ LOOPBUF`, `var STEP_COUNT = 0;`

This does NOT apply to Max built-in names, object names, or message selectors — only names we invent.

## Reasoning About Max — From Specific to General

When learning something specific about Max, immediately ask: **what category does this belong to, and does the property apply to all members of that category?**

Max has two distinct contexts that look similar but behave differently:

| Context | Format | Examples |
|---|---|---|
| **Stored attribute** (.maxpat JSON) | `[x, y, w, h]` | `patching_rect`, `presentation_rect`, `presentation` |
| **Runtime message / response** | `[x1, y1, x2, y2]` (two corners) | `getrect` response, `window_rect` notification |

The mistake to avoid: learning something about a runtime message and applying it to a stored attribute (or vice versa). These are different categories and the property does not transfer between them.

**General rule**: whenever you encounter a new Max attribute or message involving geometry, first determine which category it belongs to, then apply the property for that category — not the other one.

In the rare case where a specific instance violates a category rule, **document the exception explicitly** — name the object/attribute, state the rule it breaks, and note any known reason. An undocumented exception will be re-learned as a surprise every time.

This pattern of reasoning applies broadly in Max patching:
- Outlet indices are **0-based from the left** — true for all objects universally; no need to verify per object.
- `trigger` fires **right-to-left** — true for all `trigger` objects; if you know it for one, you know it for all.
- jit.gl objects share a **named render context** — if two objects share a context name, they render in the same world; apply this transitively when reasoning about visibility and draw order.

## Max Patching Knowledge

- Use `loadmess` to set sensible defaults for controls on patch load. For multiple init values, use `loadmess` → `unpack` to distribute to separate controls.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.
- `dialog` object (text-input prompt): `inlets=2, outlets=3`. Outlet 0 outputs the entered text as a symbol. Use `route symbol` after it to filter for the symbol type; then `prepend parsetarget` (or similar) to route to a v8 handler.
- `playlist~`: `inlets=1, outlets=3` (sig audio, sig position, int state). Send `append` to open the file chooser; send integer `1` to play the first item.
- `umenu` items in `.maxpat` format are stored as a flat token array with `","` as item separators: `["item", "one", ",", "item", "two"]`. Set via `attrs: {"items": [...]}` in the spec.
- `jit.world` window size: send `getrect` to inlet 0; response `rect x1 y1 x2 y2` (two corners, not x/y/w/h) comes out the **rightmost outlet** (not outlet 0). Spec the object with 3 outlets (`outlettype: ["", "bang", ""]`); connect outlet 2 to a `route rect` to filter the response. Compute width = x2−x1, height = y2−y1.
- `jit.cellblock` selection mode: the user configures `@selmode` (e.g. `selmode: 5` for inline edit) manually in Max. **Never reset or change `selmode` in a spec or post-process unless the user explicitly requests it.** Always preserve the current value; if adding a new cellblock, set `selmode` only as needed for its purpose (0 = no selection for display-only viewers).
- **`jit.cellblock` dynamic sizing**: send `rows N` and `cols N` messages to resize the grid at runtime (e.g. after generating data). Always send these **before** `clear` and the `set` calls so the grid is the right size before content is written. Example from JS: `outlet(n, "rows", PERMUTATIONS.length + 1); outlet(n, "cols", 3);`
- **`jit.cellblock` `set` message — column-first, not row-first**: the syntax is `set COL ROW value` where COL is the horizontal index (0=leftmost column) and ROW is the vertical index (0=topmost row). This is the **opposite** of the typical matrix convention (row, col). Example: `set 0 3 "Alice"` places "Alice" in column 0, row 3. When sending from JS: `outlet(n, "set", colIndex, rowIndex, value)`.
- **Grid layout preference — many rows, few columns**: when displaying tabular data in `jit.cellblock` or any grid, orient the data so that individual items (sections, events, entries) are **rows** and categories/attributes (music, dance; name, value; etc.) are **columns**. This makes the grid tall and narrow rather than wide and flat, which reads more naturally and scales better as item count grows. Apply this as the default orientation for any new grid display.

## Tutorial System

`add_tutorial.py` adds an interactive step-by-step tutorial to any `.maxpat`. **Read `TUTORIAL_GUIDELINES.md` before running or modifying the tutorial system.**

### Basic usage (static descriptions)

```bash
python3 add_tutorial.py -i patches/patch.maxpat [-o patches/patch-with-tutorial.maxpat]
```

### AI-enhanced descriptions (recommended)

Two ways to get AI-written, pedagogical step descriptions:

**From Claude Code (no API key needed):**

```bash
# 1. Analyze — outputs step groupings as JSON
python3 add_tutorial.py --analyze -i patches/patch.maxpat > steps.json

# 2. You (Claude Code) read steps.json, write better names/descriptions/placement,
#    save as enhanced-steps.json (same array format, with name/description/placement keys)

# 3. Generate with enhanced descriptions
python3 add_tutorial.py -i patches/patch.maxpat --steps-json enhanced-steps.json
```

The `--steps-json` file is a JSON array with one object per step:
```json
[
  {"name": "Overview", "description": "...", "placement": "right"},
  {"name": "Camera Capture", "description": "...", "placement": "right"}
]
```
`placement` is `"right"`, `"left"`, `"above"`, or `"below"` — controls where the annotation bubble appears relative to the highlighted objects. Falls back to `"right"` if the chosen side doesn't fit.

**With an API key (fully automated):**

```bash
export ANTHROPIC_API_KEY=sk-...
python3 add_tutorial.py --ai -i patches/patch.maxpat
```

### Features

- Analyzes the patch data-flow graph, splits spatially distant objects, merges related connected objects
- Adds a `umenu` + `prev`/`next` message buttons + `loadbang` at the top-right of the patch
- Generates a companion `<patch-name>-tutorial.js` alongside the `.maxpat` — place this next to the .maxpat when opening in Max
- Each step highlights its objects with a background panel (locked, background layer) and shows a bubble-arrow annotation comment
- `loadbang` auto-initializes to step 0 when the patch opens
- The `v8` controller uses `patcher.getnamed()` to show/hide panels and annotations per step

**When to use**: After creating a teaching patch or a complex patch the user wants to understand stage by stage.

## Upstream Maintenance

`max_objects.json` is sourced from [taylorbrook/MAX-MSP_CC_Framework](https://github.com/taylorbrook/MAX-MSP_CC_Framework). Periodically check that repo for updates to `.claude/max-objects/` (new objects, corrected I/O counts, additional overrides). When meaningful changes are found:

1. Run `python3 build_objects_db.py` to regenerate `max_objects.json`
2. Review any changes to overrides that affect objects already in `NEWOBJ_IO` — hand-verified entries in `spec2maxpat.py` always take precedence, but they may need updating too
3. Propose importing any new correctness notes to `SPEC_REFERENCE.md`

## Keeping Docs in Sync

Whenever you learn something new about Max behavior, fix a bug, or add/change a feature, **immediately** propagate that knowledge to all relevant files before committing:

- `SPEC_REFERENCE.md` — object behavior, .maxpat format details, layout rules
- `TUTORIAL_GUIDELINES.md` — tutorial generation lessons and conventions
- `CLAUDE.md` — workflow, quick-reference facts, pitfalls
- `WORK_HISTORY.md` — session summary

**Before every commit/push**, check: did this session produce insights that belong in the reference docs? If so, update them in the same commit. Do not wait for the user to ask — this is automatic.

## Work History

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <1-2 sentence summary>`

## Max .maxpat Internals

- **Z-order**: In the `boxes` array, earlier items render on top (in front). To put an object visually on top of others, place it first in the array. Background objects go last.
- **@bubbleside** (comment bubble arrows): `0=top, 1=left, 2=bottom, 3=right`. The arrow appears on that side of the comment, pointing outward. Use `"bubble_bgcolor"` (not `"bgcolor"`) for bubble background color.

## UI Layout — Label and Control Spacing

Label overflow into adjacent controls is the most common layout mistake. Follow these rules on every spec.

### Label width estimation

At Max's default font size, estimate **~7.5 px per character + 8 px padding** (round up generously):

| Label text length | Estimated width |
|------------------|----------------|
| 4–5 chars ("CLEAR", "SIZE") | ~48 px |
| 6–7 chars ("EXPORT", "LABELS") | ~60 px |
| 8–9 chars ("GENERATE", "FONTSIZE") | ~74 px |
| 10–13 chars ("COLOR SCHEME", "FONT SIZE") | ~100 px |

### Horizontal spacing rule for a row of labeled controls

```
next_x = prev_x + max(prev_label_width, prev_control_width) + 20
```

Always compute this left-to-right before placing any object. Never eyeball it.

### Message box width

Max auto-sizes message boxes to fit their text. Use `size` to fix widths explicitly when placing them in a row:

- "bang" → 40 px
- "clear", "export" → 50 px
- "exportpanel", "importpanel" → 82 px
- Default minimum: 50 px

### Routing object widths (prepend, loadmess, pack, etc.)

These sit below visible controls and overlap silently if columns are too close.

Estimated widths (text chars × 7.5 + 14 px, +15% safety margin):

| Object text | Estimated width |
|-------------|----------------|
| `prepend colorscheme` | 155 px |
| `prepend showlabels` | 150 px |
| `prepend fontsize` | 130 px |
| `prepend bang` | 85 px |
| `loadmess 1` | 80 px |
| `loadmess 11` | 85 px |
| `print name` | 80–95 px |

**Rule:** when routing objects for adjacent columns sit at the same `y`, confirm:
```
col[n+1].x  ≥  col[n].x + routing_object_width[n] + 15
```

### UI element sizing

Size UI objects (jsui, jit.pwindow, textedit, etc.) to fit their functional purpose — not to fill all available horizontal space. Leave at least 20–30 px of margin on each side. Oversized elements look unpolished and waste screen real estate.

For jsui in particular: size it for the expected content, not for the patch width. A 560 × 340 jsui in a 740 px patch leaves room for the window chrome and reads better than a 720 × 340 one that nearly touches both edges.

### Title comments

Do **not** add a `comment` object whose text simply restates the patch name. The patch name already appears in Max's title bar. Only add a title comment when the patch name alone doesn't convey what the patch does, or when the patch will be embedded as a subpatcher (where the title bar isn't visible).

### Standard column offsets for a 3-column parameter row

For a row of three labeled controls (e.g., scheme menu + toggle + number box) in a 740 px patch:

- Column A: `x = 10`  (umenu / wide control + `prepend colorscheme` ending ≈ x=165)
- Column B: `x = 180` (toggle / narrow control + `prepend showlabels` ending ≈ x=330)
- Column C: `x = 355` (number box + `prepend fontsize` ending ≈ x=485)
- Utility objects (print, etc.): `x = 495`

Adjust proportionally for narrower patches.

### Loadmess init chains

Prefer the shortest chain: `loadmess` → UI control (toggle, number box) → the control fires and propagates through its prepend → jsui. Do **not** also wire `loadmess` directly to the prepend — that double-fires the init message.

## Common Pitfalls

- `jit.gl.text` centering: use `anchor_x 0.5` to center text horizontally at its position point (0.0=left-anchored, 0.5=center, 1.0=right-anchored). **`justify` is NOT a valid `jit.gl.text` attribute** — it is silently ignored. Do not use it.
- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- Spec `size` field overrides converter defaults — use it for non-standard dimensions
- `live.gain~` with `"orientation": 1` for horizontal layout
