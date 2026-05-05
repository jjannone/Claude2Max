# Claude2Max Spec Reference

JSON format for describing Max/MSP patches.

> **Read `CLAUDE.md` before using this file.** It contains required session-start checks, object verification steps, and workflow rules that apply before writing any spec.

## Spec Structure

```json
{
  "name": "patch-name",
  "width": 800,
  "height": 600,
  "objects": { ... },
  "connections": [ ... ]
}
```

| Field | Required | Default | Description |
|-------|----------|---------|-------------|
| `name` | no | none | Displayed as a title comment at the top of the patch |
| `width` | no | 800 | Patcher window width in pixels |
| `height` | no | 600 | Patcher window height in pixels |
| `objects` | yes | — | Dict of named objects (see below) |
| `connections` | yes | — | Array of connections between objects |

## Max's Three Patch Serialization Formats

Max serializes patcher contents in one logical shape — `{boxes, lines, appversion, classnamespace}` — and ships it in three envelopes depending on context. Knowing which envelope you have determines how to read or write it; the payload inside is the same.

| Format | Envelope around the payload | Where it appears | Read / write |
|---|---|---|---|
| **Standalone `.maxpat`** | `{"patcher": {boxes, lines, …}}` | Disk; one patcher per file | Direct JSON load |
| **Copy-paste JSON** | `{boxes, lines, appversion, classnamespace}` (no `patcher` wrapper) | macOS clipboard after `Cmd-C`; consumed by `Edit > Paste From Clipboard`; also the body of forum-embedded patches | Direct JSON load + add `{"patcher": {…}}` wrapper to save as `.maxpat` |
| **MCT (Max Compressed Text)** | `----------begin_max5_patcher----------\n<bytes>.<JUCE-base64-zlib(copy-paste-JSON)>\n-----------end_max5_patcher-----------` | Forum posts (Copy button); chat / docs sharing | `mct_decode()` / `mct_encode()` in `spec2maxpat.py` |

The relationship is purely about what's around the same payload — going one direction requires only adding/removing the wrapper or compression. For instance, when `enumerate_forum_threads.py` fetches `https://cycling74.com/api/v1/patchers/<id>` the response carries copy-paste JSON inside an MCT envelope; decoding gives you the unwrapped form, which you can either (a) save as `.maxpat` after adding the `{"patcher": {…}}` wrapper, or (b) put on the clipboard verbatim and `Edit > Paste From Clipboard` it directly into an open patcher window.

Practical implications for the converter:

- `spec2maxpat.py convert`  → writes the `.maxpat` envelope (full file).
- `spec2maxpat.py extract`  → strips the `.maxpat` envelope and emits the embedded Claude2Max spec.
- `spec2maxpat.py mct`       → produces an MCT envelope from a `.maxpat`.
- `spec2maxpat.py sync`      → reads either `.maxpat` or copy-paste JSON.

Whether the wrapper is present in a forum-fetched body depends on what the author copied: a selection from inside a patcher gives you the unwrapped form; a copy of an entire `.maxpat` file gives you the wrapped form. `mct_to_maxpat()` in `enumerate_forum_threads.py` only adds the wrapper when missing, so the saved file always opens cleanly.

The Claude2Max spec format itself is independent of all three envelopes — it is the project's intermediate representation, embedded as a hidden `text.codebox` (`id: "obj-spec-embed"`, `hidden: 1`) inside the `.maxpat`, wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters.

## Objects

Objects are defined as a dict where each key is a unique ID you choose, and the value describes the object:

```json
"objects": {
  "my_metro": { "type": "newobj", "text": "metro 500" },
  "my_toggle": { "type": "toggle" },
  "my_number": { "type": "number" },
  "my_msg": { "type": "message", "text": "hello world" },
  "my_label": { "type": "comment", "text": "Click to start" }
}
```

The object ID (e.g. `"my_metro"`) is only used within the spec for wiring connections. Choose descriptive names.

### Object Fields

| Field | Required | Description |
|-------|----------|-------------|
| `type` | yes | The Max object class (see supported types below) |
| `text` | depends | Object text — required for `newobj`, `message`, `comment` |
| `pos` | no | Explicit position as `[x, y]` — overrides auto-layout |
| `size` | no | Explicit size as `[width, height]` |
| `inlets` | no | Override number of inlets |
| `outlets` | no | Override number of outlets |
| `outlettype` | no | Override outlet types array |
| `attrs` | no | Dict of extra Max attributes to set on the box |
| `presentation` | no | Position in presentation view: `[x, y]` or `[x, y, w, h]`. Objects with this field appear in the presentation. |
| `patcher` | no | Nested spec for subpatchers (see below) |

### Object Types

#### Standard Max Objects (`type: "newobj"`)

Used for all standard Max, MSP, and Jitter objects. The `text` field contains the object name and arguments, exactly as you'd type it in Max:

```json
{ "type": "newobj", "text": "metro 500" }
{ "type": "newobj", "text": "random 128" }
{ "type": "newobj", "text": "makenote 100 200" }
{ "type": "newobj", "text": "cycle~ 440" }
{ "type": "newobj", "text": "jit.noise 4 char 320 240" }
{ "type": "newobj", "text": "scale 0 127 0. 1." }
{ "type": "newobj", "text": "route foo bar baz" }
{ "type": "newobj", "text": "prepend set" }
```

Attributes work the same as in Max — append them with `@`:

```json
{ "type": "newobj", "text": "jit.matrix 3 float32 1024 1024 @interp 1 @adapt 0" }
```

#### UI Objects

These don't need a `text` field:

| Type | Description |
|------|-------------|
| `"toggle"` | On/off toggle |
| `"button"` | Bang button |
| `"number"` | Integer number box |
| `"flonum"` | Float number box |
| `"slider"` | Vertical slider |
| `"dial"` | Rotary dial |
| `"multislider"` | Multi-slider array |
| `"function"` | Breakpoint function editor |
| `"preset"` | Preset storage |
| `"umenu"` | Dropdown menu |
| `"radiogroup"` | Radio button group |
| `"matrixctrl"` | Matrix control grid |

#### MSP UI Objects

| Type | Description |
|------|-------------|
| `"ezdac~"` | Audio output toggle (speaker icon) |
| `"ezadc~"` | Audio input toggle (mic icon) |
| `"gain~"` | Audio gain slider |
| `"meter~"` | Level meter |
| `"scope~"` | Oscilloscope display |
| `"number~"` | Signal number box |

#### Live UI Objects

These automatically get `parameter_enable` set:

| Type | Description |
|------|-------------|
| `"live.dial"` | Ableton-style dial |
| `"live.slider"` | Ableton-style slider |
| `"live.toggle"` | Ableton-style toggle |
| `"live.numbox"` | Ableton-style number box |
| `"live.menu"` | Ableton-style dropdown |
| `"live.text"` | Ableton-style text button |
| `"live.tab"` | Ableton-style tab selector |

#### Text Objects

| Type | Description |
|------|-------------|
| `"message"` | Message box — sends its `text` when clicked or banged |
| `"comment"` | Non-functional comment label |
| `"textedit"` | Editable text field |

#### JavaScript Objects

`v8` and `js` objects execute external JavaScript files with the Max JS API. They are **not** in the converter's lookup table — always override `inlets`, `outlets`, and `outlettype` in the spec.

```json
{
  "type": "newobj",
  "text": "v8 mylogic.js",
  "inlets": 1,
  "outlets": 4,
  "outlettype": ["", "", "bang", "int"]
}
```

- The `.js` file lives in the same directory as the `.maxpat`.
- Incoming messages are dispatched to JS functions by selector: `bang` → `function bang()`, `setmode 2` → `function setmode(val)`, etc.
- Set inlet/outlet counts in JS with `inlets = N; outlets = N;` globals.
- Output with `outlet(n, value)`. Send a bang with `outlet(n, "bang")`.
- Use `v8` rather than `js` for new work (Chrome V8 is faster and more standards-compliant).
- **Good candidates for v8**: date/time logic, string parsing, stateful comparisons, anything that would require a chain of `sprintf`, `fromsymbol`, `pack/unpack`, `match`, or `change` objects.
- **Patcher arguments are not directly readable from `js` / `v8`.** Wrapping a JS object in a subpatcher with `#1`/`#2` patcher args does not expose those args to the JS code. The canonical pattern is: instantiate a `patcherargs` external in the subpatcher, route its outlet to the JS inlet, and handle the incoming list in `function list(...args)`. As a related but indirect alternative, `this.patcher.box.boxtext` reads the calling box's full text — useful when the JS is the box itself and the args are its trailing tokens. (Source: Cycling '74 forum.)
- **Jitter ↔ JS interop — `copymatrixtoarray` / `copyarraytomatrix` is the canonical bridge.** Send `jit_matrix <name>` to a JS inlet, then call `JitterMatrix("name").copymatrixtoarray(typedArray)` to read every cell into a typed array (`Float32Array`/`Int32Array`/`Uint8Array` matching the matrix `type`). Reverse with `copyarraytomatrix`. For sift / filter / sort over matrix cells, prefer JS `Array.sort` (TimSort, O(n log n)) over `jit.bsort` (bubble sort, O(n²)) — the per-cell JS round-trip is dwarfed by the algorithmic improvement on any matrix above ~hundreds of cells. (Source: Cycling '74 forum.)
- **ESM in `node.script` (Max 8.6+)**: rename the file to `.mjs`, use ES module imports (`import Max from 'max-api'`), and recreate `__filename` / `__dirname` if needed via `import { fileURLToPath } from 'url'; const __filename = fileURLToPath(import.meta.url); const __dirname = path.dirname(__filename);`. Without these recreations, code that depends on CommonJS-only `__filename`/`__dirname` will throw `ReferenceError`. (Source: Cycling '74 forum.)

#### Jitter Display

| Type | Description |
|------|-------------|
| `"jit.pwindow"` | Jitter display window (embedded in patcher) |

**Video/GL display — prefer `jit.world` over `jit.gl.render` + `jit.window`.** `jit.gl.render` + `jit.window` is semi-deprecated. For any patch that needs to display a matrix or GL output in a floating window:

```json
{
  "type": "newobj",
  "text": "jit.world @floating 1 @title \"My Window\"",
  "pos": [400, 500],
  "inlets": 1,
  "outlets": 1,
  "outlettype": ["bang"]
}
```

Send a `jit_matrix` directly to `jit.world`'s inlet — no `jit.gl.layer`, `jit.gl.render`, or explicit render-trigger chain needed for simple matrix display. For GL compositing with `jit.gl.layer`, name the context: `jit.world ctx @floating 1` and `jit.gl.layer ctx`; they share the context automatically.

**Custom `.jxs` shaders bind textures by `<param>` declaration order, NOT by name.** When a patch sends multiple `texture0`, `texture1`, ... messages to a `jit.gl.shader`, the shader binds them positionally to its `<param type="int" ...>` declarations in the order they appear in the JXS XML, not by matching `name=` attributes. Reordering or inserting a `<param>` shifts every subsequent texture binding silently. The diagnostic for "my second texture is showing up where the third should be" is almost always a `<param>`-order mismatch. (Source: Cycling '74 forum.)

## jit.cellblock Notes

- **Selection mode must be "Inline Edit"** for users to type in cells. Set `"selmode": 5` in attrs. (`editmode` is the wrong attribute name — Max uses `selmode` for this.) Without this, clicking a cell selects it but does not open it for typing.
- **Never reset `selmode`** — the user configures it manually in Max. Always preserve the current value. If adding a new display-only cellblock, use `selmode: 0` (no selection).
- Cell output format is a plain list: `row col value` (no selector). In v8/js, handle with `function list()`, not `function cell()`.
- Output fires on each cell edit, not on bang. Wire directly to the v8 inlet.
- **`set` message is column-first**: syntax is `set COL ROW value` where COL is the horizontal index (0 = leftmost) and ROW is the vertical index (0 = topmost). This is the **opposite** of the typical matrix (row, col) convention. From JS: `outlet(n, "set", colIndex, rowIndex, value)`.
- **Dynamic sizing**: send `rows N` and `cols N` before `clear` and `set` calls to resize the grid at runtime. Example: `outlet(n, "rows", count + 1); outlet(n, "cols", 3);` (the +1 is for a header row).
- **Grid orientation — many rows, few columns**: individual items (sections, entries) should be rows; categories/attributes (music, dance; name, value) should be columns. This makes grids tall and narrow rather than wide and flat.

## jit.gl.text Notes

- **Horizontal alignment**: use `align 0` (left), `align 1` (center), `align 2` (justify). The attribute type is `int` — sending the symbol `align center` does NOT work. **`anchor_x` is not a valid attribute** and is silently ignored. Verified from jit.gl.text.maxref.xml in Max installation.

## Object Correctness Notes

These objects have non-obvious I/O behavior that commonly causes wiring bugs. Verified against Max help patches.

### Outlets that are NOT signals (control-rate)

| Object | Outlet | Type | Notes |
|--------|--------|------|-------|
| `buffer~` | 0, 1 | control | Outlet 0 = mouse position in ms, outlet 1 = bang on file-read complete. Neither is a signal. |
| `gain~` | 1 | control | Outlet 0 = signal passthrough; outlet 1 = control value (float). Do not wire outlet 1 to a signal inlet. |
| `avg~` | 0 | float | Outputs the average value of a block as a control float — NOT a signal. Cannot wire directly to signal inlets. |
| `adsr~` | 2, 3 | control | Outlets 0–1 are signal (envelope, trigger); outlets 2–3 are control (mute, dump). |
| `snapshot~` | 0 | float | Always control-rate. Use it to bridge signal → control. |

### Hot inlets (both inlets trigger output)

Most Max objects only trigger output from inlet 0 (hot). These objects have two hot inlets:
- `coll` — both inlets are hot
- `zl` and all `zl.*` variants — both inlets are hot

### Outlet counts that are commonly wrong

| Object | Correct outlets | Common mistake |
|--------|----------------|----------------|
| `playlist~` | 3 (audio, position, state) | Assumed 5 |
| `adsr~` | 4 (envelope~, trigger~, mute, dump) | Assumed 1–2 |
| `live.gain~` | 5 (sig L, sig R, param value, raw 0–1, dB list) | Assumed 2 |
| `dict` | 5 (dict, value, keys list, names list, status) | Assumed 2–3 |
| `number` | 2 (value, bang-on-change) | Assumed 1 |
| `flonum` | 2 (value, bang-on-change) | Assumed 1 |

### Signal type compatibility

Signal outlets (`"signal"`) can only connect to signal-accepting inlets. If you wire a signal outlet to a control inlet, Max will silently ignore or error. Use `snapshot~` to convert signal → control, and `sig~` to convert control → signal.

### Attribute groups: an enable switch without its bounds is a no-op

Many Max attributes are toggles that only do anything in combination with companion attributes that supply the actual parameters. Setting the toggle alone is misleading clutter — at best a no-op, at worst it implies behavior the patch does not have.

For instance, on `jit.matrix`:

| Toggle | Required companions |
|--------|--------------------|
| `@usedstdim 1` | `@dstdimstart`, `@dstdimend` (output region) |
| `@usesrcdim 1` | `@srcdimstart`, `@srcdimend` (input region) |

`jit.matrix 4 char 640 360 @usedstdim 1` (no start/end) does nothing — the matrix already has the dimensions implied by its constructor args. Either set the full group or omit the toggle.

The principle generalizes beyond Jitter: any attribute that gates a feature whose actual bounds live in companion attributes must be set as a group. Before adding any single attribute, check the refpage for siblings — `RefpageCache.describe(obj_name)` lists them.

### Info outlets: query message in, route on the way out

Many objects expose a query/response interface on their info outlet rather than continuously emitting raw values. The outlet emits prefixed messages like `nfaces N`, `dim 640 480`, `type char` — not bare integers. Wiring such an outlet directly into arithmetic or comparison (e.g. `> 0`) silently never fires, because the comparison receives a list whose first element is a symbol.

The pattern is always two-step:
1. **Query**: send a `get<param>` message (e.g. `getnfaces`, `getdim`) to the object's hot inlet to trigger the response.
2. **Route**: place `route <selector>` on the info outlet to strip the prefix and expose the raw value(s).

For instance, to get a face count from `cv.jit.faces` and threshold it:

```
[t b l] ── l → [cv.jit.faces] (right outlet) → [route nfaces] → [> 0]
   │
   b → [getnfaces] → [cv.jit.faces] (inlet 0)
```

The trigger sequences "matrix in first, then query" — `t b l` fires `l` (matrix to faces) before `b` (bang the getnfaces message). Common objects with this pattern: `cv.jit.faces` (`getnfaces`), `jit.matrix` (`getdim`, `gettype`, `getplanecount`), `buffer~` (`info`, `sizeinsamps`).

### Audio parameter values: never infer behavior from the number alone — check the unit

A parameter value is meaningless without its unit. The same number means different things on different objects: `0.0` is silence on a linear amplitude control (e.g. `*~ 0.`, a normalized 0–1 slider feeding a `*~`) but **unity gain** on a dB-scaled control (`live.gain~`, `live.dial @units dB`, `gain~` with default range). Numbers near `0` and `1` are especially ambiguous: `0` could be silence, unity, or center-pan; `1` could be unity or full-scale.

Before describing what an audio parameter value does, verify the object's actual scale — read its refpage `@units` / `@range` / type description (or call `RefpageCache.describe(obj_name)` in `spec2maxpat.py`). Confirm the unit before stating behavior.

### live.* objects on light-background themes: set @tricolor and @trioncolor

`live.*` objects (e.g. `live.gain~`, `live.dial`) draw their drag arrow/triangle in two colors: `@tricolor` (unfocused) and `@trioncolor` (focused/selected). Both default to light values, making them invisible against a cream or white background.

When placing a `live.*` object on a light-background theme (e.g. soviet, swiss, bauhaus), set both attributes to a dark ink value in the spec:

```json
"attrs": {
  "tricolor":  [0.039, 0.039, 0.039, 1.0],
  "trioncolor": [0.039, 0.039, 0.039, 1.0]
}
```

Do **not** use `patcher.bglocked` as a workaround — it changes the patcher canvas color globally and does not reliably affect selection chrome on live objects.

## Object Relationships

Some objects must be used in pairs or have strong conventional partners.

### Required pairs

| Object | Must pair with | Notes |
|--------|---------------|-------|
| `tapin~` | `tapout~` | Delay line — `tapin~` writes, `tapout~` reads. Both need the same delay time argument. |
| `poly~` | `thispoly~` | `thispoly~` lives inside the poly~ subpatcher to manage voice stealing and muting. |
| `pfft~` | `fftin~` / `fftout~` | `fftin~`/`fftout~` live inside the pfft~ subpatcher. |

### Common pairs

| Object | Common partner | Why |
|--------|---------------|-----|
| `buffer~` | `groove~`, `play~`, `wave~`, `record~`, `index~` | All read from or write to a named buffer. |
| `phasor~` | `wave~` | `phasor~` drives the position input of `wave~`. |
| `adsr~` | `function` | `function` draws the envelope shape; `adsr~` plays it as a signal. |
| `line~` | `*~` | `line~` generates a ramp; multiply with audio for amplitude envelopes. |
| `snapshot~` | `number` | `snapshot~` converts signal to control for display in a number box. |
| `metro` | `counter` | Classic clock + counter pattern for sequencing. |

### Z-order in .maxpat files

In Max, the order of objects in the `boxes` array determines their visual stacking: **earlier items render on top** (in front), later items render behind. This matters for:

- **Annotation comments** — place first in the array so they appear above all patch objects
- **Background panels** — place last in the array so they render behind everything
- This is the opposite of some GUI frameworks where later items are "on top"

### Bubble comments (@bubbleside)

Max `comment` objects support speech-bubble arrows via `"bubble": 1`. The `@bubbleside` attribute controls which side of the comment the arrow appears on:

| `bubbleside` | Arrow side | Use when annotation is... |
|-------------|------------|--------------------------|
| 0 | top | below the group |
| 1 | left | to the right of the group |
| 2 | bottom | above the group |
| 3 | right | to the left of the group |

Use `"bubble_bgcolor"` (not plain `"bgcolor"`) to set the bubble background color.

### PD → Max object mapping (avoid PD names in Max patches)

| PD object | Max equivalent |
|-----------|---------------|
| `osc~` | `cycle~` |
| `lop~` | `onepole~` |
| `hip~` | `onepole~` (highpass mode) |
| `bp~` | `reson~` |
| `vcf~` | `reson~` or `biquad~` |
| `tabread~` | `index~`, `play~`, or `wave~` |
| `tabwrite~` | `poke~` or `record~` |
| `catch~` | `receive~` |
| `throw~` | `send~` |
| `readsf~` | `sfplay~` |
| `writesf~` | `sfrecord~` |
| `tabread` | `table` or `coll` |
| `soundfiler` | `buffer~` |
| `vline~` | `line~` |
| `netsend` | `udpsend` |
| `netreceive` | `udpreceive` |

## Connections

Connections are an array of 4-element arrays:

```json
"connections": [
  ["source_id", outlet_index, "destination_id", inlet_index]
]
```

- `source_id` / `destination_id` — the object IDs from your `objects` dict
- `outlet_index` — 0-based index of the source outlet (leftmost = 0)
- `inlet_index` — 0-based index of the destination inlet (leftmost = 0)

```json
"connections": [
  ["toggle", 0, "metro", 0],
  ["metro", 0, "counter", 0],
  ["counter", 0, "noteout", 0],
  ["counter", 0, "number_display", 0]
]
```

One source can connect to multiple destinations. Multiple sources can connect to the same inlet.

## Subpatchers

Any `newobj` with text starting with `p` can contain a nested patcher. Add a `patcher` field with the same spec structure. Use `inlet` and `outlet` types inside to define the subpatcher's inlets and outlets:

```json
{
  "objects": {
    "my_sub": {
      "type": "newobj",
      "text": "p my-processor",
      "patcher": {
        "objects": {
          "in1": { "type": "inlet" },
          "double": { "type": "newobj", "text": "* 2" },
          "out1": { "type": "outlet" }
        },
        "connections": [
          ["in1", 0, "double", 0],
          ["double", 0, "out1", 0]
        ]
      }
    }
  }
}
```

## Extra Attributes

Use `attrs` to set any additional Max box attributes:

```json
{
  "type": "number",
  "attrs": {
    "minimum": 0,
    "maximum": 127,
    "bgcolor": [0.2, 0.2, 0.2, 1.0]
  }
}
```

```json
{
  "type": "message",
  "text": "set $1",
  "attrs": {
    "textcolor": [1.0, 0.0, 0.0, 1.0]
  }
}
```

## Layout Guidelines

**Always use explicit `pos` for every object.** The auto-layout engine arranges left-to-right, but hand-placed patches are far more readable. Follow these rules when placing objects:

### Top-to-bottom flow

Lay out the main signal chain vertically, top to bottom. Place the primary input/control at the top and the final output (dac~, noteout, etc.) at the bottom. The entire patch should fit within one patcher window without scrolling — size the window accordingly.

### Spacing

- Use ~35px vertical spacing between objects in a chain (enough room for a cable).
- Where a comment label will appear between two objects, leave ~55px vertical gap to fit the label plus cable clearance.
- Use ~90px horizontal spacing between parallel columns or side-by-side controls.

### Comment placement

- Place comment labels **above** the object they describe.
- **Right-shift** the comment ~15px from the object's x position so it does not sit on top of a vertical patch cable entering the object's inlet.
- When inserting a comment between two connected objects, add enough vertical space so the comment does not overlap the cable or either object. A comment is ~14px tall; budget at least 20px above and below it.
- Keep comments short. Use them to label controls (e.g. "tempo (ms)"), not to narrate the patch.

### Side-by-side inputs

When two or more objects feed **different inlets** of the same destination, place them at the **same y-coordinate** (side by side), not stacked vertically. Stacking makes cables ambiguous — it's unclear which source reaches which inlet. Horizontal alignment makes the data flow readable at a glance.

Example: if `num_value` feeds inlet 0 and `num_factor` feeds inlet 1 of `p scaler`, both should be at the same y, spaced ~135px apart to match the inlet spacing of the destination.

### Side controls

When a secondary control (velocity, duration, etc.) feeds into a later inlet of an object in the main chain, place it above and to the right of that object so the cable drops down naturally into the correct inlet. Label it with a comment using the same right-shift rule.

## Presentation View

Use the `presentation` field on objects to create a clean, user-facing layout separate from the patching view. Presentation mode hides all wiring and non-presented objects, showing only the controls the user needs.

### When to use presentation

Any patch with more than a handful of user-facing controls benefits from a presentation. Include all UI objects (toggles, number boxes, sliders, dials, gain controls, ezdac~, etc.) and their comment labels. Omit internal logic objects (newobj, message boxes used for routing, etc.).

### Presentation layout

- Every control in the presentation should have a comment label. If a control is worth showing to the user, it is worth labelling.
- Place comment labels **above** the control they describe, with ~18px vertical gap so the label text clears the control cleanly. Comments render slightly taller in presentation than in patching view.
- Group related controls together (e.g. all transport controls in one row, all note parameters in another).
- Keep the layout compact — presentation is meant to be a minimal panel, not a spread-out canvas.
- Presentation positions are independent of patching positions, so optimize each view for its own purpose.

## Complete Examples

### Random MIDI Note Player

```json
{
  "name": "random-notes",
  "objects": {
    "onoff": { "type": "toggle" },
    "metro": { "type": "newobj", "text": "metro 250" },
    "pitch": { "type": "newobj", "text": "random 48" },
    "offset": { "type": "newobj", "text": "+ 36" },
    "vel": { "type": "newobj", "text": "random 80" },
    "vel_offset": { "type": "newobj", "text": "+ 40" },
    "makenote": { "type": "newobj", "text": "makenote 100 200" },
    "noteout": { "type": "newobj", "text": "noteout" }
  },
  "connections": [
    ["onoff", 0, "metro", 0],
    ["metro", 0, "pitch", 0],
    ["metro", 0, "vel", 0],
    ["pitch", 0, "offset", 0],
    ["vel", 0, "vel_offset", 0],
    ["offset", 0, "makenote", 0],
    ["vel_offset", 0, "makenote", 1],
    ["makenote", 0, "noteout", 0],
    ["makenote", 1, "noteout", 1]
  ]
}
```

### Simple Synth with Filter

```json
{
  "name": "filtered-synth",
  "objects": {
    "freq": { "type": "flonum" },
    "osc": { "type": "newobj", "text": "cycle~ 440" },
    "cutoff": { "type": "flonum" },
    "reso": { "type": "flonum" },
    "filter": { "type": "newobj", "text": "lores~ 1000 0.5" },
    "gain": { "type": "gain~" },
    "dac": { "type": "ezdac~" },
    "label_freq": { "type": "comment", "text": "frequency" },
    "label_cut": { "type": "comment", "text": "cutoff" },
    "label_res": { "type": "comment", "text": "resonance" }
  },
  "connections": [
    ["freq", 0, "osc", 0],
    ["osc", 0, "filter", 0],
    ["cutoff", 0, "filter", 1],
    ["reso", 0, "filter", 2],
    ["filter", 0, "gain", 0],
    ["gain", 0, "dac", 0],
    ["gain", 0, "dac", 1]
  ]
}
```

### Inlet and Outlet Object Sizes

The default size for `inlet` and `outlet` objects in Max is **30×30 px**. Do not specify a `size` for them in the spec — the converter uses 30×30 automatically. Setting a different size will produce the wrong shape.

### Arithmetic: Float Output Requires a Float Argument

Max arithmetic objects (`+`, `-`, `*`, `/`) output **int** by default. To get float output, pass a float argument:

```
* 1.0     → float multiply (use when either input may be float)
+ 0.0     → float add
- 0.0     → float subtract
/ 1.0     → float divide
```

The `*.`, `+.` etc. variants are also valid float-mode objects, but prefer the float-argument form (`* 1.0`) for clarity in control-rate patches. The `~` variants (`*~`, `+~`) are audio-rate only.

### Counter with Subpatcher

```json
{
  "name": "wrapped-counter",
  "objects": {
    "bang": { "type": "button" },
    "count_sub": {
      "type": "newobj",
      "text": "p counter-logic",
      "patcher": {
        "objects": {
          "in": { "type": "inlet" },
          "count": { "type": "newobj", "text": "counter 0 15" },
          "out": { "type": "outlet" }
        },
        "connections": [
          ["in", 0, "count", 0],
          ["count", 0, "out", 0]
        ]
      }
    },
    "display": { "type": "number" }
  },
  "connections": [
    ["bang", 0, "count_sub", 0],
    ["count_sub", 0, "display", 0]
  ]
}
```

## What the Converter Handles

- Correct `numinlets`, `numoutlets`, `outlettype` for known objects
- Variable-argument objects (trigger, pack, unpack, select, route, gate, etc.)
- Spec embedding as hidden `text.codebox` for round-tripping
- Auto-layout (but always use explicit `pos` — auto-layout is a fallback)

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

**Message routing** — Max dispatches incoming messages by selector (first word) to JS functions of the same name:

| Max message | JS function called |
|-------------|--------------------|
| `bang` | `function bang()` |
| `setmode 1` | `function setmode(val)` where `val=1` |
| `parsetarget 13:00:00` | `function parsetarget(str)` where `str="13:00:00"` |

- Set `inlets` and `outlets` globals at the top: `inlets = 1; outlets = 6;`
- Output with `outlet(n, value)`. To send a bang: `outlet(n, "bang")`.
- Use `post("message\n")` for Max console output.
- Extra message arguments beyond the function's parameters are silently ignored.

**When to use v8** — replace chains of `date`, `sprintf`, `match`, `change`, `fromsymbol`, `pack/unpack` logic with a single v8 object when the logic involves string parsing, date/time arithmetic, or stateful comparisons. v8 is not a DSP object — do not put signal processing inside JS.

## Modifying Externally-Sourced Patches

When a patch is pasted in from an external source and you modify it:

- **Highlight changed objects** — amber background (`"bgcolor": [1.0, 0.82, 0.45, 1.0]`) + black text (`"textcolor": [0.0, 0.0, 0.0, 1.0]`) on changed message boxes; orange border (`"color": [1.0, 0.55, 0.0, 1.0]`) on changed newobj boxes
- **Color affected patchcords** — apply the same orange (`"color": [1.0, 0.55, 0.0, 1.0]`) to any patchlines that were added or rerouted
- **Annotate changes** — add comment objects labeling what changed (e.g. `"← was: 11clicks"`). Place comments at the right margin (x ≥ 565) or inline only where clearly clear of patchcords. No bgcolor on comments.
- **Embed the spec** — include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters

## MCT Encoding Algorithm

MCT format is `{compressed_byte_count}.{JUCE_base64(zlib_compress(json))}`, wrapped at 60 chars/line. `mct_encode` and `mct_decode` in `spec2maxpat.py` implement this. The JUCE base64 variant reads compressed bytes **LSB-first**, packing 6-bit chunks in order for bytes b0, b1, b2:

| Chunk | Bits |
|-------|------|
| 0 | b0[5:0] |
| 1 | b0[7:6] \| b1[3:0]<<2 |
| 2 | b1[7:4] \| b2[1:0]<<4 |
| 3 | b2[7:2] |

Alphabet: `.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+`
(`.` = 0, A–Z = 1–26, a–z = 27–52, 0–9 = 53–62, `+` = 63)

