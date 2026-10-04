# QLab Insights

Notes on how QLab 5 works, written for a reader who knows Max and not QLab.
Every entry comes from a page of the official QLab 5 manual at
`https://qlab.app/docs/v5/` (Figure 53), fetched and read on 2026-10-03. The
manual's home page says it was updated August 31, 2026 for QLab 5.6.3. Sources
are given as the page's path after `https://qlab.app/docs/v5`; the state file
holds each exact URL and says which pages were only partly read.

QLab is not installed on this machine. Nothing here is from memory of the
product. Cue, tab and setting names are spelled as the manual spells them.

Companion files: `QLAB_CRAWL_LOG.md` (what was read), `qlab_crawl_state.json`
(per-page status), `qlab_max_gap_candidates.json` (things Max lacks, and things
both have that QLab does differently), `qlab_system_model.json` (QLab on the 20
system dimensions, plus two), `qlab_butter_tools_suggestions.md`, and
`qlab_clone_inventory.md` (the Audio and Video cue feature list, for the later
question of a Max clone).

---

## 1. What QLab is for

Source: `/` (home), `/fundamentals/cues/`, `/networking/using-timecode/`.

QLab is "a live media playback and show control program" for macOS, built
around the conventions of theatre, broadcast and cinema. It plays sound,
video, live camera and microphone feeds, text, and lighting (Art-Net and some
USB-DMX boxes), and it sends and receives OSC, MIDI, MIDI Show Control (MSC)
and timecode.

Its central premise, stated on the timecode page: in live theatre you do not
know how much time passes between cues, which is why there are cues. An
operator presses GO when the moment comes. Timecode, a fixed timeline, is
described as "a bit at odds with the fundamental design premise".

For a Max user: a QLab document is not a graph. It is an ordered list of
self-contained actions (cues), each with a fixed set of properties edited in an
inspector. There is no patching. The closest Max picture is a `qlist` whose
lines are whole media players, with a big GO button.

## 2. Workspaces, cue lists and carts

Sources: `/fundamentals/workspace/`, `/fundamentals/cue-lists/`,
`/fundamentals/cue-carts/`.

- A document is a **workspace** (`.qlab5`). It holds one or more **cue lists**
  and **cue carts**, plus **workspace settings** (patches, templates, controls)
  that travel with the file.
- A **cue list** is a linear, top-to-bottom list with a **playhead**: the cue
  "standing by". Each list has its own playhead. Only the active list responds
  to the GO button and to workspace MIDI/OSC playback commands, but cues in
  every list still respond to their own triggers.
- A **cue cart** is a grid (1 × 1 to 15 × 15) of cues with no playhead and no
  order, for playing cues in any order and any number of times. Cart cues
  cannot auto-continue or auto-follow, and carts cannot contain Group cues.
- Lists and carts themselves have cue numbers and names, and can be the
  target of other cues: a Start cue that targets a list is the same as pressing
  GO on that list; a Fade cue that targets a list fades everything playing in it.

## 3. Cues, cue numbers and targets

Sources: `/fundamentals/cues/`, `/fundamentals/inspector/`.

- A **cue** is "the most basic unit of action". Twenty-five cue types exist:
  Group, Audio, Mic, Video, Camera, Text, Light, Fade, Network, MIDI, MIDI File,
  Timecode, Start, Stop, Pause, Load, Reset, Devamp, GoTo, Target, Arm, Disarm,
  Wait, Memo and Script.
- **Cue numbers are text**, unique across the workspace, and need not be
  numeric or in order: "1, 1.5, A, Steve" are all legal, and "1", "1.0" and
  "1.00" are three different cues. Reordering never renumbers. For OSC, only
  ASCII without spaces or `# * , / ? [ ] { }` will address a cue.
- Cue names need not be unique. Many cue types fill in a default name (an
  Audio cue's file name, "fade" + target name), and default names follow their
  target when it is renamed.
- **Targets**: Audio, Video and MIDI File cues target a file. Fade, Start,
  Stop, Pause, Load, Reset, Devamp, GoTo, Target, Arm and Disarm cues target
  another cue. Fade and Reset cues can also target an audio output patch or an
  audio map. A cue can have only one target.
- A running cue ignores a second start by default (see second triggers, §5).

## 4. GO, the playhead, and cue sequences

Sources: `/fundamentals/workspace/`, `/fundamentals/cue-sequences/`,
`/fundamentals/inspector/`, `/fundamentals/workspace-settings/`.

- **GO** starts the cue standing by and moves the playhead to the next cue or
  sequence. Space is the default key. The button shows a green border when a GO
  would do something and a red border during **double-GO protection** (a
  minimum time between GOs, any value including 0; protected GOs flash red and
  are ignored). An option makes the GO key wait for key-up before re-arming.
- Every cue has **pre-wait**, **duration** and **post-wait**. Times are kept to
  the millisecond but displayed to hundredths or tenths, because drawing many
  timers costs performance.
- **Continue mode**: *Do not continue* (default), *Auto-continue* (start the
  next cue when this one starts, after its post-wait; the post-wait starts
  counting with the duration) and *Auto-follow* (start the next cue when this
  one finishes; the post-wait shows the duration and cannot be edited).
- Cues joined by auto-continue or auto-follow, or held in a Timeline Group,
  form a **cue sequence**: one GO, several actions.
- How a cue is started changes what happens: **GO** plays the sequence and
  moves the playhead; a **hotkey, MIDI, timecode or wall clock trigger** plays
  the sequence without moving the playhead; **Preview** plays only that cue,
  skipping its pre-wait and ignoring continues; **Audition** variants send
  output to audition destinations (§13).
- **Disarmed** cues keep their pre-wait, post-wait and continue timing but do
  not act; with **Skip if disarmed** they vanish from the sequence entirely.
- **GoTo** cues move the playhead; **Start** cues start a cue without moving it.

## 5. Triggers and second triggers

Source: `/fundamentals/inspector/` (Triggers tab).

- Any cue can also be started by a **hotkey** (Esc, up and down arrows and bare
  modifiers are reserved), a **MIDI** voice message (bytes may be numbers,
  `>`/`<` ranges, or `any`; a Capture button learns one), a **wall clock** time
  (hh:mm:ss, optional days of the week), or **timecode** (only if the list has
  incoming timecode enabled).
- **Fade & stop others over time**: starting the cue fades and stops its
  *peers* (same level of the hierarchy), its *list or cart*, or *all* cues.
- **Duck/Boost audio of other cues in this list while running**, by a level
  and a fade time, starting after the pre-wait.
- **Second triggers** (a start received while running): do nothing (default),
  panic, stop, hard stop, hard stop & restart, or devamp. **Second trigger on
  release** treats the release of a hotkey or MIDI trigger, or of a cart cell,
  as a second trigger, which gives sampler-like hold-to-play.

## 6. Group cues

Source: `/fundamentals/group-cues/`.

Group cues hold child cues and have five modes (Timeline is the default in
QLab 5, per `/general/new-in-qlab-5/`):

- **Timeline**: all children start together; their pre-waits place them in
  time. A Timeline tab draws the children as lanes, with drag (snaps to other
  cues' edges, slices and the playback line; ⌘ disables snapping), nudge by
  0.1 s or 0.01 s, trim, slip (Audio and Video cues without slices) and pinning.
  Children may not auto-continue or auto-follow; the group is broken if they do.
- **Playlist**: children play one at a time, each automatically set to
  auto-continue with a post-wait equal to its duration. Options: auto-shuffle
  (a new order each load or start, shown in italics, not saved), loop until
  stopped (needs at least one child with a non-zero duration, or the group
  breaks), and crossfade (main audio level and opacity only; separate fade-out
  and fade-in curves; a child shorter than the crossfade breaks). Second
  triggers can be set to "plays next" or "plays previous".
- **Start First And Enter**: starts the first child and puts the playhead on
  the second; effectively a folder.
- **Start First**: starts the first child and moves the playhead past the
  group, so the children run as an independent sequence while GO continues.
- **Start Random**: starts a random child that is armed and not playing, and
  plays each armed child once before any repeats ("round robin"). The memory
  resets when the workspace opens.

## 7. Audio cues, slices and devamp

Sources: `/audio/introduction-to-audio/`, `/audio/audio-cues/`,
`/other-cues/devamp-cues/`, `/audio/mic-cues/`.

- Audio cues play any Core Audio file type; AIFF, WAV and CAF are recommended,
  MP3 is discouraged because its decoding delay makes exact timing impossible.
  Up to 24 channels per file are used (2 without an Audio license); 8 to 192
  kHz, 8 to 32 bit, with automatic sample-rate and bit-depth conversion to the
  output patch.
- **Time & Loops tab**: start and end time (draggable on a waveform, ⇧I/⇧O),
  **play count** or infinite loop, **rate** 0.03 to 33 (pitch follows unless
  *Preserve pitch* is on), and an **integrated fade envelope** drawn on the
  waveform (custom or linear curve; can be locked to start/end; edits are heard
  only after restart).
- **Slices**: markers split the file; each slice has its own play count (any
  letter = infinite, 0 = skip seamlessly; at least one slice must be above 0).
  Markers must be at least 0.05 s apart. Markers inside AIFF and WAV files are
  imported as slice markers.
- A **Devamp cue** targets a looping Audio or Video cue and acts at the end of
  the current slice (or of the whole cue): exit the loop and play on; also
  *start the next cue* at that exact moment (its post-wait is computed from the
  target's playback position); or *stop the target* and start the next cue, a
  sample-timed hand-off. The manual suggests a slice per beat to "think in bars
  and beats".
- **Mic cues** route live input through the same levels and effects; they run
  until stopped and default to a main level of -inf. They may use a different
  device for input and output; QLab then keeps drift within the sum of the two
  devices' buffer sizes plus a small margin (a two-hour test measured 0 to 3 ms).
- **Sync rule**: cues on the same audio output patch share that device's clock
  and stay sample-locked; cues started by one action start together; but waits
  use the system clock, and cues on different devices drift unless the devices
  share word clock.

## 8. Levels: two matrices and a trim

Sources: `/audio/introduction-to-audio/`, `/audio/audio-cues/`,
`/audio/audio-output-patch-editor/`, `/fundamentals/workspace-settings/`.

- Every cue with audio has a **cue matrix mixer**: rows are file or input
  channels, columns are **cue outputs**; row 0 holds output levels, column 0
  input levels, and the corner is the **main** level. Crosspoints are level
  controls; levels add in dB (input -3 + crosspoint +2 = -1).
- The cue outputs feed an **audio output patch**, whose **patch matrix** routes
  1 to 128 cue outputs to the device outputs, with its own main level. Effects
  (AudioUnits) can sit on the cue, on each cue output and on each device output.
  Unlimited patches; several patches may use the same device; patches can use
  "the system output".
- Typing a level without a sign means negative; dragging cannot go above 0 dB,
  typing can, up to the workspace **maximum volume limit** (default +12, may be
  -30 and up). The **minimum** (default -60, range -180 to -40) is treated as
  silence; the manual gives a walk-the-room procedure for setting it.
- **Gangs**: type the same letter into level fields to link them; they move by
  the same amount until one hits a limit.
- A grey **dog-ear** on the Levels or Objects tab answers "is this cue making
  sound because of this tab?" (ignores the main level).
- **Trim tab**: post-fader levels for main, cue outputs and objects that "are
  not adjustable using Fade cues, MIDI, OSC, or any other automation", so they
  stay as set. Used to correct a whole sequence after the fades are built.
- Mute and solo exist on cue outputs and patch outputs.

## 9. Object audio

Sources: `/audio/object-audio/`, `/audio/audio-map-editor/`,
`/audio/audio-cues/`, `/audio/fading-audio/`.

- An **audio map** is a unitless 2D space (default 1000 × 1000; objects may
  leave it). **Marks** are points that store a set of cue-output levels:
  "when an object is placed here, it should sound like this". No audio flows
  through a mark.
- Each mark has position, levels, **gravity** (0.1 to 5, default 1: how far its
  influence reaches) and **shadow** (0° to 90°: how much it hides marks behind
  it from an object). **Filters** are lines with width and angle that stop
  objects seeing marks on the other side, optionally letting chosen outputs pass.
- **Objects** belong to a cue (exist only while it is loaded or running) or to
  the map (shared by every cue, moved by Fade cues). **Spread** gives an object
  an area; its level in each output is the loudest point inside that area.
- Tools: a **heatmap** of one output's level across the map (23 colour steps,
  0 to -60 dB), option-hover to read the levels at any point, a looping
  **test object**, and a map monitor window.
- Why: a twelve-speaker move is one Fade cue with a path instead of eleven
  fades to retime.

## 10. Fades

Sources: `/audio/fading-audio/`, `/video/fading-video/`,
`/fundamentals/inspector/`.

- In QLab "fade" means "a change in value over time". A **Fade cue** targets
  one cue (or a patch or map) and changes only the parameters marked active
  (yellow levels, ticked geometry or effect parameters). Two Fade cues on the
  same target with different active parameters run at once without conflict.
- **Curves**: S-Curve (default), Custom (smooth control points), Parametric
  (one *Intensity* number), Linear (sharp control points, multi-step since
  QLab 5), and for some targets a 2D Path. Rising and falling levels have
  separate curves, lockable to mirror each other.
- **Audio domain**: *slider* (console-fader feel), *decibel* or *linear*.
  The manual's recipes: equal-power = parametric curve in linear domain;
  equal-gain = linear curve in linear domain.
- **Absolute** fades set end values; **relative** fades add (levels,
  translation, rotation) or multiply (scale, opacity). Since QLab 5 an absolute
  fade clears earlier relative changes. Running a relative +40 dB fade twice is
  capped only by the maximum volume limit.
- **Stop target when done**, **Set levels/geometry from target** (copy the
  target's current values as a starting point), **Revert Fade Action** (undo
  only the changes this fade made, keeping later ones), **Live fade preview**
  (hear edits while the target plays; per workspace since 5.4).
- Fade cues can fade AudioUnit parameters as a whole (from one effect state to
  another) and fade playback **rate**.
- **2D paths** (for audio objects and video translation, rotation, scale; and
  Network cues): draw, circle tool, flip, rotate, reverse, smooth, **loop**
  (5.6), and **merge**: if the target is not at the path's start, it eases onto
  the path over a chosen percentage of the fade instead of jumping.

## 11. Video: cues, stages, regions, routes, devices

Sources: `/video/introduction-to-video/`, `/video/video-cues/`,
`/video/video-output/`, `/video/blend-modes/`, `/video/camera-cues/`,
`/video/text-cues/`, `/video/using-ndi/`.

- The chain is **Source → Cue → Stage → Region → Route → Device**. A **stage**
  is a virtual raster (up to 16384 × 16384) that cues draw on. **Regions** are
  parts of the stage sent to outputs; each region goes to one **route**, each
  route to one **device** (a display, a Blackmagic output, a Syphon or NDI
  output). Routes exist so a touring show can swap projectors at each venue
  without touching cues: pick the new device on the route and choose a scaling
  mode (center, fit, stretch, fill), rotation in 90° steps and rear projection.
- **Video cue geometry**: *Fill Stage* (fit, fill or stretch) or *Custom*
  (crop in pixels, translation from stage centre, scale, 3D rotation as
  quaternions, anchor). Opacity 0 to 100%, smooth or nearest-neighbour scaling,
  per-cue **blend mode** (24 modes, from Darken to Source Atop Compositing), a
  stack of **video effects** (Core Image-style list with scripting names in the
  Parameter Reference), *Hold at end*.
- **Layers**: 1001 per stage (bottom, 1 to 999, top); same-layer cues stack in
  start order. Stages also have a layer; stages on the same layer stack in
  alphabetical order.
- **Clock**: a Video cue follows either the display clock (smoothest picture)
  or its audio patch's clock (stays sample-locked with audio, may skip or
  repeat a frame).
- **Masks**: a greyscale image per stage (black hides, white shows). QLab has
  no mask editor; it watches the file and reloads it when it changes, so any
  paint program is the editor.
- **Edge blending**: overlapping regions blend automatically across the
  overlap; *Auto edge blends* can be turned off to set widths, and one *Blend
  gamma* applies per stage.
- **Warping** per region: perspective (default, "continuous perspective"),
  linear or Bézier, with mesh splits 1 to 32 in powers of two; coincident
  control points of different regions can be linked to move as one (e.g. three
  regions on three faces of a cube).
- Alignment **grids** per region and **guides** per route; "Keep rendering
  between cues" holds black up so the desktop never shows.
- Syphon and NDI outputs stay alive until the workspace closes, even after a
  panic, "to remain predictable to external equipment".
- **Camera cues** take webcams, Blackmagic, Syphon and NDI, and carry an
  embedded Mic cue. **Text cues** render styled text to a PNG at run time.

## 12. Transport, load and reset

Sources: `/other-cues/transport-cues/`, `/tools/tools-menu/`,
`/other-cues/target-cues/`, `/fundamentals/workspace/`.

- **Load** prepares a cue (or whole sequence) to start with minimum latency;
  QLab will not start a sequence until every cue in it is ready, so many heavy
  cues can delay a GO. The manual recommends loading only to fix an observed
  delay. **Auto-load** loads the next cue after the previous one plays.
- **Load to Time** (and Load cues) prepares a cue or sequence to start partway
  through; negative times count back from the end.
- **Reset** stops a cue and discards its **temporary changes**: values set by
  Fade cues, Target cues, live OSC messages, and the second cue colour. The
  sidebar's Reset button makes the workspace "behave as though it was just
  opened".
- **Target cues** change another cue's target temporarily; the change is never
  saved and does not mark the workspace as edited.

## 13. Safety and rehearsal features

Sources: `/fundamentals/workspace/`, `/fundamentals/workspace-settings/`,
`/tools/auditioning-cues/`, `/tools/override-controls/`,
`/tools/workspace-status-window/`, `/general/qlab-preferences/`,
`/general/keyboard-shortcuts/`.

- **Panic** fades every cue out over the workspace *panic duration* and stops
  it; a second panic during that fade stops immediately. Esc is always panic and
  double-Esc always hard stop; this cannot be reassigned, so "any person
  familiar with QLab" can stop any QLab system.
- **Show mode** disables the inspector, toolbar, adding, moving and editing
  cues, but not OSC/AppleScript edits, workspace settings, saving or quitting.
  The manual calls it "a safety mechanism… not a security mechanism". With the
  preference on, Show mode also blocks ⌘Tab and Mission Control, prevents sleep
  and App Nap, and asks before closing.
- **Audition**: each output class (Audio, Video, MIDI, MTC, LTC, Network,
  Light) can, when auditioning, stay unchanged, be silenced, use an alternate
  patch, or (video) go to an audition window or (light) to an Audition tab.
  Audition GO and Audition Preview exist alongside GO and Preview; *Always
  audition* turns GO into Audition for a whole session. A cue auditioning is
  restarted to normal outputs by a normal start, without stopping first.
- **Override Controls**: global switches that suspend input or output of MIDI
  voice, MSC, SysEx, network (external and local separately), timecode, and
  Art-Net/DMX output. Overridden cues show a red symbol.
- **Warnings**: broken cues (red X with a tooltip), non-breaking warnings,
  breaking warnings, disconnection warnings and flags, listed with an
  *Open Help* button to the right manual section. A broken cue in a sequence
  still runs its waits and continues, so one broken cue does not derail a
  sequence.
- **Backups**: autosave copies (never overwriting the workspace) at an interval
  of 5 to 600 s, a backup before each manual save, at most one per minute, and
  rotation (20 in the last hour, one per hour for a day, one per day beyond).
- Project folders: saving can copy every media file into `audio`, `video` and
  `midi` subfolders, so the folder is the whole show (fonts and AudioUnits are
  the exceptions). A search tool relinks missing files.
- Preferences warn against auto-update checks between dress rehearsal and
  closing; a workspace open cue can be suppressed by holding ⌃⌥.

## 14. OSC: a full dictionary

Sources: `/networking/using-osc/`, `/scripting/osc-dictionary-v5/`,
`/scripting/osc-queries/`, `/networking/show-control-broadcast/`,
`/fundamentals/workspace-settings/` (OSC Access).

- QLab listens on UDP and TCP port 53000 (replies on 53001, or a port the
  client asks for with `/udpReplyPort`), plus plain text on UDP 53535. TCP uses
  SLIP framing. Every open workspace on a port receives a message unless it is
  prefixed `/workspace/{id or name}`.
- Access is by **passcode** (four digits), each with view, edit and control
  permissions; wrong passcodes add increasing delays. UDP clients are forgotten
  after 61 s of silence unless they send a keep-alive.
- Addressing: `/cue/{number}/…`, `/cue/selected/…`, `/cue/playhead/…`,
  `/cue_id/{id}/…`, with OSC wildcards (`?`, `*`, `[1-5]`, `[!…]`, `{a,b}`).
  About 1,176 methods are listed, covering nearly every property of every cue
  type and most workspace settings.
- Conventions: send a property with no argument to read it, with one to write
  it; append `/+ n` or `/- n` to increment (5.5: lists roll over); append
  `/live` to change the running value without saving, without undo and with
  less CPU, reverted on reset. Replies are `/reply/{address}` with a JSON
  string; `/replyFormat` can reshape them. `/updates 1` pushes change
  notifications.
- **OSC queries**: a Network cue may embed `#/address#` in a message; QLab
  replaces it with the live answer when sending, and keeps updating while the
  cue has a duration. `liveAverageLevel/{output} {low} {high}` returns a cue
  output's RMS rescaled to a range, which lets a microphone drive a light.
- **Show control broadcast**: a client sends `/listen` (or `/listen/go/number`
  and other scoped forms) and receives `/qlab/event/workspace/go "24" "intro
  music" "{id}" "Audio"` and similar for start, stop, playhead and the
  all-cue actions; `/eventFormat` rewrites the outgoing address with tokens
  such as `#data#`, e.g. to fire an Eos console directly.

## 15. Lighting, briefly

Sources: `/lighting/introduction-to-lighting/`, `/lighting/light-cues/`,
`/lighting/light-dashboard/`, `/lighting/lighting-command-language/`,
`/lighting/light-patch-editor/`.

- Instruments are patched to Art-Net or USB-DMX addresses using light
  definitions (JSON `.qlablight` files; 1800+ fixtures shipped). Light cues
  hold a text block in a small **command language**: `10 = 75`,
  `group.blue = 50`, ranges `1 - 3 = 50`, ad-hoc groups `[1 - 3] = 50`,
  `pass`, `home`, and **pulls** from another cue (`10 = cue A * .5`), which
  update when the source cue changes.
- Cues **track**: an instrument a cue does not mention keeps its level, so run
  order matters; *Collate effects of previous light cues* makes a cue behave as
  if all earlier ones had run. Subcontrollers mix by highest-takes-precedence.
- The Light Dashboard is the live view, with *Over Time* sneaks, record,
  update latest/selected/**originating** cue, and **parking** (freeze a
  parameter regardless of cues).

## 16. Network, MIDI and timecode cues

Sources: `/networking/network-cues/`, `/networking/midi-cues/`,
`/networking/midi-file-cues/`, `/networking/timecode-cues/`,
`/networking/using-timecode/`, `/networking/using-midi-and-msc/`.

- **Network cues** send OSC, plain text or hex over TCP or UDP to a patch with
  any number of destinations. With a duration they can *resend* at 1 to 120 fps,
  *1D fade* a `#v#` token from/to along a curve, or *2D fade* `#x#`/`#y#` along a
  drawn path. About 60 built-in device descriptions (Eos, DS100, Watchout,
  MadMapper, disguise and others) turn commands into menus.
- **MIDI cues** send voice, MSC or SysEx; CC, pressure and pitch bend can fade
  between two typed values (QLab cannot know the current value).
- **Timecode cues** generate MTC or LTC streams, any number at once, each with
  its own start frame. LTC follows its audio device's clock; MTC the computer
  clock. The manual advises starting at 1:00:00:00 to leave preroll.
- **Incoming timecode** is enabled per list (MTC or LTC, format, *On Start*
  lookback: none, last minute, last hour, X seconds, or all earlier cues; *On
  Stop*: pause, stop or keep running, with freewheel 0 to 2 s). Cues can start
  mid-way and follow jumps.
- Workspace MSC control maps GO, STOP (meaning pause, as the spec says),
  RESUME, LOAD, ALL_OFF, STANDBY±, SEQUENCE± and RESET.

## 17. Scripting and remote control

Sources: `/scripting/script-cues/`, `/scripting/examples/`,
`/networking/qlab-remote/`, `/networking/stream-deck/`,
`/networking/collaboration/`, `/tutorials/sams-toolbox/`.

- **Script cues** run AppleScript, by default in a separate invisible process
  so long scripts do not block QLab (turn that off for tighter timing).
  Scripts mostly edit the workspace: make fade-ins for selected cues, renumber,
  shift waits. There is no general-purpose scripting language inside cues.
- **QLab Remote** (iOS) views, edits and runs cues; **Stream Deck** plugin keys
  and dials send OSC; both use the OSC dictionary.
- **Collaboration**: several Macs edit one workspace over a LAN with view,
  edit and control permissions; cues always run on the primary; last edit wins;
  each collaborator has their own undo; adding, deleting and moving cues cannot
  be undone while collaborating.

## 18. Things the docs leave unclear

- The **S-Curve** and **Parametric** curve shapes are not given as formulas;
  neither is the *slider domain* mapping.
- The **gravity/shadow** maths of object audio is described only by images.
- **Edge blend** curve shape beyond "gamma" is not stated.
- **Cue Lists** page text stops mid-sentence (On Stop / freewheel), in the
  published HTML itself.
- Whether hotkey and MIDI triggers are protected by double-GO protection:
  the manual says individual cue triggers are not.
- How QLab orders two cues started by the same GO beyond "simultaneous at human
  perception" (a footnote says exactly that).

## Where Max is ahead

- **Patching and logic.** Any behaviour can be built from objects; QLab's
  logic is limited to cue properties, triggers, OSC queries and AppleScript
  (`max_system_model.json` dimensions 1, 13).
- **Signal processing.** MSP, MC and gen~ give sample-level DSP; QLab hosts
  AudioUnits but has no synthesis or custom DSP (`/audio/audio-cues/` Audio FX).
- **Generative and 3D video.** Jitter and `jit.gl.*` (shaders via
  `jit.gl.slab`, geometry via `jit.gl.mesh`) against QLab's fixed effect list.
- **Cross-platform.** Max runs on macOS and Windows; QLab is Mac-only
  (`/general/system-recommendations/`).
- **Interactive input.** Sensors, cameras for tracking, HID and arbitrary
  mappings are first-class in Max; QLab reacts to triggers and OSC.
- **Reuse.** Abstractions with arguments, `poly~` and packages
  (`max_system_model.json` dimension 8); QLab reuse is templates, copy-paste
  and Paste Cue Properties.
- **Live editing of the program itself.** Max patches change while running;
  QLab edits cues while running too, but cannot invent new behaviour.
