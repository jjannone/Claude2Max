# Max Patching Reference

**Read this file before constructing or editing any patch.** It contains all patching principles, presentation guidelines, documentation rules, and common pitfalls.

---

## Always Verify Against Max Documentation — Never Guess

Max is not consistent in its terminology, implementation, or formatting. Attribute names, types, value ranges, and defaults vary unpredictably between objects and even between related objects in the same family. What works for `jit.gl.text3d` may not work for `jit.gl.text`. An attribute that takes a symbol in one object takes an int in another. A value that seems obvious (`align center`) may be silently ignored because the type is wrong (`align 1`). There is no reliable pattern to reason from — the only safe source is the documentation for that exact object.

**Before using any Max object — including its attributes and messages** — look it up in the Max installation's reference files. This applies to the object itself, not just its attributes. Familiar-sounding names (`max`, `min`, `clip`) can refer to completely different things in Max than you expect.

**Step 1 — Verify the object exists and does what you want.** Use `REFPAGE_CACHE.lookup(name)`:
- If it returns `None`: the object does not exist. Stop. Find the correct object name.
- If it returns inlet/outlet counts that don't match your expectation: wrong object. Check the digest.
- Then read the `<digest>` from the refpage XML to confirm the object's purpose matches your intent.

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

---

## Reasoning About Max — From Specific to General

When learning something specific about Max, immediately ask: **what category does this belong to, and does the property apply to all members of that category?**

Max has two distinct contexts that look similar but behave differently:

| Context | Format | Examples |
|---|---|---|
| **Stored attribute** (.maxpat JSON) | `[x, y, w, h]` | `patching_rect`, `presentation_rect` |
| **Runtime message / response** | `[x1, y1, x2, y2]` (two corners) | `getrect` response, `window_rect` notification |

The mistake to avoid: learning something about a runtime message and applying it to a stored attribute (or vice versa). These are different categories and the property does not transfer between them.

**General rule**: whenever you encounter a new Max attribute or message involving geometry, first determine which category it belongs to, then apply the property for that category — not the other one.

In the rare case where a specific instance violates a category rule, **document the exception explicitly** — name the object/attribute, state the rule it breaks, and note any known reason. An undocumented exception will be re-learned as a surprise every time.

This pattern of reasoning applies broadly in Max patching:
- Outlet indices are **0-based from the left** — true for all objects universally; no need to verify per object.
- `trigger` fires **right-to-left** — true for all `trigger` objects; if you know it for one, you know it for all.
- jit.gl objects share a **named render context** — if two objects share a context name, they render in the same world; apply this transitively when reasoning about visibility and draw order.

---

## Max .maxpat Internals

- **Z-order**: In the `boxes` array, earlier items render on top (in front). To put an object visually on top of others, place it first in the array. Background objects go last.
- **@bubbleside** (comment bubble arrows): `0=top, 1=left, 2=bottom, 3=right`. The arrow appears on that side of the comment, pointing outward. Use `"bubble_bgcolor"` (not `"bgcolor"`) for bubble background color.

---

## Max Patching Principles

Design-level principles derived from real patch evolution — patterns that recur across patches and should be applied proactively.

### Prefer smooth transitions over abrupt state changes
Any binary state change on a visual or audio parameter should be ramped rather than switched. The appropriate object depends on context: `line 0.` for Jitter/GL float parameters, `bline` for bounded ranges, `line~` for audio. A fade of even 500–1000 ms reads as intentional; a hard cut reads as a bug. For instance: "fade to black" is better implemented as `== 0` → `$1 1000` → `line 0.` → color message than as a direct toggle.

### Decouple human-readable labels from internal values
Controls should output human-readable labels that get translated to internal values downstream, never the reverse. This applies to any selection UI — buttons, menus, toggles. For instance: quick-select buttons output `live`, `2sec`, `4sec`; a `route` or `coll` downstream maps those to the numeric indices the rest of the patch needs. This lets you rename or reorder options without rewiring.

### Make selection state visible at the control, not just in the data
When a group of controls are mutually exclusive, the active one should be visually distinguished without relying on the user to track state mentally. In Max, `spray N` fans a signal to N outlets; send distinct `bgcolor` messages to each button — active gets highlight color, others get default. This is the idiomatic pattern for radio-button feedback.

### Set draw order explicitly — never rely on implicit ordering
Any time multiple visual elements occupy the same space, assign their render order explicitly rather than relying on patcher box order or arrival time. In Max/Jitter, `@layer` controls GL draw order: background objects get `@layer 0`, foreground objects `@layer 1` or higher. Box position in the patch does not determine what renders in front.

### Always provide a generative fallback for external media inputs
Any input that requires external media (camera, movie file, image) should have a generative fallback — `jit.noise`, a blank `jit.matrix`, or a `loadbang`-initialized default — so the patch produces visible, non-crashing output when no external source is connected. This is essential for testing and for graceful live performance recovery.

### Prefer objects designed for interactive use in live contexts
When choosing between objects with overlapping capabilities, prefer the one designed for the actual use context. For media playback in live or semi-live settings, `jit.playlist` (drag-and-drop loading, queuing, loop control) is a better fit than `jit.movie` (programmatic control). The more interactive-ready object saves wiring and handles edge cases the simpler one requires you to patch around.

### Group objects by what they act on, not by what they do
Objects that all operate on the same data belong together — in the same subpatcher or spatial cluster — even if their individual operations differ. For instance: crop, zoom, rotation, and offset all transform the same matrix; they belong in `p TRANSFORM`, not scattered across the top level. The organizing question is "what does this touch?" not "what kind of operation is this?" This makes signal flow readable and makes functional units easy to bypass or isolate.

### Every control must initialize to a known state on patch load
Any number box, toggle, or flonum added to a patch must have a `loadmess` (or `loadbang` → `message`) that fires a sensible default on load. A control without a default is a source of undefined state that reproduces inconsistently and is hard to debug.

---

## Max Patching Knowledge

- **Sub-Hz `cycle~` is the canonical slow LFO.** `cycle~` accepts arbitrary float frequencies down through fractional Hz: `cycle~ 0.11` (one cycle every ~9 seconds), `cycle~ 0.31` (~3 s). No need to pre-scale, build LFO-from-`line~` chains, or reach for `phasor~ + lookup~`. Useful for very slow modulation of volume, filter cutoff, panning. Keep `cycle~` (signal-rate) when modulating a signal-rate parameter; only step down to control-rate (`cycle~ 0.11 → snapshot~ 50`) when feeding a control-only destination. (Source: `!SHAKE!` (Vinczius), 2026-05-03 c74 projects analysis.)
- **For perceptually-linear amplitude fades, use a dB-mapped slider with a `select 0 → 0.` short-circuit at the silence end.** A linear slider mapped to amplitude sounds drastic at the bottom and underwhelming at the top — human loudness is closer to logarithmic. The cookbook pattern: `slider 0..-60 → dbtoa → number/line~ → *~`, with a `sel -60 → 0.` branch that forces literal silence at the bottom (because `dbtoa(-60dB)` ≈ 0.001, audibly soft but never zero). For a one-object replacement, **`gain~` does all of this internally** (dB-mapped UI + interpolation + true-silence handling) and is the right answer for any volume control unless you specifically need raw `*~` access. (Source: Max Cookbook MSP envelope chunk.)
- **The poly~-ready abstraction template uses BOTH `inlet`/`outlet` AND `in N` / `out~ N` / `in~ N`** — the same patch then works as a regular subpatch (loaded via `p`) OR as a `poly~` voice without modification. A `p` parent reads the `inlet`/`outlet` boxes; a `poly~` parent reads the `in`/`out`/`in~`/`out~` boxes. Wire both to whatever serves the same data inside the abstraction so either parent receives the same behavior. Equally important: every `inlet`/`outlet` carries an explicit `comment="(<type>) <description>"` attribute (e.g. `comment="(float) peak amplitude"`, `comment="(signal) FM tone"`) which surfaces as a tooltip in the parent's Inspector. (Confirms the existing CLAUDE.md inlet/outlet labeling rule as standard Max practice. Source: Max Cookbook `subpatch-suitable-use-poly` / `FMsynth~.maxpat`.)
- Use `loadmess` → `unpack` to distribute multiple init values to separate controls on patch load.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set patcher `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.
- `dialog` object (text-input prompt): `inlets=2, outlets=3`. Outlet 0 outputs the entered text as a symbol. Use `route symbol` after it to filter for the symbol type; then `prepend parsetarget` (or similar) to route to a v8 handler.
- `playlist~`: `inlets=1, outlets=3` (sig audio, sig position, int state). Send `append` to open the file chooser; send integer `1` to play the first item.
- `umenu` items in `.maxpat` format are stored as a flat token array with `","` as item separators: `["item", "one", ",", "item", "two"]`. Set via `attrs: {"items": [...]}` in the spec.
- **Prefer `jit.world` over `jit.gl.render` + `jit.window` for video/GL display.** `jit.gl.render` + `jit.window` is semi-deprecated. Use `jit.world @floating 1` (or add `@title "..."` / size args) to create a self-contained render context and display window. Send a `jit_matrix` directly to `jit.world`'s inlet to display it — no `jit.gl.layer` or explicit render-trigger chain needed for simple matrix display. For GL compositing with `jit.gl.layer`, create the context by naming it: `jit.world ctx @floating 1`, then `jit.gl.layer ctx` will render into it automatically. Spec with `inlets: 1, outlets: 1, outlettype: ["bang"]`.
- `jit.world` window size: send `getrect` to inlet 0; response `rect x1 y1 x2 y2` (two corners, not x/y/w/h) comes out the **rightmost outlet** (not outlet 0). Spec the object with 3 outlets (`outlettype: ["", "bang", ""]`); connect outlet 2 to a `route rect` to filter the response. Compute width = x2−x1, height = y2−y1.
- **`record~` always restarts at the buffer head when toggled — for circular overdub, drive `count~` + `poke~` from `groove~`'s sync output instead.** A common live-looper attempt wires `record~` to a `groove~`-played buffer expecting overdub to write at the current playhead. Each `record~ 1` resets to sample 0; mid-loop overdub becomes destructive. The fix is to make `count~` (configured with the buffer's sample-length) the master write-clock driven by `groove~`'s sync, with `poke~` as the writer — `count~` has no internal "should I restart?" state, so the write index follows playback exactly. (Source: Cycling '74 forum, "Circular looper overdub with record~ always resets to beginning".)
- **Canonical full-feature live-looper architecture: `accum 1 → wrap 0 length` cycling index in `gen~`, with fades on the audio inputs (not on indices) for click-free record/overdub.** Build the cycling sample index inside `gen~`. Use `splat~` for interpolated writing and `wave~` for reading. The non-obvious move is to place fade-in/out envelopes on the **input audio** to record/overdub, not on the buffer indices or read/write positions — this avoids click artifacts more cleanly than crossfading sample-index logic. For undo, maintain a parallel buffer and copy in chunks (not in one shot) to avoid CPU spikes. (Source: Cycling '74 forum, "Live Looping in 2025 - Object suggestions for a novice".)

### Jitter / GL knowledge

- **Two `jit.matrix NAME` boxes with the same name share a single memory allocation** — Jitter's `pv`/`v` equivalent for matrices. One subpatcher writes into a named matrix; another reads from it without any patchcord between them. Crucial for scrolling buffers (write to cell 0 here, read the entire matrix elsewhere), record/playback (one writer, multiple readers), and any "global matrix" shared across subpatchers. Naming convention follows the project's ALL CAPS rule: `jit.matrix SCROLLME 1 float32 100`. (Source: Max Cookbook, `bidirectional-jitmatrix-scroll`.)
- **`jit.matrix` is a general-purpose multi-dimensional data buffer — it is not video-only.** Plane = "channel" or "axis" (planes 0/1/2 for x/y/z is canonical), `dim_x` × `dim_y` = "length" × "row-count" or whatever 2D structure fits the problem. Read/write with `setcell` messages; bulk-read columns via `jit.submatrix` + `jit.spill`. Cookbook stores 18 xyz GL points × 1800 frames in a single `jit.matrix 3 char 18 1800` and plays them back with `srcdimstart 0 N, srcdimend 17 N` to step through frames. Faster and more memory-efficient than `coll`/`zl`/JS arrays for large numeric datasets (sequencer state, particle systems, FFT bins).
- **Cheap blur via downsample-then-upsample-with-interp**: `jit.matrix 4 char 16 12 → jit.window @interp 1`. Massively cheaper than a Gaussian or convolution. Send the source through a tiny destination matrix (16×12 in the cookbook example), then let the display window or a downstream `jit.matrix @interp 1` upsample back to full size with bilinear interpolation. The downsampling discards detail; the interpolation blurs it back to fill the original area. Tunable: smaller intermediate matrix = stronger blur. (Source: Max Cookbook video patterns.)
- **`jit.catch~ @mode 0` (default) emits irregular matrix `dim`** that overrides downstream graph settings (visible as flickering or sudden resolution changes in `jit.gl.graph` / oscilloscope visualizers). Use **`@mode 2 @framesize N`** for a stable, predictable matrix size per output. (Source: Cycling '74 forum.)
- **Order-Independent Transparency in Max 9 requires `jit.gl.pbr` attached to *every* transparent shape AND `@transparency 1` on `jit.world`.** Only one of the two is not enough; OIT is the union of the per-shape PBR pass and the world-level transparency flag. Without both, transparent shapes z-fight or render in the wrong order. (Source: Cycling '74 forum.)
- **Shadows on `jit.gl.multiple` only work when `jit.gl.material` is connected DIRECTLY to the multiple, not through a `jit.gl.node`.** Wiring through a `jit.gl.node` silently drops the shadow attribute. Counter-intuitive — most students expect that anything node-routable is materially equivalent — but here it isn't. (Source: Cycling '74 forum.)
- **`jit.gl.multiple` ignores per-instance alpha when `@lighting_enable 1`.** The default lighting shader doesn't sample the per-instance alpha attribute. The canonical fix is a custom shader (`multshade.jxs` or similar) that reads `vertex.color.a` from the per-instance attribute stream. The workaround is feature-stack-specific — there is no universal drop-in patch; whatever else you're using on the same `jit.gl.multiple` (textures, normal maps, shadows) determines what the shader has to declare. (Source: Cycling '74 forum.)
- **For instanced GPU rendering with multiple `jit.gl.buffer`s, the working pattern is one buffer per *named inlet* of `jit.gl.mesh`, NOT multiple buffers on the same inlet.** Each inlet declares its attribute (`position`, `normal`, `color`, custom...); each `jit.gl.buffer` outputs to one inlet. Trying to multiplex multiple buffers onto one inlet either produces undefined data or silently drops all but the last. Output cadence between buffers must be round-robin per frame. (Source: Cycling '74 forum.)

---

## Patching Layout — Avoiding Cord Tangles

When an object fans out to multiple destinations — for instance, both a processing chain and a display box — check whether placing all destinations at the same y-position will cause cords to cross. If so, stagger the destinations vertically so each incoming cord has a clear path. This is a case-by-case judgment based on the specific layout.

---

## Common Pitfalls

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- **`trigger` for sequencing — verify both order and outlet types.** When inserting a `trigger` to enforce execution order between fan-out branches, two errors compound easily: (1) Wrong order — outlets fire right-to-left, so the operation that must happen FIRST goes on the RIGHTMOST argument. Reading `t b l` left-to-right and assuming bang-then-list is the most common pitfall. (2) Type mismatch — each outlet's type comes from its argument letter (`b`=bang, `l`=list, `i`=int, `f`=float, `s`=symbol, `a`=anything). A `bang` outlet wired to an object expecting a list does nothing; a `list` outlet wired to a `message` box uses the list as the trigger, not the content. Verify both: (a) the rightmost arg is the operation that must happen first; (b) each outlet's type matches what its destination consumes. *For instance:* to clear a menu then iterate items into it, use `t l b` — outlet 1 (`b`, fires first) → clear; outlet 0 (`l`, fires second) → iter. Not `t b l`, which would (try to) iter on a bang then clear after, blanking the freshly-populated menu.
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- Spec `size` field overrides converter defaults — use it for non-standard dimensions
- `live.gain~` with `"orientation": 1` for horizontal layout
- **`delay 0` is the canonical scheduler trick for "wait for all simultaneous events to settle, then act on them as a group".** A bare `delay 0` (no integer arg) takes a message and pushes it to the very end of the current scheduler tick — no measurable latency, but everything else queued before it gets to land first. Pair with `zl.group N` and `zl.sort` to assemble simultaneous arrivals into one ordered list. *For instance:* sorting MIDI chord notes from low-to-high before output, when Live emits them in press-order — `notein → delay 0 → zl.group N → zl.sort → noteout` produces a sorted chord with effectively zero latency. (Source: Cycling '74 forum, "Sorting Midi Low to High".)
- **`dict.serialize` over UDP creates one Max symbol per serialized string — over time, a streaming dict source floods the symbol hash table and the symbols are never garbage-collected.** RAM grows monotonically until restart. The right path for high-rate dict transmission is OSC, which preserves dict structure natively without symbol creation: `udpsend / udpreceive` carrying OSC, or the third-party `o.pack` (Odot package) for unidirectional dict packing. Reserve `dict.serialize` for one-shot or very low-rate transmissions. (Source: Cycling '74 forum, "how to avoid flooding Max symbol hash table?".)

---

## Presentation View Design Principles

These principles represent the preferred aesthetic and UX approach for Max presentation views. Read and treat as a checklist before starting any presentation layout.

### Action prominence hierarchy
Size communicates priority — the most-used controls must be the largest, most visually dominant elements. Secondary controls are smaller and subordinate. Never give all controls equal visual weight; the user's eye should land on the most important control first without scanning.

### Panel-based grouping
Use dark rounded panels (`panel` objects with rounded corners and a dark fill) to cluster related controls. The panel boundary is the group label — controls inside share a purpose. Do not mix unrelated controls inside one panel. Leave consistent padding (≈15 px) between panel edge and contents.

### Section headers inside panels
Place a small comment at the top-left of each panel naming the group (e.g. "capture", "playback", "output size"). Keep it brief — one short phrase. This is the panel's title, not a label for any individual control.

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

### Comment text starts inside the box — compensate for left-alignment
Max `comment` objects have internal left padding: the text starts a few pixels right of the box's left edge. The offset is approximately 4 px at common UI font sizes but varies with font and size. When precise visual left-alignment between a comment label and a UI object is required, offset the comment's x coordinate leftward and verify visually — do not assume 4 px is exact.

### Reset affordances co-located
Place reset buttons **inside** the panel they affect, near the bottom of the group. Never put a global reset in a utility area separate from the controls it resets.

### Preview embedded in the UI
When the patch has a live preview (camera, video, generated image), embed it in the presentation view as a `jit.pwindow` within one of the panels. Do not rely on a separate floating window.

### Store/recall isolated
Group settings persistence controls (store, recall, notes about what is saved) in their own panel, visually separated from parameter controls. This prevents accidental triggering and makes the save workflow explicit.

### When bgcolor changes, audit all object color attributes

Max's default color attributes for UI controls are calibrated for its standard dark canvas. Whenever a theme changes the background significantly — lighter or darker — many of those defaults become invisible against the new background. This applies in both directions: a cream/white theme can hide dark-defaulted chrome; a deep-black theme (like LCARS) can hide light-defaulted fills.

The concern is not just fill colors. Selection chrome (`@tricolor`, `@trioncolor`), focus rings, text colors, border colors, and other object-specific color attrs are all independently set and may all need overriding. Inspect the Color section of the Inspector for every control type used in the patch when applying or switching a theme — don't assume anything adapts automatically.

### Themes carry graphic elements, not just colors
Applying a theme from `c2m-themes/` to a Max presentation view is more than color substitution. Most themes carry characteristic **graphic elements** — rails, headers, pills, wedges, primitive shapes, hard-offset shadows, scanlines — that must be added as actual Max objects (`panel`, `comment`, or `jsui`) in the presentation view, not just attribute changes on existing controls. Before applying a theme, read its CSS file *and* the per-theme caveat in `c2m-themes/README.md` to identify these graphic elements. For instance:

- **LCARS / LCARS-Bold** — vertical left **rail** (full-height amber/orange `panel`, pill corners), **top header bar** with large display-font title, **section pill labels** along the rail, **secondary-color accent blocks**.
- **Soviet** — diagonal red **wedges** as section markers (translate the `clip-path: polygon(0 0, 100% 50%, 0 100%)` motif into a triangle-shape `panel`).
- **Bauhaus** — primitive **shapes** mapped to accents: red = circle, blue = square, yellow = triangle.
- **Memphis** — **hard offset shadows** (`4px 4px 0 ink`) on every panel, plus pill/sharp corner mix.
- **Nostromo / Territory** — **scanline overlays** rendered as a `jsui` repeating-gradient canvas above the panel layer.

Themes with `--c2m-frame-rail-show: 1`, a non-`none` `--c2m-frame-scanline`, or a non-`sharp` `--c2m-frame-corner` are signaling graphic elements that must be drawn. A themed patch without its graphic elements reads as "wrong colors on a default Max patch," not as the theme. Plan for these elements in the presentation layout from the start — they consume real space (the LCARS rail alone is ~70 px wide and the header bar ~40–64 px tall), so existing controls must be shifted to make room.

---

## Output-Only UI Objects

When any UI object is used purely for display (not user input), disable interaction and remove interactive visual affordances so users don't accidentally edit displayed values. For a number box: set `@ignoreclick 1` to disable interaction and `@triangle 0` to remove the edit arrow. The specific attributes vary by object type — apply the equivalent for toggles, sliders, etc.

---

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

### Content-driven sizing

Size controls and UI elements based on their content, not the patch window. The window should adapt to the content — not the other way around.

- **Multislider**: width = `step_count × 40–50 px` (40px/step is the usable minimum; 50px is comfortable for editing). For an 8-step sequencer: 8 × 50 = 400 px. Never derive width from the patcher window size.
- **jsui / jit.pwindow / textedit**: size for expected content, leaving at least 20–30 px margin on each side. A 560 × 340 jsui in a 740 px patch reads better than one that nearly touches both edges.

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

### Presentation rect format

After converting, post-process the .maxpat to add `presentation_rect` to each presented box. Write it as **`[x, y, w, h]`** — same format as `patching_rect`, not two corners. (Note: `getrect` *responses* use two corners `x1 y1 x2 y2`, but JSON storage attributes always use `x y w h`.)

---

## Shipping a Community Max Package

When packaging a Max abstraction, external, or set of patches for distribution (Package Manager, GitHub release, etc.), follow the canonical Max-package layout. Anything inside this directory shape becomes discoverable to Max via the standard search path, and a properly-formed refpage XML makes the package's objects automatically I/O-resolvable in Claude2Max specs without any per-object override.

```
your-package/
  package-info.json              ← required metadata; declares Max version + OS support + homepatcher
  patchers/<obj>.maxpat          ← the abstraction itself
  externals/<obj>.mxo (or .mxe)  ← compiled external (if any)
  javascript/<name>.js           ← JS implementation backing an abstraction
  javascript/<name>_config-example.json  ← example user config (if needed)
  help/<obj>.maxhelp             ← help patch (homepatcher reference)
  docs/<obj>.maxref.xml          ← refpage so right-click → Reference works
  extras/<name>.maxpat           ← optional setup patches (Extras menu)
  media/                         ← optional images, audio, etc.
  icon.png                       ← package browser icon
  README.md                      ← repo-level docs
  license.txt                    ← license
```

**`package-info.json` minimum**:

```json
{
  "name": "your-package",
  "version": "1.0.0",
  "author": "...",
  "description": "...",
  "tags": ["..."],
  "max_version_min": "8.0",
  "max_version_max": "none",
  "os": {
    "macintosh": {"min_version": "none", "platform": ["x64", "aarch64"]},
    "windows":   {"min_version": "none", "platform": ["x64"]}
  },
  "homepatcher": "<obj>.maxhelp"
}
```

**`docs/<obj>.maxref.xml` schema** — the canonical Max refpage shape, parsed by `RefpageCache._parse` in `spec2maxpat.py`:

```xml
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<?xml-stylesheet href="./_c74_ref.xsl" type="text/xsl"?>
<c74object name="<obj>">
  <digest>One-line description</digest>
  <description>Longer prose description.</description>
  <metadatalist>
    <metadata name="author">...</metadata>
    <metadata name="tag">...</metadata>
  </metadatalist>
  <inletlist>
    <inlet id="0" type="list"><digest>...</digest></inlet>
  </inletlist>
  <outletlist>
    <outlet id="0" type="list"><digest>...</digest></outlet>
  </outletlist>
  <methodlist>
    <method name="..."><arglist /><digest>...</digest></method>
  </methodlist>
</c74object>
```

A package built to this layout becomes I/O-resolvable in Claude2Max specs automatically — `RefpageCache` reads the inlets/outlets from the XML, no `inlets`/`outlets`/`outlettype` overrides needed in the spec. (Source: `dirigera-max` (maceq687, MIT) — exemplar of properly-shipped community Max package, analyzed during the 2026-05-03 c74 projects crawl.)
