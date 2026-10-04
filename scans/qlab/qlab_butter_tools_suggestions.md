# QLab → Butter_tools: suggestions

QLab is not used or installed here. This file only takes ideas from its manual
(read in `qlab_insights.md`, sources there) and asks which would make good
Butter_tools objects. Each idea was checked against what Butter_tools already
has or plans: `Butter_tools/README.md`, `docs/BTR_WRAPPERS.md`,
`docs/BUTTER_PAT.md` (including its *Later: scenes and timelines* list),
`docs/BUTTER_INSPECTOR_PLAN.md`, `docs/BUTTER_CARVE_PLAN.md` and the ossia
score section of `docs/IDEAS.md` (`butter_score`, `butter.map`,
`butter_zones`, `butter_query`, `butter.spread`, the `btr.` extras, recall
"as of" a cue, start and reset states, the control list with learn,
`butter.alias`, ease from the current value, record a control as a curve).
Nothing below repeats those; where an idea touches one, it says how it differs.

Names follow the package's rules: an object (a script) takes an underscore, an
abstraction a dot, a wrapper `btr.`, anything for video `jit.`. JavaScript in
Max runs on the low-priority thread (`BTR_WRAPPERS.md`, and the Max userguide's
*Scheduler and Priority* page), so every idea below keeps the timing in real
Max objects and uses a script only for the list, the drawing and the decisions.
All are suggestions; nothing is built. (2026-10-03.)

## New objects

### 1. `butter_cuelist` + `butter.cuelist` — a cue list with a playhead and GO (the strongest idea)

What QLab does that Max has no object for: an ordered list of whole actions
with a **playhead**, a **GO** that starts the cue standing by and advances,
a **standby display** with an operator **note**, per-cue **pre-wait, duration
and post-wait**, and two continue modes: **auto-continue** (start the next
when this starts, after the post-wait) and **auto-follow** (start the next when
this ends). It also separates GO (moves the playhead) from triggers and Start
(do not), and GoTo (moves it without starting).

As Butter tools: `butter_cuelist`, a `v8ui` drawing the list (cue number as
text, name, the three times, continue mode, armed, colour, status), probably
as a mode of `butter_table`, which already sorts, filters and edits cells. Each
cue sends a named message (`s` name or outlet) when it starts. `butter.cuelist`
is the abstraction around it that holds the clocks: `delay`/`pipe` for waits,
so timing stays on the high-priority thread. A cue's "done" comes back in by
message (from `sfplay~`, `jit.movie`'s `loopnotify`, or a timer), which is what
auto-follow needs.

How it differs from the plans: `butter_score` is a branching timeline;
`butter_scene` is preset slots with transitions; the GO/BACK key is a
`butter.pat` job. `butter_cuelist` is the linear, operator-driven list that
theatre students expect, and `butter_scene` recalls could be cues in it.

### 2. `butter.slices~` — slices with play counts, and devamp

QLab splits a sound or video into **slices**, each with its own play count
(0 skips, infinite loops), and a **Devamp** cue leaves the current loop at the
end of the slice, optionally starting the next cue **at that exact moment**.

As an abstraction (`~`, so timing is in the signal domain): `groove~` or a
`gen~` reader over a `buffer~`, a list of slice points and counts, and
messages `devamp`, `devamp next` (send a bang out at the slice end, sample
timed), `devamp stop`. Max's `groove~` has one `setloop` pair and no
loop-end report (refpage); `sfplay~` has numbered `preload` regions and
`loopone`, but no counts. Import markers from AIFF/WAV like QLab does if Max
exposes them; otherwise a `slices` message.

### 3. `butter_path` — draw a 2D path, play it over a time

QLab's Fade and Network cues move two values along a drawn **2D path** over a
duration, with a circle tool, flip, rotate, reverse, **smooth**, **loop**, and
**merge**: if the target is not at the path's start, it eases onto the path over
a set percentage of the fade instead of jumping.

As a `v8ui`: draw and edit the path, then `play <ms>` outputs `x y` at a rate
(timing from a `metro` in a small `butter.path` wrapper, or driven
by a 0-1 ramp from `line`/`line~` sent in, which keeps timing outside the
script). Merge needs the current position sent in first. Differs from
`butter_nodes` (weights from a position, not motion) and from IDEAS item 11
(recording a control as a curve).

### 4. `butter_levels` — QLab's level matrix as a UI over `matrix~`

QLab's cue matrix puts **output levels in row 0, input levels in column 0,
the main level in the corner**, crosspoints in between, all in **dB**, with
**gangs** (type a letter into fields to link them), a "this cue makes sound
here" mark, mute and solo per output, and a separate **trim** row that no
automation can move.

As a `v8ui` that draws that grid and sends three-number lists to `matrix~` or
`mc.matrix~` (refpage: inlet, outlet, gain; `@ramp` in ms), converting dB to
gain. `crosspatch` (refpage) edits connections but not levels in dB. The trim
row is the useful idea for students: one manual-only gain after every automated
one.

### 5. `jit.butter.stage` — stage, regions, routes, edge blend

QLab separates **stage** (the canvas cues draw on), **regions** (parts of it),
**routes** (to an output, with a scaling mode of center, fit, stretch or fill,
90° rotation and rear projection) and **devices**. Overlapping regions
**edge-blend automatically** with one gamma per stage; a stage **mask** is an
image file that reloads when it changes; alignment grids show per region.

As an abstraction (`jit.`, dot): one `jit.gl.node` as the stage, then per
region a crop, an edge-blend shader in `jit.gl.slab` (Jitter Tools already
ships `tr.edgeblend.jxs`, a gradient-alpha shader with a `fade` parameter) and a
`jit.gl.meshwarp` or `jit.gl.cornerpin` to its window. What Max lacks is the
part QLab automates: computing each region's blend widths from the overlap, and
a blend gamma per stage.
Related but different: `jit.butter_crop` crops one picture; `jit.butter.alphamask`
applies one mask image to one video. The stage would reuse alphamask for its
mask and reload it through `filewatch` (refpage: bangs when a file is altered).

## Additions to existing or planned tools

### 6. `butter.pat`: audition, override and panic, patch-wide

Three QLab safety ideas that belong to the patch, which is `butter.pat`'s job:

- **Audition**: for each class of output (audio, video, MIDI, network) a
  rehearsal destination: unchanged, silent, an alternate output, or a monitor
  window. `audition 1` switches every Butter output at once; `always
  audition` for a whole session.
- **Overrides**: global switches that cut input or output per protocol (MIDI,
  OSC in, OSC out, local OSC), with a mark on every affected tool.
- **Panic**: one message that fades every Butter output over a set time and
  then stops; a second panic during the fade cuts at once. Fixed key
  (QLab uses Esc, unchangeable on purpose). Plus **double-GO protection** if
  `butter_cuelist` exists.

None of these is in `BUTTER_PAT.md`; the key listener it already plans is where
panic would live.

### 7. `butter.pat` OSC plan: increments, live values and subscriptions

`BUTTER_PAT.md` routes OSC through `pattrstorage`. QLab's dictionary adds
conventions worth copying on top:

- a bare address **reads** and replies with the value; an argument writes;
- `/path/+ n` and `/path/- n` **increment** (lists roll over);
- `/path/live v` changes the value **without marking the patch edited or
  storing it in memory**, reverted by `reset`;
- `/updates 1` **pushes** changes to a client; `/listen` with a scope
  subscribes to show events (GO, start, stop) with a client-chosen format.

### 8. `butter.pat` storage: saved versus temporary values

QLab keeps designed values apart from performance-time changes: fades, target
changes and live OSC are **temporary**, never saved, and cleared by **Reset**,
which makes the show behave "as though it was just opened". `butter.pat`'s
`memory` slot remembers the last state, which is the opposite default. A
per-control flag "temporary changes don't go to memory", plus a `reset` that
returns to the designed values, would give both. (IDEAS item 7 has a reset to
start values; this adds the split between saved and temporary.)

### 9. `butter.pat` transitions: sparse, relative and revertible fades

`BUTTER_PAT.md` plans scene transitions with a fade time and curve. QLab's Fade
cue adds three things the plan does not have:

- a fade moves **only the parameters marked active**, so two fades on one
  target with different parameters run together;
- **relative** fades add (levels, positions) or multiply (scale, opacity), and
  an absolute fade clears earlier relative changes;
- **Revert Fade Action** undoes only what one fade changed.

Separate rising and falling curves, and dB-domain level fades, apply too.

### 10. `butter_nodes` / planned `butter_zones`: marks with gravity, shadow and filters

QLab's object audio stores a set of output levels at **marks**; an object's
levels follow its distance to the marks, with **gravity** (reach, 0.1 to 5),
**shadow** (marks hide marks behind them, 0° to 90°), **filter** lines that
block influence (optionally per output), and **spread** (the object takes the
loudest level inside its area). A **heatmap** shows one output across the map.
Max's `nodes` gives distance weights from circles (refpage). These options fit
`butter_nodes` or the planned `butter_zones` and turn either into a spatial
mixer that drives `matrix~`.

### 11. `butter_score` (planned): record the timing by playing

QLab's **Record Cue Sequence** lets an operator run cues by hand and turns the
timing into a group of timed starts. For `butter_score`, a record mode that
captures when named sections were fired would build a first draft of the
score. Different from IDEAS item 11, which records a control's values.

## Not a good fit

- **AppleScript and Script cues.** Mac-only, and Max has JavaScript.
- **Collaboration** (several computers editing one show). Needs a server and a
  sync model far beyond a package of scripts and abstractions.
- **NDI, Blackmagic keying, Syphon outputs.** Compiled code or other packages
  (Syphon is already an installed package).
- **The lighting command language, fixture library and DMX output.** A large,
  separate system; Max lighting is better served by existing packages.
- **Timecode in and out (LTC/MTC).** Needs a decoder at signal rate; worth
  doing, but as compiled or `gen~` work, not a Butter script.
- **Licensing, QLab Remote, the Stream Deck plugin.** Product concerns, not
  objects.
