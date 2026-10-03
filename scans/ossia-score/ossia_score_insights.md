# ossia score Insights

Notes on how ossia score works, written for a reader who knows Max and not
ossia score. Every entry comes from a page of the official documentation at
`https://ossia.io/score-docs/` (Markdown source: GitHub `ossia/score-docs`,
branch `master`), or from the libossia reference at
`https://ossia.io/ossia-docs/`, fetched and read on 2026-10-03. Sources are
given as the page's path after `https://ossia.io/score-docs`; the state file
holds each exact URL.

ossia score is not installed on this machine. Nothing here is from memory of
the product. Where a page was only partly read, the state file says so.
Process, device and feature names are spelled as the docs spell them.

The docs warn on their home page that they are a work in progress. Several
reference pages are stubs ("Reference is not yet available", "TODO"). Those
are listed in the crawl log.

Companion files: `OSSIA_SCORE_CRAWL_LOG.md` (what was read),
`ossia_score_crawl_state.json` (per-page status),
`ossia_score_max_gap_candidates.json` (things Max lacks, and things both have
that score does differently), `ossia_score_system_model.json` (score on the
20 system dimensions, plus one).

---

## 1. What score is for

Source: `/quick-start/what-is-score.html`, `/quick-start/breaking-the-timeline.html`.

score is an "intermedia sequencer". Its own pitch is that artists usually pick
between a DAW-style timeline, which is precise but rigid on stage, and a cue
list, which is flexible but bad at things that change over time. score tries
to be both: a timeline that can wait, branch and loop.

It also says plainly that it is not meant to be an all-in-one tool. It is built
to be the hub that drives other software and hardware (synths, VJ software,
lights) over OSC, OSCQuery, MIDI, DMX, serial and so on. It does have its own
audio and video engines.

For a Max user: think of score as the show layer Max does not have
(`max_system_model.json` dimension 10 says Max has no built-in scene, cue or
timeline layer), with a dataflow patcher inside each block of time.

## 2. The time model

### Intervals, states, syncs

Sources: `/processes/scenario.html`, `/reference/glossary.html`,
`/processes.html`, `/in-depth/scripting-api.html`.

- An **interval** is a block of time. Processes that evolve (automations, LFOs,
  sound files, effects) live on intervals and run for as long as the interval
  runs.
- A **state** is an instant. It holds messages (a cue) and can also hold
  processes that run once, at that point.
- States sit on **events**, and events sit on **syncs** (the vertical dotted
  lines). Several intervals can start or end at the same sync, which is how
  parallel branches stay together.
- The main view is itself a **Scenario** process, and a Scenario can sit
  inside an interval, to any depth. The docs call it "DAW groups on steroids".

The scripting API names all of these: `Score.startState(itv)`,
`Score.endEvent(itv)`, `Score.startSync(itv)`, `Score.createIntervalAfter`,
`Score.createIntervalBetween`.

### Triggers: the timeline that waits

Sources: `/quick-start/breaking-the-timeline.html`, `/cues.html`,
`/common-practices/3-out-of-time.html`, `/common-practices/2-switches.html`.

A state can be given a **trigger**. When the playhead reaches it, everything
after it goes on hold. The interval before it shows a dashed line: its length
is no longer fixed. The trigger fires on a mouse click, on any parameter from
the device tree (a MIDI button dropped onto the trigger icon), or on an
expression. The default "Pulse" mode fires on any value received.

Intervals also have a **minimum and maximum duration**, and the maximum can be
infinite. A trigger that is never true still fires when the maximum is
reached, so "wait for the performer, but give up after 30 s" is built in
(`/common-practices/1-looping.html`).

### Conditions and branches

Sources: `/common-practices/2-switches.html`, `/processes/scenario.html`,
`/examples/basics/timemodel.html`.

Several intervals can start from one sync. "Split condition" gives each start
its own event, and each event can carry a **condition**, so only the branches
whose condition holds will run. The Switches page builds a selector this way:
a Mapper device exposes an integer "Branch" parameter, and each branch's
condition tests it.

The glossary entries for Condition and Branch are empty, and the Scenario
page's Conditions section is only a shortcut note. The full expression syntax
is not documented in the pages read.

### Transitions and loops

Source: `/common-practices/1-looping.html`, `/quick-start/non-linear-timelines.html`.

A **transition** is an instantaneous interval that can link any two states,
including a later one back to an earlier one. That makes loops and
state-machine shows. Transitions land on syncs, so jumping to a sync restarts
every branch attached to it. To stop a loop cleanly, put it in a sub-scenario
and end the parent interval.

### Out-of-time parts

Source: `/common-practices/3-out-of-time.html`, `/cues.html`.

A part of the score not linked to the start never plays on its own. Give its
first state a trigger with "Start on play" and it can be fired at any moment,
for instance by an OSC message. A second option decides whether re-firing
restarts it or stops it. Users treat this as a sandbox. While playing, hovering
an interval shows play/stop buttons that start or stop it directly.

### Speed, tempo, metre, quantisation

Sources: `/in-depth/musical.html`, `/processes/tempo.html`,
`/processes/scenario.html`, `/examples/tempo/tempo-control.html`.

- Every running interval shows a **speed slider**. Speed multiplies down the
  hierarchy. Ctrl+right-click resets it.
- **Tempo, time signature and quantisation** pass down the hierarchy too. An
  interval either takes its parent's or sets its own, so a 3/4 section can run
  inside a 4/4 root. A **Tempo** process makes an interval's tempo absolute:
  120 means 120 regardless of the parent's speed. A value sent to its input
  port replaces the curve.
- Quantisation choices include bars and beats, plus **Parent** (inherit) and
  **Free** (start immediately). Triggers and intervals can be quantised to the
  next grid point of their own context.

### Units of time

Source: `/processes/javascript.html`, `/in-depth/scripting-api.html`.

Model time, which speed controls affect, is counted in **flicks**: 705,600,000
per second. Physical time is counted in audio samples. JS processes get both:
`token.date` (model) and `state.physical_date` (samples). The docs warn that
JS timing stays accurate for about 147 days because JS numbers are doubles;
the C++ API lasts 414 years. Looping installations are not affected.

### Seeking: "Play from here" and value compilation

Source: `/common-practices/9-seek-and-transport.html`, `/reference/preferences.html`.

This is one of the most thought-through parts of the docs. Because a score can
wait and branch, "jump to 3:00" is ambiguous. score's rule: the *drawn*
duration of each interval counts as its expected duration, so every trigger
before the target point is treated as fired.

Then **value compilation**: when you jump, score collects every message that
earlier states would have sent and sends the latest value per address. So an
external player gets `play true` even if you start mid-cue. One setting covers
the first jump; another covers jumps while already playing.

Conditions get an **offset behaviour** setting: during a jump a condition can
be forced true, forced false, or read from the live device value. That lets a
rehearsal skip past "wait until the dancer is in zone B".

A **start marker** (right-click the metrics bar) makes play always start from
one point.

### Start, stop and reinitialise

Source: `/common-practices/7-start-stop-cues.html`, `/processes/scenario.html`.

Messages on the very first state are sent on Global Play and on
**Reinitialize**. Messages on the very last state are sent on Stop.
Reinitialize when stopped sends the start state alone, which resets every
device. The transport bar has Local play, Global play, Stop, Reinitialize.

## 3. Cues and automations

### Cues are messages in states

Sources: `/cues.html`, `/quick-start/saving-and-recalling-devices-state.html`.

Drag nodes from the device tree onto the timeline and their current values
become a cue in a new state. Dropping more onto a state adds or replaces
messages. **Snapshot** (Ctrl+L) copies the selected parameters' live values
into the cue; **Refresh** (Ctrl+R) updates every stored value to its current
live value. A cue with a trigger and no interval "floats" and can be fired by
an external control.

### Automations

Sources: `/processes/automation_float.html`, `/in-depth/automations.html`,
`/quick-start/writing-automations.html`, `/quick-start/states-and-automations-in-practice.html`.

- Kinds: 1D (Automation (float)), 2D (2D Spline), colour (gradient).
- Created by dropping a parameter on an interval, from the library, by
  right-clicking a value port ("Create Automation"), or by **Interpolate
  States**.
- Segments can be Power (curved by Shift+drag), Linear, or about 30 named
  easing curves, plus freehand drawing.
- **Tween mode**: the automation starts from the live value of its address
  instead of its drawn first value, for a smooth handover from live control.
- **Auto-sequence** (a preference): storing a second state creates
  automations for every parameter that changed.
- **Recording**: select addresses, right-click, "Record automations from
  here"; recording starts on the first message.
- Stacked automations in one slot: the front one is red, the others grey.

## 4. The device tree and the address model

### Devices

Sources: `/quick-start/working-with-devices.html`, `/devices.html`,
`/reference/protocols-and-formats.html`, every page under `/devices/`.

Everything outside score is a **device** in the Device explorer: a tree of
nodes and parameters with type, range and live value. Types listed in the
device table: OSCQuery, OSC, Minuit, CoAP, MQTT (network); Mapper, Local
(utilities); MIDI in/out, Serial, Joystick, Wiimote, GPS, Leapmotion, Raw I/O,
BLE (hardware); HTTP, WS (web); Art-Net (lights); Audio; Window, Camera,
Spout, Syphon, Shmdata, NDI (video). Other pages add Evdev, LSL, Sh4lt,
SpatGRIS, LED (NeoPixel over SPI), Kinect and Bitfocus Companion.

Notable details:
- **OSCQuery device** lists servers on the network and imports the whole
  namespace with types and ranges. **Minuit** does the same and is superseded
  by OSCQuery.
- **OSC device**: addresses come from **Learn** (records what arrives) or are
  added node by node. Namespaces export to disk.
- **MIDI in**: "Create whole tree" builds every possible message as an address
  (`device/channel/type/number`), or use Learn. Virtual MIDI ports on macOS and
  Linux.
- **Audio device**: sound-card channels become addresses (`audio:/out/0`,
  `audio:/out/main`); the root interval goes to `audio:/out/main`. You can add
  physical busses (channel maps) and virtual busses (internal aux sends).
  Several processes writing to one audio address are summed.
- **Art-Net**: Art-Net, sACN and ENTTEC USB Pro Mk1/Mk2 (Mk2 can receive).
  Fixtures in Open Fixture Library format appear as nodes; with none, 512 raw
  channels. Only one Art-Net device per network port.
- **Window**: a video output whose tree holds screen, position, size, render
  size and fullscreen, plus mouse, tablet (pressure, tilt, rotation) and
  keyboard input.
- **NDI**: in and out, NDI 5/6, and PTZ camera control as parameters.
- **Mapper**: a QML script declaring new parameters bound to others, with JS
  `read` and `write` transforms. It runs **permanently**, even when the score
  is stopped.
- **Serial, WS, HTTP**: QML scripts declare the tree and translate incoming
  text or bytes into address/value pairs (`onMessage`, `onBinary`, `onRead`);
  serial framing can be delimiter, SLIP, OSC-SLIP or size-prefixed.
- **Local**: score itself as an OSCQuery device, with play, stop, reinit and
  transport in ms. An "extended tree" preference adds every interval and
  process control.
- Devices cannot be added while playing (`/common-practices/8-live-coding.html`).

### Addresses, patterns and units

Sources: `/in-depth/pattern-matching.html`, `/in-depth/unit-system.html`,
`https://ossia.io/score/features/addresses.html`.

An address is `device:/path/to/param`. Patterns work at any level: `*`,
`{foo,boo}`, numeric ranges `foo.{5..23}` with a step `{5..23..7}`, character
classes `[a-z]`, `//` for any depth, `..` to go up, and `!` for "this node and
its numbered instances". One automation sent to `OSCdevice:/sub/*/level`
drives all levels.

After the path, `@[...]` selects part of a value: `@[1]` is the second array
element, `@[1][0]` reaches into nested arrays, and `@[color.hsv.h]` is the hue
of a colour stored as RGB (score converts, replaces the hue, converts back).

The **unit system** (`/in-depth/unit-system.html`) is a set of seven rules,
applied on every connection (cable, device read, device write):
1. A unit counts only when both sides have one from the same family; then the
   value is converted (1.5 m → 1500 mm).
2. When a unit counts, the receiver's range only clips.
3. Otherwise, ranges map: a value is scaled from the sender's range to the
   receiver's (1.5 in [0,2] → 7.5 in [0,10]).
4. A port without a unit accepts anything.
5. A value is never dropped because of a unit.
6. One component can be selected in a named unit.
7. On output, the device parameter's own clip mode applies.

### Parameter attributes (libossia)

Source: `https://ossia.io/ossia-docs/`, `/devices/serial-device.html`.

libossia, the library under score, lets every parameter carry: access mode,
domain (min/max or a set of values), bounding mode (free, clip, low, high,
wrap, fold; default free), repetition filter, unit, extended type, description,
tags, priority, recall_safe (presets skip it), refresh rate, step size, default
value, critical (prefer a reliable transport like TCP), disabled, muted,
hidden, zombie (remote source gone).

### Pattern-based processes

Sources: `/processes/pattern-applier.html`, `/processes/pattern-combiner.html`,
`/processes/sweeper.html`, `/processes/csv-recorder.html`, `/processes/teleplot.html`.

Because addresses form a tree, several processes take a pattern: Pattern
Applier spreads a list across matching addresses, Pattern Combiner combines
their values (for example a mean), Sweeper sends a value to each in turn,
CSV Recorder records them (and plays back), Teleplot streams them to a plotter.

## 5. The dataflow inside the timeline

### Processes, ports, cables

Sources: `/processes.html`, `/in-depth/modular-workflow.html`,
`/quick-start/working-with-audio.html`.

Processes have ports: audio (red), value/control (yellow/green), video
(white). Ports can be cabled to other processes, or given a device address
directly. A temporal view and a **nodal view** show the same score; processes
that do not depend on time (effects, generators) always show as nodes. Cables
can be hidden (Alt+Shift+G) once patching is done.

Quick patching: with a cable selected, double-clicking a library item inserts
it on the cable; with a port selected, it is inserted before or after that
port and the port's address moves to the new process; with a process
selected, it is chained after it.

### Audio routing

Sources: `/in-depth/audio-routing.html`, `/panels/mixer.html`, `/common-practices/4-audio.html`.

Audio mixes up the hierarchy by default: process → parent interval → parent
scenario → top of score → main stereo output. Cabling an audio outlet
elsewhere takes it out of that mix, unless **Propagate** is ticked on the port.
An interval can be marked a **bus** and then gets volume and pan in the Audio
panel. Every audio outlet has a gain sub-port that can be automated for fades.
Ports carry any number of channels.

### Polyphony by channel count

Source: `/docs/advanced/polyphony.html`, `/common-practices/14-spatial-audio.html`.

A mono Faust or Avendish effect fed N channels runs N times; sending a list
instead of a float to a control sets each channel separately. The docs say
this is implemented for Faust and some Avendish processes only.

## 6. Built-in processes worth knowing

Sources: the pages under `/processes/` (most read in part; see the state file).

- **Control**: LFO (8 shapes), Step sequencer, ADSR, Impulse/Free metronome,
  Tweener (tween between two inputs over the interval), Easetanbul (tween
  between incoming values), Interpolator and Nodes (weights from a 2D cursor),
  Poles (Gaussian arrays), Spammer (send faster than score's normal rate).
- **Mappings and data**: Mapping (float) (draw a transfer curve), Mapping Tool
  (learn min/max, deadzone, shape, wrap/fold), Calibrator (running min/max to
  0–1), Smooth (1€, low-pass, average, median), Rate limiter, Range filter,
  Value filter, Trigger (enter/leave a range), Object filter (jq subset),
  Array tools (combine, interleave, pad), Geo Zones (polygon zones with blended
  attributes).
- **Math**: ExprTK-based Micromap, Expression Value/Audio Generator/Filter,
  Arraygen, Arraymap; extra `random()` and Perlin `noise()`.
- **MIDI**: Piano roll (loads MIDI files), Patternist (pattern sequencer),
  Melodial and Patternal (MIDI from nested arrays), MIDI File Reader / Scroller
  / Scaler (Scala tunings), Arpeggiator, Chord, Scale, Quantifier.
- **Audio**: Sound file (raw, resample or Rubberband time-stretch; ACID tags
  or BPM in the filename mark loops), Audio Looper, effects (flanger, echo,
  compressor with sidechain, limiter, bitcrush), BarrVerb, Audio Particles,
  Wavecycle, Bytebeat, envelope, onset, pitch and spectral analysis.
- **Spatial audio**: DBAP, GBAP, Matrix and Matrix spatialization, Path
  Generator, Multi-Cursor Manager, Faust `sp.*` presets, abclib via packages,
  SpatGRIS control.
- **Video/GFX**: Video (FFMPEG, HAP on GPU, optional tempo sync), Image,
  ISF shaders, Vertex Shader Art, CSF compute shaders, Render Pipeline, Texgen
  (C++ per frame on CPU), Model Display, Object Loader (OBJ, PLY), Structure
  Synth (EisenScript), Sprite Reader, Lightness Computer and LED View.
- **AI**: AI Recognition (ONNX pose models such as BlazePose), Classifier and
  Regressor (RapidLib), Qwen LLM (local), prompt composer and interpolator.
- **Data files**: HDF5 readers (values and textures), CSV recorder.
- **System**: Process Launcher (external program lives as long as the
  process), Shell command (bash script, once), Control surface.

## 7. Code inside the score

Sources: `/processes/javascript.html`, `/processes/exprtk.html`,
`/processes/faust.html`, `/processes/puredata.html`, `/processes/cpp_jit.html`,
`/processes/shaders.html`, `/common-practices/8-live-coding.html`.

- **JavaScript (ES7 via QML)**: a `Script` object declares ports as child
  items (`ValueInlet`, `AudioOutlet`, `MidiInlet`, `FloatSlider`, `Enum`,
  `Toggle`...) and implements `tick(token, state)` plus start, stop, pause,
  resume. Value inlets give every message of the tick with its timestamp. A
  `TextureOutlet` turns the script into a GPU process that renders any QtQuick
  item. A script with compile errors is not saved.
- **ExprTK**: math expressions for audio and value generators and filters,
  with variables `x`, `px`, `po`, `a`/`b`/`c`, `t` (flicks), `pos`.
- **Faust**: .dsp files compile on drop and recompile from the editor.
- **Pure Data**: patches run through libpd; `adc~`/`dac~`, MIDI objects and
  `s`/`r` become ports, and `[r name @type float @range -1 1]` style
  attributes create proper controls.
- **C++ JIT** and **Texgen**: C++ compiled at run time, in-process (a crash
  takes score down).
- **Shaders**: ISF (fragment), VSA (vertex points), CSF (compute), Render
  Pipeline (raw raster). Each starts with a JSON header; inputs become
  controls and ports. The docs insist on ISF macros (`IMG_NORM_PIXEL` etc.)
  instead of `gl_FragCoord`, because backends differ in Y direction.
- Live coding: Compile or Ctrl+Enter swaps the code; invalid code leaves the
  old version running "to prevent unwanted loud noises and flashes".

## 8. Scripting the score itself

Sources: `/in-depth/scripting.html`, `/in-depth/scripting-api.html`,
`/panels/console.html`.

A console (Ctrl+Shift+C) and script files reach six global objects: `Score`
(edit the score, transport, devices, undo), `Util` (files, shell, UUIDs,
time conversion), `Device` (read and write live values), `Protocols` (raw UDP,
TCP, WebSocket, Unix sockets, HTTP, OSC parsing, MIDI 1 and 2), `System` and
`Library` (install packages). Examples: `Score.createBox(scenario, "00:00:10.000",
"00:01:15.000", 0.2)`, `Score.automate(itv, "foo:/bar")`,
`Score.setCurvePoints`, `Score.setSteps`. `Score.startMacro()` /
`Score.endMacro()` group edits into one undo step. `.mjs` modules in the
library can add items to a Scripts menu with keyboard shortcuts.

## 9. Interfaces and remote control

Sources: `/quick-start/interface-overview.html`, `/custom-ui.html`,
`/processes/controlsurface.html`, `/in-depth/remote.html`, `/devices/local-device.html`.

- The editor: Device explorer and libraries left, timeline centre, inspector
  right.
- **Custom UI**: `score --ui my.qml my.score` replaces the whole interface with
  a QML file. `Score.UI.PortSource`, `PortSink` and `AddressSource` bind
  widgets to process ports (by process name and port label or index) or to
  device addresses.
- **Control surface** process: drop addresses on it to get widgets chosen
  from their type, unit and range, active while the process runs.
- **WebSocket API** (JSON): score reports intervals and triggers as they start
  and stop and sends a heartbeat with progress, speed and gain; clients send
  Play, Pause, Stop, Transport (ms), Trigger, IntervalSpeed, IntervalGain,
  Message (any typed value to any address), listening on/off, and Console
  (JS code).

## 10. Monitoring and debugging

Sources: `/reference/preferences.html`, `/faq/monitor-activity.html`,
`/processes/value-display.html`.

- **Logging** + Messages panel (Ctrl+Shift+G): all messages in and out of the
  clicked process.
- **Benchmark**: relative CPU cost of each process.
- Device explorer listening during playback can be switched off to save CPU.
- Viewers as processes: Value Display, Signal Display, LED View, Point2D View.
- The code editor's lower pane shows compile errors by line.

## 11. Running a show

Sources: `/reference/commandline.html`, `/faq/nogui.html`,
`/in-depth/embedded.html`, `/quick-start/installation.html`,
`/reference/protocols-and-formats.html`.

- `ossia-score --no-gui --no-restore --wait 5 --autoplay show.score` is the
  documented start-up line for installations (`--wait` lets heavy plug-ins
  load first).
- Platforms: Windows, macOS (Apple Silicon and Intel), Linux (AppImage,
  Flatpak, AUR, Nix), FreeBSD, Raspberry Pi 3/4 and other ARM boards, and
  partly the web (WebAssembly with SDL audio).
- On the Pi, `ossia-score-eglfs` renders full screen with no window system.
  The docs advise a light window manager or none, ALSA instead of PulseAudio,
  and an RT kernel.
- Transport sync: JACK transport only, as master or slave. SMPTE, MIDI clock
  and Ableton Link are listed as plans.
- Audio back-ends include JACK, PipeWire, ALSA, CoreAudio, WASAPI, ASIO;
  plug-ins: VST 2/3, CLAP, LV2 (Linux), JSFX, AirWindows, Faust, Pd.

## 12. Files and the library

Sources: `/in-depth/media.html`, `/panels/library.html`, `/presets.html`,
`/processes/soundfile.html`.

Relative media paths are looked for in the project folder (where the .score
file is). `<PROJECT>:` and `<LIBRARY>:` prefixes name the project or the user
library. The system library lives in `Documents/ossia/score/packages` and is
filled from the public score-user-library on first launch; it holds presets,
shaders, Faust files, fixtures, scripts and skins. Score fragments save as
`.scenario`, states as `.cues`. Process presets are listed as "not available
yet". WAV/AIFF at the project sample rate stream from disk; other formats load
into RAM.

## 13. ossia-max: the same parameter model inside Max

Sources: `https://ossia.io/ossia-docs/`, `https://ossia.io/site-libossia/features/max.html`,
`/devices/local-device.html`.

libossia, the library under score, has a Max binding, ossia-max. What the
libossia reference says about it:
- It needs at least Max 7. The install note says to extract the package into
  `Documents/Max 7/Packages`, with Package Manager install "upon public
  release". That text looks old; current status was not checked.
- By default it creates one global device for all parameters, configured with
  the `[ossia]` object; `(expose oscquery)` exposes it with default ports 9999
  (OSC) and 5678 (WebSocket). `[ossia.device]` declares a patcher and its
  subpatchers as a separate device.
- Nodes are called "models" in ossia-max, from its Jamoma origins
  (`[ossia.model]`). Values are read and written remotely with
  `[ossia.remote]`. A `namespace` message to `[ossia.model]`, `[ossia.device]`
  or `[ossia]` returns all parameters with current values.
- Attributes map to Max attributes: `@clip` for bounding (with `both` meaning
  clip), `@repetitions` (on by default, the reverse of ossia's filter), `@unit`.
  Commas inside values have to be written as pipes.
- The score docs' Local device page mentions a Max patcher in the ossia-max
  package for controlling score's transport.

The libossia "Max/MSP bindings" feature page is a stub ("TODO"). ossia-max is
**not installed** on this machine (`~/Documents/Max 9/Packages` has no ossia
folder; `query_packages.py search ossia`: no matches). Nothing here was tested
in Max, and these object names have not been checked against an ossia-max
refpage.

---

## Where Max is ahead

Each point is checked against Max's own docs or registry, as noted.

- **Message-level control of order.** Max's depth-first, right-to-left order
  and `trigger` give exact control of what happens first within one event
  (`max_system_model.json` dimension 2). score's docs say almost nothing about
  order inside a tick.
- **Runs without a playhead.** A Max patch computes whenever a message arrives
  (`max_system_model.json` dimension 1). In score, a mapping only runs inside a
  playing interval, so "always on" logic needs a trigger trick
  (`/common-practices/12-data-processing.html`), apart from the Mapper device.
- **Reuse with arguments and instances.** Abstractions with `#1`–`#9`,
  `patcherargs`, `#0` and `poly~` replication (`max_system_model.json`
  dimension 8). score's docs describe saved `.scenario` fragments but no
  arguments or instancing.
- **Debugging depth.** Watchpoints, stepping, probes on cords and Illustration
  Mode (`max_system_model.json` dimension 14) have no counterpart in score's
  docs.
- **Jitter's matrix world and geometry.** Max has a large CPU matrix library,
  `jit.gl.model` for OBJ/Collada/Blender models with skinned animation
  (refpage), and Jitter Geometry. score loads OBJ and PLY only
  (`/processes/object-loader.html`).
- **Signal-rate patching.** MSP and gen~ patch audio sample by sample in a
  graph; score's audio processes are larger units or code (JS, Faust, ExprTK).
- **Documentation coverage.** Every Max object has a refpage. Many score
  device and process pages are stubs (HTTP, Joystick, LSL, DBAP, Gestures,
  Display/Graphics/Mapping utilities, Text).
- **Ecosystem and Live.** Max for Live, RNBO export and thousands of package
  objects (`max_system_model.json` dimension 18; the repo's package library).
