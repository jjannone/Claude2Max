# Isadora Insights

Notes on how Isadora (TroikaTronix) works, written for a reader who knows Max
and not Isadora. Everything here comes from pages fetched on 2026-10-02; nothing
is from memory. Text is summarized, not copied.

Sources, and how they are cited below:

- **Manual** — *Isadora Manual v4.0*, October 2024, 887 pages,
  <https://troikatronix.com/files/isadora-manual.pdf>. Cited as `Manual p.N`.
  Read as extracted text, so screenshots and diagrams were not seen.
- **KB** — the knowledge base at <https://support.troikatronix.com/support/solutions>.
  Cited by article URL.
- **Site** — the product feature pages under <https://troikatronix.com/isadora/>.
  These are marketing pages: good for what exists, thin on how it works.

Which parts were read in full, and which only in part, is recorded per entry in
`isadora_crawl_state.json`. Where a note below rests on a partly read page, it
says so.

A word on vocabulary. Isadora patches run **left to right**: outputs are on an
actor's right edge, inputs on its left. Isadora says *actor* for what Max calls
an object, *link* for a patch cord, *property* for an inlet or outlet value,
*Scene* for one patch among several in a document, and *Stage* for a video
output.

---

## 1. Core model

### A document is a row of independent patches called Scenes

Source: Manual p.140–144; Site `cueing-show-control/`.

An Isadora document holds any number of Scenes. Each Scene is a complete patch
of actors with its own links. The Scenes sit in a row, the Scene List, along the
bottom of the window, in the order a linear show would run them.

Activating a Scene starts every actor in it. Leaving it stops them and stops
their media. Normally one Scene is active at a time, so moving along the row is
moving through the show.

Scenes cannot see each other's links. Data crosses between them only through a
few named mechanisms: Broadcaster and Listener actors, Set Global Values and Get
Global Values, or OSC sent to the same machine.

*For a Max reader:* there is no equivalent container in Max. The nearest idea is
a set of subpatchers of which only one is running, with the switch-over,
start-up, tear-down and crossfade all supplied by the host instead of patched.

### Scene Number, Scene name and Cue Number are three separate things

Source: Manual p.141, p.144–147.

A Scene's number is its position in the row and changes when the row is
reordered. Its name is free text. Its Cue Number is a third label, with three
document-wide modes:

- **Scene Index** — the Cue Number always equals the position.
- **Manual** — the user types Cue Numbers, which may have decimal points and
  need not be in order. A Renumber Cues dialog renumbers a selected run with a
  start value and an increment.
- **Automatic** — Isadora keeps Cue Numbers in order and gives a Scene inserted
  between two others a point number, starting at .5.

This is the theatrical convention of inserting cue 8.5 between 8 and 9 without
renumbering the rest.

### Moving between Scenes

Source: Manual p.147–151 (Go Triggers, fade times), p.386–388, p.547–551
(actors); KB
<https://support.troikatronix.com/support/solutions/articles/13000072174-triggering-cues-in-isadora-from-qlab>.

There are four ways to change Scene.

1. **Click it** in the Scene List.
2. **Go Triggers.** A document-wide dialog binds four actions to a keyboard key
   with optional modifiers, a MIDI message, or a learned HID button. The actions
   are Next Scene, Previous Scene, Go Forward and Go Backward. The last two do
   not change Scene: they fire every Go Forward or Go Backward actor in the
   active Scene, so one physical GO button can also step through events inside
   a Scene. The space bar is Next Scene by default.
3. **Jump actors**, triggered from inside a patch. `Jump` moves a relative or
   absolute number of Scenes with one fade time. `Jump++` has separate fade-out
   and fade-in times. `Jump By Name` goes to the first Scene whose name starts
   with given text. `Jump to Cue` goes to a Cue Number.
4. **MIDI scene control** in the preferences maps Program Change, Control
   Change, Note On or Note Off numbers straight onto Scene positions
   (Manual p.206–207).

Every Scene also stores its own Fade In time, Fade Out time and crossfade mode
in the Scene Settings. The crossfade mode is additive, transparent with the new
Scene above, or transparent with the new Scene below. A transition fades the
whole Scene, video and sound together. A second trigger during a fade completes
it at once.

### More than one Scene at a time: primary and secondary Scenes

Source: Manual p.386–388, p.464 (Activate Scene, Activate Scene Amount,
Deactivate Scene), p.694 (Scene Intensity); KB
<https://support.troikatronix.com/support/solutions/articles/13000046020-isadora-3-how-to-run-multiple-scenes-simultaneously-using-the-activate-scene-actor>.

`Activate Scene` starts a second Scene alongside the current one. The Scene the
operator is in is the primary; the others are secondary, drawn in a lighter
blue. A secondary Scene keeps running across primary Scene changes until a
`Deactivate Scene` actor stops it. `Activate Scene Amount` does the same with an
intensity input: zero is off, anything above zero is on at that brightness and
volume. `Scene Intensity` reports a Scene's current level during a fade.

The documented uses are a music bed that must not be interrupted by video cue
changes, a sensor or Art-Net patch that must stay alive for the whole show, and
splitting a heavy patch into parts that are switched on only when needed.

Two details from the KB article that bite in practice. The target is given by
position, so the recommended layout puts background Scenes first in the row,
then a blackout Scene, then the show. And `Deactivate Scene` does not know what
is active; it must be told the right target.

### Starting values, snapshots and editing while a show runs

Source: Manual p.166 (Init), p.181–183 (Snapshots), p.222 (Pause Engine),
p.223–224 (Blind Mode); KB
<https://support.troikatronix.com/support/solutions/articles/13000029774-use-the-initialize-feature-instead-of-enter-scene-value-to-initialize-media-inputs>.

- **Init.** Any input can be given a value it takes each time its Scene is
  activated. The alternative is an `Enter Scene Value` or `Enter Scene Trigger`
  actor. The KB warns that for a media input the Init box is the right one:
  Isadora preloads media by reading the input values before the jump, and the
  file saves whatever value an input last had, so a value set after entry loads
  the wrong clip first.
- **Snapshots.** One click stores the value of every input of every actor in
  the Scene. Snapshots appear as numbered dots above the patch. They can be
  recalled by click or by `Recall Snapshot`, taken by `Take Snapshot`, and
  overwritten by `Update Snapshot`. Individual actors can be excluded from
  recall. A snapshot taken before actors were added turns red.
- **Blind Mode.** Modelled on lighting consoles. The operator opens and edits a
  different Scene while the active one keeps running and keeps responding to Go
  Triggers. The Scene being edited is paused.
- **Pause Engine** stops all timers and messaging, for rescuing a patch that
  jumps away the moment it is entered.

### Cue Sheets

Source: Manual p.219–221.

Each Scene has an optional list of cues with a text prompt for the operator.
Control-Space executes the next cue: Isadora shows the following prompt and
sends the cue's chosen key to every Keyboard Watcher in the Scene, as if it had
been typed. It is a prompt list layered over the keyboard, not a timeline.

### Actors, links and data types

Source: Manual p.156–169; KB
<https://support.troikatronix.com/support/solutions/articles/13000113815-understanding-and-using-port-shapes-and-fills>.

- Property types are integer, float, boolean, range, text, trigger, video,
  sound, blob, and (in later sections) timecode and skeleton. Numbers and
  triggers connect freely; video connects only to video.
- **Links scale values by default.** Every output has Limit Min and Limit Max;
  every input has Scale Min and Scale Max. A value is mapped from the output's
  range to the input's range as it crosses the link. Setting Scale Min above
  Scale Max inverts it. A port drawn as a circle has scaling on, a square has
  it off.
- **Mutable ports** start as float and take the type of the first thing
  connected. A hollow port is mutable, a solid one fixed.
- Some inputs set how many inputs or outputs the actor has. They are drawn as
  triangles and cannot be linked.
- Hovering over a video link shows the video passing through it.
- Dragging an actor onto a link inserts it; deleting a video actor heals the
  link around it.

### User Actors and Macros

Source: Manual p.171–180; KB
<https://support.troikatronix.com/support/solutions/articles/13000085286-keeping-global-user-actors-in-sync-when-collaborating>
(first half read).

Both wrap a group of actors into one, with `User Input` and `User Output` actors
as the ports. The difference is identity. Every User Actor carries an
identifier, and closing its editor offers *Save & Update All*, which rewrites
every instance in every open document and in the toolbox while keeping links and
hand-set input values where types still match. A Macro has no shared identity
and updates nothing else.

User Actors can be saved to a Global Toolbox folder or to a Local Toolbox stored
in the document. On opening a document, Isadora updates its User Actors to match
the files in the global folder.

*For a Max reader:* a User Actor in the global folder behaves like an
abstraction; a Macro like a `p` subpatcher. The middle case, an embedded patch
that still updates all its copies on request, has no direct Max equivalent.

### Control Panels

Source: Manual p.184–198, and the opening of each entry in the Controls
Reference, p.829–887.

A Control Panel is the operator's interface, shown in place of the patch. It
belongs to a run of adjacent Scenes: one panel can serve the whole document, or
the row can be split so different groups of Scenes show different panels, and
the panel on screen changes with the Scene.

Controls do not use links. Each has a Control ID, and any actor input or output
can be set to follow that ID. An input follows the control; an output drives it,
which turns a slider or number into a readout.

Control types: 2D Slider, Background, Bin Picker, Button, Color, Comment, Dial,
Edit Text, FPS, List Selector, Monitor, Next Cue, Number, Popup Menu, Prev Cue,
Radio Button, Scene Select, Slider, Stage Preview, Timecode. The ones with no
plain Max counterpart are show-specific: `Bin Picker` is a thumbnail grid of the
media in a bin, `Scene Select` lists the Scenes and jumps on click, `Next Cue`
and `Prev Cue` are GO and BACK buttons, `Stage Preview` and `Monitor` show a
Stage or any video output.

`Show-Hide Control` shows or hides controls whose Control Address matches a
wildcard, and `Set Control Focus` moves the keyboard focus to a control. The
Isadora 4 release notes describe these as the way to build multi-page,
application-like panels.

### Run-only files

Source: Manual p.214–215.

A document can be saved with a password as run-only. The author chooses whether
the recipient may edit the Control Panels, import media, and save.

---

## 2. Media

### The Media View and media by number

Source: Manual p.23, p.135–140, p.503–504.

Media is not embedded in the document. The Media View holds references in bins
of five kinds: movies, sounds, pictures, MIDI files and 3D models (`.3ds`). Each
reference has an index number, and a player actor names its media by that
number. Because it is a number, any actor that outputs a number can choose the
clip. `Get Media Count`, `Get Media Index` and `Get Media File Name` let a patch
walk a bin. An Auto Adjust Media switch decides whether actors follow their
media when the bin is reordered.

Recommended codecs are HAP, HAPQ, HAPA and Photo JPEG, plus ProRes on macOS and
Windows Media on Windows. H.264 is supported without the interactive playback
modes.

### Movie Player and Sound Player

Source: Manual p.603–606, p.742–744, p.292–293.

`Movie Player` plays a *play segment* given by `play start` and `play length`,
both percentages of the file, with loop modes off, on and palindrome. It outputs
video, its position, a trigger per frame and a trigger at loop end. It can be
switched to timecode mode, where position and the segment bounds are timecode
values.

`Sound Player` loads the whole file into RAM and behaves like a sampler with 16
sampler channels. Its `routing` input is a text string of the form
`source:destination`, optionally with a level in dB or percent, comma-separated,
so any file channel can go to any device output and the routing can be computed
by another actor. `Sound Preload` loads files ahead of time.

### Preloading on a Scene change

Source: KB
<https://support.troikatronix.com/support/solutions/articles/13000014938-understanding-preloading-safely-using-the-preload-actors>
(first two thirds read); Manual p.650.

When a jump is triggered, Isadora scans the target Scene's player actors, reads
which media they will play, at what speed and from what position, loads all of
it in the background while the current Scene keeps running, and only then
performs the jump. `Preload Scene` runs that same scan early, so the later jump
is instant. The article warns that preloading every next Scene by habit fills
memory, and points at the Loaded Media count in the status bar.

### Live input and capture to disk

Source: Manual p.286–291, p.425–429.

Up to four live capture channels, each a video device plus an audio device, are
set in one window. `Video In Watcher` brings a channel into a patch, and
`Capture Control` starts and stops capture from the patch.

`Capture Camera to Movie` records a live channel to disk; `Capture Stage to
Movie` and `Capture Stage to Picture` record a Stage. All three put the result
into the Media View when recording stops, either appended or replacing a chosen
index, so the next actor can play back what was just recorded. The manual
suggests keeping empty placeholder slots in the bin for this.

### Recording the output slower than real time

Source: Manual p.244–248.

The menu recorder has a Render Speed setting. Below 100% it slows Isadora's
clock, so media and time-based actors run slower while each frame still gets as
long as it needs. A heavy Scene can then be recorded at full frame rate with no
dropped frames. An option aborts the recording if a frame is dropped.

---

## 3. Stages, projectors and mapping

### Stages are outputs; displays are assigned to them

Source: Manual p.225–240; Site `multi-projector-setups-blending-and-routing/`;
KB
<https://support.troikatronix.com/support/solutions/articles/13000016422-isadora-3-4-working-with-multiple-displays>
(first third read).

A Stage is a numbered video output. Actors render to a Stage number, never to a
display. Stage Setup, which is saved with the document, says which physical
displays make up each Stage.

- A Stage with one display is an ordinary full-screen output.
- A Stage with several displays is one wide canvas across them.
- A **Virtual Stage** has no display. It is an off-screen canvas at any
  resolution. The Site page and the manual's `3D Renderer` entry (p.373) both
  say its picture is read back into the patch with a Get Stage Image actor.
  That actor has no entry of its own in the manual's Actors Reference, so how
  it works was not read.
- If a Stage's display is missing, the Stage opens as a preview window on the
  main display, so a show file opens on a laptop without its projectors.
- Each Stage or display can also be sent out through Syphon or Spout, and
  through Blackmagic hardware, by a checkbox. The Site page adds NDI.

The KB and the Site disagree on limits: the KB article says 16 Stages, the Site
page says 16 physical displays and up to 48 Stages counting Virtual Stages.

A display's *Split* setting treats one very wide output, as from a Matrox
DualHead2Go, TripleHead2Go, QuadHead2Go or Datapath Fx4, as two, three or four
separate displays.

### Edge blending is part of Stage Setup

Source: Manual p.235–239, p.477–479, p.509–511.

When two displays in one Stage are dragged so they overlap, Isadora measures
the overlap and applies a blend there. A Blend Adjustment panel sets curve,
gamma and knee per edge, because two projectors seldom share a response. The
Blend Maker asks for a grid such as 2x1 or 3x2, the display resolution and the
overlap in pixels or percent, and builds the whole Stage. The manual recommends
20% overlap and identical projectors.

Two actors do the same from a patch: `Edge Blend Mask` and `Global Edge Blend
Mask` put soft-edged masks on a Stage, with position, angle, width and curve per
edge.

Each display also has a keystone view with draggable corners and edges, and
`Global Keystone` exposes the four corners of a Stage as inputs.

### The Projector actor and layering

Source: Manual p.241–244, p.652–654 (first half of the entry read).

`Projector` is where a video stream meets a Stage. It has position, size, zoom,
spin, a `layer` number and a `blend` mode: additive, transparent or opaque.
`intensity` means brightness under opaque and additive, and opacity under
transparent. Several Projectors on one Stage composite by layer number, and
Projectors honor an alpha channel in the stream. `Add Alpha Channel` attaches a
mask as alpha.

### IzzyMap

Source: Manual p.258, p.277–285; Site `projection-mapping/`. The two step-by-step
IzzyMap tutorials, p.259–276, were not read.

IzzyMap is a mapping editor inside every Projector actor. A mapping is a list of
*slices*: regions of the input image that are reshaped and placed on the output.
The list order is the layer order. Four mapping methods:

- **Triangle** — one triangle, input and output shapes independent, no
  perspective correction.
- **Rectangle** — one quadrilateral with perspective correction.
- **Bézier Grid** — a grid whose intersections move and whose lines bend, for
  curved surfaces. The number of divisions is settable.
- **Composite** — several sub-slices (rectangles, triangles, circles, or shapes
  with any number of points, straight or curved) combined by add, subtract or
  invert into one mask over the input, then placed by one output quadrilateral
  with perspective correction.

Each mapping has its own blend mode, intensity, colour trim and flip.

What sets it apart is that map parameters can be published as inputs of the
owning Projector: slice position, opacity, and individual point and Bézier
handle coordinates, by point number. Any sensor or generator can then move the
map while it runs. Because the map lives in a Projector, several maps can be
stacked on one Stage.

`3D Mesh Projector` (Manual p.343) is a separate tool for domes, cylinders and
mirror rigs. It reads warp meshes made by Paul Bourke's meshmapper.

---

## 4. Timing and logic

Source: Manual actor entries on the pages given. Except where marked, only the
opening description of each entry was read.

- `Envelope Generator` ramps through up to nine segments in the range 0–100.
  `Envelope Generator++` (p.485, read in full) allows 99 segments and any range.
  Its trigger mode chooses between running the whole envelope per trigger and
  advancing one segment per trigger.
- `Timed Trigger` (p.788, read in full) holds a list of times, relative or
  absolute, and fires as each passes. `Trigger Delay` restarts its wait on every
  new trigger, so it also detects that nothing has happened for a while.
- `Pulse Generator`, `Wave Generator`, `Timer`, `Clock`, `Tap Tempo`, `Counter`
  and `Sequential Trigger` are the expected clock and count tools.
- `Time of Day` (p.784, read in full) fires at a clock time each day, at a
  specific date and time, or periodically by the wall clock.
- `Ease In-Out` and `Ease In-Out 2D` ramp along an s-curve. `Curvature` bends a
  value along a hand-drawn curve. `Smoother` and `Decay Generator` tame sensor
  data. `Seek Target Value` moves toward a target at a set rate.
- `Compare Guarded` is a threshold with a dead band. `Simultaneity` fires when
  all its inputs trigger within a time window. `Multi Blocker` drops values that
  arrive too close together.
- `Gate`, `Router` and `Selector` route any data type, video included. `Table`
  and `Lookup` do indexed lookups.
- The General Service Task rate in the preferences sets how often these
  time-based actors are serviced, as a multiple of the frame rate (p.200).

---

## 5. Show control and talking to other equipment

### MIDI and MIDI Show Control

Source: Manual p.294–298, p.596, p.701–702.

Watchers and senders exist for every channel message, plus `Send Raw MIDI` and
`Send Sys Ex` with up to nine variable bytes. `MIDI Player` plays Standard MIDI
Files. On macOS Isadora publishes a virtual MIDI input and output.

`Send MIDI Show Control` builds MSC messages from named fields: device ID,
command format, command, cue number, cue list, cue path. Its inputs change to
suit the command chosen. `MIDI Show Control Watcher` receives them and outputs
cue number, cue list and cue path as text.

### Timecode

Source: Manual p.292–293, p.299–300, p.607–609, p.785–787.

Timecode is a data type. It carries hours, minutes, seconds, frames and a frame
rate. Linked to a float input it becomes seconds, to an integer it becomes
frames, to text it becomes `HH:MM:SS:FF`. It can be typed with commas standing
for empty fields, and a slash sets the rate. Supported rates run from 23.976 to
60.

Isadora receives MIDI Timecode. `MTC Reader` outputs it. `MTC Compare` and
`Timecode Comparator` trigger at a time, and the comparator handles two values
at different frame rates by comparing real time. `Timecode Calculator` adds and
subtracts. `MTC Movie Locker` chases: it drives a Movie Player's speed, and when
drift passes a set limit it jumps the position. The status bar shows incoming
timecode. Only MTC input is documented; nothing read mentions LTC audio timecode
or generating timecode.

### OSC

Source: Manual p.301–305, p.633–638.

Isadora listens on one UDP port. Addresses `/isadora/1` to `/isadora/100` are
built in and map to channel numbers on `OSC Listener`. Other addresses are added
in the Stream Setup window, where Auto-Detect lists every address as it arrives
and assigns it a port number. `OSC Address Listener` skips the table and matches
an address pattern with `*` wildcards. It has a mode that queues every message
and reports the queue length instead of dropping messages that arrive faster
than the patch cycles. `OSC Transmit` and `OSC Multi Transmit` send. Incoming
messages must carry type tags.

### DMX and Art-Net: Matrix Value Send and Receive

Source: Manual p.403–405 (ArtNet Receive, ArtNet Send), p.578–585; KB
<https://support.troikatronix.com/support/solutions/articles/13000085235-routing-values-using-the-matrix-value-send-and-receive-actors>
and
<https://support.troikatronix.com/support/solutions/articles/13000042899-controlling-led-strips-via-artnet>
(opening quarter read); Site `lighting-control/`.

`ArtNet Send` takes a universe and a string of hex bytes and transmits a DMX
frame, with a rate limit. `ArtNet Receive` does the reverse, so a lighting desk
can drive a patch.

The interesting part is the layer above. `Matrix Value Send` actors, placed in
ordinary Scenes, send channel/value pairs to a port. One `Matrix Value Receive`,
kept in an always-active secondary Scene, collects them and:

- holds a **channel map**, edited as a table, that sends each input channel to
  any set of output channels. This is the lighting desk's soft patch: logical
  channels in the cues, dimmer addresses in one table to edit per venue.
- **mixes by Scene intensity.** During a crossfade between two Scenes that send
  different levels to the same channel, the output moves smoothly from one level
  to the other over the fade time, with nothing patched for it.
- has a master level, and formats its output as text (integer, float or hex,
  with separators) for whatever sends the data on: `ArtNet Send`, a serial DMX
  interface, MIDI.

`Matrix Color Send` samples rows or columns of pixels from a video stream and
sends their RGB or grey values into the same system, which is how video is
mapped to LED strips.

### Serial and TCP with a pattern language

Source: Manual p.310–324, p.712–717, p.764–767.

Serial ports are configured in a dialog; the manual says two ports in one
sentence and refers to ports 1 to 4 in the next. TCP is a client connection
opened by `TCP Stream Control` and used by `TCP Send Data` and the `TCP In
Watcher` actors.

Both families share two small languages.

**Input parsing.** A watcher holds a pattern. When a block of data matches, the
captured values appear on outputs that the pattern itself creates and names.
Text watchers read up to a delimiter; binary watchers read fixed-length blocks
with a timeout. Elements include quoted strings, numbers with a digit count, hex
numbers, letters, character sets, byte counts, byte sets, and bitfields that
split a multi-byte integer into named bit ranges with a chosen byte order.
Writing `level:int=3 digits` both matches three digits and creates an integer
output called `level`.

**Output formatting.** `Text Formatter`, `Send Serial Data` and `TCP Send Data`
build bytes from literal text, hex bytes and up to nine parameters `P1` to `P9`,
each with a format: decimal with digit counts, zero-padded, hex, or a single raw
byte.

### HTTP, PJLink, cameras, files

Source: Manual p.506–508 (opening read), p.707–708, p.813–823 (opening read),
p.494, p.545–546, p.620–621; KB
<https://support.troikatronix.com/support/solutions/articles/13000067857-using-the-send-pjlink-actor>
(listed, not read).

- `Get/Post URL Text` makes HTTP GET and POST requests in the background.
- `Send PJLink` sends a projector command over the network, chosen from a list
  or typed in the protocol's own form. It supports a password and outputs the
  projector's reply. The manual gives closing the shutter, to avoid projected
  video black, as the common use.
- `VISCA PTZ Controller` drives pan, tilt, zoom and focus on cameras that speak
  VISCA over IP or Datavideo DVIP. Marked public beta, tested by TroikaTronix
  on two camera models.
- `File Reader`, `Read Text From File`, `Data Array` (a table with tab-separated
  file storage and read-on-activate, write-on-deactivate modes), `JSON Parser`
  and `JSON Bundler` cover files and structured data.
- `Open Isadora File` opens another document from a patch, optionally closing
  the current one, so one show file can hand over to the next.
- `Speak Text` speaks text with the operating system's text-to-speech voices.
  `SRT Subtitle Player` outputs the subtitle text for a timecode position,
  normally taken from a Movie Player.

### HID, keyboard, mouse

Source: Manual p.307–309, p.517, p.552–553, p.601, p.755.

HID devices are learned in the same Stream Setup window as OSC: move a control,
it appears in the list, it gets a port number, and `HID Value Listener` reads
it. `Keyboard Watcher`, `Key Table Watcher`, `Mouse Watcher` and `Stage Mouse
Watcher` cover the rest; the last reports the mouse inside a Stage.

### Tracking and bodies

Source: Manual p.409–414, p.488–493, p.559, p.622–632 (opening read),
p.683–684, p.728–733; KB
<https://support.troikatronix.com/support/solutions/articles/13000091703-teaching-isadora-to-recognize-images-objects-and-people>
(first half read).

- `Eyes` tracks the brightest object on a grid. `Eyes++` tracks up to 16 blobs;
  `Blob Decoder`, `Blob Minimum Distance` and `Blob Target Proximity` read them.
- `OpenNI Tracker` reads depth cameras (Kinect v1, Kinect v2, Orbbec Astra,
  Intel RealSense D435 are listed) and outputs depth, colour, body tracking and
  skeletons. It can record and play depth streams as `.oni` files. Marked
  public beta, with a note about crashes after hours of running.
- **Skeleton is a data type.** `OpenNI Tracker`, `Rokoko Studio Live Watcher`
  (Rokoko suits and gloves) and `Skeleton From JSON` all output it;
  `Skeleton Decoder` picks joints by name and `Skeleton Visualizer` draws it.
  Any source that can be turned into the JSON form joins the same chain.
- `Blacktrax Watcher` receives RTTrP tracking packets from a BlackTrax system:
  position, rotation, velocity and acceleration per trackable.
- `Leap Motion Watcher` reports hand position and rotation.
- Image classification is not built in. The KB article routes video out by NDI
  to a separate open-source program and takes results back by OSC.

---

## 6. Scripting

Source: Manual p.513, p.544–545, p.657–675 (first tenth read); KB
<https://support.troikatronix.com/support/solutions/articles/13000014933-getting-started-with-javascript>
(first half read) and
<https://support.troikatronix.com/support/solutions/articles/13000025645-glsl-shader-actor-tutorial>
(first sixth read).

- **`Javascript`** runs a `main()` function each time an input changes. Inputs
  arrive in `arguments[]`; returning an array sends each element to an output.
  Comments of a set form name the inputs and outputs. The KB says the engine is
  V8. It is sandboxed.
- **`Pythoner`** embeds a Python interpreter that starts with the first Pythoner
  actor and lives until Isadora quits. It supports virtual environments and pip
  packages, set up by the user with supplied scripts. The manual stresses that
  it is not sandboxed. The Isadora 4 release notes add that a `virtual_env`
  folder beside the document is picked up automatically, so a show can travel
  with its environment.
- **`GLSL Shader`** compiles a fragment shader typed or pasted into its editor.
  The KB says the compiler is built to recognise code from ShaderToy, so most
  shaders from that site work pasted in unchanged, and that inputs such as
  `time mod`, `mouse horz` and `mouse vert` appear on the actor when the shader
  uses them. Other uniforms become inputs through a comment convention described
  in the editor's help, which was not read.
- FreeFrame and, on macOS, Quartz Composer and Core Audio plug-ins load as
  actors (Manual p.211–212, p.253–257).

---

## 7. Sound

Source: Manual p.20–21, p.249–257, p.736–746; KB
<https://support.troikatronix.com/support/solutions/articles/13000084953-tutorial-getting-started-with-multi-channel-audio-in-isadora>
(first third read); KB Isadora 4 release notes
<https://support.troikatronix.com/support/solutions/articles/13000106556-isadora-4-release-notes>
(opening and a scan of its "NEW:" lines only).

Sound is the thinner side of Isadora. The only audio streams between actors
that the v4.0 manual describes are Core Audio units on macOS. Cross-platform
sound is the
Sound Player, the Movie Player's own sound, and the watchers that analyse live
input: `Sound Level Watcher`, `Sound Frequency Watcher`, `Sound Frequency Bands`.
An Audio View picks the output device and shows a meter per channel.

The release notes list newer additions that the manual predates: VST3 plug-ins,
a cross-platform audio data type, and actors named Audio File Player, Audio
Input, Audio Mixer, Audio Matrix Mixer, Audio Output, Audio Routing Maker,
Audio Level Watcher, Audio Frequency Watcher, Audio Frequency Bands, VST
Transport Control and Audio to Text, the last converting speech to text. These
were seen as headings only; how they work was not read.

---

## 8. Networking and remote performance

Source: Manual p.208, p.616, p.524–543 (IzzyCast actors, openings read),
p.613–614, p.686–690, p.694–695, p.748–760; KB
<https://support.troikatronix.com/support/solutions/articles/13000097342-izzycast-faq>;
Site `remote-performance/`.

- **`Net Broadcaster`** sends a number to other copies of Isadora on the LAN.
  Each machine has a Net ID in its preferences; target 0 means all. It uses
  multicast, so no addresses are entered, and an ordinary `Listener` on the
  other machine receives it. Numbers only.
- **IzzyCast** carries video, audio and data between copies of Isadora anywhere
  on the internet. A host creates a session, others join by a ten-digit session
  ID, and the `IzzyCast Broadcaster` and `IzzyCast Receiver` actors move the
  streams. The FAQ says it is
  built on the Zoom Video SDK, needs no network configuration, is paid for by
  prepaid credits (one credit is one participant-minute), and that participants
  can join with the free demo mode of Isadora. The Site lists DMX, Art-Net,
  VISCA and chat among the data it carries.
- **Video sharing on one machine or LAN:** `Syphon Receiver` and `Syphon Stage
  Output` on macOS, `Spout Receiver` and `Spout Stage Output` on Windows,
  `NDI Watcher` for NDI input.
- **`RTMP Streamer`** streams a video and audio feed to services such as
  YouTube, Twitch and Facebook Live, with a stream key.
- **`Screen Capture`** captures a display or a named window as video. The Site
  describes using it to pull individual participants out of a video call.

---

## 9. Deployment and running a show

Source: Manual p.21–22, p.199–210, p.216–217; KB Isadora 4 release notes
(opening read).

- Runs on macOS and Windows; the release notes give macOS 10.14 to 15 and
  Windows 10 to 11, and state that Linux, tablets and external GPUs are not
  supported. The licensed application is needed to save; demo mode runs and
  edits but cannot save.
- There is no build step. A show is the `.izz` document plus its media folder,
  opened in Isadora. Preferences choose what happens at launch and after a file
  loads: activate the first Scene, restore the Scene active at save, and show
  the Stages automatically.
- The status bar shows communication activity per protocol, loaded media count,
  incoming timecode, Stage state, Cycles (patch passes per second), FPS and a
  frame-load percentage that turns yellow and red.
- The target frame rate and service rates are preferences, not patch objects.
- Auto-save is built in.

---

## Not read this session

Listed so their absence here is not taken as absence from Isadora: the getting-
started tutorials (Manual p.50–134), the two IzzyMap tutorials (p.259–276),
troubleshooting (p.325–335), the property lists of most actors and all
controls, the 148 add-on pages, the IzzyCast feature pages, and most
knowledge-base tutorials. See `ISADORA_CRAWL_LOG.md`.
