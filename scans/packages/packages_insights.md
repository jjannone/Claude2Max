# Package Insights — scan of installed Max packages, 2026-09-16

Patching insights read out of the Max packages installed in
`~/Documents/Max 9/Packages/`. Each entry was written by reading the package's
own files (patches, help files, refpages, scripts), not only its prose, and
object, attribute and message names were checked against Max 9's registry and
refpages. Nothing here was run in Max unless an entry says so.

Two sources feed this file:

- **New-package scans** — full scans of packages new to the library that day:
  abclib, Panning Tools, mat.oo, ABL Effect Modules, AudioMix,
  MC Movement Studies, JitLygia, Gen CV Tools, PGS-1, µK Bundle.
- **Catalog pass** — insights the agents came across while rating every
  object in the other installed packages for `packages/package_catalog.xlsx`.

Tutorial packages (Delicious Tutorials, Jitter Recipes) are in
`tutorials_insights.md` in this folder.

Each entry is a blockquote: a bold title, the insight, where it was found, and
why it matters. Entries marked **[PROMOTION-CANDIDATE]** could become a rule
in `patching/MAX_PATCHING.md`; promotion needs John's confirmation (see
"Rules from Corrected Errors" in `CLAUDE.md`). Package paradigms (how a
package is meant to be used as a whole) are in `packages/package_concepts.md`.


## abclib

> **[PROMOTION-CANDIDATE] An abstraction that forwards its arguments with a fixed `#1 … #9` list silently drops everything past the ninth word.** Every abclib wrapper is one box, `js abc_wrp.js #1 #2 #3 #4 #5 #6 #7 #8 #9`, so each `@name value` pair costs two of the nine slots. `abc.hoa.encoder~ 3 @dimensions 3 @sources 2 @sa0 0.1 @se0 0.5 @e0 10.` loses `@e0 10.` with no warning. Past that point, set parameters by message after load, e.g. from a `loadbang`-fired semicolon message box.
> *Source*: `patchers/abc.hoa.encoder~.maxpat` (the single `js` box); `javascript/abc_wrp.js` lines 33 and 69-100, which read `jsarguments`.
> *Why it matters*: a spec that packs initial values into the box text of any `#N`-forwarding abstraction must count tokens. The failure is silent: the object loads and plays, just with default values.

> **abclib port counts are built by script at load and change with the arguments, so a spec must set them from the configuration, not from the refpage.** The refpages ship with their inlet and outlet sections commented out. `abc_wrp.js` creates one signal inlet (or none, for generators), one control inlet to its right (or none, for `abc.hoa.map~`, the bus objects and the coordinate converters), and one outlet. `abc.hoa.map~ 1 @sources 3` has three inlets. `abc.mc.busselect~` has three: left bus, right bus, control.
> *Source*: `javascript/abc_wrp.js` lines 540-625; `help/abc.hoa.map~.maxhelp` ("multiple maps" tab, cords into inlets 0, 1 and 2 of `abc.hoa.map~ 1 @sources 3`).
> *Why it matters*: the refpage-based extract records 2 inlets for `abc.hoa.map~`, and that is what a package-library lookup would return. A spec with more than one map source needs explicit `inlets`, or the cords to sources 2 and up collapse onto the wrong inlet.

> **Refpage "attributes" on abclib objects are parameters of the compiled external. They work both as box-text `@name value` and as messages to the control inlet.** The wrapper copies any `@name value` pair it doesn't recognise into the inner `abc_*` box text. At run time the same names are messages into the rightmost inlet: `gain $1`, `a0 $1`, `dur2 $1`. The help patches use both, e.g. `abc.hoa.optim~ 3 @dimensions 3 @optimtype 2` and `[optimtype $1]` into inlet 1.
> *Source*: `javascript/abc_wrp.js` lines 96-98 and 536; `extras/abclib/Overviews/abc.overview.hoa.basic.maxpat`; `help/abc.hoa.decoder~.maxhelp`.
> *Why it matters*: `list_attributes` on the refpage gives the right names but the wrong inlet expectation. Every runtime control cord in a spec goes to the rightmost inlet, and on a two-inlet object that is inlet 1.

> **Asking an abclib wrapper for a configuration that has no compiled external produces a dead abstraction, with only a console line.** The script builds a class name such as `abc_3d_rotate2~` and instantiates it, whether or not it exists. 3D externals ship only for the decoder, encoder, binaural decoder, optim, wider and vector (orders 1-3), plus decorrelation and ring modulation (orders 1-5). The script's 3D order limit is checked before `@dimensions` is read, so it never applies. Its speaker limit is checked before the default speaker count is computed. So `abc.hoa.decoder~ 4 @dimensions 3` asks for a 25-speaker decoder that does not exist.
> *Source*: `javascript/abc_wrp.js` lines 44-53 (order check), 74-83 (dimensions parsed later), 102-121 (speaker clamp before default); `externals/` listing (no `abc_3d_rotate*`, `abc_3d_map*`, `abc_3d_mirror*`, `abc_3d_stereodecoder*`, `abc_3d_decoder4_*`).
> *Why it matters*: before writing any `abc.hoa.* @dimensions 3` box, check that the matching `abc_3d_*` external exists in `externals/`. A missing one looks like a working box from outside.

> **abclib selects mode variants only through `@mode`. A bare number is ignored, and the package's own overview patch falls into this.** For `abc.puckettespaf~` and `abc.jupiterbank~`, the script tests `mode == 2`. The first positional number goes to a variable those branches never read. `extras/abclib/Overviews/abc.overview.synthesis.maxpat` has `abc.puckettespaf~ 2`, which builds mode 1 (`abc_puckettespaf~`), not the inharmonic mode 2 its help patch demonstrates with `abc.puckettespaf~ @mode 2`.
> *Source*: `javascript/abc_wrp.js` lines 381-390 and 433-444; `help/abc.puckettespaf~.maxhelp`; the overview patch's "pafs" subpatcher.
> *Why it matters*: copying box text from an abclib overview can silently give the wrong variant. Always spell modes as `@mode`.

> **To position a source for `abc.hoa.map~`, combine the mono signal with a polar pair from an abc object. Don't assemble the pair from built-ins.** Each map inlet expects a 3-channel cord: `mc.combine~ 2`, source on the left, and the 2-channel pair from `abc.trajectories~`, `abc.pict2map`, or `abc.map.ui` → `abc.cartopol~` on the right. The refpage describes the channels as `[sig, radian, meter]`. But `abc.pict2map` packs `cartopol~` outlet 0 (magnitude) into the first channel and the angle, offset by -1.5708, into the second. So the refpage's order is not a safe guide for building the pair by hand.
> *Source*: `help/abc.hoa.map~.maxhelp`; `misc/others/abc.pict2map.maxpat` (`cartopol~` → `mc.pack~ 2`, `-~ 1.570796` on the angle); `docs/ref/refpages/abclib-ref/abc.hoa.map~.maxref.xml`.
> *Why it matters*: a hand-built pair gives a source that moves, just in the wrong place, which is hard to spot by ear. Reuse the abc converters, which match each other.

> **abclib's GUI objects are object-box names that Max swaps for bpatchers, so a spec must write them as `bpatcher` boxes.** `init/objectmapping.txt` uses `max definesubstitution` for `abc.gaincontrol`, `abc.stereoout~`, `abc.quadriout~`, `abc.pict2map`, `abc.map.ui`, `abc.scopeembedded` and others. The help files save them as `maxclass: bpatcher` with `name: "abc.gaincontrol.maxpat"` and their initial values as `args`, e.g. `["@gain", -127]` or `[1, 2, 3, 4, "@gain", 0]` for `abc.quadriout~`.
> *Source*: `init/objectmapping.txt`; `help/abc.hoa.decoder~.maxhelp` and `help/abc.quadriout~.maxhelp` (saved bpatcher boxes).
> *Why it matters*: a spec that writes `abc.gaincontrol` as a `newobj` gives the converter a box whose saved form doesn't match what Max creates on load. Emit the bpatcher form Max itself saves.

> **Size ambisonic test sources and outputs from the order: 2N+1 channels in 2D, (N+1)^2 in 3D.** The help patches feed an order-3 2D decoder from `mc.pink~ @chans 7` (through `mc.*~` and `abc.mc.randenv~ 7`). They feed an order-5 3D decorrelator from `mc.click~ @chans 36`. The decoder's output width equals `@speakers` (default 2N+2 in 2D), so `mc.dac~ 1 2 3 4 5 6 7 8` pairs with `abc.hoa.decoder~ 3` in 2D.
> *Source*: `help/abc.hoa.decoder~.maxhelp`; `help/abc.hoa.decorrelation~.maxhelp`; `javascript/abc_wrp.js` lines 118-122.
> *Why it matters*: a mismatched channel count fails quietly, as missing or unused channels rather than an error. Compute the width once from the order and reuse it for every `@chans` and `mc.dac~` in the chain.

> **An abclib ambisonic patch can be auditioned without a speaker array in three ways, and the package is designed around that.** `abc.hoa.binaural~ <order>` renders the stream for headphones (KU100 HRIRs). `abc.hoa.stereodecoder~ <order>` renders it for two speakers. Or `stereo 1` into an existing `abc.hoa.decoder~` folds its output to stereo in place. The launch patch states the design goal: composers should test patches in a studio "or at home in simple stereo".
> *Source*: `extras/abclib/abc.launch.maxpat` (description comment); `help/abc.hoa.binaural~.maxhelp`; `help/abc.hoa.stereodecoder~.maxhelp`; the decoder help's `[stereo $1]` toggle.
> *Why it matters*: a Claude2Max ambisonic patch for students should give the decoder a visible stereo/array switch (`stereo $1`) or a binaural branch, so it can be checked on a laptop before the concert room.

> **Trust an abclib help patch over its refpage when they disagree on a parameter name.** Checked mismatches: `abc.hoa.delay~` uses `window` (help patch, overview patch, and the string inside `abc_2d_fx_delay3~`), which the refpage omits. The refpage also offers a `man` mode for it, but no external exists. `abc.rissetsbell~` uses `pfreq2` (help patch and binary), while the refpage says `pfreq`. The `abc.hoa.mirror~` refpage gives two opposite meanings for `factor` 0 and -1. Three refpage files declare the wrong object name in their root element: `abc.hoa.stereoencoder~` (says stereodecoder), `abc.mc.busselect~` (says busplus), `abc.simplefmburst~` (says simpleburstfm).
> *Source*: `docs/ref/refpages/abclib-ref/` (the files above); `help/abc.hoa.delay~.maxhelp`; `help/abc.rissetsbell~.maxhelp`; `strings` on `externals/abc_2d_fx_delay3~.mxo` and `externals/abc_rissetsbell~.mxo`.
> *Why it matters*: Claude2Max's refpage cache keys objects by the root `name` attribute. For these three files it would file one object's docs under another's name. A name check against the refpages would also flag the working `window` and `pfreq2` messages.

> **The `abc_*` externals can be used directly, but only when the wrapper can't give you what you need.** For instance: variants no wrapper exposes (`abc_2d_encoderN~`, `abc_2d_fx_gainN~`, `abc_2d_syn_gainN~`); more than nine creation tokens; or separate per-channel inlets and outlets without `mc.unpack~`/`mc.pack~`. Going direct costs three things. You declare ports by hand, since no refpage covers them. You rebuild the unpack/pack plumbing. And for binaural decoders you skip their extra last outlet. All 808 bundles are universal x86_64/arm64.
> *Source*: `externals/` listing; `javascript/abc_wrp.js` lines 540-625 (the plumbing the wrapper adds); `lipo -archs` on every `externals/*.mxo/Contents/MacOS/*`.
> *Why it matters*: the default in a Claude2Max spec is the `abc.*` abstraction. The raw external is the exception, used only for one of the reasons above.

> **`abc.soundgrain~` loads `rainstick.aif` from Max's own media folder into globally named buffers, so every instance shares them.** It is a plain Max patch, not a wrapper: `buffer~ zaza rainstick.aif`, plus `buffer~ livegrain` inside its `sinBuffer` subpatcher. Every instance uses the same two named buffers.
> *Source*: `patchers/abc.soundgrain~.maxpat`; `/Applications/Max.app/Contents/Resources/C74/media/msp/rainstick.aif`.
> *Why it matters*: harmless as a test source. But don't copy this abstraction as a model for a reusable granulator: its buffer names are not per-instance (`#0`), which the repo's naming rule for copied objects requires.

Paths are relative to `~/Documents/Max 9/Packages/<package>/`. Every entry was checked against the patch files, not only the prose. Numbers marked "calculated" come from working through a patch's formula, not from measuring audio in Max.

## Panning Tools (Christopher Dobrian)

> **A 0 Hz `cycle~` works as a cosine lookup table. Send a value into its phase inlet (the right one) and you get constant-power gains with no trig objects.**
> `pan~` computes the left gain as `sig~ 0.25` → `*~ <pan>` → phase of a `cycle~`, which gives cos(π/2 · pan). A second `cycle~` gets that phase plus 0.75 (`+~ 0.75`) and gives sin(π/2 · pan) for the right. `quadpan~` gives each speaker its own lobe with `+~ <speaker angle>` → `cycle~` → `clip~ 0. 1.`. `mixS~` reads half a cosine for its S-curve.
> *Source*: `patchers/pan~.maxpat`, `patchers/quadpan~.maxpat`, `patchers/mixS~.maxpat`; `TechniquesAndSoftwareForOctophonicComposition.pdf` §1.
> *Why it matters*: the cookbook's constant-power recipe uses `sqrt~`. This is the cheaper form Dobrian actually ships, and it bends into other curves (lobes, S-curves) just by changing the phase offset. Better still, use `pan~` itself.

> **[PROMOTION-CANDIDATE] The `mc.` panners output one MC cord per *speaker*, with one channel per *voice*. Every outlet needs `mc.mixdown~ 1` before `dac~`.**
> `mc.pan~`, `mc.octopan~` and the rest take an N-voice MC signal plus MC control signals (one channel per voice). Each outlet is an N-channel cord holding every voice's feed for that speaker. The examples sum each outlet with `mc.mixdown~ 1` (the `polysimpleFM~` help adds `@autogain 1`). They build per-voice controls with `mc.sig~ @chans N` plus `mc.target`, or with `mc.list~`. For plain stereo, Max's own `mc.stereo~` pans and sums into one 2-channel cord. Dobrian's article says it implements `pan~`'s algorithm. Its refpage is an empty stub, so its law is unverified.
> *Source*: `examples/circularharmonics.maxpat` (subpatcher `octamixdown~`), `help/noiseband~.maxhelp`, `help/kinky~.maxhelp`, `help/polysimpleFM~.maxhelp`, `patchers/mc/*README*.html`; PDF §1.
> *Why it matters*: the mixdown stage is the step people miss. Without it, each speaker outlet is still N voices on N channels, not the one mono feed per speaker that the plain panners give. What `dac~` does with an unmixed MC cord was not tested here.

> **[PROMOTION-CANDIDATE] For overlapping notes that each need their own place in space, pan inside the voice, not after the mix.**
> One panner after the mix moves every sounding note at once. Dobrian gives each note a fixed location. The panner sits inside a `poly~` voice (`octosampler~`, `noisebandstereo~`, `surroundstereosampler~`), or a voice patch in `mc.poly~` is followed by an `mc.` panner. Inside `poly~` the position is set by message at note start, so notes that overlap keep different locations. The article argues that such fixed per-note positions give hocket and antiphony effects, and cost less to compute than sample-by-sample motion.
> *Source*: `patchers/synths/*README*.html`, `help/octosampler~.maxhelp`, `help/noisebandstereo~.maxhelp`; PDF §6.1.
> *Why it matters*: "pan each note" is a common request. The design choice (panner per voice, not per mix) decides whether it is possible at all.

> **[PROMOTION-CANDIDATE] Use MC *inside* a patch to run one formula N times, instead of copying the formula N times.**
> `hexapan~` has six hand-copied gain chains, and `mc.octopan~` has eight. The plain `octopan~` has one. `mc.list~ 0. 0.125 0.25 … 0.875` holds the eight speaker angles as an 8-channel signal. One `mc.-~`, `mc.pong~ 1 -0.5 0.5` (wrap the angle difference), `mc.clip~`, `mc.cycle~` and `mc.*~ @chans 8` then compute all eight gains at once. `mc.unpack~ 8` splits them to eight ordinary outlets. `octopan2~` is the same patch with a different `mc.list~`.
> *Source*: `patchers/octopan~.maxpat` vs `patchers/hexapan~.maxpat` and `patchers/mc/mc.octopan~.maxpat`; `misc/octopan2~.maxpat`.
> *Why it matters*: any per-speaker, per-band or per-step calculation with a table of constants fits this shape. One edit fixes all copies, and changing the table changes the layout.

> **Spread is not constant-power: it makes octophonic and hexaphonic panning louder.**
> `octopan~` widens each speaker's lobe from 45° to 180° as spread goes from 0 to 1, and a sound at the lobe center stays at full gain. Calculated from the patch, total power rises about +3 dB at spread 0.333, +4 dB at 0.5 and +6 dB at 1. `hexapan~` rises about +4.8 dB at 1. Only spread 0 is truly "constant intensity".
> *Source*: `patchers/octopan~.maxpat` (`*~ 0.375`, `mc.clip~`, `mc.cycle~` chain), `patchers/hexapan~.maxpat`.
> *Why it matters*: automating spread makes a sound swell. Pair spread with a matching gain cut if level should stay put.

> **`pan~` does not clip its position. Values below 0 or above 1 flip a channel's polarity.**
> The position goes straight into the `cycle~` phase, so 1.5 gives a negative gain on one side. Dobrian's test patch says so and suggests `clip~`, wrapping with `pong~`, or taking the fractional part.
> *Source*: `tests/testpan~.maxpat`, `patchers/pan~.maxpat`.
> *Why it matters*: LFOs, `perturb` offsets and `mc.` control math easily overshoot 0-1. Clip before `pan~`, `panLRFB~`, `pan2x4~` or `cubepan~`. The angle-based panners (`quadpan~`, `octopan~`) wrap on purpose, so there overshoot is safe.

> **`mix~` and `mixS~` crossfades add to 1 in amplitude, not power. Unrelated sounds dip about 3 dB at the midpoint.**
> `mix~` computes a + (b − a) · x, one multiply instead of two. `mixS~` uses (1 + cos πx)/2 and its complement, which is smoother near the ends but is still 0.5 each at the middle. For an equal-loudness crossfade, feed `sig~ 1.` into `pan~` and use its two outputs as the gains for the two sources.
> *Source*: `patchers/mix~.maxpat`, `patchers/mixS~.maxpat`, `help/mixS~.maxhelp`; PDF §5.
> *Why it matters*: "use mixS~ for smooth crossfades" is right about the shape and wrong about loudness. Choose by the material. Two takes of the same sound suit `mix~`; two different sounds suit the `pan~` law.

> **`delay~` with a signal delay time does interpolate, so a distance → delay chain gives real Doppler shift. Its buffer is sized in samples, so the reach depends on sample rate.**
> `dopplerd~` multiplies meters by 2.915452 ms (343 m/s), converts to samples and drives `delay~`'s signal delay inlet. The `delay~` refpage says "Signal-based delay uses interpolation". `@maxdelay` (default 48000 samples) goes to `delay~` as `maxsize`: 343 m at 48 kHz, but only about 171 m at 96 kHz. `mc.dopplerd~` sends its argument to `mc.delay~` as `maxdelay`, which `mc.delay~`'s refpage does not list. Its buffer probably stays at 48000 (untested in Max).
> *Source*: `patchers/dopplerd~.maxpat`, `patchers/mc/mc.dopplerd~.maxpat`, `examples/dopplerdemo.maxpat`; C74 `delay~.maxref.xml`, `mc.delay~.maxref.xml`.
> *Why it matters*: `scans/cookbook/cookbook_insights.md` calls `delay~` "integer-sample-only". That holds for int delay times, not signal ones. For long virtual distances at high sample rates, raise `@maxdelay`.

> **[PROMOTION-CANDIDATE] In a multichannel piece, put a routing matrix just before `dac~`, so the venue's speaker numbering never touches the composition.**
> `IOmap~` is `matrix~ 8 8 0 @ramp 100`. `patchbay` is a `matrixctrl` in a bpatcher, with a `pattr` that saves the grid in the parent patch. The `circularharmonics` example sends `patchbay` a list that folds odd and even speakers to left and right for stereo listening. `IOrouter8to2dd~` gives a better headphone preview, with rear channels darkened. `IOmap~` starts with nothing connected, so something must send routing on load.
> *Source*: `patchers/IOmap~.maxpat`, `patchers/patchbay.maxpat`, `help/IOmap~.maxhelp`, `examples/circularharmonics.maxpat` (subpatcher `"Listen As:"`); PDF §5.
> *Why it matters*: remapping inside the panners means editing the piece for every hall. One matrix stage in front of the dac makes it a settings change, and it doubles as a stereo check.

> **[PROMOTION-CANDIDATE] No Panning Tools name clashes with a Max 9 object, but its generic names still carry a shadowing risk, and `mc.pan~` is not the MC Wrapper.**
> None of the 60 names (`pan~`, `mix~`, `panstereo~`, …) is in Max 9's `obj-qlookup.json`, in a bundled package's registry, or in another installed package (checked 2026-09-16). Two risks remain. The abstractions load each other by name (`panLRFB~` contains `pan~`, `surroundstereo~` contains `octopan~`), and a Project's own files load before the search path. So a student's `pan~.maxpat` would silently replace Dobrian's inside every quad, cube and polar panner. And typing `mc.pan~` loads Dobrian's file, not an MC Wrapper. The MC Wrapper only wraps an existing MSP object (`mc.xxx~` for `xxx~`), and Max has no `pan~`.
> *Source*: `patchers/panLRFB~.maxpat`, `patchers/cubepan~.maxpat`; C74 `interfaces/obj-qlookup.json`; userguide `projects.json` ("Project-specific elements are loaded before any other files on the Max search path"), `mc/mc_wrapper.json`.
> *Why it matters*: don't name user patches after package abstractions. Don't expect wrapper features on `mc.` abstractions, and check `obj-qlookup.json` before assuming an `mc.` name is Cycling '74's.

> **The package says Max 8, but two misc objects need Max 9.**
> `package-info.json` gives `max_version_min` 8.0. `IOrouter8to2dd~` uses `abl.dsp.darkhall~`, from the ableton-dsp package, which itself requires 9.0. `circularXYslider` draws with `v8 @embed 1`. `octopan~` needs MC objects (`mc.list~`, `mc.unpack~`) even in its non-MC form.
> *Source*: `package-info.json`, `misc/IOrouter8to2dd~.maxpat`, `misc/circularXYslider.maxpat`, `patchers/octopan~.maxpat`; C74 `packages/ableton-dsp/package-info.json`.
> *Why it matters*: a package's stated minimum version is a claim, not a check. Look inside the abstractions before promising a patch will run on an older Max.

> **Four refpages in the package disagree with their patches or file names.**
> `docs/mc/mc.distance2D~.maxref.xml` declares `name="mc.distance3D~"` (four inlets, not six). `docs/mc/mc.panstereo~.maxref.xml` declares `name="panstereo~"`. `surroundstereo~`'s refpage places speaker 1 at 22.5° left of front, but the patch uses plain `octopan~` (speaker 1 center-front) and the help says center-front. `gainsimple~`'s refpage lists signal/float for the gain inlet, but the patch routes it through `t f f`, so floats only.
> *Source*: `docs/mc/mc.distance2D~.maxref.xml`, `docs/mc/mc.panstereo~.maxref.xml`, `docs/surroundstereo~.maxref.xml`, `patchers/surroundstereo~.maxpat`, `help/surroundstereosampler~.maxhelp`, `patchers/gainsimple~.maxpat`.
> *Why it matters*: trust the patch over the refpage for these four. Claude2Max's `RefpageCache` looks refpages up by file name and returns the right port counts (checked 2026-09-16: `mc.distance2D~` 4 in, `mc.distance3D~` 6 in). Any tool that keys refpages by their `name` attribute instead would mix up those two pairs.

## mat.oo (Matthew Aidekman)

> **mat.oo replies go only to the most recent caller, so a method must answer within the same message chain.**
> `mat.oocall` puts its own `#0` number in front of the message and sends it with `forward` to `<name>.trigger`. `mat.oomethod` splits the number off and stores it in a `prepend` with a `set` message. It then prepends that number to whatever enters its inlet and sends it to `<name>.return`, where each caller's `route #0` keeps only its own reply. Only one return address is stored. If a `delay`, `pipe` or `deferlow` sits in the method and another call arrives first, the reply goes to the wrong caller. The package example warns: "Don't use delays or defer in your methods. One message in, one message out."
> *Source*: `externals/mat.oocall.maxpat`, `externals/mat.oomethod.maxpat`, `examples/mat.oo.ex1_podularizingCode.maxpat`.
> *Why it matters*: methods that wait on audio, timing or a file will misroute replies. Keep them to immediate data work.

> **mat.oo method names are global: two methods with the same name both run and both answer.**
> Every `receive <name>.trigger` gets every call, so a caller's outlet fires once per same-named method, even across open patches. The package's own answer is per-instance names: inside an abstraction, `mat.oomethod #1.color`, loaded as `plasticCup joesCup`, answers `mat.oocall joesCup.color`.
> *Source*: `patchers/plasticCup.maxpat`, `patchers/beerStein.maxpat`, `examples/mat.oo.ex2_datastorage.maxpat`.
> *Why it matters*: this is the per-instance naming rule from CLAUDE.md applied to mat.oo. A method inside any abstraction that is loaded twice needs `#1.` (or `#0`) in its name.

> **`@parent` has two traps: numeric parents vanish, and the parent follows the argument, not the switched method name.**
> `mat.oocall` stores the parent in `v #0.parent` and passes it through `route int`. Only the non-int outlet is wired, so `@parent 3` is silently dropped; use symbols. It sends the parent to `send #1.parentReceive`, which uses the box's typed argument. After the middle inlet switches the call to another method, the call goes there but the parent still goes to the original name. The parent arrives at the method's right outlet before the arguments reach the left outlet, because the `t b` branch sits to the right of `forward`.
> *Source*: `externals/mat.oocall.maxpat`; `examples/mat.oo.ex5_loadingMethodsOnce.maxpat` (uses `@parent` only on a fixed-name call). Read from the patch, not tested in Max.
> *Why it matters*: if a shared method acts on the wrong object or on none, check the parent's type and whether the call was retargeted.

> **For shared *data*, Max's named objects already reply to the box that asked. mat.oo earns its place only when code sits between the question and the answer.**
> A bang into any `value <NAME>` box sends the stored value out of that same box (refpage: "You can get the contents out of a particular value object by sending it a bang"). `coll <NAME>` and `dict <NAME>` also share one store and answer queries from their own outlet. Examples 2 and 3 wrap `v` and `coll` in methods. That adds a network hop for plain storage, but it becomes worthwhile when the method runs logic (ex1 `tonalize`, ex5 `drink`). mat.oo itself is about twenty boxes around `forward`, `receive`, `prepend #0` and `route #0`, so the same request-and-reply pattern can be built natively.
> *Source*: `examples/mat.oo.ex2_datastorage.maxpat`, `examples/mat.oo.ex3_objectMethods.maxpat`, `externals/mat.oocall.maxpat`; C74 `value.maxref.xml`.
> *Why it matters*: follow *Don't Add an Object That Duplicates What an Object Already in the Patch Does*. Reach for a named `value` / `coll` / `dict` first, and for mat.oo when many places must run one piece of logic and get its result.

Each entry was read out of the package's own patches, not only its prose.

## ABL Effect Modules

> **[PROMOTION-CANDIDATE]** **For a student patch that needs a finished effect with knobs, an `Abl.*~` module is a better default than building one from primitives.** Each module is Live's DSP (from Max's bundled ableton-dsp package) plus a panel, factory presets, a click-free on/off, meters, and parameters that Snapshots and automation can see. Examples are `Abl.DarkHall~` or `Abl.PlateReverb~` for reverb, `Abl.Delay~` for delay, `Abl.Compressor~` / `Abl.Limiter~` for dynamics, and `Abl.ChannelEQ~` for EQ. Building the same thing yourself means `tapin~`/`tapout~` plus a feedback loop and filter, or a bare `abl.*` object plus hand-built UI. The primitives stay the right choice when the point is to learn or change how the effect works, when a patch (not a person) controls it, or when the machine runs Max older than 9.1.2 (`package-info.json` `max_version_min`).
> *Source*: `extras/ABL Effect Modules.maxpat`, `examples/Abl.Reverbs.maxpat`, `patchers/Abl.Delay~.maxpat` (a `p Effect~` holding only `abl.device.delay~`).
> *Why it matters*: the preferred-objects table in `CLAUDE.md` names `bp.Gigaverb` for reverb and `tapin~`/`tapout~` for delay, and has no row for compression or limiting. The ABL modules fill that gap with a better-sounding, more complete default.

> **[PROMOTION-CANDIDATE]** **A module's modulation inputs run at control rate. Signal-rate modulation needs the bare `abl.*` object and its `@ins` inlets.** Inside every module, `snapshot~` driven by `qmetro 30` samples the modulation cord. The value goes to the chosen dial as `rawfloat` (0.–1. across the parameter's whole range). So an LFO faster than about 15 Hz, or an envelope with a sharp attack, is smeared or aliased. The bare objects take signals directly: the default inlets (for instance `abl.dsp.chorus~` inlets 2–4 are rate, mod, feedback), plus any float attribute you add with `@ins`. `@ins` can only be set in the box text, never later. While DSP is on, a connected signal locks out messages to that attribute.
> *Source*: `patchers/Abl.Chorus~.maxpat` (`p ModIn~`); the "Dynamic inlets" tab of Max's `packages/ableton-dsp/extras/Ableton DSP Objects.maxpat` (the bundled package, not this one).
> *Why it matters*: "modulate this parameter" can mean patch cords into a module, or a signal into an `abl.*` inlet. Only the second is audio-rate. Pick by the modulation speed you need.

> **[PROMOTION-CANDIDATE]** **A click-free bypass that also saves CPU is three objects: `adsr~`, `mute~` and `pass~`.** Feed the on/off value into `adsr~ 10 0. 1. 10` and crossfade dry and wet with its envelope (`*~`, `!-~ 1.`, `+~`). Also route `adsr~`'s mute outlet (outlet 2) through `route mute` into `mute~`, and connect `mute~` to the subpatcher that holds the effect. Put `pass~` (or `mc.pass~`) before that subpatcher's signal outlet so it outputs zeros, not noise, while muted. A switched-off effect then fades out in 10 ms and uses no DSP. AudioMix does the same with `adsr~ 10 0 1 10` → `route mute`, but sends `disable $1` to `vst~` and `active $1` to `amxd~` instead of using `mute~`.
> *Source*: `patchers/Abl.Chorus~.maxpat` (`p Active~`, `p Effect~`, top-level `r #0-Mute` → `mute~`); AudioMix `patchers/AudioVSTEffect.maxpat` (`p Active~`).
> *Why it matters*: `patching/MAX_PATCHING.md` teaches `adsr~`'s mute output only for `poly~` voices through `thispoly~`. The same outlet gives any bypassable effect section a glitch-free, CPU-free off state.

> **[PROMOTION-CANDIDATE]** **The object-name check misses names that are defined only in a package's `init/*.txt` file.** A line such as `max objectfile mc.abl.dsp.chorus~ mc.wrapper~ abl.dsp.chorus~;` creates a real, loadable object that has no refpage and no `obj-qlookup.json` entry. Two cases here: ableton-dsp's `init/abl-dsp-mc.txt` defines all 59 `mc.abl.dsp.*~` wrappers, and this package's `init/Abl.EffectModulesInit.txt` defines `mc.pass~`, which every module uses and Max itself does not define. Running `build_resolver([]).resolve_object()` from `spec2maxpat.py` returns `None` for both `mc.abl.dsp.chorus~` and `mc.pass~`, so the verifier would call them invented names. The reverse also happens: `mc.send~` and `mc.receive~` are missing from `obj-qlookup.json` but resolve through their refpages and `C74/init/audio-objectmappings.txt`.
> *Source*: `init/Abl.EffectModulesInit.txt`; Max's `packages/ableton-dsp/init/abl-dsp-mc.txt`; resolver run on 2026-09-16.
> *Why it matters*: the "Prefer the tool's own registry" rule treats `obj-qlookup.json` as complete, and it is not. Harvesting `max objectfile` lines from `C74/init` and every package's `init/` folder closes the gap mechanically. Separately, anyone copying a module's inside into a patch on a machine without this package gets a red `mc.pass~` box.

> **[PROMOTION-CANDIDATE]** **A deliberately global name inside a copied thing is correct when the copies are *meant* to share it, as with a clipboard.** Everything inside an ABL module uses `#0-` names (`s #0-Active`, `r #0-Mute`), except the Copy/Paste store: `coll Abl.Chorus`. That name is the same in every `Abl.Chorus~`, so Copy in one instance and Paste in another moves the whole state across. That sharing is the feature.
> *Source*: `patchers/Abl.Chorus~.maxpat` (`p Copy`: `pattrstorage` dump → `prepend store` → `coll Abl.Chorus`; `r #0-Paste` → `dump`).
> *Why it matters*: `CLAUDE.md`'s "Every Global Name Inside a Copied Thing Is Per-Instance" rule should name its one legitimate exception, a store that instances share on purpose. Otherwise someone "fixing" the rule's violations would break Copy/Paste.

> **Factory presets can live inside an abstraction with no preset file on disk.** Each module's `pattrstorage <Name> @autorestore 0 @savemode 0` has `parameter_enable` on. Its whole slot bank is saved as the object's `parameter_initial` inside the `.maxpat`. `@autorestore 0` stops it looking for an XML file on load, and `@savemode 0` stops the "save presets?" prompt when the patch closes. `recall <n>` then works in any copy with nothing else installed. The JSON copies in `misc/` are for `read`/`write` only.
> *Source*: `patchers/Abl.Chorus~.maxpat` (the `pattrstorage Abl.Chorus` box's `saved_attribute_attributes`); `misc/Abl.Chorus.json`.
> *Why it matters*: a Claude2Max abstraction or teaching patch that ships presets can be self-contained, matching the repo's "a patch must carry everything it needs" principle for scripts.

> **One inlet can accept either a mono MSP cord or a stereo MC cord with `mc.resize~ 2 @replicate 1`.** Every module's audio inlet goes through this before processing. A single channel is copied to both sides, and a 2-channel cord passes unchanged. The refpage: with `replicate` 1, "input channels will repeat, cyclically if necessary". The matching output is one 2-channel MC cord, which needs `mc.unpack~ 2` before any plain MSP object.
> *Source*: `patchers/Abl.Chorus~.maxpat` (`p Dual~`); `examples/Abl.Interface.maxpat` ("A mono audio signal (MSP) in the first inlet is converted into a dual-mono audio signal (MC)").
> *Why it matters*: it is the smallest way to make a stereo abstraction tolerant of a mono source. It also explains why an ABL module's outlet will not plug into `dac~` directly.

> **Mono `abl.dsp.*~` objects are run twice for stereo, and one of them is summed to mono instead.** `abl.dsp.compander~`, `abl.dsp.dfm~`, `abl.dsp.filther~`, `abl.dsp.transientdesign~` and `abl.dsp.vowel~` process one channel, so the modules run two copies after `mc.unpack~ @replicate 1`. `abl.device.reverb~` takes one input and makes pseudo-stereo, so `Abl.PlateReverb~` sums L+R through `*~ 0.5` first, and the plate loses the input's stereo image. The Hybrid Reverb modules (`Abl.DarkHall~`, Prism, Quartz, Shimmer, Tides) take true stereo.
> *Source*: `patchers/Abl.Compander~.maxpat`, `patchers/Abl.PlateReverb~.maxpat` (`p Effect~`).
> *Why it matters*: when using the bare objects, read the refpage's inlet list before wiring stereo. The repo's `reverb-shootout.maxpat` already feeds `abl.device.reverb~` a mono downmix, which agrees with this.

> **A module works as an object box too: name it with `@name` and open it with `open`.** Typing `Abl.Chorus~ @name MyChorus` gives a 4-inlet object with no visible panel. `open` in the rightmost inlet shows the panel in a floating window titled MyChorus. `; MyChorus Feed 0.5` then sets it from anywhere. `getclientlist` prints every parameter name out of the rightmost outlet. Inside a Max for Live device, the modules' `live.*` parameters become the device's parameters. `mcs.amxd~` then takes `Decay 0.8` directly, and `getparams` lists the names.
> *Source*: `examples/Abl.ObjectBox.maxpat`, `examples/Abl.Presets.maxpat`, `examples/Abl.MaxForLive.maxpat`, `devices/Abl.Droner.amxd`.
> *Why it matters*: a patch built by a spec can use a module as a compact object box and still give the student its panel on demand. `Abl.Droner.amxd` loads its modules as plain bpatchers. The device file holds only its patcher, and its dependency list points at the package folder, so it does not look frozen. Expect it to break on a machine without the package.

> **A custom panel can follow Max's colour theme with `themecolor` and `universal 1`.** `Abl.FxColors` reads the theme colours (`themecolor "Object Accent Color"`, `"Object Background Color"`, …) and outputs messages such as `live.dial activedialcolor $1 $2 $3 $4`. Each module sends them into `universal 1`, which sets that colour on every object of that class in the module and its subpatchers. Switching the module off swaps some of those colours for others, which makes the panel look dimmed.
> *Source*: `examples/Abl.FxColors.maxpat` (loaded by every module even though it sits in `examples/`); `patchers/Abl.Chorus~.maxpat` (`Abl.FxColors` → `universal 1`).
> *Why it matters*: when a Claude2Max presentation should look right in both light and dark themes, reading the theme at load time beats hard-coded RGBA values.

## AudioMix

> **Stereo blocks that pass audio through and add their own sound stack into a channel strip with no mixer object.** Every AudioMix block has L/R inlets and L/R outlets. Sources (`AudioInput`, `AudioPlayer`, `AudioReceive`) add their sound to the incoming pair with `+~`. Sinks (`AudioOutput`, `AudioRecord`, `AudioSend`) pass the pair on unchanged. So Player → Mix → Send → Output is one straight column of two cords. The whole desk is copies of that column, and the "Audio Track …" snippets are those columns pre-wired.
> *Source*: `examples/AudioMix.WhatIsInside.maxpat` ("the modules all have an internal audio thru connection"); `patchers/AudioInput.maxpat` (`p Input~`); `snippets/Audio Track Player.maxsnip`.
> *Why it matters*: a good pattern for any strip of Claude2Max abstractions, with every stage keeping the same ports. Today, build it on one MC cord (as the ABL modules do) rather than two separate L/R cords.

> **`autopattr` plus `patcherargs` makes every control in an abstraction scriptable, three ways, with no routing code.** Give each control a scripting name and put `autopattr` in the abstraction. Then (a) `gain -6` into the messages inlet sets the control named `gain`, (b) `@gain -6` on the box sets it at load (patcherargs outlet 1 → `autopattr`), and (c) the first argument, through `prepend set` → `receive`, becomes a remote name, so `; MySend gain -6` works from anywhere. A fixed `receive <AbstractionName>` adds control of every instance at once. `get<name>`, `getstate` and `getattributes` report from the dumpout outlet.
> *Source*: `patchers/AudioSend.maxpat`; `examples/AudioMix.Remote.maxpat` (`AudioSend MySend @bus 3 @gain -3`, `getgain`, `; MyEQ-eq lo -12.`).
> *Why it matters*: it replaces a `route`/`prepend` tree per parameter, and the box attributes document the starting values in the parent patch.

> **A crossfade or pan law can be two `cycle~` objects used as cosine tables.** AudioMix's pan and crossfaders scale the control from -50..50 to 0..0.25 with `scale -50. 50. 0. 0.25`, smooth it with `line~`, and drive the phase inlet of one `cycle~` directly and of a second through `+~ 0.75`. With no frequency set, each `cycle~` outputs the cosine of its phase. That gives cos and sin curves whose squares sum to 1, which is constant power.
> *Source*: `patchers/AudioMix.maxpat` (`p Pan~`, commented "Adjust a stereo image using a constant-power function"); `patchers/AudioXfaderIn.maxpat` (`p Xfade~`).
> *Why it matters*: it is an alternative to the `sqrt~` constant-power recipe already in `scans/cookbook/cookbook_insights.md`. It does not need `sig~ 1.` / `-~` for the complement, and the curve is exactly sine/cosine.

> **Free-text group names fail silently on a typo, as `@type geneic` shows.** `AudioMix @type <symbol>` puts strips into solo groups by building receive names like `<type>-solo`. The package's own Desk example gives six input strips `@type geneic`, so they form a group apart from any default `generic` strip, and nothing warns. The same goes for AudioSend2/AudioReceive2 bus names typed into `textedit` fields.
> *Source*: `examples/AudioMix.Desk.maxpat` (bpatcher args); `patchers/AudioMix.maxpat` (`p Solo&Active~`: `route type` → `sprintf set %s-solo`).
> *Why it matters*: when names are how things connect, offer a menu of choices (as `AudioSend`'s A–Z `live.menu` does) rather than free text. This backs the repo's rule against `textedit` for set-once values.

## MC Movement Studies

> **[PROMOTION-CANDIDATE]** **Name one busy map and hang every MC object of a voice system on it: `mc.voiceallocator~ <n> @name NAME` plus `@bzname NAME` on each MC object downstream.** The allocator hands out channels; the named busy map lets every MC object with the same `bzname` skip idle channels. Feed the voice's own output back into the allocator's left inlet to hold a voice until it finishes: `db.mc.oneshotphasor~` wires `mc.line~ @bzname NAME → mc.<~ 1 @bzname NAME → mc.voiceallocator~`, so the channel is freed when the ramp reaches 1. Two systems in one patch use two names (`forces` and `sound` in the attraction study). Set the name with `@name`: `db.mc.oneshotramp~` types `mc.voiceallocator~ #1 #2`, and the refpage documents only one argument (voice count), so that name is probably never applied.
> *Source*: `patchers/shared/db.mc.oneshotphasor~.maxpat`, `patchers/shared/db.mc.oneshotramp~.maxpat`, `patchers/db.mc.attraction/db.mc.attraction.maxpat`.
> *Why it matters*: this is how to do MC polyphony without `poly~` and without paying CPU for silent channels. `patching/MAX_PATCHING.md` names `mc.voiceallocator~` but says nothing about busy maps or `bzname`.

> **A delay time can jump without clicks if two delay lines crossfade and each takes its new time only while it is silent.** `db.mc.clicklessdelay~` feeds one input to two `mc.tapin~ 5000` / `mc.tapout~` pairs. A `cycle~` scaled to 0–1 is the gain of one line, and `!-~ 1` of it the gain of the other. Each line's delay time passes through `mc.sah~ 0.0001` triggered by that line's gain, so it samples the new time just as the gain rises from zero. A new time is heard within one crossfade cycle.
> *Source*: `patchers/shared/db.mc.clicklessdelay~.maxpat`.
> *Why it matters*: sequenced or randomized delay times on a plain `tapout~` click. This is the two-line fix, and it works the same in single-channel MSP.

> **Inside `mc.gen~`, `mc_channel` bridges an MC signal and a buffer: each channel reads or writes its own sample index.** The codebox `Buffer input; if (delta(in1)) { input.poke(in1, mc_channel-1); }` writes channel N into sample N-1. `Buffer output; out1 = output.peek(mc_channel-1);` in an `mc.gen~ @chans N` reads it back as N channels. The first version also outputs a `changed` flag; `mc.mixdown~ 1 → >~ 0` turns it into one trigger, so the expensive network runs only when some input moved. The `Buffer` names are set by messages such as `input #0input`.
> *Source*: `patchers/db.geneural/db.mc.geneural~.maxpat` (the three `mc.gen~` boxes and their `genbackups` copies).
> *Why it matters*: the pattern turns a per-channel control signal into an indexed table that one `gen~` can loop over, and back. `patching/GEN_PATCHING.md` has the buffer-as-config-table idea but not the `mc_channel` bridge.

> **An MC signal can be written into a Jitter matrix, one cell per channel, from inside the signal chain.** `mctomatrix`: `count~ 0 N` counts 0 to N-1 sample by sample; `mc.sig~` sent `spread 0 N` holds each channel's own index (the MC userguide says `spread` includes the first value and excludes the second, so the channels read 0 to N-1); `mc.==~` of the two lets exactly one channel through per sample; `mc.mixdown~ 1` merges them; `jit.poke~ MATRIX @plane P` writes the value at the cell index from `count~`. Sample k of the merged signal is channel k.
> *Source*: `patchers/db.mc.attraction/mctomatrix.maxpat` (credited to Timo Hoogland), used in `db.mc.attraction.maxpat` > `OscillatorAttraction` > `mctojit`.
> *Why it matters*: drawing many MC control channels with `jit.gl.multiple` needs a matrix. This avoids a `snapshot~` per channel.

> **A wavetable file becomes a bank of per-channel waveforms with `polybuffer~`, `jit.buffer~` and `mc.target`.** `db.wavetable2polybuffer NAME 256` loads the file into a `buffer~`, adds one empty buffer per frame with `appendempty`, and copies each 256-sample slice through `jit.buffer~` (`outputfirst`, `outputlast`, `output`) into `NAME.1`, `NAME.2`, ... (the `polybuffer~` refpage fixes that naming). The study then sends `set NAME.<i>` through `mc.target` so each `mc.wave~` channel plays a different frame.
> *Source*: `patchers/shared/db.wavetable2polybuffer.maxpat`, `patchers/db.mc.wavetable/db.mc.wavetable.maxpat` > `p simple` > `p randomwaveforms`.
> *Why it matters*: wavetable synthesis with a different frame per voice, and no sample-by-sample copying in JS.

> **One `mc.poly~` can run a different patcher in each voice.** The dynamicpoly study creates `mc.poly~ poly_dummy 2` and sends `patchername poly_evolve.maxpat poly_gradient.maxpat`. The `poly~` refpage: the attribute "can load different patchers on different voices". Voice 1 runs `mc.evolve~ 16`, voice 2 `mc.gradient~ 16`, both driven by the same `multirange` breakpoints so they can be compared on scopes.
> *Source*: `patchers/db.mc.dynamicpoly/db.mc.dynamicpoly.maxpat`, `poly_evolve.maxpat`, `poly_gradient.maxpat`.
> *Why it matters*: side-by-side A/B comparisons, or a layered instrument, fit in one `mc.poly~` instead of two parallel chains.

> **Scale the mix by 1/√(active voices) so the level stays steady as MC voices come and go.** The particlegrains study reads its busy map as a signal (`mc.sig~ @chans 64 @bzname sound → mc.mixdown~ 1`), which the patch labels "Get # of channels active", then `sqrt~ → !/~ 1 → rampsmooth~ 800 800` for the gain. The attraction study does the same at message rate with `zl.sum → expr 1 / sqrt($f1)`.
> *Source*: `patchers/db.mc.particlegrains/db.mc.particlegrains.maxpat` > `p voicing`; `patchers/db.mc.attraction/db.mc.attraction.maxpat` > `OscillatorAttraction`.
> *Why it matters*: `mc.mixdown~ @autogain 1` scales by the channel count, not by how many are sounding. With zero active voices `!/~ 1` divides by zero, so guard it.

> **Pitfall: this package reuses abstraction names and global names across studies.** `gui.main` exists four times with four different contents, and `ltomc` three times. Two abstractions in `shared/` call `ltomc`, which is not in `shared/`. Several studies hard-code the same global names: `pattrstorage presets` (cellularautomata, particlegrains, simplevox, wavetable), busy map `sound` (attraction, magnetism, particlegrains), and `buffer~ source`, which loads `duduk.aif` in cellularautomata and `FemVoice.aif` in particlegrains. The geneural abstractions get it right with `#0input`, `#0weights`, `dict #0learningset`. The Max docs do not say which same-named file loads first.
> *Source*: `patchers/*/gui.main.maxpat`, `patchers/*/ltomc.maxpat`, `patchers/shared/db.mc.stereodelay~.maxpat`, `patchers/db.geneural/db.geneural.maxpat`.
> *Why it matters*: a C74-shipped illustration of the repo rules *A Reusable Object Has One Home on the Search Path* and *Every Global Name Inside a Copied Thing Is Per-Instance*. Open both of those studies at once and they share one `source` buffer.

## JitLygia

> **[PROMOTION-CANDIDATE]** **Since Max 9.1 a JXS shader can `#include` GLSL files by Max path, so a shader library replaces copy-pasted functions.** JitLygia's ports write `#include "Package:/JitLygia/lygia/generative/fbm.glsl"` in the fragment program. The `jit.gl.shader` refpage says the includer accepts Max path prefixes and relative paths, relative to the shader file (or to the patch when the shader is embedded). LYGIA's own files include their dependencies relatively, so one line is enough. The package needs Max 9.1 (`package-info.json`).
> *Source*: `code/jxs/*.jxs`; `extras/JitLygia.maxpat` (comment "relies on the shader include feature introduced in Max 9.1").
> *Why it matters*: `patching/JITTER_JS_PATCHING.md` says to prefer a `.jxs` shader for on-screen per-pixel work. With JitLygia installed, blur, noise, SDF shapes and colour tools are one include away instead of hand-written GLSL.

> **LYGIA options are `#define`s that must come before the `#include`.** Each LYGIA file sets its defaults inside `#ifndef` guards, so a macro defined after the include is silently ignored. Examples from the ports: `#define GAUSSIANBLUR_2D` (else the blur is 1D), `#define GAUSSIANBLUR_SAMPLER_FNC(TEX, UV) sampleClamp2edge(TEX, UV)` (edge handling), `#define EDGE_SAMPLER_FNC(TEX, UV) sampleClamp2edge(TEX, UV).r`, `#define SAMPLESMOOTH_POLYNOMIAL cubic`, `#define PALETTE_LERP_SIZE 8`. The options for each function are listed in the comment block at the top of its `.glsl` file.
> *Source*: `code/jxs/filter_gaussianBlur2D.jxs`, `code/jxs/filter_edge2D.jxs`, `code/jxs/sample_filter_smooth.jxs`, `lygia/filter/gaussianBlur.glsl`.
> *Why it matters*: a misplaced `#define` compiles cleanly and just gives the default behaviour, which looks like the option does nothing.

> **[PROMOTION-CANDIDATE]** **LYGIA (and any GLSL written for `sampler2D`) needs a non-rectangle texture; Jitter textures are rectangle by default.** The launch patch chains `jit.playlist` (`output_texture 1`) → `jit.gl.slab @rectangle 0` → the LYGIA `jit.gl.slab`, with the comment "examples require non-rectangular input". The `jit.gl.slab` refpage: with `rectangle` 1 (the default) the texture must be read with `sampler2DRect`; with 0 it is upsampled to a power of two and read with `sampler2D`.
> *Source*: `extras/JitLygia.maxpat`; every `code/jxs/*.jxs` that declares `uniform sampler2D u_tex0`.
> *Why it matters*: a sampler mismatch does not name itself the way a compile error does. Put `@rectangle 0` upstream whenever a shader declares `sampler2D`. What Max shows without it was not tested here.

> **The 50 `.jxs` files in `code/jxs/` are LYGIA's example demos, not ready-to-use effects.** Most split the screen to compare settings, print numbers with `digits`, and hardcode values: `color_brightnessContrast.jxs` sets brightness by which half of the screen a pixel is in. Only `u_mouse`, `u_tex0` and a few scene uniforms are exposed as `<param>`s. To make a usable effect, copy one, delete the demo code, and add a `<param name=... type=... default=... />`, a `<bind param=... program="fp" />` and a `uniform` for each control. Then drive it with the slab's `param <name> <value>` message.
> *Source*: `code/jxs/color_brightnessContrast.jxs`, `code/jxs/filter_gaussianBlur2D.jxs`, `code/jxs/draw_shapes.jxs`.
> *Why it matters*: loading one of these with `@file` and expecting a blur gives a striped test image instead.

> **The ports size their coordinates from input texture 0: `u_resolution` is `state="TEXDIM0"` and `st = gl_FragCoord.xy / u_resolution`.** `gl_FragCoord` is in output pixels, so this only lines up when the slab's output is the same size as its input, which `jit.gl.slab`'s `adapt` attribute (default 1) ensures. The generator ports (`generative_fbm.jxs`, `draw_shapes.jxs`) use the same line even though they read no pixels, and the launch patch always feeds them a texture.
> *Source*: `code/jxs/generative_fbm.jxs`, `code/jxs/filter_gaussianBlur2D.jxs`; the JXS state table in Max's userguide (`jitter/jxs_file_format`: `TEXDIM0-7` "Texture dimensions", `TIME` "time in seconds since program compilation").
> *Why it matters*: turning `adapt` off or setting a `dim` different from the input stretches or crops these shaders. Keep a texture connected to generator ports, or change the `u_resolution` line.

> **A `umenu` can list a package folder by path, and a bare shader name loads through the search path.** The launch patch uses `umenu @autopopulate 1 @prefix Package:/JitLygia/code/jxs/`, whose item output goes through `prepend read` into `jit.gl.slab`. Mouse input comes from `jit.world`'s third outlet: `route mouse → list.slice 2 → prepend u_mouse`. The slab's saved box text still reads `@file morphological_marchinSquares.jxs` after other files were loaded with `read`, so the typed text does not show the current shader.
> *Source*: `extras/JitLygia.maxpat` (`umenu`, `p mouse`, `jit.gl.slab`).
> *Why it matters*: a shader browser takes two boxes. Note that `list.slice` is registered in `init/max-objectmappings.txt` as `zl.slice`, not in `interfaces/obj-qlookup.json`.

> **LYGIA is not free for commercial work.** `LICENSE.md` is the Prosperity Public License 3.0.0: noncommercial use is free, commercial use gets a 30-day trial.
> *Source*: `LICENSE.md`.
> *Why it matters*: a student building a paid installation or product on JitLygia needs a LYGIA license.

## Gen CV Tools

> **[PROMOTION-CANDIDATE]** **In `gen~`, derive clocks from a phasor: `rate` divides or multiplies, `+ offset → % 1` shifts, and `phase < width` makes the pulse.** `CDM` takes a `phasor~` as its clock input. `rate @sync cycle` with `param Div @default 1` in its right inlet rescales the ramp; the refpage says multipliers below 1 give several ramps per input cycle, so `Div 2` halves the clock and `Div 0.5` doubles it. `@sync cycle` defers a ratio change to the next input cycle. `+ Shift*0.01 → % 1 → * 2 → - 1 → < (PW*0.02-1, clipped ±0.9)` gives an offset pulse with adjustable width.
> *Source*: `patchers/CDM.maxpat` (the embedded `gen~`), identical in `snippets/[SA] GCT - CDM.maxsnip`.
> *Why it matters*: `patching/GEN_PATCHING.md` has no clock idioms. A phasor clock stays sample-locked through division, shift and swing, which a chain of `metro`s cannot.

> **Per-tick probability in `gen~`: sample noise once per pulse with `sah`, then pass or block the whole pulse.** `CDM`: `noise → sah` (control = the pulse) `→ abs → < Probability*0.01`, and that result gates the pulse. Because `sah` samples only on the rising edge, the decision holds for the full pulse width, so a pulse is never cut in half.
> *Source*: `patchers/CDM.maxpat`.
> *Why it matters*: comparing fresh `noise` against the threshold every sample would chop each gate into random fragments.

> **A shift register in `gen~` updates its stages in a staggered order: the last bit first, the input bit last.** The clock edge becomes a short trigger (`noise → sah → change → abs`: nonzero only on the sample the held value changes). It fans out through `delay 1` … `delay 10`. Bit 8 `latch`es bit 7 on `delay 1`, bit 7 latches bit 6 on `delay 2`, and so on, and bit 1 takes the new value on `delay 10`. So no stage reads a neighbour that has already moved. The new bit comes from `selector 2`: recycle the old last bit (the loop), or a new random bit (`noise` scaled to 1–999 `< Probability*10`), chosen by a random draw against `Loop`.
> *Source*: `patchers/ShiftRegister.maxpat`.
> *Why it matters*: gen~ evaluates every operator each sample, so "shift everything on the clock" needs an explicit order. Staggered `delay`s are a readable way to get it.

> **Bug to avoid copying: the shift register's 8-bit DAC weights the top bit 124, not 128.** The bits are multiplied by `1, 2, 4, 8, 16, 32, 64` and `124`, summed, then `scale 0 255 0 1`. The largest output is 251/255, and some steps are uneven.
> *Source*: `patchers/ShiftRegister.maxpat` (`[* 124]`), same in `snippets/[SA] GCT - Shift Register.maxsnip`.
> *Why it matters*: pitch CV from this DAC is slightly off. Use `* 128`.

> **The Complex LFO is a phase-distortion sine, then a wavefolder, then sample-rate reduction.** The ramp `phasor*2-1` is bent around a movable midpoint (from `Shape`) with two `clip` + `scale` pairs, then `* pi → sin`. That result is multiplied by `1 + Fold` gain and folded with `fold -1 1`. `Degrade` sets the rate of a second `phasor`; each wrap (`delta → < 0`) triggers `sah`, and `selector 2` skips the `sah` when `Degrade` is 0. Knob curves use gen `scale`'s sixth input, the exponent (`scale 0. 100. 0. 100. 1.5`). The README calls the last stage a bit-crusher, but it holds samples; it does not reduce bit depth. `param Shape @min 0 Max 100` is missing an `@`, so its maximum is probably not set.
> *Source*: `patchers/LFO.maxpat`.
> *Why it matters*: three stages turn a single sine LFO into shaped, stepped modulation. The typo is a reminder that a gen `param` attribute without `@` fails silently.

> **Name `gen~` ports with `@comment` on `in` and `out`.** Every tool does it: `in 1 @comment ClockInput`, `out 1 @comment MainOut`, `out 10 @comment ClockOutput`, `out 2 @comment Bit 1`. The comments label the ports of the `gen~` box.
> *Source*: `patchers/ShiftRegister.maxpat`, `patchers/CDM.maxpat`, `patchers/LFO.maxpat`.
> *Why it matters*: this is the gen~ form of the repo rule that subpatcher inlets and outlets are labelled. A ten-outlet `gen~` is unusable without it.

## PGS-1

> **[PROMOTION-CANDIDATE]** **MPE into `poly~`: `mpeparse` outlet 9 into `poly~ @mpemode 1`, and `polymidiin` inside the voice.** `PGS1 MPE.amxd` wires `midiin → mpeparse @hires 1`. Its tenth outlet (index 9, `mpeevent` messages) feeds `poly~ MPE_pgs_voice 10 @steal 1 @target 0 @midimode -1 @mpemode 1`. The refpage: `mpemode` 1 makes `poly~` allocate voices from the voice argument of each `mpeevent`. Inside the voice, `polymidiin → midiparse @hires 1` gives that note's pitch bend, pressure and CCs as ordinary MIDI. The refpage documents `midimode` 1 (send MIDI to all voices); the value -1 used here is not described.
> *Source*: `patchers/Max Instrument/PGS1 MPE.amxd` (top patcher, and the frozen `MPE_pgs_voice.maxpat`).
> *Why it matters*: per-note expression without writing a voice allocator. The repo has nothing on `mpeparse` or `polymidiin`.

> **Pitfall seen in a Cycling '74 device: `---` names inside `poly~` voices are shared by all voices.** In both the Poly and MPE versions, each voice's `vca` patcher has `send~ ---adsr_1`, `send~ ---ar_1` and so on, and each voice's oscillator has `receive~ ---adsr_1`. The `receive~` refpage: it "adds them together and sends the sum". `---` makes a name unique per device, not per voice, so when an envelope is the modulation source, every voice hears the sum of all voices' envelopes. This comes from reading the files; it was not listened to.
> *Source*: `PGS1 MPE.amxd` frozen files `MPE_vca.maxpat` and `MPE_osc.maxpat`; `PGS1 Poly.amxd` `poly_vca.maxpat` and `poly_osc.maxpat`.
> *Why it matters*: a real example for the repo rule *Every Global Name Inside a Copied Thing Is Per-Instance*. A per-voice signal inside `poly~` needs `#0`, or a patch cord.

> **[PROMOTION-CANDIDATE]** **A frozen `.amxd` carries its dependencies inside the `ptch` chunk, and a tool that rewrites that chunk as one JSON deletes them.** In a frozen device the `ptch` payload starts with `mx@c`. It holds the top patcher JSON, then each dependency file in turn (patchers, `.js`, `.svg`, `.gendsp`), then a `dlst` directory of `dire` records (`type`, `fnam`, `sz32`, `of32`, `vers`, `flag`, `mdat`). Reading from the first `{` gets only the top patcher. The voice abstraction and the UI are in later blocks. On a scratch copy of `PGS1 MPE.amxd`, `spec2maxpat.read_patch_file` → `write_patch_file` shrank the file from 829,780 to 274,963 bytes, and the `dlst` directory was gone.
> *Source*: `patchers/Max Instrument/PGS1 MPE.amxd` (and every `µK Bundle` device, which are also frozen).
> *Why it matters*: `sync` on a frozen device would strip it. Check for `mx@c` / `dlst` and refuse, or preserve the tail. `patching/M4L_PATCHING.md` only says dependencies live "inside the .amxd bundle".

> **Type the bare device file name in `amxd~`, not an absolute path.** The PGS-1 overview has `amxd~ "/Users/tomhall/Desktop/PGS-1/patchers/Max Instrument/PGS1 MPE.amxd"`, a path from the author's machine. Max also saved `patchername` (the bare file name) and a `patchername_fallback` path in the box. The µK Bundle intro types `amxd~ µKflux.amxd`, which the search path resolves anywhere. Whether Max recovers the PGS-1 boxes on another machine was not tested.
> *Source*: `extras/PGS1-Overview.maxpat`; `µK Bundle/extras/µK Bundle Intro.maxpat`.
> *Why it matters*: a demo patch that points at one person's Desktop may open with empty device boxes.

## µK Bundle

> **A Live device can offer both Live-parameter mapping and a plain signal output, so it also works in Max's `amxd~`.** µEXT maps its envelope to a Live parameter picked with "Set Target" (`live.path` / `live.observer id` → `live.remote~`). It also has a `CV` switch (`live.text`, Off/On). The Max intro patch says "in order to correctly work in Max, CV must be enabled" and "use first outlet as modulation source (range 0.-1.)". The intro starts a `transport` for the tempo-synced devices.
> *Source*: `patchers/Max Audio Effect/µEXT.amxd`; `extras/µK Bundle Intro.maxpat`.
> *Why it matters*: in plain Max there is no Live set to target. A device meant for both worlds needs a signal path, and tempo-synced devices need Max's `transport` running.

> **Video-to-MIDI can run on an 8×8 matrix: downsample, then read the cells as numbers.** µVIMO plays `jit.movie 128 96` (or `jit.noise 4 char 128 96` as a source) and copies frames into `jit.matrix 4 char 8 8`, which shrinks them to 64 cells. A random `gate` sometimes holds the stored frame, `jit.op @op -` subtracts a value from a dial, and `jit.normalize` takes `amp $1`. The device's dials are named `Still`, `Less` and `Amp`; which dial feeds which box was not traced. For triggers the result goes `jit.rgb2luma → jit.spill → scale 0 255 0. 1.`; for display `jit.scissors @columns 1 @rows 8` feeds eight `jit.pwindow`s. Timing uses `translate notevalues ticks` and `translate ticks bars.beats.units`.
> *Source*: `patchers/Max MIDI Effect/µVIMO.amxd` (the unnamed `p` that holds `jit.movie`, and the top patcher).
> *Why it matters*: a 64-cell matrix is cheap to scan every frame and needs no computer-vision package. `translate` converts between Max time units, so the timing follows the tempo.

> **Pitfall: one unprefixed name breaks per-device isolation.** The µK devices send colours and state on `---` names (`s ---kc1`, `r ---reset`, `coll ---number`), but µEXT's control subpatcher has `r init`, and both µEXT and µVIMO have `coll hld_times_coll_2` with no prefix. Every instance of either device, on any track, shares those.
> *Source*: `patchers/Max Audio Effect/µEXT.amxd` (`p control`, `p res_values`); `patchers/Max MIDI Effect/µVIMO.amxd` (`p res_values`).
> *Why it matters*: more evidence for the per-instance naming rule. Check every `s`, `r`, `coll`, `buffer~` and `dict` in a device, not just most of them.

## Catalog pass — bach, cage, dada

> **Set `@out t` before bach meets plain Max.** bach objects output native lllls by default. `print`, message boxes and `zl` objects then see only a `bach.llll` token. Use `@out t` for text, or `@out m` for text without backticks. *Source:* bach.nth refpage; WhatsNew0.8.1_Lllls.maxpat. *Why it matters:* this is the most common "bach outputs garbage" failure.

> **Pass lllls between patch areas with bach.value, not send/receive.** The help file says send/receive can fail with lllls in some cases, and bach.value always works. `@auto 1` makes it fire when another same-named instance changes. *Source:* bach.value.maxhelp. *Why it matters:* silent data loss otherwise.

> **Keep lllls in coll, dict or umenu by storing a bach.shelf name.** Plain storage objects cannot hold native lllls. `store` returns a symbol, and that symbol can live in a coll. *Source:* bach.shelf.maxhelp. *Why it matters:* this avoids lossy text round-trips for large scores.

> **Roll to score is bach.quantize; score to roll is bach.score2roll.** bach.transcribe only records into bach.roll. *Source:* the three refpages. *Why it matters:* it picks the right conversion object on the first try.

> **Hear a bach score with bach.playkeys or bach.ezmidiplay.** bach.ezmidiplay is instant MIDI with microtones done by pitch bend. bach.playkeys extracts chosen parameters for your own synth. bach.dl2line and bach.slot2line turn glissandi and per-note envelopes into line~ messages. *Source:* refpages. *Why it matters:* these are the standard score-to-sound bridges.

> **cage objects with a tilde are not always audio.** cage.cascade~ applies biquad coefficients to score velocities. cage.fm, cage.rm and cage.freqshift output notes, not sound. *Source:* cage refpages. *Why it matters:* do not wire them into MSP chains.

> **Ten documented names will not load.** bach.mode, cage.anal, cage.prob, cage.ezaddsynth~, cage.ezseq~, cage.glue, cage.scissors, dada.match, dada.pareto and dada.terrain.rectangle~ have refpages but no object files. *Source:* file search of the package folders. *Why it matters:* they show up in search and in the refpage browser but create red boxes.

## Catalog pass — FrameLib, FFTease, HIRT, spectrogram~, ears

> **FrameLib parameters are slash-named, not attributes.** Write `fl.interval~ 512 @id foo` or `fl.source~ /length 4096`; `/name value` sets a parameter, `@` only sets `id`, `rt` and `buffer`. *Source:* FrameLib refpages and tutorial patchers. *Why it matters:* `@interval 512` is a silent guess the converter cannot catch.

> **Know FrameLib's four exits and entries.** `fl.source~` brings audio in with latency equal to `/length`; `fl.sink~` overlap-adds frames back to audio with no latency; `fl.trace~` holds frame values as a control signal; `fl.frommax~` / `fl.tomax~` handle messages. *Source:* refpages. *Why it matters:* picking the message bridge for audio gives silence.

> **FrameLib operators have symbol names and a stream-count argument.** Type `fl.+~`, `fl.*~`, `fl.complex./~`; a first argument such as `=4` makes the object handle four streams (FrameLib's version of MC). *Source:* `init/fl-objectmappings.txt`, any refpage `[stream-specifier]`. *Why it matters:* spec lookups and readers expect the symbol form.

> **ears.process~ is an offline render host for ordinary MSP patches.** Load a patch as its argument (like `poly~`); `ears.in~` / `ears.out~` inside carry buffer audio, and `@tail` adds time for decays. Timed objects follow audio time, but objects that turn signals into messages can mistime, and a local `startwindow` elsewhere blocks it. *Source:* `ears.process~.maxhelp`. *Why it matters:* it is how to run any MSP effect faster than realtime into a buffer.

> **ears output naming decides whether a buffer is overwritten.** `@naming` 0 copies the input name (in place), 1 reuses one static output, 2 makes a new buffer per command, which grows memory. `@blocking` (instantiation only) picks the thread; 1, the main thread, is the default. *Source:* shared attributes in ears refpages. *Why it matters:* dynamic naming in a loop leaks buffers.

> **FFTease thresholds scale with FFT size.** Changing `@fftsize` changes how existing threshold settings sound, and every object takes `@fftsize` and `@overlap` (powers of 2). *Source:* `fftz.bthresher~.maxhelp`, FFTease refpages. *Why it matters:* presets stop working after a size change.

> **HIRT convolution trades latency for CPU.** `multiconvolve~`'s third argument is `zero`, `short` (128 samples) or `medium` (512); `mc.multiconvolve~` also exists. *Source:* refpage, `init/hirt-objectmappings.txt`. *Why it matters:* long IRs at zero latency can overload the CPU when a small delay is harmless.

> **spectrogram.player~ links by patch cord only.** Its rightmost outlet must reach a spectrogram~ inlet through cords (subpatcher inlets and outlets are fine, send/receive and poly~ are not). With `@filter 1` output is delayed by `@filter_fft_size` samples. *Source:* refpage. *Why it matters:* a send/receive link silently leaves it a plain player.

## Catalog pass — Data Knot, FluCoMa, MuBu, catart-mubu, zsa.descriptors, ml.star

> **PiPo modules are named without their prefix and chained with colons**
> A `pipo.X` external is a module, not a box. Name it inside a host: `pipo~ slice:fft`, `pipo 1euro`, `mubu.process <mubu> audio descr:chop @name descr`. Attributes keep the module prefix: `@descr.winsize`, `@chop.size`.
> *Source:* MuBu help files (pipo.norm, pipo.1euro, mubu.model), catart-mubu help patches.
> *Why it matters:* The modules are shipped as externals, so it is natural but wrong to place `pipo.descr` as its own box; and the prefix rule is easy to get backwards.

> **Mimo models are trained offline and applied live by the same name**
> Train on a whole track with `mubu.model <mubu> <track> normalize` (or `pca`, `stats`), copy the model to a `dict` with `getmodel`, then stream new data through `pipo normalize @normalize.model <dict>`.
> *Source:* mimo.normalize.maxhelp, mimo.pca.maxhelp.
> *Why it matters:* It is the MuBu equivalent of FluCoMa's fit / transformpoint, with no FluCoMa needed.

> **PiPo hosts assume 1000 Hz unless told the data rate**
> For sensor streams, set the rate on every object in the chain (`@framerate` on `pipo`, `@samplerate` on mubu.process / mubu.track / mubu.record), or time-based filters like 1euro use wrong cutoffs.
> *Source:* comment in pipo.1euro.maxhelp.
> *Why it matters:* The filter still runs and still smooths, just wrongly, so nothing flags the mistake.

> **Data Knot objects come in three timing families**
> `dk.X~` analyzes once per detected onset, `dk.Xrt~` analyzes continuously, `dk.Xframe` analyzes a frame supplied by `dk.onsetframe~`, `dk.realtimeframe~` or `dk.triggerframe~`. Use the frame family when several descriptors must describe the exact same moment.
> *Source:* Data Knot refpages (descriptors, melbands, mfcc, sines, spectralshape, kitchensink).
> *Why it matters:* Picking by family, not by descriptor, is the real design choice in a Data Knot patch.

> **zsa.descriptors ships one-object pfft~ wrappers**
> The signal zsa objects only work inside `pfft~`. `misc/zsa.easy_<name>~ <fftsize> <overlap>` (14 of them, e.g. `zsa.easy_centroid~ 2048 4`) script the `pfft~` for you; for several descriptors at once, build your own `pfft~`.
> *Source:* `misc/zsa.easy_bark~.maxpat` comment and zsa help files.
> *Why it matters:* The wrappers are not in package_objects.json, so nobody finds them; without them the objects look broken.

> **ml.hmm will not load in native Apple Silicon Max**
> Its Mac binary is x86_64 only, while every other ml.star external is universal.
> *Source:* `file externals/ml.hmm.mxo/Contents/MacOS/ml.hmm`; ml.star readme v1.3 notes.
> *Why it matters:* A missing-object box on an M-series Mac is a platform limit, not an install error. Use mubu.hhmm or mubu.xmm instead.

> **Data Knot synth voices save presets by feeding `dump` back in**
> All Data Knot synthesis objects accept the output of their own `dump` outlet at the inlet, and a `randomize` message, so presets can be stored in a `dict` and chained between voices.
> *Source:* Data Knot README changelog v1.0.1; refpage message lists.
> *Why it matters:* No pattr setup is needed to store or morph synth settings.

## Catalog pass — RTC-lib, jasch objects, ease, gtm.markov, petra, zero, rr

> **Swap how material is picked, not the material.** RTC-lib's `sel-princ` switches between Koenig's alea, series, sequence and rota with one int. The same supply list can move from random to ordered picking live. *Source:* RTC-lib `sel-princ.maxhelp`. *Why it matters:* one control changes the character of a whole generative line.

> **Use log-spaced steps for random durations and pitches.** `between-log` and `make-ED-scale` pick from geometric scales, so equal ratios sound evenly spaced. Plain `random` over milliseconds sounds bunched at the long end. *Source:* RTC-lib help for `between-log`, `make-ED-scale`. *Why it matters:* random rhythms sound balanced without hand-tuning.

> **`urn` already reports when it runs out.** `urn` bangs its right outlet once every number has been used. RTC-lib's `xrandom` and `series` are thin shells around it. *Source:* `urn.maxref.xml`, `patchers/Chance/xrandom.maxpat`. *Why it matters:* no-repeat random needs no package.

> **Watch the index base when swapping list objects.** RTC-lib `nth` is `zl lookup`, which counts from 0. `zl.nth` counts from 1. *Source:* `zl.lookup.maxref.xml`, `zl.nth.maxref.xml`, `patchers/Lists/nth.maxpat`. *Why it matters:* replacing one with the other gives a silent off-by-one.

> **Abstractions that send `;dsp` or `;max` on load change global settings.** `MSP-sr~`, `MSP-sigvs~`, `max-overdrive` and similar fire their argument from `loadbang`. Opening a patch that contains one changes the audio setup for everything. *Source:* the RTC-lib `.maxpat` files. *Why it matters:* a surprise sample-rate change looks like a driver fault.

> **Let `ease~` wait for the ramp to restart.** With `@syncupdate 1`, `ease~` changes curve only when the driving `phasor~` restarts, so the shape never jumps mid-cycle. *Source:* `ease~.maxref.xml`, `ease~.maxhelp`. *Why it matters:* click-free curve changes on LFOs and sweeps.

> **Second-order Markov from a melody in one box.** `gtm.markov` takes a list of up to 128 values 0–127, bangs an outlet when its table is built, then gives one new value per bang. Max's `prob` is first-order and needs the table built by hand. *Source:* `gtm.markov.maxref.xml`, package readme. *Why it matters:* style imitation from a MIDI file takes minutes, not a table editor.

> **Find OSC peers by name, not IP address.** `zero.announce` publishes a port; `zero.browse` lists services; `zero.resolve` returns host and port to feed `udpsend`. *Source:* `zero.resolve.maxhelp`. *Why it matters:* patches keep working when a laptop's IP changes. Windows may need Apple's Bonjour.

## Catalog pass — Digital Orchestra Toolbox, Upshot, TS.Modular

> **Half-normalled signal inlets: a default that steps aside when a cord arrives.** TS.Modular's `Normalization` subpatcher feeds its inlet into both `[sel signal]` and `[tapin~ 1]`. Its comment says a newly connected signal cord sends the message `signal`, and `tapin~` sends `tapconnect` on connect and disconnect, which drive a `selector~` between the knob value and the patched signal. Not tested in Max here.
> *Source:* `TS.Modular/code/subPatchers/Normalization.maxpat`.
> *Why it matters:* modules can keep working from their own knobs until someone patches a modulation cable in, like hardware jacks.

> **TS.Modular signals run -1 to 1; BEAP runs -5 to 5.** `ts.toBEAP` and `ts.fromBEAP` exist only to convert between the two.
> *Source:* `ts.toBEAP.maxhelp`, `ts.fromBEAP.maxhelp`.
> *Why it matters:* patching one package's CV into the other without conversion gives five times too much or too little modulation.

> **Global send~ names make every recorder hear every output.** `ts.outDAC` builds `send~ Lrec<n>` / `Rrec<n>` names with `combine`, and `ts.stereoRecorder` / `ts.multichannelRecorder` listen with `receive~ Lrec1`… with no `#0`.
> *Source:* `TS.Modular/patchers/ts.outDAC.maxpat`, `ts.stereoRecorder.maxpat`.
> *Why it matters:* recording works without cords, but two copies of a patch share one bus. This is the per-instance naming rule in `CLAUDE.md`.

> **Filter sensor data in Hz by telling the filter the data rate.** `dot.biquad.lowpass` / `.highpass` take `samplerate` set to the sensor's message rate, then a cutoff in Hz and Q. DOT's release notes say the `dot.biquad` help shows how to translate `filtergraph~` settings for such low-rate streams.
> *Source:* `Digital Orchestra Toolbox/news.md` (v1.3), `dot.biquad.lowpass.maxref.xml`.
> *Why it matters:* gives a predictable smoothing amount instead of guessing a `slide` factor.

> **Use hysteresis, not a single threshold, on noisy sensors.** `dot.schmitt` fires above a high bound and rearms only below a low bound; `dot.round` adds separate up/down hysteresis to rounding.
> *Source:* `dot.schmitt.maxref.xml`, `dot.round.maxref.xml`.
> *Why it matters:* a plain `>` comparison on a jittery sensor fires many times at the threshold.

> **Record the gesture once, tune the mapping without the hardware.** `dot.log.record` stores any number of streams with timestamps into a file; `dot.log.play` (linked with `refer`) replays them with the original timing.
> *Source:* `dot.log.record.maxhelp`.
> *Why it matters:* mapping work can continue when the sensor or performer is not there, with repeatable input.

> **Reject spikes before auto-scaling.** `dot.autoscale` widens its range to every new extreme, so one glitch squashes the scaling until you reset the range (input-low / input-high). Put `dot.denoise.exponential` or `dot.median.sliding` first, or use `dot.autoscale.exponential`, which adapts over time.
> *Source:* `dot.autoscale.maxref.xml`, `dot.denoise.exponential.maxref.xml`.
> *Why it matters:* self-calibrating sensor patches otherwise go flat after the first bad reading.

## Catalog pass — Vsynth, Max for the Visual Arts, cv.jit, XRAY, Syphon, ejies

> **Java and JS package objects need their full box text.**
> `ej.lscale` must be typed as `mxj ej.lscale`, and `ej.cc` as `js ej.cc.js`. The short name alone makes a red box.
> mxj also needs a JDK, and this Mac has none.
> *Source:* `ejies/init/ejies-objectlist.txt`; `max-mxj/README.md`.
> *Why it matters:* catalog names do not always match what you type.

> **cv.jit blob pipelines have a fixed order.**
> Start with `cv.jit.label @charmode 1`.
> Then use `cv.jit.blobs.centroids`, `blobs.bounds` or `blobs.moments`.
> `blobs.orientation`, `blobs.direction`, `blobs.elongation` and `blobs.recon` need `blobs.moments` first.
> *Source:* blobs help files ("You MUST label the image with charmode set to 1").
> *Why it matters:* the wrong order fails without an error.

> **Optical flow needs `@unique 1` on the video source.**
> If the same frame arrives twice, the flow is zero.
> *Source:* `cv.jit.opticalflow`, `HSflow` and `LKflow` help.
> *Why it matters:* without it, flow flickers to zero at camera frame rates.

> **cv.jit.faces outputs a dummy matrix when it finds no face.**
> Filter it with `cv.jit.notempty`, or query `getnfaces`.
> *Source:* `cv.jit.notempty` and `cv.jit.faces` help.
> *Why it matters:* otherwise downstream objects draw a false face.

> **Check the bundled Vizzie and Jitter Tools (`jit.fx.*`) before adding Vsynth effect modules.**
> Basic keying, blur, feedback, delay and blend modes already ship with Max: `jit.fx.co.lumakey`, `jit.fx.cf.gaussian`, `vz.feedr`, `jit.fx.tp.delay`, `vz.modemixr`.
> Vsynth's real additions are the analog-style oscillators with a sync timer, and oscilloscope vector synthesis.
> *Source:* Vizzie patcher descriptions; Jitter Tools refpages.
> *Why it matters:* this avoids a third-party dependency.

> **Singleton modules break when duplicated.**
> Keep only one `vs_render` and one `vector_3ch_out` across all open patches. A duplicate `vs_render` causes heavy frame drops and an extra window.
> *Source:* `vs_render` and `vector_3ch_out` help.
> *Why it matters:* this is easy to trigger by opening two Vsynth patches at once.

> **The `shell` external in the Samplor package is Intel-only.**
> `lipo` reports i386 and x86_64.
> Patches that call it will not run in native Apple Silicon Max: ejies `kaf`, and `imi.docloader`, `imi.apploader` and the `max2printer` demo in Max for the Visual Arts.
> *Source:* `lipo -archs`.
> *Why it matters:* one old external silently disables several abstractions in other packages.

> **Package names can shadow or look like built-ins.**
> ejies `jit.fullscreen` and `jit.getparam` are abstractions, not Jitter objects.
> Max for the Visual Arts ships `table.maxhelp`, which has the name of the built-in `table`.
> XRAY (`jsextensions/`) and Max for the Visual Arts (`javascript/`) ship different files, both named `xray.diagonalize.js` and `xray.dynamicexpr.js`.
> *Source:* the package folders; `diff`.
> *Why it matters:* which copy loads depends on search order.

## Catalog pass — modulo, av-toolbox, CNMAT Externals, grainflow, Sadam Library

> **Every grainflow grain is its own mc channel.** `grainflow~` outputs one channel per grain, so a grainflow patch always needs a panner or mixdown after it, such as `grainflow.util.stereoPan~` or `grainflow.spat.pan~`. *Source:* grainflow~ help. *Why it matters:* without one, most grains never reach the speakers.

> **Grain timing comes from a phasor, not from messages.** A grain-clock phasor sets grain size and rate. `grainflow.util.rateSizePhasor~` turns rate (Hz) and size (ms) into that clock, and the help suggests `mc.snowphasor~` as another clock. *Source:* grainflow~ and rateSizePhasor~ help. *Why it matters:* the old trigger-message approach was removed in 2.0.

> **`udpreceive` can pass raw OSC packets on.** Give `udpreceive` any symbol as its extra argument and it outputs `FullPacket` messages instead of decoded Max messages. This is how odot and CNMAT OSC objects receive bundles. *Source:* udpreceive refpage. *Why it matters:* you get full bundles and timetags without a separate converter.

> **`loadbang` can fire before a patch's presets and attributes have loaded.** av-toolbox's `av.loadbang` / `av.loadmess` defer the bang to the end of loading for exactly this reason. *Source:* av.loadbang refpage. *Why it matters:* if a preset recall at load does nothing, move it to the end of loading.

> **Signal-to-event objects can overflow the audio thread's stack.** `cambio~`'s help warns that long message chains after it can crash with "check failed" errors. The fix is to move the event onto another thread. *Source:* cambio~ help. *Why it matters:* this applies to any object that turns a signal into messages during audio processing.

> **`poly.bus~` must come after `poly.send~` in the DSP chain.** The help file adds wiring just to force that order. *Source:* poly.send~ help. *Why it matters:* Max does not guarantee that order by itself; the help patch forces it with an extra connection.

> **Do color work in linear light.** Convert a movie to linear color (`av.pix.gamma.expand`, or `jit.fx.srgb2lin` in Max 9), process it, then convert back (`av.pix.gamma.correct` / `jit.fx.lin2srgb`). *Source:* av.pix.gamma refpages. *Why it matters:* brightness and blend math done in sRGB looks wrong.

> **`record~` may not be precise enough for live granulation.** grainflow ships `grainflow.util.record~` because `record~` did not track its record position precisely enough to granulate the buffer while recording. *Source:* grainflow.util.record~ help. *Why it matters:* use a recorder that reports an exact write position when reading and writing the same buffer at once.

## Catalog pass — odot, Link, Sound Design Toolkit and 24 smaller packages

> **Give udpreceive a symbol argument when feeding odot.**
> With any symbol argument, `udpreceive` passes whole OSC packets as FullPacket messages instead of decoding them into Max messages. odot's own abstraction uses `udpreceive 10001 CNMAT`.
> *Source:* `udpreceive.maxref.xml` objarg; `odot/dev/aspect/abstractions/o.aspect.udpsend.maxpat`.
> *Why it matters:* the preferred-objects table pairs `udpreceive` with `o.route` but does not say this. Without it, udpreceive decodes each packet into plain Max messages before odot sees it.

> **Store odot bundles only with o.var or o.compose.**
> A FullPacket message is a pointer to memory, so `zl.reg` or a message box keeps a reference that goes stale.
> *Source:* `o.var.maxref.xml`.
> *Why it matters:* the stored "bundle" silently changes or breaks later, with no error.

> **Package refpage root names are often wrong, so name-keyed lookups miss.**
> In these packages, `pnp.flange~` and `pnp.distort~` both declare `pnp.dstort~`; `pnp.energy~` and `pnp.descriptor~` declare `pnp.boominess~`; `pnp.notch~` declares `pnp.binpass~`; `az.specteq~` declares `az.spectdeq~`; `jeyrandsliders` declares `jeyrandsliders~`; MIAP names differ in case from the keys used here.
> *Source:* root `name` attribute vs file name of each `.maxref.xml`.
> *Why it matters:* the repo rule says to trust the root `name` over the filename. For package refpages that picks up author typos; fall back to the filename when the root name collides with another refpage.

> **A package's init mappings decide what name you type, not its file names.**
> FlowSwing maps `flowSwing.x` to a bpatcher of `flowSwing_x`; s2n and Nonlinear Sequencer map `mc.sn.*` and `mc.nls.*` to `mc.wrapper~`; Collab-Hub maps `CH-*` to `ch.*` files.
> *Source:* each package's `init/*.txt`.
> *Why it matters:* catalog keys built from file names send users to names that may not create the intended object. Read `init/` before recording an object name.

> **Sound Design Toolkit solids are three linked objects, joined by name.**
> A resonator (`sdt.modal name modes pickups`) and an exciter (`sdt.inertial name`) make no sound alone. An interactor (`sdt.impact~` or `sdt.friction~`) takes both names plus an outlet count and produces the audio. Control objects such as `sdt.bouncing~` or `sdt.rolling~` drive the interactor.
> *Source:* SDT refpages for these objects.
> *Why it matters:* the interactor needs both named objects to exist; the use_when entries mention the arguments but not this three-part shape.

> **Link Audio is for audio between apps, not inside Max.**
> `link.audio.send~` and `link.audio.receive~` never connect within one Max. Senders sharing a name are summed into one stream.
> *Source:* both Link 2.0 refpages.
> *Why it matters:* for routing inside one Max, use `send~` / `receive~` instead.

## Catalog pass — PeRColate, Compute, AOO for Max

> **PeRColate models take Hz, not MIDI.** Every `noteon` and every frequency inlet in the PeRColate models expects Hz. The help files all convert with `mtof` first. *Source:* PeRColate refpages ("noteon followed by a pitch (Hz)") and help patches. *Why it matters:* a MIDI note number such as 60 plays a 60 Hz rumble, not middle C.

> **Put a limiter after physical models.** The `flute~`, `mandolin~`, `saxofony~`, `ublotar~` and `vcomb~` help files all insert `limi~` and warn that some settings get loud. *Source:* PeRColate help files. *Why it matters:* waveguide models can blow up to full scale when breath pressure or feedback goes too high.

> **Compute is queue-then-submit.** Banging `jit.gpu.compute`, `jit.gpu.tomatrix` or `jit.gpu.totexture` only queues work. Nothing runs until `jit.gpu.submit` is banged, and results leave the middle outlet only after the GPU finishes. Wire each pass's bang outlet to the next pass's inlet to set the order. *Source:* `jit.gpu.compute.maxhelp` and the refpages. *Why it matters:* a patch without `jit.gpu.submit` loads fine and silently does nothing.

> **Let Compute size the dispatch.** Set `@autoworkgroups <image bind point>` on `jit.gpu.compute` instead of working out `workgroups` from image size and shader local size. *Source:* `jit.gpu.compute.maxref.xml` and its help. *Why it matters:* wrong workgroup counts leave part of the image unprocessed, with no error.

> **Keep GPU results on the GPU for display.** `jit.gpu.totexture` shares GPU memory with OpenGL. `jit.gpu.tomatrix` copies back to the CPU. Use `jit.gpu.bang` (synced to `jit.world`) and `gl_dependency 1` on `jit.gpu.submit` when compute and OpenGL share textures. *Source:* the Compute refpages and `jit.gpu.bang.maxhelp`. *Why it matters:* readback every frame costs frame rate, and unsynced sharing causes flicker or stale frames.

> **AOO peers by name, not IP.** When `aoo.client` has joined a group on port N, `aoo.send~` and `aoo.receive~` on the same port can use `<group> <user> <id>` in place of `<host> <port> <id>`. For instance, `add test bar 1`. *Source:* `aoo.client.maxhelp` ("All AOO objects on the same port share the same peer list") and `AOO Overview.maxpat`. *Why it matters:* remote performers behind home routers can connect without anyone knowing IP addresses.

> **Skip PeRColate's gen tables for simple shapes.** `gen25` windows and sine tables are one `buffer~` message: `fill 1` then `apply hanning`, or `fill sin`. `gen10` / `gen9` / `gen17` still earn their place for harmonic sums and Chebyshev waveshaping tables, which `buffer~` cannot compute. *Source:* `buffer~.maxref.xml` (`fill`, `apply`) and the PeRColate `gen*` refpages. *Why it matters:* it saves a `gen*` → `peek~` chain.
