# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Rules from Corrected Errors

After fixing any error, derive a general rule that would have prevented it. Present the proposed rule(s) to the user in plain language before writing them to CLAUDE.md or SPEC_REFERENCE.md. Only enshrine rules the user confirms. This keeps the knowledge base accurate and user-approved rather than accumulating unreviewed assumptions.

**When writing rules, state the general principle — not the specific fix.** A rule that says "do X in situation Y" only helps when Y recurs exactly. A rule that identifies the underlying concern applies across a broader range of circumstances and more complex or differently structured patches. Ask: what is the real problem this rule is guarding against? Write the rule around that.

**Lead with intent, follow with example.** State what you're trying to achieve in plain terms first, then illustrate with a concrete case introduced as "for instance." This keeps the principle readable and applicable broadly, while still giving actionable guidance. Rules that lead with a specific method risk being read as recipes rather than principles.

## When Building a New Version from an Existing Patch

- **Retain all default values.** Any `loadbang → init` chain, `loadmess`, or hardcoded default in the JS must survive unchanged into the new version. Defaults represent deliberate configuration — they are not incidental and must not be silently dropped.

- **Preserve wiring integrity when modifying patches programmatically.** Patchlines reference boxes by `id`, so renaming a box that has connections silently breaks all wiring to and from it. Keep original IDs intact; only assign new IDs to newly added boxes.

## Never Regress Functionality When Changing Modality

**General rule**: when any working feature — display, control, behavior, format — is moved, replaced, or reimplemented in a different modality, it must arrive at least as capable as it left. A change of modality is not a reason to lose functionality.

This applies to: switching UI objects, reformatting data for a new display, replacing a message with a UI element, moving logic from patch to JS or vice versa, or any other substitution. If the user didn't ask for a feature to be removed, it must survive the transition.

**Specific case — display format**: when moving information from one display context to another (Max console → cellblock, message box → UI element, etc.), carry over all essential elements of the working format — indexing, orientation, field order, readable structure. Do not drop features just because the new modality doesn't force you to include them.

Before implementing any new display for existing data, inventory every piece of information in the current format and confirm all of it is present in the new one.

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

## Max Compressed Text (MCT)

**Produce MCT only when the user requests it, or when the user has already provided MCT in the conversation.** Never paste raw `.maxpat` JSON — users can't open it. MCT is the format Max uses for "Copy Compressed": the user copies the block and does **File > New From Clipboard** (or pastes directly into an open patcher) to reconstruct the patch.

### What it looks like

```
----------begin_max5_patcher----------
456.3ocwU1zbBBCDF9d+UjImQIAQT609CnG5wNcbhvJMNPBSHXsii+2aRv5G
SiePsNkCJj7tl28Y2EW+.xbgmIWA03GQu5dzdsd2ceKvr8wK51njsJsfUaCF
...
-----------end_max5_patcher-----------
```

Format: `{compressed_byte_count}.{JUCE_base64(zlib_compress(json))}`, wrapped at 60 chars/line.

### How to produce MCT (Claude Code)

After converting a patch, run:

```bash
python3 spec2maxpat.py mct -i patches/patch.maxpat
```

Copy the full output block (including `begin_max5_patcher` / `end_max5_patcher` lines) into your response.

### How to decode MCT you receive

```bash
python3 -c "
from spec2maxpat import mct_decode
import sys, json
print(json.dumps(json.loads(mct_decode(sys.stdin.read())), indent=2))
" << 'EOF'
----------begin_max5_patcher----------
...paste MCT here...
-----------end_max5_patcher-----------
EOF
```

### Encoding algorithm (for reference)

JUCE's `MemoryBlock::toBase64Encoding` reads the compressed bytes **LSB-first** within each byte, packing 6-bit chunks in this order for bytes b0, b1, b2:

| Chunk | Bits |
|-------|------|
| 0 | b0[5:0] |
| 1 | b0[7:6] \| b1[3:0]<<2 |
| 2 | b1[7:4] \| b2[1:0]<<4 |
| 3 | b2[7:2] |

Alphabet: `.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+`
(`.` = 0, A–Z = 1–26, a–z = 27–52, 0–9 = 53–62, `+` = 63)

The `mct_encode` and `mct_decode` functions in `spec2maxpat.py` implement this exactly.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format reference with all object types, connection format, layout guidelines, presentation view, and worked examples.
- `spec2maxpat.py` — The converter. Handles inlet/outlet profiles for 1,694 Max objects (via `max_objects.json`), auto-layout, subpatchers, and spec embedding.
- `max_objects.json` / `build_objects_db.py` — **Deleted.** I/O data now comes directly from the C74 maxref.xml files via `RefpageCache` in `spec2maxpat.py`.

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
  - **Use screenshots for layout verification** — after converting, take a screenshot of the patch open in Max (both patching view and presentation view) to verify positioning, alignment, and spacing visually before reporting the work as done. Fix anything that looks wrong before finishing. **Prerequisite**: this requires the computer-use MCP to be enabled in Claude Desktop settings and screen recording permission granted to Claude. If unavailable, ask the user to describe what looks off, or proceed without visual verification. **Before starting the visual review, read the presentation view sections of CLAUDE.md and SPEC_REFERENCE.md and treat them as an explicit checklist** — not as a reference to consult after the fact. Skipping this leads to inventing solutions that contradict documented rules.
  - **Multislider width is content-driven, not window-driven** — set multislider width to `step_count × 40–50px` (40px/step is the usable minimum; 50px is comfortable for editing). For an 8-step sequencer: 8 × 50 = 400px. Never derive width from the patcher window size — the window adapts to content, not the other way around.
  - **Ensure objects appear in their intended positions in presentation view.** The converter sets the `presentation` flag but does not write `presentation_rect` to the .maxpat, so after converting you must post-process the .maxpat to add `presentation_rect` to each presented box. Write it as **`[x, y, w, h]`** — same format as `patching_rect`, not two corners. (Note: `getrect` *responses* use two corners `x1 y1 x2 y2`, but JSON storage attributes always use `x y w h`.)
  - **Exclude infrastructure**: metros, routers, loadbangs, print objects, and wiring intermediaries should not appear in presentation view.
- **Subpatcher, abstraction, and poly~ inlet/outlet labeling** — every `inlet` and `outlet` object in a subpatcher, abstraction, or poly~ abstraction must be labeled in two places:
  1. **Outside** (in the parent patcher): set the `@comment` attribute on the `p`/`poly~` object itself, describing each inlet and outlet — index, expected type, and purpose. E.g. `"in 0: bang — trigger generate  |  out 0: list — permutation"`. In the spec, use `attrs: {"comment": "..."}`.
  2. **Inside** (within the subpatcher): both of the following, for every `inlet` and `outlet` object:
     - Set `attrs: {"comment": "..."}` on the `inlet`/`outlet` spec entry — this writes the `comment` key directly to the box and appears as a tooltip/label in the Inspector.
     - Place an actual `comment` box immediately adjacent, describing what the inlet receives or outlet sends. E.g. next to inlet: `"← bang: trigger generate"`, next to outlet: `"→ list: permutation result"`.
  Never create an encapsulated unit without both levels of labeling. This applies at creation time, not as an afterthought.
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

Make user-defined names visually distinct from Max built-ins so patches are readable at a glance: use **ALL CAPS** for all arbitrary names you create — for instance `send TEMPO`, `receive PITCH`, `pv CURRENT_STATE`, `buffer~ LOOPBUF`, `var STEP_COUNT = 0;`. This applies to patcher names, send/receive names, pv and v variables, buffer~ names, coll names, JS variables, and any other user-defined symbol or identifier. It does NOT apply to Max built-in names, object names, or message selectors.

## Always Verify Against Max Documentation — Never Guess

Max is not consistent in its terminology, implementation, or formatting. Attribute names, types, value ranges, and defaults vary unpredictably between objects and even between related objects in the same family. What works for `jit.gl.text3d` may not work for `jit.gl.text`. An attribute that takes a symbol in one object takes an int in another. A value that seems obvious (`align center`) may be silently ignored because the type is wrong (`align 1`). There is no reliable pattern to reason from — the only safe source is the documentation for that exact object.

**Before using any Max object — including its attributes and messages** — look it up in the Max installation's reference files. This applies to the object itself, not just its attributes. Familiar-sounding names (`max`, `min`, `clip`) can refer to completely different things in Max than you expect. The only safe source is the documentation for that exact object name.

**Step 1 — Verify the object exists and does what you want.** Use `REFPAGE_CACHE.lookup(name)`:
- If it returns `None`: the object does not exist. Stop. Find the correct object name.
- If it returns inlet/outlet counts that don't match your expectation: wrong object. Check the digest.
- Then read the `<digest>` from the refpage XML to confirm the object's purpose matches your intent. A name that sounds right may do something entirely different.

```python
from spec2maxpat import REFPAGE_CACHE
import xml.etree.ElementTree as ET

r = REFPAGE_CACHE.lookup('clip')          # check exists + I/O counts
path = REFPAGE_CACHE._find_xml('clip')
digest = ET.parse(path).getroot().find('digest')
print(digest.text)                         # "Limit numbers to a range" — correct
```

**Step 2 — Verify attributes.** For every attribute you intend to use, answer all of the following from the documentation before writing code:

- **Does this attribute exist on this exact object?** (not a similar object, not a related family)
- **What is its type?** (`int`, `float`, `symbol`, `list` — this determines how to send it)
- **What are the valid values?** (enum integers? float range? specific symbols?)
- **What is the default?** (so you know what "no change" looks like)
- **Is it settable via message, or only at object creation via `@attr`?**
- **Are there any known silent-failure modes?** (wrong type → ignored with no error)

**Where to look** — all of these are in the Max installation at `/Applications/Max.app/Contents/Resources/C74/docs/refpages/`:
- `jit-ref/jit.gl.text.maxref.xml` — Jitter GL objects
- `max-ref/<object>.maxref.xml` — core Max objects
- `msp-ref/<object>.maxref.xml` — MSP signal objects
- Help patches: `/Applications/Max.app/Contents/Resources/C74/help/`
- Snippets: `/Applications/Max.app/Contents/Resources/C74/snippets/`

Use `grep` to search these files directly. A 30-second grep is always faster than three rounds of wrong guesses.

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

## Max Patching Principles

These are design-level principles derived from real patch evolution — patterns that recur across patches and should be applied proactively.

### Animate visual transitions; never switch abruptly
Replace binary toggles on visual parameters with ramped transitions. Use `line 0.` (for Jitter/GL parameters), `bline`, or `line~` (for audio) to smooth any abrupt change. A fade of even 500–1000 ms reads as intentional; a hard cut reads as a bug. For instance: "fade to black" is better implemented as `== 0` → `$1 1000` → `line 0.` → color message than as a direct toggle.

### Decouple display labels from internal values
Quick-select buttons should output human-readable labels (`live`, `2sec`, `4sec`) that get translated to internal numeric indices downstream (e.g. via `route` or a `coll` lookup). Never hardcode the internal value in the button label. This lets you rename or reorder options without rewiring.

### Use `spray` + `bgcolor` messages for radio-button feedback
To show which of a group of buttons is currently active, connect their shared trigger to a `spray N` object, then send `bgcolor` messages to each button: the active one gets the highlight color, the rest get the default. This is the idiomatic Max pattern for mutually exclusive button selection.

### Set `@layer` explicitly on every jit.gl object
When a `jit.world` contains multiple GL objects, always set `@layer` on each one. Do not rely on patcher order to determine draw order — GL render order is controlled by `@layer`, not box position. Background objects get `@layer 0`; foreground objects get `@layer 1` or higher.

### Include a generative fallback for media inputs
Any input that requires external media (camera, movie file, image) should have a generative fallback — `jit.noise`, a blank `jit.matrix`, or a `loadbang`-initialized default — so the patch produces visible, non-crashing output when no external source is connected. This is essential for testing and for graceful live performance recovery.

### Prefer `jit.playlist` over `jit.movie` for performance contexts
`jit.playlist` supports drag-and-drop loading, queuing, and loop control in a single object. Use it instead of `jit.movie` whenever the patch will be used in a live or semi-live context where the user needs to load media interactively.

### Group objects by what they act on, not by what they do
Objects that all operate on the same data belong in the same subpatcher, even if their individual operations are different. For instance: crop, zoom, rotation, and offset all transform the same matrix — they belong together in `p CROP`, not scattered across the top level. The organizing question is "what does this touch?" not "what kind of thing is this?" This makes signal flow readable, makes the transform chain easy to bypass or isolate, and keeps the top-level patch free of implementation detail.

### Every new control needs a `loadmess` default
Any number box, toggle, or flonum added to a patch must have a `loadmess` (or `loadbang` → `message`) that initializes it to a sensible value on patch load. A control without a default is a source of undefined state.

## Max Patching Knowledge

- Use `loadmess` to set sensible defaults for controls on patch load. For multiple init values, use `loadmess` → `unpack` to distribute to separate controls.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.
- `dialog` object (text-input prompt): `inlets=2, outlets=3`. Outlet 0 outputs the entered text as a symbol. Use `route symbol` after it to filter for the symbol type; then `prepend parsetarget` (or similar) to route to a v8 handler.
- `playlist~`: `inlets=1, outlets=3` (sig audio, sig position, int state). Send `append` to open the file chooser; send integer `1` to play the first item.
- `umenu` items in `.maxpat` format are stored as a flat token array with `","` as item separators: `["item", "one", ",", "item", "two"]`. Set via `attrs: {"items": [...]}` in the spec.
- `jit.world` window size: send `getrect` to inlet 0; response `rect x1 y1 x2 y2` (two corners, not x/y/w/h) comes out the **rightmost outlet** (not outlet 0). Spec the object with 3 outlets (`outlettype: ["", "bang", ""]`); connect outlet 2 to a `route rect` to filter the response. Compute width = x2−x1, height = y2−y1.
- **Where object-specific knowledge belongs**: behavioral notes, message syntax, and pitfalls for specific Max objects go in `SPEC_REFERENCE.md` — not here. `CLAUDE.md` is for workflow, process rules, and cross-cutting conventions. `max_objects.json` is generated and must not be edited by hand. When you learn something new about a specific object (jit.cellblock, jit.gl.text, etc.), add it to the relevant section of `SPEC_REFERENCE.md`.

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

No external dependencies or build steps. `spec2maxpat.py` looks up I/O counts directly from the Cycling '74 maxref.xml files bundled with Max.app, on demand and per object, caching results for the session. No JSON database, no `build_objects_db.py`. Works automatically as long as Max is installed at a standard path (`/Applications/Max.app`, `/Applications/Max 9.app`, or `/Applications/Max 8.app`). Degrades gracefully if Max is not found — falls back to spec-provided I/O counts.

Hand-verified entries in `NEWOBJ_IO` inside `spec2maxpat.py` always take precedence — those correct cases where even the official docs are wrong (e.g. `gain~` outlet 1 type).

## Keeping Docs in Sync

Whenever you learn something new about Max behavior, fix a bug, or add/change a feature, **immediately** propagate that knowledge to all relevant files before committing:

- `SPEC_REFERENCE.md` — object behavior, .maxpat format details, layout rules
- `TUTORIAL_GUIDELINES.md` — tutorial generation lessons and conventions
- `CLAUDE.md` — workflow, quick-reference facts, pitfalls
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

## Work History

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

## Max .maxpat Internals

- **Z-order**: In the `boxes` array, earlier items render on top (in front). To put an object visually on top of others, place it first in the array. Background objects go last.
- **@bubbleside** (comment bubble arrows): `0=top, 1=left, 2=bottom, 3=right`. The arrow appears on that side of the comment, pointing outward. Use `"bubble_bgcolor"` (not `"bgcolor"`) for bubble background color.

## Presentation View Design Principles

These principles are derived from the Second Nature v5 presentation layout and represent the preferred aesthetic and UX approach for Max presentation views.

### Action prominence hierarchy
The most-used controls must be the largest, most visually dominant elements. Size communicates priority. Secondary controls are smaller and subordinate. For example: if the main user action is selecting a delay time, those buttons should be 2–3× larger than everything else on screen. Never give all controls equal visual weight.

### Panel-based grouping
Use dark rounded panels (`panel` objects with rounded corners and a dark fill) to cluster related controls. The panel border is the group label — controls inside share a purpose. Do not mix unrelated controls inside one panel. Leave consistent padding (≈15 px) between panel edge and contents.

### Section headers inside panels
Place a small comment at the top-left of each panel naming the group (e.g. "set delay time", "image crop", "image position"). Keep it brief — one short phrase. This is the panel's title, not a label for any individual control.

### Color as semantic signal
Follow this palette consistently:
- **Red** (`1. 0. 0. 1.`) — live/active state; critical or high-priority labels
- **Amber/orange** (`1. 0.55 0. 1.`) — secondary important labels; changed objects
- **Blue background** on number boxes — indicates a saved/persistent value
- **Red button** — write/store action (irreversible or important)
- **Green button** — read/recall action (safe)
- **White/light** — standard labels and controls

### Monospace font throughout
Use a monospace font (e.g. `Courier` or `Monaco`) consistently across all comment labels and UI text in presentation view. It gives a technical-but-legible character and makes the layout feel intentional.

### Label placement
Labels go to the **right** of their control — never above, never below (unless vertical stacking is forced by space). Align label baselines with the control's vertical center.

### Reset affordances co-located
Place reset buttons **inside** the panel they affect, near the bottom of the group. Never put a global reset in a utility area separate from the controls it resets.

### Preview embedded in the UI
When the patch has a live preview (camera, video, generated image), embed it in the presentation view as a `jit.pwindow` within one of the panels. Do not rely on a separate floating window.

### Store/recall isolated
Group settings persistence controls (store, recall, notes about what is saved) in their own panel, visually separated from parameter controls. This prevents accidental triggering and makes the save workflow explicit.

## UI Layout — Label and Control Spacing

Label overflow into adjacent controls is the most common layout mistake. Follow these rules on every spec.

### Label width estimation

At Max's default font size, estimate **~7.5 px per character + 8 px padding** (round up generously). If using a monospace font such as Courier or Monaco, use **~8.5 px per character + 8 px padding** — monospace fonts are wider and labels will collide if you use the default estimate:

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

The converter automatically generates a title comment from the spec's `name` field — do **not** also add an explicit title object (e.g. `lbl_title`) in the spec's `objects` map. Doing so creates two title comments in the patch.

### Standard column offsets for a 3-column parameter row

For a row of three labeled controls (e.g., scheme menu + toggle + number box) in a 740 px patch:

- Column A: `x = 10`  (umenu / wide control + `prepend colorscheme` ending ≈ x=165)
- Column B: `x = 180` (toggle / narrow control + `prepend showlabels` ending ≈ x=330)
- Column C: `x = 355` (number box + `prepend fontsize` ending ≈ x=485)
- Utility objects (print, etc.): `x = 495`

Adjust proportionally for narrower patches.

### Loadmess init chains

Prefer the shortest chain: `loadmess` → UI control (toggle, number box) → the control fires and propagates through its prepend → jsui. Do **not** also wire `loadmess` directly to the prepend — that double-fires the init message.

## Output-Only UI Objects

When any UI object is used purely for display (not user input), make sure it cannot also accept input and remove interactive visual affordances; for instance with a number box set `@ignoreclick 1` to disable interaction and `@triangle 0` to remove the arrow. The specific attributes vary by object type.

## Patching Layout — Avoiding Cord Tangles

When an object fans out to both a processing destination and a display box, check whether placing them at the same y-position will cause cords to cross. If so, move the display box to a position where its incoming cord doesn't intersect the processing wiring — this is a case-by-case judgment based on the specific layout.

## Common Pitfalls

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- Spec `size` field overrides converter defaults — use it for non-standard dimensions
- `live.gain~` with `"orientation": 1` for horizontal layout
