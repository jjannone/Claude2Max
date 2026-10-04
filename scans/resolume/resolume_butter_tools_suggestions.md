# Resolume → Butter_tools: suggestions

Resolume is not used or installed here. This file only takes ideas from its
manual (read in `resolume_insights.md`, sources there) and asks which would
make good Butter_tools objects. Each idea was checked against what
Butter_tools already has or plans (`Butter_tools/README.md`,
`docs/B_WRAPPERS.md`, `docs/BUTTER_PAT.md`, `docs/BUTTER_MC_JIT.md`,
`docs/BUTTER_INSPECTOR_PLAN.md`) and against the ideas already in
`docs/IDEAS.md` (the ossia score list: `butter_score`, `butter.map`,
`butter_zones`, `butter_query`, `butter.spread`, the wrapper and `butter.pat`
additions). None repeats those. Names follow the package's rules: an object (a
script) takes an underscore, an abstraction a dot, a wrapper `b.`, anything
for video `jit.`. All are suggestions; nothing is built. Not yet copied into
`IDEAS.md`. (2026-10-03.)

A rule that shapes several of these: JavaScript in Max runs on the
low-priority thread, which is why `B_WRAPPERS.md` keeps timing objects real.
So wherever an idea below has to land on a beat or a frame, the script decides
*what* happens and a real object (`metro @quantize`, `transport`, `line`,
`jit.world`'s frame) decides *when*.

## New objects

### 1. `jit.butter_grid` — a clip launcher (the strongest idea)

What Resolume is built around and Max has no object for: a grid of clips
where each row is a layer that plays one clip at a time, and a column header
starts a whole row of clips at once (Resolume's `clips`, `layers`, `decks`).
Around it sit the trigger rules that make it an instrument:

- **Trigger style** per clip: normal (restart), toggle, piano (only while
  held).
- **Target**: own row, the selected row, or the first free row, so piano plus
  free row plays several clips like a chord.
- **Quantise**: start on the next beat, bar or N bars.
- **Return**: restart, pick up where it was, or start at the previous clip's
  relative position.
- **Ignore column**, **lock row**, **fader start**, and **persistent** slots
  that stay put when the page (Resolume's deck) changes.

As a Butter tool: a `v8ui` that draws the grid and sends messages per row,
such as `row 2 play 5`, `row 2 stop`, `row 2 position 0.4`, for whatever
player the patch puts on each row (`jit.playlist`, `jit.polymovie`, an audio
player). It holds pages of slots and saves them with the patch. It does not
play video itself.

Timing: the grid decides what is armed; quantised starts come from a real
`metro @quantize` or the transport in a `jit.butter.grid` wrapper abstraction,
or from a 'go' message the patch sends on the beat.

### 2. `butter_autopilot` — rules for what plays next

Resolume's autopilot advances by itself (`autopilot`): forward, backward, or
random, where random can be **Bag** (everything once, then reshuffle). It moves
after a time in seconds or beats, at the end of the item, or at the end of the
longest or shortest item in a column. Each item can override the next step
(first, last, a named one, or stop), and a clip's choice beats its layer's,
which beats the composition's.

As a Butter tool: a `v8` that takes `done` (the current item ended), `tick`
(a beat or time arrived) and `next` / `prev`, and answers with the index to
play. It knows nothing about video, so it can sequence `jit.butter_grid` rows,
a `jit.playlist`, `coll` entries or presets. Item actions are a small table
(`action 4 first`, `action 7 stop`). The waiting itself is a real `metro` or
the player's own end report.

This is not `butter_score` from `IDEAS.md`: that is a timeline with waits and
branches; this is a rule for picking the next item in a list.

### 3. `butter_macro` — one control that drives many, each over its own part

Resolume's dashboard dials (`dashboard`) let several parameters share one
dial, each with its own in and out points, invert, and a **dial range**: the
part of the dial's travel that moves it. The first third of the dial can
sweep one effect and the rest another.

As a Butter tool: a `v8` with one inlet and one outlet per target (or `name
value` pairs out one outlet). Each target gets `target <n> <out low> <out high>
<dial from> <dial to> [invert] [curve]`, with the curves from `butter_ease.js`.
The `b.` wrappers already scale one port; the new part is one value fanned
out to many targets over chosen segments. A `v8ui` version could draw the
segments as bars under the dial.

### 4. `butter.drive` — one front end that animates any control

Every Resolume parameter has the same menu of drivers (`parameter-animation`,
the REST API's "phase source"): manual, a timeline loop, tempo-synced, audio
level, the crossfader, the clip's playhead, a dashboard dial, with one
envelope that shapes the result whatever drives it (`envelopes`). An
animation can restart on a trigger instead of free-running.

As a Butter tool: an abstraction placed in front of a control. A menu picks
the source; the curve sits last, after every source, so MIDI, OSC and
automation all pass through it (Resolume's envelope rule). Sources are real
objects inside: a `phasor~` or transport-linked `metro` for tempo,
`butter_chop`'s channels for LFO and noise, an envelope follower for audio,
and an inlet for 'external'. A `restart` message resets the phase, and an
option chooses free-running or restart on each trigger.

`IDEAS.md` #10 ("ease from wherever the value is now") and the wrappers'
`@outN_ease` smooth a value; this is about where the value comes from.

### 5. `jit.butter_stage` — place a picture into many regions of a stage

Resolume's Slice Transform (`transform`, `input-maps`) takes the output map's
slices and puts a copy of the content into each, scaled to Fill, Fit or
Stretch, or used as a mask, with per-slice bypass, solo and mirror. A slice
that has gone missing turns red while the rest keep working. Wire's Slice In
(`wire-slices`) gives the same regions to a patch as shapes.

As a Butter tool: a `v8ui` where you draw rectangles (later polygons) on the
output canvas, feed in a texture, and get one texture back with the picture
placed in every region by its own rule. It is the other half of
`jit.butter_crop`: crop cuts one picture into cells, stage places a picture
into many cells. A Butter mc.jit inlet (`docs/BUTTER_MC_JIT.md`) would take a
batch and put frame *n* into region *n*. The regions are also written to a
named `dict`, so other objects can read the stage layout.

Not `butter_zones` (`IDEAS.md` #3), which blends values by distance from
polygons; this draws pictures into them.

### 6. `jit.butter.xfade` — one mixer with every mode behind one amount

Resolume puts blends, keys and transitions in one list, each run by one 0-1
amount, plus '50' variants that reach the full mix at the halfway point
(`blend-modes`). A layer can also fade a new clip in over a time, with a
fixed or random transition (`layers`).

As a Butter tool: an abstraction with two texture inlets, a mode menu, an
`amount` (0-1) and a `fade <ms>` that runs the amount by itself. Inside are
Max's own Jitter Tools shaders, the composite modes (`jit.fx.co.*`) and
transitions (`jit.fx.tr.*`, for instance `jit.fx.tr.xfade`, `jit.fx.tr.dissolve`,
`jit.fx.tr.gridwipe`), switched so only the chosen one renders. A `random`
mode picks a transition each time. The ramp is a real `line` (or a
frame-locked counter), not a script timer.

### 7. `butter.tempo` — tap, resync to the phrase, and a held nudge

Resolume's tempo bar (`bpm`): tap the tempo, press Resync on the first beat of
a phrase to send everything back to bar 1, watch a beat indicator that lights
every 16 beats, and hold Nudge to speed up or slow down by a set percentage
only while the button is down.

As a Butter tool: an abstraction around Max's own `transport` (it is timing,
so it stays a real object) with tap averaging, `resync`, `nudge +` / `nudge -`
while held with `@nudge <percent>`, and a phrase counter out. Third-party tap
tempo exists (Upshot's `upshot_transport`, in the repo's package library); the
held nudge and the phrase resync were not found anywhere.

## Additions to planned tools

### 8. `butter.pat`'s OSC: query, relative changes, names, and scopes

`BUTTER_PAT.md` plans to make every stored control reachable by OSC through
`pattrstorage`. Resolume's OSC (`osc`) adds four things worth copying:

- **`?` query**: sending `?` to an address makes it reply on the same address
  with the current value.
- **Relative values**: `+ 0.1`, `- 0.1`, `* 2` change the current value, so a
  controller can nudge without knowing it.
- **Choices by name**: a menu takes the item's name as well as its index.
- **Output scopes**: send changes for everything, or only for chosen
  controls, with an 'all rows' style wildcard, each with an optional custom
  address.

### 9. `butter.pat` or a small `butter_focus`: target by position, identity or selection

Every Resolume shortcut chooses what it follows (`midi-shortcuts`): a
position (fader 1 is always row 1, whatever is moved), one specific item
wherever it moves, or whatever is selected. OSC and the REST API offer the
same three. In Max a mapping or `s` name always points at one thing.

A `butter.pat` option, or a `butter_focus` `v8`, that keeps a "selected"
target among named Butter controls (or numbered rows of `jit.butter_grid`)
and relays incoming control messages to it, would let eight knobs edit any of
many voices. It pairs with the learn idea already in `IDEAS.md` #8.

### 10. `b.` wrappers: inlet modes for endless knobs and buttons

From Resolume's MIDI shortcut modes (`midi-shortcuts`):

- **`@inN_relative <mode>`**: decode an endless encoder's relative values, or
  turn an absolute knob into relative changes (Resolume's "Fake Relative"),
  with a step size and optional wrap. Max's own mappings have relative modes
  (userguide `mapping.json`), but only for mapped objects in Parameter Mode,
  not for a value arriving at an inlet.
- **`@inN_button <mode> <low> <high>`**: treat a 0/non-zero input as Toggle,
  Piano (momentary, optionally inverted) or Value (jump to a fixed value).

## Not a good fit for Butter_tools

- **DJ-player sync** (Denon StageLinQ, Pioneer Pro DJ Link). Network protocols
  that need compiled code or a separate process.
- **Timecode (LTC) decoding** from an audio input. A signal-rate decoder
  belongs in a compiled external or `gen~`, not a script, and Max has no
  object for it to wrap.
- **A REST / WebSocket server or an MCP server for patches.** Possible in
  Node for Max (`node.script`), but that is a different kind of package from
  the scripts and abstractions Butter_tools holds now.
- **DXV and codec handling, media relocation.** Belong to the video engine and
  to Max's projects (consolidate and archive, userguide `projects.json`).
- **Edge blending and multi-output setups.** Already covered by the MadMapper
  entries in the repo's gap list, and closer to a full mapping tool than to a
  Butter object.
