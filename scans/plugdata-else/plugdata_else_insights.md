# plugdata: ELSE, cyclone and the Live Electronics Tutorial — Insights

Notes on three things that ship inside plugdata 0.9.3, read from the copies in
`~/Documents/plugdata` on 2026-10-02. Written for a reader who knows Max and
has never used ELSE.

- **ELSE** is a library of about 550 objects for Pure Data by Alexandre Torres
  Porres. The copy read here calls itself "1.0-0 Release Candidate 13" in its
  changelog.
- **cyclone** is a set of Pd objects cloned from Max/MSP, now maintained by the
  same author. Its overview says it has 194 objects and follows Max up to
  Max 7; nothing from Max 8 has been ported.
- **The Live Electronics Tutorial** is a course of 581 patches, by the same
  author, that teaches synthesis and processing using ELSE objects.

**Where these notes come from.** Every entry names the file it was read from.
Nothing here is from memory, and nothing was tested in Pd or in Max.
`plugdata_else_crawl_state.json` says which files were read and how deeply.
Short forms used below:

| Short form | Means |
|---|---|
| `E:name` | `Documentation/9.else/name-help.pd` |
| `C:name` | `Documentation/10.cyclone/name-help.pd` |
| `T:path` | a patch under `Documentation/12.live-electronics-tutorial/` |
| `X:name` | a file under `Extra/else/` |

**How deep the reading went.** For all 551 ELSE help files the top-level text
was read: the description, arguments, flags and inlet/outlet lines. For 36 of
them the text inside the example subpatches was read too. For cyclone, 14 help
files were read in full and the rest only through a keyword filter that pulled
out lines about Max, differences and alternatives. The tutorial was read in
full by reading sub-agents; the long notes are in
`plugdata_else_tutorial_notes.md` and Part 3 below is the digest.

**Object names are spelled as the help files spell them.** In Pd an object box
is written in square brackets, so `[adsr~ 10 100 0.5 200]` is one box.

**The Max side.** Where an entry says what Max has, that was checked against
Max 9.1.5's object registry and refpages on the same day. The per-item checks
are in `plugdata_else_max_gap_candidates.json`.

---

## Part 1 — ELSE

### 1.1 What ELSE is trying to be

ELSE is one author's answer to "what should a modern Pd have in the box". It
fills three kinds of hole. It supplies the high-level objects that plain Pd
lacks (envelopes, filters by type, players, reverbs, clocks, MIDI helpers,
GUI controls). It gives each low-level Pd object a more capable twin. And it
brings in ideas from other systems: many generators are credited to
SuperCollider UGens in their help files (`E:decay~`, `E:dust~`, `E:lorenz~`),
`blip~` to a Csound opcode (`E:blip~`), `plaits~` to a Eurorack module
(`E:plaits~`).

It is deliberately not a Max clone. The changelog says of one object that the
author wants it "more Pd like and not a silly clone" of Max's `pak`
(`X:CHANGELOG.txt`). The same author keeps cyclone for people who do want
clones, and cyclone's help files point to the ELSE object he considers the
better design (see Part 2).

### 1.2 How it is organized

The library's own index patch sorts every object into these groups
(`X:All_else_objects.pd`). The names are the index's own.

| Group | Examples |
|---|---|
| Oscillators | `sine~ cosine~ saw~ saw2~ tri~ square~ vsaw~ pulse~ impulse~ parabolic~ gaussian~ wavetable~ wt2d~ oscbank~ blip~ pm~ fm~ damp.osc~` and the `bl.` band-limited set |
| Noise / chaotic / stochastic | `white~ pink~ brown~ gray~ velvet~ perlin~ lfnoise~ stepnoise~ rampnoise~ dust~ gendyn~` and the chaos maps (`lorenz~ henon~ logistic~` …) |
| Synthesizers | `plaits~ sfz~ sfont~ synth~ pm2~ pm4~ pm6~` |
| Physical modelling, granular synth | `pluck~`, `grain.synth~` |
| Analog circuitry emulation | `circuit~` |
| Control: triggers | `above~ chance~ dust~ gatehold~ gaterelease~ gatedelay~ gate2imp~ pulsecount~ pulsediv~ sh~ schmitt~ status~ timed.gate~ toggleff~ trig.delay~ match~` and control twins |
| Control: clocks | `tempo tempo~ metronome metronome~ clock speed polymetro polymetro~` |
| Control: control-rate LFO | `lfo impulse pulse pimp phasor` |
| Control: ramps and smoothing | `glide~ lag~ smooth~ slew~` (each with a `2` version and a control twin), `ramp~ function~ susloop~` |
| Control: envelopes | `adsr~ asr~ decay~ envgen~ envelope~` |
| Control: sequencers | `sequencer sequencer~ impseq~ phaseseq~ pattern score score2 euclid rec rec2 list.seq` |
| Control: random / stochastic | `rand.i rand.f rand.u rand.list rand.hist rand.dist chance markov drunkard brown histogram` |
| Control: fader / panning / routing | `xfade~ xselect~ xgate~ xselect2~ xgate2~ pan2~ pan4~ pan~ spread~ rotate~ balance~ mtx~ fader~ autofade~` and `.mc~` versions |
| DSP: filters | `lowpass~ highpass~ bandpass~ bandstop~ resonant~ resonator~ eq~ lowshelf~ highshelf~ allpass.2nd~ svfilter~ lop2~ lop.bw~ hip.bw~ brickwall~ crossover~ biquads~ bpbank~ resonbank~ mov.avg~ comb.filt~` |
| DSP: delays | `del~ ffdelay~ fbdelay~ revdelay~ filterdelay~` |
| DSP: reverberation | `allpass.rev~ comb.rev~ echo.rev~ mono.rev~ stereo.rev~ free.rev~ giga.rev~ plate.rev~ fdn.rev~` |
| DSP: dynamics | `compress~ duck~ expand~ noisegate~ norm~` |
| DSP: assorted | `chorus~ flanger~ phaser~ tremolo~ rm~ vibrato~ crusher~ drive~ shaper~ power~ vocoder~ freq.shift~ pitch.shift~ conv~ morph~ freeze~ pvoc.freeze~ downsample~` |
| Buffer / sampling / granulation | `sample~ player~ play.file~ tabplayer~ tabwriter~ tabreader~ sfload sfinfo rec.file~ batch.rec~ batch.write~ gran.player~ pvoc.player~ pvoc.live~ grain.live~ grain.sampler~` |
| Table | `tabgen tabreader tabreader~ buffer` |
| FFT | `hann~ bin.shift~` |
| Analysis | `rms~ peak~ mov.rms~ vu~ zerocross~ changed~ detect~ range~ median~ tap beat~` |
| Audio multichannel tools | `nchs~ pick~ get~ sum~ merge~ unmerge~ slice~ repeat~ lace~ delace~ sigs~ select~` |
| MIDI | `note.in/out ctl.in/out bend.in/out pgm.in/out touch.in/out ptouch.in/out sysrt.in/out midi.in/out mono voices suspedal panic midi midi.learn midi.clock noteinfo` |
| Tuning / notes | `scala retune autotune autotune2 eqdiv scales midi2freq freq2midi note2midi midi2note cents2ratio frac2cents notedur2ratio makenote2` |
| OSC | `osc.route osc.format osc.parse osc.send osc.receive` |
| List management | `slice group iterate merge unmerge pick reverse rotate sort scramble stream sum lace delace insert delete replace remove equal order interpolate morph` |
| Message management | `format unite separate changed hot limit initmess message pack2 pick spread router routeall routetype route2 selector stack store default nmess pipe2 swap2` |
| Math | functions (`add count ceil floor rint quantizer fold wrap2 op op~ median avg lcm gcd factor`), conversions (`rescale db2lin lin2db ms2samps hz2rad car2pol bpm hex2dec` …), constants (`sr~ nyquist~ pi e`) |
| GUI | `knob button keyboard function slider2d circle pad range.hsl multi.vsl mtx.ctl drum.seq popmenu messbox note display numbox~ pic scope~ scope3d~ graph~ spectrograph~ meter~ gain~ out~ biplot zbiplot bicoeff` |
| Patch / subpatch management | `args click properties loadbanger dollsym sender receiver retrieve presets dispatch var meter canvas.* fontsize abs.pd~ sendmidi nop~ send2~` |
| Mouse and keyboard | `mouse canvas.mouse keycode keymap keypress` |
| File, time, scripting | `dir`, `chrono datetime`, `lua` |

A second set, MERDA, is built on top of these (1.5).

### 1.3 Conventions that hold across the library

These are what make ELSE feel like one design. Several are worth copying into
Max abstractions.

**Flags before arguments.** Options are typed as `-name value` ahead of the
positional arguments: `[tempo~ -on 120 100]`, `[adsr~ -lin 10 100 0.5 200]`,
`[sh~ -tr]`, `[fbdelay~ -samps -gain 1000 0.9]`. Almost every flag has a
message of the same name without the dash, and the help file lists them in
one line (`E:envgen~`, `E:knob`, `E:tabplayer~`). `scope3d~`'s help says it
outright: all messages are also flags (`E:scope3d~`). This is the same idea
as a Max `@attribute`, with one difference: a flag is only read when the box
is made, and the live control is the message.

**A list of values sets the size.** Banks take their size from the length of
the lists they are given, and then "you must not use regular arguments"
(`E:oscbank~`). `[selector 4]`, `[xselect~ 4]`, `[hot 3]` take a count.

**Every signal object has a control twin without the tilde.** `slew~`/`slew`,
`glide~`/`glide`, `smooth~`/`smooth`, `above~`/`above`, `schmitt~`/`schmitt`,
`status~`/`status`, `timed.gate~`/`timed.gate`, `gatehold~`/`gatehold`,
`drunkard~`/`drunkard`, `brown~`/`brown`, `chance~`/`chance`,
`pulse~`/`pulse`, `impulse~`/`impulse`, `rampnoise~`/`rampnoise`. The control
twins take a `-rate` in ms (default 5 for the smoothers) and need no audio
running (`E:slew`, `E:lfo`, `E:stepnoise`).

**Control generators speak MIDI range.** The control-rate `lfo`, `phasor`,
`pimp`, `lfnoise`, `stepnoise`, `rampnoise` and `brown` output 0 to 127 by
default, `rescale` expects 0 to 127 in, `knob` runs 0 to 127, and a float
gate into `adsr~` is read as a velocity (127 becomes 1) (`E:lfo`, `E:rescale`,
`E:knob`, `E:adsr~`). Signal versions use -1 to 1 or 0 to 1.

**A `2` on the name means a second parameter of the same kind**, most often
separate rising and falling values: `glide2~`, `lag2~`, `smooth2~`, `slew2~`,
`autofade2~`. Elsewhere it marks a variant: `saw2~` (a different sawtooth
shape), `xselect2~` (position as a signal with spread), `score2` (a different
notation), `impulse2~` (two-sided impulses). The rule is shown by use, never
stated (`T:Part.04-Control/17-Envelopes/2.Classic.Types/03.ASR/3.[glide2].[lag2~].[smooth2~].[autofade2~].pd`).

**Prefixes and suffixes carry meaning.**

| Mark | Meaning | Examples |
|---|---|---|
| `bl.` | band-limited version, same inlets | `bl.saw~`, `bl.tri~`, `bl.osc~` |
| `.mc~` | takes or gives one multichannel cord where the plain object has N inlets or outlets | `xfade.mc~`, `pan.mc~`, `mtx.mc~`, `out.mc~` |
| `.m~` / `.m` | a MERDA module | `vco.m~`, `presets.m` |
| `.rev~` | a reverberation unit | `plate.rev~`, `comb.rev~` |
| `.bw~` | Butterworth | `lop.bw~`, `hip.bw~` |
| `.in` / `.out` | MIDI parser / formatter | `note.in`, `bend.out` |
| `rand.` | random generators | `rand.i`, `rand.hist` |
| `canvas.` | reports about the patch window | `canvas.edit`, `canvas.vis` |
| `osc.` | Open Sound Control | `osc.route`, `osc.send` |
| `x2y` | a converter, usually with a `~` twin | `db2lin`, `ms2samps`, `hz2rad`, `car2pol` |
| `x…~` | crossfading version of a router | `xselect~`, `xgate~`, `xfade~` |

**What "trigger" means.** A trigger is a change from zero to non-zero. An
*impulse* is one non-zero sample; a *gate* stays non-zero while on. Most
trigger inlets accept either, and also a bang or float at control rate
(`E:adsr~`, `E:tabwriter~`, `T:Part.04-Control/14-Trigger-LFO-LFNoise/1.Impulse&Gate.pd`).
Detector objects answer with impulses on separate outlets, one outlet per
kind of event (`E:status~`, `E:zerocross~`, `E:above~`).

**One inlet layout for every oscillator.** Frequency, then sync, then phase
offset. Negative frequencies are accepted. `-midi` makes the frequency inlet
take MIDI pitch, `-soft` switches sync to soft sync (`E:sine~`, `E:saw~`,
`E:square~`). Pulse-type oscillators put width second.

**Multichannel is built in, not bolted on.** Pd 0.54 lets one cord carry many
channels. Most ELSE signal objects say "has multichannel support": they
process each channel of the input, and their secondary inlets either carry
one value for all channels or one per channel (`E:adsr~`). Generators take
`-mc <list>` to make one channel per value, and noise sources `-ch <n>`
(`E:sine~`, `E:white~`). `op~`'s rule for mismatched widths is that the
narrower input wraps around (`E:op~`).

**Resonance and feedback in three units.** Filters take resonance as Q,
bandwidth in octaves or t60, the time in ms for the ringing to fall 60 dB;
messages `q`, `bw`, `t60` switch (`E:lowpass~`, `E:resonant~`). Delay-based
objects take feedback as a t60 time by default and as a coefficient with
`-gain` (`E:fbdelay~`, `E:allpass.rev~`, `E:comb.filt~`).

**Time is in ms, with `-samps` to switch to samples** (`E:fbdelay~`,
`E:ffdelay~`, `E:envgen~`, `E:bpm`).

**Normalized positions.** Table readers take a 0 to 1 phase, not a sample
index, unless given `-index` (`E:tabreader~`). Players take `range <0-1>
<0-1>` (`E:player~`). Panners that an audio signal might drive run -1 to 1
(`E:pan2~`, `E:balance~`, `E:xfade~`); the N-speaker panner takes an azimuth
from 0 to 1 that wraps (`E:pan~`).

**Indexing.** List positions count from 1, 0 means "none", and negative
values count from the end (`E:delete`, `E:replace`, `E:pick`). Channels count
from 1 (`E:get~`, `E:pick~`). Sequence positions count from 1
(`E:sequencer`). Presets, voices and `scramble`'s index outlet count from 0
(`E:presets`, `E:voices`, `E:scramble`).

**Seeds.** Every random object gets a fresh seed each time the patch loads.
`-seed <n>` or a `seed <n>` message fixes it; a bare `seed` asks for a fresh
one. Two objects with the same seed give the same sequence (`E:markov`,
`E:white~`).

**Housekeeping messages.** Filters take `bypass` and `clear` ("clears
filter's memory if you blow it up") (`E:lowpass~`). Delays take `clear` and
often `freeze` (`E:ffdelay~`, `E:filterdelay~`).

**A status outlet on things that start and stop.** Envelopes output 1 while
sounding and 0 when done, so a voice can switch its own DSP off
(`E:adsr~`, `E:envgen~`). Players and sequencers bang when they finish.

**GUI objects share one option set.** `-send` and `-receive` names (the
inlet or outlet disappears when one is set), `-savestate`, colours as RGB
lists, `-dim` or `-size`, and a properties panel on right-click (`E:knob`,
`E:keyboard`, `E:function`, `E:popmenu`).

**Help files name the source.** Abstractions say what they are built on
("an abstraction based on `[sfload]` and `[tabplayer~]`"), so the reader can
tell a compiled object from a patch (`E:player~`, `E:presets`, `E:norm~`).

### 1.4 The object families

Each paragraph names the notable members and what sets them apart.

**Oscillators.** `sine~`, `cosine~`, `saw~`, `saw2~`, `tri~`, `square~`,
`vsaw~` (one width control from sawtooth through triangle), `pulse~` (a 0/1
gate wave), `impulse~` / `imp~` (one sample per period), `impulse2~`,
`parabolic~`, `gaussian~`. These are the exact shapes and they alias. The
`bl.` set is the band-limited one; the help files say to use the exact shape
"mostly if you need a perfect sawtooth, which is usually the case when you
want a LFO" and the `bl.` version "for proper synthesis" (`E:bl.saw~`).
`bl.osc~` builds band-limited tables from a chosen number of partials.
`blip~` sums cosines in closed form. `wavetable~` (`wt~`) reads any table
with five interpolation choices and scans frames; `wt2d~` scans a grid.
`oscbank~` is a list-driven additive bank. `pm~` and `fm~` are two-oscillator
units, `fbsine~` a sine with feedback, `xmod~` two sines cross-modulating.
`oscnoise~` loops a table of noise. `damp.osc~` is a decaying sine.
`pimp~` is a phasor that also gives an impulse at each wrap (`E:pimp~`).

**Noise and chaos.** `white~` (with a `-clip` mode that outputs only -1 or
1), `pink~` (octave count settable), `brown~` (bounded random walk with a
step size), `gray~`, `velvet~`, `dust~` and `dust2~` (sparse random
impulses by density), `perlin~`, and three low-rate noises: `lfnoise~`,
`stepnoise~` (held), `rampnoise~` (interpolated). A dozen chaotic maps each
give their difference equation in the help file and run at a rate in Hz:
`lorenz~`, `henon~`, `logistic~`, `gbman~`, `cusp~`, `quad~`, `standard~`,
`ikeda~`, `latoocarfian~`, `lincong~`, `crackle~`, `fbsine2~`. `gendyn~` is
Xenakis-style stochastic synthesis.

**Synths in a box.** `plaits~` (24 engines), `pm2~` / `pm4~` / `pm6~`
(phase-modulation synths with a full modulation matrix), `pluck~`
(Karplus-Strong), `sfont~` (SoundFont), `sfz~` (SFZ, retunable), `circuit~`
(analog circuit simulation from a typed netlist with named transistor, diode,
op-amp and tube models), `synth~` (loads a voice abstraction and handles
mono or poly note logic; the abstraction can be swapped while running)
(`E:plaits~`, `E:pm6~`, `E:circuit~`, `E:synth~`).

**Triggers and gates.** Signal-rate, sample-accurate tools for event logic.
`timed.gate~` (impulse to fixed-length gate), `gatehold~` (keep a gate open
after it closes), `gaterelease~` (close it a set time after it opened),
`gatedelay~` (delay only the opening), `trig.delay~` (restarts on a new
trigger) and `trig.delay2~` (ignores new triggers), `toggleff~`,
`gate2imp~`, `trighold~`, `sh~` (sample and hold with a gate mode and a
trigger mode), `pulsecount~`, `pulsediv~`, `chance~` (weighted routing of an
impulse), `float2imp~` (a bang to a one-sample impulse placed inside the
block). Detectors: `status~`, `changed~`, `changed2~`, `zerocross~`,
`above~`, `schmitt~`, `match~`, `detect~`. Back to control: `trig2bang~`.

**Clocks and tempo.** `tempo` and `tempo~` (BPM, ms or Hz, with swing as
random deviation and a multiplier), `clock` (a named main clock and synced
followers with fractional ratios), `metronome` (time signatures, bar and
beat counts, beat phase), `metronome~` (click sounds), `polymetro` and
`polymetro~`, `speed` (tempo ramps over beats), `tap`, `bpm`, `midi.clock`,
`pimpmul~` (multiply a phase ramp). `metronome`'s time signatures go well
past the usual: additive ones, grouped ones, and denominators that are not
powers of two, including fractions, to express tuplets as the beat
(`E:metronome`, `E:clock`).

**Control-rate oscillators.** `lfo` (sine, triangle, sawtooth, variable
sawtooth, square), `phasor`, `pimp`, `impulse`, `pulse`, `lfnoise`,
`stepnoise`, `rampnoise`, `randpulse`. They run with audio off. `impulse`'s
help notes that, unlike a metronome, a speed change takes effect at once
(`E:impulse`).

**Lines and smoothers.** Four behaviours, four names: `glide~` (fixed time;
linear or a power curve with `-exp`), `lag~` (one-pole filter; time to settle
within 0.01%; rising and falling curves differ), `smooth~` (fixed time with a
curve factor shared with the envelopes), `slew~` (fixed speed in units per
second; 0 stops, negative turns the limit off). Each has a `2` version and a
control twin. `ramp~` is a resettable counter for reading buffers, `susloop~`
a read index with a sustain loop, `f2s~` / `float2sig~` a float-to-signal
converter with a ramp time and list-to-multichannel conversion.

**Envelopes.** `adsr~` and `asr~` (gate value sets the peak; curve, linear
or lag shape; retrigger inlet; immediate-release flag; status outlet),
`decay~` (one-pole exponential decay, time to -60 dB), `envgen~` (general
breakpoint envelope, see Part 3), `envelope~` (six window shapes read by a
phase: sin, hann, tri, vsaw, gauss, trapezoid), `function~` (a breakpoint
function read by a phase), `function` (the drawing GUI that feeds both).
By default a gate-off that arrives before the sustain point still lets the
attack and decay finish, so an impulse gives a complete one-shot; `-rel`
makes the release immediate (`E:adsr~`).

**Sequencers.** `sequencer` (typed list with chords, rests, ties, barlines
and note names), `list.seq` (plain list stepping), `sequencer~` and
`impseq~` (signal-rate), `phaseseq~` (impulses at chosen phases of a ramp),
`pattern` (rhythm as fractions of a whole note), `score` and `score2` (text
scores), `euclid`, `drum.seq` (a click grid), `rec` (multitrack message
recorder), `rec2`, `midi` (MIDI file player and recorder that also reads and
writes text), `store` and `stack` (message queues).

**Random and stochastic.** `rand.i`, `rand.f` (range, optional list of N
values), `rand.u` (no repeats until all are used), `rand.list`, `rand.hist`
(weights, with an "unrepeat" mode), `rand.dist` (an array as the probability
curve), `chance` (weighted outlets; the weights are counts, not percent),
`markov` (any order; numbers, symbols or lists; can save with the patch),
`drunkard`, `brown`, `histogram`.

**Filters.** One object per type with signal-rate parameters: `lowpass~`,
`highpass~`, `bandpass~` (peak fixed at 0 dB), `resonant~` (gain grows with
resonance), `resonator~` (resonance as t60, with the excitation in the middle
inlet, like an instrument), `resonator2~` (a single complex pole, for
pinging only), `bandstop~`, `eq~`, `lowshelf~`, `highshelf~`,
`allpass.2nd~`, `allpass.filt~` (stacked allpasses up to order 64),
`svfilter~` (four outputs at once), `lop2~` (one pole, one zero),
`lop.bw~` / `hip.bw~` (Butterworth of order 2 to 100), `brickwall~`,
`crossover~`, `mov.avg~`, `comb.filt~`. Banks: `bpbank~`, `resonbank~`,
`resonbank2~`. Coefficient tools: `bicoeff` (drag a response curve),
`bicoeff2`, `biquads~` (up to 50 sections), `biplot`, `zbiplot`,
`coeff2pz`, `pz2coeff`.

**Delays.** `del~ in` / `del~ out` (a named line and its taps, with a dummy
outlet to force the order of computation), `ffdelay~` (one-box feedforward),
`fbdelay~` (one-box feedback, decay as t60), `revdelay~` (reverse),
`filterdelay~` (lowpass, soft clipper and DC filter in the loop),
`ping.pong~`.

**Reverbs.** Building blocks `allpass.rev~`, `comb.rev~`, `echo.rev~`
(feedforward early reflections) and `fdn.rev~` (feedback delay network with
settable lines). Finished units `mono.rev~`, `stereo.rev~`, `free.rev~`
(freeverb), `giga.rev~` (gigaverb), `plate.rev~` (Dattorro plate).

**Effects and dynamics.** `chorus~`, `flanger~`, `phaser~`, `tremolo~`,
`rm~`, `vibrato~`, `crusher~`, `drive~` (three clipping modes), `shaper~`
(table or Chebyshev weights), `power~`, `fold~`, `wrap2~`, `vocoder~`,
`freq.shift~` (both sidebands on two outlets), `pitch.shift~`, `conv~`
(partitioned convolution), `morph~`, `freeze~`, `pvoc.freeze~`. Dynamics:
`compress~`, `duck~`, `expand~`, `noisegate~`, `norm~`.

**Sampling.** `sfload` (loads AAC, AIF, CAF, FLAC, MP3, OGG, OPUS, WAV into
arrays, in a thread if asked, or from a web link), `sample~` (a buffer that
owns its arrays, multichannel, can save), `tabplayer~` (plays arrays with
speed, range, loop and crossfade; follows the file's sample rate),
`player~` (the two combined: one box that loads and plays), `play.file~`
(plays from disk or streams from a link), `tabwriter~` and `rec.file~`
(record), `batch.rec~` / `batch.write~` (render faster than real time),
`tabreader~` (0 to 1 phase read with a choice of interpolation, including Hermite with tension and bias), `tabgen`
(fill a table), `sfinfo`. Time and pitch: `gran.player~`, `pvoc.player~`,
`pvoc.live~`, `stretch.shift~`. Clouds: `grain.sampler~`, `grain.live~`,
`grain.synth~`.

**Mixing, panning, routing.** `xfade~`, `xselect~`, `xgate~` (crossfade
over a time), `xselect2~`, `xgate2~` (position as a signal, with spread),
`select~` (no fade), `pan2~`, `pan4~`, `pan~` (N speakers on a ring),
`spread~`, `rotate~`, `balance~`, `mtx~` with the `mtx.ctl` grid, `fader~`
(seven fade curves), `autofade~`, `gain~`, `level~`, `dbgain~`, `mix2~`,
`mix4~`, and the `out~` family that ends a patch.

**Multichannel tools.** `nchs~` (count), `pick~` (one channel), `get~`
(build a new cord from a list of channel numbers), `slice~`, `merge~`,
`unmerge~`, `lace~`, `delace~`, `repeat~`, `sum~`, `sigs~` (a cord from
typed values), `voices~` (MIDI notes to per-voice pitch and gate channels).

**MIDI.** Parsers and formatters that work on a raw byte stream or straight
from the device: `note.in` (with `-rel` and `-both` for release velocity),
`ctl.in`, `bend.in` (-1 to 1, or raw with `-raw`), `pgm.in` (0 to 127),
`touch.in`, `ptouch.in`, `sysrt.in`, `mpe.in`, `midi.in` ("cooked" messages
with a type symbol), and the matching `.out` set. Note logic: `mono` /
`mono~`, `voices`, `suspedal`, `panic`, `noteinfo`, `makenote2`. `midi`
plays and records MIDI files. `midi.learn` binds a controller and saves the
binding. `keyboard` is the on-screen keyboard; `keymap` plays notes from the
computer keys.

**Tuning.** `scala` (reads .scl files), `retune` (key N plays scale step N),
`autotune` and `autotune2` (snap to the nearest step), `eqdiv` (equal
division of any interval), `scales` (build scales from step lists),
`scale2freq`, `midi2freq` / `freq2midi` (with a settable A4), `note2midi` /
`midi2note` (names, with quarter tones), and converters among cents, ratios
and fraction symbols (`cents2ratio`, `frac2cents`, `cents2frac`, `frac2dec`,
`dec2frac`, `frac.add`, `frac.mul`). Fractions are first-class: many objects
accept `3/2` as a symbol (`E:clock`, `E:pattern`, `E:frac2dec`).

**Lists and messages.** One object per operation: `slice`, `group`,
`iterate`, `merge`, `unmerge`, `pick`, `reverse`, `rotate`, `sort`,
`scramble`, `stream`, `sum`, `lace`, `delace`, `insert`, `delete`, `replace`,
`remove`, `equal`, `order`. Routing: `route2` and `routeall` (keep the
matched element), `routetype`, `router`, `selector`, `spread` (several
thresholds at once), `dispatch` (list elements to named receives). Timing:
`limit`, `combine`, `pipe2`. Storage: `message`, `default`, `store`,
`stack`, `var`, `buffer`. Text: `format` (printf with one inlet per
variable), `unite`, `separate`, `any2symbol`, `symbol2any`, `changed`.

**Analysis.** `rms~`, `peak~`, `mov.rms~`, `vu~`, `maxpeak~`, `range~`,
`median~`, `zerocross~`, `detect~`, `tap`, `beat~` (tempo from audio).

**GUI.** `knob` (its many options are listed in its entry in the candidates file),
`button` (latch, toggle or bang), `keyboard`, `function`, `slider2d`,
`circle`, `pad`, `range.hsl`, `multi.vsl`, `mtx.ctl`, `drum.seq`, `popmenu`,
`messbox` (type a message while the patch is locked), `note` (a styled
comment that can be set by message), `display` (shows any message and passes
it on), `numbox~`, `pic`, `colors`, `openfile`. Scopes and meters: `scope~`,
`scope3d~`, `graph~`, `spectrograph~`, `meter~` to `meter8~`. Filter
graphics: `biplot`, `zbiplot`, `bicoeff`.

**Patch and abstraction tools.** `args` (read or rewrite an abstraction's
arguments), `click` and `properties` (make an abstraction's box respond to
a click), `loadbanger` / `lb` (load bangs in three phases), `initmess`,
`dollsym`, `sender`, `receiver` (reach a parent's instance number by depth),
`retrieve` (pull the current value from whatever sits on a receive name),
`presets`, the `canvas.*` reporters, `abs.pd~` (run a patch in a second
process), `nop~`, `send2~`.

**Network.** `osc.send`, `osc.receive`, `osc.route`, `osc.format`,
`osc.parse`; `pdlink` and `pdlink~` (see the candidates file).

### 1.5 MERDA: modules on top of ELSE

"Modular EuroRacks Dancing Along" is a set of abstractions that look like
synth modules: `vco.m~`, `vcf.m~`, `vca.m~`, `adsr.m~`, `lfo.m~`, `seq8.m~`,
effects (`chorus.m~`, `delay.m~`, `drive.m~`, `flanger.m~`, `phaser.m~`,
`plate.rev.m~`, `rm.m~`, `crusher.m~`), tools (`presets.m`, `sig.m~`,
`level.m~`) and extras (`brane.m~`, `gendyn.m~`, `plaits.m~`, `pluck.m~`,
`pm6.m~`, `sfont.m~`). Three conventions (`X:about.MERDA.pd`):

- **State saves itself.** Every module reloads the values it had when the
  patch was last saved. `presets.m`, placed last in the patch, saves and
  recalls presets for every module with nothing to connect
  (`X:presets.m-help.pd`).
- **Attenuverters.** A signal input's amount is set by a knob that is zero at
  the centre, scales 0 to 1 to the right and 0 to -1 (inverted) to the left.
  The modulation is added to the panel value.
- **Knob gestures.** Control-click starts MIDI learn, shift-control-click
  forgets, alt-click resets to the start value, and a selected knob accepts a
  typed number.

The overview calls the set experimental: some modules have no modulation
inputs yet and "work more kinda like pedal stompboxes".

### 1.6 What changed lately

The first 60 lines of the changelog (`X:CHANGELOG.txt`, release candidate
13) list breaking changes that show where the design is heading:

- `adsr~` / `asr~`: a gate-off before the sustain point no longer starts the
  release at once, so an impulse gives a full envelope; a new mode restores
  the old behaviour.
- `envgen~`: a list now only sets the envelope and no longer starts it; the
  maximum-sustain setting was removed in favour of the new `gaterelease~`.
- `envgen~` / `function~`: one `curve` message replaced several older ones.
- `oscbank~` takes partial ratios instead of frequencies, which made a second
  bank object unnecessary; the resonator banks were rebuilt the same way.
- `pack2`, `merge`, `unmerge`, `group`: options that imitated Max were
  removed to follow Pd's own list rules.
- `play.file~` and `sfload` gained the extra file formats and web links.
- `knob` gained `param`, `var`, `savestate`, read-only, typed entry and the
  named sends for activity, typing, tab and enter.

---

## Part 2 — cyclone

### 2.1 What it is

cyclone clones Max/MSP objects for Pd, so that Max patches can be rebuilt
with the same names and behaviour. Work began in 2002 against Max 4.0. From
version 0.3 it was brought up to Max 7, "and it also included several new
objects and fixes". Max 8 features have not been ported
(`Abstractions/cyclone/All_about_cyclone.pd`).

Two things a Max user should know before reading a cyclone patch:

- **Names that Pd already uses must be typed with the library prefix.**
  `cyclone/append`, `cyclone/clip`, `cyclone/clip~`, `cyclone/line~`,
  `cyclone/pow~`, `cyclone/snapshot~`, `cyclone/table`. Without the prefix
  the box is Pd's own object, which behaves differently: Pd's `pow~` has its
  inlets the other way round, and Pd's `snapshot~` is "very similar" but
  "not compatible" (`C:pow~`, `C:snapshot~`, `C:table`).
- **plugdata lacks two of cyclone's GUI objects.** The overview says plugdata
  users do not have cyclone's `scope~` or `comment` and should use ELSE's
  `scope~` and `note`.

### 2.2 Where a clone differs from the Max original

These are the places where a help file says so in words.

| Object | What the help file says | Source |
|---|---|---|
| `scale`, `scale~` | Both clones default to the modern exponential formula. In Max, `scale` defaults to the older "classic" formula and `scale~` to the modern one; cyclone calls that an inconsistency and calls classic mode buggy. Before Max 6.0.4 the modern exponent was inverted (2 behaved as 0.5). In classic mode the exponent must be above 1 and "a typical value" is 1.06. | `C:scale`, `C:scale~` |
| `seq` | Adds `pause` and `continue`. Clicking the box opens an editor showing lines of start time and raw MIDI bytes; the same format loads and saves as `.txt`. No `dump`. Always merges tracks on writing, where Max since 7.3.2 can write separate tracks. | `C:seq` |
| `mtr` | "Has not been fully updated to Max 7." Missing: `addevent`, `cleareventat`, `deleteeventat`, `playat`, `playatms`, the touch messages, `definelengthandstop`, dictionary and JSON output, and all transport-related attributes. It does have `@speed`, `@trackspeed`, `@loop`, `@embed`. | `C:mtr` |
| `coll` | Reading a file runs in a separate thread by default (`@threaded 1`). The help says this prevents "audio drop outs as in Max", a phrase that can be read either way. The price is that the next operation must wait for the bang from the third outlet. `@threaded 0` restores blocking reads, and the help shows that mode freezing the audio. | `C:coll` |
| `play~` | If the buffer has more channels than the object, Max mixes them; cyclone does not. | `C:play~` |
| `buffer~` | An abstraction "without the full functionalities or compatibility" of Max's. A multichannel buffer named `test` is stored as arrays `0-test`, `1-test`, … It keeps Max's `fill` (sin, cos, sinc) and `apply` (window shapes, gain, offset) messages. | `C:buffer~` |
| `train~` | Max's onset behaviour "just seems buggy so it was not ported"; the clone's onset delays the pulse by a fraction of a period. | `C:train~` |
| `average~` | Follows Max 5 and later: the output is a signal. Max 4 output control numbers. | `C:average~` |
| `sprintf` | Refuses to create an inlet for an invalid format type and prints an error; Max creates the inlet and complains later. Supports the space flag and `%a` / `%A`, which Max does not. Shares Max's trouble with symbols that contain spaces unless `symout` is used. | `C:sprintf` |
| `counter` | With no arguments the maximum is 2^24, the largest integer a Pd float holds exactly; in Max it is 2^31 - 1. | `C:counter` |
| `table` | The editor is a list of numbers, not a graph, so `@range`, `@signed` and `@notename` are absent. `getbits` / `setbits` are not implemented. | `C:table` |
| `pv` | In Max a `pv`, a `send` and a `value` cannot share a name; in cyclone they can, and the `pv` is a separate variable. The help calls the object redundant. | `C:pv` |
| `grab` | Can also grab from Pd GUI objects through their built-in receive names, "an extra feature for cyclone that is not available in Max". | `C:grab` |
| `bitsafe~` | Also turns denormal numbers into zero, which Max's does not. | `C:bitsafe~` |
| `wave~` | Seven interpolation modes; the extra one is Pd's own four-point method. "A bug from Max was fixed, where the 4-point interpolation modes did not wrap correctly." | `C:wave~` |
| `delay~` | No tempo-relative delay times, because cyclone has no transport. A signal-set delay time interpolates but adds one sample. | `C:delay~` |
| `bangbang` | The short name `b` is not available, because in Pd `b` is `bang`. | `C:bangbang` |
| `split`, `peak`, `trough` | Floats only; Pd has no integer type. | `C:split`, `C:peak` |
| `prob` | One feature is marked "not present in the original object in Max". The extracted text does not make clear which line it belongs to (it sits next to the line about an integer setting the current state). | `C:prob` |
| `pink~`, `tanh~`, `trunc~` | Not clones: the ELSE objects under cyclone's name, with multichannel support added. | `C:pink~`, `C:tanh~`, `C:trunc~` |
| `number~`, `comment`, `scope~` | Limited or absent in plugdata; ELSE's `numbox~`, `note`, `scope~` are suggested. | `C:number~`, overview |

Two of these are really facts about Max that a Max user can act on. They
were checked:

- **`scale` loads in classic mode.** Max 9.1.5's defaults registry gives
  `scale` a `classic` value of 1 and `scale~` a value of 0, and the `scale`
  refpage says classic mode "is not recommended for new work". So a `scale`
  box that uses its exponent argument should carry `@classic 0`.
- **`seq` has no pause.** The Max refpage lists no `pause` or `continue`
  message for `seq`.

### 2.3 The author's own ranking: which ELSE object replaces which clone

Most cyclone help files end with "plugdata users or those with ELSE can also
use … as an alternative". Where the author adds "better", "more powerful" or
"limited", the last column says so. Read as a designer's list of what he
would change about the Max originals.

| cyclone (Max) object | ELSE alternative | His word |
|---|---|---|
| `scale`, `scale~` | `rescale`, `rescale~` | "much simpler and more powerful" |
| `selector~`, `gate~` | `xselect~` / `xselect2~`, `xgate~` | "much better" |
| `sah~` | `sh~` | "better" |
| `snapshot~` | `sig2float~` | "more powerful" |
| `sustain` | `suspedal` | "better" |
| `urn` | `rand.u` | "more nicely designed" |
| `xnotein`, `xnoteout` | `note.in`, `note.out` | "more nicely designed" |
| `buffir~` | `conv~` | "much better and more powerful" |
| `cycle~` | `wavetable~` | "more powerful" |
| `lookup~` | `shaper~` | "more powerful" |
| `play~` | `tabplayer~`, `player~` | "more convenient" |
| `equals~`, `greaterthan~`, `lessthan~`, `modulo~` and the rest of the comparison set | `op~` | "better" |
| `bitand~`, `bitor~`, `bitxor~`, `bitnot~`, `bitshift~` | `op~ &`, `op~ \|`, `op~ ^`, `op~ ~`, `op~ >>` | |
| `grab` | `retrieve` | "limited functionality" |
| `bondo` | `hot` | "limited" |
| `borax` | `noteinfo` | "limited" |
| `zl` modes | `slice`, `group`, `iterate`, `merge`, `pick`, `reverse`, `rotate`, `sort`, `scramble`, `stack`, `stream`, `sum`, `changed`, `equal`, `median`, `replace` | one object per mode |
| `prob`, `anal` | `markov` | |
| `mtr` | `rec` | |
| `seq` | `midi` | |
| `line~`, `curve~` | `envgen~` | |
| `kink~`, `trapezoid~`, `triangle~` | `function~`, `envelope~`, `vsaw~` | |
| `rampsmooth~`, `slide~`, `deltaclip~` | `glide2~`, `lag2~`, `slew2~` | |
| `reson~`, `lores~`, `onepole~`, `cross~`, `phaseshift~` | `bandpass~`, `lowpass~`, `lop2~`, `crossover~`, `allpass.2nd~` | |
| `comb~`, `allpass~`, `delay~`, `teeth~` | `comb.rev~`, `allpass.rev~`, `ffdelay~`, `ffdelay~` + `fbdelay~` | |
| `overdrive~`, `degrade~`, `downsamp~`, `pong~` | `drive~`, `crusher~`, `downsample~`, `fold~` / `wrap2~` | |
| `average~`, `peakamp~`, `minmax~`, `zerox~`, `edge~`, `spike~`, `thresh~`, `change~` | `mov.avg~` / `mov.rms~`, `peak~`, `range~`, `zerocross~`, `status~`, `status~` + `detect~`, `schmitt~`, `changed~` / `changed2~` | |
| `matrix~`, `poke~`, `record~`, `peek~`, `plusequals~`, `train~`, `rand~`, `click~` | `mtx~`, `tabwriter~`, `tabwriter~`, `tabreader`, `add~`, `pulse~`, `rampnoise~`, `impseq~` | |
| `counter`, `uzi`, `accum`, `drunk`, `histo`, `mean`, `round`, `past`, `onebang`, `speedlim`, `thresh`, `togedge` | `count`, `loop`, `add`, `drunkard`, `histogram`, `mov.avg`, `quantizer`, `above`, `nmess`, `limit`, `combine`, `status` | |
| `pak`, `join`, `unjoin`, `iter`, `listfunnel`, `substitute`, `prepend`, `sprintf`, `tosymbol`, `fromsymbol`, `loadmess`, `switch` | `pack2`, `merge`, `unmerge`, `iterate`, `order`, `replace`, `insert`, `format`, `any2symbol` / `unite`, `symbol2any` / `separate`, `initmess`, `selector` | |
| `midiparse`, `midiformat`, `midiflush`, `xbendin`, `xbendout` | `note.in` and its family, `note.out` and its family, `panic`, `bend.in`, `bend.out` | |
| `mousestate`, `active` | `mouse`, `canvas.active` | |
| `cartopol`, `poltocar`, `atodb`, `dbtoa`, `mstosamps~`, `sampstoms~` | `car2pol`, `pol2car`, `lin2db`, `db2lin`, `ms2samps~`, `samps2ms~` | |

Several help files carry a copied line that names the wrong alternative; see
Part 4.

---

## Part 3 — The tutorial: what a Max patcher can take from it

The full notes (555 items) are in `plugdata_else_tutorial_notes.md`. These
are the ones most worth carrying into Max work. Paths are under
`Documentation/12.live-electronics-tutorial/`.

### Clocks and events

- **Derive every clock from one phase ramp.** Two free-running clocks drift
  as soon as one changes ratio, and changing it back does not fix it.
  Multiply the *phase* of a master ramp instead and the result cannot drift;
  fractions give polyrhythms.
  `T:Part.04-Control/14-Trigger-LFO-LFNoise/6.clock.metronome/7.[pimpmul~].Phase.Sync.pd`
- **A phase ramp is a general driver.** The same ramp can read a table as a
  waveform, an envelope or a sample, all locked to the clock. Same source.
- **Stay in the signal domain for timing.** Turning a signal event into a
  bang lands it on a block edge. A 500 ms pulse measured that way is no
  longer 500 ms; measured with signal objects it is exact.
  `T:Part.01-The.Basics/01-Pd.Quickstart/6.Audio.DSP.Pd/4.AudioXControl-Rate/7.Control.Rate2.pd`
- **Signal-rate step sequencer recipe.** Clock impulses into a counter, the
  count reads a pitch table and a mute table, an impulse on each count
  change times the step, and that impulse multiplied by the mute value
  triggers a sample-and-hold so pitch only updates on active steps.
  `T:Part.04-Control/19-Sequencing/3.[list].[array].[text].text/6.Signal.rate.array.pd`
- **Sample-and-hold has two meanings.** Level-sensitive (passes while the
  trigger is high) and edge-triggered (samples once per rise). `sh~`
  defaults to the first; with a long pulse the input just passes through.
  `T:Part.04-Control/15-Sample_and_Hold/3.Gate.pd`
- **Swing here is random deviation.** At 100% a beat can be up to twice as
  fast or twice as slow.
  `T:Part.04-Control/14-Trigger-LFO-LFNoise/6.clock.metronome/3.[tempo].[tempo~].pd`

### Envelopes and smoothing

- **A slew limiter fixes speed, not time.** If the gate level is not 1, the
  envelope shape changes: at 4 Hz, a gate of 0.5 with speed 8 gives the same
  shape as a gate of 1 with speed 16.
  `T:Part.04-Control/17-Envelopes/2.Classic.Types/03.ASR/4.[pulse~].pd`
- **A decay is an up/down smoother with zero rise time.** Feed impulses to a
  lag with rise 0 and fall equal to the decay.
  `T:Part.04-Control/17-Envelopes/2.Classic.Types/1.Decay/4.other.objects.pd`
- **The lag coefficient.** `a = exp(ln(0.001) / (ms × sample rate in kHz))`,
  then `y = x + a × (y[-1] − x)`. The same one-pole sits inside `decay~` and
  `adsr~`.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/8.Lag.slew/1.Lag.pd`
- **Envelope list order is reversed from line objects.** `envgen~` takes
  duration then target; an odd-length list starts with the start value; and
  a list only arms it. A sustain point is a breakpoint index; without one,
  repeat a target to hold. Delay and hold stages are just extra segments.
  `T:Part.04-Control/16-Lines/5.[envgen~].pd`,
  `T:Part.04-Control/17-Envelopes/2.Classic.Types/5.AHDSR.pd`
- **Retrigger without a click.** Either legato (restart the attack from the
  current level) or a short ramp to the start value, about 10 ms.
  `E:envgen~`
- **Gain changes get a ramp of about 10 ms**, and the default fader law is
  quartic (position to the fourth power), which gives more usable level at
  low positions than a dB scale.
  `T:Part.01-The.Basics/05-Gain.Adjustment/3.Quartic.[gain~].[out~].pd`

### Mixing

- **Three pan laws and the curve for each.** 6 dB at centre: linear or hann.
  3 dB: sine/cosine or square root. 4.5 dB: the average of the two.
  `T:Part.02-Basic-Processing/10-Signal-Routing/2.Pan/2.Pan.Law.pd`
- **Equal-power crossfade recipe.** Position 0 to 1, divided by 4, into a
  cosine and a sine lookup. The squares of the two gains add to 1.
  `T:Part.02-Basic-Processing/10-Signal-Routing/1.Crossfade/2.SinCos-EqualPower-Crossfade.pd`
- **Polarity inversion is not a 180° phase shift**, except for waves whose
  second half mirrors the first. Two sawtooths half a cycle apart sum to
  double the frequency, not silence.
  `T:Part.01-The.Basics/07-Phase/3.Polarity-Inversion.pd`
- **Compressor arithmetic.** Overshoot = level in dB − threshold. Gain
  change = −overshoot × (1 − 1/ratio), never above 0. Smooth it with one
  time going down (attack) and another going up (release). An RMS window of
  one sample is peak detection.
  `T:Part.02-Basic-Processing/11-Dynamics/5.Compressor.pd`
- **A normalizer needs a gate in front**, or it lifts the noise floor to the
  target level.
  `T:Part.02-Basic-Processing/11-Dynamics/2.Normalizer.pd`

### Oscillators and synthesis

- **Partial recipes.** Sawtooth: amplitude 1/p. Square: 1/p, odd only.
  Triangle: 1/p², odd only, every partial with p mod 4 = 3 inverted.
  Impulse: all equal.
  `T:Part.03-Sound.Generators/12-Oscillators/1.Waveforms/3.Saw-Tri/3.Triangular.pd`
- **Band-limit by partial count.** At 44.1 kHz the limit is 10 partials at
  2 kHz and 100 at 200 Hz, so one table per waveform is not enough.
  `T:Part.03-Sound.Generators/12-Oscillators/3.Band.Limited(Anti-Aliased)/1.[bl.osc~].wavetables.pd`
- **Oversample-and-filter.** Run the generator 16 times oversampled, lowpass
  with a 10th-order Butterworth at three quarters of the original Nyquist,
  come back down. It works for anything that aliases, including hard sync
  and modulation, and costs a lot of CPU.
  `T:Part.03-Sound.Generators/12-Oscillators/3.Band.Limited(Anti-Aliased)/3.Oversampling.pd`
- **Soft sync.** Instead of resetting the slave, reverse its direction at
  each master period. No jump, so no click.
  `T:Part.03-Sound.Generators/12-Oscillators/2.Sync/3.Soft-sync_2.pd`
- **Band-limit the carrier, not the modulator.** In FM with complex
  waveforms only the oscillator that receives the modulation needs to be
  band-limited.
  `T:Part.05-Synthesis(Basic)/24-Modulation.Synthesis/2.FM_PM/1.FM/3.Other.Oscillators.pd`
- **FM and PM are not interchangeable with the same numbers.** A PM index is
  a phase deviation where 1 is a full cycle, so useful values are 0 to 1.
  FM deviation = PM index × 2π × modulator frequency, and the FM modulator
  must be a cosine where the PM one is a sine. In PM the modulator frequency
  scales the effective deviation; in plain FM it does not. The tutorial
  names the DX7 as PM sold as FM.
  `T:Part.05-Synthesis(Basic)/24-Modulation.Synthesis/2.FM_PM/4.FM_x_PM/2.Examples/1.Cosine-Sine.pd`
- **"Index" usually means deviation.** The real index is deviation divided
  by modulator frequency.
  `T:Part.05-Synthesis(Basic)/24-Modulation.Synthesis/2.FM_PM/5.Classical.FM.pd`
- **Feedback PM needs a one-sample loop and a two-sample average in it.**
  The average tames the noise; the text says it appears in Yamaha patents.
  The sound changes with sample rate because one sample is a different time.
  `T:Part.05-Synthesis(Basic)/24-Modulation.Synthesis/2.FM_PM/7.Feedback.Cross.Modulation/1.Feedback.pd`
- **Chebyshev shaping only works at full level.** The harmonics match the
  weights when the input sine peaks at exactly 1; other levels give other
  spectra. In waveshaping, input level is part of the sound.
  `T:Part.05-Synthesis(Basic)/25-Waveshaping/7.Chebyshev.polinomials/2.[shaper~].pd`
- **Phase distortion.** Bend the phase ramp before the sine lookup; a
  variable sawtooth with a moving width is enough.
  `T:Part.05-Synthesis(Basic)/25-Waveshaping/9.Phase.Distortion.pd`
- **Wavetable scanning recipe.** Split the scan value into frame number and
  fraction; read frame n and n+1 with the same phase; crossfade by the
  fraction.
  `T:Part.05-Synthesis(Basic)/22-Wavetable/2.Wavetable.scan.pd`
- **Modal synthesis recipe.** A short noise burst into a bank of resonators,
  each with a frequency ratio, an amplitude and a decay time. The tutorial
  gives four sets of ratios and decays; one decay multiplier turns the same
  set from marimba-like to bell-like.
  `T:Part.11-Synthesis(Advanced)/39-Physical-Modeling/1.modal/2.[resonbank2~].pd`
- **Karplus-Strong details.** The loop needs a lowpass *inside* the feedback
  path (the original is a two-sample average); a filter after the loop is
  not the same thing. A "blend" of 0 flips polarity each pass and sounds an
  octave lower. High notes need a one-sample block.
  `T:Part.11-Synthesis(Advanced)/39-Physical-Modeling/2.Karplus-Strong/2.Original.Algorithm.pd`,
  `…/3.Variations.pd`

### Filters

- **Constant gain versus constant skirt.** A "bandpass" keeps its peak at
  0 dB; a "resonant" filter gets louder at the centre as resonance rises.
  `T:Part.06-Filters(Basic)/27-Filters.types/2.Filter.Types/2.Resonant/2.Bandpass/4.[resonant~].pd`
- **Q, bandwidth and decay time.** Q = centre ÷ (upper − lower −3 dB
  points). Bandwidth in octaves = log2(upper/lower). Bandwidth in Hz and
  t60 in seconds convert with `ln(1000) / (value × π)` in both directions.
  `T:Part.06-Filters(Basic)/27-Filters.types/2.Filter.Types/2.Resonant/1.Q-Bandwidth.pd`,
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/5.Resonators/1.[resonator~].pd`
- **Comb decay.** Feedback gain = `exp(ln(0.001) × delay / t60)`. With a
  fixed gain the ring time changes with pitch.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/5.Resonators/4.[comb.filt~].pd`
- **Biquad coefficient order.** Pd's `biquad~` takes feedback first
  (`fb1 fb2 ff0 ff1 ff2`) and adds the feedback terms. Max's refpage gives
  `a0 a1 a2 b1 b2` with the feedback subtracted. Reorder and negate when
  moving a list across.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/1.Basic.Theory/5.[biquad~].pd`
- **Any filter is its impulse response.** Send one impulse through, record
  the output; its FFT is the response, and convolving with it reproduces the
  filter.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/2.Filter.Response/4.IR.Convolution.pd`
- **Phaser recipe.** A chain of first-order allpasses sharing one
  coefficient, summed with the input, with a slow triangle sweeping the
  coefficient between 0.62 and 0.98. Order N gives N/2 notches.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/4.Allpass.Phaser/5.Phaser.pd`
- **A dead band removes jitter from a control signal.** Ignore changes
  smaller than a limit and pass larger ones minus the limit.
  `T:Part.10-Filters&Reverb/36-Filters(Advanced)/9.[slop~]/5.Unjitter.pd`
- **Vocoder construction.** N bands; in each, a bandpass on the synth input
  multiplied by the running RMS of the voice input; centres spaced by a
  fixed interval; one Q for all; a normalizer at the end because level
  changes with Q.
  `T:Part.06-Filters(Basic)/28-Filter.FX/2.Multiband-Processing/5.Vocoder/2.Vocoder.pd`

### Delay, sampling, granulation

- **A moving delay tap shifts pitch**, and stops shifting when it stops
  moving. Vibrato, chorus, flanger and the delay pitch shifter all follow.
  `T:Part.07-Sampling.Delay.Granulation/30-Delay(Ring-Buffer)/1.Delay/3.[delread4~].pd`
- **A feedback delay that cannot blow up.** Put a lowpass, a DC filter and a
  soft clipper inside the loop.
  `T:Part.07-Sampling.Delay.Granulation/30-Delay(Ring-Buffer)/6.Filtered.delay.pd`
- **Reverse delay.** Sweep the tap from 0 to the line length. At a rate of
  1 ÷ line length nothing is heard; at twice that the audio plays backward
  at normal speed. Make the line twice as long as the segment wanted.
  `T:Part.07-Sampling.Delay.Granulation/30-Delay(Ring-Buffer)/5.Reverse.delay.pd`
- **Delay-line pitch shifter.** A ramp on the delay time over one grain,
  at a rate of (1 − ratio) × (1000 ÷ grain ms), two windowed grains half a
  cycle apart.
  `T:Part.07-Sampling.Delay.Granulation/31-Granulation/2.Pitch.Shift&Time-Stretch/2.Ring.buffer(delay)/1.[pitch.shift~].pd`
- **Two overlapped grains with sine windows are an equal-power crossfade.**
  One windowed grain alone is amplitude modulation.
  `T:Part.07-Sampling.Delay.Granulation/31-Granulation/1.Introduction/2.Overlap.pd`
- **Change grain parameters only between grains.** Pass size and position
  through a sample-and-hold clocked by the grain ramp.
  `T:Part.07-Sampling.Delay.Granulation/31-Granulation/1.Introduction/1.Grain.pd`
- **Long files lose precision with a signal index.** With 32-bit floats an
  index is exact only up to 2²⁴ samples, about 6 min 20 s at 44.1 kHz.
  Players that step through the table themselves are not affected.
  `T:Part.07-Sampling.Delay.Granulation/29-Sampling(buffer)/2.Large.samples.issue.pd`
- **Interpolation choices.** Four-point Lagrange passes through all four
  points but can have corners at sample points. Hermite sets the slope at
  each point, so no corners; "spline" is Hermite with tension and bias 0 and
  is ELSE's default.
  `T:Part.07-Sampling.Delay.Granulation/29-Sampling(buffer)/3.Interpolation/5.Cubic.Hermite.pd`

### Spectral work

- **Resynthesis gain.** With a Hann window before and after, at overlap 4,
  divide by 1.5 × the window size (3072 for 2048).
  `T:Part.08-FFT.&.Complex.Signals/32-FFT-IFFT/3.IFFT/2.Normalization.Other.Windows.pd`
- **FFT resynthesis is granular, not additive.** A partial between bins is
  carried by phase changing from frame to frame.
  `T:Part.08-FFT.&.Complex.Signals/32-FFT-IFFT/3.IFFT/1.iFFT.pd`
- **Frequency shifting.** Make the input complex (Hilbert), multiply by a
  complex sinusoid, keep the real part. Every partial moves by the same
  number of hertz, so harmonic sounds turn inharmonic.
  `T:Part.08-FFT.&.Complex.Signals/33-Complex.Signals/5.Complex-Modulation/1.Freq-Shifting.pd`
- **Cross synthesis without polar conversion.** Divide A's real and
  imaginary parts by A's magnitude, multiply both by B's magnitude.
  `T:Part.09-Spectral.Processing/35-Advanced/1.Cross.Synthesis/1.Cross.Synthesis.pd`
- **Spectral gate threshold.** A running median of the magnitudes works
  better than a running mean for pulling out tonal peaks.
  `T:Part.09-Spectral.Processing/34-Basic/5.Gate.pd`
- **Phase vocoder in two lines.** Per bin, output phase = previous output
  phase + (front grain phase − back grain phase), with the front grain's
  magnitude. Done with complex multiply and divide on unit-magnitude frames,
  no phases need computing; adding each bin's neighbours ("phase locking")
  steadies it at slow speeds.
  `T:Part.09-Spectral.Processing/35-Advanced/3.Phase.Vocoder/1.TimeStretch-PitchShift/2.Cartesian.[pvoc.player~].pd`

### Reverb

- **Early reflections from feedforward delays only.** Each stage delays one
  of two signals and outputs their sum and difference, doubling the echo
  count: 6 stages give 64 echoes. Delay times must not be multiples of each
  other; the example uses primes.
  `T:Part.10-Filters&Reverb/37-Reverberation/2.[echo.rev~].pd`
- **Feedback delay network, minimum version.** Four lines of unrelated
  lengths, outputs mixed by sums and differences before feeding back, the
  feedback halved because that mix has a gain of 2, a lowpass in the loop
  for damping.
  `T:Part.10-Filters&Reverb/37-Reverberation/3.FDN/1.FDN.pd`

### MIDI, control voltage, tuning

- **Release velocity exists and MIDI files often carry it.** The example
  maps it to an envelope's release time.
  `T:Part.04-Control/18-MIDI-CV-OSC-Net/1.MIDI/7.Anatomy.of.MIDI.Messages.pd`
- **Volts per octave on a -1 to 1 signal.** Treat ±1 as ±5 V with 0 as
  middle C: MIDI pitch = signal × 60 + 60.
  `T:Part.04-Control/18-MIDI-CV-OSC-Net/2.CV/2.V-per-oct.pd`
- **Snap versus remap.** Snapping played notes to a scale with wide steps
  makes neighbouring keys land on one pitch; mapping key N to step N does
  not.
  `T:Part.01-The.Basics/03-Intervals-Tuning/8.[retune].pd`
- **Keep note lengths in beats.** Convert to ms from the current tempo just
  before the note is made, or lengths stay fixed when the tempo changes.
  `T:Part.04-Control/19-Sequencing/6.[qlist].[text].[score].[score2]/5.[text]-4.pd`
- **A Markov chain by hand.** One text line per pitch: the pitch, then every
  note that ever followed it, repeats included. Pick a random item from the
  line; the repeats do the weighting.
  `T:Part.04-Control/20-Stochastic/7.Markov.Chain/2.MIDI-File.pd`

---

## Part 4 — Where the documents disagree or look wrong

Recorded so nobody trusts one line over another without knowing.

**ELSE help files**

- `tabreader~` names two different default interpolation modes in the same
  file: one line says lagrange is the default, another says spline.
  `tabreader` (the control version) says lagrange in both places. The
  tutorial says spline (`E:tabreader~`, `E:tabreader`).
- `pm2~`, `pm4~` and `pm6~` call themselves `op2~`, `op4~`, `op6~` in their
  own description lines.
- `slider2d`'s description calls it `slider3d`; `stereo.rev~`'s and
  `meter8~`'s descriptions name a different object; `popmenu` calls itself
  `popup`.
- `lag~` says "within 0.01%" while the tutorial's formula for the same
  filter uses 0.001 (0.1%).
- `quantizer~` lists four modes in one line and five (0 to 4) in another.
- `rad2deg` says it converts "radians to radians".
- `resonbank~`'s flag for the ratio list is `-partial` in the help file and
  in one tutorial patch, `-ratio` in two others.
- `conv~` is shown as `[conv~ $0-IR 1024]` in one tutorial patch and
  `[conv~ 128 ../files/IR.wav]` in another; the help file gives table name
  and partition size as the arguments.
- The reverse delay is `revdelay~` in the box and `rdelay~` in the
  tutorial's text; `blip~` is called `gbuzz~` in its tutorial patch.

**cyclone help files**

- Several "alternative" lines were copied from another file and name the
  wrong object: `count~` and `svf~` and `split` and `wave~` and `index~`
  point to `comb.rev~`, `replace`, `midi`, `loop` and `status~`.
- `mstosamps~` and `sampstoms~` each point to the converter for the other
  direction.
- `gate` is said to be replaced by `selector`, the same object named for
  `switch`; by ELSE's own descriptions the match for `gate` is `router`.
- `poke~`'s line is spelled `tabwriter~~`.

**The tutorial**

- The MIDI anatomy patch gives the bend range once as "0 to 1383", says
  "129 is channel 1" for note-off against 128 elsewhere, and says 127
  controllers for a range of 0 to 127.
- The analysis filter bank text says minor thirds while the box steps by 4.
- The `lop2~` comment says b = 1 − a while the patch's expression computes
  it from a different value.
- One comment calls `asin` the inverse hyperbolic sine.
