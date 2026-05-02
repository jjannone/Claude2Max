# Forum Insights — Cycling '74 Community Knowledge

Non-obvious Max principles, techniques, performance pitfalls, and
community-preferred patterns extracted from `https://cycling74.com/forums`.
This file supplements the official docs and `SPEC_REFERENCE.md`.

Each entry follows this shape:

> **Insight title**
> The insight in 1–3 sentences.
> *Source*: thread title and URL.
> *Why it matters*: one sentence on when this changes a patching decision.

If an insight is specific to an object, also propagate it to the relevant
section of `SPEC_REFERENCE.md`. If a package-object insight accumulates,
fold it into `package_objects.json`.

Entries flagged **[PROMOTION-CANDIDATE]** are queued for evaluation as
candidate rules in `CLAUDE.md` / `SPEC_REFERENCE.md` / `MAX_PATCHING.md`.
Promotion is user-confirmed only — see "Rules from Corrected Errors" in CLAUDE.md.

## Audio (MSP)

(no entries yet)

## Video / Jitter

> **For multiple independent playheads on one movie file, use `jit.gl.polymovie` (Max 8.2+) — don't load the movie multiple times.**
> The naive approach is to instantiate N copies of `jit.movie`, each loading the same file, and end up holding N copies of every video frame in RAM. `jit.gl.polymovie` provides multi-head playback from a single decoded source. Audio is discarded under this object, so when N independent audio streams matter, fall back to `jit.movie` + duplicate loads or to the `viddll` engine with `loadram` for direct frame access.
> *Source*: [Calling multiple instances of one movie](https://cycling74.com/forums/calling-multiple-instances-of-one-movie) — Rob Ramirez (C74).
> *Why it matters*: any Claude2Max patch that does N-channel video collage (the face-capture / playback territory) should default to `jit.gl.polymovie` rather than fanning out `jit.movie` instances. Belongs in CLAUDE.md / SPEC_REFERENCE.md as the canonical pattern for "play one movie at multiple playheads".

> **For Jitter compositing: `@layer` on each renderable + `@depth_enable 1` on `jit.world` controls draw order. Objects without native `@layer` (e.g. meshwarp) need explicit `jit.gl.layer` capture.**
> Layer N is rendered first; higher numbers go further back. The widely-missed setting is `@depth_enable 1` on the rendering context — without it, layer ordering produces inconsistent results that look like random stacking. Some objects have native `@layer` (mesh, gridshape, videoplane); abstractions like `meshwarp` don't and must be wired through `jit.gl.layer` to participate in the depth ordering. Initialization order at patch load can also break layering (auto-loaded media vs. user-triggered load) — this is a known instability the thread didn't fully resolve.
> *Source*: [getting a handle on layering in Jitter](https://cycling74.com/forums/getting-a-handle-on-layering-in-jitter) — MakePatchesNotWar.
> *Why it matters*: any Claude2Max video patch with multiple GL objects in one render needs the depth_enable + layer combo set explicitly; relying on draw order from spec/connection order produces the "random layering" symptom.

> **[PROMOTION-CANDIDATE]** **Order Independent Transparency in Max 9 requires `jit.gl.pbr` attached to every transparent shape AND `@transparency 1` on `jit.world`.**
> The natural-looking attempt — set `@transparency 1` on `jit.world`, set `@mat_diffuse` alpha on shapes — silently fails: shapes either disappear (transparency 1) or lose intersection blending (transparency 0). The working configuration is: each transparent shape attaches a `jit.gl.pbr`, and the rendering context (`jit.world` or a `jit.gl.node`) has `@transparency 1`. Reference patch (built into Max): `weighted.blended.oit.maxpat`. Non-PBR workaround when you need transparency without PBR: add a dummy `jit.gl.light @diffuse 0 0 0` to override default lighting, then drive appearance via `@mat_emissive` while setting `@mat_diffuse` to `0 0 0 A`. Known limitation (unresolved): intersecting transparent objects and adjacent non-transparent objects still cause discontinuous alpha jumps near edges.
> *Source*: [Order Independent Transparency in Max 9 - can't get it to work](https://cycling74.com/forums/order-independent-transparency-in-max-9-cant-get-it-to-work) — Matteo Marson (C74), Rob Ramirez (C74).
> *Why it matters*: any Claude2Max patch that needs correct transparency ordering for 3D shapes (particle layers, volumetric rendering) must adopt the PBR + `@transparency` recipe; trying to roll your own with blend modes will hit the silent-failure mode described.

> **[PROMOTION-CANDIDATE]** **Shadows on `jit.gl.multiple` work — but only when `jit.gl.material` is connected DIRECTLY to the multiple, not through a `jit.gl.node`.**
> A common mistake: place `jit.gl.multiple` inside a `jit.gl.node` for grouping, then connect `jit.gl.material` to either the geometry inside or the node. Result: only one shadow renders, regardless of how many instances. The fix (Pedro Santos / Dunk): wire `jit.gl.material` directly to `jit.gl.multiple`, bypassing any encapsulating node. The general rule from TFL: `jit.gl.material` and `jit.gl.pbr` are *shaders*, and they only attach to *geometry* objects (`jit.gl.mesh`, `jit.gl.gridshape`, `jit.gl.model`, `jit.gl.plato`) — or to a `jit.gl.multiple` that duplicates geometry. They do **not** attach to `jit.gl.node`, which is a sub-rendering context, not geometry. Reference patch: `lights.shadows.maxpat` (built-in).
> *Source*: [shadows jit.gl.multiple](https://cycling74.com/forums/shadows-jit-gl-multiple) — Pedro Santos, TFL, Rob Ramirez (C74).
> *Why it matters*: clarifies the geometry/node/material connection rules — these are not equivalent attachment points. Should propagate to SPEC_REFERENCE.md "Object Relationships" with the geometry-vs-node-vs-material taxonomy.

> **[PROMOTION-CANDIDATE]** **In a custom `.jxs` shader, textures bind by *declaration order* of `<param>` entries, NOT by matching name to the patch's `@texture` list.**
> The seductive (and wrong) assumption: a JXS `<param name="txKalid" type="int">` will auto-bind to the texture named `txKalid` listed in `jit.gl.shader @texture txChix txKalid`. Reality (Rob Ramirez, C74): the first `<param>` of int-type binds to texture unit 0 (the first name in `@texture`), the second to unit 1, etc. Names are arbitrary labels, not hooks. Symptom of getting it wrong: swapping which texture you sample produces identical output — both samplers point to the same unit. Fix: declare each texture as a separate `<param name="..." type="int" default="N" />` matching the position. Useful references: JXS file format spec, "Your First Shader" tutorial, Jitter manual chapters 41-43.
> *Source*: [Using Vizzie Kalider texture output in shader code issue?](https://cycling74.com/forums/using-vizzie-kalider-texture-output-in-shader-code-issue) — Rob Ramirez (C74).
> *Why it matters*: any Claude2Max patch with a multi-texture custom shader needs this convention spelled out. Belongs in `MAX_PATCHING.md` shader section as the canonical multi-texture binding rule.

> **For PNG textures with transparency in a custom Jitter shader: `discard` fragments where alpha is below threshold to avoid depth-test failures.**
> Naive setup: load PNG → `jit.gl.texture` → bind to shader sampler → `texture(tex0, jit_in.texcoord0)`. Symptom: opaque artifacts visible *behind* transparent regions. Cause: transparent fragments still write depth, so geometry behind them gets depth-tested away. Fix in the fragment stage: `if (color.a < 0.5) discard;` before writing the color. Adjacent insight from the same thread: when scaling line-width offsets in a geometry shader by image aspect ratio, use `ratio = dimY / dimX` and apply as `vec2 n0 = vec2(-v0.y, v0.x) * dist * ratio * 0.5` where `dist = length(p1 - p0)`.
> *Source*: [PNG as Texture in Shader](https://cycling74.com/forums/png-as-texture-in-shader) — Matteo Marson (C74).
> *Why it matters*: any Claude2Max shader patch that loads a PNG with alpha will hit this. Pairs with the alpha+lighting insight in the `jit.gl.multiple` entry above.

> **Jitter matrices use `[columns rows]` (column-major) for `dim`, not `[rows rows]` — modulo / divide arithmetic on flat indices must respect this.**
> Common confusion: declaring `jit.matrix … dim 12 8` and then iterating with `(i % 8)` to get column index returns garbled positions. Reason: `dim 12 8` means **12 columns × 8 rows**, so you need `(i % 12)` for column, `(i / 12)` for row. The other knot is that `setcell N M …` takes `column row …` — also column-first. Practical rule: whenever you do flat-to-2D arithmetic across `jit.matrix`, write the dim values out and double-check which one is the X axis (it's always the first).
> *Source*: [Matrix row miss match](https://cycling74.com/forums/matrix-row-miss-match) — pdelges.
> *Why it matters*: this trap silently misaligns data; symptoms look like "data appears where I didn't put it." Worth a one-liner in `SPEC_REFERENCE.md` Object Notes for `jit.matrix`.

> **`jit.gl.text` and `mc.waveform` both block the Max scheduler on disk reads; for non-blocking display of long audio files, use a dedicated background-loading external.**
> klaus filip's `mc.waveform` JSUI loads soundfile chunks into a JS array via a hidden `buffer~` — but the disk read happens on the patcher thread, freezing UI mouse interaction during loading. The pattern that works: do the disk read in an external (his `ll_externals` package, [github.com/klausfilip/ll_externals](https://github.com/klausfilip/ll_externals) area) where you can spawn a real thread, not in JSUI. Note: in Max 9.1.0+, `mc.waveform` had separate initialization issues (only worked after the second file load) — verify behavior before relying on it.
> *Source*: [mc.waveform](https://cycling74.com/forums/mc-waveform) — klaus filip; reports from missyu, TFL.
> *Why it matters*: when a Claude2Max patch needs to display a long audio file's waveform without UI freeze, default to `ll_externals` rather than rolling JS. Also: any time a JS task() touches disk I/O for big files, expect blocking — push to an external.

> **[PROMOTION-CANDIDATE]** **`jit.catch~ @mode 0` (default) emits irregular matrix `dim` that overrides downstream graph settings — use `@mode 2 @framesize N` for stable dim.**
> Symptom: send `dim 256` to `jit.graph`, watch the dim attribute jump to a high number anyway. Root cause (TFL): mode 0 dumps everything since the last bang, so the matrix width is variable (especially when fed from `jit.world` whose framerate isn't perfectly aligned with your bang cadence). Mode 2 fixes the output frame size to `@framesize`. Two adjacent diagnostic rules: (a) `attrui` cannot keep up with rapidly-changing matrix dim — `jit.fpsui` shows what's actually happening; (b) avoid running `jit.world` and `jit.pworld` simultaneously — they fight; use `jit.pwindow` for preview when `jit.world` is already in the patch. Pedro Santos additionally suggests multiple `jit.gl.graph @scale @position` for stitched audio-graph displays in preference to `jit.glue`.
> *Source*: [jit.catch~ and jit.graph dim jumps issue](https://cycling74.com/forums/jitcatch-and-jitgraph-dim-jumps-to-a-very-high-number-even-if-i-send-it-a-correct-dim-message) — TFL; Pedro Santos.
> *Why it matters*: `jit.catch~`'s default behavior is a foot-gun for any audio→matrix visualization. Encode `@mode 2 @framesize` whenever Claude2Max wires `jit.catch~`. Belongs in `SPEC_REFERENCE.md` Object Notes.

> **[PROMOTION-CANDIDATE]** **`jit.gl.multiple` ignores per-instance alpha when `@lighting_enable 1` — the canonical fix is a custom shader; the workaround is *feature-stack-specific*, not a drop-in.**
> The default shader uses `frontMaterial.diffuse.a` (global) instead of `color.a` (per-instance). The patched shader `multshade.jxs` (downloadable from the thread, with full source) replaces that one line: `jit_out.color.a = color.a;`. **The shader's `name` attribute encodes its feature stack** — `lighting-back_material-[directional]-fill-flat-triangles-instancing-color_vao` — and the fix only works for that exact combo. Switch to point/hemisphere lights, or to front-material rendering, and you need a correspondingly hand-edited variant. Companion settings: `@cull_face 1` (the patched shader removes the back-face normal flip); when stacking `jit.gl.material`, zero out `mat_ambient`/`mat_specular`/`mat_emission` (`0 0 0 0`) so only diffuse alpha contributes to opacity. **No fix exists yet for `jit.gl.pbr` + `jit.gl.multiple` + per-instance alpha** — Rob Ramirez explicitly notes this combo is unresolved. Adjacent design note from Ramirez: instance colors *replace* object colors entirely, while spatial transforms *multiply* with object values — this asymmetry is a deliberate design choice, not a bug.
> *Source*: [Making Alpha channel work in jit.gl.multiple while light_enable is on](https://cycling74.com/forums/making-alpha-channel-work-in-jitglmultiple-while-lightenable-is-on) — Rob Ramirez (C74). Code analysed: `multshade.jxs` (auto-generated shader hand-edited at one line).
> *Why it matters*: any Claude2Max instanced-transparency patch must (a) ship its own `multshade.jxs` matched to the patch's lighting/material stack and (b) re-derive a fresh shader for any change to that stack. The "one fix fits all" assumption silently breaks per-instance alpha across patches.

> **[PROMOTION-CANDIDATE]** **For instanced GPU rendering with multiple `jit.gl.buffer`s, the working pattern is *one buffer per named inlet of `jit.gl.mesh`*, NOT multiple on the same inlet.**
> Marson's diagnosis (the OP's intuition was wrong): the problem is not race conditions or scheduler timing — it's that fanning multiple `jit.gl.buffer`s into the same `jit.gl.mesh` inlet causes the most recent connection to *replace* the prior one. Patchcord connections to `jit.gl.buffer` declare GPU buffer-attachment dependencies, not message edges. Each named inlet (`color`, `position`, `vertex_attr0`–`vertex_attr3`) routes to one attachment. Once each buffer has its own inlet, any update strategy works — including banging all buffers per frame. Two adjacent perf rules surfaced from the same code: (a) consolidate shared vertex data across instances (the OP went from ~100MB/device down a lot by deduplicating); (b) precompute expensive math (sin/cos) on CPU and pass via uniforms/buffers — don't recompute per-vertex/per-fragment. Suggested doc improvement (from the OP, accepted): warn when multiple buffers attach to one inlet.
> *Source*: [Trouble updating multiple instanced jit.gl.buffers in real time](https://cycling74.com/forums/trouble-updating-multiple-instanced-jitglbuffers-in-real-time) — Matteo Marson (C74).
> *Why it matters*: structural rule for any Claude2Max GPU-instanced render patch. Belongs in `MAX_PATCHING.md` as the canonical wiring recipe with the `vertex_attr*` inlet table.

> **[PROMOTION-CANDIDATE]** **Patcher arguments are not directly readable from `js`/`v8` — instantiate a `patcherargs` external, route to JS, handle in `list()`. `this.patcher.box.boxtext` reads the calling box's text as a related but indirect alternative.**
> Confirmed by Jeremy Bernstein: the Patcher class has no `args` property or `getArgs()` method; this is a long-standing capability gap. The community-standard workaround (johnpitcairn, confirmed by Mattijs): `patcherargs` external in the parent patcher → outlet routes into the JS object → on `bang`, JS receives args via a `list()` handler. After args are captured, the `patcherargs` can be deleted if dynamic. Box-text inspection: `this.patcher.box.boxtext` returns the literal text of the box that contains your JS — useful for parsing args from "v8 myscript.js arg1 arg2" type wiring, but stringly-typed.
> *Source*: [accessing patcher arguments with javascript](https://cycling74.com/forums/accessing-patcher-arguments-with-javascript) — Jeremy Bernstein, johnpitcairn.
> *Why it matters*: when a Claude2Max-generated subpatcher needs configuration values, default to `patcherargs` rather than expecting JS-native introspection. Document in `CLAUDE.md` JavaScript section as the canonical pattern.

> **For M4L device distribution: freezing pulls in `.js` files; `v8` also embeds source by default (toggleable in Inspector). Live 12.2 (June 2024) is the first Live that ships with Max 9.**
> Freezing a `.amxd` packages externals, `poly~` voice abstractions, saved subpatchers, bpatchers, and JS files into one self-contained device. `v8` embeds its source independently of freezing, so a `v8`-using device sent to another user works without the `.js` companion file (the embed can be disabled via Inspector if you want to require a separate file). Compatibility ceiling: a device using Max 9 features (including `v8`) will not load in Live 11 or pre-12.2 Live 12 — Live 12.2 is the first release with Max 9. For wider compatibility, fall back to `js` (SpiderMonkey, available since Max 5).
> *Source*: [Embed javascript in M4L object?](https://cycling74.com/forums/embed-javascript-in-m4l-object) — KrisW; Julien Bayle; tyler mazaika.
> *Why it matters*: every Claude2Max M4L target needs an explicit Live-version decision before picking `v8` vs `js`.

> **`jit.gl.syphonclient` has no `@unique` / `hasNewFrame` equivalent — frame-rate cannot be matched to the source stream from the Max side as of this thread.**
> Rob Ramirez (maintainer of the Jitter-Syphon fork) acknowledged the request as reasonable but unimplemented. Underlying Syphon framework exposes `hasNewFrame` (the iOS-style "is there new content" property), but the Jitter wrapper doesn't surface it. Practical implication: if your Claude2Max patch needs to react only when a new Syphon frame arrives (frame-accurate analysis, recording, non-realtime processing), you have to poll at a rate ≥ source FPS and accept duplicate-frame work, OR use a side-channel (OSC, send/receive) from the Syphon-source patch to signal frame arrivals.
> *Source*: [jit.gl.syphonclient: adapt frame-rate to syphon stream?](https://cycling74.com/forums/jit-gl-syphonclient-adapt-frame-rate-to-syphon-stream) — Rob Ramirez (C74).
> *Why it matters*: design constraint to know upfront when wiring a Syphon-input patch.

> **`suckah` (screen-pixel sampling) has been broken on Apple Silicon across Max 8.5–9.1.4 — outputs `1. 1. 1.` constantly with sporadic noise; macOS screen-recording permission for Max + restart is sometimes (unreliably) the workaround.**
> Confirmed across Sonoma, Sequoia, and Tahoe on M1/M3/M4 hardware. No C74 staff response in the thread. TFL claimed a fix in Max 8.6.5 but later reports contradict. Consider `suckah` unreliable on Apple Silicon for production use; substitute approaches: render the target into a `jit.matrix` and read cells directly (`getcell N M`), or use `jit.gl.read` to capture the GL context as a matrix and process from there.
> *Source*: [Suckah object not working / bug](https://cycling74.com/forums/suckah-object-not-working-bug).
> *Why it matters*: don't recommend `suckah` in any new Claude2Max patch on Apple Silicon. Belongs in `SPEC_REFERENCE.md` Object Notes as a known-broken object.

> **For per-voice param access in polyphonic RNBO: set `@exposevoiceparams 1` on the subpatcher AND use the `voice` object with `list.lookup` / `list.nth` to address voices by index. RNBO's web interface MIDI mapping picks up exposed voice params automatically.**
> Two layers: (a) inside the subpatcher, the per-voice params must be marked exposed with `@exposevoiceparams 1` for them to surface to the host; (b) inside the patch, address per-voice values by indexing into a list keyed on the `voice` object's output (the voice number 1..N). Once exposed, the RNBO Web Export interface auto-generates MIDI map targets per-voice with `@min`/`@max`/`@fromnormalized` for controller scaling. Practical implication for Claude2Max RNBO patches deploying to Raspberry Pi (rnbo.runner): MIDI mapping is the canonical way to reach per-voice params from external hardware controllers.
> *Source*: [Accessing per-voice params inside polyphonic RNBO subpatcher](https://cycling74.com/forums/accessing-per-voice-params-inside-polyphonic-rnbo-subpatcher) — Alex Norman (C74).
> *Why it matters*: RNBO patch generation rule — when the spec asks for polyphonic voice access, set `@exposevoiceparams 1` and document the voice/list.lookup pattern in the comments.

> **[PROMOTION-CANDIDATE]** **`copymatrixtoarray` / `copyarraytomatrix` is the canonical Jitter↔JS interop. For matrix sift/filter, prefer JS `Array.sort` (TimSort, O(n log n)) over `jit.bsort` (bubble sort, O(n²)).**
> Wesley Smith's `xray.jit.sift` filters matrix entries by a binary mask. The vanilla replacement (Rob Ramirez's recommendation; Vincent Goudard's `vg.jit.sift.js`): inside a `v8`/`js` object, call `copymatrixtoarray` to pull matrix data into a typed JS array, run the filter/sort logic in JS, call `copyarraytomatrix` to write back. Output `dim` / `planecount` / `type` must be set on the output JitterMatrix *before* `copyarraytomatrix` (assigning afterward silently misaligns the destination). For a filter-only path (no sort), iteration with `push()` runs O(n) and outperforms any of the matrix-only alternatives.
> *Source*: [vanilla Max version of xray.jit.sift](https://cycling74.com/forums/vanilla-max-version-of-xrayjitsift) — Rob Ramirez (C74); Vincent Goudard.
> *Why it matters*: surfaces `copymatrixtoarray` / `copyarraytomatrix` as the canonical bridge for any non-trivial matrix transform. Should be in `CLAUDE.md` v8/JavaScript section with a snippet — relevant whenever a Claude2Max patch needs sort, filter, or any JS-side scan over matrix data.

> **For "scrolling notes toward a hit zone" (guitar-hero style): use 1 `counter` + 1 `poly~` with per-voice X offset, NOT N render nodes; keep `jit.gl.pass` *outside* poly~.**
> Pedro Santos's pattern (he's the author of the referenced original patch): drive all N voices from a single `counter` for synchronization, voice all rendering inside one `poly~` with per-instance X-offset (passed via voice color or arg). Critically, post-processing via `jit.gl.pass` belongs *outside* the poly~ — `jit.gl.pass` runs once per output frame, so putting it inside poly~ multiplies the work by the voice count. Author's note: substituting `jit.gl.multiple` for the rendering core is more stable but loses some visual character — both are valid.
> *Source*: [Guitar-hero like behaviour in Jitter](https://cycling74.com/forums/guitar-hero-like-behaviour-in-jitter) — Pedro Santos.
> *Why it matters*: any Claude2Max patch with N parallel scrolling visual lanes (sequencer note display, audio meters, multi-channel scopes) should default to this consolidation pattern. The `jit.gl.pass`-outside-poly~ rule is broadly applicable to any post-processing in a poly~ context.
> `@line_length` constrains the printed line to a width, breaking onto subsequent lines past that. Two known quirks: (a) `@line_length` exhibits a buggy behavior where the first line shows the entire word instead of breaking — workaround is to insert spaces between characters; (b) for many simultaneous text objects, switch from `jit.gl.text` to `jit.gl.textmult`, which is engineered for higher-throughput text rendering at the cost of more setup complexity. Performance gotchas (general): rapid string updates and font reloads each cost more than position changes; cache strings when possible.
> *Source*: [Optimizing jit.gl.text behaviour](https://cycling74.com/forums/optimizing-jitgltext-behaviour) — TFL.
> *Why it matters*: when Claude2Max generates a patch with multiple text overlays (subtitles, debug HUDs, scoring), `jit.gl.textmult` should be the default; reserve `jit.gl.text` for one-off labels.

## JavaScript / v8

> **`v8` cannot `require()` a JSON file the way Node can — pivot to `Dict` (load via dictionary message) or `declareattribute` at runtime.**
> Despite v8's superficial similarity to Node, `require()` of a `.json` extension fails with "could not find file". The forum thread didn't surface a sanctioned alternative; the OP pivoted away by calling `declareattribute` at runtime to mutate attribute metadata, bypassing the JSON-load path entirely. Practical canonical alternatives for "I need to read a JSON file in v8": (a) instantiate a `Dict` Max object externally, send it the file path via `read`, route it back into v8 as a dictionary; (b) use `File` (open/read/close) for raw text + `JSON.parse`. This thread didn't surface (b) but it's the v8-natural path.
> *Source*: [v8 and require a json file](https://cycling74.com/forums/v8-and-require-a-json-file).
> *Why it matters*: the three-JS-surfaces distinction (`js` / `v8` / `node.script`) keeps surfacing — only `node.script` has real Node `require`. Claude2Max specs that load JSON should pick the right surface explicitly.

> **[PROMOTION-CANDIDATE]** **For ESM in `node.script` (Max 8.6+): use `.mjs` extension, `import Max from 'max-api'`, and recreate `__filename` via `fileURLToPath(import.meta.url)`.**
> `node.script` runs real Node.js, but ESM imports were broken before Max 8.6 — fixed officially in 8.6+. The canonical pattern from Joshua Kit Clayton (C74):
>
> ```javascript
> // file: my-script.mjs    <-- the .mjs extension is what triggers ESM
> import Max from 'max-api';
> import path from 'path';
> import { greeting, sayHello } from './myModule.mjs';
> import { fileURLToPath } from 'url';
> const __filename = fileURLToPath(import.meta.url);
> // require() is unavailable in ESM scope — use import for everything
> ```
>
> Two adjacent points: (a) `package.json` with `"type": "module"` also signals ESM but is less reliable than the `.mjs` extension; (b) for older Max with strict CommonJS, esbuild can bundle TypeScript/ESM down to CJS: `esbuild index.ts --platform=node --bundle --external:max-api --format=cjs --outfile=./index.js`.
> *Source*: [Support modern ESM imports in Node for Max](https://cycling74.com/forums/support-modern-esm-imports-in-node-for-max) — Joshua Kit Clayton (C74), Florian Demmer (C74).
> *Why it matters*: this is the canonical ESM recipe for Claude2Max projects that use `node.script`. Belongs in CLAUDE.md's v8/JavaScript section alongside the existing CJS/ESM warning.

## MIDI

(no entries yet — DMX-related infrastructure relevant to MIDI-adjacent control surfaces noted in Patching Patterns)

## UI / Presentation

(no entries yet)

## Performance

> **`node.script` has a confirmed (unresolved) memory leak when receiving high-throughput messages — escalates at ~135MB/hour at 44Hz × 20 universes × 512 values.**
> Dan (C74 support) reproduced and escalated this bug after Gabriel Lavoie Viau measured unbounded growth. macOS Instruments traces show thousands of persistent `malloc` allocations (144B and 80B blocks) in `hashtab_storeflags` / `dictionary_appendatom_flags` paths, with no corresponding deallocation. The leak appears to live in the serialization layer of the `node.script.mxo` external rather than in user code. Initial GC-pressure hypothesis (V8 inside Node falling behind) was disproven — leak persists at modest rates (~44Hz) where GC has plenty of headroom. **No workaround documented as of the thread close.** Practical advice for Claude2Max patches that send heavy traffic to `node.script`: budget for periodic restarts, or push the heavy work back into `v8` (in-patcher, no leak observed) when feasible.
> *Source*: [Node for Max Memory Issue?](https://cycling74.com/forums/node-for-max-memory-issue) — Dan (C74).
> *Why it matters*: this is a planning consideration for any long-running Claude2Max patch using `node.script` for high-rate I/O (DMX, MIDI flood, network firehoses). The bug is real, confirmed, unresolved.

## Patching Patterns (general)

> **For preset management beyond native `preset` / `pattrstorage`, use `tc.preset` (community v8ui) — drag-to-reorder, color-coded slots, in-box rename, automatic JSON sync.**
> Native `pattrstorage` lacks visual cues for interpolation state, doesn't show "previously selected" highlight, and has minimal customization. `tc.preset` (TFL, [github.com/Teufeuleu/tc.preset](https://github.com/Teufeuleu/tc.preset)) is a JSUI/V8UI replacement that adds: drag-and-drop preset reordering, per-slot color modes, interpolation visibility, automatic JSON file syncing, "click selects, double-click recalls" mode. Two versions ship in the same package: a `jsui`-based variant for Max 8, a `v8ui`-based variant for Max 9 — same functionality. Multi-bpatcher patterns (numbered slot ranges like 1xxx for module A, 2xxx for module B) are explicitly supported. Practical limit from the dev: scrolling through 1000+ slots becomes sluggish (the UI pre-draws); above 10k is impractical. Touchscreen multitouch scrolling not yet supported.
> *Source*: [tc.preset: a new companion to pattrstorage](https://cycling74.com/forums/tcpreset-a-new-companion-to-pattrstorage) — TFL.
> *Why it matters*: when Claude2Max generates a patch with non-trivial preset management (live performance, multi-state instruments), reach for `tc.preset` over hand-rolling preset UIs. Promotion candidate for `package_objects.json` once the package is curated.

> **For ENTTEC DMX USB Pro on macOS: prefer the community external `jam.dmxusbpro` over hand-rolling `serial`; install the FTDI VCP driver on M1 Macs.**
> The original `dmxusbpro` external (nullmedium) is end-of-life. Jan Mech maintains a successor pair: `jam.dmxusbpro` (event-driven) and `jam.dmxusbpro~` (audio-rate). Both manage the serial connection on a dedicated thread (not the Max scheduler) so DMX timing isn't perturbed by patch activity. Critical setup gotcha for Apple Silicon: the M1 will not see the ENTTEC unless the FTDI VCP driver (ARM64 build) is installed directly from FTDI; the macOS bundled driver is insufficient. Practical limits: `speedlim` ≥50ms is stable, faster rates can crash older versions. Message format: list pairs of channel + value (e.g. `1 128 4 255` sets channels 1 and 4, leaves all others at their last value — DMX is stateful). Useful attrs: `@verbose` for dropped-frame warnings; `@keepsending 1` (default) for continuous transmission. Source/releases: [github.com/janmech/jam](https://github.com/janmech/jam/releases).
> *Source*: [[sharing] My take on an ENTTEC DMX USB Pro external](https://cycling74.com/forums/sharing-my-take-on-an-enttec-dmx-usb-pro-external) — Jan Mech (61 replies).
> *Why it matters*: when Claude2Max generates a lighting-control patch, recommend `jam.dmxusbpro` over `serial` directly. Worth flagging in package_objects.json once it's curated — for now, this entry is the canonical reference.

> **`multislider` in non-continuous mode emits its list TWICE per click — once on mouse-down, once on mouse-up.**
> The mode that fires only on mouse-up is `@contdata 2`, but Max 8's inspector only exposes a binary checkbox toggling 0 ↔ 1 — mode 2 is reachable only by editing the spec/text. This is documented but undiscoverable through the GUI. Workarounds: (a) `mousefilter` to dedupe; (b) `zl reg` on the output to debounce; (c) Max 9's inspector reportedly exposes all three modes. The double-output is intentional — mode 0 is "fires on mouse-down + mouse-up". The bug is the inspector's incomplete exposure of the modes, not the multislider itself.
> *Source*: [multislider bug](https://cycling74.com/forums/multislider-bug-1).
> *Why it matters*: when Claude2Max generates a multislider that should fire only when the user finishes dragging, set `@contdata 2` explicitly in the spec. Belongs in SPEC_REFERENCE.md as a multislider object note.

## Gen / gen~

(no entries yet)

## Max for Live

(no entries yet)

## LLM / AI-Assisted Patching

> **The contemporary field is small and converging on three architectures: imperative-Python-emits-`.maxpat` (MaxPyLang), live-MCP-mutation (MaxMCP, tiianhk), and declarative-spec-emits-`.maxpat` (Claude2Max). No project combines refpage-grounded I/O, a curated installed-package library, and embedded-spec round-trip — those remain Claude2Max's specific differentiators.**
> Thread 2 is a project-announcement exchange: OP demos Claude Code + MaxPyLang (Barnard PL Labs, Python imperative API the LLM writes against), Reply 1 points at an unnamed third-party MCP server, Reply 2 is the MaxPyLang team's own announcement of "vibe-coding" support. No technical critique, no failure modes, no shared patches. Reply 30 of Thread 1 separately points at `github.com/taylorbrook/MAX-MSP_CC_Framework` — **this is the same source Claude2Max imported its original 1,694-object I/O database from in 2026-04 before replacing it with on-demand `RefpageCache` parsing of Cycling '74's bundled refpage XML.** The community's contemporary tools cluster around live MCP (Max running, no file artifact) or imperative codegen (file artifact, no curated package knowledge or refpage verification). Worth borrowing from the field: MaxMCP's Claude Code plugin/skills surfacing pattern (codify guidelines as commands rather than burying them in `CLAUDE.md`); tiianhk's first-class "explain this patch" workflow.
> *Source*: [Claude Code to generate Max Patches](https://cycling74.com/forums/claude-code-to-generate-max-patches) — Chris (OP), Barnard PL Labs.
> *Why it matters*: orientation. When a user asks "isn't this what MaxPyLang/MCP already does?" the answer is no — they occupy different cells in the architecture matrix and trade away things Claude2Max keeps. Claude2Max's moat (curated package library + refpage-backed I/O + embedded spec round-trip) is not duplicated anywhere yet.

> **2023-vintage LLM failures at "emit Max JSON directly" mapped exactly the foot-guns Claude2Max's rules are designed to prevent: object-name hallucination, framework confusion (Pd / SuperCollider syntax surfacing as Max), and confident "simplifications" of `gen~` code that quietly remove critical variables. The diagnosis offered (Replies 17–18, 2024) — "you need *correctly working* patches with prose descriptions" — is the data-quality problem, and Claude2Max's spec-with-embedded-source-of-truth pattern is a partial answer.**
> Documented failure modes from Thread 1: ChatGPT-3.5 producing `gen~` code that referenced unknown functions (`atanh`) and removed critical variables when asked to "simplify" (Gussi, Reply 5); Bard returning Pd syntax instead of Max, fabricating "polyphase filter" explanations, emitting `[seq 33] [metro]` for a 33-step sequencer (Roman Thilenius, Reply 12); a model output that conflated MaxMSP with SuperCollider (`#include "msp.h"`, `SinOsc(440)`) (Reply 15). Reply 3's analysis — "for Max there is maybe a few thousand sources from two dozen websites or books" — is the corpus-sparsity diagnosis. The thread is otherwise ~75% AI-philosophy debate; the substantive engineering content fits in roughly 5 replies.
> *Source*: [Max and Large Language Models / Generative AI / GPT / etc....](https://cycling74.com/forums/max-and-large-language-models-generative-ai-gpt-etc) — multi-author thread (2023-06 → 2026-04, 36 replies).
> *Why it matters*: justifies CLAUDE.md's existing rules — `Never Write API Names From Memory`, refpage verification, `Modify, Don't Rebuild` — from the empirical evidence of what fails when those rules aren't enforced. When onboarding a student or peer who's skeptical that the rules are necessary, this thread is the receipt.

## RNBO

> **RNBO patches travel as `.rnbopack` files (single-file bundle of patcher + assets + metadata); reference patches for Move are in `Cycling74/rnbo.runner.content`.**
> The `.rnbopack` format is the canonical way to distribute an RNBO graph between Max users — single file, opens directly in Max. The Cycling '74-maintained repository [github.com/Cycling74/rnbo.runner.content](https://github.com/Cycling74/rnbo.runner.content) hosts reference patches for the Move device including the `sketchyetcher` and `4Loopers` examples studied here. Useful patterns observed in those examples: (a) on Move, motion controls map most intuitively when `y` increases-up (turn-right-up, turn-left-down) — this is non-default and worth setting explicitly; (b) for multi-looper architectures where one looper sets the master cycle and others quantize to it, store recordings in distinct buffers with synchronized lengths; (c) UI feedback via color-coded button states (red recording, green playback, white stopped) is the convention.
> *Source*: [Move Drawing Toy (Sketchy Etcher)](https://cycling74.com/forums/move-drawing-toy-sketchy-etcher) — Alex Norman (C74); [4 x Looper](https://cycling74.com/forums/4-x-looper) — pag.
> *Why it matters*: when Claude2Max produces an RNBO patch, especially for Move, the GitHub reference repo is a higher-quality starting point than the bundled examples. Note the `.rnbopack` distribution format in spec/CLAUDE2MAX docs.
