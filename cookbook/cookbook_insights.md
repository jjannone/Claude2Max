# Max Cookbook Insights — Christopher Dobrian / UC Irvine

Patching insights extracted from the Max Cookbook (`https://music.arts.uci.edu/dobrian/maxcookbook/`).
Insights live in the example patches, not just the page text — every entry
below was extracted by reading the downloaded `.maxpat` in full, not just
summarizing the page.

This file supplements the official docs, `SPEC_REFERENCE.md`, and
`c74-forum/forum_insights.md`.

Each entry follows the same shape as `c74-forum/forum_insights.md`:

> **Insight title**
> The insight in 1–3 sentences.
> *Source*: recipe title and URL (and the patch filename it was extracted from).
> *Why it matters*: one sentence on when this changes a patching decision.

If an insight is specific to an object, also propagate it to the relevant
section of `SPEC_REFERENCE.md`. If a package-object insight accumulates,
fold it into `packages/package_objects.json`.

Entries flagged **[PROMOTED 2026-05-04]** are queued for evaluation as
candidate rules in `CLAUDE.md` / `SPEC_REFERENCE.md` / `MAX_PATCHING.md`.
Promotion is user-confirmed only — see "Rules from Corrected Errors" in CLAUDE.md.

## Audio (MSP)

> **`number~` in Signal Output mode (`mode 1`) with the Ramp Time attribute is the one-object replacement for the `pack value 10 → line~ → *~` chain.** A `number~` set to mode 1 emits its value as a continuous signal and interpolates linearly to each new value over the configured Ramp Time. Cookbook's recommendation for amplitude smoothing: 10–20 ms. Use Example B vs Example A in `amplitudecontrol.maxpat` to see them produce identical output.
> *Source*: [Audio amplitude control](https://music.arts.uci.edu/dobrian/maxcookbook/audio-amplitude-control) — `amplitudecontrol.maxpat`. Cross-reference: [Adjusting audio amplitude](https://music.arts.uci.edu/dobrian/maxcookbook/adjusting-audio-amplitude) — `adjustamplitude.maxpat`.
> *Why it matters*: any Claude2Max spec that needs to smooth a UI control into an audio multiplier should default to `number~ @mode 1 @ramptime 10` instead of synthesizing the three-object chain. Fewer boxes, fewer spec entries, less wiring.

> **[PROMOTED 2026-05-04]** **For perceptually-linear amplitude fades, use a dB-mapped slider with a `select 0 → 0.` short-circuit at the silence end.** A linear slider mapped to amplitude sounds drastic at the bottom and underwhelming at the top — human loudness is closer to logarithmic. The cookbook pattern: `slider 0..-60 → dbtoa → number/line~ → *~`, with a `sel -60 → 0` branch that forces literal silence at the bottom (because `dbtoa(-60dB)` ≈ 0.001, audibly soft but never zero). For a one-object replacement, `gain~` does all of this internally (dB-mapped UI + interpolation + true-silence handling).
> *Source*: [Audio amplitude control](https://music.arts.uci.edu/dobrian/maxcookbook/audio-amplitude-control) — `amplitudecontrol.maxpat` Examples C and D. Also: [Amplitude and decibels](https://music.arts.uci.edu/dobrian/maxcookbook/amplitude-and-decibels) — `amplitude_decibels.maxpat`, which compares linear vs `(x/127)^4` exponential vs dB mappings side-by-side.
> *Why it matters*: any Claude2Max patch with a user-facing volume control should default to `gain~` or to the dB-mapped slider+`sel`+`dbtoa` pattern. Don't ship a linear slider mapped directly to `*~`. Belongs in `MAX_PATCHING.md` UI section.

> **`sig~ N` is a constant-value signal source — required when feeding a constant into a signal-rate math object.** Objects like `*~`, `+~`, `-~`, `atan2~`, `sqrt~` accept signals only on signal inlets. To use a constant (e.g. for `1 - x` as a crossfade complement, or a fixed y-coordinate in a polar conversion), wrap it in `sig~`: e.g. `sig~ 1. → -~ → ...`. Without `sig~`, a literal 1. in the message-rate inlet of `-~` works but produces a one-shot, not a continuous signal-rate value.
> *Source*: [A/B audio crossfade](https://music.arts.uci.edu/dobrian/maxcookbook/ab-audio-crossfade) — `abaudioxfade1.maxpat` (`sig~ 1. → -~` for crossfade complement). [Calculating Doppler shift](https://music.arts.uci.edu/dobrian/maxcookbook/calculating-doppler-shift-moving-virtual-sound-sources) — `dopplerexample.maxpat` (`sig~ 1. → atan2~` for unit y-axis).
> *Why it matters*: when generating signal-rate math chains from a Claude2Max spec, the moment any operand is a constant, the spec needs a `sig~` box. Easy to miss; produces silent-failure (no signal where there should be one).

> **The "reverse" arithmetic objects (`!-`, `!/`, `!-~`, `!/~`, `!*~`, `!+~`) put the constant-arg operand on the LEFT of the operation.** E.g. `!/ 1.` computes `1 / inlet` — useful for inverting a value without a separate `1.` source. The signal-rate variants (`!-~ 1.`, `!/~ 1.`) avoid the `sig~` constant pattern above when the constant happens to be on the operation's left side.
> *Source*: [Amplitude is inversely proportional to distance](https://music.arts.uci.edu/dobrian/maxcookbook/amplitude-inversely-proportional-distance) — `distance&amplitude.maxpat` (`!/ 1.` for `1/d`). [Calculating Doppler shift](https://music.arts.uci.edu/dobrian/maxcookbook/calculating-doppler-shift-moving-virtual-sound-sources) — `dopplerexample.maxpat` (`!-~ 1.` for `1 - signal`, `!/~ 1.` for `1/signal`).
> *Why it matters*: prevents the common misstep of building a 3-object chain (`sig~ 1.` + `-~` or `expr 1.-$f1`) for a one-object operation. Belongs in `SPEC_REFERENCE.md` Object Notes for the `!*` family.

> **For a samplerate-aware one-shot conversion, use `adstatus sr` (not `mstosamps~`) to read the current samplerate.** `mstosamps~` is signal-rate; for a single message-rate sample count, `loadbang → button → adstatus sr` outputs the current samplerate as an int via outlet 1. This avoids hardcoding 44100 and adapts to whatever the current DSP sample rate happens to be.
> *Source*: [Alter phase of sinusoid by milliseconds](https://music.arts.uci.edu/dobrian/maxcookbook/alter-phase-sinusoid-milliseconds) — `alterphaseofsinebyms.maxpat`.
> *Why it matters*: any Claude2Max patch that needs a one-time samples-from-ms calculation (delay buffer sizing, fade lengths in samples) should use `adstatus sr` rather than literal 44100. Not silently broken at 44.1k, but silently wrong at 48k or 96k.

> **`peakamp~ N` + `pack value rampms → line~` is the canonical envelope follower idiom.** `peakamp~ N` reports the peak absolute amplitude over the last N milliseconds (sent as a float message at that interval). The follow-up `pack value rampms → line~` smooths the discrete updates into a continuous signal-rate envelope. Cookbook variant exposes both `peakamp~` interval AND `line~` ramptime as separate args, letting the user trade latency vs smoothness independently.
> *Source*: [A variation on the simple envelope follower](https://music.arts.uci.edu/dobrian/maxcookbook/variation-simple-envelope-follower) — `envelopefollower2~.maxpat`.
> *Why it matters*: the standard reach for "follow this signal's amplitude to drive a control parameter" — preferable to rolling your own RMS or `abs~ → slide~` chain. Belongs in `SPEC_REFERENCE.md` Object Notes for `peakamp~`.

> **`tapin~ N` allocates a delay-line buffer of N ms; `tapout~` reads from it at one or more signal-rate-modulated offsets.** Crucial detail: the delay length is set on `tapin~` at allocation time; `tapout~`'s signal inlets are the read offsets, not the buffer length. The Doppler example modulates `tapout~` continuously to produce realistic Doppler pitch-shift from a moving source — the read-offset signal IS the Doppler delay in milliseconds (`distance / 0.344 m·ms⁻¹`).
> *Source*: [Calculating Doppler shift](https://music.arts.uci.edu/dobrian/maxcookbook/calculating-doppler-shift-moving-virtual-sound-sources) — `dopplerexample.maxpat`.
> *Why it matters*: any Claude2Max patch that needs variable-time delay (echo with modulated time, vibrato via delay-modulation, Doppler) should use `tapin~`/`tapout~` rather than `delay~` (which is fixed-length and integer-sample-only). Belongs in `SPEC_REFERENCE.md` Object Notes for `tapin~`/`tapout~`.

> **Constant-power panning uses `sqrt(az)` and `sqrt(1-az)` for L/R amplitudes — linear panning dips audibly at center.** With `az ∈ [0,1]` (0 = full left, 1 = full right): linear pan multiplies L by `(1-az)` and R by `az`, but at center (`az=0.5`) total power = `0.5²+0.5² = 0.5` (down 3 dB). Constant-power pan multiplies L by `sqrt(1-az)` and R by `sqrt(az)`, so total power = `(1-az)+az = 1` (constant). Audible difference: linear pan sounds quieter at center; constant-power pan sounds even across the field.
> *Source*: [Calculating Doppler shift](https://music.arts.uci.edu/dobrian/maxcookbook/calculating-doppler-shift-moving-virtual-sound-sources) — `dopplerexample.maxpat` uses signal-rate `sqrt~` on the `atan2~` azimuth angle (normalized via `/~ 3.141593`).
> *Why it matters*: any Claude2Max stereo panner should default to constant-power; the implementation cost is two `sqrt~` objects vs none. Belongs in `MAX_PATCHING.md` audio-routing patterns section.

> **`startwindow` (not `start`) on `dac~` enables DSP only when the patcher is foregrounded — appropriate default for example/teaching patches.** `start` keeps DSP running even when the patcher is hidden, which is fine for performance patches but is rude when opening a folder of cookbook examples. `startwindow` auto-stops DSP when another patcher takes focus, so loading multiple example patches in sequence doesn't pile up a wall of simultaneous DSP.
> *Source*: [Adjusting audio amplitude](https://music.arts.uci.edu/dobrian/maxcookbook/adjusting-audio-amplitude) — `adjustamplitude.maxpat` (`loadbang → startwindow` pattern). [Arpeggiate the harmonic series](https://music.arts.uci.edu/dobrian/maxcookbook/arpeggiate-harmonic-series) — `arpeggiate16harmonics.maxpat` (`loadmess startwindow`).
> *Why it matters*: every `dac~` in a Claude2Max teaching/example patch should be initialized via `startwindow`, not `start`. Belongs in `MAX_PATCHING.md` "Common Pitfalls" section.

> **`closebang → stop` on `sfplay~` + `dac~` is the cleanup-on-close idiom.** `closebang` fires once when the patcher window closes. Wiring it to a `stop` message → `sfplay~` and to the `dac~` toggle ensures audio doesn't continue playing in the background after the user closes the patch — crucial for interactive examples that run as standalone files.
> *Source*: [Adjusting audio amplitude](https://music.arts.uci.edu/dobrian/maxcookbook/adjusting-audio-amplitude) — `adjustamplitude.maxpat`.
> *Why it matters*: presentation-mode-driven Claude2Max patches that auto-start audio should pair `loadbang → start` with `closebang → stop` to avoid leaving DSP running. Cheap insurance.

> **Two `adsr~` objects driven by the same gate produce coupled-but-independent envelopes — the canonical "synth voice" pattern is amp-env + filter-env from one note-on.** Both `adsr~`s share the same trigger signal (e.g. `sel 1` from `mousestate`, or a velocity message). Each carries its own `attack decay sustain release` args. The amp envelope multiplies the source signal (`*~`); the filter envelope is added to a base cutoff and fed to `lores~`'s frequency inlet. Different ADSR times produce the characteristic "filter-sweep on attack, longer than amplitude attack" sound.
> *Source*: [ADSR filter envelope](https://music.arts.uci.edu/dobrian/maxcookbook/adsr-filter-envelope) — `sawsynth.maxpat` (`adsr~ 200 1800 0.05 400` for amp; `adsr~ 5 1995 0.125 500` for filter cutoff).
> *Why it matters*: any Claude2Max synth voice spec should plan from the start for parallel ADSRs sharing a gate, not a single envelope reused for both targets. Belongs in `MAX_PATCHING.md` synthesis-patterns section.

## Patching Patterns

> **[PROMOTED 2026-05-04]** **The cookbook poly~-ready abstraction template uses BOTH `inlet`/`outlet` AND `in N`/`out~ N`/`in~ N` — the same patch then works as a regular subpatch OR as a `poly~` voice without modification.** A `p` parent reads the `inlet`/`outlet` boxes; a `poly~` parent reads the `in`/`out`/`in~`/`out~` boxes. Wiring inside the abstraction connects whatever serves the same data to both, so either parent gets the same behavior. Equally important: every `inlet`/`outlet` carries an explicit `comment="(<type>) <description>"` attribute (e.g. `comment="(float) peak amplitude"`, `comment="(signal) FM tone"`) which surfaces as a tooltip in the parent's Inspector.
> *Source*: [A subpatch suitable for use in poly~](https://music.arts.uci.edu/dobrian/maxcookbook/subpatch-suitable-use-poly) — `FMsynth~.maxpat`. The patch is the cookbook's canonical demonstration; the inlet `comment` attribute is set on every one of the four inlets/outlets.
> *Why it matters*: this aligns exactly with the inlet/outlet labeling rule already in CLAUDE.md and `MAX_PATCHING.md` — and it's the cookbook's official pattern. Confirms the rule isn't Claude2Max-specific stylistic preference; it's standard Max practice. Worth citing the cookbook as the canonical example in the rule. Also: the dual `inlet+in` pattern is itself worth documenting as a pattern for "abstractions that should work as both subpatch and poly~ voice."

> **Pedagogical patches use comment text inside the patch as the primary explanation channel — the comments themselves ARE the lesson, not just labels.** Cookbook patches like `amplitudecontrol.maxpat` have multi-line comment boxes describing each design decision (why dB, why interpolation, why -60 special-case) right next to the relevant subgraph. The patch reads as a self-contained tutorial — opening it in Max teaches the user without referring back to the web page.
> *Source*: [Audio amplitude control](https://music.arts.uci.edu/dobrian/maxcookbook/audio-amplitude-control) — `amplitudecontrol.maxpat` (47 boxes, ~half are explanatory comments). [Calculating Doppler shift](https://music.arts.uci.edu/dobrian/maxcookbook/calculating-doppler-shift-moving-virtual-sound-sources) — `dopplerexample.maxpat` (61 boxes, ~half are comments explaining the physics step-by-step).
> *Why it matters*: when Claude2Max generates a teaching patch (any patch with `add_tutorial.py` step descriptions, or any patch the user describes as "for explaining X"), the comment boxes should carry the lesson, not just labels. Cookbook treats this as the default; Claude2Max should too. Belongs in `TUTORIAL_GUIDELINES.md`.

> **Sequential-stage demonstration pattern: lay out N progressively-better implementations side-by-side (Examples A, B, C, D), each labeled with a single-letter comment.** `amplitudecontrol.maxpat` shows four amplitude controls A→D, each demonstrating a refinement: A=raw `*~` (zipper noise), B=`number~` (smoothed), C=dB+`select 0` (perceptual + true-silence), D=`gain~` (one object). The pedagogy: the user sees each pattern's failure mode that motivates the next.
> *Source*: [Audio amplitude control](https://music.arts.uci.edu/dobrian/maxcookbook/audio-amplitude-control) — `amplitudecontrol.maxpat`.
> *Why it matters*: when a Claude2Max patch is intended to teach the trade-offs between alternative implementations, this side-by-side A/B/C layout (with each variant carrying its own dac~ for direct comparison) is the canonical idiom. Mention in `TUTORIAL_GUIDELINES.md` as a known design template.

> **`#1 #2 #3` argument substitution in abstractions — preferred over `patcherargs` when args are fixed at instantiation and don't need runtime querying.** `peakamp~ #1` and `pack 0. #2` substitute the abstraction's positional arguments at load time. `patcherargs` is reserved for cases where the abstraction needs to *read* its args from inside a script or change them dynamically. For simple "set this constant once at load," `#N` is the cookbook default.
> *Source*: [A variation on the simple envelope follower](https://music.arts.uci.edu/dobrian/maxcookbook/variation-simple-envelope-follower) — `envelopefollower2~.maxpat`. Page text: "more versatile versions could add inlets and use patcherargs" — explicitly framing `#N` as the simpler default.
> *Why it matters*: when generating an abstraction spec, default to `#N` substitution unless the use case actually requires `patcherargs`. Smaller spec, simpler patch.

> **`gate N M` as a message router for picking among N alternatives based on an `int` selector.** `gate 3 1` has 3 outlets; the int message in left inlet selects which outlet (1-indexed) the right-inlet message exits through. Used in `amplitude_decibels.maxpat` to pick which of three amplitude-mappings (linear / `^4` / dB) the MIDI velocity feeds into.
> *Source*: [Amplitude and decibels](https://music.arts.uci.edu/dobrian/maxcookbook/amplitude-and-decibels) — `amplitude_decibels.maxpat`.
> *Why it matters*: cleaner than chained `if/sel/route` for "user picks one of N processing paths" — common pattern in mode-switched effect chains. Belongs in `SPEC_REFERENCE.md` Object Notes for `gate`.

## Video / Jitter

> **[PROMOTED 2026-05-04]** **Two `jit.matrix NAME` boxes with the same name share a single memory allocation — this is Jitter's pv/v equivalent for matrices.** The pattern lets one part of a patch write into a matrix while another part reads from it without any patchcord between them. Crucial for scrolling buffers (write to cell 0 here, read the entire matrix there), record/playback (one writer, multiple readers), and any "global matrix" shared across subpatchers. Naming convention should follow the project's ALL CAPS rule (e.g. `jit.matrix SCROLLME 1 float32 100`).
> *Source*: [Bidirectional jit.matrix scroll](https://music.arts.uci.edu/dobrian/maxcookbook/bidirectional-jitmatrix-scroll) — `matrixScroll.maxpat` (uses `jit.matrix scrollme 1 float32 100` twice, once before `jit.rota` for scrolling, once after for the display readout — two refs, one storage). Page text: "Note that the two jit.matrix scrollme objects refer to the same memory location, named 'scrollme'."
> *Why it matters*: any Claude2Max patch that needs cross-section data sharing for matrix data should use named `jit.matrix` rather than threading patchcords. The memory-sharing semantic is exactly the matrix analog of `send`/`receive` for messages or `pv`/`v` for variables — and follows the same ALL CAPS naming rule already in CLAUDE.md.

> **`@planemap N0 N1 N2 N3` on `jit.matrix` arbitrarily reassigns input planes to output planes — the canonical way to swap, duplicate, or substitute a plane.** Example: `@planemap 3 1 2 3` means output plane 0 takes input plane 3 (alpha source becomes red), output plane 1 takes input plane 1 (green stays green), etc. Common use: "use the blue channel of an RGB image as the alpha channel" → `jit.matrix 4 char 320 240 @planemap 3 1 2 3`. Avoids any pixel-by-pixel JS or `jit.expr` for what is just a plane-index remap.
> *Source*: [Alpha masking](https://music.arts.uci.edu/dobrian/maxcookbook/alpha-masking) — `alphamasking.maxpat`.
> *Why it matters*: any Claude2Max video patch that needs channel re-routing (luma-from-RGB-as-alpha, swap red/blue for BGR sources, broadcast plane 0 across all 4 planes via `@planemap 0 0 0 0`) should reach for `@planemap` first. Belongs in `SPEC_REFERENCE.md` Object Notes for `jit.matrix`.

> **`@dstdim*` / `@srcdim*` attributes on `jit.matrix` extract or place sub-rectangles without a separate `jit.submatrix`/`jit.scissors`.** `@usedstdim 1 @dstdimstart 0 120 @dstdimend 160 240` on a 320×240 matrix tells the matrix "any incoming data lands in the rectangle (0,120)→(160,240)" — i.e. the lower-left quadrant. Symmetric `@usesrcdim 1 @srcdimstart X Y @srcdimend X Y` selects which sub-rect of the input to copy from. Both can be combined to do "copy from this rect of source to this rect of destination," scaling on the fly if the rect sizes differ.
> *Source*: [Submatrices and masking](https://music.arts.uci.edu/dobrian/maxcookbook/submatrices-and-masking) — `alphamasksubmatrix.maxpat`. Also: [Using Jitter to store numerical data](https://music.arts.uci.edu/dobrian/maxcookbook/using-jitter-store-numerical-data) — `jitterfornumericaldata.maxpat` (uses `srcdimstart 0 $1, srcdimend 17 $1` to read a single row from a stored 18×1800 data matrix).
> *Why it matters*: any positioning/cropping operation should default to `@usesrcdim`/`@usedstdim` rather than synthesizing `jit.submatrix → jit.matrix` chains. Half the boxes, half the spec entries.

> **`jit.rota @boundmode N` controls what fills the area outside the rotated/zoomed/offset image. The 5 modes are not interchangeable — picking the wrong one is the most common Jitter rotate bug.** Modes: `0=ignore` (leaves stale pixels — the default, almost never what you want), `1=clear` (black), `2=wrap` (tiles), `3=clip` (clamps edge pixels), `4=fold` (mirrors). For most rotate/zoom cases you want `1` (black borders) or `2`/`4` (artistic tiling/mirroring). The default of `0` produces visual smearing as old pixels persist underneath the rotated frame.
> *Source*: [Rotate, zoom, and offset video using jit.rota](https://music.arts.uci.edu/dobrian/maxcookbook/rotate-zoom-and-offset-video-using-jitrota) — `rotateVideo.maxpat`. Also: [Stretch 1D matrix to 2D matrix](https://music.arts.uci.edu/dobrian/maxcookbook/stretch-1d-matrix-2d-matrix) — `Stretch1DMatrix-2DMatrix.maxpat` (uses `@boundmode 4` to mirror-fill corners after rotation).
> *Why it matters*: any Claude2Max patch that includes `jit.rota` should explicitly set `@boundmode` rather than accept the default. Belongs in `SPEC_REFERENCE.md` Object Notes for `jit.rota`. The same `@boundmode` attribute exists on related transforming objects.

> **[PROMOTED 2026-05-04]** **Cheap blur via downsample-then-upsample-with-interp: `jit.matrix 4 char 16 12 → jit.window @interp 1`. Massively cheaper than a Gaussian or convolution.** Send the source through a tiny destination matrix (16×12 in the cookbook example), then let the display window or a downstream `jit.matrix @interp 1` upsample back to full size with bilinear interpolation. The downsampling discards detail; the interpolation blurs it back to fill the original area. Almost zero CPU vs. a real spatial blur. Tunable: smaller intermediate matrix = stronger blur.
> *Source*: [Crossfade and blur movie files using jit.xfade and jit.matrix](https://music.arts.uci.edu/dobrian/maxcookbook/crossfade-and-blur-movie-files-using-jitxfade-and-jitmatrix) — `xfadeandblur.maxpat`. Page text explicitly: "a computationally inexpensive way to create a blur effect by downsampling the number of pixels in the image with jit.matrix, and then upsampling in the jit.window object, using interpolation."
> *Why it matters*: any Claude2Max patch that wants a soft-blur effect on video should use this idiom rather than rolling a `jit.fastblur` chain or a custom shader. Belongs in `MAX_PATCHING.md` video-patterns section.

> **`jit.scissors @rows R @columns C` auto-creates R×C outlets — one per tile. `jit.glue @rows R @columns C` does the reverse.** The objects' inlet/outlet count is determined by the attributes at instantiation time, so `jit.scissors @columns 2` has 2 outlets (left half, right half) plus a right outlet for messages; `jit.scissors @rows 3 @columns 4` has 12 outlets. Pair them: scissors → reroute/process tiles individually → glue. Canonical split-screen, video-grid, or tile-shuffler recipe.
> *Source*: [Split screen video](https://music.arts.uci.edu/dobrian/maxcookbook/split-screen-video) — `splitscreenexample.maxpat`.
> *Why it matters*: when a Claude2Max patch needs to composite N video sources into a grid (or pull tiles from one source for processing), `jit.scissors`/`jit.glue` is the one-object solution. Important for spec generation: the converter needs to know that R×C creates R×C outlets, not just 1.

> **`jit.submatrix @dim W H @offset X Y` extracts an arbitrary rectangle from a matrix (single column, single row, ROI) — preferable to `jit.scissors` when you want one specific region rather than tiling.** `dim` is the OUTPUT dimensions (and the size of the source rectangle); `offset` is the top-left of the source rect. Example: `jit.submatrix @dim 1 48` on a 64×48 matrix gives a 1-column vertical slice. Combined with `jit.spill @listlength N @plane P`, you have an "extract a column as a Max list" pipeline in two objects.
> *Source*: [Get column from jit.matrix](https://music.arts.uci.edu/dobrian/maxcookbook/get-column-jitmatrix) — `columnfromjit.matrix.maxpat`.
> *Why it matters*: complements the `jit.scissors`/`jit.glue` pair: `jit.scissors` for full N-tile decomposition, `jit.submatrix` for "I just want this one rectangle." Belongs in `SPEC_REFERENCE.md` Object Notes for `jit.submatrix`.

> **`jit.unpack N` + `jit.pack M` is the canonical plane re-arrangement pair: split N planes into N single-plane matrices, then re-combine into an M-plane output.** Inlet/outlet counts depend on N and M (`jit.unpack 4` has 4 plane outlets + 1 right message outlet; `jit.pack 7` has 7 inlets). Inlet K of `jit.pack M` becomes plane K of the output. Common uses: combine a 3-plane RGB and a 1-plane mask into a 4-plane RGBA, merge two RGB sources into a single 6-plane matrix for parallel processing, or split a multi-plane source for per-plane jit.op.
> *Source*: [Combine 2 Matrices](https://music.arts.uci.edu/dobrian/maxcookbook/combine-2-matrices) — `combine2matrices.maxpat` (3-plane + 4-plane → 7-plane). [Adjust brightness, contrast on a 1-plane char matrix](https://music.arts.uci.edu/dobrian/maxcookbook/adjust-brightness-and-contrast-1-plane-char-matrix) — `brightnessContrast1VideoPlane.maxpat` (uses `jit.unpack` to read individual planes, then `jit.expr` to recombine).
> *Why it matters*: when a Claude2Max spec needs to combine matrices of different plane counts, `jit.unpack`/`jit.pack` is the standard tool — much simpler than `jit.expr` indexing for plain rearrangement.

> **Brightness adjustment is `jit.op @op *` (multiply all cells by gain). Contrast adjustment is "subtract mean → multiply by factor → add mean back" (`jit.op @op -` → `jit.op @op *` → `jit.op @op +`), with the mean coming from `jit.3m`. The single-object equivalent is `jit.expr @inputs 3 @expr in[1]+in[2]*(in[0]-in[1])`. The fully-built-in shortcut is `jit.brcosa`.** This is what `jit.brcosa` is doing internally — useful when you need to apply just brightness OR just contrast (and skip saturation), or when you want different curves per plane.
> *Source*: [Adjust brightness and contrast on a 1-plane char matrix](https://music.arts.uci.edu/dobrian/maxcookbook/adjust-brightness-and-contrast-1-plane-char-matrix) — `brightnessContrast1VideoPlane.maxpat`. Page text confirms: "the most common way is to move all values toward or away from the mean value." `jit.3m` provides min, mean, max, and cell-count via 4 outlets — for char matrices, divide the mean by 255 to get the 0–1 normalized value `jit.expr` expects.
> *Why it matters*: when a Claude2Max patch needs adjustable image levels, default to `jit.brcosa` for combined brightness+contrast+saturation. Drop to the `jit.3m` + `jit.expr` form only when the operation is selective. Belongs in `SPEC_REFERENCE.md` Object Notes for `jit.brcosa` and `jit.3m`.

> **[PROMOTED 2026-05-04]** **`jit.matrix` is a general-purpose multi-dimensional data buffer — it is not video-only. Use it for any large numeric dataset (3D coordinates, sequencer state, FFT bins, particle systems).** Plane = "channel" or "axis" (planes 0/1/2 for x/y/z is canonical), `dim_x` × `dim_y` = "length" × "row-count" or whatever 2D structure fits the problem. Read/write with `setcell` messages; bulk-read columns via `jit.submatrix` + `jit.spill`. Cookbook stores 18 xyz GL points × 1800 frames in a single `jit.matrix 3 char 18 1800` and plays them back with `srcdimstart 0 N, srcdimend 17 N` to step through frames.
> *Source*: [Using Jitter to store numerical data](https://music.arts.uci.edu/dobrian/maxcookbook/using-jitter-store-numerical-data) — `jitterfornumericaldata.maxpat`. Page text: "Storage of large quantities of numerical data is exactly what Jitter is for. You might commonly think of the data in Jitter matrices as representing pixels of a video image, but in fact you can use the jit.matrix object to store any large sets of (multi-dimensional arrays of) numbers, which can be used for any purpose."
> *Why it matters*: when a Claude2Max patch needs to store more than a few dozen values (sequence state, particle positions, sample-and-hold buffers, lookup tables), `jit.matrix` is more memory-efficient and faster to access than `coll`/`zl`/JS arrays. Belongs in `MAX_PATCHING.md` data-storage patterns section. The mental shift "matrix = arbitrary multi-dim array" unlocks a lot of patterns.

> **`jit.spill @listlength N @plane P` converts a matrix's plane to a Max list of N values — the canonical matrix→list bridge.** `@plane` selects which plane to flatten when the source is multi-plane. The output is one list of N floats/ints (matching the matrix's type). Use to extract row, column, or whole-matrix data into a `pak`-friendly list for non-Jitter processing (UI display, MIDI output, OSC send).
> *Source*: [Get column from jit.matrix](https://music.arts.uci.edu/dobrian/maxcookbook/get-column-jitmatrix) — `columnfromjit.matrix.maxpat`. [Using Jitter to store numerical data](https://music.arts.uci.edu/dobrian/maxcookbook/using-jitter-store-numerical-data) — `jitterfornumericaldata.maxpat` (one `jit.spill @plane P` per axis, three of them for x/y/z readout).
> *Why it matters*: if a Claude2Max patch ever needs to inspect, display, or transmit matrix contents, `jit.spill` is the bridge. The `@plane` filter is essential for multi-plane sources — easy to forget. Belongs in `SPEC_REFERENCE.md` Object Notes for `jit.spill`.

> **`jit.window NAME @floating 1` keeps the window above other windows; `jit.qt.movie @unique 1` gives each instance independent state when loading the same file.** Two small but easy-to-miss attributes. `@floating 1` is the cookbook standard for preview/inspection windows that shouldn't get hidden behind the patcher. `@unique 1` matters when two `jit.qt.movie` (or `jit.movie`) objects load the same file — without it they share state, which breaks split-screen, A/B preview, and any pattern that needs independent playheads.
> *Source*: `@floating 1`: [Alpha masking](https://music.arts.uci.edu/dobrian/maxcookbook/alpha-masking) — `alphamasking.maxpat` (`jit.window alphakey @floating 1 @size 320 240 @pos 640 80`). `@unique 1`: [Split screen video](https://music.arts.uci.edu/dobrian/maxcookbook/split-screen-video) — `splitscreenexample.maxpat` (`jit.qt.movie 720 480 @unique 1` on both instances).
> *Why it matters*: presentation-mode Claude2Max patches that include a `jit.window` preview should default to `@floating 1`. Multi-instance video patches should default to `@unique 1`. Both are forgotten silently — the patch works, just badly. Belongs in `SPEC_REFERENCE.md` Object Notes.

## JS / v8

(no entries yet — Cookbook contains relatively few JS-heavy recipes; queue for a focused later chunk)

## MIDI

(no entries yet — queue MIDI recipes as a focused chunk)

## UI

(no entries yet — queue UI recipes as a focused chunk)

## Performance

(no entries yet)

## RNBO

(no entries yet — Cookbook predates RNBO; section kept to mirror `forum_insights.md`)
