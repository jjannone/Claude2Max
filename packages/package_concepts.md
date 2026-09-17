# Package Concepts

Per-package reference for conceptual knowledge that doesn't fit per-object: foundational data types, paradigms, idioms, and domain models that are unique to a package and would be confusing or wasteful to re-explain in every `use_when` entry.

This file is a companion to `package_objects.json`. The JSON answers "should I reach for this object, and how do I drive it?" — this markdown answers "what mental model do I need to use this package at all?"

When curating a new package, read its tutorial(s) and key foundational refpages first. If the package introduces a custom data type, scripting language, address scheme, callback protocol, or domain-specific paradigm — write it here before curating individual objects.

---

## bach (computer-aided composition)

**One-line:** Lisp-flavoured symbolic music environment by Andrea Agostini and Daniele Ghisi. Brings CAC (computer-aided composition) idioms — score editing, pitch/rhythm transformation, set theory, constraint satisfaction — into Max via a custom nested-list data type and a small embedded scripting language. (Reviewed against bach 0.8.3.)

### lllls — Lisp-like linked lists

**The single most important concept in bach.** Every bach object speaks `llll` (pronounced "loo-loo-loo-loo", though no one says it aloud) — a nested list that can contain numbers, symbols, rationals, pitches, *and other lllls*. Native Max lists are flat; lllls are trees. This is bach's universal communication mechanism — most messages between bach objects are lllls, not Max lists.

Current bach writes nesting with square brackets: `1 2 [3 4 [5 6]] 7`. Parentheses are still parsed, and `bach.textout @parens 1` writes them for Lisp export, but refpages and help files use brackets. The depth of an element is the number of nesting levels above it. The "root level" is depth 1.

**Why it matters for patching:** if you wire a native Max `pack` or `zl` chain to a bach object, you get a flat list — which bach reads as a single root-level llll. To build *nested* structure you use bach's own list-construction objects (`bach.join`, `bach.collect`, `bach.wrap`, etc.) or type lllls into message boxes literally with brackets.

### Native and text output — the `@out` attribute

Almost every bach object has an `@out` attribute with one letter per llll outlet:

- `n` (default) — native: fast and exact between bach objects, but plain Max objects (`print`, message boxes, `zl`, `route`) only see a `bach.llll` token.
- `t` — text: readable by any Max object, slower and limited in size. Symbols that could be misread as numbers or pitches get a leading backtick.
- `m` — text without backticks, for handing data to ordinary Max objects (added in 0.8.1).

So the rule is: **set `@out t` (or `m`) on the last bach object before any non-bach object.** A bach chain whose output looks like garbage or a single token almost always needs this. Sources: `bach.nth` refpage, `out` attribute; `docs/whatsnew_0.8.1/WhatsNew0.8.1_Lllls.maxpat`.

### Rationals and pitches as native data types

bach extends Max's number system with two new primitives:

- **Rationals** — `3/4`, `1/8`, etc., for exact rhythmic durations. Avoids the floating-point error that ruins arithmetic on dotted/tuplet values. Most bach math objects accept and return rationals, and dividing two integers in `bach.expr` gives an exact rational. `bach.float2rat` converts decimals to rationals.
- **Pitches** — symbolic pitch literals such as `C4`, `C#4`, `Db5`, quarter-tone forms like `Eq6` and `Ed6`, and offsets in tone fractions such as `Fx#7+1/12t` (examples from `bach.pitchunpack.maxhelp`). Internally bach also uses **midicents (mc)** for pitch arithmetic: `100 mc = 1 semitone`, so middle C = `6000 mc`. Use `bach.p2mc` and `bach.mc2p` to convert between pitches and midicents, and `bach.n2mc` / `bach.mc2n` for note-name symbols (Anglo-Saxon `C4` or Latin `Do4`). Most pitch-domain operators take mc; the notation editors (`bach.roll`/`bach.score`) display either form.

### Addresses — pathing into nested lllls

Many bach objects (notably `bach.nth`, `bach.subs`, `bach.insert`, `bach.find`) use an **address**: a sequence of integers describing a path from the root to an element. Length of the address equals depth of the target.

- `4` — 4th element of the root
- `4 3` — 3rd element of the 4th sub-llll of the root
- `4 3 2` — 2nd element of the 3rd sub-llll of the 4th sub-llll of the root
- **Negative indices** count from the right, identical to Python: `-1` = last, `-2` = penultimate. Mixing is fine: `4 -1 -1` = "last of last of fourth".
- **Several elements** at the same level: put them in a sublist as the last part of the address. `7 3 [1 4 7 -2]` = elements 1, 4, 7 and last-but-one of the 3rd sub-llll of the 7th element.
- **Range** at the same level: a two-element sublist inside that sublist. `-1 -1 [1 [3 6] 2]` = element 1, elements 3 to 6, then element 2 of the last element of the last element. A reversed range such as `[-1 -3]` returns elements in reverse order.

Missing elements come back as `null`. Address semantics are the same across bach objects (examples from `bach.nth.maxhelp`).

### Lambda inlets/outlets — bach's callback protocol

Several bach objects (`bach.find`, `bach.mapelem`, `bach.sort`, `bach.sieve`, `bach.thin`, `bach.classify`, `bach.reduce`, `bach.constraints`, …) have **lambda** outlets and a lambda inlet, always rightmost. They send each candidate out the lambda outlet(s) and expect an answer back at the lambda inlet before moving on — either:

- a **0/1 yes/no** (filter-style: `bach.find` keeps only elements where lambda → 1)
- a **modified llll** (transform-style: `bach.mapelem` replaces the element with whatever returns at the lambda inlet)

You wire a small chain of bach objects between the lambda outlet and inlet to define the per-element function. **The chain must answer synchronously** — no `delay`, `pipe`, `bach.pipe`, `defer`, `bach.defer`, `bach.deferlow` or anything else that postpones the answer. If the answer is late, bach has already moved on.

Some of these objects (for example `bach.diff`, `bach.union`, `bach.intersection`, `bach.symdiff`, `bach.classify`) can instead take the test as a bell expression in `@lambda`, with no patch cords at all. `bach.iter` is different: with `@lambda 1` it proposes each sublist on its right outlet and enters it only if 1 comes back.

This is functional-programming-style higher-order iteration grafted onto Max patcher cords. It's the main reason bach feels like Lisp/Scheme even though you're patching cables.

### bach.roll vs bach.score — proportional vs measured notation

The two notation editors are both fully editable (mouse, keyboard, dump, set messages) and both store their content as a (very large) llll. They differ in time model:

- **`bach.roll`** — proportional notation: time is continuous (ms), no measures, no tempo. Best for sketching, gestural music, electronic-style timelines, anything where bar lines would be artificial.
- **`bach.score`** — classical notation: measures, time signatures, tempi, beams, ties, tuplets. Far heavier object.

Conversion and related tools:

- roll → score: `bach.quantize` (fits proportional timing onto measures and tempi);
- score → roll: `bach.score2roll`;
- flat parameters ↔ measure-grouped parameters for bach.score: `bach.beatbox` / `bach.beatunbox`;
- merge several scores into one multi-voice score: `bach.combinevoices`;
- record live notes into a bach.roll: `bach.transcribe`.

To hear a score, wire its playout outlet to `bach.ezmidiplay` (quick MIDI) or `bach.playkeys` (extract chosen note parameters for your own synth). `bach.keys` pulls named sections out of a dump; `bach.sliceheader` separates the header from the notes.

### Slots — per-note metadata containers

Each note in a bach.roll/score carries up to N indexed **slots**, configured globally on the parent notation object via `@slotinfo`. A slot can hold a number, a function/breakpoint envelope, an audio file reference, a text label, an llll — many types. Use slots to attach articulation, dynamics, mode-de-jeu instructions, or any per-note custom data. `bach.slot` lets you display/edit a single slot of a "virtual" note in isolation, useful for templating or testing slot-content workflows. `bach.slot2line`, `bach.slot2curve` and `bach.slot2filtercoeff` turn slot content into `line~`, `curve~` and `filtercoeff~` messages during playback.

### bell — bach's embedded scripting language

`bach.eval` runs **bell** scripts: a Lisp-flavoured language with variables, conditionals, loops, user-defined functions, and lambdas. Use it when a chain of bach objects gets long enough that maintaining the patcher cords is harder than writing the equivalent in script form. Externalisable to a file via `@file`. Several set and list objects also accept a bell expression in `@lambda` instead of a lambda patch. `bach.expr` is the simpler, math-only evaluator, with typed variables such as `$i1`, `$f1`, `$r1`, `$p1` and `$x1`.

### State sharing — bach.reg, bach.pv, bach.value, bach.shelf

- **`bach.reg`** — store an llll, retrieve with bang. The bach equivalent of `zl.reg`. Right inlet stores without output. Single instance, no sharing.
- **`bach.pv`** — shares an llll among same-named `bach.pv` objects **within one patch hierarchy** (a patcher and its subpatchers). The bach equivalent of `pv`.
- **`bach.value`** — shares an llll among **all** same-named `bach.value` objects anywhere in Max, and with bell global variables. The bach equivalent of `value`. `@auto 1` makes an instance output whenever another instance changes the value. Its help file says ordinary `send`/`receive` pairs are not guaranteed to carry lllls correctly, while `bach.value` networks are, so use it for passing lllls around a patch.
- **`bach.shelf`** — a named store for many lllls. `store` saves an llll and outputs a generated name symbol; `storenamed` uses your own name; sending a name (or `retrieve`) outputs the llll. Instances share data when they have the same `refer` name (or box argument). `read` and `write` load and save the whole shelf as a file; `@embed 1` saves it with the patch. Because `coll`, `dict` and `umenu` cannot hold native lllls, store the shelf's name symbols in them instead (from `bach.shelf.maxhelp`).

### Set theory and post-tonal tools

bach ships substantial post-tonal infrastructure: `bach.primeform` (prime form of a pc-set), `bach.ivec` (interval vector), `bach.pcsetinfo` (cardinality, symmetry, periodicity), `bach.istruct` (interval structure), `bach.ifunc` (interval function of two sets), `bach.compl` (pc-set complement), `bach.zsearch` (Z-related sets), `bach.mod+` / `bach.mod-` / `bach.mod*` (modular arithmetic), and two interactive displays: `bach.circle` (clock diagram) and `bach.tonnetz` (pitch lattice). `bach.poset` handles general partially ordered sets. All pc-set objects take a modulo (default 12) for microtonal universes.

### Constraint satisfaction

`bach.constraints` solves CSPs declaratively — domains and associations come in as lllls, and each constraint is evaluated in the lambda loop. `@solutions` caps the result count, `@maxtime` limits search time, `@parallel` enables concurrent search. Use for voice-leading problems, twelve-tone row construction, harmonic puzzle solving.

### Common gotchas

- **Set `@out t` before plain Max objects.** Native output (the default) shows up as a `bach.llll` token. See the `@out` section above.
- **Don't pass a Max list to a bach object expecting nested structure** — bach reads the whole flat list as one root-level llll. Use bach list-builders (`bach.collect`, `bach.join`, `bach.wrap`) or literal brackets in messages.
- **Many objects with symbol names are aliases of word names:** `bach.==` is `bach.eq`, `bach.>=` is `bach.geq`, `bach./` is `bach.div`, `bach.*` is `bach.times`, `bach.%` is `bach.remainder`, `bach.mod*` is `bach.modtimes` (from `bach-objectmappings.txt`). Comparison objects such as `bach.==` and `bach.>` compare **whole lllls** and output one 0/1, not element-wise.
- **Address arithmetic doesn't auto-flatten depth.** Wiring an llll-of-llll into objects that expect element-of-llll silently produces wrong results — check `@unwrap` and `@maxdepth` first.
- **bach.roll/bach.score messages are huge.** When dumping, expect very large lllls. Use `bach.write` to file rather than a print pipeline.
- **Lambda chains must be synchronous.** Any delay or deferral in a lambda chain breaks the iteration — bach moves on without waiting.
- **`bach.append` is deprecated** — use `bach.join`. **`bach.mode` does not load** in bach 0.8.3: it has a refpage but no patch file.

### Reference instances (for orientation, not authority)

- **Foundational data**: `bach.nth`, `bach.subs`, `bach.insert`, `bach.length`, `bach.depth`, `bach.find`, `bach.flat`, `bach.wrap`.
- **Iteration**: `bach.iter`, `bach.step`, `bach.mapelem`, `bach.collect`.
- **Notation**: `bach.roll`, `bach.score`, `bach.slot`, `bach.quantize`, `bach.score2roll`, `bach.playkeys`, `bach.ezmidiplay`, `bach.transcribe`.
- **Math/series**: `bach.expr`, `bach.eval`, `bach.arithmser`, `bach.geomser`, `bach.derive`, `bach.integrate`.
- **Set theory**: `bach.primeform`, `bach.ivec`, `bach.compl`, `bach.tonnetz`, `bach.zsearch`, `bach.circle`.
- **State**: `bach.reg`, `bach.pv`, `bach.value`, `bach.shelf`.
- **Scripting**: `bach.eval` (bell language), `bach.expr` (mathematical expressions over lllls).

---

## cage and dada (bach extensions)

**cage** (Andrea Agostini and Daniele Ghisi, per its package-info.json) and **dada** (Daniele Ghisi) are layered on top of bach and need it installed. They inherit lllls, addresses, lambda inlets/outlets, midicents, pitches, `@out`, and slot conventions verbatim — read the bach concepts above first.

**cage** is mostly abstractions that take and return the gathered syntax of `bach.roll` or `bach.score` (the llll from the editor's first outlet). Its refpage tags group it into:

- **score transformations** — `cage.transp`, `cage.rev`, `cage.inv`, `cage.rot`, `cage.offset`, `cage.crop`, `cage.slice`, `cage.join`, `cage.mix`, `cage.repeat`, `cage.looper`, `cage.wedge`, `cage.spacer`, `cage.trim`, `cage.rebar`, `cage.timestretch`, `cage.timewarp`, `cage.agogics`, `cage.remapvoices`, `cage.separatevoices`;
- **"electrospectral" symbolic processing** — `cage.fm`, `cage.rm`, `cage.freqshift`, `cage.virtfund`, `cage.cascade~`, `cage.pitchfilter`, `cage.stretch`, `cage.granulate`. These output notes, not audio, even when the name ends in `~`;
- **generation** — `cage.scale`, `cage.arpeggio`, `cage.harmser`, `cage.noterandom`, `cage.notewalk`, `cage.weightbuilder`;
- **automata and rules** — `cage.markov.analysis` / `cage.markov.synthesis`, `cage.chain` (L-systems), `cage.life`, `cage.lumbricus`;
- **melodic profiles** — `cage.profile.*`;
- **SDIF import/export** — `cage.sdif.*`, used with `bach.readsdif` / `bach.writesdif`;
- **meta-scores** — `cage.meta.engine` with `cage.meta.header` inside each assigned patch;
- **quick audio** — `cage.ezsynth~` and `cage.ezsampler~`, which play slot content from a score's playout.

**dada** is mostly UI externals for interactive and corpus-based composition: `dada.base` (an SQLite database for lllls and scores), `dada.segment` with the `dada.analysis.*` feature modules, `dada.cartesian` and `dada.distances` (2D corpus browsers); rule-based and geometric interfaces (`dada.bounce`, `dada.bodies`, `dada.boids`, `dada.life`, `dada.kaleido`, `dada.graph`, `dada.machines`, `dada.nodes`, `dada.platform`, `dada.multibrot`, `dada.stage`); and audio objects (`dada.terrain~` with its `dada.terrain.*~` path generators, `dada.peanos~`, and the Mac-only `dada.music~`).

**Names that do not load.** These have refpages but no object file and no mapping in this install: `cage.anal` (use `cage.markov.analysis`), `cage.prob` (use `cage.markov.synthesis`), `cage.ezaddsynth~` (use `cage.ezsynth~`), `cage.ezseq~` (use `cage.ezsampler~`), `cage.glue`, `cage.scissors`, `dada.match`, `dada.pareto`, `dada.terrain.rectangle~` (use `dada.terrain.rect~`). Old names that still load through mappings: `cage.shift` → `cage.offset`, `cage.extract` → `cage.crop`, `dada.catart` → `dada.cartesian`. `cage.combinevoices` only calls `bach.combinevoices`.

---

## FrameLib (frame-based DSP)

**One-line:** Alex Harker's frame-scheduled DSP framework. Re-imagines Max audio processing as a graph of variable-length, time-stamped frames passed between objects, rather than fixed-block sample streams. Designed for exact, sub-sample timing and multirate work (granular, spectral) that is awkward in standard MSP, in realtime or non-realtime.

### Frames — variable-length, scheduled blocks

A FrameLib **frame** is a block of values (samples or any other data) tagged with a time. Objects emit frames at scheduled times, not on every audio block. Frame size is variable — one object may emit a 64-sample frame, the next a 1024-sample one, and they connect cleanly because each frame carries its size and timestamp explicitly.

This is the conceptual departure from MSP. In MSP, every connection carries a fixed-rate signal of the audio block size. In FrameLib, connections carry frames at irregular times — closer to a packet network than a continuous signal.

### Schedulers and the network entry point

A FrameLib network is driven by a **scheduler** at its head — most commonly `fl.interval~` (emit an empty trigger frame every N samples, or ms / seconds / hz with the units argument: `fl.interval~ 500 ms`). The other schedulers are `fl.once~`, `fl.perblock~`, `fl.audiotrigger~` (a frame for each non-zero input sample) and `fl.chain~` (frames at times listed in a frame). The scheduler defines when frames originate; downstream objects react to them. Multiple schedulers in one patch are allowed but each defines its own timing root.

### Getting audio and messages in and out

FrameLib frames are not MSP signals, and there are separate bridges for audio and for messages:

- **Audio in:** `fl.source~` captures the latest audio as a frame when triggered; `/length` sets the frame size and adds that much latency.
- **Audio out:** `fl.sink~` overlap-adds frames back into an MSP signal with no added latency. This is how you hear a network.
- **Control signal out:** `fl.trace~` holds frame values as an audio-rate signal until the next frame.
- **Messages:** `fl.frommax~` turns Max messages into frames (only when a frame reaches its trigger input); `fl.tomax~` turns frames into Max messages. `fl.tomax~` does not produce audio.

A typical spectral chain: `fl.interval~` → `fl.source~` → `fl.window~` → `fl.fft~` → processing → `fl.ifft~` → `fl.window~` → `fl.sink~`.

### Contexts — self-contained worlds

Every connected set of FrameLib objects belongs to a **context**. The context is set with the `@id <name>` attribute (usually on the scheduler); if absent, objects share the **default context**. Two contexts don't interfere even if they use the same named resources (`fl.store~ foo` in context "a" is independent of `fl.store~ foo` in context "b").

`fl.contextcontrol~ @id <name>` controls an existing context through messages: `multithread 1/0` (off by default), `timeout`, and `export` (writes the network as C++). It processes no frames itself.

**Non-realtime mode** is set with the `@rt 0` attribute (the tutorial sets it on the scheduler: `fl.interval~ 1024 @rt 0`). Audio IO then uses buffers (`fl.source~ @buffer <name>`, `fl.sink~ @buffer <name>`), and time only advances when you send `reset` and then `process <samples>` to the scheduler (e.g. a message box `reset, process 88200`). These messages exist only on schedulers and on `fl.source~`, `fl.sink~`, `fl.trace~`.

### Parameters, attributes and the `~` suffix

FrameLib object names always end in `~` — they live in MSP — but the tilde here means "FrameLib object" rather than "audio-rate signal."

**Parameters are not Max attributes.** They are written `/name value` in the box, or given as plain arguments in a fixed order: `fl.source~ /length 4096`, `fl.window~ hann /compensate reconstruct`, `fl.interval~ 512`. Writing `@length` or `@interval` is a silent guess. Only three names are real Max attributes, written with `@`: `id` (context), `rt` (realtime flag) and `buffer` (non-realtime IO). Many parameters are marked "instantiation only" in the refpages and cannot change while running.

To change parameters from inside a network, frames can carry **tags** (named per-frame values): `fl.tag~` attaches them, `fl.untag~` and `fl.filtertags~` read them, `fl.combinetags~` merges them, and `fl.frommax~ /mode params` builds tagged frames from Max messages. Send a tagged frame to an object's parameter input.

Operators are typed with symbols: `fl.+~`, `fl.-~`, `fl.*~`, `fl./~`, `fl.%~`, `fl.==~`, `fl.&&~`, `fl.complex.*~` and so on (their files are named `fl.plus~`, `fl.and~`, etc., mapped in `init/fl-objectmappings.txt`). `fl.expr~` names its inputs `in1`, `in2` …, not `$f1`: `fl.expr~ in1 * 2 - 1`.

### Multistream

A first argument such as `=4` makes an object handle four parallel streams at once, FrameLib's version of MC. `fl.pack~` and `fl.unpack~` combine and split streams; `fl.streamid~` tells each stream its number (from 1).

### Complex frames

Complex-valued operations use pairs of frames (real and imaginary). The binary ones such as `fl.complex.+~` take **two pairs** of input frames and emit one pair; the unary ones such as `fl.complex.sqrt~` take one pair. `fl.fft~` outputs real and imaginary frames and `fl.ifft~` takes them back; `fl.cartopol~` / `fl.poltocar~` convert to and from magnitude and phase.

### State sharing — fl.store~ / fl.recall~

`fl.store~ NAME` writes a frame to a named slot; `fl.recall~ NAME` reads it. The pair is **scoped to the context**, so the same name in different contexts is independent storage. Use this for cross-network communication within a context. `fl.register~` stores and recalls a frame locally.

### Common gotchas

- **Don't connect FrameLib outputs directly to MSP audio inputs.** Use `fl.sink~` (audio) or `fl.trace~` (control signal). `fl.tomax~` makes Max messages, not signals.
- **Parameters use `/`, not `@`.** See above.
- **Default context is shared.** If you don't set `@id` on the scheduler, objects join the implicit default — meaning two unrelated networks may step on each other's `fl.store~ foo`.
- **Mismatched frame lengths.** Binary operators and `fl.expr~` handle inputs of different lengths according to `/mismatch`; the default `wrap` reads the shorter input repeatedly, so results can look plausible but be wrong. Set `shrink` or a pad mode when that matters.
- **Objects that expect uniform frames reset when the length changes** (`fl.lag~`, `fl.framedelta~`, `fl.timemean~` and relatives).
- **NRT mode requires manual time advancement.** Forgetting to send `reset` and `process N` after switching to `@rt 0` leaves the network stuck at time 0.

---

## ears (HISSTools-aligned buffer audio)

**One-line:** Daniele Ghisi's library for offline (non-realtime) algorithmic audio manipulation on buffers, built on the bach public API. The `ears.process~` family (`ears.process~`, `ears.in~`, `ears.out~`, `ears.in`, `ears.out` and relatives) is by Andrea Agostini. **Requires the bach package to be installed.** Despite the section title it is not part of HISSTools; the HISSTools Impulse Response Toolbox is by Alex Harker and Pierre Alexandre Tremblay and is a separate package.

ears objects take buffer names as messages (symbols or lllls) and output the names of new or modified buffers, so a chain of ears objects passes buffer names from one to the next. They run when triggered, on the main thread by default, not in the audio thread. Use ears for offline analysis, batch buffer processing, and editing tasks that would be awkward in realtime audio: reading and writing files (`ears.read~`, `ears.write~`), joining, mixing, slicing, fades, gain, filtering, time-stretching (`ears.rubberband~`, `ears.paulstretch~`), spectral transforms (`ears.stft~`, `ears.istft~`, `ears.cqt~`), descriptors (`ears.essentia~`, `ears.vamp~`), wavesets, ambisonics (`ears.hoa.*`), and bouncing a `bach.roll` to audio (`ears.roll.sampling~`).

Almost every ears object name ends in `~`, even though it processes buffers rather than live signals; the exceptions are the message bridges `ears.in` and `ears.out`. Arithmetic objects are typed with symbols: `ears.+~`, `ears.-~`, `ears.*~`, `ears./~`, `ears.!-~`, `ears.!/~`, `ears.==~`, `ears.!=~`.

### Shared attributes

- `@naming` decides where output goes: 0 (copy) writes back into the input buffer, 1 (static) always reuses one output buffer, 2 (dynamic) creates a new buffer for every command, which can use a lot of memory. A first symbol argument is a shortcut for the policy (see the refpages).
- `@outname` gives the output buffers fixed names (used with static naming).
- `@polyout` can output a polybuffer~ instead of a list of buffers.
- `@blocking` (set in the box only) chooses the thread; 1, the main thread, is the default.

### ears.process~ — offline rendering of ordinary MSP patches

`ears.process~ <patch>` loads a normal MSP patch (like `poly~`) and runs it faster than realtime on buffers. Inside the patch, `ears.in~` / `ears.mc.in~` read input buffers, `ears.out~` / `ears.mc.out~` write output buffers, `ears.in` / `ears.out` pass messages, and `ears.processinfo~` reports progress. `@tail <ms>` extends the render so decays are kept. Timed objects such as `metro` and `delay` follow the offline audio time; objects that turn signals into messages can mistime. The help calls it experimental.

---

## odot (modern OSC for Max)

**One-line:** CNMAT's Open Sound Control framework for Max, written by Adrian Freed and John MacCallum and now maintained by John MacCallum. It replaces CNMAT's older OSC objects in CNMAT Externals: `OpenSoundControl`, `OSC-route`, `OSC-schedule` and `OSC-timetag`. Their refpages list them in lowercase (`opensoundcontrol`, `osc-route` and so on), but they are the same objects, and all four are deprecated.

odot treats an OSC bundle as one piece of data that moves along a single patch cord. A bundle holds many address/value messages. Objects pass bundles to each other as `FullPacket` messages. The main objects:
- **Write and see bundles:** `o.compose` turns typed text into a bundle, `o.display` shows bundles as text, and `o.print` prints them.
- **Compute:** `o.expr.codebox` evaluates C-like expressions over the addresses in a bundle.
- **Choose where a bundle goes:** `o.if` sends it left or right depending on an expression, and `o.cond` picks one of several outlets.
- **Split by address:** `o.route` sends messages out by address and strips the matched part. `o.select` does the same but keeps the address.
- **Build and store:** `o.pack` binds inlets to addresses, `o.collect` gathers messages until a bang, and `o.var` stores a bundle for later.
- **Timing:** `o.timetag` binds the current time to an address, and `o.schedule` holds bundles until their timetag.
- **Convert:** `o.dict` turns a bundle into a Max dictionary.

odot's key commands put the core objects one keystroke away: `e` inserts `o.expr.codebox`, `d` inserts `o.display` and `C` inserts `o.compose` (init/max-keycommands.txt).

**Deprecated inside odot too.** `o.expr`, `o.message`, `o.pak`, `o.when`, `o.unless` and `o.edge~` are in `odot/deprecated/externals/`. That folder's README says they are unsupported and only load if you add the folder to your search path. Use `o.expr.codebox` where old patches or tutorials show `o.expr`.

Getting OSC in and out does not need a converter object. `udpreceive` and `udpsend` decode and encode OSC as Max messages by themselves. Give `udpreceive` a symbol as an extra argument and it passes whole packets on as `FullPacket` messages, which odot objects accept. Start with `extras/odot/o.start.here.maxpat` and `o.overview.maxpat`.

**Storing a bundle.** To keep a bundle for later, use `o.var` or `o.compose`: a FullPacket message is a pointer, so storing it in `zl.reg` or a message box keeps a reference that goes stale. When integrating with non-Max software speaking OSC, prefer odot over the deprecated CNMAT objects.

---

## MuBu For Max (corpus / multi-buffer container)

**One-line:** IRCAM's MuBu (Multi-Buffer) is a container for time-tagged multi-track data — audio, MIDI, sensor data, descriptors and markers kept together and aligned in time. Foundation for catart-mubu (curated separately) and for several IRCAM concatenative-synthesis and gesture-learning workflows.

A MuBu **container** (`mubu <name>`, or `imubu <name>` for the same thing with an editor) holds one or more **buffers** (in catart-mubu, typically one per sound file), and each buffer holds **tracks**. A track is a time series of 2-D matrices, either regularly sampled (with a sample rate) or time-tagged; tracks hold audio, descriptors, markers, sensor data, anything. Other objects find the container by name: `mubu.track` reads and writes one track, `mubu.record` / `mubu.record~` record into one, `mubu.play` / `mubu.play~` play one back, `mubu.knn` searches one, and `mubu.concat~`, `mubu.granular~` and `mubu.additive~` synthesize sound from the container.

**Modules are not boxes.** The `pipo.*` and `mimo.*` externals are plugins loaded by name inside a host, without their prefix:
- PiPo modules process streams, chained with colons: `pipo~ slice:fft:moments` on live audio, `pipo median:scale` on lists, `mubu.process <mubu> audio descr:chop @name descr` on recorded tracks. Module attributes carry the module name as a prefix (`@descr.winsize`, `@chop.size`); a module can be renamed in the chain, e.g. `savitzkygolay(sg)` → `@sg.size`. The JavaScript module is used as `js` (`@js.expr`).
- Mimo modules train on a whole track with `mubu.model <mubu> <track> pca` (or `normalize`, `stats`); `getmodel` returns the model as JSON, which is then applied live through a PiPo host, e.g. `pipo normalize @normalize.model <dict>`.
- Hosts that process time-based data (e.g. `pipo 1euro`) need the real data rate (`@framerate` on `pipo`, `@samplerate` on `mubu.process` / `mubu.track`), or 1000 Hz is assumed.

**Selection versus playback.** `mubu.concat~` plays the segment you address by marker and buffer index; it does not choose by sound. Choosing by descriptors is `mubu.knn` upstream (kD-tree search over a track), as in catart-mubu: `mubu.knn` → `camu.random` → `mubu.concat~` (`camu.select` bundles `mubu.knn` with `camu.random.filter`).

The decision-relevant choice is: do you have multi-modal time-tagged data (audio + descriptors + markers, or recorded gestures) that you want to keep together, analyze with PiPo, or learn from (`mubu.gmm`, `mubu.gmr`, `mubu.hhmm`, `mubu.xmm`)? If so, MuBu is the right container; if you only have audio in a buffer, `buffer~` is enough.

---

## PeRColate (Perry Cook STK port)

**One-line:** Dan Trueman and R. Luke DuBois wrote this collection of MSP objects. It is now maintained by Cycling '74. Its core is a set of physical models ported from the Synthesis Toolkit (STK) by Perry Cook and Gary Scavone. Around it are table generators ported from RTcmix (Brad Garton), plus Trueman's and DuBois's own effects and signal utilities.

**Three kinds of objects.** Not everything in the package is an STK model, and each kind is driven differently:

- **STK instrument models.** Wind: `flute~`, `clar~`, `blow_hole~`, `saxofony~`, `brass~`, `blow_botl~`, `whistle~`. Strings: `bowed~`, `mandolin~`, `plucked~`, `stif_karp~`, `sitar~`. Bars and bells: `marimba~`, `vibraphone~`, `agogo~`, `bowedbar~`, `bandedWG~`. Membrane: `mesh2d~`. Voice: `voice_form~`. FM: `prc_fm~`.
  - The shaker models are `metashaker~` (seven models in one object), plus `bamboo~`, `cabasa~`, `guiro~`, `sekere~`, `shaker~`, `sleigh~`, `tamb~`, `wuter~` and `shakers~`.
  - The hybrids `blotar~` and `ublotar~` are Trueman's flute-guitar crossings of STK models.
  - There is no piano model.
- **Effects and utilities by Trueman and DuBois.**
  - Granulator: `munger~`.
  - Delay scrubbers: `scrub~`, `scrubf~`, `flapper~`.
  - Buffer tools: `recordf~`, `pokef~`.
  - EQ: `gQ~`.
  - Spectral objects for use inside `pfft~`: `vcomb~`, `vcompand~`, `vcompand2~`, `vstretch~`, `vwarp~`, `casey~`.
  - Signal utilities: `dcblock~`, `curvesmooth~`, `absmax~`, `absmin~`, `chase~`, `waffle~`, `weave~`, `flip~`, `escal~`, `jitter~`, `klutz~`, `random~`.
  - 2D wavetable: `terrain~`.
  - Body-resonance filter from the NBody project: `nbody~`.
  - Collision model: `nscradle~`.
  - STK effects: `JC_rev~`, `N_rev~`, `PRC_rev~`, `prc_chorus~`, `pit_shift~`.
- **RTcmix table generators:** `gen5`, `gen7`, `gen9`, `gen10`, `gen17`, `gen20`, `gen24`, `gen25`. On `bang` they output index/amplitude pairs. Write those into a `buffer~` with `peek~`, then read the buffer with `wave~` or `lookup~`.

**Two ways to play a model.** Check which one an object uses before wiring it. There are no `setX`-style parameter messages; the only set-prefixed messages are `mesh2d~`'s `setDecay`, `setNX` and `setNY`.

- **Inlet-driven models** sound continuously from float or signal values in their inlets. Each parameter has its own inlet; for the pitched models, frequency is usually the rightmost. For instance, `flute~` takes breath pressure, jet delay, noise gain, vibrato frequency, vibrato gain and frequency. Same pattern: `clar~`, `bowed~`, `brass~`, `bowedbar~`, the single-instrument shaker objects and `blotar~`.
  - `mandolin~` plucks on `bang`.
  - `marimba~`, `vibraphone~` and `agogo~` also take `noteon` and `noteoff`.
  - Those shakers sound only while their energy / maximum-shake inlet keeps changing.
- **Message-driven models** have one inlet. Play them with `noteon <Hz> <amp 0-1>` and `noteoff <amp>`, and set timbre with `control <number> <value 0-128>`. The control numbers differ per object, so check the refpage. Examples: `blow_botl~`, `blow_hole~`, `saxofony~`, `bandedWG~`, `prc_fm~`, `voice_form~`, `stif_karp~`, `simple~`, `whistle~`. `sitar~` takes only `noteon` / `noteoff`.

**Gotchas.**
- **Frequency is in Hz everywhere.** Convert MIDI notes with `mtof`, as every help file does.
- **Some models get loud.** Some parameter combinations blow up to full scale, and the help files put `limi~` after `flute~`, `mandolin~`, `saxofony~`, `ublotar~` and `vcomb~`.
- **Spelling.** Type `mesh2d~` with a lowercase d; the external file and help file both use that spelling.
- **Replaced objects.** The `escal~` and `flip~` help files say `round~` and `pong~` have more or less replaced them.
- **MC versions.** The init file registers `mc.` versions of most objects, but two mappings are misspelled, so there are none for `guiro~` and `saxofony~`.
- **Architectures.** All binaries are universal (Intel and Apple Silicon).

Use PeRColate when you want recognisable acoustic or percussive timbres without sample libraries, or a quick classic effect such as `munger~` or the scrubbers. Max's own `abl.dsp.modalresonator~` is the nearest built-in to the modal bar models. Nothing built in replaces the waveguide winds and strings.

---

## grainflow (granular synthesis)

**One-line:** Christopher Poovey's multichannel granulation package. Grains run sample-accurately on the audio thread. Each grain is its own mc channel, and each grain's parameters can be driven by messages, lists, buffers or mc signals.

### The core objects

- `grainflow~` granulates a `buffer~`. Arguments: `<buffer name> <max grains> [envelope buffer]`.
- `grainflow.live~` does the same with live input. It records into its own internal buffer, with separate `@rec`, `@play`, `@freeze` and `@overdub` controls.

There are no `gf.*` objects. The only `gf` installed belongs to MuBu and is unrelated.

### A phasor is the grain clock

Grains are not triggered by messages; the trigger message was removed in grainflow 2.0, and the help file calls event triggering "not the ideal way". Instead, signals drive `grainflow~`. The help file labels its inlets:
- **Grain clock:** a phasor. Its speed sets how often grains start and how long they last.
- **Traversal:** a 0–1 position in the buffer.
- **FM** in semitones.
- **AM.**

`grainflow.util.rateSizePhasor~` builds the grain clock from a grain rate in Hz and a grain size in ms, and the help file also suggests the built-in `mc.snowphasor~`. `grainflow.util.phasor~` makes a looping phasor with low and high bounds, and `grainflow.util.bphasor~` makes one based on a buffer's playback rate.

### One mc channel per grain

`grainflow~` outputs every grain as a separate channel of an mc signal. You always need something after it that places or mixes the grains:
- `grainflow.util.stereoPan~`: random equal-power stereo.
- `grainflow.util.multiPan~`: equal-power circular panning over N speakers.
- `grainflow.spat.pan~`: distance-based or vector-based panning over a speaker array.

For `grainflow.spat.pan~`, grain positions come from the `grainflow.spat.*` position objects, such as `grainflow.spat.3dspread`, `grainflow.spat.volume`, `grainflow.spat.spirograph` or `grainflow.spat.phys`. Speaker layouts come from `grainflow.spat.speakers`. `grainflow.spatview~` shows the result, and `grainflow.waveform~` shows grains on the buffer. `grainflow.util.vbap3d` is deprecated in favour of `grainflow.spat.pan~`.

### Controlling many grains at once

Most attributes have a base value, an `...Offset` that changes it by grain index, and a `...Random` that adds a random amount per grain. Examples include `@transpose`, `@rate`, `@delay`, `@window`, `@space`, `@density`, `@amp` and `@glisson`.

These messages set grain parameters:
- `g <grain> <message>` addresses one grain.
- `deviate`, `spread` and `randomrange` spread a parameter across all grains.
- `streamSet`, `nstreams` and `stream` put grains into groups and set each group separately.
- `windowMode`, `rateMode`, `delayMode` and `glissonMode` set to 1 or 2 read per-grain values from buffers.
- `env` and `env2D` set the grain window buffers. The default window is a Hanning shape.

### Ready-made abstractions

These abstractions are built on the same engine and accept grainflow~ messages: `grainflow.chorus~`, `grainflow.harmonize~`, `grainflow.sustain~`, `grainflow.freeze~`, `grainflow.synth~` (a polyphonic MIDI sampler), `grainflow.streams~` and `grainflow.scrubSynth~`.

### When to use it

Use grainflow when you want explicit, per-grain control and multichannel output, with grain timing set by signals. For corpus-based granular work over analysis data, use `mubu.granular~` with a MuBu container. `karma~` is a varispeed looper (its refpage digest), not a granulator.

---

## Vsynth (modular video synthesis)

**One-line:** Kevin Kripper's modular video synthesizer for Max. It emulates analog video synthesis (oscillators, colorizers, keyers, feedback) with GPU texture modules, plus a separate family of oscilloscope-style vector synthesis modules.

### Two families of modules, two kinds of cords

Vsynth is not one signal type. It has two families that pass different things:

- **`vs_*` texture modules (100 of them).** Cords carry OpenGL textures. Inside, the modules process with `jit.gl.pix` and `jit.gl.slab`. Inlet and outlet labels read "Texture In / Control In" and "Texture Out". Waveform generators (`vs_wfg_2`, `vs_wfg_3`, `vs_wfg_rad`…), sources (`vs_camera_s`, `vs_camera_fm`, `vs_sources_main`, `vs_noise_*`), processors, mixers and keyers all belong here.
- **`vector_*` modules (30 of them).** Cords carry **audio signals** for oscilloscope or vector-display drawing. `XY` is a 2-channel multichannel cord, `B` is brightness, and generators also output `SYNC`. The modules process in `gen~`, `mc.gen~` and `mcs.gen~`. Generators include `vector_raster_generator`, `vector_grid_generator` and `vector_cube_generator`.
- **`vsc_*` control helpers (7).** Knobs, a color picker, a data scope, a spacebar trigger and a preset manager (`vsc_presets`). They send control data, not textures.

### Every module is a bpatcher

Modules are bpatchers, not object boxes. The help files say the only officially supported way to add them is the Vsynth menu: right-click an unlocked patch and choose Paste From `Vsynth/menu/vs_menu.maxpat` for texture modules, or `Vsynth/menu/vtr_menu.maxpat` for vector modules. Each module's control messages (such as `enable`, `freq`, `sync_lock`) go to its leftmost inlet and are listed under "External Control Messages" in its help file.

### The two terminals

- **`vs_render`** runs the texture system. It holds the `jit.gl.render` context and the `jit.window`, and sets `fps`, window `size` and texture `dim`. Have exactly one, even with several patches open; a duplicate causes heavy frame drops and an extra window. Show textures in the window through **`vs_output`** (a `jit.gl.cornerpin` layer; several stack), or preview them with `vs_preview` or `vs_preview_floating`.
- **`vector_3ch_out`** sends the vector signals to audio hardware. XY and B go out through `dac~` on selectable channels 1–8, to drive a real oscilloscope, vector monitor or laser. It does not make a Jitter matrix. Have only one. To see vector drawings on screen, use `vector_preview`, or convert them to a texture with `vector_audio2tex`.

### Bridges between the families and to audio

- `vector_audio2tex`: XY and B signals → texture, so vector drawings can be mixed with texture modules. The readme says it works better at 96 kHz.
- `vector_tex2audio`: texture → mono signal, used to modulate vector modules.
- `vs_audio2video`: any audio → scanned texture.
- `vs_envelope_follower`: audio loudness → texture and a number.
- `vs_wfg_av`: an audio-rate video oscillator that also outputs audio.
- Many vector generators take either a signal or a texture in their modulation inlets (XM, YM, BM).

### Timing

Waveform generators, spatial mixers and `vs_cos_palettes` follow a shared timer. Adjust it with `vs_sync` and `vs_sync_time`, or per module with the `sync_lock`, `time` and `sync_invert` messages.

### Common gotchas

- **One `vs_render` per Max session, and one `vector_3ch_out`.** Duplicates fight.
- **Texture outputs are not signals.** Never wire a `vs_*` outlet into MSP objects.
- **Vector outputs are real audio signals.** They are meant for `vector_3ch_out` and an oscilloscope-type display, not for listening. Route `vector_3ch_out`'s channels to the scope, not to your speakers.
- **Outside dependencies:** `vector_outline_generator` and `vector_sketcher` need the cv.jit package. `vs_syphon_client` and `vs_syphon_server` need the Syphon package (Mac). `vs_spout_client` and `vs_spout_server` need the Spout package (Windows). `vector_sosci` needs James Ball's Sosci VST.
- **The preset system** (`vsc_presets`) excludes `vs_render`, `vs_sources_main` and `vector_sosci`.
- **Built-in alternatives:** Vizzie and Jitter Tools (`jit.fx.*`) ship with Max and cover much of the basic effect set (keying, blur, feedback, delay, blend modes). Vsynth's distinctive parts are its analog-style oscillators with the shared timer, and its vector synthesis.

---

## RNBO Synth Building Blocks

**One-line:** RNBO/gen~ -domain synth primitives by Cycling '74 — pre-built ADSR, LFO, oscillator, filter wrappers ready to drop into RNBO patches.

The `sbb.*` prefix marks Synth Building Blocks. They abstract common gen~ patterns (linear vs. exponential envelopes, anti-aliased oscillators, biquad-based filters) so you don't have to rebuild them from primitives every time. Use inside RNBO patches; outside RNBO, reach for the equivalent native or third-party MSP objects (e.g. `function`, `cycle~`).

The decision-relevant choice within sbb.env.* is the curve shape: `sbb.env.adsr` is linear, `sbb.env.analog` is exponential (analog-style), `sbb.env.ad` is the lighter attack-decay variant for percussion.

---

## EAMIR SDK (modal / accessibility)

**One-line:** V.J. Manzo's EAMIR SDK is a toolkit for education, composition and accessible performance. It has two parts: the Modal Object Library (`modal_*`), for working with modes and harmony, and the V Objects (`vj.*`), general helper abstractions for files, windows and standalone apps.

`modal_change` is the centre of the library. Send it a tonic and a mode name (or a list of degree distances) and it outputs that mode's pitch data; it does not touch notes itself. To make played notes fit the mode, feed `modal_change` into `modal_coll_filter`, which fills a named coll mapping all 12 pitch classes onto the mode, then put `modal_filter <coll name>` on the note stream. `modal_filter` always remaps an out-of-mode note to an in-mode neighbour; it never blocks it. `modal_analysis` is the analysis side: it guesses the mode of played notes, so a system can follow the player instead of using a fixed mode. `modal_triad` and `modal_prog` build chords and progressions from function names in the current mode.

Only `modal_change` and `modal_triad` are compiled externals. Most other `modal_*` objects are old-format `.pat` abstractions.

---

## Digital Orchestra Toolbox (mapping / control)

**One-line:** IDMIL (McGill; Malloch, Sinclair, Schumacher, with Marcelo Wanderley) toolkit for gestural-controller mapping. Many objects are mathematical transforms suited to mapping sensor data onto synth parameters — interpolation, conditioning, spaces.

`dot.something` is the prefix. The whole package is Max abstractions, not compiled externals, so every object can be opened to see how it works. The bulk is control-data conditioning (smoothing, denoising, thresholds with hysteresis, auto-scaling, rate limiting) plus higher-level mapping tools. Smaller groups work at signal rate (`dot.*~`), on Jitter matrices (`dot.quaternion.jit.*`), or on OSC, SLIP and serial data. Use when building DMI (Digital Musical Instrument) mappings; many objects overlap with native Max math but add infinite bounds, list support or tuned defaults for human-rate control signals.

### Window families: `.exponential`, `.sliding`, `.timed`

Most statistics come in three versions, and the suffix says how the window is measured:

- `.exponential` — weights recent values more; the right inlet sets the weight of the current sample (`dot.mean.exponential` also has `@weight`, `@decay`, `@halflife`).
- `.sliding` — the last N values; the right inlet is the window size in samples (inputs), not time.
- `.timed` — the values from the last stretch of time; the right inlet is in milliseconds.

All three versions exist for `dot.mean`, `dot.deviation`, `dot.denoise` and `dot.autoscale`. `dot.median`, `dot.extrema` and `dot.aggregate` have `.sliding` and `.timed`. `dot.correlation` and `dot.covariance` have `.exponential` and `.sliding`.

### Older names still load

`init/dot-objectmappings.txt` maps earlier names onto current files, so old patches keep working: `dot.ema` → `dot.mean.exponential`, `dot.smooth` → `dot.mean.sliding`, `dot.debounce` → `dot.timing.debounce`, `dot.clip` → `dot.bound`, `dot.jab` → `dot.gesture.jab`, `dot.jit.quaternion.*` → `dot.quaternion.jit.*`, and more.

### Quaternion order

`dot.quaternion.*` lists are `[w x y z]`. Max's own `jit.quat` family orders Jitter quaternions X Y Z W, so reorder when mixing the two.

### Refpage quirks

Several refpages were copied from other objects: `dot.constrain` (describes `dot.coll`; it actually clamps to a range), `dot.quaternion.jit.rotate` and `dot.timing.metro` (list `freq`/`phase`/`bandwidth` from `dot.am.demodulate.asynchronous~`), and `dot.window.timed` (file named `dot.vector.scale`). Their port lists are often wrong too; trust the help patch.

### Reference instances (for orientation, not authority)

- **Smoothing and cleanup**: `dot.mean.exponential`, `dot.median.sliding`, `dot.denoise.exponential`, `dot.biquad.lowpass` (set `samplerate` to the data rate).
- **Calibration and scaling**: `dot.autoscale`, `dot.autoscale.exponential`, `dot.bound`, `dot.expression`.
- **Events from continuous data**: `dot.schmitt`, `dot.round`, `dot.timing.debounce`, `dot.extrema.local`, `dot.gesture.jab`.
- **Mapping between presets**: `dot.vector.interpolate.2`, `dot.vector.interpolate.4`.
- **Orientation**: `dot.quaternion`, `dot.quaternion.slerp`, `dot.quaternion.line`, `dot.quaternion.euler`.
- **Hardware and transport**: `dot.io.serial`, `dot.slip.decode`, `dot.osc.route`, `dot.midi.out`.
- **Capture and replay**: `dot.log.record`, `dot.log.play`.

---

## abclib (ambisonics, multichannel processing and synthesis)

**One-line:** CICM / Paris 8's toolbox for mixed-music composers (Bonardi, Goutmann, Fierro, Zanni), successor to the CICM HOA library. DSP is written in Faust. About 800 compiled `abc_*` externals are hidden behind 55 `abc.*` abstractions that pick the right external from the box arguments and connect everything with one multichannel cord.

### Two layers: `abc.*` abstractions over `abc_*` externals

The DSP lives in externals whose names bake in the configuration: `abc_2d_decoder5_12~` (2D decoder, order 5, 12 speakers), `abc_3d_multiencoder3_4~` (3D encoder, order 3, 4 sources), `abc_gain8~` (8 channels). Each variant has fixed inlets and outlets, one per channel.

You normally type the abstraction instead: `abc.hoa.decoder~ 5 @speakers 12 @dimensions 2`. Every wrapper file (`patchers/abc.*.maxpat`) holds a single box, `js abc_wrp.js #1 #2 #3 #4 #5 #6 #7 #8 #9`. At load, `javascript/abc_wrp.js` reads the abstraction's name and arguments, builds the external's name, and scripts the inside of the abstraction:

- one signal inlet; if the external has more than one signal inlet, an `mc.unpack~ N` splits the incoming multichannel cord;
- one control inlet, placed to the **right** of the signal inlet, wired to the external's left inlet;
- one outlet; if the external has more than one outlet, an `mc.pack~ N` joins them into one multichannel cord.

So abc objects chain with single cords, and each cord carries as many channels as the stage needs.

The externals are RNBO exports built from Faust code (the binaries contain `rnbo_external_wrapper`). The binaural decoders are the exception: they were built directly with Faust's Max target and carry one extra outlet, which the wrapper leaves unconnected. All 808 `.mxo` bundles checked are universal (x86_64 and arm64), and Windows `.mxe64` files ship alongside.

### Arguments, parameters and the control inlet

- **First number** means the main size: ambisonic order for `abc.hoa.*`, channel or instance count for `abc.mc.*`, speaker count for `abc.vbap~` and `abc.vector~`.
- **Wrapper attributes**, read by the script: `@dimensions 2|3` (or `@dim`), `@speakers` (`@spk`), `@sources` (`@src`), `@mode` (`@mod`), `@instances` (`@inst`), `@channels` (`@chan`, `@chans`, `@ch`).
- **Any other `@name value` pair** is copied into the external's box text as an initial parameter value. The help patches rely on this: `abc.hoa.encoder~ 3 @sa0 -0.2 @e0 10. @dimensions 3`, `abc.mc.addsynth~ 1 @f0 220.`.
- **At run time**, parameters are messages into the control (rightmost) inlet: `gain -6`, `a0 45`, `dur2 0.5`. Refpages list them as "attributes", but they are parameters of the external.
- **Indexed parameters** append the index with no padding: `a0`, `gain3`, `fmult12`. Index from 0.
- **Setting many at once:** the help patches send a semicolon message box such as `;dels dur0 0.5;dels gain0 -10.;dels dur1 1.` to a `[r dels]` wired to the control inlet.
- **Gains are in dB**, from -127 (silent) to +18. `abc.gaincontrol` is the matching slider; it sends `gain <dB>`.

### Ambisonic conventions (`abc.hoa.*`)

- **Order N** sets the spatial resolution. A 2D stream has 2N+1 channels; a 3D stream has (N+1)^2. For instance, order 3 is 7 channels in 2D and 16 in 3D. Every object in one chain must use the same order.
- **Limits in the wrapper:** 2D order 1-7, 3D order 1-3, 16 speakers, 8 sources for `abc.hoa.encoder~` and `abc.hoa.map~`, 16 instances for `abc.mc.*`.
- **Format:** the decoder refpage states Ambisonic Channel Numbering with N2D/SN3D normalisation.
- **Default decoder layout:** 2N+2 speakers in 2D, (N+1)^2 in 3D, regularly spaced. Irregular layouts are set with `a<i>` (and `e<i>` in 3D) messages, plus `angularoffset`. `directangles 1` means anticlockwise, the ambisonic norm.
- **A typical chain:** encoder or map, then optional processes (rotate, mirror, wider, decorrelation, delay, grain, ringmod), then optim, then a decoder (`abc.hoa.decoder~`, `abc.hoa.stereodecoder~`, or `abc.hoa.binaural~` for headphones), then `mc.dac~`.
- **Modes of the spatial processes:** `@mode fx` processes an existing ambisonic stream. `@mode syn` builds a spatial stream from one mono input. `abc.hoa.decorrelation~` also has `@mode man` (2D only), driven by lists from `abc.dtd.ui`.
- **3D coverage is partial.** 3D externals exist only for the decoder, encoder, binaural decoder, optim and wider (orders 1-3), plus decorrelation and ring modulation (fx and syn, orders 1-5), and `abc.vector~`. There is no 3D map, rotate, mirror, scope, delay, grain, stereo encoder or stereo decoder.

### Moving sources: the polar pair

`abc.hoa.map~` encodes sources with distance as well as angle. It has one inlet per source (`@sources n`) and no control inlet. Each inlet takes a 3-channel cord: the mono source joined to a 2-channel polar position pair, with `mc.combine~ 2`, source on the left. `abc.trajectories~`, `abc.pict2map` and `abc.cartopol~` all output that pair in the order the map expects. Use `abc.poltocar~` only to draw the path on a `scope~`. Angles are in radians; `abc.phasor2pi~` and `abc.mult2pi~` make radian ramps.

### GUI names are bpatcher substitutions

`init/objectmapping.txt` maps several names to bpatchers with `max definesubstitution`. Typing `abc.gaincontrol` in an object box creates `bpatcher @name abc.gaincontrol @border 1`. The same applies to `abc.2plf.ui`, `abc.map.ui`, `abc.dtd.ui`, `abc.adcinput~`, `abc.env.noise~`, `abc.generatorinterface~`, `abc.gotoevent`, `abc.pict2map`, `abc.quadriout~`, `abc.stereoout~`, `abc.scope`, `abc.scopeembedded`, `abc.musdur` and `abc.simplefmburst~`. Their initial values are bpatcher arguments, e.g. `@gain -127`. The help files save them as `bpatcher` boxes with `name: "abc.gaincontrol.maxpat"`.

### Common gotchas

- **Only nine tokens reach the script.** The wrapper box passes `#1` through `#9`, so anything after the ninth word of the box text is dropped silently. `abc.hoa.encoder~ 3 @dimensions 3 @sources 2 @sa0 0.1 @se0 0.5 @e0 10.` has 11 tokens, so `@e0 10.` never arrives. Set further parameters by message.
- **Port counts come from the arguments, not the refpage.** Refpages ship with their inlet and outlet lists commented out. Most processors have 2 inlets (signal, control) and 1 outlet. Generators with no audio input (`abc.mc.addsynth~`, `abc.drops~`, `abc.trajectories~` and others) have 1. `abc.cartopol~`, `abc.poltocar~` and `abc.mult2pi~` have no control inlet. `abc.mc.busplus~` and `abc.mc.busmult~` have 2 signal inlets. `abc.mc.busselect~` has 3. `abc.hoa.map~` has `@sources` inlets.
- **An impossible configuration builds a missing object inside the abstraction**, with only a console error. For instance `abc.hoa.rotate~ 2 @dimensions 3`, or `abc.hoa.decoder~ 4 @dimensions 3`: the script's 3D order check runs before it reads `@dimensions`, and there is no order-4 3D decoder.
- **Modes are attributes.** `abc.jupiterbank~` and `abc.puckettespaf~` ignore a bare number; only `@mode 2` selects mode 2.
- **Refpages drift from the externals.** Trust the help patches when they disagree. For instance, `abc.hoa.delay~` uses `window`, which its refpage omits, and `abc.rissetsbell~` uses `pfreq2`, not `pfreq`. Three refpage files declare the wrong object name: `abc.hoa.stereoencoder~`, `abc.mc.busselect~` and `abc.simplefmburst~`.
- **Don't edit a wrapper abstraction.** Its contents are rebuilt by script at every load, and the script writes a "DO NOT MODIFY" comment inside it.

---

## Panning Tools (amplitude panning abstractions)

**One-line:** Christopher Dobrian's set of plain Max abstractions (no externals) for stereo, quad, hexaphonic and octophonic panning, plus distance, Doppler, random-offset and routing helpers. Every panner shares one set of conventions, so learn them once.

### Control values are 0. to 1.

- **Position** controls run 0. to 1.: left to right, front to back, down to up. 0.5 is the middle.
- **Azimuth** (angle) runs 0. to 1. around a full circle, starting at front-center and going clockwise. Values wrap: 1.25 is the same as 0.25, and negative values go counterclockwise.
- **Spread** (`hexapan~`, `octopan~`, `surroundstereo~`) runs 0. to 1. At 0 only the two nearest speakers sound. Higher values bring in more speakers, and the total gets louder.
- **Arguments set starting values only.** They matter when no signal is connected to that inlet.
- **Signal or float.** Most controls accept either. A float jump can click on a sounding note, so the help files ramp floats through `line~` over about 10 ms. A few inlets need a signal (the position of `fourchanpan~`, the front-back of `pan2x4~`, the controls of `hexapan~`, `octopan~`, `octopan2~`, `panpolardd~`). Two need floats (`balancestereo~` balance, `gainsimple~` gain).

### Speaker layouts and outlet order

| Objects | Layout assumed | Outlets |
|---|---|---|
| `pan~`, `panlinear~`, `panstereo~`, `balancestereo~` | stereo | L, R |
| `panLRFB~`, `quadpan~`, `circularLRFBpan~` | four speakers in a rectangle or square (quadpan~: at 45°, 135°, 225°, 315°) | left-front, right-front, left-rear, right-rear |
| `fourchanpan~` | four speakers in a line or front arc | left to right |
| `hexapan~` | hexagon; layout 1 (default) speaker 1 at −30°, layout 0 speaker 1 at front-center | clockwise |
| `octopan~`, `panpolardd~`, `surroundstereo~`, `octonode~`, `IOrouter8to2dd~` (inputs) | "double diamond": 8 speakers at 45° steps, speaker 1 front-center | clockwise |
| `octopan2~` | 8 speakers, speaker 1 at 22.5° left of front (no center speaker) | clockwise |
| `pan2x4~` | "shoebox": four left-right pairs front to back | 1-2 front … 7-8 back, odd = left |
| `cubepan~` | cube: four low, four high | 1-4 low (LF, RF, LB, RB), 5-8 high in the same order |

### Building blocks that load each other by name

The objects are layered. `pan~` sits inside `panLRFB~`. `panLRFB~` sits inside `cubepan~` and `panpolardd~`. `fourchanpan~` sits inside `pan2x4~`. `octopan~` sits inside `surroundstereo~` and `octosampler~`. `surroundstereo~` sits inside `surroundstereosampler~`. These are abstraction files found by name, so keep the whole package installed. Also avoid saving your own patch as `pan~.maxpat` or `mix~.maxpat`: a same-named file that Max finds first would replace Dobrian's everywhere it is used.

### One mono cord per speaker; `mc.` versions for polyphony

The plain panners output one ordinary (mono) cord per speaker. This is on purpose: it leaves multichannel (MC) cords free to carry many voices. Each `mc.` version (`mc.pan~`, `mc.octopan~`, …) is a separate hand-built abstraction, not Max's MC Wrapper around the plain one. It takes an MC signal of N voices plus MC control signals with one channel per voice. Each outlet is then an N-channel cord for one speaker. Add `mc.mixdown~ 1` on every outlet before `dac~`.

For many notes that overlap, each with its own place, there are two routes. You can put a panner inside a `poly~` voice (the synths and samplers in `patchers/synths/` do this). Or you can run a voice patch in `mc.poly~` and follow it with an `mc.` panner.

---

## mat.oo (call shared patch code by name)

**One-line:** Matthew Aidekman's two abstractions for request-and-reply messaging. Patch code lives once, inside a `mat.oomethod`. Any number of `mat.oocall` boxes send it a message and get its answer back out of their own outlet.

### The calling convention

1. **Name.** `mat.oomethod <name>` and `mat.oocall <name>` pair up when the names match. The names are global, like `send` / `receive` names.
2. **Call.** A message or bang into `mat.oocall`'s left inlet comes out of the method's left outlet. Inside, the caller adds its own `#0` number to the front as a return address.
3. **Reply.** Whatever you send into `mat.oomethod`'s inlet goes back to the caller that asked, and only that caller. The method remembers just the most recent caller. So it must reply at once, in the same message chain: no `delay`, `pipe` or `deferlow` between its outlet and inlet. The package example says "One message in, one message out."
4. **Switch method.** A symbol in `mat.oocall`'s middle inlet changes which method it calls.
5. **Parent ("this").** `@parent <symbol>`, or a symbol in the right inlet, is sent to the method's right outlet just before each call. That lets one method act for many named objects (see `mat.oo.ex5_loadingMethodsOnce`). It is sent to the method named by the box's argument, not by the middle inlet, and a numeric parent is dropped.

### Object-style naming inside abstractions

Inside an abstraction, name methods `#1.<name>`. An abstraction loaded as `plasticCup joesCup` then answers `mat.oocall joesCup.color`, and a second copy named `antwansCup` answers separately. Wire a method's outlet into a `v` (or `coll`, `dict`, …) and that object's output back into the method's inlet, and you get a property: a bang reads it, any other message writes it.

---

## ABL Effect Modules (Ableton effects as ready-made panels)

**One-line:** Cycling '74's set of 48 stereo effect and utility modules (2025, Max 9.1.2 or later). Each one is an abstraction that puts a panel, presets, bypass and modulation routing around one object from Max's bundled **ableton-dsp** package (`abl.dsp.*~` / `abl.device.*~`). The DSP is Live's own, so a module sounds like the matching Live device.

### Module or bare object? Decide this first

Every module (except the routing utilities) is a shell around a built-in object you can use directly. The choice:

- **Use the module** when a person will turn knobs: it gives a finished panel, factory presets, a click-free on/off switch, meters, copy/paste between instances, parameters that Snapshots and Max for Live automation can see, and mono-to-stereo handling.
- **Use the bare `abl.*` object** when a patch controls the effect: you need signal-rate control of a parameter, you need an outlet the module hides (for instance the envelope outlet of `abl.device.compressor~`), you want more than two channels (`mc.abl.dsp.*~`), or you want no UI and no extra CPU for meters and polling.

The module's parameter names are its own short labels (`Feed`, `Damp`, `Thresh`), not the object's attribute names (`feedback`, `damping`, `threshold`). Do not mix the two vocabularies.

### `abl.dsp.*~` versus `abl.device.*~`

This split is read from the refpages, not stated in a document:

- **`abl.device.*~`** is a whole Live device with its full feature set. For instance, `abl.device.autofilter~` has an LFO, envelope follower and sidechain. `abl.device.drift~` is the Drift synth. There are 15 of them.
- **`abl.dsp.*~`** is one algorithm taken from inside a device. For instance, `abl.dsp.darkhall~` is one reverb from Hybrid Reverb, and `abl.dsp.chorus~` is one mode of Chorus-Ensemble. Oscillators and modulators (several of them from Meld) are here too. There are 59 of them.
- Only the `abl.dsp.*~` objects have multichannel versions (`mc.abl.dsp.chorus~` and so on). They are mapped in `ableton-dsp/init/abl-dsp-mc.txt`. That file has no `mc.abl.device.*~` entries.
- Any float attribute of an `abl.*` object can get its own signal inlet with `@ins`, but only when you type it in the box. It cannot be changed later in the Inspector. While DSP is on and a signal is connected to such an inlet, the attribute ignores messages. (Source: the "Dynamic inlets" tab of `ableton-dsp/extras/Ableton DSP Objects.maxpat`.)
- Some objects are mono (1 in, 1 out). Examples are `abl.dsp.compander~`, `abl.dsp.dfm~`, `abl.dsp.filther~` and `abl.dsp.vowel~`. The module runs two copies, one per side. `abl.device.reverb~` takes one input and makes pseudo-stereo. `Abl.PlateReverb~` sums L+R at half gain before it.

### The shared port layout

Almost every module has 4 inlets and 4 outlets, in this order:

| Port | Inlet carries | Outlet carries |
|---|---|---|
| 0 | stereo audio as **one 2-channel MC cord**. A plain mono MSP cord also works: it is copied to both channels. | stereo audio as one 2-channel MC cord |
| 1 | modulation signal A (0.–1.) | modulation signal A (0.–1.) |
| 2 | modulation signal B (0.–1.) | modulation signal B (0.–1.) |
| 3 (rightmost) | `<Param> <value>` messages and `pattrstorage` messages | reports of changed parameters, as `<Param> <value>` |

The exceptions are listed in each object's `use_when`. `Abl.AutoFilter~` adds a sidechain inlet at 1. `Abl.Fade~` and `Abl.Matrix~` have 2 or 4 audio pairs. `Abl.LFO~`, `Abl.EnvFollower~` and `Abl.ModScaler~` output 0.–1. control signals instead of audio. `Abl.Input~` and `Abl.Output~` have one modulation port. `Abl.Pitch~` has 2 inlets and 3 outlets.

Because the audio outlet is MC, a module goes straight into `mc.dac~`, `Abl.Output~` or another module. To feed a plain MSP object, put `mc.unpack~ 2` under it.

### Controlling a module

- **By message, into the rightmost inlet.** `Mix 0.3`, `Decay 0.8`, `Active 0`. The name is the parameter's label, and it is case-sensitive. For a menu or tab parameter, send the item index (0-based). `getclientlist` lists every name out of the rightmost outlet.
- **By preset.** The small menu next to the title holds the factory presets. From a message: `recall 3`, `store 9 MyPreset`, `delete 3`, `write` / `read` (a preset bank file), `storagewindow`, `clientwindow`. Each module has its own `pattrstorage` named after it (`@autorestore 0 @savemode 0`), with the factory bank stored inside the module. The same banks also ship as JSON files in `misc/`. No module loads those files by itself.
- **By remote name.** `Abl.Chorus~ @name MyChorus` (object box or bpatcher) makes `; MyChorus Feed 0.5` work from anywhere. It also names the module's floating window.
- **By opening it.** `open` in the rightmost inlet shows the panel in its own window. This is how an object-box module (not a bpatcher) is used.
- **By Max's Parameters system.** Every control is a `live.*` object with `parameter_enable`, so Snapshots, MIDI/key mapping and Max for Live automation all see the module's parameters.

### Modulation, the module way

Each module has up to two modulation inputs and two outputs. A menu on the panel picks which parameter each one drives or reports.

- **A modulation input is not signal-rate.** Inside, `snapshot~` samples it every 30 ms (`qmetro 30`). The value goes to the chosen dial as `rawfloat`, so 0.–1. sweeps that parameter's whole range. The polling only runs while an input is assigned and the module is active.
- **A modulation output** is the chosen parameter's position (0.–1.), smoothed by `line~` over 30 ms.
- `Abl.LFO~`, `Abl.EnvFollower~` and `Abl.ModScaler~` exist to make these 0.–1. signals.

For audio-rate modulation, skip the module. Patch a signal into an `@ins` inlet of the bare `abl.*` object.

### Active (bypass)

The Active toggle (`Active 0/1`) crossfades between dry and processed sound over 10 ms with `adsr~ 10 0. 1. 10`. When the fade-out ends, `adsr~`'s mute outlet drives `mute~` on the effect subpatcher, so a bypassed module uses almost no CPU. `mc.pass~` before the subpatcher's outlet makes sure it outputs silence rather than noise while muted.

### Copy / Paste between instances

The preset menu's Copy and Paste items store and recall the whole module state in a `coll` whose name is **not** per-instance: `coll Abl.Chorus` is shared by every `Abl.Chorus~` in every open patch. That sharing is on purpose, because it is how Paste reaches a different instance. Everything else inside a module uses `#0-` names.

### Package plumbing a reader may trip over

- `init/Abl.EffectModulesInit.txt` defines `mc.pass~` (as `mc.wrapper~ pass~`). Max itself does not define that name. So a module's inner patch copied into a patch on a machine without this package gets a broken `mc.pass~` box.
- `Abl.FxColors` lives in `examples/`, not `patchers/`, but every module loads it. It reads theme colours with `themecolor` and applies them to all objects of a class with `universal 1`. It also swaps some colours when the module is switched off, so the panel looks dimmed.
- Modules are also snippets (toolbar > Snippets > ABL Effect Modules). As bpatchers they are 169 px wide and either 84 or 124 px tall. The routing utilities are narrower: 109 or 129 px.
- `devices/Abl.Droner.amxd` shows modules inside a Max for Live device. It does not appear to freeze them, so expect to need the package installed wherever the device runs.

### Reference instances (for orientation, not authority)

- **Sources and outputs:** `Abl.Input~`, `Abl.Output~`
- **Mixing and routing:** `Abl.Mix~`, `Abl.Utility~`, `Abl.Fade~`, `Abl.Switch~`, `Abl.Matrix~`, `Abl.Remote~`
- **Modulators:** `Abl.LFO~`, `Abl.EnvFollower~`, `Abl.ModScaler~`
- **Reverbs:** `Abl.PlateReverb~`, `Abl.DarkHall~`, `Abl.PrismReverb~`, `Abl.QuartzReverb~`, `Abl.ShimmerReverb~`, `Abl.TidesReverb~`
- **Walkthrough patches:** `examples/Abl.Interface.maxpat`, `Abl.Presets.maxpat`, `Abl.Modulators.maxpat`, `Abl.ObjectBox.maxpat`, `Abl.MaxForLive.maxpat`

---

## AudioMix (two-cord stereo channel-strip blocks)

**One-line:** Manuel Poletti's 14 mixing-console blocks from 2017 (Max 7.3). Each is a bpatcher abstraction that you stack top to bottom into a channel strip, like a small DAW mixer. It is built on `live.*` controls and the pattr system.

### Stereo is two cords, and every block passes audio through

Every block has an **L inlet 0, an R inlet 1, and a messages inlet 2**. It has an **L outlet 0, an R outlet 1, and a dumpout outlet 2**. There is no MC. The two crossfaders differ: `AudioXfaderIn` takes two stereo pairs, and `AudioXfaderOut` outputs two.

Every block passes its input through, so blocks chain in one column:

- **Sources add their sound to what arrives:** `AudioInput`, `AudioPlayer`, `AudioReceive`.
- **Sinks pass the input on unchanged:** `AudioOutput`, `AudioRecord`, `AudioSend`.
- **Processors process it:** `AudioMix`, `AudioEQ`, the effect containers.

So Player → Mix → Send → Output is one straight column of cords. The "Audio Track …" snippets are pre-wired strips of this kind.

### Messages, attributes and names

- **Local control:** `<param> <value>` into inlet 2 (`gain -6`, `pan 10`, `active 0`, `solo 1`). `get<param>` (`getgain`), `getstate` and `getattributes` report from outlet 2. The params are the lower-case scripting names of the `live.*` controls, exposed with `autopattr`.
- **Initial values as box attributes:** `AudioSend MySend @bus 3 @gain -3` (the typed arguments of a bpatcher).
- **Remote control by name.** The first argument (or the name field on bigger blocks) sets a receive name. For `AudioMix` it becomes `<name>-mix`, for `AudioEQ` `<name>-eq`. For the effect containers and the small blocks it is the name itself. So `; MyTrack1-mix gain -12` works from anywhere.
- **Control every instance at once:** each block also listens on its own class name, as in `; AudioMix active 1`.
- **Q button:** turns the current settings into `; <name> <param> <value>` lines in a `qlist` that you can paste into a message box. It needs a name first.
- **Solo groups:** `AudioMix @type <symbol>` (default `generic`) limits solo to strips of the same type, so soloing an input track does not mute effect returns. The name is free text. `examples/AudioMix.Desk.maxpat` has a typo, `@type geneic`, which silently makes a separate group.
- **Buses:** `AudioSend` / `AudioReceive` pick a letter A–Z. The actual `send~` / `receive~` names are `AudioMix-<letter>-L~` and `AudioMix-<letter>-R~`, which are global, so every patch shares them. `AudioSend2` / `AudioReceive2` take a typed bus name instead.
- **Saving state:** every parameter has `parameter_enable`, and the blocks and template turn on autosave of snapshots. So Snapshots and `pattrstorage` capture a whole desk, including loaded files, plug-ins and devices.

### Where it stands in Max 9

It still loads and works. The template (`templates/AudioMix Template.maxpat`) is just a patcher with a 10 px grid. For new work, prefer MC-based pieces:

- `live.gain~` / `mc.live.gain~` for levels
- `playlist~` / `mc.playlist~` instead of the AIFF/WAVE-only `sfplay~` player
- `mcs.vst~` / `mcs.amxd~` for plug-ins
- the ABL Effect Modules for a whole rack

The name fields are `textedit` boxes, which is the object Claude2Max advises against for set-once names. Use the first box argument instead.

---

## MC Movement Studies (MC + JSUI studies after The Nature of Code)

**One-line:** Dillon Bastan's 2018 studies for Cycling '74. Each study is a patch in its own folder under `patchers/` (attraction, magnetism, cellularautomata, particlegrains, wavetable, simplevox, dynamicpoly, geneural). A JSUI or `js` physics simulation drives banks of MC oscillators, delays or grains. The reusable parts are the `db.mc.*` abstractions in `patchers/shared/`.

### The argument convention: channel count, then busy map name

Almost every `db.mc.*` abstraction takes `<#channels> <busymap name>` as its first two arguments (for instance `db.mc.oneshotramp~ 8 wavefm`, `ltomc 32 sound 20`). Inside, the channel count goes to `@chans` on the first MC object, and the name goes to `@bzname` on every MC object in the chain, and to `mc.voiceallocator~ @name`.

A **busy map** is `mc.voiceallocator~`'s record of which channels are in use. The refpage: a named busy map "is accessible to all MC objects (in any patcher) that refer to it using the `busymapname` attribute" (`bzname` is its alias). MC objects that share the name skip the silent channels. So passing the same name to several abstractions makes them one voice system. A study can run two systems side by side under two names: `db.mc.attraction` uses `forces` for its LFOs and `sound` for its oscillators.

The name is global. Two open patches that use `sound` share one busy map.

### Which files are reusable

- `patchers/shared/` — the general abstractions (`db.mc.clicklessdelay~`, `db.mc.oneshotphasor~`, `db.wavetable2polybuffer`, ...).
- Per-study folders — helpers tied to one study: `gui.main` (four different patchers with the same name), `ltomc` (three identical copies), `mctomatrix`, `dp_osc`, `poly_*`.
- `javascript/` — the physics classes (`PVector.js`, `Particle.js`, `ParticleSystem.js`, `Magnet2D.js`, ...), loaded with classic `js` `include()`.

Two shared abstractions (`db.mc.stereodelay~`, `db.mc.filterdelaystereo~`) call `ltomc`, which is not in `shared/`. They work only because a copy sits elsewhere in the package.

---

## JitLygia (LYGIA shader library for Jitter)

**One-line:** Rob Ramirez's package that installs Patricio Gonzalez Vivo's LYGIA GLSL library (655 `.glsl` files under `lygia/`) so any JXS shader can pull functions from it with `#include`. It adds no Max objects. The work happens in `jit.gl.slab` (or any object that loads a JXS file). Requires Max 9.1.

### The mechanism: `#include` inside a JXS program

Max 9.1 added a `#include` directive to JXS shader code. The `jit.gl.shader` refpage: the includer "supports both Max path prefixes, and relative paths", and a relative path is resolved against the loading shader file, or against the patch for an embedded shader. JitLygia's shaders use the `Package:` prefix:

```glsl
#include "Package:/JitLygia/lygia/generative/fbm.glsl"
```

LYGIA's own files include their dependencies with relative paths (`#include "../sampler.glsl"`), so one line pulls in everything that function needs.

### Configure with `#define` before `#include`

LYGIA functions are configured by macros, each wrapped in `#ifndef`. A `#define` has to come **before** the `#include`; after it, the default is already set and your line does nothing. For instance, from `code/jxs/filter_gaussianBlur2D.jxs`:

```glsl
#define GAUSSIANBLUR_2D
#include "Package:/JitLygia/lygia/sample/clamp2edge.glsl"
#define GAUSSIANBLUR_SAMPLER_FNC(TEX, UV) sampleClamp2edge(TEX, UV)
#include "Package:/JitLygia/lygia/filter/gaussianBlur.glsl"
```

Each `.glsl` file opens with a comment block listing its `use:` signature and its `options:` macros. Read that block before calling the function.

### Textures must be non-rectangle

LYGIA samples with `sampler2D` and `texture()` in 0–1 coordinates. Jitter textures are rectangle textures by default. The `jit.gl.slab` refpage: with `rectangle` on (default 1) a texture "must be referenced using sampler2DRect"; with it off, the texture is "upsampled to the nearest power of two" and read with `sampler2D`. So the launch patch puts a plain `jit.gl.slab @rectangle 0` between the movie and the LYGIA shader, labelled "examples require non-rectangular input".

### The shipped `.jxs` files are example ports, not effects

The 50 files in `code/jxs/` are ports of LYGIA's `EXAMPLES.md` demos. They draw split-screen comparisons, number overlays (`digits`) and hardcoded settings, and expose almost no `<param>`s. Use them as templates. The uniform wiring they share:

| uniform | JXS declaration | meaning |
|---|---|---|
| `u_resolution` | `<param ... type="vec2" state="TEXDIM0" />` | size of input texture 0 |
| `u_time` | `<param ... type="float" state="TIME" />` | seconds since the shader compiled |
| `u_tex0` | `<param ... type="int" default="0" />` | input texture unit 0 |
| `u_mouse` | `<param ... type="vec2" default="..." />` | set from the patch, only in two files |

Each also needs a `<bind param="..." program="fp" />` and a matching `uniform` line in the fragment program.

### Function families a student will reach for

Folder names under `lygia/`, with example functions seen in the shipped ports:

- `generative/` — noise and randomness: `snoise`, `pnoise`, `cnoise`, `gnoise`, `fbm`, `curl`, `voronoi`, `voronoise`, `worley`, `wavelet`, `random`.
- `filter/` — blurs and image filters: `gaussianBlur`, `boxBlur`, `bilateral`, `kuwahara`, `median`, `sharpen`, `radialBlur`, `noiseBlur`, `edge` (`edgePrewitt`, `edgeSobel`).
- `sdf/` — signed distance shapes, 2D (`circleSDF`, `rectSDF`, `starSDF`, `heartSDF`, `polySDF`, ...) and 3D (`sphereSDF`, `boxSDF`, `torusSDF`, ...), with `op*` files to combine them. Draw a 2D SDF with `draw/fill.glsl` (`fill(sdf, size)`) or `draw/stroke.glsl`.
- `color/` — `blend`, `palette`, `dither`, `tonemap`, `levels`, `lut`, `brightnessContrast`, `hueShift`, `mixOklab`, `mixRYB`, `mixSpectral`, colour-space conversions in `color/space/`.
- `space/` — coordinate tools: `ratio`, `center`, `rotate`, `scale`, `kaleidoscope`, `cart2polar`, tilings (`sqTile`, `hexTile`, `brickTile`, ...).
- `distort/` — `barrel`, `pincushion`, `chromaAB`, `displace`, `grain`.
- `sample/` — texture reading: `clamp2edge`, `bicubic`, `smooth`, `fxaa`, `dither`, `dof`, `opticalFlow`.
- `morphological/` — `dilation`, `erosion`, `jumpFlood`, `marchingSquares`.
- `simulate/` — `grayscott`, `ripple`, `simpleAndFastFluid` (these need feedback between frames).
- `lighting/` — PBR materials and raymarching (`pbr`, `raymarch`, `material/`).
- `animation/` — `easing`.

### License

LYGIA is under the Prosperity Public License 3.0.0 (`LICENSE.md`): free for noncommercial use, with a 30-day trial for commercial use.

---

## Gen CV Tools (Spektro Audio)

**One-line:** Three `gen~` patches (clock divider/modifier, 8-bit shift register, complex LFO) that output control signals for modular synths or for other parts of a patch. There are no abstractions; each tool is an embedded `gen~` in a demo patcher and in a matching `.maxsnip` snippet (the gen~ code in both is identical).

### Signal conventions

- **A clock is a phasor, not a bang.** `CDM` takes a 0–1 ramp (the demo uses `phasor~ 8`) and derives new clocks from its phase. Feed it `phasor~`, not `metro`.
- **Gates are 0 or 1 signals.** `CDM` and each shift-register bit output 0/1; the shift register's DAC output and every gate stay in 0–1. The LFO outputs −1 to 1.
- **Controls are `gen~` params set by message:** `Div`, `Shift`, `PW`, `Probability`, `Active` (CDM); `Frequency`, `Probability`, `Loop` (shift register, whose signal inlet is an on/off gate); `Frequency`, `Shape`, `Fold`, `Degrade` (LFO). Percent-style params run 0–100.
- **Driving hardware** needs a DC-coupled audio interface (README). How 0–1 maps to volts depends on the interface; the package does not scale for you.
