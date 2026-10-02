# TouchDesigner Insights

Notes on how TouchDesigner (Derivative) works, written for a reader who knows
Max and not TouchDesigner. Every entry comes from a page of the official wiki
at `https://docs.derivative.ca/` that was fetched and read on 2026-10-02. Page
names below are wiki titles; the URL is `https://docs.derivative.ca/` plus the
title with spaces turned into underscores (the state file holds each exact URL).

Nothing here is from memory of the product. Where a page was only partly read,
the state file says so. Operator, parameter and feature names are spelled as
the docs spell them.

Companion files: `TOUCHDESIGNER_CRAWL_LOG.md` (what was read),
`touchdesigner_crawl_state.json` (per-page status),
`touchdesigner_max_gap_candidates.json` (things Max may lack).

---

## 1. The core model

### Operators come in seven families, and a wire only joins one family

Sources: `Operator`, `Operator Family`, `TOP`, `CHOP`, `SOP`, `DAT`, `MAT`,
`COMP`, `POP`, `Intro to TouchDesigner`.

A node is an "operator" (OP). Each belongs to one family, and each family
carries one kind of data:

| Family | Carries | Runs on |
|---|---|---|
| TOP (Texture Operator) | images | GPU |
| CHOP (Channel Operator) | named channels of samples: control, motion, audio | CPU |
| SOP (Surface Operator) | 3D geometry (the older family) | CPU |
| POP (Point Operator) | 3D points, primitives and any numeric attribute | GPU |
| DAT (Data Operator) | text, as free text or a table of string cells | CPU |
| MAT (Material) | shaders applied to geometry | GPU |
| COMP (Component) | a container holding its own network | — |

Families have their own colour, and a wire can only join two operators of the
same family. To cross families you use a converter operator (`TOP to CHOP`,
`CHOP to TOP`, `CHOP to DAT`, `DAT to CHOP`, `SOP to CHOP`, `CHOP to SOP`,
`SOP to DAT`, `POP to TOP`, …) or a parameter that names another operator.

For a Max reader: this is a stricter version of the split between Max
messages, MSP signals and Jitter matrices. The nearest mapping is CHOP ≈
control data plus signals, TOP ≈ `jit.gl` textures, DAT ≈ `coll` / `dict` /
`text`, COMP ≈ a subpatcher. There is no single "message" type that every
object accepts.

Within a family an operator is either a generator (no input, makes data) or a
filter (one or more inputs). Data flows left to right: inputs are on the left
edge of a node, outputs on the right.

### Every operator shows its own output

Sources: `Viewer`, `Network`, `First Things to Know about TouchDesigner`.

Each node has a viewer inside it showing its current output: the image for a
TOP, the channel graph for a CHOP, the table for a DAT, a 3D view for
geometry. The docs call this WYSIWID, "What You See Is What It's Doing". A
viewer can be made active so it takes mouse input. In Max terms it is as if
every object box had a `jit.pwindow`, `scope~` or `jit.cellblock` built in.

### Cooking is pull-based

Sources: `Cook`, `Dependency`, `Procedural`, `Event`.

Computing an operator is called cooking. An operator cooks only when two
things are true: something asks for its data, and something it depends on has
changed. What asks: a downstream node that is itself cooking, a parameter that
refers to it, a visible viewer, an export target, or a script calling `cook()`.
The frame's pulls start from the outputs: display windows, audio devices,
network and device output operators.

So changing an upstream value does not push a recalculation downstream. It
marks the node dirty, and the node cooks when a consumer next asks. A node
nobody looks at does not cook. A few operators always cook when asked (the
`Render TOP`, the device and network "In" operators) and output operators such
as `Movie File Out TOP` cook every frame.

This is the opposite of Max's message passing, where an event at the top of a
chain runs everything under it at once, right to left. TouchDesigner does also
have a push side: the event operators. `CHOP Execute DAT`, `Parameter Execute
DAT`, `DAT Execute DAT`, `Panel Execute DAT`, `OP Execute DAT`, `Execute DAT`
and the network and device DATs run Python callbacks when something happens.
Those callbacks usually set parameters, and the result is then pulled as usual.

### Parameters, and the four ways a parameter gets its value

Sources: `Parameter`, `Parameter Mode`, `Parameter Expression`, `Export`,
`CHOP Export`, `Binding`, `Bind CHOP`, `Pulse`.

Operators are configured by parameters (numbers, toggles, menus, strings,
operator paths, pulse buttons, Python objects), grouped on pages in a
parameter dialog. They play the role of Max attributes, but each one can be in
one of four modes:

1. **Constant** — a typed value.
2. **Expression** — a Python expression evaluated as needed, for instance
   `op('lfo1')['chan1'] * 2`.
3. **Export** — a CHOP channel overrides the parameter. Exports are set up by
   dragging a channel onto a parameter, or in bulk by naming channels
   `path:parameter`. A DAT table can export too (`DAT Export`), including to
   string parameters.
4. **Bind** — a two-way link. Changing either end changes both. A table cell,
   a `Bind CHOP` channel or a panel value can be the master. The `Bind CHOP`
   can merge several sources (say MIDI and OSC) onto one parameter and has a
   pickup option.

A "pulse" parameter is a momentary trigger, the nearest thing to a Max bang.

### Components, cloning and replication

Sources: `Component`, `Clone`, `Replicator COMP`, `.tox`, `.toe`,
`Custom Parameters`, `Component Editor Dialog`, `Internal Parameters`,
`Internal Operators`, `Parent Shortcut`, `Global OP Shortcut`, `Extensions`,
`Storage`, `Tag`.

A COMP holds a network. `In` and `Out` operators inside it become its inputs
and outputs. Components nest, which gives every operator a path like
`/project1/geo1/noise1`. A whole project saves as a `.toe` file; one component
saves as a `.tox` file, the unit of reuse (the role an abstraction plays in
Max).

- **Custom parameters.** A component can be given its own parameter pages with
  typed parameters (float, int, menu, toggle, pulse, string, colour, operator
  reference …), each with label, range, default, help text and an enable
  expression. This is how a component presents an interface. Custom names
  start with a capital letter; built-in names are lower case.
- **Clone.** Setting a component's Clone parameter to a master makes its
  contents follow the master. Top-level parameter values stay independent, and
  nodes flagged Immune are left alone.
- **Replicator COMP.** Makes one copy of a master per row of a table, adds and
  removes copies as the table changes, and runs a callback per copy. The docs
  call it the "for-loop" of operators.
- **Shortcuts.** `parent.Name`, `op.Name` and `iop.Name` reach a named
  component from anywhere, so paths survive moving things. `ipar.Name.Par` is
  a component-local parameter set, used like persistent local variables.
- **Extensions.** A Python class attached to a component adds methods and
  properties to it; capitalised members can be "promoted" and called on the
  component directly.
- **Storage** is a Python dictionary on every operator, saved with the file.
- **Tags** are free strings on operators that scripts and `OP Find DAT` can
  search.

### Flags

Sources: `Flag`, `Lock Flag`.

Flags are on/off states on a node, separate from parameters: Viewer, Viewer
Active, Bypass, Lock (freeze the output and save it in the file), Cooking,
Immune, and for 3D objects Render, Display and Pickable.

---

## 2. Data types in detail

### CHOP channels

Sources: `CHOP`, `Anatomy of a CHOP`, `Channel`, `Sample`, `Scope`,
`Extend Conditions`, `Units`, `Uses of CHOPs`.

A CHOP outputs a set of named channels. Each channel is an array of 32-bit
float samples over a shared start–end interval, at a sample rate. One-sample
channels are control values; long ones are motion curves or audio. Many CHOPs
have a Scope parameter that limits which channels they affect, by name
pattern. Parameters that take a time can be given in samples, frames or
seconds.

### Time slicing

Sources: `Time Slicing`, `Absolute Time`.

A time slice is the span from the last cooked frame to the current one. A
time-sliced CHOP outputs just the samples in that span, so audio and filters
stay continuous when the frame rate drops and frames are skipped. If a frame
is skipped, the slice is two frames long. This is how TouchDesigner carries
audio in the same graph as control data: an audio CHOP at 44100 Hz delivers
735 samples per frame at 60 fps. Max keeps audio in a separate signal graph
with a fixed vector size instead.

### TOP images

Sources: `TOP`, `Pixel Formats`, `3D Texture`, `Cube Map`, `Color Space`.

TOPs live on the GPU. Pixel formats range from 8-bit fixed to 32-bit float,
with one-, two- and four-channel variants, so a TOP can hold data as well as
pictures. Point clouds are commonly stored as float TOPs with XYZ in RGB.
Textures can be 2D, 3D, 2D arrays or cube maps, and from the 2025 builds many
TOPs process every slice of a 3D texture. TOPs work in linear colour; input
and output colour spaces are declared per operator, and `OpenColorIO TOP`
applies OCIO transforms.

### DAT text and tables

Sources: `DAT`, `Table DAT`, `Evaluate DAT`, `JSON DAT`, `FIFO DAT`,
`Folder DAT`, `OP Find DAT`.

A DAT is either free text or a table of string cells. Scripts, shaders and
callbacks all live in DATs. Tables are processed by wiring table operators
together (select, merge, sort, evaluate, substitute …), so table handling is
dataflow, not script. `JSON DAT` filters JSON with JSONPath. `Folder DAT`
lists a folder and watches it. `OP Find DAT` lists operators matching
criteria (type, name, tags, parameter values), which makes the network itself
queryable as a table.

### Geometry: SOPs and POPs

Sources: `SOP`, `POP`, `Learning About POPs`, `Dimension`, `POP Dimension`,
`Mapping POP Attributes to Parameters`, `Write a GLSL POP`, `GLSL POP`,
`Particle POP`, `Feedback POP`, `Ray POP`, `Neighbor POP`, `Trace POP`,
`Projection POP`, `Point File In POP`, `Hardware Ray Tracing`.

SOPs are the original CPU geometry operators. POPs are a newer GPU family that
the docs present as their replacement. A POP holds points, vertices and
primitives (points, lines, line strips, triangles, quads), each with named
attributes of chosen type and size. Operators do maths on attributes without
code, and several let an attribute drive a parameter per point. `GLSL POP`
runs a compute shader over the attributes. `Particle POP` is a particle system
built as a visible feedback loop that the user can edit. `Ray POP` casts rays
against geometry and can use hardware ray tracing. `Neighbor POP` finds
nearest points with a spatial hash. `Trace POP` turns an image into line
strips or triangles. POP data can be rendered, or sent on to DMX fixtures and
lasers.

---

## 3. Time, timelines and cueing

Sources: `Timeline`, `Component Time`, `Root Time`, `Timepath`, `Time COMP`,
`Frame Rate`, `Timeline CHOP`, `Beat CHOP`, `Beat Dialog`.

There is a global timeline with transport, a frame rate (default 60), a
start–end range, tempo and time signature. Any component can have its own
timeline (a `Time COMP` at `local/time`) with its own rate and range, and
everything inside inherits it. `Beat CHOP` makes ramps and pulses locked to
the tempo; the Beat dialog sets tempo by tapping. Absolute time counts up from
launch and never loops.

### Timer CHOP and the Initialize / Start convention

Sources: `Timer CHOP`, `Initialize Start`, `Sequencer CHOP`.

`Timer CHOP` is the general timing engine. It counts a length in seconds,
frames or samples and outputs fraction, counters and state channels
(initializing, ready, running, done). It can hold several segments defined in
a table, run them in series or in parallel, cycle, change speed, jump to a
time or timecode, and call Python callbacks at each stage. The docs describe
using it for cue lists, playlists and state machines.

Many other operators share its control scheme (Initialize, then Start, with
Play, Speed, Cue and "Go to Done"): `Bullet Solver COMP`, `Particle POP`,
`Feedback POP`, `Engine COMP`, `Notch TOP`, the `moviePlayer` palette
component and others. The point of the two-step scheme is that initialisation
can take several frames, and Start is then frame-exact.

### Keyframe animation

Sources: `Keyframe Animation`, `Animation Editor`, `Animation COMP`,
`Keyframe CHOP`.

Keyframed channels live in an `Animation COMP` and are edited in the Animation
Editor, a curve editor with keys and tangent handles. A `Keyframe CHOP` inside
plays them, driven by the timeline, an index, or a lookup channel.

### Timecode

Sources: `Timecode`, `Timecode CHOP`, `LTC In CHOP`.

Timecode is a first-class value (`tdu.Timecode`). Movie players, the timer,
video inputs and others expose a `.timecode` member. `LTC In CHOP` and
`LTC Out CHOP` read and write SMPTE timecode on an audio channel, and
`Timecode CHOP` generates and converts it.

---

## 4. Rendering

Sources: `Rendering`, `Render TOP`, `Render Pass TOP`, `Geometry COMP`,
`Camera COMP`, `Light COMP`, `Environment Light COMP`, `Instance`,
`Multi-Camera Rendering`, `Transparency`, `Rendering Shadows`, `PBR MAT`,
`GLSL MAT`, `Line MAT`, `Deforming Geometry (Skinning)`, `Render Pick DAT`,
`Render Pick CHOP`, `Vulkan`.

A scene is built from object components: `Geometry COMP` (holds the geometry
and takes a material), `Camera COMP`, `Light COMP` and others, parented by
wiring them vertically. A `Render TOP` turns a camera, geometry and lights
into an image, which is then an ordinary TOP for compositing.

- A `Geometry COMP` can draw one instance per CHOP sample, table row, pixel or
  point, with transforms and colours taken from that data.
- One `Render TOP` can render several cameras in one pass; `Render Select TOP`
  picks out each result.
- `Render Pass TOP` adds passes that share depth with a previous render.
- Transparency can be sorted by hand or done order-independently by depth
  peeling.
- Materials: `PBR MAT`, `Phong MAT`, `GLSL MAT` (custom shaders), `Line MAT`
  (wide lines with caps and distance falloff), `Constant MAT` and others.
  `Substance TOP` loads Substance materials and feeds `PBR MAT`.
- `Render Pick DAT` and `Render Pick CHOP` report what is under a screen
  point: object, position, normal, UV, instance id. Several points at once are
  supported, for multi-touch on a 3D scene.
- The graphics API is Vulkan (through MoltenVK on macOS). Geometry shaders are
  gone on macOS; compute shaders work on both platforms.

Scene import: `FBX COMP`, `USD COMP`, `glTF In COMP`, `Alembic In POP`. Each
builds a node hierarchy from the file. `glTF Out COMP` and `Alembic Out POP`
export (sources `FBX`, `USD In TouchDesigner`, `GlTF`, `Alembic`).

Physics: `Bullet Solver COMP` with `Actor COMP`, `Force COMP` and
`Constraint COMP` runs rigid bodies (source `Bullet Dynamics`). `NVIDIA Flex
Solver COMP` and `NVIDIA Flow TOP` do particle and smoke/fire simulation on
NVIDIA cards.

Shaders: `GLSL TOP` runs a pixel shader or a compute shader into an image
(sources `Write a GLSL TOP`, `Compute Shader`, `GLSL TOP`). GLSL 4.60 is the
supported version.

---

## 5. Video

### Playback and recording

Sources: `Movie File In TOP`, `Movie Playback`, `Hap`, `NotchLC`, `OpenEXR`,
`Movie File Out TOP`, `Recording Movies with Audio`, `Export Movie Dialog`,
`File Types`, `Palette:moviePlayer`, `Palette:movieEngine`.

`Movie File In TOP` plays movies, stills and image sequences. The docs break
playback into three stages (read from disk, decode, upload to GPU) and expose
each for tuning: a pre-read frame count, a hardware decode option on NVIDIA
cards, and a "High-Performance Read" mode for very high data rates. The Hap
family and NotchLC decode on the GPU. An attached `Info CHOP` reports read and
decode times and dropped frames.

`Movie File Out TOP` records movies, stills and image sequences, with audio.
Turning the Realtime flag off, or using the Export Movie dialog, renders every
frame however long it takes.

The `moviePlayer` palette component adds cue points, transitions and gapless
switching between files.

### Devices and streams

Sources: `Video Device Out TOP`, `Interoperability`, `NDI`, `ST2110`,
`Video Stream Out TOP`, `Video Streaming User Guide`, `RTMP`, `RTSP`, `SRT`,
`Touch Out TOP`, `Syphon Spout In TOP`, `Shared Memory`, `Web Render TOP`,
`Screen Grab TOP`, `Photoshop In TOP`.

- Capture and output cards: Blackmagic Design, AJA, Bluefish444 and Deltacast,
  through `Video Device In TOP` and `Video Device Out TOP`, with embedded
  audio and timecode. `ST2110 In TOP` / `ST2110 Out TOP` handle uncompressed
  video over IP.
- `NDI In TOP`, `NDI Out TOP` and `NDI DAT`.
- `Video Stream Out TOP` sends RTMP or SRT, or serves RTSP, with H.264, H.265
  or AV1 from the NVIDIA hardware encoder. `Video Stream In TOP` receives.
- `Touch Out TOP` / `Touch In TOP` send video between TouchDesigner instances.
- `Syphon Spout In TOP` / `Syphon Spout Out TOP` and the `Shared Mem` operators
  share textures and data with other programs on the same machine.
- `Web Render TOP` renders a web page (Chromium Embedded Framework) into a
  texture; `Audio Web Render CHOP` takes its sound.

### Output to displays

Sources: `Window COMP`, `Window`, `Perform Mode`, `Designer Mode`,
`Window Placement Dialog`, `Multiple Monitors`, `Perfect Playback`,
`Direct Display Out TOP`, `Using Multiple Graphic Cards`, `Monitors DAT`,
`Palette:windowCanvas`.

A `Window COMP` shows a panel or operator in an OS window. Perform Mode shows
only one chosen window and drops the editor, for shows. The docs recommend one
window spanning all outputs over several windows. `Perfect Playback` explains
what is needed for no dropped frames: matching rates, vertical sync, and
exclusive fullscreen. `Direct Display Out TOP` drives GPU outputs without the
Windows desktop at all (workstation NVIDIA cards). A process can be pinned to
one GPU from the command line (GPU affinity).

---

## 6. Projection mapping

Sources: `Projection Mapping`, `Palette:kantanMapper`, `Palette:camSchnappr`,
`Palette:projectorBlend`, `Palette:stoner`, `Palette:sweetSpot`,
`Quad Reprojection`, `Palette:quadReproject`, `Projection TOP`,
`Palette:domeViewer`, `MPCDI`, `MPCDI TOP`, `Vioso`, `Scalable Display TOP`,
`How-to calibrate your projector with Scalable Displays`, `Lens Distort TOP`.

Mapping is mostly done with ready-made components from the Palette (the
built-in library of `.tox` components):

- `kantanMapper` — draw quads and freeform bezier shapes over the projector
  output, then give each a texture or use it as a mask.
- `camSchnappr` — match a virtual camera to a real projector by clicking known
  points of a 3D model on the real object. Uses OpenCV camera calibration.
- `projectorBlend` — edge blending for a grid of projectors.
- `stoner` — corner pin plus a bezier grid warp; also outputs a displacement
  map for the `Remap TOP`.
- `sweetSpot` and Quad Reprojection (a `Camera COMP` feature) — render so that
  the picture looks right from one viewing position; the quad version renders
  each flat LED panel at native resolution with no second warp.
- `Projection TOP` — converts cube map renders to fisheye or equirectangular
  for domes; `domeViewer` previews a dome.

Calibration files from outside tools load directly: `MPCDI TOP`, `Vioso TOP`,
`Scalable Display TOP`.

---

## 7. Lighting, DMX and lasers

Sources: `DMX`, `Art-Net`, `SACN`, `DMX Out CHOP`, `DMX Fixture POP`,
`DMX Out POP`, `DMX Map DAT`, `Art-Net DAT`,
`GDTF and MVR in TouchDesigner`, `Pan Tilt CHOP`, `Lasers`, `Laser CHOP`,
`Laser Device CHOP`.

- `DMX Out CHOP` and `DMX In CHOP` speak DMX over Enttec USB devices, Art-Net,
  sACN and KiNET. Each channel is one DMX address; a routing table sets net,
  subnet and universe.
- `DMX Fixture POP` treats each primitive as a fixture and maps point
  attributes (colour, position …) onto a channel profile, including 16-bit
  channels. `DMX Out POP` merges fixtures and sends them. `DMX Map DAT` shows
  the resulting universes.
- GDTF fixture files and MVR rig files can be parsed (the `TDGdtf` package) to
  build those profiles.
- `Pan Tilt CHOP` works out pan and tilt angles to aim moving heads at a
  target.
- `Laser CHOP` turns points and lines into a sample stream with blanking and
  corner handling; `Laser Device CHOP` sends it to EtherDream, Helios or
  ShowNET hardware. `Pangolin CHOP` talks to Pangolin Beyond.

---

## 8. Audio

Sources: `Creating Audio with CHOPs`, `VST`, `Audio VST CHOP`,
`Audio Render CHOP`, `Audio Binaural CHOP`, `Dante`, `Palette:audioAnalysis`,
`TDAbleton`, `Ableton Link CHOP`, `TDBitwig`.

Audio is CHOP data: `Audio Device In CHOP`, `Audio File In CHOP`,
`Audio Oscillator CHOP`, filter and EQ CHOPs, `Audio Device Out CHOP`.
`Audio VST CHOP` hosts VST3 plug-ins and exposes their parameters as operator
parameters. `Audio Render CHOP` (Steam Audio) spatialises sources from the
positions of 3D objects in the scene, to binaural, surround or ambisonics.

The audio tool set is small next to MSP. The docs lean on outside tools:
`TDAbleton` controls and reads Ableton Live (it uses Max for Live devices
where needed) and `TDBitwig` does the same for Bitwig.

---

## 9. Control I/O, sensors and tracking

Sources: `Interoperability`, `MIDI`, `MIDI Mapper Dialog`, `OSC`, `TUIO`,
`MultiTouch`, `Multi Touch In DAT`, `Arduino`, `Palette:firmata`,
`Serial DAT`, `Kinect`, `Kinect Azure TOP`, `Orbbec`, `RealSense`, `ZED`,
`OAK-D`, `Nuitrack TOP`, `Leap Motion`, `LIDAR`, `Hokuyo CHOP`,
`Blob Track CHOP`, `Blob Track TOP`, `Body Track CHOP`, `Face Track CHOP`,
`BlackTrax`, `PosiStageNet CHOP`, `OptiTrack In CHOP`, `FreeD In CHOP`,
`Stype`, `MoSys`, `Optical Flow TOP`, `NVIDIA Background TOP`,
`NVIDIA Upscaler TOP`, `OpenCV`, `Palette:TDVR`.

The `Interoperability` page is the docs' own list of what TouchDesigner
connects to. Beyond MIDI, OSC, serial and HID:

- Depth and tracking cameras each have their own operators: Kinect, Kinect
  Azure, Orbbec, RealSense, ZED, OAK-D, Nuitrack (skeletons), Leap Motion.
- LIDAR scanners: Hokuyo, Ouster, SICK, Leuze. `Blob Track CHOP` finds and
  follows blobs in a 2D scan.
- Stage tracking: BlackTrax, PosiStageNet, OptiTrack, and camera tracking by
  FreeD, Stype and MoSys with matching lens distortion.
- AI operators on NVIDIA cards: `Body Track CHOP`, `Face Track CHOP`,
  `NVIDIA Background TOP` (person segmentation), `NVIDIA Upscaler TOP`,
  `Optical Flow TOP`.
- OpenCV and NumPy ship with the built-in Python, and a TOP converts to and
  from a NumPy array.
- VR headsets through OpenVR and Oculus operators.

Many of these are Windows-only or NVIDIA-only; the `MacOS` page lists what is
missing on a Mac.

---

## 10. Building interfaces

Sources: `Panel`, `Panel Component`, `Panel Value`, `Panel Toolset`,
`Container COMP`, `List COMP`, `Table COMP`, `Parameter COMP`,
`OP Viewer COMP`, `OP Viewer TOP`, `Text COMP`, `Geo Text COMP`,
`Text Formatting Codes`, `GLSL COMP`, `Select COMP`, `Widgets`,
`Palette:autoUI`, `Palette:lister`, `Drag-and-Drop`, `Annotate COMP`.

Interfaces are built from panel components: `Container COMP`, `Button COMP`,
`Slider COMP`, `Text COMP`, `List COMP`, `Table COMP` and others, nested like
a scene graph. A panel's look is usually a TOP. Its state is a set of "panel
values" (select, u, v, rollover, state …) read with a `Panel CHOP` or a
`Panel Execute DAT`.

- `Parameter COMP` shows any operator's parameter dialog as a panel.
  `autoUI` builds a widget UI from a component's custom parameters.
- `OP Viewer COMP` puts any operator's viewer in a panel. `OP Viewer TOP`
  turns a viewer or panel into an image, and still passes interaction through.
- `List COMP` draws large lists through Python callbacks; `lister` builds on
  it.
- `Text COMP` and `Geo Text COMP` render resolution-independent text (Slug
  library) with inline formatting codes and per-block layout tables.
- Widgets are a library of ready controls in the Palette.

There is no separate "presentation view": the interface is a component tree
you build, shown in a `Window COMP`.

---

## 11. Scripting and extending

Sources: `Python`, `Working with OPs in Python`, `Python Classes and Modules`,
`Script`, `Script CHOP`, `Script TOP`, `Script SOP`, `Script DAT`, `NumPy`,
`Python threading in TouchDesigner`, `Python Callback System`, `TDFunctions`,
`TDStoreTools`, `Custom Operators`, `CPlusPlus TOP`, `Logger`, `Variables`.

Python (3.11) is the scripting language everywhere: parameter expressions,
callbacks, extensions and the Textport console. `op('name')` returns an
operator, `.par` its parameters. The `Script` operators produce a family's
data from Python. C++ plug-ins can be loaded as `CPlusPlus` operators or
installed as Custom Operators that appear in the operator menu. An older
language, Tscript, survives for old files.

Python runs on the main thread, so slow scripts drop frames; a Thread Manager
exists to move work off it.

---

## 12. Networking and multi-machine sync

Sources: `Network Protocols`, `Web Server DAT`, `Web Client DAT`,
`WebSocket DAT`, `Socket.IO`, `TCP/IP DAT`, `MQTT`, `MQTT Client DAT`,
`WebRTC`, `WebRTC DAT`, `Palette:webRTCPanel`, `Palette:remotePanel`,
`Touch In CHOP`, `Sync`, `Syncing Multiple Computers`, `Sync CHOPs Common`,
`Hardware Frame Lock`, `Touch In/Out Synced Ports`, `TDSynchro`,
`Engine COMP`, `TouchEngine`, `RenderStream`.

- Network operators cover HTTP client and server, WebSocket, Socket.IO, raw
  TCP and UDP, MQTT, and WebRTC (video, audio and data, with sample
  signalling components). Most deliver messages to Python callbacks.
- `remotePanel` and `webRTCPanel` show a panel on another machine or in a
  browser and send interaction back.
- The docs name five levels of sync between machines, from none up to "tight
  software sync plus hardware sync". `Sync Out CHOP` and `Sync In CHOP` hold
  every machine to the same frame by making them wait for each other (Pro
  licence). Hardware frame lock with NVIDIA Quadro Sync cards then makes the
  displays swap together. The docs also explain why feedback and particle
  systems drift apart across machines and how to keep a show deterministic.
- `Engine COMP` runs a `.tox` in a separate process and exchanges TOPs, CHOPs
  and DATs with it. The same engine, TouchEngine, lets other programs load a
  `.tox`: an Unreal Engine plug-in, and the media servers and tools the page
  lists. `RenderStream` operators let disguise drive a project.

---

## 13. Performance tools

Sources: `Optimize`, `Performance Monitor`, `Perform CHOP`, `Perform DAT`,
`Palette:probe`, `Info CHOP`, `Info DAT`, `Error DAT`, `Examine DAT`,
`Safe Mode`.

Middle-clicking a node shows its cook count and last cook time. The
Performance Monitor lists everything that cooked in a frame, in order, with
times, and can wait for a frame that runs over a set length. `probe` draws
CPU and GPU time per node as a live map. `Perform CHOP` gives frame rate,
cook time and dropped frames as channels. `Info CHOP` and `Info DAT` expose
an operator's internal state (for a movie: decode time, queue length, dropped
frames). The `Optimize` page gives a method: find out whether CPU or GPU is
the bottleneck first, for instance by dropping the render resolution.

---

## 14. Deployment

Sources: `TouchPlayer`, `Privacy`, `Virtual File System`, `Project Packager`,
`MacOS`, `TouchDesigner Video Server Specification Guide`,
`Storage Technology and TouchDesigner`.

- TouchPlayer runs a project in Perform Mode with no editor.
- Privacy (set with a Pro licence) password-protects a project or a single
  component so it runs but cannot be opened. A component can also be tied to a
  CodeMeter dongle, so its author can license it.
- The Virtual File System embeds media and other files inside a `.toe` or
  `.tox`, addressed with a `vfs:` path.
- Project Packager builds a Windows installer around a project.
- Licence tiers gate features: Non-Commercial is limited to 1280×1280, and
  some operators need Commercial or Pro.
- The docs include hardware guidance for building video servers, with measured
  codec data rates.

---

## 15. Where the two tools differ most (summary for planning)

These are observations from the pages above, not a ranking.

- TouchDesigner's graph is typed by family and pulled by its outputs; Max's
  is message-driven and pushed by events.
- TouchDesigner puts a live viewer in every node; Max shows data where you add
  a display object.
- Every TouchDesigner parameter can hold an expression, an export or a
  binding; Max attributes are set by messages or by `attrui` / `pattr`.
- TouchDesigner ships show-industry connections as operators (DMX, lasers,
  timecode, capture cards, NDI, tracking systems, projector calibration
  files). In Max these come from packages or are built by hand, where they
  exist.
- TouchDesigner's audio is thin next to MSP, and its own docs point to
  Ableton Live, Bitwig and VST plug-ins for serious audio work.
