# Package Concepts

Per-package reference for conceptual knowledge that doesn't fit per-object: foundational data types, paradigms, idioms, and domain models that are unique to a package and would be confusing or wasteful to re-explain in every `use_when` entry.

This file is a companion to `package_objects.json`. The JSON answers "should I reach for this object, and how do I drive it?" — this markdown answers "what mental model do I need to use this package at all?"

When curating a new package, read its tutorial(s) and key foundational refpages first. If the package introduces a custom data type, scripting language, address scheme, callback protocol, or domain-specific paradigm — write it here before curating individual objects.

---

## bach (computer-aided composition)

**One-line:** Lisp-flavoured symbolic music environment by Andrea Agostini and Daniele Ghisi. Brings CAC (computer-aided composition) idioms — score editing, pitch/rhythm transformation, set theory, constraint satisfaction — into Max via a custom nested-list data type and a small embedded scripting language.

### lllls — Lisp-like linked lists

**The single most important concept in bach.** Every bach object speaks `llll` (pronounced "loo-loo-loo-loo", though no one says it aloud) — a nested list that can contain numbers, symbols, rationals, pitches, *and other lllls*. Native Max lists are flat; lllls are trees. This is bach's universal communication mechanism — most messages between bach objects are lllls, not Max lists.

Syntax in patches uses parentheses for nesting: `(1 2 (3 4 (5 6)) 7)`. The depth of an element is the number of nesting levels above it. The "root level" is depth 1.

**Why it matters for patching:** if you wire a native Max `pack` or `zl` chain to a bach object, you get a flat list — which bach reads as a single root-level llll. To build *nested* structure you use bach's own list-construction objects (`bach.append`, `bach.collect`, `bach.pack`, etc.) or type lllls into message boxes literally with parentheses.

### Rationals and pitches as native data types

bach extends Max's number system with two new primitives:

- **Rationals** — `3/4`, `1/8`, etc., for exact rhythmic durations. Avoids the floating-point error that ruins arithmetic on dotted/tuplet values. Most bach math objects accept and return rationals. `bach.float2rat` converts.
- **Pitches** — symbolic pitch literals like `C4`, `Cs4` (C sharp), `Db4` (D flat), `D4+50` (D4 + 50 cents). Internally bach also uses **midicents (mc)** for pitch arithmetic: `100 mc = 1 semitone`, so middle C = `6000 mc`. Use `bach.p2mc` and `bach.mc2p` to convert between the symbolic and numeric forms. Most pitch-domain operators take mc; the visual notation editors (`bach.roll`/`bach.score`) display either form.

### Addresses — pathing into nested lllls

Many bach objects (notably `bach.nth`, `bach.subs`, `bach.find`) take an **address**: a sequence of integers describing a path from the root to an element. Length of the address equals depth of the target.

- `4` — 4th element of the root
- `4 3` — 3rd element of the 4th sub-llll of the root
- `4 3 2` — 2nd element of the 3rd sub-llll of the 4th sub-llll of the root
- **Negative indices** count from the right, identical to Python: `-1` = last, `-2` = penultimate. Mixing is fine: `4 -1 -1` = "last of last of fourth".
- **Multi-element** at the same level: wrap the final position in parens. `1 (1 3)` = "first and third of the first sub-llll".
- **Range** at the same level: nest a 2-element sublist. `1 [[1 5]]` = "elements 1 through 5 of the first sub-llll" (in actual patch syntax, that's a sub-sub-llll).

Address semantics are the same across every bach object — you don't have to relearn paths per object.

### Lambda inlets/outlets — bach's callback protocol

Several bach objects (`bach.find`, `bach.iter`, `bach.mapelem`, `bach.sort`, `bach.subs`, `bach.collect`, …) have an extra **lambda** inlet/outlet pair, always rightmost. They emit each candidate element from the lambda outlet and expect a response back at the lambda inlet for each one — either:

- a **0/1 yes/no** (filter-style: `bach.find` keeps only elements where lambda → 1)
- a **modified llll** (transform-style: `bach.mapelem` replaces the element with whatever returns at the lambda inlet)

You wire a small chain of bach objects between the lambda outlet and inlet to define the per-element function. **The evaluation chain must be direct** — no `delay`, `pipe`, `defer`, message storage, or anything that breaks the synchronous return path. (Use `bach.deferlow` only when explicitly needed for low-priority lambda evaluation.)

This is functional-programming-style higher-order iteration grafted onto Max patcher cords. It's the main reason bach feels like Lisp/Scheme even though you're patching cables.

### bach.roll vs bach.score — proportional vs measured notation

The two notation editors are both fully editable (mouse, keyboard, dump, set messages) and both store their content as a (very large) llll. They differ in time model:

- **`bach.roll`** — proportional notation: time is continuous (ms), no measures, no tempo. Best for sketching, gestural music, electronic-style timelines, anything where bar lines would be artificial.
- **`bach.score`** — classical notation: measures, time signatures, tempi, beams, ties, tuplets. Far heavier object — implements full quantization (`@quantize` attribute, message-driven), takes mc-based proportional input and renders it onto a metric grid.

`bach.transcribe`, `bach.beatbox`, `bach.beatunbox`, `bach.combinevoices` handle conversion between the two and structural transforms.

### Slots — per-note metadata containers

Each note in a bach.roll/score carries up to N indexed **slots**, configured globally on the parent notation object via `@slotinfo`. A slot can hold a number, a function/breakpoint envelope, an audio file reference, a text label, an llll — many types. Use slots to attach articulation, dynamics, mode-de-jeu instructions, or any per-note custom data. `bach.slot` lets you display/edit a single slot of a "virtual" note in isolation, useful for templating or testing slot-content workflows.

### bell — bach's embedded scripting language

`bach.eval` (and a handful of related objects) runs **bell** scripts: a Lisp-flavoured language with variables, conditionals, loops, user-defined functions, and lambdas. Use it when a chain of bach objects gets long enough that maintaining the patcher cords is harder than writing the equivalent in script form. Externalisable to a `.bell` file via `@file`. Lambdas in bell can also be passed as arguments to higher-order built-ins like `finditems`, mirroring the patcher-side lambda protocol.

### State sharing — bach.reg, bach.pv, bach.shelf

- **`bach.reg`** — store an llll, retrieve with bang. The bach equivalent of `int`/`zl.reg`. Single-instance memory, no sharing.
- **`bach.pv`** — patcher-variable; shares an llll across the entire patcher hierarchy (parent/child patchers can read/write the same value). Equivalent to Max's `pv` but for lllls.
- **`bach.shelf`** — global named storage. Any patch can `read`/`write` the same shelf name.
- **`bach.value`** — lighter shared variable, scoped to the patch.

### Set theory and post-tonal tools

bach ships substantial post-tonal infrastructure: `bach.primeform` (prime form of a pc-set), `bach.ivec` (interval vector), `bach.tonnetz`, `bach.compl` (pc-set complement), `bach.poset`, `bach.zsearch` (Z-related sets), `bach.circle` (clock diagram). All operate on pitch-class lllls.

### Constraint satisfaction

`bach.constraints` solves CSPs declaratively — variables, domains, and constraints expressed as lllls/lambdas. Use for voice-leading problems, twelve-tone row construction, harmonic puzzle solving.

### Common gotchas

- **Don't pass a Max list to a bach object expecting an llll** unless you mean "single root-level llll" — bach reads the whole flat list as one node. Use bach list-builders (`bach.collect`, `bach.append`, `bach.pack`) or literal parens in messages.
- **`@out` attribute on most lambda-aware objects** controls how lambda outputs are typed. Misconfigured `@out` is the most common cause of "the lambda outlet emits nothing useful."
- **Address arithmetic doesn't auto-flatten depth.** Wiring an llll-of-llll into objects that expect element-of-llll silently produces wrong results — check `@unwrap` and `@maxdepth` first.
- **bach.roll/bach.score messages are huge.** When dumping or `getstate`-ing, expect very large lllls. Use `bach.write` to file rather than a print pipeline.
- **Lambda chains must be synchronous.** A `pipe` or `delay` in a lambda chain will silently break the iteration — bach moves on without waiting.

### Reference instances (for orientation, not authority)

- **Foundational data**: `bach.nth`, `bach.subs`, `bach.length`, `bach.depth`, `bach.contains`, `bach.find`.
- **Iteration**: `bach.iter`, `bach.mapelem`, `bach.collect`.
- **Notation**: `bach.roll`, `bach.score`, `bach.slot`, `bach.combinevoices`, `bach.transcribe`.
- **Math/series**: `bach.expr`, `bach.eval`, `bach.arithmser`, `bach.geomser`, `bach.derive`, `bach.integrate`.
- **Set theory**: `bach.primeform`, `bach.ivec`, `bach.compl`, `bach.tonnetz`, `bach.zsearch`, `bach.circle`.
- **State**: `bach.reg`, `bach.pv`, `bach.shelf`, `bach.value`.
- **Scripting**: `bach.eval` (bell language), `bach.expr` (mathematical expressions over lllls).

---

## cage and dada (bach extensions)

**cage** (Daniele Ghisi) and **dada** (Daniele Ghisi, Andrea Agostini) are layered on top of bach — they extend bach's lllls and notation editors with higher-level CAC operations (cage: harmonisation, voice-leading, rhythm composition; dada: graphical/interactive composition tools, mathematical music, networks). Read the bach concepts above first; cage/dada inherit lllls, addresses, lambda inlets/outlets, midicents, pitches, and slot conventions verbatim. Their objects expect bach-shaped data and play nicely with bach.roll/bach.score.

---

## FrameLib (frame-based DSP)

**One-line:** Alex Harker's frame-scheduled DSP framework. Re-imagines Max audio processing as a graph of variable-length, time-stamped frames passed between objects, rather than fixed-block sample streams. Designed for non-realtime quality and exact temporal scheduling that's awkward in standard MSP.

### Frames — variable-length, scheduled blocks

A FrameLib **frame** is a block of values (samples or any other data) tagged with a time. Objects emit frames at scheduled times, not on every audio block. Frame size is variable — one object may emit a 64-sample frame, the next a 1024-sample one, and they connect cleanly because each frame carries its size and timestamp explicitly.

This is the conceptual departure from MSP. In MSP, every connection carries a fixed-rate signal of the audio block size. In FrameLib, connections carry frames at irregular times — closer to a packet network than a continuous signal.

### Schedulers and the network entry point

A FrameLib network is driven by a **scheduler** at its head — most commonly `fl.interval~` (emit a frame every N samples). The scheduler defines when frames originate; downstream objects react to them. Multiple schedulers in one patch are allowed but each defines its own timing root.

### Contexts — self-contained worlds

Every connected set of FrameLib objects belongs to a **context**. The context is set on the scheduler via `@id <name>`; if absent, objects share the **default context**. Two contexts don't interfere even if they use the same named resources (`fl.store~ foo` in context "a" is independent of `fl.store~ foo` in context "b").

`fl.contextcontrol~` lets you set per-context properties at runtime — most importantly **multithreading** (`multithread 1/0`, OFF by default) and **realtime/non-realtime** mode (`@rt 0` for NRT). NRT mode operates on input/output buffers; you advance time with `process N` (samples) and `reset`.

### Tags, parameters, and the `~` suffix

FrameLib object names always end in `~` — they live in MSP — but the tilde here means "FrameLib object" rather than "audio-rate signal." Most parameters are set via `@param value` syntax at instantiation; some objects accept runtime parameter changes via dedicated message inlets. Frames can carry **tags** (named per-frame metadata); objects like `fl.combinetags~` and `fl.tag~` manipulate them.

### Complex frames

Complex-valued operations come in pairs: `fl.complex.plus~` etc. take **two pairs** of input frames (real/imaginary) and emit two output frames. FFT-domain processing in FrameLib uses complex frames throughout (`fl.fft~`, `fl.ifft~`, plus the `fl.complex.*~` math suite).

### State sharing — fl.store~ / fl.recall~

`fl.store~ NAME` writes a frame to a named slot; `fl.recall~ NAME` reads it. The pair is **scoped to the context**, so the same name in different contexts is independent storage. Use this for cross-network communication within a context.

### Common gotchas

- **Don't connect FrameLib outputs directly to MSP audio inputs** without a `fl.tomax~` (frame-to-signal conversion). FrameLib frames are not MSP signals.
- **Default context is shared.** If you don't set `@id` on the scheduler, objects join the implicit default — meaning two unrelated networks may step on each other's `fl.store~ foo`.
- **Frame size mismatches can silently truncate.** Check expected frame sizes when chaining objects with different block-size assumptions.
- **NRT mode requires manual time advancement.** Forgetting to send `process N` after switching to `@rt 0` leaves the network stuck at time 0.

---

## ears (HISSTools-aligned buffer audio)

**One-line:** Andrea Agostini's buffer-domain audio processing library — extends Max's audio capabilities with non-realtime, file-driven buffer operations. Conceptual sibling to HISSTools (Pa Holland's offline IR/convolution toolkit) — both treat buffers as the unit of work and operate non-realtime.

ears objects accept buffer names as messages or arguments and produce new buffers as output. Most are non-tilde (no audio thread) — they run when triggered and write results back to named buffers. Use ears for offline analysis, batch buffer processing, and editing tasks that would be awkward in realtime audio. Read the HISSTools section (when added during backfill) for shared idioms; ears is much broader (effects, time-stretching, slicing, conversion) but follows the same buffer-as-unit-of-work model.

---

## odot (modern OSC for Max)

**One-line:** John MacCallum / CNMAT's modern Open Sound Control framework. Replaces the older CNMAT OSC objects (`osc-route`, `osc-schedule`, `OSC-route`, `opensoundcontrol`) which are deprecated — see the `deprecated_by` field in those objects' entries.

odot represents OSC bundles as first-class data — `o.expr` is a full expression language operating on bundles, `o.if` does conditional dispatch, `o.route` selects on address patterns. Bundles are immutable; operations produce new bundles. The whole package fits together as a small functional language for OSC. When integrating with non-Max software speaking OSC, prefer odot over the deprecated CNMAT objects.

---

## MuBu For Max (corpus / multi-buffer container)

**One-line:** IRCAM's MuBu (Multi-Buffer) is a container architecture for time-tagged multi-track data — audio + MIDI + sensor + descriptors all in one structure. Foundation for catart-mubu (which is curated separately) and for several IRCAM concatenative-synthesis workflows.

A MuBu **container** has multiple **tracks** (each a buffer~-like time series with sample rate and column count); tracks can hold audio (one channel per column), MIDI, descriptors, markers, anything. `mubu` is the central object; `imubu` provides interactive editing; `mubu.granular~`, `mubu.concat~`, `mubu.knn~` consume the container for synthesis.

The decision-relevant choice is: do you have multi-modal time-tagged data (audio + descriptors + markers) that you want to keep together? If so, MuBu is the right container; if you only have audio in a buffer, `buffer~` is enough.

---

## PeRColate (Perry Cook STK port)

**One-line:** Dan Trueman, R. Luke DuBois, Perry Cook's port of the Synthesis Toolkit (STK) physical-modelling library. Most objects are physical models of acoustic instruments (clarinet, marimba, mandolin, piano, brass, etc.) and granular/modal synthesis primitives.

Names follow STK conventions — `clari~`, `marimba~`, `mandolin~`, `wgflute~`, `flute_p~`, `bowed_p~`, etc. Each model takes the standard STK control set (frequency, breath/bow pressure, vibrato, attack, decay) via float inlets or `setX` messages. They're CPU-light enough for live use and characterful enough that the "right" choice between two models often comes down to taste rather than fidelity. Use PeRColate when you want recognisable acoustic timbres without sample libraries; reach for `stk*` builds elsewhere when you need exact STK behaviour.

---

## grainflow (granular synthesis)

**One-line:** Christopher Poovey's modular granular synthesis package. Treats grains as scheduled events with per-grain parameters (window, pitch, amplitude, file position, panning) — closer to a sequencer-of-grains than a continuous granular cloud.

`gf.gen~` schedules grains; `gf.player~` reads from a buffer; `gf.window~` shapes envelopes. Per-grain parameters are sent as lists or messages; the grain count and density are explicit rather than emergent. Use when you want fine-grained (sorry) per-grain control; reach for `mubu.granular~` or `karma~` for cloud-style continuous granular.

---

## Vsynth (modular video synthesis)

**One-line:** Kevin Kripper's modular video synthesizer for Max — emulates analog video synthesis (LZX / EMS Spectre style) with a vector-signal protocol unique to the package.

### Vector signals — RGB triples, not Jitter matrices

A Vsynth signal is a triple of audio-rate signals representing R, G, B brightness. This is not a Jitter matrix and not a standard MSP signal — it's audio-rate scanning where the X position drives sweep timing and the brightness values modulate at audio rate. The whole package is built around chaining `vector_*` objects that accept and emit these RGB triples.

### The render terminal — `vector_3ch_out`

Every Vsynth chain ends in **one** `vector_3ch_out`. It's the video equivalent of `dac~` — converts the vector signal into a Jitter matrix routable to `jit.world` for display. Have only ONE in your patch even if you have multiple parallel synthesis chains; they all join at this terminal.

### Audio↔video bridges

`vector_audio2tex` lifts XY-modulated audio into the vector domain. `vector_camera` and `vector_videofile` bring live and pre-recorded video sources in. From there, the vast majority of Vsynth objects (oscillators, modulators, mixers, pattern generators) operate inside the vector domain.

### Common gotchas

- **Don't connect Vsynth outputs directly to standard MSP.** They're audio-rate, but their semantics are RGB-tuple, not single-channel sound. Use `vector_3ch_out` to extract a Jitter matrix.
- **Multiple `vector_3ch_out` instances will fight.** One per patch.

---

## RNBO Synth Building Blocks

**One-line:** RNBO/gen~ -domain synth primitives by Cycling '74 — pre-built ADSR, LFO, oscillator, filter wrappers ready to drop into RNBO patches.

The `sbb.*` prefix marks Synth Building Blocks. They abstract common gen~ patterns (linear vs. exponential envelopes, anti-aliased oscillators, biquad-based filters) so you don't have to rebuild them from primitives every time. Use inside RNBO patches; outside RNBO, reach for the equivalent native or third-party MSP objects (e.g. `function`, `cycle~`).

The decision-relevant choice within sbb.env.* is the curve shape: `sbb.env.adsr` is linear, `sbb.env.analog` is exponential (analog-style), `sbb.env.ad` is the lighter attack-decay variant for percussion.

---

## EAMIR SDK (modal / accessibility)

**One-line:** EAMIR (Electronic Music Adaptive Media Interface) by V.J. Manzo is a toolkit for accessible / modal-locked MIDI generation — useful in education and accessibility contexts where note input should be constrained to a chosen mode.

The `modal_*` objects analyse, filter, or remap notes against a current mode. `modal_analysis` is the analysis side (what mode are we in?); `modal_change` and `modal_filter` are the constraint side (only let in-mode notes through, or remap). Pair them for adaptive systems where the mode follows the user's most-recent note material rather than being fixed up-front.

---

## Digital Orchestra Toolbox (mapping / control)

**One-line:** IDMIL (McGill / Marcelo Wanderley) toolkit for gestural-controller mapping. Many objects are mathematical transforms suited to mapping sensor data onto synth parameters — interpolation, conditioning, spaces.

`dot.something` is the prefix; the bulk of the package is signal-conditioning math (smoothing, lag, threshold, scaling) plus higher-level mapping abstractions. Use when building DMI (Digital Musical Instrument) mappings; many objects overlap with native Max math but provide tuned defaults for human-rate control signals.

### Reference instances (for orientation, not authority)

- **Foundational data**: `bach.nth`, `bach.subs`, `bach.length`, `bach.depth`, `bach.contains`, `bach.find` — start here when learning to think in lllls.
- **Iteration**: `bach.iter`, `bach.mapelem`, `bach.collect` — the lambda-based iteration trio.
- **Notation**: `bach.roll`, `bach.score`, `bach.slot`, `bach.combinevoices`, `bach.transcribe`.
- **Math/series**: `bach.expr`, `bach.eval`, `bach.arithmser`, `bach.geomser`, `bach.derive`, `bach.integrate`.
- **Set theory**: `bach.primeform`, `bach.ivec`, `bach.compl`, `bach.tonnetz`, `bach.zsearch`, `bach.circle`.
- **State**: `bach.reg`, `bach.pv`, `bach.shelf`, `bach.value`.
- **Scripting**: `bach.eval` (bell language), `bach.expr` (mathematical expressions over lllls).
