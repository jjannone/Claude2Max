# Claude2Max Spec Reference

A lightweight JSON format for describing Max/MSP patches. Designed to be written by Claude and converted to `.maxpat` files with `spec2maxpat.py`.

## Quick Start

Write a JSON file following this format, then convert it:

```
python3 spec2maxpat.py convert -i my-patch.json -o my-patch.maxpat
```

To extract the spec back from an existing `.maxpat`:

```
python3 spec2maxpat.py extract -i my-patch.maxpat -o my-patch.json
```

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

#### Jitter Display

| Type | Description |
|------|-------------|
| `"jit.pwindow"` | Jitter display window |

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

## Spec Embedding

When converted, the spec is automatically embedded as a hidden comment in the `.maxpat` file. This allows round-tripping: Claude can read any `.maxpat` generated by this tool, extract the spec, modify it, and reconvert. Use `spec2maxpat.py extract` to retrieve the embedded spec.
