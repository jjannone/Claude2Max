# Tutorial Episode Index — Delicious Tutorials and Jitter Recipes

One line per episode or recipe: number, title, what it teaches, main objects.
Paths are inside `~/Documents/Max 9/Packages/<package>/`. Titles come from the
`docs/` and `future-docs/` tutorial files. Only episodes 1–10 have real tutorial
text; the `future-docs/` files carry the Karplus-Strong text as a placeholder.
"Missing" means the object is not in Max 9's registry or not installed.

## Delicious Tutorials

| # | Title | Technique | Main objects | Patch |
|---|---|---|---|---|
| 01 | Karplus Strong | Plucked string: noise burst into a recirculating delay; pitch-independent decay | `rand~`, `adsr~` (`maxsustain`), `tapin~`/`tapout~`, `onepole~`, `expr pow()` | `patchers/01-karplus_strong.maxpat`; voice `sjt.karplus_poly.maxpat` |
| 02 | Step Sequencer | Polyphonic grid: `matrixctrl` column read per step, one `poly~` voice per row | `metro`, `counter`, `matrixctrl` (`getcolumn`), `zl iter`, `poly~` (`target`), `function` | `02-sequencer.maxpat`; voice `02-saw_note.maxpat` |
| 03 | Stutter | Keyboard-controlled loop window over a sound file at signal rate | `buffer~` (`replace`), `info~`, `phasor~`, `%~`, `play~`, `key`, `waveform~`, `degrade~`, `freqshift~` | `03-stutter.maxpat` |
| 04 | Vocoder | FFT amplitude transfer; zero-crossing consonant detection | `pfft~`, `fftin~`/`fftout~`, `sqrt~`, `zerox~`, `selector~`, `sfplay~` | `04-vocoder.maxpat`; `robot_pfft.maxpat`, `robot_pfft_efficient.maxpat` |
| 05 | Boomerang | Overdub looper reading and writing one buffer | `count~`, `index~`, `poke~`, `dspstate~`, `delta~`, `key`/`keyup`, `line~` | `05-boomerang.maxpat` |
| 06 | TB-303 | Mono synth with glide, envelope-swept resonant lowpass, MIDI file playback | `seq`, `midiflush`, `midiparse`, `borax`, `poly 1 1`, `line~`, `saw~`, `filtercoeff~`, `biquad~` ×2, `adsr~` | `06-tb-303/06-tb-303.maxpat`; M4L `tb-303.amxd` + `tb-303-poly.maxpat` |
| 07 | Pitch Shifting | Windowed variable-delay pitch shifter with overlapping voices | `phasor~`, `tapin~`/`tapout~`, `cos~`, `poly~` (`voices`), `thispoly~` | `07-pitch_shift.maxpat`; voice `sjt.doppler_poly.maxpat` |
| 08 | Circular Sequencer | JS patcher scripting builds a ring of toggles; per-drum sample voices | `js circseq.js`, `funnel`, `poly~ simple-sampler … @args`, `live.tab`, `matrixctrl` | `08-circular-sequencer/08-circle_master.maxpat`, `circle_sequencer.maxpat`, `circseq.js`; voice `simple-sampler.maxpat` |
| 09 | Bpatcher | Patch inside a patch; scrolling the view with `thispatcher` scripting | `bpatcher`, `thispatcher` (`script sendbox … offset`), `pcontrol`, `pictslider` | `09-bpatcher.maxpat`; contents `base_bp.maxpat` (arpeggiator into `sjt.karplus_poly`) |
| 10 | Wobble Bass | Retriggered tempo-synced LFO on a bandpass; even/odd partial blend; CC mapping table | `phasor~ 4n`, `cycle~`, `transport`, `rect~`, `freqshift~`, `filtercoeff~ bandpass`, `borax`, `coll`, `pattr` (`bindto`) | `10-wobble.maxpat`; `10-wobble/patchers/WobbleBassRedux.maxpat` |
| 11 | Wii Drums | OSC accelerometer hit detection with a lockout gate | `udpreceive`, `route`, `zl stream`, `vexpr`, `zl sum`, `gate`, `delay`, `makenote`, `noteout` | `11-wii/patchers/11-wii.maxpat` |
| 12 | Pfft, your friend | Spectral smoothing, gating, band isolation, per-bin delay | `pfft~`, `vectral~` (`slide`), `fftinfo~`, `cartopol~`/`poltocar~`, `count~`, `poke~`/`index~` | `12-pfft/patchers/sjt.freq_amp_slide.maxpat`, `sjt.freq_gate.maxpat`, `sjt.freq_range.maxpat`, `sjt.freq_delay.maxpat` |
| 13 | Coll of Duty | Scale quantizer from text-file scales; grid to notes | `coll` (`read`, `length`), `matrixctrl`, `zl lace`, `zl iter`, `makenote` | `13-coll.maxpat` |
| 14 | Faux Autechre | Pitch-sweep chirps, gated bursts, buffer-stored step patterns | `curve~`, `cycle~`, `gate~`, `phasor~`, `peek~`/`index~`, `fffb~`, `comb~` | `14-faux_autechre/patchers/autechre1.maxpat`, `autechre_chrip.maxpat`, `Autechre_Powmod.maxpat` (Max 4, boxes hidden) |
| 15 | Dictionaries and Bounciness | Shared state in a named `dict`; bouncing ball on a grid triggers notes | `dict`, `dict.unpack`, `dict.view`, `getattr @listen 1`, `lcd` (deprecated) | `15-bouncy_dictionary/patchers/bouncy.maxpat` |
| 16 | Pixelface | Luma key between webcam and blocky noise in a shader | `jit.grab`, `jit.noise`, `jit.matrix @interp 0`, `jit.gl.pix`, `jit.gl.videoplane`, `jit.gl.render` | `16-pixelface.maxpat` |
| 17 | Fisheye | Lens distortion shader driven by `snorm`, `length`, `pow` | `jit.gl.pix` (`param`, `sample`, `snorm`), `jit.qt.grab`, `jit.gl.render` | `17-fisheye/patchers/17-fisheye.maxpat`, `exponent.maxpat` (exponent-curve demo) |
| 18 | Sawcloud | gen~ supersaw: detuned phasors reading a wavetable filled from Max | `gen~` (`buffer`, `cycle @index phase`, `param`), `uzi`, `peek~`, `buffer~` | `18-sawcloud.maxpat` |
| 19 | 2d.wave~: A glitchy love story | (patch is empty in the package; only the audio file ships) | — | `19-2dwave/patchers/tutorial_19.maxpat` |
| 20 | Kick Drum Synthesis | Layered kick from drawn pitch and amplitude envelopes | `function`, `line~`, `scale~` (exponent), `reson~`, `noise~`, `saw~`, `overdrive~` | `20-kick/kick.maxpat`, `20-kick/patchers/Tutorial_20.maxpat` |
| 21 | Bump It | Audio onsets kick physics bodies rendered as instances | `bonk~` (missing), `groove~`, `jit.phys.world`, `jit.phys.multiple`, `jit.gl.multiple` | `21-bumper/patchers/bumper.maxpat` |
| 22 | Video Feedback | Frame-difference mask composited in GL feedback | `jit.qt.grab`, `jit.absdiff`, `jit.gl.pix` (`>p`), `jit.gl.node @capture 1`, `jit.gl.videoplane @layer` | `22-video_feedback.maxpat` |
| 23 | Boids | Flocking positions drive 200 synth voices and a mesh | `jit.boids2d` and `xray.jit.boidsrender` (both missing), `jit.spill`, `listfunnel`, `poly~` (`target`), `pattrstorage` | `23-boids/patchers/main.maxpat`, `boids_poly.maxpat` |
| 24 | Bloom and Doom | Bloom: luma band select, blur, add back | `jit.gl.pix` (`smoothstep`, `dot`), `jit.gl.slab.gauss6x` (missing) | `24-bloom.maxpat` |
| 25 | Cell Pump | Textured height-field mesh morphing between random targets | `jit.gl.mesh @draw_mode tri_grid`, `jit.expr norm`, `jit.noise`, `jit.matrix @thru 0`, `jit.slide`, `jit.gl.texture @name` | `25-cellpump.maxpat` |
| 26 | Lava Lamp | Physics bodies set the amplitudes of an additive synth | `jit.phys.multiple`, `jit.phys.ghost`, `jit.spill`, `oscbank~` (`set`), `vexpr @scalarmode`, `zl lace` | `26-lava/patchers/26-lava.maxpat` (steps `lava-1`…`lava-6`) |
| 27 | Live Visuals | MIDI-triggered drawn envelopes sampled per frame onto video attributes | `notein`, `function`, `line~`, `snapshot~`, `jit.scanwrap`, `jit.brcosa`, `jit.matrix @thru 0` | `27-live_viz.maxpat` |
| 28 | Scanning and Sliding | Rotating image stamped into a scan-slide feedback | `jit.rota`, `jit.matrixinfo`, `jit.alphablend`, `jit.scanslide`, named `jit.matrix` | `28-scanning/patchers/28-live-viz.maxpat` |
| 29 | Bespoke Noise | Procedural noise thresholded into decaying colour trails | `jit.bfg` (`basis noise.gradient`), `jit.normalize`, `jit.>p`, `jit.op` per-plane decay, `snapshot~` of slow `phasor~` | `29-bespoke.maxpat` |
| 30 | Video Wax | Noise-gradient displacement of an image in shader feedback | `jit.bfg`, `jit.gl.pix` (`sample` neighbours), named `jit.matrix @thru 0` | `30-video_wax.maxpat` |
| 31 | Gantz Graf Style, Vol. 1 | Distance field in a 3D matrix rendered as an isosurface | `jit.gen` (`snorm`, `length`, `sin`, `param`), `jit.matrix 1 float32 32 32 32`, `jit.gl.isosurf` | `31-gg_1.maxpat` |
| 32 | Bump Map | Fractal heightmap to normals texture for bump-mapped lighting | `jit.bfg` (`setattr basis …`), `jit.gl.pix` (`cross`, `sample @boundmode mirror`), `jit.gl.material` normals inlet | `32-bump_map.maxpat` |
| 33 | Video to Audio | Column-averaged webcam row played as a wavetable | `jit.grab`, `jit.rgb2luma`, `jit.dimop @op avg`, `jit.map`, `jit.buffer~`, `play~` | `33-videoaudio.maxpat` |
| 34 | Gantz Graf Style, Vol. 2 | One cube: random eased moves and a spin | `jit.anim.drive` (`moveto`, `turn`), `jit.gl.gridshape`, `jit.gl.camera` | `34-cube-1.maxpat` |
| 35 | Gantz Graf Style, Vol. 3 | 100 cubes, one GL object per `poly~` voice | `poly~ polycube 100 @args`, `jit.gl.gridshape @drawto #1`, `jit.anim.drive` (`easefunc`) | `35-multicube/patchers/main.maxpat`, `polycube.maxpat` |
| 36 | Gantz Graf Style, Vol. 4 | Camera swoops on a sphere around the cubes | `expr` spherical coordinates, `jit.anim.drive`, `jit.gl.camera` (`lookat`) | `36-multicube/patchers/main.maxpat` |
| 37 | Gantz Graf Style, Vol. 5 | 125 cubes snapped into a 5×5×5 grid on key press | `uzi`, `%`, `/`, `poly~` (`target`), `jit.anim.drive` | `37-multicube/patchers/main.maxpat` |
| 38 | Learning Japanese | Non-repeating random playback of sound files from a dropped folder | `dropfile`, `umenu` (`prefix`), `urn`, `sfplay~` | `38-japanese/patchers/Japanese.maxpat` |
| 39 | Gantz Graf Style, Vol. 6 | Per-voice material colour and extra per-voice controls | `jit.gl.material @override 1`, `swatch`, `funnel`, `route` | `39-multicube/patchers/main.maxpat`, `polycube.maxpat` |
| 40 | Gantz Graf Style, Extra Info | Refactor: voices write positions into matrices, one instanced draw | `jit.anim.node` (`getposition`, `getrotatexyz`), `setcell`, `jit.gl.multiple @glparams position rotatexyz color` | `40-multicube/patchers/main.maxpat`, `polycube.maxpat` |
| 41 | MIDI learn | Sending CCs from Max so Live's MIDI map can learn them | `pictslider`, `midiformat`, `midiout`, `routepass`, `funnel` | `41-MIDI-learn/midi-learn.maxpat` (+ Live set) |
| — | Launcher | Opens tutorial docs and the YouTube playlist | `;max showdoc`, `;max launchbrowser`, `umenu` | `Delicious Tutorials Launch.maxpat` |

## Jitter Recipes

| # | Title | Technique | Main objects | Patch |
|---|---|---|---|---|
| 01 | Particle Rave-a-Delic | Matrix particle physics in a feedback loop; generated sprite textures | `jit.noise`, `jit.op` (per-plane ops), `jit.slide`, named `jit.matrix`, `jit.charmap`, `jit.unpack @jump @offset`, `jit.gl.multiple`, `jit.world` | `patchers/ParticleRave.maxpat` |
| 02 | 2 Video Synths | Audio signals draw into a matrix that feeds back through a spatial transform; mirror | `jit.poke~`, `jit.rota`, `jit.repos @mode 1`, `jit.dimmap @invert`, `jit.glue @columns 2`, `jit.world` | `patchers/2VideoSynths.maxpat` |
| 03 | Debris | Frame-difference alpha mask accumulated over the previous image (matrix and GL versions) | `jit.qt.grab`/`jit.grab`, `jit.rgb2luma`, `jit.op @op absdiff`, `[t l l]`, `jit.alphablend`, `jit.gl.pix`, `jit.gl.slab` | `patchers/DebrisClassic.maxpat`, `patchers/DebrisHD.maxpat` |
| 04 | Tiny Video | Sprite sheet of 100 captured frames animated on 100 quads with one texture | `jit.matrix @usedstdim` (`dstdimstart`/`dstdimend`), `jit.gl.texture`, `jit.gen` (`cell`), `jit.op`, `jit.gl.mesh @draw_mode quads` | `patchers/TinyVideo.maxpat` |
| 05 | Scene Warp | GL scene captured to texture and fed back with a texture copy; layered transparency | `jit.gl.node @capture 1`, `jit.gl.pix`, `jit.gl.mesh`, `jit.gl.nurbs`, `jit.gl.videoplane @layer`, `jit.gen` state matrix, `jit.world` | `patchers/SceneWarp.maxpat` |
| — | Launcher | Opens the recipe docs and the original web series | `;max showdoc`, `;max launchbrowser`, `textbutton` | `patchers/Jitter Recipes Launch.maxpat` |
