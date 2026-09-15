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

## Max .maxpat Internals {!core}

- **Z-order**: In the `boxes` array, **later items draw on top** (in front); earlier items sit behind. To put an object visually on top of others — a transparent button over a comment — declare it *after* them. Panels are kept behind by `background: 1` (the background layer), not by array position. Corrected 2026-09-09: this bullet used to say the opposite, and the shootouts' title buttons were declared before their comments and never received a click. The evidence is John's observation in reverb-shootout (2026-09-08): a panel declared *after* its section's controls painted over them.
- **@bubbleside** (comment bubble arrows): `0=top, 1=left, 2=bottom, 3=right`. The arrow appears on that side of the comment, pointing outward. Use `"bubble_bgcolor"` (not `"bgcolor"`) for bubble background color.

---

## Patcher Tabs — Several Patches in One Window {!core}

Max can show subpatchers as tabs of their parent window. It is a patcher-level feature, not an object, and it is how every Cycling '74 help file is built (the `basic` and `?` tabs of `metro.maxhelp` are two `p` boxes in the help file's root). The mechanics, read from shipped files and the `thispatcher` refpage (2026-09-12):

- **A `p` box becomes a tab when its inner patcher dict carries `showontab: 1`.** The tab's title is the subpatcher's name, the text after `p`; a name with spaces is quoted, `p "1 Key sends"`, exactly as `p "all messages"` in `jit.avc.maxhelp`. Tabs appear in box order.
- **The root patcher carries `showontab` and `showrootpatcherontab`.** With `showrootpatcherontab: 0` the parent itself is not a tab and the window shows only the subpatcher tabs; help files ship both keys at 0 on the root. Set `showrootpatcherontab: 1` when the parent has content of its own to show.
- **Each tab is an ordinary patcher**, with its own patching view, presentation view, `openinpresentation`, rect, and lock state. A tab that opens in presentation shows its controls; unlock and leave presentation to see its wiring.
- **`thispatcher setactivetab <name>`** switches to the tab whose subpatcher has that name (refpage: "the active tab may be changed by passing the setactivetab message followed by the name of the subpatcher as displayed on the tab itself").
- **In a Claude2Max spec** the keys travel in `patcher_extras`: `"patcher_extras": {"showontab": 1}` on a `p` box's `patcher` sub-spec, and `{"showontab": 0, "showrootpatcherontab": 0}` on the root. `convert` writes them; `sync` mirrors them back, on the root and inside each nested sub-spec. A tab subpatcher with no `inlet` / `outlet` boxes should declare `"inlets": 0, "outlets": 0, "outlettype": []`, or the converter gives the `p` box one of each.
- **Not the same thing as the `tab` / `live.tab` objects.** Those are selectors inside one view. The rule that separates the two is `CLAUDE.md` > *Several Views in One Window: Patcher Tabs, Not bpatchers*.

For instance: `what_is_midi_for_max.maxpat` (John's Brooklyn College MIDI examples) is a root with ten `p "<n> <name>"` boxes, each inner patcher `showontab: 1`, root `showrootpatcherontab: 0`; opening it shows a ten-tab window and nothing else.

## Max Patching Principles {!core}

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

This is owed only when the control's default state is not the state the patch should start in, or when nothing downstream carries the value itself. A toggle that should start off needs no `loadmess 0`: a toggle starts off and sends nothing until it is clicked. A number box whose only destination already holds the value as a creation argument (`[+ 12]`, `[metro 250]`) needs no `loadmess` either; the argument is the initial state, and the box exists to change it later. Adding an init object in those cases duplicates behavior the patch already has (see `CLAUDE.md` > *Don't Add an Object That Duplicates What an Object Already in the Patch Does*). The verifier's `control-init-on-load` style note still fires on such controls; treat it as a prompt to check, not as an order to add a `loadmess`.

---

### Signals sum at an inlet — do not add `+~` to mix them — Binding Rule {!core}

Every signal cord that lands on the same signal inlet is added there. The `+~` refpage states it for its own inlets — "All signal inputs to a single inlet are summed" — and it holds for every MSP object, including `s~`, `*~`, `selector~` inputs, `dac~` / `ezdac~` and `record~`. So a `+~` whose only job is to combine two or more signals before the next object is an extra box, an extra cord, and a wrong lesson for a student (that mixing needs an object). Run the cords straight into the destination. Keep `+~` for what it does that summing at an inlet cannot: adding a constant (`+~ 0.5`), or a sum the patch needs as its own named signal for more than one destination. This is the signal-rate case of *Don't Add an Object That Duplicates What an Object Already in the Patch Does* (CLAUDE.md). For instance: reverb-shootout's source bus uses seven `+~` boxes (`sumA_L/R`, `sumB_L/R`, `mono_sum`, `outL/R`) to combine the player, the live input and the test signals, and the wet and dry paths — every one can go, with the cords landing on `s~ SRC_L` / `s~ SRC_R`, `*~ 0.5` and `live.gain~` directly. (John, 2026-09-08.)

### Live input always has a mute, and it loads muted — Binding Rule {!core}

Any patch that takes sound from a microphone or line input (`ezadc~`, `adc~`, `mc.adc~`) gives that input its own mute in the presentation — a `toggle` labelled *live in* driving a `*~` (0 / 1) or a `gate~` on the input's signal — and the mute is **closed when the patch opens**. `ezadc~`'s own button is not a mute: it switches the whole DSP chain on and off, and once audio is on the microphone is live, into whatever the patch does with it — reverb tails, feedback into a room, a recording. An open microphone with no switch is the one thing a student cannot see coming and cannot undo quickly. The default is muted because the operator can always open it deliberately; the reverse costs a feedback howl. Initialise it the way every control is initialised — the toggle starts at 0 and a `loadmess 0` is not needed (*Don't Add an Object That Duplicates…*). Mark it in the presentation next to the input object. For instance: reverb-shootout's `ezadc~` sums straight onto the source bus, so the room's microphone is in the reverb the moment DSP starts. (John, 2026-09-08.)

## Max Patching Knowledge

- **Sub-Hz `cycle~` is the canonical slow LFO.** `cycle~` accepts arbitrary float frequencies down through fractional Hz: `cycle~ 0.11` (one cycle every ~9 seconds), `cycle~ 0.31` (~3 s). No need to pre-scale, build LFO-from-`line~` chains, or reach for `phasor~ + lookup~`. Useful for very slow modulation of volume, filter cutoff, panning. Keep `cycle~` (signal-rate) when modulating a signal-rate parameter; only step down to control-rate (`cycle~ 0.11 → snapshot~ 50`) when feeding a control-only destination. (Source: `!SHAKE!` (Vinczius), 2026-05-03 c74 projects analysis.)
- **For perceptually-linear amplitude fades, use a dB-mapped slider with a `select 0 → 0.` short-circuit at the silence end.** A linear slider mapped to amplitude sounds drastic at the bottom and underwhelming at the top — human loudness is closer to logarithmic. The cookbook pattern: `slider 0..-60 → dbtoa → number/line~ → *~`, with a `sel -60 → 0.` branch that forces literal silence at the bottom (because `dbtoa(-60dB)` ≈ 0.001, audibly soft but never zero). For a one-object replacement, **`gain~` does all of this internally** (dB-mapped UI + interpolation + true-silence handling) and is the right answer for any volume control unless you specifically need raw `*~` access. (Source: Max Cookbook MSP envelope chunk.)
- **The poly~-ready abstraction template uses BOTH `inlet`/`outlet` AND `in N` / `out~ N` / `in~ N`** — the same patch then works as a regular subpatch (loaded via `p`) OR as a `poly~` voice without modification. A `p` parent reads the `inlet`/`outlet` boxes; a `poly~` parent reads the `in`/`out`/`in~`/`out~` boxes. Wire both to whatever serves the same data inside the abstraction so either parent receives the same behavior. Equally important: every `inlet`/`outlet` carries an explicit `comment="(<type>) <description>"` attribute (e.g. `comment="(float) peak amplitude"`, `comment="(signal) FM tone"`) which surfaces as a tooltip in the parent's Inspector. (Confirms the existing CLAUDE.md inlet/outlet labeling rule as standard Max practice. Source: Max Cookbook `subpatch-suitable-use-poly` / `FMsynth~.maxpat`.)
- Use `loadmess` → `unpack` to distribute multiple init values to separate controls on patch load.
- When a source produces stereo output, preserve both channels through the entire chain to `dac~`/`ezdac~`. Don't merge to mono. `live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).
- Set patcher `width` and `height` large enough to contain all objects without scrolling, including info comments. Leave margin below the lowest object.
- `dialog` object (text-input prompt): `inlets=2, outlets=3`. Outlet 0 outputs the entered text as a symbol. Use `route symbol` after it to filter for the symbol type; then `prepend parsetarget` (or similar) to route to a v8 handler.
- **`playlist~` is a UI object, not a `newobj` — `maxclass: "playlist~"`, 1 inlet, 5 outlets.** In a spec write `"type": "playlist~"` with an explicit `size`; it is not in the converter's `MAXCLASS_DEFAULTS` or `UI_SIZES`, so also supply `inlets: 1, outlets: 5, outlettype: ["signal", "signal", "signal", "", "dictionary"]`. Outlets 0–1 are the two audio channels (stereo by default — `@channelcount` sets how many, and changing it clears the clip list), outlet 2 is a signal carrying the playback position (its integer part is the index of the playing clip), outlet 3 emits `start N <clipname>` / `done N <clipname>`, and outlet 4 emits a dictionary in response to `getcontent`. Because it is a UI object it draws a waveform per clip and **accepts dragged audio files directly** — put it in the presentation view so the operator can drop files on it. Messages: `append <path> [<slot>]` adds a file (a bare `append` with no args opens a file chooser when clicked in a locked patcher), `clear` removes every clip, `remove <n>` removes one, `next` plays the next clip. **`int` indexes clips from 1, and `0` stops playback** — so a random clip picker is `random <n>` → `+ 1`, and a stop affordance sends `0`. (Verified against `msp-ref/playlist~.maxref.xml` and 34 `playlist~` boxes across Max's shipped help patches, all unanimous on 1 inlet / 5 outlets. An earlier version of this bullet said `outlets=3 (sig audio, sig position, int state)`, and `SPEC_REFERENCE.md`'s commonly-wrong-outlet-count table listed 3 as correct with 5 as the mistake — both were backwards.)
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

## Patching Layout — Avoiding Cord Tangles {!layout}

When an object fans out to multiple destinations — for instance, both a processing chain and a display box — check whether placing all destinations at the same y-position will cause cords to cross. If so, stagger the destinations vertically so each incoming cord has a clear path. This is a case-by-case judgment based on the specific layout.

### `join` / `unjoin`, not `pack` / `pak` / `unpack`

`join @triggers -1` is `pak`: the refpage says `triggers` set to `-1` "will cause the object to trigger output for any inlet (all inlets will be 'hot')," and C74's `join.maxhelp` ships `join 3 @triggers -1`. `join` alone is `pack`. `unjoin` is `unpack`, and both take untyped items so no per-slot type declaration is needed. See the binding rule in `CLAUDE.md`.

Two counts to get right:

- **`unjoin <n>` has n+1 outlets.** The refpage's `outlets` arg "specifies the number of outlets (in addition to the rightmost outlet, which is always present)," so `unjoin 3` splits into three groups **plus** a remainder outlet. `@outsize` (default 1) sets the items per group. A spec that declares three outlets for `unjoin 3` is wrong; the converter now derives n+1 itself.
- **`join <n>`'s arg is the inlet count, not initial values.** `pak 4000 8001` stored those numbers as its slots' starting values; `join` starts every slot at `int 0`. When the old `pak` args were carrying a meaningful default, move that default to a `loadmess` or to the downstream object's creation args — don't let it evaporate in the substitution.

### `random`'s `@range` high value is exclusive

`random @range <lo> <hi>` generates values from `lo` up to **`hi` minus one** for an int range, and arbitrarily close to but below `hi` for a float range. This is C74's own wording in `random.maxhelp`: "max of float range is arbtirarily close to range high value but for an int range it is one less than the high value," on a patch whose `random @range 25 50` is labelled "output for these objects will both be between 25 and 49."

So any range that must **include** its top value is written with the top plus one. Picking one of N clips indexed from 1 is `random @range 1 <N+1>` — write the `+ 1` once where N is computed, not inside each consumer. Set the range at runtime with a `range <lo> <hi>` message to the left inlet (the refpage marks the attribute `set="1"`, and `range $1 $2` message boxes appear in C74's shipped patches).

The general lesson, and the reason this bullet exists: **replacing an adapter chain with an attribute is not a mechanical substitution — the endpoints have to be re-verified.** The `scale 0 999 4000 8000` this replaced was itself off by one at the top, so the bug survived the rewrite until the help patch was read.

### Leave enough vertical space under a box for its cords to read as cords

A cord needs visible length. When a box sits almost flush under the one that feeds it, the cord between them collapses to a few pixels: you cannot see which outlet it leaves or which inlet it enters, you cannot click it to select or delete it, and a reader scanning the patch sees two stacked boxes with no visible relationship. The connection is technically drawn and practically invisible.

**Leave roughly 30px of clear space between the bottom of a box and the top of the box it feeds** — the converter's own auto-layout uses a 55px row pitch, which is about 33px of gap for a standard 22px-tall box. Give more where several cords converge on one destination, where a cord crosses from one functional region to another, or where the source box is tall (a `live.gain~`, a `playlist~`, a `panel`), since a tall box makes a short gap look tighter than it is.

For instance: `[live.gain~]` (30px tall) at y=728 with `[s~ MIX_L]` / `[s~ MIX_R]` at y=772 leaves 14px — the two cords out of the gain are barely visible as cords. Moving the `s~` row well below the gain's patching rect makes both readable at a glance.

**This matters more now than it used to.** Under the retired hide-plumbing rule, a cramped region could be tidied by hiding its cords. Every cord is visible now, so the layout is the only tool left — spacing is not cosmetic, it is what makes the visible graph legible. See *Never Hide Patchcords or Boxes* in `CLAUDE.md`.

**A straight vertical drop inside a column is the exception.** When two boxes are stacked with their left edges aligned and the cord runs straight down from outlet 0 to inlet 0, the cord reads as "this feeds that" at any length, and a compact column is easier to follow than one spread out to make each cord long. The ~30 px clearance is for cords that travel sideways. The verifier's `cord-too-short` check exempts aligned drops. For instance: John's parameter columns in reverb-shootout (2026-09-08) stack an init message, a `flonum` and a parameter message 8 px apart, one column per parameter.

### `@triggers -1` is only needed when the inputs arrive independently

`join @triggers -1` (like `pak`) exists to solve one problem: inlets that receive their values at unrelated times, where waiting for the leftmost inlet to fire would leave the output stale. **When a single upstream multi-outlet object feeds every inlet, that problem does not exist** — Max outputs right to left, so the cold inlets are already loaded by the time the hot one fires, and a plain `join` is correct. The attribute then adds nothing but a claim the reader has to check.

For instance: `[unjoin 3]` feeding `[join]`'s two inlets from its outlets 0 and 1 needs no `@triggers` — outlet 1 lands in the cold inlet first, outlet 0 fires the hot inlet second, and the output carries both. Reach for `@triggers -1` when the inlets are fed from genuinely separate sources (two `r` objects, two UI controls the operator touches independently).

Note where the guarantee comes from: right-to-left output is Max's universal convention — `trigger`'s refpage documents it in so many words ("Outputs any input received in order from right to left") and Max files the object under a "Right-to-Left" category — but `unjoin`'s and `unpack`'s own refpages do not restate it. It is a language rule, not a per-object promise.

### Lay fan-out destinations out right-to-left, in execution order

Max fires a `trigger`'s outlets **right to left**, and likewise fires multiple cords leaving a single outlet right to left. Place the destinations so their left-to-right position on screen matches that order: **the destination that fires first sits furthest right.** Then the cords fan out without crossing, and the crossing pattern stops lying about the order.

This is purely a readability rule — the patch behaves identically either way — but the failure it prevents is real. A reader who sees `[t i i]` with its right outlet cabled left and its left outlet cabled right has to trace two crossing cords to recover an ordering that a correct layout would have shown at a glance. Ordering is the entire reason `trigger` exists; a layout that obscures it defeats the object.

For instance: `[toggle] → [t i i]` where outlet 1 broadcasts the run state and outlet 0 drives a `[select 0]` stop-cleanup. Outlet 1 fires first, so `[s RUN]` belongs on the **right** and `[select 0]` on the left. Wired the other way the cords cross, and the patch reads as though the cleanup happens before the broadcast.

The recognition signal: **any time two cords leaving one object cross each other, that crossing is telling you the destinations are in the wrong horizontal order.** Swap them rather than routing around them.

### A cord that runs past objects it does not connect becomes `s` / `r` — rule of thumb

A patchcord is readable when everything it passes over is part of the relationship it draws. The moment a cord runs vertically through a region of other logic — boxes it neither leaves nor enters — it stops documenting a connection and starts obscuring the objects under it: the reader can no longer tell which cords belong to that region, and the region reads as more tangled than it is. So the rule of thumb is: **if a cord's vertical span crosses boxes it does not connect, replace it with a `[s NAME]` under the source and a `[r NAME]` above the destination.** Keep a cord when it is short and local — a box wired to the box directly under it — because seeing that cord is what tells the reader the two are one chain. Apply this to control cords exactly as to signal cords (the `s~` / `r~` section below is the signal case of the same judgment). The check is geometric and can be done from the spec: for each connection, does the rectangle spanned by its two endpoints overlap any third box? If yes, that cord is a candidate. *For instance:* the kslider-restrike patch put its `plug` and `open` message boxes at the top and wired them straight down to `vst~` near the bottom; the two cords ran through the kslider, `join`, and `midiformat` region and made the whole middle of the patch harder to read. `[s VST]` under the two messages and `[r VST]` above `vst~` removes both cords with no change in behavior.

### Use `s~` / `r~` where a signal cord would cross the patch

Signal connections follow the same judgment as control connections: a **short local cord stays a cord**, because seeing it is what tells the reader those two objects are one chain (`[playlist~] → [live.gain~]` sitting directly under it should be wired, not sent). A cord that would run across the patch — from one functional region to another, or from four scattered voices into one mixer — becomes `[s~ NAME]` / `[r~ NAME]`.

Two facts that make this work, both from the `send~` / `receive~` refpages: **multiple `send~` objects sharing a name sum into the matching `receive~`** ("When two or more send~ objects are aimed at the same receive~ object, the signals add together"), so a four-voice stereo mix bus is one `s~` pair per voice and one `r~` pair at the master — no summing objects, no fan-in tangle. And the refpages state the short forms directly: `send~` "can be instantiated simply by typing into an object box the short-form letter `s~`", same for `r~`.

Note the refpage caveat: `send~` / `receive~` can introduce a small, variable signal delay. Irrelevant for mixing independent voices; think twice inside a feedback path or anywhere phase between two branches matters.

### A send/receive name is a channel, not a wire — repeat the sender instead of stretching a cord

`s NAME` is not one endpoint of a connection; it is a publisher on a named channel, and a patch may hold **as many senders on that channel as it has sources**. So when a second part of the patch needs to put something on a channel that already exists, **put a new `s NAME` directly under that source** rather than running a cord across the screen to the existing one. The duplicate costs one small box in a place the reader is already looking. The long cord costs a line traversing unrelated regions of the patch, which every future reader has to trace to find out it was just going to a sender.

The refpage is explicit that this is the intended model: "All send objects that share the same name will send data to any receive objects that share their name" — many-to-many, in any combination. It is idiomatic in C74's own material, too: `jit.anim.path.maxhelp` ships **nine** `send topath` objects in a single patch.

For instance: `[select 0] → [0(` sits in the transport column on the far left, and the sounds column already has an `[s SOUNDS]` about 600px to its right. Wiring the `0` message to that existing sender drags a cord across the whole patch. A second `[s SOUNDS]` placed just under the `0` message says the same thing locally, and the transport column becomes readable on its own.

The same reasoning covers `r NAME` (any number of receivers) and `s~` / `r~` — where multiple senders additionally **sum**, which is what makes a mix bus one `s~` pair per voice.

**The one thing duplicate senders do not give you is order.** The refpage: "The order of reception by two or more receive objects is not deterministic." So use as many senders as the layout wants, but never rely on which `r NAME` fires first — when order matters, wire it explicitly with a `trigger` (and lay it out right-to-left, per the rule above).

### Write `send` / `receive` in their short forms

Write `s`, `r`, `s~`, `r~` — never the long forms. They are the same objects (the short names are documented aliases, not slang), and the short box is narrower, which matters when a patch carries twenty of them. Name the destination in ALL CAPS as usual: `[s RUN]`, `[r NCLIPS]`, `[s~ MIX_L]`.

### Signal flow runs top-to-bottom — inputs above, outputs below

Lay every object so the things that feed it sit **above** it and the things it feeds sit **below** it, so cords run downward and the eye reads the patch top-to-bottom. Concretely: a control/message box that drives an object goes ABOVE that object; the object's outlets connect DOWN to displays, routers, and the next stage. Never place a feeder message box *below* the object it feeds — that forces the cord to run upward, which reads as broken or backwards and makes the patch hard to follow even when it works.

The recognition signal: if a `message`/`number`/UI box that is an *input* to some object ends up at a larger `y` than that object, move it above. The only things that belong below an object are its *outputs* (and side-tap monitors). This applies to help files and demos especially, where each object's driving messages should form a column above it and its result displays a column below. (Derived from a help-patch layout where demo messages were placed under the widgets they drove, making the patch read as non-functional.)

---

### Parallel parameter chains: one column per parameter, shared receive above, shared send below {!layout} {!core}

When several controls each go through the same short chain — an init value, a `flonum`, a formatter message — to one destination, lay them out as **columns**, one per parameter, with the boxes of each chain stacked and left-aligned, the columns side by side, a single shared source above them and a single shared collector below. The reader sees one grid: rows are stages, columns are parameters, and every cord is a straight drop. What not to do is the spread-out version — each chain 80 px from the next with its own receive, and every formatter running a long diagonal into one inlet — which is wider than the screen and reads as a tangle.

- **One `r NAME` above the grid, fanning into each column's first box**, instead of one receive per column: the fan-out is the only sideways cord in the block, and it says "these all start together".
- **One `s NAME` below the grid collecting every column's last box**, and one `r NAME` at the destination, instead of N cords converging on one inlet — *A cord that runs past objects it does not connect becomes s / r*.
- **Rows ~30 px apart, columns ~100 px apart**; the vertical cords may be short (see the cord-spacing exception above).
- The presented control in each column (the `flonum`) keeps its own presentation rect; the column is a patching-view arrangement.

For instance: reverb-shootout's AU-Matrix pane after John rebuilt it in Max (2026-09-08): `r AU1_INIT` above, five columns (`0` / `1.` / `0.72` / `0.51` / `0.515` → `toggle` / `flonum` → `bypass $1` / `"Dry/Wet Mix" $1` / …), `s TO_VST` below, `r TO_VST` into the `vst~` — 20 boxes in a 420 × 190 block that used to take 700 × 700.

## Common Pitfalls {!core}
- **Send a number as a bare number — never as `int 60` or `float 55.5` typed into a message box.** A message box is the form the data takes on a real cord, so it must carry the message a real source would send: `notein`, a number box, `counter`, a `v8` outlet all emit a bare number, and Max dispatches a bare number to a JavaScript `msg_int` / `msg_float` (JavaScript guide > *Special Functions*). `int 60` is a different message, a symbol `int` with an argument, which Max routes to a function named `int` and which nothing in a patch ever produces. A demo built from that form tests a path no patch takes, and passes while the real path is broken. The same holds for every typed spelling of a value a cord carries bare (`list 1 2 3` where a plain `1 2 3` is meant, `symbol foo` where `foo` is meant, `bang` typed where a `button` belongs): write what the cord carries. For instance, the butter_keys bench sent `int 52` and `float 55.5` and passed two review rounds; `butter_keys.js` had no `msg_int`, so no note from `notein` ever lit a key. Found 2026-09-12; rule stated by John. When a script must accept both forms, define `msg_int` / `msg_float` and let `int` / `float` forward to them, but the *patch* still sends the bare number.
- **Patcher tabs are patcher keys, not an object.** A window shows a subpatcher as a tab only when the `p` box's inner patcher dict carries `showontab: 1`; there is no `tab` box involved, and no attribute on the `p` box itself. The root needs `showrootpatcherontab` set on purpose (0 hides the parent, as every help file does). In a spec both travel in `patcher_extras`. A tab subpatcher with no `inlet` / `outlet` boxes must declare `"inlets": 0, "outlets": 0, "outlettype": []`, or the converter gives the `p` box one inlet and one outlet it does not have. Full mechanics: *Patcher Tabs — Several Patches in One Window*, above; when to use them versus a `tab` / `live.tab` selector: `CLAUDE.md` > *Several Views in One Window: Patcher Tabs, Not bpatchers*.

- `multislider` `fetch N` outputs from **outlet 1** (right), not outlet 0. A single int sent to a `multislider` sets all sliders to that value.
- **`gate` vs `switch` — names mean the opposite of what they sound like.** `gate N` is a *distributor*: one data inlet routed to one of N outlets. `switch N` is a *selector*: one of N data inlets routed to a single outlet. Use `gate` when you have ONE source and want to send it to different destinations; use `switch` when you have N sources and want to monitor/route one at a time. `gate N 2` sets outlet 2 open at load; `0` closes all outlets. Both pass all message types.
- `gate N`: inlet 0 = open/close control, inlet 1 = data input
- **`select` with float values from UI requires `@fuzzy`** — A dial or slider emits long floating-point values like `0.14999999…` due to floating-point representation. `select 0.15` will miss these silently. Add `@fuzzy 0.001` whenever using `select` with float values from UI sources. (Confirmed by `select.maxhelp`.)
- **`sprintf symout` for single-symbol output** — Plain `sprintf %s%s` outputs a *list* (two space-separated symbols), not a single concatenated symbol. When building file paths, OSC addresses, or any string that must arrive as one atom: use `sprintf symout %s%i` — the `symout` first arg makes the output a single joined symbol. Without it, a path with a space in it silently splits into a list at the downstream handler.
- **`slide~` times are in samples, not milliseconds.** `slide~ 1000 1000` gives ~23ms at 44100 Hz (1000/44100 × 1000 ≈ 23ms), not 1 second. To get N ms of smoothing: `samples = N_ms × samplerate / 1000`. This affects portamento, envelope-follower decay, and any smoothing filter built with `slide~`.
- `trigger` / `t` fires outlets **right-to-left** — rightmost outlet fires first
- **`trigger` for sequencing — verify both order and outlet types.** When inserting a `trigger` to enforce execution order between fan-out branches, two errors compound easily: (1) Wrong order — outlets fire right-to-left, so the operation that must happen FIRST goes on the RIGHTMOST argument. Reading `t b l` left-to-right and assuming bang-then-list is the most common pitfall. (2) Type mismatch — each outlet's type comes from its argument letter (`b`=bang, `l`=list, `i`=int, `f`=float, `s`=symbol, `a`=anything). A `bang` outlet wired to an object expecting a list does nothing; a `list` outlet wired to a `message` box uses the list as the trigger, not the content. Verify both: (a) the rightmost arg is the operation that must happen first; (b) each outlet's type matches what its destination consumes. *For instance:* to clear a menu then iterate items into it, use `t l b` — outlet 1 (`b`, fires first) → clear; outlet 0 (`l`, fires second) → iter. Not `t b l`, which would (try to) iter on a bang then clear after, blanking the freshly-populated menu.
- `makenote` needs pitch on inlet 0, velocity on inlet 1, duration on inlet 2
- For MIDI synths in Max: `makenote` → `pack` → `midiformat` → synth object
- **`pack` / `unpack` / `pak` must be told the type of every slot — `unjoin` must not.** For the joining/splitting trio, the element *types* come from the creation arguments, and an unspecified slot silently defaults to **int**: a bare `unpack` (or `pack`/`pak`) is `unpack 0 0` — two int slots — so a float arriving there is truncated to an integer and a symbol/list is mishandled, with no error. Always write the slots explicitly, by example value or by type letter: `unpack 0 0.` (int, float) or `unpack i f` / `pack 0. 0. s` etc. `unjoin` is the opposite case — it only *groups* a list and is configured by **number of outlets**, never by element type; it passes each group through untouched, so there is nothing to type and nothing to truncate. The general principle: any object whose creation args set per-slot *types* (pack/unpack/pak, and `route`/`sel` where the args are match values) silently degrades data when a slot's type is left to default — be specific; objects that only reshape/group a list (`unjoin`, `zl.*`) carry no per-slot type and need no such care. (Confirmed by `pack.maxref.xml`: "If there are no arguments, the object will be created with two inlets, and the two list elements will be set to (int) 0 initially"; and `unjoin.maxref.xml`, configured solely by "Number of outlets".)
- `ezdac~` and `gain~` are their own maxclass types, not `newobj`
- **Preserve each object's default box size in the patching view — only set a patching-view `size` when there's a concrete reason.** Every object has a default box size Max assigns (the converter mirrors these in `UI_SIZES`); keeping it is what makes objects recognizable and findable when editing the graph. Shrinking or enlarging a UI object's patching-view box for no functional reason makes it hard to locate among the other boxes and misrepresents the graph. Resizing for visual layout is a *presentation-mode* concern: set `presentation_rect` (independent of patching size), not the patching `size`. Reserve a patching-view `size` for cases where the box content genuinely needs it — a `message`/`comment` that must be wide enough to show its full text, a routing object whose text would otherwise clip. Before setting `size` on any object, ask: is this needed in the patching view, or does it belong in `presentation_rect`? *For instance:* shrinking `kslider` boxes in the patching view (as happened in the Zendrum player) gives no benefit and buries them among the other boxes — leave the kslider at its default box size in patching view; if the operator needs a specific on-screen size, that goes in `presentation_rect`.
- `live.gain~` with `"orientation": 1` for horizontal layout
- **`delay 0` is the canonical scheduler trick for "wait for all simultaneous events to settle, then act on them as a group".** A bare `delay 0` (no integer arg) takes a message and pushes it to the very end of the current scheduler tick — no measurable latency, but everything else queued before it gets to land first. Pair with `zl.group N` and `zl.sort` to assemble simultaneous arrivals into one ordered list. *For instance:* sorting MIDI chord notes from low-to-high before output, when Live emits them in press-order — `notein → delay 0 → zl.group N → zl.sort → noteout` produces a sorted chord with effectively zero latency. (Source: Cycling '74 forum, "Sorting Midi Low to High".)
- **`dict.serialize` over UDP creates one Max symbol per serialized string — over time, a streaming dict source floods the symbol hash table and the symbols are never garbage-collected.** RAM grows monotonically until restart. The right path for high-rate dict transmission is OSC, which preserves dict structure natively without symbol creation: `udpsend / udpreceive` carrying OSC, or the third-party `o.pack` (Odot package) for unidirectional dict packing. Reserve `dict.serialize` for one-shot or very low-rate transmissions. (Source: Cycling '74 forum, "how to avoid flooding Max symbol hash table?".)
- **`pattrstorage` supports weighted multi-preset interpolation via `recallmulti <preset> <weight> [<preset> <weight> …]` — weights are auto-normalised across any number of presets.** A common student instinct is to morph between two stored states; `recallmulti` extends this to N-way morphing in one message: `recallmulti 1 0.3 2 0.3 5 0.4` weights preset 1 at 30%, preset 2 at 30%, preset 5 at 40%. The ratio doesn't need to sum to 1 — pattrstorage normalises automatically. For per-element multi-dimensional morphing across multisliders or buffers, `mxj ej.linterp` and `tap.jit.ali` cover the same use case with extra interpolation modes. (Source: Cycling '74 forum, "interpolating between multiple patterns?", Emmanuel Jourdan.)
- **For "hold-until-next-input" semantics — output the previous value when a new value arrives — `bucket` and `zl.reg` are the canonical Max objects.** This is event-state-shifting, not temporal delay. `bucket` is a strict shift register: `bucket 1` outputs the previous value as each new one arrives. `zl.reg` is the more flexible store-one-and-recall register. Time-based objects (`delay`, `pipe`) are the wrong tool — they wait for clock time, not the next input event. (Source: Cycling '74 forum, "Delaying output of number until new number is recieved".)
- **`jit.cellblock` emits the current selection on every selection change — programmatic selection from a parent patch produces output that can re-trigger the parent and create an infinite loop.** When the selection logic and the data-output need to be decoupled, switch UI primitive: the `chooser` object provides "select-an-item" semantics without the data-output coupling. Trying to configure `jit.cellblock` to suppress output on programmatic selection is harder than swapping objects. (Source: Cycling '74 forum, "jit.cellblock - select a cell without getting output".)
- **A message box's RIGHT inlet replaces the box's stored text without triggering output — feed `$1`-template message boxes via the LEFT inlet.** The two inlets are not equivalent. The left inlet both substitutes `$N` arguments AND fires the box's output downstream. The right inlet silently overwrites the body of the message (so `dim 1 $1` becomes whatever was last sent — e.g. the literal `9`) and produces no output at all. Symptom: the downstream consumer receives nothing, AND the next time you open the patch the message box has been mutated to a value that looks like data instead of a template. The fix is per-cord: any `int → message($1-template)` wiring belongs on inlet 0. The general rule is symmetric: when an upstream value needs to BOTH parameterise a message AND trigger its emission, it must arrive at the left inlet. Confirmed by `message.maxref.xml` and reproducible in any patch. *For instance:* `[t b i]` driving a `[dim 1 $1]` formatter — the int outlet wires to inlet 0 of the message box (which substitutes and fires), and the bang outlet fans separately to the downstream object that needs the bang. Mis-wiring the int to inlet 1 produces a silent failure that survives until someone inspects the saved patch's text.
- **A readout message box takes its value on the RIGHT inlet — never add `prepend set` in front of it.** The right inlet of a `message` box replaces the box's contents without output, which is exactly what a display wants; that is the corollary of the previous bullet. Putting `[prepend set]` between the source and the box's left inlet does the same job with one more object and one more cord, and it reads as if the box were part of the logic. The general form: before adding a formatter object, check whether the destination already has an inlet or message that accepts the value as-is (the same instinct as *Prefer an Object's Own Attribute Over an Adapter Chain* in `CLAUDE.md`). Keep `set` for cases where a `message` needs to *receive* it as a message, e.g. through a `[s]`/`[r]` pair or from JS `outlet(n, "set", …)`. *For instance:* the kslider-restrike readout was `v8 → [prepend set] → message(left inlet)`; `v8 → message(right inlet)` is the whole job.
- **Do not grow an object's interface for monitoring — monitor with `print <descriptive-name>`.** A `v8`/`js` outlet, an extra `outlet` in a subpatcher, or an extra message whose only purpose is to let a person watch a value is scaffolding that ships with the patch: it widens the box, adds cords the reader has to trace, and silently implies the value is part of the patch's contract. Wire a `[print NAME]` (the argument labels every line in the Max Console, so several prints stay tellable apart) to an outlet that already exists, or call `post()` inside the JS. Both are trivially removable and neither changes the object's shape. When a value genuinely belongs on the operator's screen, that is a presentation decision, not a monitoring one, and it still should not need its own outlet if the value already leaves the object somewhere. *For instance:* the kslider-restrike `v8` carried a second outlet solely to feed a "stored pitches" readout; the note list was already observable with `[print HELD]` or a `post()` in `report()`.
- **Two `jit_matrix` sources fanned into one inlet is a structural conflict — give each matrix source its own dedicated inlet downstream.** Matrices don't mix at an input: each `jit_matrix <name>` message arrives separately and any in-progress processing of the previous matrix is at risk of being clobbered by the next. Even when the downstream object is a `v8` / `js` that *could* internally dispatch by matrix name, the patch's wiring topology is the surface contract — fan-in says "these mix" and matrix sources don't. The right pattern is: bump the downstream object's `numinlets`, route each matrix to a distinct inlet, and let the downstream code distinguish them by the global `inlet` (in v8/js) or by inlet-specific handlers (in gen). The same rule covers `jit.gl.texture` and any other Jitter consumer — one source per inlet. *For instance:* a v8 composing a texture from `jit.noise colors` and `jit.noise widths` declares `inlets = 3` and reads each `jit_matrix` based on which inlet fired, never on the matrix's name. The recognition signal: any time two patchcords carry `jit_matrix` outputs to the same `destination[N]` index, something is wrong — split the destination's inlets first.
- **`messnamed(name, msg, …)` from v8 / js only delivers to `[receive]` objects — NOT to objects with global *names*.** Collections like `coll NAME`, `table NAME`, `buffer~ NAME` use their argument to share data between instances, not to receive messages by that name. `messnamed("MYCOLL", "write", "/tmp/x.coll")` silently disappears — the coll never sees the message. v8's direct wrapper classes (`new Dict(name)`, `new Buffer(name)`, `new JitterMatrix(name)`) work because they read the named data via the C API, not via the message system. For objects without a wrapper (coll, table, multislider, jit.cellblock), the only paths from v8 are (a) `this.patcher.getnamed(<scripting-name>)` — only reaches the v8's own patcher — then `Maxobj.message("write", …)`, OR (b) user-side wiring with an explicit `[receive <NAME>_INSPECT] → [coll <NAME>]` upstream of the target, then `messnamed("<NAME>_INSPECT", ...)`. The recognition signal: any time JS sends a message that produces no observable effect on a Max-side object, the first thing to check is whether the target accepts messnamed at all — silent disappearance is the failure mode. (`c2m_inspect.js` implements exactly this for coll/table: it tries path (a), falls back to path (b), and returns a structured setup error if neither lands data — see `reachNamedWrite`.)
- **The JS `File` object's `"write"` mode overwrites from offset 0 but does NOT truncate — a shorter write leaves a tail of the previous, longer file's bytes.** The concern is general: any time a `[js]`/`[v8]` script re-writes a file whose new content can be shorter than what was there (re-serializing state that shrank, dumping a smaller payload, rewriting a config), the leftover tail silently corrupts everything downstream that parses the file — and it's invisible until a reader chokes or shows stale data appended to fresh data. The guard is to truncate explicitly after writing: set `f.eof = f.position` (the `eof` property is settable and cuts the file to that byte length) immediately after `f.writestring(...)`, before `f.close()`. *For instance:* `c2m.inspect`'s JSON dump files silently carried a fragment of the previous, longer dump appended after the new content — a success dump followed by the tail of a prior error dump — until `writefile()` added `f.eof = f.position`. (Verified empirically against a live Max 9 v8 session: with the truncate the tail disappears; the `eof`/`position` File properties are confirmed working.) The recognition signal: any "the file has extra junk after the real content" or "the JSON won't parse but looks right at the top" symptom from a JS-written file is this bug until proven otherwise.
- **`table write <path>` emits a single flat line — `table v0 v1 v2 … v(size-1)`** — the literal label `table` followed by every cell value (including trailing zeros up to the table's size), with no `flags`/`data N …;` wrapper. (`coll write <path>` by contrast emits one `key, val val …;` entry per line.) Don't write a parser for a `data N …;` block — that format is not what `table write` produces in Max 9. Parse by stripping any `; { }` punctuation, dropping the leading `table` label, and collecting the remaining numeric tokens. This is a specific case of the general parser-tolerance rule (confirm the actual on-disk format before coding against an assumed one): the assumed `data`-section format produced a silent `{error, raw}` on the first real dump. (Verified against live `table write` output: `table 100 200 … 0 0`.)
- **`udpreceive <port>` (default mode) natively decodes simple OSC binary into Max messages** with the OSC address as a leading symbol followed by the args — `route /foo/bar` matches directly with no CNMAT dependency. The optional symbol argument (`udpreceive <port> <anysym>`) switches to FullPacket mode for downstream OSC-bundle parsers (`OSC-route`, `o.unpack`, etc.) — needed only for bundles or advanced OSC features. For a flat-address one-way listener, `udpreceive <port>` + `route` is the lightest correct setup. Earlier guidance in `multi-user-template/CLAUDE.md` that "Max 9 has no built-in OSC-to-message parser" is misleading — that's true only for OSC bundles, not for simple OSC messages. (Confirmed by `udpreceive.maxref.xml` and empirically verified with the c2m.inspect OSC pathway.)
- **A `v8` / `js` box that names a script without `@embed 1` dies the moment the `.js` does not travel with the patch.** Max's failure is one console line ("can't find file") and a box that accepts messages and does nothing — no red box, because `v8` itself loaded fine. Write `v8 name.js @embed 1` every time (arguments before the attribute: `v8 name.js 15 @embed 1`) **and wire a `[loadmess embed 1]` into the box**: the attribute makes Max use the stored copy when the file is missing, the message makes Max keep the copy when it saves with the file present — verified in Max 9 (2026-09-10), the attribute alone is overridden on save. The converter stores the source inside the box; the verifier warns when either part is missing. Keep the `.js` next to the patch for editing and run `sync` after changing it; sync refreshes the stored copy from the file (and restores a missing file from the stored copy). Rule: `CLAUDE.md > Embed the Script in Every v8 Box`.
- **Max caches abstractions for the session — editing the .maxpat file and reopening the parent does NOT reload the abstraction.** Once an abstraction is loaded into a session, every subsequent instantiation comes from Max's in-memory cache, including freshly-opened parent patches. To pick up edits: close EVERY patch that contains the abstraction (one cached load is enough to keep the stale version pinned), then reopen them — or restart Max. The same applies to external `.js` files used by `v8` / `js` when `autowatch` is NOT set; with `autowatch = 1` in the JS, Max watches the file and reloads when it changes on disk. The diagnostic for "I edited the abstraction but my changes aren't showing" is almost always cache-related, not edit-related — the recognition signal is when the patch behaves as if your file change never happened.
- **`textedit` outlet 0 emits `text <symbol>` by default (`outputmode 0`) — a downstream `[setfoo $1]` captures the literal symbol `"text"`, not the typed value.** The handler runs with the wrong argument and the patch silently misbehaves. Three valid fixes: (a) set `@outputmode 1` on the textedit so the value emits as a bare symbol; (b) insert `[route text]` between textedit and consumer to strip the prefix; (c) skip the textedit entirely and bake the value into a `loadbang`-fired message when it's fixed configuration the user shouldn't be retyping at performance time. The general principle: any Max object whose default output is a *list* (not a bare value) silently breaks `$1`-style capture — verify the output format in the refpage before wiring `$N` against it. (Source: confirmed by `textedit.maxref.xml` `outputmode` description; IMMER v2 cloud-config regression, `Invalid URL: text/mu/...`.)
- **Buttons used as pass-through indicators are inline on the cord, not on a side tap.** When a `button` blinks to show that a bang has reached a stage, wire it inline — `upstream → button → downstream` — not as two parallel cords from the same outlet (`upstream → downstream` AND `upstream → button`). The side-tap approach doubles the cord count and misrepresents the signal flow: the button looks like an independent destination rather than a monitor on the path. The inline approach passes the bang through the button before it continues downstream; one cord in, one cord out, button blinks as normal traffic passes. *Recognition signal*: if two cords leave the same outlet and one terminates only at a `button`, that button belongs inline on the other cord instead.
- **Some objects configure range or defaults via creation args, not `@`-attributes — `list_attributes` is the check.** `counter 0 3` sets the min/max range; `@min 0 @max 3` does not exist and would be silently ignored. `metro 500` sets the default interval; `makenote 100 250` sets default velocity and duration. The symptom is a control that silently uses Max's default range regardless of what was written in the spec. Call `list_attributes(<object>)` before writing attributes — when an attr you expect is absent from the list, check the creation arg text in the refpage instead.
- **BEAP clipping files are wrappers — embed the module, don't load the file by name.** Every `bp.*.maxpat` under `packages/BEAP/clippings` is a patcher holding exactly one box: a `bpatcher` with `embed: 1`, the module's patcher inside it, and its own varname (`Gigaverb`, `Freeverb`, `Reverb1`, …). The wrapper patcher has no `inlet` / `outlet` boxes of its own. A `bpatcher @name bp.Gigaverb.maxpat` therefore shows the module but puts everything one level down: cords wired to the box's ports have nothing to land on, and a `pattrforward RV_GIGAVERB::Dry` path reaches nothing because the dial lives at `RV_GIGAVERB::Gigaverb::Dry`. (C74's own `bp.*.maxhelp` files do load by name and record two ports — what Max does with the wrapper at load time is not verified here.) The way BEAP is meant to be used is pasting the clipping, which puts the inner bpatcher box itself into your patch. In a spec that is the `maxpat` field (`SPEC_REFERENCE.md` > *Embedding an existing patcher verbatim*): copy the clipping's single box's `patcher` in, give the box your own `varname`, and its ports and `pattrforward` paths are direct. Found 2026-09-08 in reverb-shootout: four BEAP reverbs silent and four wet-only dial sets ignored.
- **`amxd~`, `vst~` and `bpatcher` show their patcher or plug-in inline only with `viewvisibility: 1`.** The device interface drawn inside the box is the box's patcher view; without `viewvisibility` the object is a plain box with a name. C74's `amxd~.maxhelp` boxes carry `viewvisibility: 1`, `bgmode: 1`, `border: 0`, `lockedsize: 0` and a 525 × 196 rect — mirror those to get the inline device UI. `viewvisibility` is a help-corpus attribute, not a refpage one, so `list_attributes` is where it shows up. **The inline box takes the device's own width**: Max resaved reverb-shootout's 520 px `amxd~` boxes at 403 px (ChamberVerb) and 416 px (Plate Reverb), the devices' presentation widths — so author the rect from the device's presentation extent (read it from the `.amxd`), not from the pane.
- **To change a *box* attribute at runtime, send `sendbox <attr> <value>` into the object's inlet.** A bare `<attr> <value>` message reaches the **object**, which usually has no such attribute and ignores it; the box's own attributes are a separate set, and the prefix is what routes the message to them. Max's `jbox` reference states it for every common box attribute: "If you want to change one of these attributes for an object based on the object box, you need to place the word `sendbox` in front of the attribute name, or use the object's Inspector." So anything the Inspector shows for a box — `hint`, `annotation`, `presentation`, `ignoreclick`, `varname`, the inline-view keys below — is settable live this way, by the operator or by the patch. Do not confuse it with `thispatcher`'s `script sendbox <varname> <message>`, which is the same idea addressed by scripting name from outside the box. **For instance:** `toggle → [sendbox viewvisibility $1] → [vst~ C74_AU:/AUPitch]` shows and hides the plug-in editor inside the `vst~` box while the patch runs, so one plug-in can be opened for editing and folded away again without a second window. (John, 2026-09-15.) The recognition signal: wanting an object's *appearance* to change from the patch, and reaching for a message named after the attribute alone.

- **An `attrui` on a multi-value attribute shows as many fields as the attribute's current value has, not as many as it can hold.** The control is built from what the object reports now, so an object created with no arguments reports one value and the `attrui` draws one number box — which reads as "this attribute only takes one number." Create the object with the value spelled out to full length and the `attrui` draws that many fields. **For instance:** `jit.submatrix` declares `offset` as `type="int" size="32"` (up to one value per matrix dimension), but a bare `[jit.submatrix]` gives a one-number `attrui` for it; `[jit.submatrix @offset 2 2 2]` gives three, and `dim` behaves the same way. The rationale, from the Cycling '74 forum reply to John's post (2026-09-15): a Jitter matrix can have an arbitrary number of dimensions, so the attribute follows the object's actual shape — unlike `jit.matrix`'s `srcdimstart` / `srcdimend` / `dstdimstart` / `dstdimend` / `planemap`, which always expose the maximum. Two consequences when building a patch: give such an object its full-length value in the box text rather than relying on the default, and read a narrow `attrui` as a fact about this object's current value, not as the attribute's limit.

- **The spec `name` field auto-emits a title `comment` at top-left — it overlaps any comment you place at the top of the patch.** `spec2maxpat.py` renders the spec's `name` as a title comment near `[50, 15]` in the patching view. If the spec also defines its own header/instruction comment at the top, the two overprint into an unreadable smear. Two fixes: (a) omit `name` when you supply your own top comment (recommended — the patch filename already shows in Max's title bar), or (b) keep `name` and place your first comment below the title band (`y ≳ 40`). This is the same "don't add a comment that just restates the patch name" guidance from the presentation rules, but the failure here is *overlap*, not just redundancy. (Confirmed by inspecting generated `.maxpat` geometry: title `[50,15,400,24]` colliding with a `[20,16,520,40]` instruction comment.)

- **A field's location in a data structure is part of its API — confirm where the value lives; never infer it from a sibling that looks similar.** Reaching for the key that fits the *family* rather than the one that fits *this* structure is the same trap as writing `bgcolor` on `live.gain~`, one level up: the code runs, finds nothing, and reports success on zero work. The failure is silent in exactly the way an attribute guess is silent — no exception, no warning, just a no-op that reads as "already clean." Two places this bites in `.maxpat` work specifically: **the embedded Claude2Max spec lives in `box["code"]` on the `text.codebox` (id `obj-spec-embed`), not `box["text"]`** — `extract_spec()` checks `code` first and falls back to `text` for legacy comment embeds, so anything hand-written that only probes `text` misses every modern patch; and **`maxhelp/maxhelp_observed_attrs.json` nests its class map under a top-level `objects` key** alongside `_meta` and `maxclass_counts`, so indexing the file directly by class name returns nothing. *For instance:* a cleanup pass that removed 44 invalid attrs from patch boxes reported "0 spec entries cleaned" and looked finished — it had probed `box["text"]`, so every embedded spec still carried the invalid attrs and the next `sync` would have re-seeded them into the boxes. The same session read `corpus["panel"]["boxes"]` and got `0 out of 0` for a class with 12,920 boxes. The recognition signal is a structural edit that reports **zero** changes where you expected some: treat a zero-count success as an unverified probe, not a clean result, and print the keys you actually found before concluding the data isn't there.

- **A scan that returns the first match needs a discriminator whenever the collection can hold more than one match.** First-match iteration is only safe when a second match is impossible; otherwise it silently prefers whichever candidate sorts earlier, and the choice looks deterministic while being arbitrary. In a `.maxpat` the boxes array is heterogeneous and long-lived — leftovers from prior convert cycles, tutorial comments quoting a format, decoys from a partial edit all coexist — so "the box that contains X" is rarely unique. Prefer the canonical identifier when one exists, fall back to the expected maxclass, and when more than one candidate matches, surface it rather than choosing quietly. *For instance:* `extract_spec()` used to return the first box whose `code` or `text` contains `--- CLAUDE2MAX SPEC ---`, checking neither id nor maxclass. In `4step-sequencer.maxpat` a stray `newobj` (`obj-22`) whose whole text is a 27-character stub spec sorts before the real `obj-spec-embed`, so the patch reports `spec.objects = 0` — and because `convert` consumes whatever `extract_spec` returns, converting that patch would emit a near-empty result and destroy all 24 boxes. The canonical id was already available: `_SKIP_BOX_IDS` names `obj-spec-embed`. The damage was latent and silent — the patch opens fine and the anti-guessing gate reports it clean. **Fixed 2026-08-21**: `extract_spec()` now prefers `id == "obj-spec-embed"`, falls back to `maxclass == "text.codebox"`, names every losing candidate on stderr when more than one box carries the marker, and raises `SpecEmbedError` rather than returning a lesser candidate when the chosen body is truncated or not JSON. Regression tests: `tests/test_spec_embed_discriminator.py`.

---

## Presentation View Design Principles {!layout}

These principles represent the preferred aesthetic and UX approach for Max presentation views. Read and treat as a checklist before starting any presentation layout.

### Action prominence hierarchy
Size communicates priority — the most-used controls must be the largest, most visually dominant elements. Secondary controls are smaller and subordinate. Never give all controls equal visual weight; the user's eye should land on the most important control first without scanning.

### Prefer a labeled message box over a button + comment for one-shot actions
For an operator-facing action the user clicks (save, load, clear, reset, recall, trigger), use a **`message` box whose text is the action's label** rather than a `button` paired with a separate `comment`. The message box combines both jobs — it is the clickable affordance AND it reads as a word ("save", "load"), so it self-documents and takes one object instead of two. A bare `button` is a blank bang with no indication of what it does; labelling it then requires an adjacent comment, which is two objects to place, align, and keep in sync for what a single message box does cleanly.

If the downstream consumer needs a bare `bang` rather than the message's symbol, route the message through a **`button`** — not `[t b]`. Both convert anything to a bang, but the `button` blinks when it fires (so the patching view shows you the action actually happened) and can be clicked directly to fire the chain while testing. `[t b]` gives you the same bang with neither. The operator still sees and clicks the labelled message; the button sits below it in the patching view as a visible confirmation light. (Derived from the Zendrum bank UI: `save`/`load` message boxes replaced button+comment pairs.)

### Panel-based grouping
Use dark rounded panels (`panel` objects with rounded corners and a dark fill) to cluster related controls. The panel boundary is the group label — controls inside share a purpose. Do not mix unrelated controls inside one panel. Leave consistent padding (≈15 px) between panel edge and contents.

### Presentation panels live in the background layer — Binding Rule {!core}

A panel is scenery. It groups controls, it is never a control, and while someone edits the patch it must not be selectable, draggable, or in the way of a click. Three settings together make that true, and every presentation panel gets all three:

1. **`background: 1` on the panel box** — Max's *Arrange > Include in Background*. Max's user guide: background objects "will always be rendered behind objects in the foreground, though both may appear in Presentation Mode."
2. **`bglocked: 1` on the patcher** — Max's *View > Lock Background*. The user guide again: "When the background is locked, objects in the background cannot be selected." In a spec this is a root key next to `width` / `height`. The converter writes it to the patcher only when the spec sets it (Max's own default is 0, and the converter never exceeds Max's defaults); `sync` mirrors the patcher's value back, so a lock set or released in Max survives the next convert.
3. **The panel placed after every non-panel box** in the `boxes` array, so it paints behind everything. The converter does this on its own — declare panels wherever reads best in the spec.

The verifier checks the two the author writes: `panel-not-background` on a presented panel without the attribute, and `panel-bglocked-missing` on a spec with presented panels whose root lacks the key.

For instance: `reverb-shootout` was first built with one panel per section, declared next to that section's controls. Every panel painted over the controls declared before it, and every panel was selectable while editing. Ableton's own ABL Effect Modules set `background: 1` on 83 of 85 panels. No shipped C74 help file locks its background (0 of the 584 that carry the key) — help files are meant to be taken apart — but a performance patch is not a help file.

Tutorial highlight panels (`tut-panel-N`, see `TUTORIAL_GUIDELINES.md`) follow the same rule; their `hidden: 1` is runtime state layered on top of it. The name `locked_bgcolor`, which earlier tutorial code wrote on each panel, is a `p`-box attribute — a panel silently ignores it.

### Section headers inside panels
Place a small comment at the top-left of each panel naming the group (e.g. "capture", "playback", "output size"). Keep it brief — one short phrase. This is the panel's title, not a label for any individual control.

### Object boxes keep their text — budget the width, then the wrapped height — Binding Rule {!core}

A `newobj`, `message` or `comment` shown in the presentation shows its whole text; a `presentation_rect` narrower than the text does not clip it. Max wraps the text onto more lines (recorded as `presentation_linecount`) and the box grows downward — measured on C74's shipped help patches: 22 px for one line at the default font, then 14.5 px per extra line (37, 52, 66, 81, 96 px for 2–6 lines for messages and comments; an object box is 35 px at two lines, then the same step — Max wrote 35 back into reverb-shootout). One-line comments have a floor too: Max resaves an 18 px Monaco-11 label as 20 px. A box given `[x, y, 160, 22]` for a 36-character object text is therefore drawn 160 × 37, over whatever sat 22 px below it — or, if the line count is left unset, drawn wide enough for one line, past the panel's edge. So, for every presented text box:

1. **Choose the width from the panel**, never from the text: inner width minus the padding.
2. **Count the lines** the text needs at that width — the converter does this (`wrapped_lines`) and writes `presentation_linecount` and the height (`wrapped_height`) for any multi-line box.
3. **Budget the vertical space for the taller box** — compute the next row's y from this box's *wrapped* bottom, and grow the panel — exactly as *Every presentation row needs its own vertical budget* says for controls.
4. **Run the overlap check after converting**; a box that wrapped taller than planned lands on the row below.

Object boxes carry their arguments and attributes in the text (`abl.dsp.darkhall~ @mix 1. @size 0.5`), so they are the boxes most likely to be wider than a pane. For instance: reverb-shootout's six `abl.*` boxes were placed at 160 × 22 under their controls and drew either past the pane's right edge or two lines tall; the fix was the 160 px width plus a 37 px budget and a taller pane. (John, 2026-09-08.)

### Number UI controls down each column, then left to right — Binding Rule {!core}

Two different things get numbered, and they read differently:

- **Objects arranged on screen** — panes in a presentation, boxes in the patching view — keep the **horizontal** order: left to right along a row, then the next row. That is how the layout is built and how a reader scans it.
- **Items inside a multi-column UI control** — a multi-line `tab` / `live.tab`, a column of `message` boxes, a bank of buttons, a `jsui` grid — read **vertically**: top-to-bottom within a column, then the next column:

```
1 3
2 4
```

never `1 2 / 3 4` inside a control.

Two consequences for the control case:

1. **The stored item order follows the grid Max actually draws.** A tab fills row by row, so the transposition depends on the column count: with one column the stored order is the conventional order (`1 2 3 …`, nothing to transpose); with `cols` columns and `rows` rows, row-major position `i` holds slot `(i % cols) * rows + i / cols + 1`, and a `v8` maps the index back to the slot (it is also where the selected pane gets highlighted). Pin the grid with `live.tab @num_lines_presentation N` (and `@num_lines_patching`) and **confirm the drawn column count in Max before choosing the order** — a transposed list on a single-column tab reads as jumbled. Plain `tab @multiline 1` wraps by width and gives no fixed row count.
2. **When the same items appear in a control and in a layout, the numbers are shared; only the reading direction differs.** The layout's row order gives the numbers; the control shows the same numbers down its columns.

For instance: reverb-shootout's panes are numbered 2–16 along their rows (six `abl` panes, then the BEAP / AU row, then the `amxd~` rows). Its `live.tab` was first stored for 2 columns — `"1 DRY" "9 BEAP Freeverb" "2 Live-Reverb" "10 BEAP Reverb1" …` — which reads down two columns only when two columns are drawn; on John's screen it drew one column and the numbers looked jumbled, so the tab is now one column of 16 in conventional order. (John, 2026-09-08.)

### A comparison pane leads with the control that is the effect's reason to exist — Binding Rule {!core}

A pane in a comparison patch (a shootout, a bench, a help-style demo of one object among many) leads with the control that is the effect's reason to exist. A delay pane without its delay time, or a filter pane without its cutoff, has failed even if every other attribute is there: the operator came to hear what the object does, and the first control has to be the one that does it. Order the rest by how the operator thinks about the effect, not by the refpage's alphabet. The settings have to let the pane demonstrate that purpose, too: a feedback delay loads with audible feedback, a resonant filter with audible resonance — an effect loaded at the setting where it does nothing has not been demonstrated, whatever its controls show. For instance: the delay-shootout's `abl.device.delay~` pane first shipped eight attruis and no `delay` — the one attribute that makes it a delay — because the attribute is a two-value list and was skipped as awkward. (John, 2026-09-08.)

### A transparent button over a comment makes a label clickable

A transparent button over a comment is the sanctioned way to make a label clickable. Declare the button after the comment so it draws in front (later boxes draw on top — see *Max .maxpat Internals*). Transparent means transparent: nothing of the button shows, not its background and not its outline; the operator sees only the comment. The button's outlet does the work the click means (in the shootouts: `button → [tab index] → s TABSEL → live.tab`, so clicking a pane title selects that effect). The verifier's `presentation-overlap` rule recognises a button whose `bgcolor` alpha is 0 over a comment as this pattern and does not report it. (John, 2026-09-08.)

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

### A comment's text must contrast with its own background — check every comment, in every view it appears in

A comment is readable only if its `textcolor` reads against whatever is directly behind the text. When a comment carries its own `bgcolor`, that background is what's behind the text, in both views — the patcher canvas and any presentation panel are irrelevant. So the pair `bgcolor` / `textcolor` has to contrast on its own, per comment. The trap is a shared label helper that stamps one background onto every label and then lets a caller change only the text color: the caller reasons about the panel or the canvas, forgets the stamped background, and produces dark-on-dark or light-on-light text that reads as a blank box. For instance: a patching-view note was given dark ink so it would show on Max's light canvas, but the helper had already given it the dark panel background, and the note was unreadable. A comment that lives only in the patching view usually wants no `bgcolor` at all — the default comment is what the canvas is calibrated for. Before handing over any patch, scan every comment that sets both attributes and confirm their luminances differ; a one-line luminance diff over the spec is enough (see the check the kslider-restrike session ran).

### Every presentation row needs its own vertical budget — labels are boxes, not overlays

A comment in the presentation occupies its full `presentation_rect`, and Max will happily draw the next control on top of it. Stacking rows by eye almost always underestimates the space a label between two controls needs. Compute vertically the same way the horizontal-spacing rule computes across: `next_y = prev_y + prev_height + gap`, with a gap of at least 8 px, and grow the enclosing panel to match. For instance: a keyboard hint at y 176 with height 20 ends at 196, so a flush button at y 190 sits on top of it and both are unreadable. After converting, do not trust the eye — run a rectangle-intersection test over every presented non-panel box and treat any hit as a layout bug; also confirm each presented box lies inside the panel meant to hold it.

### Comment text starts inside the box — compensate for left-alignment
Max `comment` objects have internal left padding: the text starts a few pixels right of the box's left edge. The offset is approximately 4 px at common UI font sizes but varies with font and size. When precise visual left-alignment between a comment label and a UI object is required, offset the comment's x coordinate leftward and verify visually — do not assume 4 px is exact.

### Comment width is user-set; height is automatic — never override either independently

Max `comment` objects auto-wrap text based on the box's width (`patching_rect[2]`). Height (`patching_rect[3]`) is computed automatically by Max from the width and the wrapped content — it is **not** an independent dimension.

**In a spec:** `size` must be a two-element `[width, height]` list. `build_box` unpacks it as `w, h = obj_spec["size"]`, so a one-element `[width]` raises `ValueError` and the conversion fails — an earlier version of this paragraph said to set only `size[0]`, which does not work. Width is the dimension you actually choose; treat the height you write as nominal and derive it from the number of wrapped lines you expect (roughly `14 * lines + 6` at fontsize 10). If a comment overflows its layout area, narrow `size[0]` — do not add explicit `\n` line breaks, since auto-wrap is the correct mechanism.

**Sync:** `sync` records `size` whenever a box's saved width or height differs from what convert would write with no `size` at all (the `UI_SIZES` default, or the text-width estimate at 22 px), so a comment narrowed in Max, or a box widened for cord clearance, survives the next convert. It also takes the box's value for any attr the spec already names — an Inspector edit, a `v8ui`'s declared attribute changed in Max — because the patch is the source of truth. Before 2026-09-12 a one-line box's width change and a changed attr value were both dropped on sync and written back stale on convert (`tests/test_sync_follows_box.py`).

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

## Output-Only UI Objects {!core}

When any UI object is used purely for display (not user input), disable interaction and remove interactive visual affordances so users don't accidentally edit displayed values. For a number box: set `@ignoreclick 1` to disable interaction and `@triangle 0` to remove the edit arrow. The specific attributes vary by object type — apply the equivalent for toggles, sliders, etc.

---

## UI Layout — Label and Control Spacing {!layout}

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
