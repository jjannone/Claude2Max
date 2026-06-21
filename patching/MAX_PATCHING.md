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
- **For variable-speed `groove~` playback, smooth the rate-control signal with `slide~` rather than `rampsmooth~`.** `rampsmooth~` produces edge-artifact discontinuities near zero-speed transitions; `slide~`'s gradual smoothing avoids them. The shape: `controller → zmap -60 60 -3 3 → slide~ 100 → groove~ rate-input` (zmap clips and rescales, slide~ provides asymmetric attack/release). The distinction generalises beyond `groove~` to any signal-driving control where direction-reversal smoothness matters. (Source: Cycling '74 forum, "vinyl scratch, help with eliminating clicks?".)
- **`phasor~ → delta~ → <~ 0` is the canonical signal-rate "fire once per cycle" trigger.** `delta~` outputs the per-sample difference; on a `phasor~` this is small-positive most samples but *negative* at the wrap-point. `<~ 0` produces a one-sample pulse exactly at the wrap — no scheduler jitter, no `sel` chain. The companion `edge~` does the same job for any `<~`/`>~` source. (Source: Cycling '74 forum, "phasor~ > function sequencer question".)
- **Smoothed preset interpolation via `function → buffer~ → play~`**: store the interpolation curve as `function` breakpoints, `dump` → `peek~` populates a named `buffer~`, then trigger `start 0 $1 N` on `play~` for variable-speed playback. Gives sample-accurate, click-free preset transitions with arbitrary curve shapes (linear, S-curve, sigmoid) — more flexible than `line~` for anything other than linear ramps. Use `sampstoms~` to convert buffer length back to ms when changing the domain. (Source: Cycling '74 forum, "Smoothed Preset Interpolation with line envelope".)
- **Mass-spring-damper physical modelling via `jit.phys.body` + `jit.phys.barslide` + `jit.phys.spring`: N bodies + N-1 springs = N-mode resonant string/bar.** The position output of each `jit.phys.body` feeds a `live.gain~` for audification. `resetquat 0 0 0.7071 0.7071` rotates the barslide constraint 90° (default is vertical); `loadmess 50` / `loadmess 0.9` set spring-strength and damping respectively. (Source: Cycling '74 forum, "Mass-Spring-Damper Model".)
- **`uzi N 0 → peek~ NAME → if $f1 >= $f2 then $f1` is the canonical non-realtime buffer scan for min/max/peak detection.** `uzi N 0` walks every sample index 0..N-1; `peek~` reads the corresponding sample; a running comparator accumulates the maximum. Use for buffer normalization, peak detection, and RMS computation outside the realtime path. The same pattern works inside `gen~` via a `for` loop in a `codebox`. (Source: Cycling '74 forum, "How to find minimum and maximum values in a buffer".)
- **`cpuclock → - 0.` is the canonical Max pattern for measuring elapsed wall-clock time between two events.** `cpuclock` outputs the current time in high-precision milliseconds; subtracting two snapshots gives the interval. Cleaner form: `t f → cpuclock → - $1` for explicit before/after capture. Use `mstosamps~` to convert to samples. Useful for performance profiling, beat-tracking, and swing-quantization. (Source: Cycling '74 forum, "Report Elapsed Sample Time Between Two Events".)

### Jitter / GL knowledge

- **Two `jit.matrix NAME` boxes with the same name share a single memory allocation** — Jitter's `pv`/`v` equivalent for matrices. One subpatcher writes into a named matrix; another reads from it without any patchcord between them. Crucial for scrolling buffers (write to cell 0 here, read the entire matrix elsewhere), record/playback (one writer, multiple readers), and any "global matrix" shared across subpatchers. Naming convention follows the project's ALL CAPS rule: `jit.matrix SCROLLME 1 float32 100`. (Source: Max Cookbook, `bidirectional-jitmatrix-scroll`.)
- **`jit.matrix` is a general-purpose multi-dimensional data buffer — it is not video-only.** Plane = "channel" or "axis" (planes 0/1/2 for x/y/z is canonical), `dim_x` × `dim_y` = "length" × "row-count" or whatever 2D structure fits the problem. Read/write with `setcell` messages; bulk-read columns via `jit.submatrix` + `jit.spill`. Cookbook stores 18 xyz GL points × 1800 frames in a single `jit.matrix 3 char 18 1800` and plays them back with `srcdimstart 0 N, srcdimend 17 N` to step through frames. Faster and more memory-efficient than `coll`/`zl`/JS arrays for large numeric datasets (sequencer state, particle systems, FFT bins).
- **Cheap blur via downsample-then-upsample-with-interp**: `jit.matrix 4 char 16 12 → jit.window @interp 1`. Massively cheaper than a Gaussian or convolution. Send the source through a tiny destination matrix (16×12 in the cookbook example), then let the display window or a downstream `jit.matrix @interp 1` upsample back to full size with bilinear interpolation. The downsampling discards detail; the interpolation blurs it back to fill the original area. Tunable: smaller intermediate matrix = stronger blur. (Source: Max Cookbook video patterns.)
- **`jit.catch~ @mode 0` (default) emits irregular matrix `dim`** that overrides downstream graph settings (visible as flickering or sudden resolution changes in `jit.gl.graph` / oscilloscope visualizers). Use **`@mode 2 @framesize N`** for a stable, predictable matrix size per output. (Source: Cycling '74 forum.)
- **Order-Independent Transparency in Max 9 requires `jit.gl.pbr` attached to *every* transparent shape AND `@transparency 1` on `jit.world`.** Only one of the two is not enough; OIT is the union of the per-shape PBR pass and the world-level transparency flag. Without both, transparent shapes z-fight or render in the wrong order. (Source: Cycling '74 forum.)
- **Full PBR transparent-render stack (Max 8.3+):** `jit.gl.pbr @gamma_correction 0` on every transparent shape + `jit.world @transparency 1` + `jit.gl.skybox @gamma_correction 0` + `jit.gl.environment @file <hdr>.exr` for image-based lighting + `jit.gl.pass @fxname gamma @quality hi` as the final post-process. Without `@gamma_correction 0` on each shape, gamma double-corrects and colors are wrong. `@locklook 1 @tripod 1` on `jit.gl.camera` keeps the view-target stable while orbiting. (Source: Cycling '74 forum, "Max 8.3 Jitter Features".)
- **Shadows on `jit.gl.multiple` only work when `jit.gl.material` is connected DIRECTLY to the multiple, not through a `jit.gl.node`.** Wiring through a `jit.gl.node` silently drops the shadow attribute. Counter-intuitive — most students expect that anything node-routable is materially equivalent — but here it isn't. (Source: Cycling '74 forum.)
- **`jit.gl.multiple` ignores per-instance alpha when `@lighting_enable 1`.** The default lighting shader doesn't sample the per-instance alpha attribute. The canonical fix is a custom shader (`multshade.jxs` or similar) that reads `vertex.color.a` from the per-instance attribute stream. The workaround is feature-stack-specific — there is no universal drop-in patch; whatever else you're using on the same `jit.gl.multiple` (textures, normal maps, shadows) determines what the shader has to declare. (Source: Cycling '74 forum.)
- **For instanced GPU rendering with multiple `jit.gl.buffer`s, the working pattern is one buffer per *named inlet* of `jit.gl.mesh`, NOT multiple buffers on the same inlet.** Each inlet declares its attribute (`position`, `normal`, `color`, custom...); each `jit.gl.buffer` outputs to one inlet. Trying to multiplex multiple buffers onto one inlet either produces undefined data or silently drops all but the last. Output cadence between buffers must be round-robin per frame. (Source: Cycling '74 forum.)
- **Texture patchcords are not connections — they are attribute-set operations on the receiving object's `texture` attribute, and the attribute persists after the cord is deleted.** Removing the cord does not unset the attribute; the receiving object continues to render the last-received texture. To clear, ACTIVELY replace it: connect a different texture source (or an empty `jit.matrix` / `jit.gl.texture`) to overwrite the attribute. Symptom: "I deleted the connection but the effect is still there" — that's a stale texture attribute, not a residual cord. (Source: Cycling '74 forum, "Vsynth Package".)
- **The canonical Jitter layer-compositing trio: `@layer N` per renderable + `@depth_enable 0` on the rendering context + `@blend_enable 1` for transparency.** Higher layer numbers render on top. Without `@depth_enable 0`, depth-testing produces inconsistent stacking that looks like random ordering. Without `@blend_enable 1`, transparency keys produce hard edges instead of compositing. `jit.gl.layer` is a convenience wrapper that handles all three settings inline; the trio is mandatory for any 2D-style overlay system in a 3D Jitter context. (Source: Cycling '74 forum, "Overlay one videoplane on another".)
- **Jitter GL position uses normalised coordinates with `±2` spanning the visible window — NOT pixels, and NOT `±1`.** A `@pos 1 0 0` is half-screen to the right; `@pos 2 0 0` is at the right edge. Pixel-distance math requires pre-scaling: `pixel_offset / (window_width / 2)` gives the normalised offset. The `±2` range is the source of "my object is in the wrong place" misalignment when porting from pixel-coordinate systems. (Source: Cycling '74 forum, "Attaching two screens like layers".)
- **`jit.glue` (and any matrix-combining `jit.*` object: `jit.pack`, `jit.unpack`, `jit.scissors`) requires both matching `dim` AND matching plane count across all input matrices.** Mismatched plane counts (e.g. 1-plane and 3-plane mixed) silently produce wrong output rather than emitting an error. Standardise inputs through fixed-spec `jit.matrix N <type> <dim>` chains before any combine operation. (Source: Cycling '74 forum, "Q: Different FFT spectrum - jit.matrix, jit.glue, jit.world".)
- **Connect `jit.gl.material` to `jit.gl.multiple` / `jit.gl.gridshape` to enable shader-based rendering — current NVIDIA / AMD drivers no longer optimise the deprecated fixed-function OpenGL pipeline.** Counter-intuitive symptom: integrated graphics outperforming discrete NVIDIA on Jitter geometry tests because the drivers de-prioritise fixed-function. Adding a single `jit.gl.material` (default settings are fine) routes the render through the shader pipeline drivers actively optimise. Mandatory for any performance-sensitive `jit.gl.*` geometry chain. (Source: Cycling '74 forum, "Benchmarking Jitter's CPU/GPU performance on your computer", Rob Ramirez (C74).)
- **Whether a `jit.gl.*` object accepts `jit_matrix` on its left inlet is a per-object property — check the refpage's `<jittermethod name="jit_matrix" />` before wiring a matrix into it.** Some GL objects (`jit.gl.videoplane`, `jit.gl.mesh`, `jit.gl.cornerpin`, `jit.gl.layer`) accept a `jit_matrix` directly on their left inlet and auto-convert it into an internal texture; others require an explicit named texture set via `@texturename` and fed by a separate `jit.gl.texture` upstream. The two patterns are NOT interchangeable, and you can't tell from the object's name which it accepts. The reliable check is one grep: `grep 'jittermethod name="jit_matrix"' /Applications/Max.app/Contents/Resources/C74/docs/refpages/jit-ref/<obj>.maxref.xml`. If the line is present, drop the intermediate `jit.gl.texture` — feeding the matrix straight in is simpler AND lets `@interp` on the destination govern sampling without a second filter pass. Without this check, the common failure mode is leaving a `jit.gl.texture` in the chain "to be safe" — which adds a hidden upload step and can re-interp the data before it reaches the consumer. *For instance:* `jit.gl.cornerpin` has the method, so `[v8] → [jit.matrix upscaler] → [jit.gl.cornerpin]` is correct; the otherwise-intuitive `[…] → [jit.gl.texture @name foo] → [jit.gl.cornerpin @texturename foo]` is one box too many.
- **For a small source matrix that must render with crisp pixel edges across a large `jit.world`, insert a fixed-dim `jit.matrix @adapt 0 @interp 0` upscaler before the GL consumer.** The naive chain `[small matrix] → [jit.gl.cornerpin] → [jit.world]` produces soft band/cell edges even with `@interp 0` on the cornerpin, because the matrix-to-texture upload happens at the source resolution and GL's bilinear sampling kicks in when the small texture is mapped onto the window quad. Adding a nearest-neighbor upscale to a near-display resolution preempts that: send the small source through `[jit.matrix N type 1 1080 @adapt 0 @interp 0]` (or `1920 1080` for 2D content) so the texture upload happens at display res with pixel-doubled edges, and the GL consumer then samples a texture that's already pixel-aligned to the screen. `@adapt 0` is critical — without it, the upscaler shrinks to match the input dim and the whole purpose collapses. `@interp 0` selects nearest-neighbor for the resize. *For instance:* IMMER v3's bands video runs `[v8 paints 1×480 char] → [jit.matrix 3 char 1 1080 @adapt 0 @interp 0] → [jit.gl.cornerpin @interp 0] → [jit.world]` — without the upscaler, band edges blur over 2–3 screen pixels at 1080p output.
- **`jit.world @enable` defaults to 0 — set `@enable 1` as a creation attribute.** Without an explicit enable, `jit.world` instantiates as a dark, frozen context: attached `jit.gl.*` objects with `@automatic 1` never get banged, and the operator sees nothing. `@sync 1` / `@fps 30` are not substitutes — they control HOW it renders, not WHETHER. The right idiom is a creation attribute on the world: `jit.world MYCTX @enable 1 @sync 1 @fps 30`. Don't bootstrap with a `loadbang → 1` chain — that's plumbing for a problem the attribute already solves, and it leaves the patch in a "looks fine but renders nothing" state if loadbang fires before the world is fully constructed. If the operator needs runtime on/off control, add a separate `[toggle]` wired to the world's left inlet for live overrides — but the default-on belongs in the object box. Confirmed by `jit.world.maxref.xml`: `enable ... Enable automatic rendering (default = 0)`. The same `default = 0` applies to `jit.gl.render` — `jit.world` is just the wrapper.

---

## Patching Layout — Avoiding Cord Tangles

When an object fans out to multiple destinations — for instance, both a processing chain and a display box — check whether placing all destinations at the same y-position will cause cords to cross. If so, stagger the destinations vertically so each incoming cord has a clear path. This is a case-by-case judgment based on the specific layout.

### Signal flow runs top-to-bottom — inputs above, outputs below

Lay every object so the things that feed it sit **above** it and the things it feeds sit **below** it, so cords run downward and the eye reads the patch top-to-bottom. Concretely: a control/message box that drives an object goes ABOVE that object; the object's outlets connect DOWN to displays, routers, and the next stage. Never place a feeder message box *below* the object it feeds — that forces the cord to run upward, which reads as broken or backwards and makes the patch hard to follow even when it works.

The recognition signal: if a `message`/`number`/UI box that is an *input* to some object ends up at a larger `y` than that object, move it above. The only things that belong below an object are its *outputs* (and side-tap monitors). This applies to help files and demos especially, where each object's driving messages should form a column above it and its result displays a column below. (Derived from a help-patch layout where demo messages were placed under the widgets they drove, making the patch read as non-functional.)

---

## Common Pitfalls

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- **`trigger` for sequencing — verify both order and outlet types.** When inserting a `trigger` to enforce execution order between fan-out branches, two errors compound easily: (1) Wrong order — outlets fire right-to-left, so the operation that must happen FIRST goes on the RIGHTMOST argument. Reading `t b l` left-to-right and assuming bang-then-list is the most common pitfall. (2) Type mismatch — each outlet's type comes from its argument letter (`b`=bang, `l`=list, `i`=int, `f`=float, `s`=symbol, `a`=anything). A `bang` outlet wired to an object expecting a list does nothing; a `list` outlet wired to a `message` box uses the list as the trigger, not the content. Verify both: (a) the rightmost arg is the operation that must happen first; (b) each outlet's type matches what its destination consumes. *For instance:* to clear a menu then iterate items into it, use `t l b` — outlet 1 (`b`, fires first) → clear; outlet 0 (`l`, fires second) → iter. Not `t b l`, which would (try to) iter on a bang then clear after, blanking the freshly-populated menu.
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- **Preserve each object's default box size in the patching view — only set a patching-view `size` when there's a concrete reason.** Every object has a default box size Max assigns (the converter mirrors these in `UI_SIZES`); keeping it is what makes objects recognizable and findable when editing the graph. Shrinking or enlarging a UI object's patching-view box for no functional reason makes it hard to locate among the other boxes and misrepresents the graph. Resizing for visual layout is a *presentation-mode* concern: set `presentation_rect` (independent of patching size), not the patching `size`. Reserve a patching-view `size` for cases where the box content genuinely needs it — a `message`/`comment` that must be wide enough to show its full text, a routing object whose text would otherwise clip. Before setting `size` on any object, ask: is this needed in the patching view, or does it belong in `presentation_rect`? *For instance:* shrinking `kslider` boxes in the patching view (as happened in the Zendrum player) gives no benefit and buries them among the other boxes — leave the kslider at its default box size in patching view; if the operator needs a specific on-screen size, that goes in `presentation_rect`.
- `live.gain~` with `"orientation": 1` for horizontal layout
- **`delay 0` is the canonical scheduler trick for "wait for all simultaneous events to settle, then act on them as a group".** A bare `delay 0` (no integer arg) takes a message and pushes it to the very end of the current scheduler tick — no measurable latency, but everything else queued before it gets to land first. Pair with `zl.group N` and `zl.sort` to assemble simultaneous arrivals into one ordered list. *For instance:* sorting MIDI chord notes from low-to-high before output, when Live emits them in press-order — `notein → delay 0 → zl.group N → zl.sort → noteout` produces a sorted chord with effectively zero latency. (Source: Cycling '74 forum, "Sorting Midi Low to High".)
- **`dict.serialize` over UDP creates one Max symbol per serialized string — over time, a streaming dict source floods the symbol hash table and the symbols are never garbage-collected.** RAM grows monotonically until restart. The right path for high-rate dict transmission is OSC, which preserves dict structure natively without symbol creation: `udpsend / udpreceive` carrying OSC, or the third-party `o.pack` (Odot package) for unidirectional dict packing. Reserve `dict.serialize` for one-shot or very low-rate transmissions. (Source: Cycling '74 forum, "how to avoid flooding Max symbol hash table?".)
- **`pattrstorage` supports weighted multi-preset interpolation via `recallmulti <preset> <weight> [<preset> <weight> …]` — weights are auto-normalised across any number of presets.** A common student instinct is to morph between two stored states; `recallmulti` extends this to N-way morphing in one message: `recallmulti 1 0.3 2 0.3 5 0.4` weights preset 1 at 30%, preset 2 at 30%, preset 5 at 40%. The ratio doesn't need to sum to 1 — pattrstorage normalises automatically. For per-element multi-dimensional morphing across multisliders or buffers, `mxj ej.linterp` and `tap.jit.ali` cover the same use case with extra interpolation modes. (Source: Cycling '74 forum, "interpolating between multiple patterns?", Emmanuel Jourdan.)
- **For "hold-until-next-input" semantics — output the previous value when a new value arrives — `bucket` and `zl.reg` are the canonical Max objects.** This is event-state-shifting, not temporal delay. `bucket` is a strict shift register: `bucket 1` outputs the previous value as each new one arrives. `zl.reg` is the more flexible store-one-and-recall register. Time-based objects (`delay`, `pipe`) are the wrong tool — they wait for clock time, not the next input event. (Source: Cycling '74 forum, "Delaying output of number until new number is recieved".)
- **`jit.cellblock` emits the current selection on every selection change — programmatic selection from a parent patch produces output that can re-trigger the parent and create an infinite loop.** When the selection logic and the data-output need to be decoupled, switch UI primitive: the `chooser` object provides "select-an-item" semantics without the data-output coupling. Trying to configure `jit.cellblock` to suppress output on programmatic selection is harder than swapping objects. (Source: Cycling '74 forum, "jit.cellblock - select a cell without getting output".)
- **A message box's RIGHT inlet replaces the box's stored text without triggering output — feed `$1`-template message boxes via the LEFT inlet.** The two inlets are not equivalent. The left inlet both substitutes `$N` arguments AND fires the box's output downstream. The right inlet silently overwrites the body of the message (so `dim 1 $1` becomes whatever was last sent — e.g. the literal `9`) and produces no output at all. Symptom: the downstream consumer receives nothing, AND the next time you open the patch the message box has been mutated to a value that looks like data instead of a template. The fix is per-cord: any `int → message($1-template)` wiring belongs on inlet 0. The general rule is symmetric: when an upstream value needs to BOTH parameterise a message AND trigger its emission, it must arrive at the left inlet. Confirmed by `message.maxref.xml` and reproducible in any patch. *For instance:* `[t b i]` driving a `[dim 1 $1]` formatter — the int outlet wires to inlet 0 of the message box (which substitutes and fires), and the bang outlet fans separately to the downstream object that needs the bang. Mis-wiring the int to inlet 1 produces a silent failure that survives until someone inspects the saved patch's text.
- **Two `jit_matrix` sources fanned into one inlet is a structural conflict — give each matrix source its own dedicated inlet downstream.** Matrices don't mix at an input: each `jit_matrix <name>` message arrives separately and any in-progress processing of the previous matrix is at risk of being clobbered by the next. Even when the downstream object is a `v8` / `js` that *could* internally dispatch by matrix name, the patch's wiring topology is the surface contract — fan-in says "these mix" and matrix sources don't. The right pattern is: bump the downstream object's `numinlets`, route each matrix to a distinct inlet, and let the downstream code distinguish them by the global `inlet` (in v8/js) or by inlet-specific handlers (in gen). The same rule covers `jit.gl.texture` and any other Jitter consumer — one source per inlet. *For instance:* a v8 composing a texture from `jit.noise colors` and `jit.noise widths` declares `inlets = 3` and reads each `jit_matrix` based on which inlet fired, never on the matrix's name. The recognition signal: any time two patchcords carry `jit_matrix` outputs to the same `destination[N]` index, something is wrong — split the destination's inlets first.
- **`messnamed(name, msg, …)` from v8 / js only delivers to `[receive]` objects — NOT to objects with global *names*.** Collections like `coll NAME`, `table NAME`, `buffer~ NAME` use their argument to share data between instances, not to receive messages by that name. `messnamed("MYCOLL", "write", "/tmp/x.coll")` silently disappears — the coll never sees the message. v8's direct wrapper classes (`new Dict(name)`, `new Buffer(name)`, `new JitterMatrix(name)`) work because they read the named data via the C API, not via the message system. For objects without a wrapper (coll, table, multislider, jit.cellblock), the only paths from v8 are (a) `this.patcher.getnamed(<scripting-name>)` — only reaches the v8's own patcher — then `Maxobj.message("write", …)`, OR (b) user-side wiring with an explicit `[receive <NAME>_INSPECT] → [coll <NAME>]` upstream of the target, then `messnamed("<NAME>_INSPECT", ...)`. The recognition signal: any time JS sends a message that produces no observable effect on a Max-side object, the first thing to check is whether the target accepts messnamed at all — silent disappearance is the failure mode. (`c2m_inspect.js` implements exactly this for coll/table: it tries path (a), falls back to path (b), and returns a structured setup error if neither lands data — see `reachNamedWrite`.)
- **`udpreceive <port>` (default mode) natively decodes simple OSC binary into Max messages** with the OSC address as a leading symbol followed by the args — `route /foo/bar` matches directly with no CNMAT dependency. The optional symbol argument (`udpreceive <port> <anysym>`) switches to FullPacket mode for downstream OSC-bundle parsers (`OSC-route`, `o.unpack`, etc.) — needed only for bundles or advanced OSC features. For a flat-address one-way listener, `udpreceive <port>` + `route` is the lightest correct setup. Earlier guidance in `multi-user-template/CLAUDE.md` that "Max 9 has no built-in OSC-to-message parser" is misleading — that's true only for OSC bundles, not for simple OSC messages. (Confirmed by `udpreceive.maxref.xml` and empirically verified with the c2m.inspect OSC pathway.)
- **Max caches abstractions for the session — editing the .maxpat file and reopening the parent does NOT reload the abstraction.** Once an abstraction is loaded into a session, every subsequent instantiation comes from Max's in-memory cache, including freshly-opened parent patches. To pick up edits: close EVERY patch that contains the abstraction (one cached load is enough to keep the stale version pinned), then reopen them — or restart Max. The same applies to external `.js` files used by `v8` / `js` when `autowatch` is NOT set; with `autowatch = 1` in the JS, Max watches the file and reloads when it changes on disk. The diagnostic for "I edited the abstraction but my changes aren't showing" is almost always cache-related, not edit-related — the recognition signal is when the patch behaves as if your file change never happened.
- **`textedit` outlet 0 emits `text <symbol>` by default (`outputmode 0`) — a downstream `[setfoo $1]` captures the literal symbol `"text"`, not the typed value.** The handler runs with the wrong argument and the patch silently misbehaves. Three valid fixes: (a) set `@outputmode 1` on the textedit so the value emits as a bare symbol; (b) insert `[route text]` between textedit and consumer to strip the prefix; (c) skip the textedit entirely and bake the value into a `loadbang`-fired message when it's fixed configuration the user shouldn't be retyping at performance time. The general principle: any Max object whose default output is a *list* (not a bare value) silently breaks `$1`-style capture — verify the output format in the refpage before wiring `$N` against it. (Source: confirmed by `textedit.maxref.xml` `outputmode` description; IMMER v2 cloud-config regression, `Invalid URL: text/mu/...`.)
- **Buttons used as pass-through indicators are inline on the cord, not on a side tap.** When a `button` blinks to show that a bang has reached a stage, wire it inline — `upstream → button → downstream` — not as two parallel cords from the same outlet (`upstream → downstream` AND `upstream → button`). The side-tap approach doubles the cord count and misrepresents the signal flow: the button looks like an independent destination rather than a monitor on the path. The inline approach passes the bang through the button before it continues downstream; one cord in, one cord out, button blinks as normal traffic passes. *Recognition signal*: if two cords leave the same outlet and one terminates only at a `button`, that button belongs inline on the other cord instead.
- **Some objects configure range or defaults via creation args, not `@`-attributes — `list_attributes` is the check.** `counter 0 3` sets the min/max range; `@min 0 @max 3` does not exist and would be silently ignored. `metro 500` sets the default interval; `makenote 100 250` sets default velocity and duration. The symptom is a control that silently uses Max's default range regardless of what was written in the spec. Call `list_attributes(<object>)` before writing attributes — when an attr you expect is absent from the list, check the creation arg text in the refpage instead.
- **The spec `name` field auto-emits a title `comment` at top-left — it overlaps any comment you place at the top of the patch.** `spec2maxpat.py` renders the spec's `name` as a title comment near `[50, 15]` in the patching view. If the spec also defines its own header/instruction comment at the top, the two overprint into an unreadable smear. Two fixes: (a) omit `name` when you supply your own top comment (recommended — the patch filename already shows in Max's title bar), or (b) keep `name` and place your first comment below the title band (`y ≳ 40`). This is the same "don't add a comment that just restates the patch name" guidance from the presentation rules, but the failure here is *overlap*, not just redundancy. (Confirmed by inspecting generated `.maxpat` geometry: title `[50,15,400,24]` colliding with a `[20,16,520,40]` instruction comment.)

---

## Presentation View Design Principles

These principles represent the preferred aesthetic and UX approach for Max presentation views. Read and treat as a checklist before starting any presentation layout.

### Action prominence hierarchy
Size communicates priority — the most-used controls must be the largest, most visually dominant elements. Secondary controls are smaller and subordinate. Never give all controls equal visual weight; the user's eye should land on the most important control first without scanning.

### Prefer a labeled message box over a button + comment for one-shot actions
For an operator-facing action the user clicks (save, load, clear, reset, recall, trigger), use a **`message` box whose text is the action's label** rather than a `button` paired with a separate `comment`. The message box combines both jobs — it is the clickable affordance AND it reads as a word ("save", "load"), so it self-documents and takes one object instead of two. A bare `button` is a blank bang with no indication of what it does; labelling it then requires an adjacent comment, which is two objects to place, align, and keep in sync for what a single message box does cleanly.

If the downstream consumer needs a bare `bang` rather than the message's symbol, route the message through `[t b]` (trigger bang) — that conversion is hidden plumbing; the operator still sees and clicks the labelled message. Reserve a `button` for cases where the *blinking bang indicator* itself is the point (monitoring traffic on a cord) — there the button is a display, not a labelled action. (Derived from the Zendrum bank UI: `save`/`load` message boxes replaced button+comment pairs.)

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

### Comment width is user-set; height is automatic — never override either independently

Max `comment` objects auto-wrap text based on the box's width (`patching_rect[2]`). Height (`patching_rect[3]`) is computed automatically by Max from the width and the wrapped content — it is **not** an independent dimension.

**In a spec:** set only `size[0]` (width). Do not record or hard-code a height. If a comment overflows its layout area, narrow `size[0]` — do not add explicit `\n` line breaks, since auto-wrap is the correct mechanism.

**Sync caveat:** `sync_spec` in `spec2maxpat.py` currently captures `pos` from the live `patching_rect` but does **not** capture `size` (width/height). This means if a user narrows a comment in Max, that width change is silently dropped on the next sync, and the next `convert` writes the old wide width back. Until this is fixed, manually update `size[0]` in the spec after syncing if a comment width was changed in Max.

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
