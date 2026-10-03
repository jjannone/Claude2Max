# ossia score → Butter_tools: suggestions

Copied on 2026-10-03 into Butter_tools as the first section of `docs/IDEAS.md`, which is where to keep them up to date. This copy records what the scan produced.

ossia score is not used or installed here. This file only takes ideas from its
documentation (read in `ossia_score_insights.md`, sources there) and asks which
would make good Butter_tools objects. Each idea is checked against what
Butter_tools already has or plans (`Butter_tools/README.md`, `docs/BTR_WRAPPERS.md`,
`docs/BUTTER_PAT.md`, `docs/BUTTER_INSPECTOR_PLAN.md`), so nothing here repeats a
plan already written. Names follow the package's rules: an object (a script)
takes an underscore, an abstraction a dot, a wrapper `btr.`, anything for video
`jit.`. All are suggestions; nothing is built. (2026-10-03.)

## New objects

### 1. `butter_score` — an interactive timeline (the strongest idea)

What ossia does that Max has no object for: a timeline whose sections can
**wait** for an event before going on, **choose a branch** by a condition,
**loop or jump** back, and have a **minimum and maximum length** instead of a
fixed one. A section can also be **fired out of time**, and each section can run
at its **own speed and tempo**.

As a Butter tool: a `v8ui` that draws the sections and their links, and sends
named messages as each section starts and ends. Sections send to `s` names, or
out an outlet as `name value`, so it drives any patch. A trigger is a message
the object waits for (`go`, a number crossing a value, any message to a named
inlet). Max's nearest pieces are `qlist`, `timepoint` and `transport`, which run
a fixed list.

One design point to settle first: JavaScript runs on Max's low-priority thread,
which is why `BTR_WRAPPERS.md` keeps timing objects real. So `butter_score`
should decide *what* happens and let a real clock (`transport`, `metro` inside a
`butter.score` abstraction) decide *when*, or accept millisecond-level drift
and say so.

### 2. `butter.map` — a sensor input that calibrates itself

ossia's mapping processes learn a sensor's real minimum and maximum while it
runs, add a dead zone, apply a curve, wrap or fold out-of-range values, and
smooth noise with a choice of filters (1-euro, low-pass, average, median).

In Max this is five or six objects every time (`peak`, `trough`, `zmap`, a curve,
`slide`), and students rebuild it for every sensor. One abstraction, or a `v8`
with `butter_ease.js` for the curve, would cover it: `learn` / `freeze` / `reset`
messages, `@deadzone`, `@curve`, `@outofrange clip|wrap|fold`, `@filter`.

### 3. `butter_zones` — areas that blend values as something moves through them

ossia has polygon zones carrying values; a moving position gets its distance to
each zone and the values blended by how close it is. As a `v8ui`: draw
polygons, give each a list of values, feed it an x y (a tracked person, a mouse,
a phone), and get distances and blended values out. Useful for tracking
installations and for spatial mixing. Max has `nodes`, which blends overlapping circular regions by distance (its
refpage),
and `butter_nodes`, which extends it; zones of any shape are the step beyond.

### 4. `butter_query` — pick values out of nested data by a path

ossia applies a subset of jq to nested data, for picking one keypoint from a
pose model's output or slicing a list of records. As a `v8`: a `dict` name in,
a query in the box (`.people[0].keypoints[5]`), values out. Max's `dict.unpack`
returns the values of keys it is given (its refpage); nothing read here slices
a list or filters a set of records in one step.

### 5. `butter.spread` — one message to many named targets

ossia addresses many parameters at once with patterns (`/voice.{1..8}/gain`) and
has small processes that spread a list across them, average them, or sweep a
value across them in turn. In Max, names are global, so the same idea is: send
to every `s` name matching `VOICE{1..8}`, spread a list across them, or step
through them on each bang. A `v8` can do this with `messnamed`.

## Additions to planned tools

### 6. `btr.` wrappers: two more outlet extras, one more inlet extra, more units

From ossia's parameter metadata, which every parameter carries:

- **`@outN_clip <mode> <low> <high>`**, with modes `clip`, `low`, `high`,
  `wrap`, `fold`. The design has math and ease, but no way to keep a value in a
  range, and wrap and fold need two objects in Max.
- **`@outN_repeat 0`** drops a value equal to the last one, as `change` does,
  so a control that sends the same number twice does not retrigger.
- **`@inN_component <index or name>`**: write one part of a list without
  touching the rest. In ossia an address can name the hue of a colour, and score
  converts, replaces that one part and converts back.
- **Units**: the design has time, MIDI and decibels. ossia's families add
  **angle** (degrees, radians, turns), **colour** (RGB, HSV, HSL) and
  **distance**. Angle and colour fit the Jitter wrappers well.

### 7. `butter.pat`: state on a jump, and start and reset states

`butter.pat` will already store every control's value. Two ossia ideas extend
it:

- **Recall "as of" a cue.** When a show jumps to a cue, ossia works out the
  latest value every parameter would have had and sends it, so every device ends
  up where it would have been had the show run from the start. For `butter.pat`
  that is: recall cue N by replaying cues 1 to N, keeping the last value of each
  control, rather than only the values stored in cue N.
- **A start state and a reset.** ossia sends one state on play and on
  "reinitialise", and another on stop. A `reset` message to `butter.pat` that
  puts every control at its start value, without playing anything, is the same
  idea.

### 8. `butter.pat` or the inspector: one list of every control, and learn

ossia shows every device's parameters in one tree, with type, range and current
value, and builds that tree by "learn": touch a controller and its address is
added. `butter.pat` already knows every Butter control in its window; listing
them with their ranges, and adding a learn mode that binds the next incoming MIDI
or OSC message to a chosen control, would give Max the same in one place. The
inspector plan could show the list.

### 9. Named aliases with a transform both ways

ossia's Mapper device gives a readable name to another parameter (a MIDI CC
becomes `filter/cutoff`), with a script that rescales in each direction, and it
keeps running when the score is stopped. A small `butter.alias` abstraction, or
a `butter.pat` table, would let a patch say `CUTOFF` instead of `ctlin 74 1`,
with the scaling written once.

### 10. Ease from wherever the value is now

ossia can start an automation from the target's current value instead of the
first drawn point, for a smooth handover from a performer to a scripted move.
`@outN_ease` already glides from the last value. The same option belongs on
`butter_nodes` and any future curve player: start from the live value.

### 11. Record a control as an editable curve

ossia records incoming messages as automation curves that can then be edited.
Max's `mtr` records and plays, and its events can be changed by message
(`addevent`, `deleteeventat`, per its refpage), but there is no view that shows
a recording as a curve to redraw. A record mode on `butter_nodes`, or on a curve
lane in `butter_score`, would close that.

## Not a good fit for Butter_tools

- **Protocols** (MQTT, CoAP, NDI, Art-Net and sACN, GPIO, Bluetooth). These need
  compiled code or a separate process. Some could be built on `node.script`
  (MQTT, Art-Net over UDP), but that is a different kind of package from the
  scripts and abstractions Butter_tools holds now.
- **Hosting Pd, Faust, CLAP and LV2.** Host-level features, not objects.
- **Running headless on a Raspberry Pi.** A property of the application.
