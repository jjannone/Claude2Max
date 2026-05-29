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

**Step 3 — Re-verify inherited code paths the first time you touch them.** The rule above is usually framed as "before writing new code," but it applies just as strongly to code you're carrying forward from a previous patch version, an upstream template, a forked piece, or a "known-working" snippet from a colleague. Old code shipped with silent errors all the time — Max's "doesn't understand X" log line is easy to miss, and a routed message that hits an object without the matching method just sits in the console while the rest of the patch continues to look functional. *For instance:* IMMER v3 inherited a `Max.outlet("cell", "count", N)` call from v2's roster pump; jit.cellblock has no `count` method, so v2 had been printing `jit.cellblock: doesn't understand "count"` on every roster update for months — invisible until v3's added video chain made the operator pay closer attention to the console. The rule generalises: when you adopt code from a previous version of anything that talks to Max, re-verify every Max-side API name in it against the current refpages, not against the working memory of "this used to work." Working code at the JS / Node / Python level is no evidence that the messages it emits are valid — only the destination object's refpage is. The discipline is identical to verifying a name before writing it for the first time; the recognition signal is "I'm copying or re-using a `Max.outlet(...)` / `[...]` / message-box dispatch that was authored in a previous context." That's the moment to grep the refpage of every destination object, even if the code "obviously works."

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

- **Z-order in patching view**: In the `boxes` array, earlier items render on top (in front). To put an object visually on top of others in patching view, place it first in the array. Background objects go last.
- **Z-order in presentation view is NOT controlled by boxes-array order.** Presentation has its own background layer, and a panel placed LAST in the boxes array can still render IN FRONT of controls when the patch is in presentation mode — eclipsing every button and number box that happens to sit in its rectangle. The control isn't gone; it's just hidden behind the panel. Symptom: a button that appears in patching view but is missing from presentation view, with no apparent layout bug. The fix is two-part:
  1. **Set `background: 1` on every panel** (the "Include in Background" option in the Inspector). This moves the panel into the dedicated presentation background layer, behind all interactive controls, regardless of boxes-array order. Without this, the boxes-array Z-order rule above does NOT apply to presentation mode and the panel may sit on top.
  2. **Set `bglocked: 1` at the patcher level** ("Lock Background" / Cmd-K-Cmd-L). This prevents the background panels from intercepting mouse hits even when nothing is on top of them — a click on the background panel does nothing instead of selecting/dragging the panel out of place at runtime.

  Recognition signal: a Max patch where the presentation view looks like a uniform dark rectangle covering everything below the title, but inspecting the spec / .maxpat shows controls with `presentation: 1` in that area. The controls are there; the panel just hasn't been moved to the background layer. *Worked example:* IMMER v3's TEST panel had 5 buttons in the spec but only 4 visible — the fifth (Force visible, the rightmost) was eclipsed by the panel until both `background: 1` and `bglocked: 1` were set.
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

### Prefer `[attrui]` for object/shader attributes — not a flonum + formatter chain
When a UI element is exposing an *attribute* of a named object — a `jit.gl.*` attribute, a UI element's own attribute (e.g. a button's `blinktime`), a shader `<param>` from a `.jxs` (each `<param>` becomes a settable attribute on the slab), anything bound to `@name` somewhere — reach for `[attrui]` connected by patchcord to the target, NOT a hand-built chain of `[flonum] → [<param-name> $1] → [target]`. The reasoning:

- One box per attribute instead of four (flonum + label comment + formatter message + loadbang/default), which keeps the patching view tight and the presentation view tighter.
- `attrui` self-types: it renders as a number box, integer box, enum menu, swatch, list, or toggle depending on what the bound attribute actually is. A hand-built flonum chain breaks the moment the attribute's type changes (int vs float vs symbol) and silently truncates lists.
- Bidirectional sync is free: the operator's input goes to the attribute AND attribute changes from elsewhere (presets, automation, OSC) flow back to the displayed value. The flonum chain is one-way unless you patch the round-trip yourself.
- Inspector / Max presets / `pattr` automation all see the binding uniformly through `attrui`, which means parameter recall / "save state" features work without per-control plumbing.

**Canonical binding pattern — the patchcord IS the binding.** There is no `attr_target_obj` attribute (despite the natural assumption) — the target object is whichever object the attrui's outlet 0 is patchcorded into. The `@attr <name>` selects which attribute, and `@attrfilter <name>` restricts the dropdown to just that one (otherwise attrui shows a popup of all attributes on the target). Verified by the bundled `/Applications/Max.app/Contents/Resources/C74/help/max/attrui.maxhelp`:

```
[attrui @attr smoothness @attrfilter smoothness]
                 │
                 ▼ outlet 0
[jit.gl.slab @name immer_slab @file bands.jxs]
                 inlet 0
```

The flonum + formatter chain stays the right tool when the destination isn't a named object exposing an attribute — server-side handlers reached via `[setfoo $1] → node.script`, message-only protocols, anything that consumes a list of args rather than setting a single `attribute = value`. Those don't have an attribute surface for attrui to bind to. Recognition signal: if you're typing `<word> $1` into a message box and connecting it to a destination that DOES expose `<word>` as an attribute, that's an attrui that wants to be born.

**Always set `@orientation` to 0 (horizontal) — explicitly or by omission.** The horizontal layout puts the attribute label and the control side-by-side, which is what nearly every presentation layout actually wants. `@orientation 1` (vertical) stacks them, which doubles the row height and almost always misaligns a row of attrui widgets. The default IS 0 but a deliberate `@orientation 0` in the spec makes the intent explicit and protects against later inspector edits. Don't set 1 unless you're laying out a single-column tower where each row is one attribute and vertical truly fits the constraint.

**Set `@displaymode 0` (Automatic) — let attrui pick the widget type from the bound attribute.** Modes 1/2/3/… force a single widget shape (int-style number box, float number box, etc.) and are useful when overriding the inferred style, but for ordinary use Automatic is what you want — float attributes get a flonum, ints get an integer box, `int @style onoff` gets a checkbox, color attributes get a swatch. Forcing a mode is the wrong default; you'd find out a later attribute change broke the widget. Same explicit-by-default reasoning as `@orientation 0`.

**Size `@text_width` per column — one width per column, sized for the longest attribute name in that column.** The default truncates anything over ~5 characters; per-attribute sizing produces visually inconsistent rows where each label has a different width and the value widgets misalign. The right granularity is the column: every attrui in a single column shares one `text_width` AND one box width, computed from the longest attribute name in that column. Different columns of a layout can (and should) have different widths — a column whose longest name is `smoothness` (10 chars) is wider than a column whose longest is `hueMin` (6 chars). Within a column, narrow names get extra padding on the right of the label and that's fine — visual alignment beats per-attribute tightness.

Formula at Max's default sans-serif: `len(longest_in_column) * 8 + 14` px for the label slot. For **Monaco / Courier** (heavier monospace), bump to `len(longest_in_column) * 9 + 18` — monospace chars are wider and the formula under-estimates otherwise. Then size the attrui box itself as `text_width + 60-to-90 px` for the value widget (flonum-style needs ~80; toggle-style only ~30).

*For instance:* IMMER v3 ends up with three column widths:
- **VIDEO column** — `smoothness`, `minWidth`, `maxWidth` (longest = 10 chars) → `text_width 108`, box width `198`.
- **COLOR GAMUT pair columns** — `hueMin`/`hueMax`/`satMin`/`satMax`/`valMin`/`valMax` (all 6 chars) → `text_width 72`, box width `162`.
- **Utility row** — `visible` (7 chars, on its own) → `text_width 81`, box width `141`.

Without per-column uniformity, the screen ends up with mismatched label widths even when every attrui's label DOES fit — and that misalignment reads as a layout bug at first glance.

**Don't duplicate the label with a separate comment.** An attrui already shows the attribute name to the left of the value (when `orientation 0`). Adding a `[comment "Smoothness"]` next to a `[attrui @attr smoothness]` puts the same word on screen twice — once nicely cased ("Smoothness"), once verbatim ("smoothness"). Pick one. The cleanest pattern: drop the comment, let attrui own the label, and reserve comments for **group headers** that title a *set* of attruis (e.g. `── COLOR GAMUT ──` over a pair of `hueMin`/`hueMax` attruis). Group headers say what the cluster IS; per-attrui labels (built into attrui) say what each one DOES. If the attribute name reads badly in lowercase camelCase (`hueMin` vs your preferred "Hue min"), the fix is to RENAME the shader `<param>` in the `.jxs`, not to add a redundant comment over the top — the attribute name is the API of the shader and operator-facing UI in one.

*For instance:* a `[jit.gl.slab @name immer_slab @file bands.jxs]` shader with `<param name="smoothness" type="float">` etc. — every `<param>` becomes a settable attribute on `immer_slab`, so each operator-tunable parameter lands as `[attrui @attr smoothness @attrfilter smoothness @orientation 0]` with a patchcord into the slab, instead of a flonum + `[smoothness $1]` formatter + loadbang default chain.

### Always think about utility flags — `@visible`, `@enable`, `@floating`, `@interactive`
When adding any object that has operator-visible side effects beyond the patch's main work — a floating `jit.world` window, an automatic GL renderer, a continuously-firing `metro`, a Max console-spamming `print` — add presentation controls (a `[toggle]` or attrui) for the utility flags that turn those side effects on and off. The reason: the operator is going to want to suspend them sometimes (debugging on a single monitor, profiling, recording, preparing a clean screenshot for documentation, working through the patch graph without a 1080p floating window on top of it). Without a presentation-level kill switch, the operator has to navigate to the object box in patching view, click the inspector, and twiddle the attribute — friction in the wrong direction.

The flags worth thinking about per common object:

| Object | Utility flag(s) | What the toggle saves the operator from |
|---|---|---|
| `jit.world` | `@visible` | Hiding the floating window without disabling rendering (kills the visual but keeps GL state warm for re-show). `@enable` is the heavier kill switch. |
| `jit.gl.render` (legacy world) | `@enable` | Same as above. |
| `metro`, `qmetro` | (the `0` int to inlet 0) | Stopping the tick stream when debugging. |
| `print` | `@open` / a gate upstream | Closing the Max console firehose during a clean test run. |
| `dac~`, `ezdac~` | `0` / `1` | Muting audio at the patch level (operator-clickable) without going to the Audio Status window. |
| `udpreceive`, `udpsend` | `@active` | Disconnecting network traffic when working offline. |
| Any `*.maxhelp`-style debug subpatch | `@hidden` or a gate-wrapped presentation toggle | Hiding the whole debug surface from operator view. |

The general principle: every object whose side effects are visible to the operator should have an operator-facing way to turn those side effects off without editing the patch. *For instance:* IMMER v3's `jit.world` runs a 1080p floating projection window that's perfect on stage but gets in the way when the operator is on a laptop preparing the patch — a single `[toggle] → [visible $1] → jit.world` in presentation lets the operator hide the window for development and bring it back for the show.

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

### Jitter / GL knowledge

- **Two `jit.matrix NAME` boxes with the same name share a single memory allocation** — Jitter's `pv`/`v` equivalent for matrices. One subpatcher writes into a named matrix; another reads from it without any patchcord between them. Crucial for scrolling buffers (write to cell 0 here, read the entire matrix elsewhere), record/playback (one writer, multiple readers), and any "global matrix" shared across subpatchers. Naming convention follows the project's ALL CAPS rule: `jit.matrix SCROLLME 1 float32 100`. (Source: Max Cookbook, `bidirectional-jitmatrix-scroll`.)
- **`jit.matrix` is a general-purpose multi-dimensional data buffer — it is not video-only.** Plane = "channel" or "axis" (planes 0/1/2 for x/y/z is canonical), `dim_x` × `dim_y` = "length" × "row-count" or whatever 2D structure fits the problem. Read/write with `setcell` messages; bulk-read columns via `jit.submatrix` + `jit.spill`. Cookbook stores 18 xyz GL points × 1800 frames in a single `jit.matrix 3 char 18 1800` and plays them back with `srcdimstart 0 N, srcdimend 17 N` to step through frames. Faster and more memory-efficient than `coll`/`zl`/JS arrays for large numeric datasets (sequencer state, particle systems, FFT bins).
- **Cheap blur via downsample-then-upsample-with-interp**: `jit.matrix 4 char 16 12 → jit.window @interp 1`. Massively cheaper than a Gaussian or convolution. Send the source through a tiny destination matrix (16×12 in the cookbook example), then let the display window or a downstream `jit.matrix @interp 1` upsample back to full size with bilinear interpolation. The downsampling discards detail; the interpolation blurs it back to fill the original area. Tunable: smaller intermediate matrix = stronger blur. (Source: Max Cookbook video patterns.)
- **`jit.catch~ @mode 0` (default) emits irregular matrix `dim`** that overrides downstream graph settings (visible as flickering or sudden resolution changes in `jit.gl.graph` / oscilloscope visualizers). Use **`@mode 2 @framesize N`** for a stable, predictable matrix size per output. (Source: Cycling '74 forum.)
- **Order-Independent Transparency in Max 9 requires `jit.gl.pbr` attached to *every* transparent shape AND `@transparency 1` on `jit.world`.** Only one of the two is not enough; OIT is the union of the per-shape PBR pass and the world-level transparency flag. Without both, transparent shapes z-fight or render in the wrong order. (Source: Cycling '74 forum.)
- **Shadows on `jit.gl.multiple` only work when `jit.gl.material` is connected DIRECTLY to the multiple, not through a `jit.gl.node`.** Wiring through a `jit.gl.node` silently drops the shadow attribute. Counter-intuitive — most students expect that anything node-routable is materially equivalent — but here it isn't. (Source: Cycling '74 forum.)
- **`jit.gl.multiple` ignores per-instance alpha when `@lighting_enable 1`.** The default lighting shader doesn't sample the per-instance alpha attribute. The canonical fix is a custom shader (`multshade.jxs` or similar) that reads `vertex.color.a` from the per-instance attribute stream. The workaround is feature-stack-specific — there is no universal drop-in patch; whatever else you're using on the same `jit.gl.multiple` (textures, normal maps, shadows) determines what the shader has to declare. (Source: Cycling '74 forum.)
- **For instanced GPU rendering with multiple `jit.gl.buffer`s, the working pattern is one buffer per *named inlet* of `jit.gl.mesh`, NOT multiple buffers on the same inlet.** Each inlet declares its attribute (`position`, `normal`, `color`, custom...); each `jit.gl.buffer` outputs to one inlet. Trying to multiplex multiple buffers onto one inlet either produces undefined data or silently drops all but the last. Output cadence between buffers must be round-robin per frame. (Source: Cycling '74 forum.)
- **Texture patchcords are not connections — they are attribute-set operations on the receiving object's `texture` attribute, and the attribute persists after the cord is deleted.** Removing the cord does not unset the attribute; the receiving object continues to render the last-received texture. To clear, ACTIVELY replace it: connect a different texture source (or an empty `jit.matrix` / `jit.gl.texture`) to overwrite the attribute. Symptom: "I deleted the connection but the effect is still there" — that's a stale texture attribute, not a residual cord. (Source: Cycling '74 forum, "Vsynth Package".)
- **The canonical Jitter layer-compositing trio: `@layer N` per renderable + `@depth_enable 0` on the rendering context + `@blend_enable 1` for transparency.** Higher layer numbers render on top. Without `@depth_enable 0`, depth-testing produces inconsistent stacking that looks like random ordering. Without `@blend_enable 1`, transparency keys produce hard edges instead of compositing. `jit.gl.layer` is a convenience wrapper that handles all three settings inline; the trio is mandatory for any 2D-style overlay system in a 3D Jitter context. (Source: Cycling '74 forum, "Overlay one videoplane on another".)
- **Jitter GL position uses normalised coordinates with `±2` spanning the visible window — NOT pixels, and NOT `±1`.** A `@pos 1 0 0` is half-screen to the right; `@pos 2 0 0` is at the right edge. Pixel-distance math requires pre-scaling: `pixel_offset / (window_width / 2)` gives the normalised offset. The `±2` range is the source of "my object is in the wrong place" misalignment when porting from pixel-coordinate systems. (Source: Cycling '74 forum, "Attaching two screens like layers".)
- **`jit.glue` (and any matrix-combining `jit.*` object: `jit.pack`, `jit.unpack`, `jit.scissors`) requires both matching `dim` AND matching plane count across all input matrices.** Mismatched plane counts (e.g. 1-plane and 3-plane mixed) silently produce wrong output rather than emitting an error. Standardise inputs through fixed-spec `jit.matrix N <type> <dim>` chains before any combine operation. (Source: Cycling '74 forum, "Q: Different FFT spectrum - jit.matrix, jit.glue, jit.world".)
- **Connect `jit.gl.material` to `jit.gl.multiple` / `jit.gl.gridshape` to enable shader-based rendering — current NVIDIA / AMD drivers no longer optimise the deprecated fixed-function OpenGL pipeline.** Counter-intuitive symptom: integrated graphics outperforming discrete NVIDIA on Jitter geometry tests because the drivers de-prioritise fixed-function. Adding a single `jit.gl.material` (default settings are fine) routes the render through the shader pipeline drivers actively optimise. Mandatory for any performance-sensitive `jit.gl.*` geometry chain. (Source: Cycling '74 forum, "Benchmarking Jitter's CPU/GPU performance on your computer", Rob Ramirez (C74).)
- **Whether a `jit.gl.*` object accepts `jit_matrix` on its left inlet is a per-object property — check the refpage's `<jittermethod name="jit_matrix" />` before wiring a matrix into it.** Some GL objects (`jit.gl.videoplane`, `jit.gl.mesh`, `jit.gl.cornerpin`, `jit.gl.layer`) accept a `jit_matrix` directly on their left inlet and auto-convert it into an internal texture; others require an explicit named texture set via `@texturename` and fed by a separate `jit.gl.texture` upstream. The two patterns are NOT interchangeable, and you can't tell from the object's name which it accepts. The reliable check is one grep: `grep 'jittermethod name="jit_matrix"' /Applications/Max.app/Contents/Resources/C74/docs/refpages/jit-ref/<obj>.maxref.xml`. If the line is present, drop the intermediate `jit.gl.texture` — feeding the matrix straight in is simpler AND lets `@interp` on the destination govern sampling without a second filter pass. Without this check, the common failure mode is leaving a `jit.gl.texture` in the chain "to be safe" — which adds a hidden upload step and can re-interp the data before it reaches the consumer. *For instance:* `jit.gl.cornerpin` has the method, so `[v8] → [jit.matrix upscaler] → [jit.gl.cornerpin]` is correct; the otherwise-intuitive `[…] → [jit.gl.texture @name foo] → [jit.gl.cornerpin @texturename foo]` is one box too many.
- **For per-pixel / per-cell display work, prefer a GLSL shader (`[jit.gl.slab @file …jxs]` or `[jit.gl.pix]`) over a `[v8]` / `[js]` script painting a matrix.** The GPU is where the pixels end up; doing the work in a shader skips the JS↔Jitter round-trip per cell, gives operator-facing `param` messages for live tuning, decouples output resolution from input dim (a tiny `1×N` input feeds a `@dim 1920 1080` output via texcoord interpolation), and surfaces compile errors as named, line-numbered console messages instead of the silent black-frame failure modes the JS Jitter API is full of. The IMMER v3 bands renderer was the worked example: five debugging rounds in v8 with no working result, replaced by a ~50-line `.jxs` shader that landed in one pass. Full rationale and JS-fallback criteria in `patching/JITTER_JS_PATCHING.md > When NOT to use JS for matrix work`. JS / v8 is the right tool when the work is control-rate state machines, message dispatch, or small non-display matrix transforms — never when the output goes to `jit.world`.
- **For a small source matrix that must render with crisp pixel edges across a large `jit.world`, insert a fixed-dim `jit.matrix @adapt 0 @interp 0` upscaler before the GL consumer.** The naive chain `[small matrix] → [jit.gl.slab] → [jit.gl.cornerpin] → [jit.world]` produces soft band/cell edges even with `@interp 0` on every GL object, because the matrix-to-texture upload happens at the source resolution and GL's bilinear sampling activates whenever the small texture is mapped onto a larger output quad — in `jit.world`, in the cornerpin warp, OR inside the slab's fragment shader at its `@dim` output. Each of those stages may add another smoothing pass.

  Verified observation: a 1×N source matrix piped into a `[jit.gl.slab @dim 1920 1080 @adapt 0]` shader that draws N variable-width horizontal bands, then through cornerpin into `jit.world`, **renders the band-to-band transitions as smooth color gradients** (one band's color blending into the next over the 1080 vertical pixels), not as the crisp lines the shader's logic emits. Reason: every stage downstream of the small input texture sees a tiny source mapped to a large output and applies its own bilinear sample. **After inserting `[jit.matrix 3 float32 1920 1080 @adapt 0 @interp 0]` between the noise source and the slab**, the same N bands render with **crisp pixel-aligned edges** — no gradient — because the slab now reads from a texture that's already at display resolution with pixel-doubled values, and the downstream stages have nothing left to interpolate.

  `@adapt 0` is critical — without it the upscaler shrinks to match the input dim and the whole purpose collapses. `@interp 0` selects nearest-neighbor for the resize. The horizontal dim (1920) doesn't have to be used by the consumer (a shader that always samples at `x = 0.5` ignores it) — but the dim is still required to get the slab and downstream stages to skip their own interpolation.

  *Worked example:* IMMER v3's bands video. With the upscaler removed (small `1×N` direct into slab): a 3-band frame looks like a vertical gradient from band 0's colour through band 1's into band 2's, no visible boundaries. With `[jit.matrix 3 float32 1920 1080 @adapt 0 @interp 0]` between noise and slab: same 3 bands, crisp horizontal lines at the boundaries, no inter-band smoothing.

  *General rule:* if you want band/cell/pixel-art crispness out of a small Jitter source matrix, **the upscale to display resolution must happen before the texture enters the GL pipeline**. Setting `@interp 0` on downstream GL objects helps but doesn't fully prevent the smoothing — the texture upload itself is the first interpolation stage and the fragment shader's sampler interpolates again at its `@dim` output. Pre-upscaling to display resolution removes both opportunities.
- **Jitter inter-object data flow is patchcord-first — do NOT assume `@name` exists or works.** The intuitive idea that "every Jitter object emits a named matrix you can look up globally" is wrong as a default. Most `jit.*` objects connect to each other via patchcord; the output matrix has no globally-resolvable name unless the object explicitly exposes a naming attribute, and **the naming attribute is not consistently called `@name`**. Verified by refpages:
  - `jit.matrix NAME` — the first creation arg IS the name. Works as `@name` shorthand in convention.
  - `jit.gl.slab @name X`, `jit.gl.texture @name X`, `jit.gl.render @name X`, `jit.world @name X` — `@name` works.
  - `jit.noise @out_name X` — uses **`@out_name`**, not `@name`. Setting `@name immer_widths_noise` on a `jit.noise` is silently accepted and silently does nothing.
  - `jit.gradient`, `jit.fractal`, and other matrix-generator-family objects — check the refpage; the convention varies.

  Symptom of the wrong-attribute-name footgun: a downstream consumer that looks up the matrix by your chosen name doesn't find it. In JS that means `new JitterMatrix("immer_widths_noise")` creates an empty default `1×1 4-plane char` matrix instead of binding to the noise output. In a patch, `[frommatrix immer_widths_noise]` or `[jit_matrix immer_widths_noise]` silently no-ops. The actual data is still flowing through patchcords to whoever is patchcord-connected — but anything reaching for it by name gets the empty placeholder.

  **The discipline:** when connecting two jit.* objects, **prefer a patchcord between them.** Reach for naming only when patchcord wiring is genuinely impossible (e.g. cross-subpatcher reference, or snapshot-then-overwrite scenarios where the same source needs to be sampled at two different moments). And when you do name something, **grep the source object's refpage for `name`** — if the only hit is `<jitterattribute name="out_name" />`, you need `@out_name`, not `@name`. The "never write attribute names from memory" rule applies with full force here; the Jitter family's name attributes are not uniform.

  *Worked example:* IMMER v3's `jit.noise 1 float32 1 1 @name immer_widths_noise` quietly emitted a matrix under an auto-generated name while the `@name` attribute was discarded. Downstream upscalers worked because they were patchcord-connected, but `c2m.inspect` and any name-based snapshot mechanism saw `1×1 4-plane char` empty defaults instead of the actual width data. Fix: `@out_name immer_widths_noise`. Recognition signal: anywhere I'm typing `@name` on a jit.* object's creation text, that's the moment to verify the refpage actually documents `@name` on THIS object rather than `@out_name` or some other family-specific variant.

- **`jit.world @enable` defaults to 0 — set `@enable 1` as a creation attribute.** Without an explicit enable, `jit.world` instantiates as a dark, frozen context: attached `jit.gl.*` objects with `@automatic 1` never get banged, and the operator sees nothing. `@sync 1` / `@fps 30` are not substitutes — they control HOW it renders, not WHETHER. The right idiom is a creation attribute on the world: `jit.world MYCTX @enable 1 @sync 1 @fps 30`. Don't bootstrap with a `loadbang → 1` chain — that's plumbing for a problem the attribute already solves, and it leaves the patch in a "looks fine but renders nothing" state if loadbang fires before the world is fully constructed. If the operator needs runtime on/off control, add a separate `[toggle]` wired to the world's left inlet for live overrides — but the default-on belongs in the object box. Confirmed by `jit.world.maxref.xml`: `enable ... Enable automatic rendering (default = 0)`. The same `default = 0` applies to `jit.gl.render` — `jit.world` is just the wrapper.

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
- **`pattrstorage` supports weighted multi-preset interpolation via `recallmulti <preset> <weight> [<preset> <weight> …]` — weights are auto-normalised across any number of presets.** A common student instinct is to morph between two stored states; `recallmulti` extends this to N-way morphing in one message: `recallmulti 1 0.3 2 0.3 5 0.4` weights preset 1 at 30%, preset 2 at 30%, preset 5 at 40%. The ratio doesn't need to sum to 1 — pattrstorage normalises automatically. For per-element multi-dimensional morphing across multisliders or buffers, `mxj ej.linterp` and `tap.jit.ali` cover the same use case with extra interpolation modes. (Source: Cycling '74 forum, "interpolating between multiple patterns?", Emmanuel Jourdan.)
- **For "hold-until-next-input" semantics — output the previous value when a new value arrives — `bucket` and `zl.reg` are the canonical Max objects.** This is event-state-shifting, not temporal delay. `bucket` is a strict shift register: `bucket 1` outputs the previous value as each new one arrives. `zl.reg` is the more flexible store-one-and-recall register. Time-based objects (`delay`, `pipe`) are the wrong tool — they wait for clock time, not the next input event. (Source: Cycling '74 forum, "Delaying output of number until new number is recieved".)
- **`jit.cellblock` emits the current selection on every selection change — programmatic selection from a parent patch produces output that can re-trigger the parent and create an infinite loop.** When the selection logic and the data-output need to be decoupled, switch UI primitive: the `chooser` object provides "select-an-item" semantics without the data-output coupling. Trying to configure `jit.cellblock` to suppress output on programmatic selection is harder than swapping objects. (Source: Cycling '74 forum, "jit.cellblock - select a cell without getting output".)
- **A message box's RIGHT inlet replaces the box's stored text without triggering output — feed `$1`-template message boxes via the LEFT inlet.** The two inlets are not equivalent. The left inlet both substitutes `$N` arguments AND fires the box's output downstream. The right inlet silently overwrites the body of the message (so `dim 1 $1` becomes whatever was last sent — e.g. the literal `9`) and produces no output at all. Symptom: the downstream consumer receives nothing, AND the next time you open the patch the message box has been mutated to a value that looks like data instead of a template. The fix is per-cord: any `int → message($1-template)` wiring belongs on inlet 0. The general rule is symmetric: when an upstream value needs to BOTH parameterise a message AND trigger its emission, it must arrive at the left inlet. Confirmed by `message.maxref.xml` and reproducible in any patch. *For instance:* `[t b i]` driving a `[dim 1 $1]` formatter — the int outlet wires to inlet 0 of the message box (which substitutes and fires), and the bang outlet fans separately to the downstream object that needs the bang. Mis-wiring the int to inlet 1 produces a silent failure that survives until someone inspects the saved patch's text.
- **Two `jit_matrix` sources fanned into one inlet is a structural conflict — give each matrix source its own dedicated inlet downstream.** Matrices don't mix at an input: each `jit_matrix <name>` message arrives separately and any in-progress processing of the previous matrix is at risk of being clobbered by the next. Even when the downstream object is a `v8` / `js` that *could* internally dispatch by matrix name, the patch's wiring topology is the surface contract — fan-in says "these mix" and matrix sources don't. The right pattern is: bump the downstream object's `numinlets`, route each matrix to a distinct inlet, and let the downstream code distinguish them by the global `inlet` (in v8/js) or by inlet-specific handlers (in gen). The same rule covers `jit.gl.texture` and any other Jitter consumer — one source per inlet. *For instance:* a v8 composing a texture from `jit.noise colors` and `jit.noise widths` declares `inlets = 3` and reads each `jit_matrix` based on which inlet fired, never on the matrix's name. The recognition signal: any time two patchcords carry `jit_matrix` outputs to the same `destination[N]` index, something is wrong — split the destination's inlets first.
- **`textedit` outlet 0 emits `text <symbol>` by default (`outputmode 0`) — a downstream `[setfoo $1]` captures the literal symbol `"text"`, not the typed value.** The handler runs with the wrong argument and the patch silently misbehaves. Three valid fixes: (a) set `@outputmode 1` on the textedit so the value emits as a bare symbol; (b) insert `[route text]` between textedit and consumer to strip the prefix; (c) skip the textedit entirely and bake the value into a `loadbang`-fired message when it's fixed configuration the user shouldn't be retyping at performance time. The general principle: any Max object whose default output is a *list* (not a bare value) silently breaks `$1`-style capture — verify the output format in the refpage before wiring `$N` against it. (Source: confirmed by `textedit.maxref.xml` `outputmode` description; IMMER v2 cloud-config regression, `Invalid URL: text/mu/...`.)

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
