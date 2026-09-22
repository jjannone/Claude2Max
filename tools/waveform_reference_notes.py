"""Butter Markdown for the reference patch's "overlaps" blocks.

One table per idea, object names in `code` and package names in **bold** — the
several styles in one comment that make these butter_comment rather than two
plain comments.  NO COMMAS OR SEMICOLONS: Max splits an attribute value on
both before the text reaches the object, so the prose here uses full stops and
middle dots instead.  A line break is <br>, as from the Inspector.

Code style is for code and nothing else: an object name, an attribute, a
message, a path.  A parenthetical in English — "ships inside Max", "offline" —
takes italics, because the monospaced box reads as something the user could
type.  (John, 2026-09-22.)
"""

# em-dash fences a table; the first row is a header when it starts with {b}
F = "—"


def table(header, rows):
    out = [F, "{b}" + "|".join(header)]
    out += ["|".join(r) for r in rows]
    out.append(F)
    return out


def notes(overlaps, packages, preamble=None):
    lines = list(preamble or [])
    if overlaps:
        lines += ["## Overlaps"] + table(["object", "what it is instead"], overlaps)
    if packages:
        lines += ["", "## Packages"] + table(["package", "what it adds"], packages)
    return lines


IN_MAX = "*ships inside Max*"

SOURCES = notes(
    [
        ("`sinx~` `cos~` `cosx~`",
         "make a sine from a signal but have no frequency of their own. Shapers on tab 3 rather than oscillators."),
        ("`mc.cycle~` `mc.saw~` `mc.tri~` `mc.rect~` `mc.phasor~` `mc.noise~`",
         "the multichannel twins. `mc.noise~ @chans n` gives n decorrelated channels from one box."),
        ("`rate~`", "time-scales a `phasor~` into slower or faster cycles"),
        ("`plugphasor~`", "a `phasor~` locked to the host transport"),
        ("`phasewrap~`", "wraps a signal between +pi and -pi. Phase arithmetic rather than timbre."),
        ("`phaseshift~`", "an allpass shifter for a whole signal. Not a ramp shaper."),
        ("`oscbank~`", "`ioscbank~` without the glide. Cheaper and it steps to new values instead of sliding."),
        ("`triangle~` `trapezoid~`", "built-in wavetables scanned by a 0.-1. signal. They need no buffer."),
        ("`index~` `play~` `groove~`", "read the same buffer by sample or by millisecond rather than as a wavetable"),
        ("`what~`", "impulses from a list of audio values"),
        ("`metro`", "the control-rate clock that `train~`'s right outlet replaces"),
    ],
    [
        ("**ableton-dsp** " + IN_MAX,
         "most `abl.dsp.meldosc~` engines also ship alone: `basicshapes~` `bitgrunge~` `bubble~` `chip~` "
         "`crackle~` `dualbasicshapes~` `extratone~` `filterednoise~` `fmbass~` `foldfm~` `harmonicfm~` "
         "`noiseloop~` `noisyshapes~` `rain~` `shepard~` `simplefm~` `squarefifth~` `squaresync~` `subosc~` "
         "`swarm~` `tarp~` `velvetnoise~` · plus `ramp~` `euclid~` `pulsate~` `stereolfo~` `modulator~`"),
        ("**BEAP** " + IN_MAX,
         "`bp.Oscillator` `bp.Wavetable` `bp.FM` `bp.Macro Oscillator` `bp.Quad Harmonic` `bp.Cloud` "
         "`bp.Granular` `bp.Karplus` `bp.Cell` `bp.Noise` `bp.GaussianNoise` · right-click > Paste From > BEAP"),
        ("**CNMAT Externals**", "`sinusoids~` `harmonics~` `oscillators~` — additive banks"),
        ("**Data Knot**", "`dk.mangrove~` `dk.justfriends~` `dk.fourses~` `dk.rungler~` `dk.quantussy~` `dk.avdog~`"),
        ("**TS.Modular**", "`ts.sine` `ts.rect` `ts.triangle` `ts.complexOsc` `ts.tanhOsc` `ts.sai` `ts.morphi` `ts.aKastle`"),
        ("**PeRColate**", "`terrain~` for wave terrain · `gen9` `gen10` `gen7` `gen5` `gen20` `gen24` `gen25` fill tables"),
        ("**dada**", "`dada.terrain~` `dada.peanos~` `dada.music~`"),
        ("**ACToolkit**", "`jeynoise~` `flipflop~`"),
        ("**Sadam Library**", "`sadam.standardMap~` — a chaotic oscillator"),
        ("**Panning Tools**", "`noiseband~` `noisebandstereo~` `polysimpleFM~`"),
        ("**abclib**", "`abc.generator~` `abc.mc.multinoise~` `abc.soundcoat~` `abc.env.noise~`"),
        ("**MC Movement Studies**", "`db.mc.fmwavetable~` `db.wavetable2polybuffer`"),
        ("**Upshot**", "`upshot_noisegenerator` `upshot_alpha` `upshot_polysynth`"),
        ("**modulo**", "`mo.fm~`"),
        ("**RNBO Synth Building Blocks**", "`sbb.osc.wavetable` — inside RNBO patches only"),
    ],
    ["Tab 7 lists every object in this area in one place."])

CLIP = notes(
    [
        ("`clip~`",
         "the same job as `pong~ @mode clip` in its own box. Its one extra is `@mode Zero` which outputs 0 "
         "outside the bounds instead of the bound itself."),
        ("tab 3's signal maths",
         "`tanh~` and the rest are the smooth versions of the same idea. They never have a corner."),
        ("`deltaclip~`", "limits how fast a signal may change rather than how loud it may get"),
        ("`phasewrap~`", "`pong~ @mode wrap` fixed at +pi and -pi. For phase arithmetic rather than timbre."),
        ("`lookup~` on tab 4", "can imitate any of these and anything else with a drawn curve"),
        ("`round~`", "quantises amplitude to a step rather than bounding it"),
    ],
    [
        ("**ableton-dsp** " + IN_MAX,
         "`abl.dsp.saturator~` `abl.dsp.overdrive~` `abl.dsp.distortion~` `abl.dsp.fuzz~` `abl.dsp.expshaper~` "
         "`abl.device.roar~` — voiced effect units rather than primitives. "
         "`patches/shootouts/distortion-shootout.maxpat` auditions eighteen of them."),
        ("**ableton-dsp** " + IN_MAX, "`abl.dsp.waveshaper~` — tab 6"),
        ("**s2n**", "`sn.drive~` — tab 6"),
        ("**PeRColate**",
         "`flip~` folds around a threshold and its own help file says `pong~` superseded it · "
         "`weave~` flips a square wave after counted zero crossings for subharmonics"),
        ("**TS.Modular**", "`ts.wavefolder` `ts.saturation` `ts.overdrive`"),
        ("**BEAP** " + IN_MAX, "`bp.Wavefolder` `bp.Folder` — several folding stages · Paste From > BEAP"),
        ("**ears**", "`ears.clip~` `ears.overdrive~` — the same jobs offline on a buffer"),
    ])

MATH = notes(
    [
        ("`pow~` `log~`", "the exponent or the base arrives on inlet 1"),
        ("`atan2~`", "arc-tangent of two signals rather than one"),
        ("`minimum~` `maximum~`", "compare two signals and keep one"),
        ("`round~ @nearest`", "quantise to a step of any size"),
        ("`scale~`", "map one range onto another with a curve argument"),
        ("`deltaclip~`", "limit slope rather than level"),
        ("`sah~`", "sample and hold on a trigger signal. `@triggermode` `@thresh` `@duration`."),
        ("`avg~`", "the average of a block as a float"),
        ("`zerox~` `change~` `edge~` `thresh~`", "report on a signal instead of shaping it"),
        ("`acosh~` `asinh~` `acos~`",
         "the rest of the family. `acosh~` wants 1. or more in so it needs an offset in front of it."),
        ("`gen~`",
         "the same functions as single-word operators and far cheaper per sample. Where a chain of several of these belongs."),
    ],
    [
        ("**s2n**", "`sn.drive~` on tab 6 is one of these curves with parameters bolted on"),
        ("**ableton-dsp** " + IN_MAX, "`abl.dsp.waveshaper~` on tab 6 builds its curve from parameters"),
        ("**TS.Modular**", "`ts.tanhOsc` uses `tanh~` as an oscillator rather than as a shaper"),
    ],
    ["None of the shapers above has a single attribute. That is normal for signal maths: "
     "`rampsmooth~` and `slide~` below are the two here that carry any."])

LOOKUP = notes(
    [
        ("`table~`", "the same idea at integer indices into a `table` object rather than a `buffer~`"),
        ("`clip~` `pong~` on tab 2", "fixed curves this can imitate. And then some."),
        ("tab 3's signal maths", "the curves Max already knows. This is the one you draw."),
        ("`peek~`", "writes the curve a sample at a time when the patch has to compute it"),
        ("`buffer~` `fill` and `apply`", "the standard shapes without any computing. See tab 1's REFTABLE block."),
    ],
    [
        ("**PeRColate**",
         "`gen17` solves Chebyshev polynomials into exactly this table so a full-level sine through it gains "
         "precisely the harmonics asked for. Wired on tab 6."),
        ("**TS.Modular**", "`ts.waveshaper` — a curve you draw by hand"),
        ("**BEAP** " + IN_MAX, "`bp.Waveshaper` `bp.Table` · Paste From > BEAP > Waveshapers"),
        ("**ableton-dsp** " + IN_MAX, "`abl.dsp.waveshaper~` on tab 6 builds its curve from parameters not a table"),
    ])

LOFI = notes(
    [
        ("`sah~`", "the primitive underneath sample-rate reduction: hold a value until a trigger says otherwise"),
        ("`trunc~` on tab 3", "the bit-depth half on its own at one bit"),
        ("`round~ @nearest`", "quantise amplitude to any step rather than only a power of two"),
    ],
    [
        ("**ableton-dsp** " + IN_MAX,
         "`abl.device.redux~` is the full version: `@rate` in Hz · `@bitdepth` 1 to 16 · `@jitter` · a "
         "`@prefilter` and a `@post_filter` that decide how much aliasing survives · `@shape` morphs the "
         "quantiser between linear and A-law"),
        ("**Upshot**", "`upshot_bitcrusher` — a simpler wrapper around the same idea"),
        ("**ears**", "no offline equivalent. These two are realtime only."),
    ],
    ["Neither object has a single attribute. Every control on this page is an inlet."])

PKGSHAPE = notes(
    [
        ("`abl.dsp.expshaper~`", "one exponential curve and one `@amount`. The small version of the same idea."),
        ("`abl.dsp.saturator~`", "Live's Saturator: fewer controls and a voiced result"),
        ("`abl.device.roar~`", "three saturation stages with routing between them"),
        ("`Abl.Waveshaper~`", "the panelled module wrapping the same DSP. It carries MC stereo cords."),
        ("`lookup~` on tab 4", "the same job with a curve you supply instead of parameters"),
    ],
    [
        ("**s2n**", "`mc.sn.drive~` and `mcs.sn.drive~` are the multichannel forms of `sn.drive~`"),
        ("**PeRColate**", "`gen9` `gen10` `gen7` `gen5` `gen20` `gen24` `gen25` compute other table contents"),
        ("**PeRColate**", "`dcblock~` — a waveshaper with an asymmetric curve generates DC. Block it."),
        ("**TS.Modular**", "`ts.waveshaper` `ts.wavefolder` `ts.saturation` `ts.overdrive`"),
        ("**PnP.Maxtools**", "`pnp.distort~`"),
        ("**Upshot**", "`upshot_distortion` `upshot_waveshapedistortion`"),
    ],
    ["## Two attributes gate the others",
     F,
     "{b}attribute|why it is written into the box here",
     "`@shaper_drive`|how much the input is influenced by `@curve` `@depth` `@period` `@linearity` and "
     "`@damping`. At 0. those five do nothing at all which reads as a dead object.",
     "`@mix`|dry and wet. At 0. you hear the input unchanged however hard you drive it.",
     "stereo|inlets 0 and 1 are left and right so the mono source feeds both. Outlet 0 is taken here. "
     "C74's own help patch wires it the same way.",
     F,
     ""])

CATALOG = (
    ["# Waveform generation", "Every generator on tab 1 is in this list."]
    + table(["job", "objects"], [
        ("sine / wavetable",
         "`cycle~` `wave~` `2d.wave~` `triangle~` `trapezoid~` `table~` `mc.cycle~` `mc.wave~` · "
         "`sinx~` `cos~` `cosx~` make a sine from a signal but have no frequency of their own"),
        ("ramp / phase", "`phasor~` `rate~` `plugphasor~` `kink~` `twist~` `phasewrap~` `phaseshift~` `mc.phasor~`"),
        ("antialiased", "`saw~` `tri~` `rect~` · and `mc.saw~` `mc.tri~` `mc.rect~`"),
        ("impulses", "`train~` `click~` `what~`"),
        ("noise", "`noise~` `pink~` `rand~` `mc.noise~ @chans n`"),
        ("banks / additive", "`ioscbank~` `oscbank~` — the same bank without the glide"),
        ("buffers", "`buffer~` `peek~` `poke~` `record~` `waveform~` `index~` `play~` `groove~`"),
        ("envelopes", "`line~` `curve~` `adsr~` `shape~` `ramp~` `updown~` `twist~` — a neighbouring family"),
    ])
    + ["", "# Waveshaping"]
    + table(["job", "objects"], [
        ("fold / wrap / clip",
         "`pong~` on tab 2 does all three · `clip~` is its clip mode alone plus a Zero mode · "
         "`phasewrap~` is the wrap mode fixed at +pi and -pi · `deltaclip~` limits slope not level"),
        ("saturate", "`overdrive~` on tab 2 · `tanh~` and the rest of tab 3 · `round~` quantises instead"),
        ("signal maths",
         "`tanh~` `sinh~` `cosh~` `atanh~` `asinh~` `acosh~` · `sinx~` `cosx~` `tanx~` `cos~` `asin~` `acos~` "
         "`atan~` · `abs~` `sqrt~` `trunc~` `delta~` on tab 3 · `pow~` `log~` `atan2~` `minimum~` `maximum~` "
         "`scale~` `rampsmooth~` `slide~` `avg~` `sah~` · `zerox~` `change~` `edge~` `thresh~` report rather than shape"),
        ("transfer table", "`lookup~` on tab 4 · `table~` · `peek~` writes the curve · `buffer~` `fill` and `apply`"),
        ("phase distortion", "`kink~` `twist~` and `cycle~`'s phase inlet — all on tab 1 · `phaseshift~`"),
        ("lo-fi", "`degrade~` `downsamp~` on tab 5 · `sah~` `trunc~`"),
    ])
    + ["", "# Packages"]
    + table(["package", "objects"], [
        ("**ableton-dsp** " + IN_MAX,
         "generation: `abl.dsp.meldosc~` and most of its engines alone — `basicshapes~` `bitgrunge~` `bubble~` "
         "`chip~` `crackle~` `dualbasicshapes~` `extratone~` `filterednoise~` `fmbass~` `foldfm~` `harmonicfm~` "
         "`noiseloop~` `noisyshapes~` `rain~` `shepard~` `simplefm~` `squarefifth~` `squaresync~` `subosc~` "
         "`swarm~` `tarp~` `velvetnoise~` `ramp~` `euclid~` `pulsate~` `stereolfo~` `modulator~` · "
         "shaping: `abl.dsp.waveshaper~` `abl.dsp.expshaper~` `abl.dsp.saturator~` `abl.dsp.overdrive~` "
         "`abl.dsp.distortion~` `abl.dsp.fuzz~` `abl.dsp.filther~` `abl.device.redux~` `abl.device.roar~` "
         "`abl.device.drumbuss~`"),
        ("**BEAP** " + IN_MAX,
         "`bp.Oscillator` `bp.Wavetable` `bp.FM` `bp.Macro Oscillator` `bp.Quad Harmonic` `bp.Mono Risset "
         "Oscillator` `bp.Cloud` `bp.Granular` `bp.Karplus` `bp.Cell` `bp.Noise` `bp.GaussianNoise` and the "
         "whole LFO folder · `bp.Waveshaper` `bp.Wavefolder` `bp.Folder` `bp.Table` · Paste From > BEAP"),
        ("**CNMAT Externals**", "`sinusoids~` `harmonics~` `oscillators~`"),
        ("**Data Knot**", "`dk.mangrove~` `dk.justfriends~` `dk.fourses~` `dk.rungler~` `dk.quantussy~` `dk.avdog~`"),
        ("**TS.Modular**",
         "`ts.sine` `ts.rect` `ts.triangle` `ts.complexOsc` `ts.tanhOsc` `ts.sai` `ts.morphi` `ts.aKastle` · "
         "`ts.waveshaper` `ts.wavefolder` `ts.saturation` `ts.overdrive`"),
        ("**PeRColate**",
         "`terrain~` · `gen9` `gen10` `gen7` `gen5` `gen20` `gen24` `gen25` · `gen17` for a Chebyshev table · "
         "`flip~` superseded by `pong~` · `weave~` · `dcblock~`"),
        ("**s2n**", "`sn.drive~` `mc.sn.drive~` `mcs.sn.drive~`"),
        ("**dada**", "`dada.terrain~` `dada.peanos~` `dada.music~`"),
        ("**ACToolkit**", "`jeynoise~` `flipflop~`"),
        ("**Sadam Library**", "`sadam.standardMap~`"),
        ("**Panning Tools**", "`noiseband~` `noisebandstereo~` `polysimpleFM~`"),
        ("**abclib**", "`abc.generator~` `abc.mc.multinoise~` `abc.soundcoat~` `abc.env.noise~`"),
        ("**MC Movement Studies**", "`db.mc.fmwavetable~` `db.wavetable2polybuffer`"),
        ("**Upshot**",
         "`upshot_noisegenerator` `upshot_alpha` `upshot_polysynth` · `upshot_distortion` "
         "`upshot_waveshapedistortion` `upshot_bitcrusher`"),
        ("**ABL Effect Modules**",
         "`Abl.Waveshaper~` `Abl.Saturator~` `Abl.Redux~` `Abl.Distortion~` `Abl.Overdrive~` `Abl.Fuzz~` "
         "`Abl.Filther~` — panelled modules that carry MC stereo cords"),
        ("**ears** *offline*", "`ears.clip~` `ears.overdrive~`"),
        ("**PnP.Maxtools**", "`pnp.distort~`"),
        ("**modulo**", "`mo.fm~`"),
        ("**RNBO Synth Building Blocks**", "`sbb.osc.wavetable` — inside RNBO patches only"),
    ])
    + ["",
       "Already in this repo: `patches/shootouts/distortion-shootout.maxpat` auditions eighteen distortion and "
       "lo-fi units side by side. `distortion-modules-shootout.maxpat` does the same for BEAP and .amxd devices."])

ALL = {"sources": SOURCES, "clip": CLIP, "math": MATH, "lookup": LOOKUP,
       "lofi": LOFI, "pkgshape": PKGSHAPE, "catalog": CATALOG}
