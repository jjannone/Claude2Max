# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Workflow

### New patch (from scratch)
1. User describes a Max patch they want
2. You write a JSON spec following the format in `SPEC_REFERENCE.md`
3. You convert it with: `python3 spec2maxpat.py convert -i spec.json -o patches/patch.maxpat`
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
- **Presentation** — use `presentation` field for user-facing layouts. Every presented control needs a comment label.
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

## Max Patching Knowledge

- Use `loadmess` to set sensible defaults for controls on patch load. For multiple init values, use `loadmess` → `unpack` to distribute to separate controls.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.
- `dialog` object (text-input prompt): `inlets=2, outlets=3`. Outlet 0 outputs the entered text as a symbol. Use `route symbol` after it to filter for the symbol type; then `prepend parsetarget` (or similar) to route to a v8 handler.
- `playlist~`: `inlets=1, outlets=3` (sig audio, sig position, int state). Send `append` to open the file chooser; send integer `1` to play the first item.
- `umenu` items in `.maxpat` format are stored as a flat token array with `","` as item separators: `["item", "one", ",", "item", "two"]`. Set via `attrs: {"items": [...]}` in the spec.

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

## Work History

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <1-2 sentence summary>`

## Max .maxpat Internals

- **Z-order**: In the `boxes` array, earlier items render on top (in front). To put an object visually on top of others, place it first in the array. Background objects go last.
- **@bubbleside** (comment bubble arrows): `0=top, 1=left, 2=bottom, 3=right`. The arrow appears on that side of the comment, pointing outward. Use `"bubble_bgcolor"` (not `"bgcolor"`) for bubble background color.

## Common Pitfalls

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- Spec `size` field overrides converter defaults — use it for non-standard dimensions
- `live.gain~` with `"orientation": 1` for horizontal layout
