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
`touchdesigner_max_gap_candidates.json` (things Max may lack, and from
session 2, things both tools have that TouchDesigner does differently).

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

---

## 16. Shared concepts, different approaches

Added in session 2 (2026-10-02). Session 1 looked for things Max lacks. This
section looks at things both tools have and asks how TouchDesigner does them,
and what a Max patcher should take from that. Each entry names the wiki pages
it came from. The Max half of each comparison was checked against Max's own
refpages, object registry and userguide; the details of those checks are in
the matching entries of `touchdesigner_max_gap_candidates.json` (the 50 items
added in session 2; they are the ones with an `advice` field).

Two things were assembled from documentation and not run in Max: the custom
texture-feedback wiring, and driving several movies by frame number. They are
marked where they appear.

### OSC

Sources: `OSC In CHOP`, `OSC Out CHOP`, `OSC In DAT`, `OSC Out DAT`, `OSC`,
`IOS and OSC`, `TouchOSC`.

- Incoming addresses turn into named channels by themselves. There is no
  routing step: a channel appears the first time a control moves. A scope
  pattern keeps or drops addresses, and a setting strips leading address
  segments.
- A second operator keeps a first-in-first-out table of whole messages, with
  type tags, optional bundle timestamps, and a callback per message. The docs
  suggest running both side by side: channels to use, table to look at.
- On the way out, one toggle decides between "send everything every frame"
  and "send only what changed".
- For Max: Max 9 now does the naming too. Any parameter-mode object gets an
  OSC address from its parameter name once OSC is switched on for the patcher
  or a `param.osc` is added. Hand-built `udpreceive` → `route` chains are the
  older way. `osc.codebox` is the message monitor. A `change` before `udpsend`
  is the "only what changed" toggle.

### MIDI

Sources: `MIDI`, `MIDI Mapper Dialog`, `MIDI In CHOP`, `MIDI In Map CHOP`,
`MIDI Out CHOP`, `MIDI In DAT`, `MIDI Event DAT`.

- TouchDesigner puts a map between the hardware and the patch. A per-device
  table names sliders `s1…` and buttons `b1…`; patches read those names. Maps
  ship for known controllers. The docs say there is no auto-learn.
- Output works by channel name: a channel called `ch14c7` is controller 7 on
  channel 14, `ch3n60` is note 60 on channel 3.
- The input log can join coarse and fine controller messages into one 14-bit
  value, and both logs carry operating-system timestamps.
- Saved projects keep the last controller values, and the docs warn that the
  values jump when a physical control is in a different place on reopening.
  The `Bind CHOP` (read in session 1, re-read here) has a pickup option that
  holds a source off until it crosses the current value.
- For Max: keep controller numbers in one place, and add pickup where a
  hardware fader meets a saved value.

### Presets and saved state

Sources: `Palette:presets`, `Storage`, `Parameter DAT`, `Custom Parameters`.

- The palette's Presets component was dropped in build 2022.29530. What
  remains in the pages read is the raw material: custom parameters on a
  component, a Python storage dictionary saved with the file (with a start-up
  value option), and `Parameter DAT`, which lists any operator's parameters as
  a table.
- For Max: this is an area where Max is ahead (see the end of this section).
  The idea worth taking is the table view of an object's settings.

### Components, arguments and scope

Sources: `In CHOP`, `Out CHOP`, `In TOP`, `Out TOP`, `Custom Parameters`,
`Internal Parameters`, `Component Variables`, `Network Path`,
`Operator Shortcuts`, `Reference`, `Parameter Reference`, `Clone`,
`Select CHOP`, `Select TOP`, `Select DAT`, `Null CHOP`, `Null TOP`,
`Null DAT`. Also read: `Base COMP`, `Replicator COMP`.

- A component's interface is a set of typed, named parameters with label,
  range, default and help text. Max's nearest things are `patcherargs` names
  for an abstraction and `param` objects for `poly~`.
- A component input can check what it receives: an `In CHOP` can demand a
  channel count and raise an error. A Max `inlet` has a hover comment and
  nothing more.
- Names are scoped by default. A reference is a path, relative or absolute, or
  a named parent. In Max a name is global unless you scope it (`pv`, `#0`,
  `---`).
- A wireless link is visible. `Select` operators pull data from a named
  operator and the editor draws a dashed line. Max's `s` / `r` draw nothing.
- The habit of ending a chain in a `Null` gives consumers one stable thing to
  point at. The Max equivalent is ending a chain in one named terminal.
- A clone keeps its own top-level parameter values while its insides follow
  the master. That is the split a Max abstraction makes between its box
  arguments and its file.

### Instancing

Sources: `Geometry COMP`, `COMP Instance Page`, `COMP Instance 2 Page`,
`Instance`.

- One geometry object draws N copies. The count is the length of a data
  source. Each attribute picks its own source and its own channel or column by
  name, so position can come from a table and colour from an image.
- "Rotate to vector" aims each copy along a direction, with a choice of which
  axis counts as forward and where in the transform order it applies.
- For Max: `jit.gl.multiple` takes one matrix per attribute by message name.
  `jit.gl.mesh` with instanced `jit.gl.buffer` objects is the route for large
  counts. Neither aims copies along a vector for you.

### Time: frames, cooks and scripts

Sources: `Cook`, `Frame`, `Execute DAT`, `Run Command Examples`, `Callback`,
`CHOP Execute DAT`, `Parameter Execute DAT`, `OP Execute DAT`,
`DAT Execute DAT`, `ParGroup Execute DAT`. Also read: `Time Slice CHOP`,
`Component Timeline`.

- Everything is computed at most once per frame, and only when something
  downstream asks. The `Cook` page lists what counts as a request and what
  counts as a reason, and says plainly that changing an upstream value does
  not push a recalculation.
- Scripts hook into this with callbacks for frame start and frame end, and
  delayed calls counted in frames or milliseconds. A delayed call waits while
  the timeline is paused unless it is tied to an independent clock.
- Change callbacks choose their edge from a list: off to on, while on, on to
  off, while off, any change. A table-change callback is handed a list of what
  was added, removed and changed.
- For Max: the frame tick is `jit.world`'s draw bang. Edge detection belongs
  in boxes (`togedge`, `change`) before a script, not inside it.

### Ramps, smoothing, envelopes and easing

Sources: `Lag CHOP`, `Filter CHOP`, `Filter per Sample`, `Time Slice CHOP`,
`Slope CHOP`, `Speed CHOP`, `Spring CHOP`, `Trigger CHOP`, `Count CHOP`,
`Logic CHOP`, `Interpolate CHOP`, `Pulse CHOP`, `Join CHOP`, `Timer CHOP`,
`Limit CHOP`, `Function CHOP`. Also read: `S Curve CHOP`, `Envelope CHOP`,
`Hold CHOP`, `Delay CHOP`, `LFO CHOP`, `Wave CHOP`, `Pattern CHOP`,
`Lookup CHOP`, `Math CHOP`, `Expression CHOP`, `Analyze CHOP`.

- Smoothing operators run on the render frame and make up skipped frames, so
  a smoothed value never beats against the picture. In Max, `line` runs on its
  own 20 ms timer; `jit.line` is the frame-synced replacement.
- `Lag CHOP` has rise and fall times, overshoot, and caps on speed and
  acceleration. `Filter CHOP` has several filter shapes, including spike
  removal, and can filter every element of a list separately.
- `Speed CHOP` and `Slope CHOP` are integrate and differentiate. The docs
  suggest editing speed and integrating back to position.
- `Spring CHOP` makes a value follow its input like a mass on a spring. Max
  has this only for 3D objects (`jit.anim.drive`, `springto`).
- Thresholds carry a release level and a re-trigger delay as settings.
- Easing is a menu wherever one value moves to another.
- `Limit CHOP` clamps, loops or mirrors a value and quantises it. Max's `pong`
  does the first three with a `mode` attribute.
- The maths operator has an error page that replaces infinite or undefined
  results. What Max's `expr` does with such a value was not confirmed here.

### Noise and randomness

Sources: `Noise CHOP`, `Noise TOP`, `Palette:noise`.

- Noise is a continuous curve with a seed, a period and harmonics, not a
  stream of unrelated numbers. It keeps going across timeline loops. The image
  version runs on the GPU and takes a per-pixel coordinate input.
- For Max: the nearest frame-synced source is `jit.mo.time` with
  `@mode function @function perlin`. `rand~` is the signal-rate version.
  `jit.gl.bfg` makes noise textures on the GPU.

### Tables, names and text

Sources: `Table DAT`, `Select DAT`, `Merge DAT`, `Sort DAT`, `Convert DAT`,
`Substitute DAT`, `Lookup DAT`, `Insert DAT`, `Reorder DAT`, `Transpose DAT`,
`DAT to CHOP`, `CHOP to DAT`, `Working with DATs in Python`, `Text DAT`,
`File In DAT`, `XML DAT`, `JSONPath`, `Python f-strings`, `Pattern Matching`,
`Pattern Expansion`, `Pattern Replacement`, `Pattern Matching Support`,
`Rename CHOP`, `Constant CHOP`.

- Cells are read by the names in the first row and column. Rows are selected
  by name, index, value list or a condition.
- One pattern language is used wherever a name is wanted: `chan[1-16]`,
  `t[xyz]`, `^` to exclude, `*` and `?`. The same brackets generate names.
  `Pattern Matching Support` is a long table of every parameter that accepts
  patterns.
- JSON is filtered with a path query and XML with element scopes. In Max,
  JSON goes into a `dict`; a query or XML needs `v8`.
- For Max: use `dict` keys where TouchDesigner would use row and column
  names, and the Max 9 `string.*` objects for text.

### Movies

Sources: `Movie File In TOP`, `Movie Playback`, `Audio Movie CHOP`,
`Palette/moviePlayer`, `Palette:movieBlender`, `Palette:moviePlaylist`,
`Palette:autoMediaPlayer`, `Cache TOP`, `Cache Select TOP`, `Pre-Filling`,
`Switch TOP`, `Cross TOP`.

- A movie has three play modes: locked to the timeline, driven by an index
  you supply, or free-running. The index has a unit menu and can come from
  timecode. This makes several movies stay together by construction.
- `Movie Playback` separates reading from disk, decoding and uploading, and
  explains why a file that only plays smoothly the second time is being served
  from the operating system's file cache and is not safe for a show.
- Finished player components handle preload, crossfade, still-image duration
  and what happens at the end.
- `Cache TOP` is a frame store on the GPU that serves as delay, freeze and
  loop.
- For Max: `jit.polymovie` preloads and switches; `jit.fx.tr.xfade` blends;
  `jit.fx.tp.delay` and `jit.gl.textureset` cover the frame store. Driving
  several `jit.movie` objects by frame number is the analogue of index mode
  (not tested in Max).

### Image processing chains, feedback and compositing

Sources: `Resolution TOP`, `Texture Sampling Parameters`,
`Texture Extend Modes`, `Texture Filtering`, `Remap TOP`, `Displace TOP`,
`Fit TOP`, `Feedback TOP`, `Palette:feedback`, `Feedback CHOP`,
`Composite TOP`, `Over TOP`, `Layer Mix TOP`, `Layer TOP`,
`Palette:blendModes`, `Palette:multiMix`, `Transparency`. Also read, for the
map of the family: `Level TOP`, `Blur TOP`, `Transform TOP`, `Math TOP`,
`Function TOP`, `Lookup TOP`, `Ramp TOP`, `Threshold TOP`, `Chroma Key TOP`,
`HSV Adjust TOP`, `Channel Mix TOP`, `Reorder TOP`, `Tile TOP`, `Text TOP`.

- Every image operator has the same settings for output size, pixel format,
  filtering and edge behaviour. The warp page warns that an 8-bit map gives
  jagged results.
- Feedback is one operator that names the node whose last frame it outputs,
  with a reset. No cycle is drawn.
- Compositing N layers is one node. `Layer Mix TOP` gives each layer its own
  fit, transform, opacity and blend mode and compiles one shader for the
  stack.
- Transparency in 3D is either a draw-priority number per object or an
  order-independent mode that renders the scene in several passes. The
  `Transparency` page says how many passes typical scenes need.
- For Max: `jit.fx.wake` for simple feedback; a `jit.gl.layer` per source
  inside a capturing `jit.gl.node` for a layer stack; `jit.world`
  `@transparency 1` before sorting by hand. The custom feedback loop through a
  named texture was not tested in Max.

### Shaders

Sources: `GLSL TOP`, `GLSL Multi TOP`, `Write a GLSL TOP`,
`Write a GLSL MAT`, `Specialization Constants`.

- Uniforms are listed on parameter pages by kind, including arrays filled
  from a channel operator and compile-time constants for rarely changed
  modes. Inputs arrive as ready-declared sampler arrays. Helper functions and
  uniforms supplied by TouchDesigner start with `TD`, `uTD` and `sTD`.
- For Max: the JXS `<param>` tag is the declaration, and `param_connect`
  links a UI object to it in both directions.

### 3D scene

Sources: `3D Parenting`, `Null COMP`, `Object CHOP`, `Light COMP`,
`Why is My Render Black`. Also read: `Camera COMP`, `Constant MAT`,
`Point Sprite MAT`, `Depth TOP`, `Render Simple TOP`, `Particle`,
`Palette:cameraViewport`, `Palette:arcBallCamera`.

- Objects are parented by wiring them or nesting them, and one mechanism
  covers both transform inheritance and scene grouping. Max splits these into
  `jit.anim.node` and `jit.gl.node`.
- `Object CHOP` reports position, bearing and distance between two objects as
  channels.
- `Why is My Render Black` is a short ordered checklist. Max's docs have no
  such page among those read; it would be a useful addition to
  `patching/MAX_PATCHING.md`.
- A light with its dimmer below 0.001 is skipped by the renderer, which is the
  documented way to switch lights off cheaply.

### Audio for visuals

Sources: `Palette:audioAnalysis`, `Audio Spectrum CHOP`,
`Audio Device Out CHOP`. Also read: `Audio Filter CHOP`, `Audio Band EQ CHOP`,
`Audio Para EQ CHOP`, `Audio Dynamics CHOP`, `Audio Device In CHOP`,
`Audio File In CHOP`, `Audio Oscillator CHOP`, `Audio Play CHOP`,
`Resample CHOP`.

- The analysis component hands over low, mid, high, kick, snare, rhythm and
  spectral centroid as channels. The spectrum operator can output one sample
  per hertz.
- The `Audio Device Out CHOP` page lists four remedies for clicks, all of
  which come down to frames taking too long, and ends with "put audio in a
  separate process". Audio shares the frame loop.

### Interface building and input

Sources: `Panel Value`, `Panel CHOP`, `Panel Execute DAT`, `Button COMP`,
`Slider COMP`, `Keyboard In DAT`, `Keyboard In CHOP`. Also read: `Field COMP`
(deprecated in favour of `Text COMP`), `Widget COMP` (an empty page),
`Mouse In CHOP`, `Layout`, `Parameter Dialog`.

- Every panel carries states (pressed, rollover, position, drag-out, focus)
  that can be read as channels. Max UI objects output their value only.
- Radio groups are made by giving buttons the same group label.
- Keyboard events are a filtered table of key-down and key-up rows.

### Start-up, errors and files

Sources: `Execute DAT`, `Storage`, `Palette:initializeStart`, `Error DAT`,
`Errors Dialog`, `Troubleshooting in TouchDesigner`, `Bypass Flag`,
`Cooking Flag`, `Text DAT`, `File In DAT`, `Folder`. Also read:
`Palette:logger`, `Palette:debugControl`, `Undo`,
`Network Utilities: Comments, Network Boxes, Annotates`.

- Start-up scripts have separate callbacks for project start and node
  creation, and several of them run in the alphanumeric order of their names.
- An error marker on a node also appears on every component that contains it,
  so a fault deep inside is visible from the top. An error table logs faults
  with a callback.
- Every node has a bypass. A component can be stopped from computing as a
  whole.
- Text operators can stay in step with a file edited elsewhere.
- `initializeStart` is a template that gives every time-based component the
  same Initialize / Start / Play / Speed / Cue controls and the same output
  channels.

### Converting between kinds of data

Sources: `CHOP to TOP`, `DAT to CHOP`, `CHOP to DAT`, `SOP to CHOP`,
`POP to CHOP`, `POP to TOP`, `CHOP Techniques`. Also read: `Shuffle CHOP`,
`Fan CHOP`, `Merge CHOP`.

- Because a wire only joins one family, every crossing is a named operator
  with layout settings. `CHOP to TOP` writes channels into a 32-bit float
  image by default and can pack them into a square for point data.
- For Max: the same crossings exist (`jit.fill`, `jit.spill`, `jit.catch~`,
  `snapshot~`, `jit.gl.asyncread`); nothing forces you to make them visible,
  so make them visible.

### Networking

Sources: `UDP In DAT`, `UDP Out DAT`, `Touch In DAT`, `Touch Out CHOP`,
`Pipe In CHOP`.

- A UDP input can reply to whoever last sent to it. `Touch Out` / `Touch In`
  pairs send whole channel sets or whole tables between TouchDesigner
  processes over TCP, with an option to keep several streams on the same
  frame.

### Where Max is ahead

These came up while checking the Max side. They are not candidates.

- **MIDI learn.** Max 9's Mapping binds a MIDI control or a key to any
  parameter-mode object by moving the control. The `MIDI Mapper Dialog` page
  says TouchDesigner has no auto-learn. (Max userguide `Mapping`.)
- **Presets.** `preset`, `pattrstorage` and Snapshots store, recall and
  interpolate state; a fractional preset number blends two presets and
  `recallmulti` blends several. TouchDesigner's palette Presets component was
  dropped in 2022 (`Palette:presets`).
- **Event timing.** Max's scheduler delivers MIDI and timer events at their
  own times, apart from the frame. TouchDesigner samples the world once per
  frame and needs a special 1000-samples-per-second mode to see MIDI events
  closer together than that (`MIDI In CHOP`).
- **Tempo.** Max's time values can be bars, beats and note values tied to a
  transport. TouchDesigner's unit menus offer samples, frames and seconds
  (`Lag CHOP`, `Timer CHOP`).
- **Audio.** Signals have their own graph and thread. In TouchDesigner a slow
  frame makes audio click (`Audio Device Out CHOP`).
- **Stepping through a patch.** Max has watchpoints on cords and a step
  button. The TouchDesigner troubleshooting page offers error markers, info
  operators and print statements (`Troubleshooting in TouchDesigner`).
- **Recording a control.** `mtr @bindto` records and replays a UI object by
  its scripting name with no cords (`Record CHOP` is wired by hand).
- **Presentation mode.** A Max patch gets an interface by marking boxes.
  A TouchDesigner interface is a separate tree of panel components.
- **Parameters over OSC.** Max 9 gives every parameter an OSC address and
  can describe them with OSCQuery. TouchDesigner's OSC operators carry
  channels or messages and leave the mapping to parameters to you
  (`OSC In CHOP`, `OSC In DAT`).
- **Strings and arrays as data types.** Max 9 has `string.*` and `array.*`
  object families. TouchDesigner does this work in Python (`Python f-strings`,
  `Working with DATs in Python`).
