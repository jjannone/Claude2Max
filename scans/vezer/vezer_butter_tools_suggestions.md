# Vezér → Butter_tools: suggestions

Vezér is not used or installed here. This file only takes ideas from its help
pages (read in `vezer_insights.md`, sources there) and asks which would make good
Butter_tools objects. Each idea was checked against what Butter_tools already
has or plans: `Butter_tools/README.md`, `docs/BTR_WRAPPERS.md`,
`docs/BUTTER_PAT.md` (including *Later: scenes and timelines*) and
`docs/IDEAS.md`, whose ossia score section already holds `butter_score`, recall
"as of" a cue, `@outN_repeat`, easing from the live value and recording a
control as a curve. Nothing here repeats those; where an idea extends one, it
says which. Names follow the package's rules: an object (a script) takes an
underscore, an abstraction a dot, a wrapper `btr.`, anything for video `jit.`.
All are suggestions; nothing is built. (2026-10-03.)

JavaScript in Max runs on the low-priority thread (the reason
`BTR_WRAPPERS.md` keeps timing objects real and `butter.arpplayer` exists). Every
idea below that plays something in time is split the same way: a script decides
*what*, and real Max objects decide *when*.

## New objects

### 1. `butter_lanes` — typed keyframe lanes (the strongest idea)

What Vezér is, at heart: a stack of lanes, each lane one destination, each lane
a *kind* that fits the destination. `butter_score` (IDEAS 1) is about sections
and how they link; this is the thing inside a section, and it is useful on its
own. Max's `function` is one untyped curve per box.

As a `v8ui`, one box with several lanes:

- **Value lanes** with a min and max, per-keyframe ease from `butter_ease.js`
  (Vezér's menu has none, linear and the in/out/in-out families; Butter's set is
  larger), and a step option.
- **Flag lanes**, where each key holds a whole message (`/cue 3`, `read
  intro.mov`) and nothing interpolates. Max's `qlist` holds the same kind of
  list without the picture.
- **Colour lanes**, with keys drawn in their colour and output as `r g b a`,
  plus Vezér's paste rules: a colour key pasted onto a value lane gives its
  luminance; a value key pasted onto a colour lane asks which RGB or HSB
  channel it drives.
- **Outputs as `name value`**, with Vezér's `#n` idea for grouping: lanes named
  `pos#1` and `pos#2` leave as one `pos x y`, so a receiver never sees half an
  update.
- **Typed edits by message** as well as by mouse: `+2.` / `-27` move the active
  key relative to where it is, `invert` flips the selection, `stretch` scales
  it in time. Vezér's time and value fields work this way.
- **Range-change policy**: when a lane's range changes, `@rangepolicy
  recalculate|clamp|delete`. `function`'s `setrange` only recalculates (its
  refpage).
- **Show the value flow**: a shaded area for each lane's current output, so a
  step lane between keys still shows where it is.

Timing: a `butter.lanesplayer` abstraction, on the `butter.arpplayer` pattern,
holds the clock (`transport` or `metro`), asks the lanes for their values at
each tick and sends them at high priority. With `@clock transport <name>`
several `butter_lanes` follow one named transport, which is Vezér's
"composition" without a new object.

### 2. `butter.mtc` and `butter.mmc` — MIDI timecode and machine control

Max has no MTC, MMC or SMPTE object (`obj-qlookup.json`), and no installed
package has one (`query_packages.py`: no matches). Vezér treats them as
basic: follow MTC with an offset, send MTC with a full-frame message on every
jump, send and receive MMC with the device ID picking the target.

- **`butter.mtc`**, an abstraction. Reading: `midiin` bytes into real objects
  that collect the eight quarter-frame messages and the full-frame sysex, and
  send `hh mm ss ff` plus a position in ms for a `transport`. Sending: a `metro`
  at a quarter of the frame time produces quarter frames; a jump sends a full
  frame. `@fps 24|25|29.97df|30`, `@offset hh:mm:ss:ff`.
- **`butter.mmc`**, an abstraction: `play`, `stop`, `rewind`, `locate
  hh mm ss ff` in and out, built with `sxformat` (its refpage: "Prepare MIDI
  system exclusive messages"), with `@deviceid` and Vezér's mapping (127 all,
  0 a master, 1-126 one section each) as an option.

Both are plain MIDI bytes, so no compiled code is needed. The parsing should
stay in real objects rather than a `v8`, because a chased position that arrives
late is the whole failure. Not yet checked: whether `midiin` passes MTC
quarter-frame bytes through on macOS's IAC driver.

### 3. A Butter keyframe format, shared like Butter Markdown

Vezér imports keyframes from JSON: a `keyframes` array whose items have `time`
(timecode text or a frame number) and `value`, `ColorValue` or `flagAddress`.
Butter_tools already has one shared text format (Butter Markdown). A second
shared format, **Butter keyframes**, in `docs/BUTTER_KEYFRAMES.md`, would let
`butter_lanes`, a record mode (IDEAS 11), `butter_nodes` presets and
`butter_score` read and write the same JSON through `dict`. Adding an ease name
and a lane kind to Vezér's fields, and reading Vezér's own files, costs little.

## Additions to planned tools

### 4. Record mode (IDEAS 11): one lane per source, and keep only the turns

IDEAS 11 asks for recording a control as an editable curve. Vezér adds two
details worth copying:

- **A lane per incoming address.** Whatever arrives while recording (a CC, an
  OSC address, a pattr path from `pattrstorage @outputmode 1`, which phase 0
  showed reports controls moved by hand) gets its own lane, named after its
  source; renaming the lane makes the next pass start a fresh one.
- **Keep only turning points.** Vezér's "normalised recording" stores a key
  only where the value changes direction. A recorded fader move becomes a few
  points a student can edit, instead of one per tick.

### 5. `butter_timeline` (BUTTER_PAT, *Later*): cue loops with counts, and a query surface

`BUTTER_PAT.md` already lists "a master timeline with markers that pause, loop
or jump". Vezér's cues add:

- **A loop count per cue** (once, N times, forever) and a `resetcues` message
  that clears every count, so a rehearsal can rerun a section.
- **A small OSC surface**: go to cue by index or name (and "go and play"),
  feedback of the cue that paused playback and the position as time text, and
  replies to "how many cues", "name of cue N", "time of cue N". A controller can
  rebuild its display after reconnecting.
- **Move by cue**: moving a cue moves the keys it governs, except on locked
  lanes.
- **Composition queue**: a list of timelines played one after another, looping.

### 6. `butter.pat`: show every control's OSC address on the control

`BUTTER_PAT.md` decides every control is reachable by OSC through
`pattrstorage`. Vezér's "Show OSC Namespaces" makes that visible: a toggle
colours every addressable control and shows the address of the one clicked.
`butter.pat` knows every client's path, so a `showaddresses` mode in the
inspector, or a drawn label on each Butter control, would tell a student what to
type into TouchOSC without opening anything. This is about displaying addresses
on the controls; IDEAS 8 (one list of every control, and learn) is the list
view.

## Not a good fit for Butter_tools

- **Art-Net output tools** (virtual nodes, soft patch, output monitor, colour
  master, blackout on mute). They need an Art-Net sender first, which IDEAS
  already puts outside the package's kind (scripts and abstractions).
- **NMC.** Imimot's own protocol, and the docs do not describe its format.
- **Optimised value sending** is IDEAS 6's `@outN_repeat 0`; the chase on jump
  (first keyframe on start, last keyframe after a jump) is IDEAS 7's recall "as
  of" a cue. Both already listed.
- **Project loading and autostart** (`/vezer/loadproject`, login items, no quit
  prompt). Properties of the application, not objects; Max's `pcontrol` already
  loads a patcher by name (its refpage).
- **MIDI output loop protection.** A per-patch habit (do not listen on the port
  you send to), not something an object can enforce across a patch.
