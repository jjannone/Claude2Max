# Resolume Insights

Notes on how Resolume works, written for a reader who knows Max and not
Resolume. Everything here comes from the official manual at
`https://resolume.com/support/en`, fetched and read on 2026-10-03, plus the
Arena & Avenue REST API reference at `https://resolume.com/docs/restapi/`
(its `swagger.yaml`). Each section names its pages; page links are given as
the slug after `https://resolume.com/support/en/`, and the state file holds
each exact URL.

Resolume is not installed on this machine. Nothing here is from memory of the
product. Feature and panel names are spelled as the manual spells them.

"Resolume" below means the product family. **Avenue** is the VJ application;
**Arena** is Avenue plus the power-user features (projection mapping, edge
blending, timecode, DJ-player sync, DMX in and out, capture-card output,
groups, slice transforms). **Wire** is a separate node-based patcher for
making new effects, sources and blend modes. **Alley** is a free converter.

Companion files: `RESOLUME_CRAWL_LOG.md` (what was read),
`resolume_crawl_state.json` (per-page status),
`resolume_max_gap_candidates.json` (things Max lacks, and things both have
that Resolume does differently), `resolume_system_model.json` (Resolume on
the 20 system dimensions, plus one), `resolume_butter_tools_suggestions.md`.

---

## 1. What Resolume is for

Sources: `vocabulary`, `quickstart-tutorial`, `avenue-arena-difference`,
`composition`.

Resolume is an instrument for playing video live: you trigger clips, mix them
in layers, add effects, and send the result to screens. The manual says the
whole job is "trigger the right clip at the right time" (`clips`), and every
other feature exists to make that faster or to automate it.

For a Max user, the biggest difference is that there is no patching in Arena
or Avenue. The program is a fixed structure (a grid of clips, a stack of
layers, a chain of effects per level) and everything you do is a setting on
that structure. Logic, if you need any, comes from outside (OSC, MIDI, the
REST API) or from Wire.

## 2. The composition, decks, layers, columns and clips

Sources: `vocabulary`, `composition`, `decks`, `layers`, `clips`, `groups`.

- A **composition** is the whole show: clips, effects, settings and
  shortcuts. Switching compositions is slow, so a show is one composition.
- A **clip** is a video, still, audio file, video plus audio, a generated
  **source**, or a live input. Dropping an audio file and a video file on the
  same slot makes one AV clip, and Resolume fits the video to the audio's
  length (`decks`, `preparing-media`).
- **Layers** are the rows of the grid. Only one clip per layer plays at a
  time. Layer 1 is the bottom; higher layers paint on top (`layers` makes a
  point of this, using a painting analogy).
- **Columns** are vertical sets of clips. Triggering a column starts every
  clip in it, which is how a whole look changes at once.
- **Decks** split the clips of a composition into banks. Switching decks does
  not interrupt playback. A clip can be made **persistent** so it sits in the
  same slot in every deck. A deck can be imported from another composition by
  double-clicking it, and the manual suggests keeping "master compositions"
  as libraries for this (`decks`).
- **Groups** (Arena only) are sub-compositions: their layers blend only with
  each other on a transparent background, and the result is flattened into
  the main stack with the group's own blend mode and opacity. Groups have
  their own column triggers, speed, bypass, solo, eject and effects, and
  cannot be nested (`groups`).

A Max patch would hold each layer as a player (jit.playlist, or
jit.polymovie for preloaded switching) drawn by a jit.gl.layer. The grid,
the column trigger and the deck switch are things you would build.

## 3. Triggering and transport

Sources: `clips`, `video`, `stills`, `sources`, `bpm`, `layers`,
`composition`.

### How a click starts a clip

- **Trigger Style**: Normal (restart on each press), Toggle (second press
  stops), Piano (plays only while held).
- **Clip Target**: own layer, the active layer, or any free layer. Piano plus
  Free Layer lets you hold several keys and play "chords" of clips.
- **Beat Snap**: wait for the next beat, bar, 2 bars, 4 bars... before
  starting. Set per clip or "Composition determined".
- **Fader Start**: bringing the layer's fader up restarts the clip. With the
  pick-up play mode it becomes a fader stop.
- **Ignore Column Trigger** keeps a clip or layer playing when columns are
  triggered (a background or a live camera). **Lock Content** stops anything
  replacing a layer's clip, while its settings stay editable.
- Clicking a clip's name handle selects it without triggering it, so it can
  be prepared before it goes live.

### The clip transport

- **Timeline**: speed (non-linear, finer between 0 and 2), duration (set
  exactly: "make this last 8 seconds"), in and out points, direction.
- **BPM Sync**: speed follows the global tempo. The clip is given a length in
  beats, guessed as the nearest power of two; the speed control moves only by
  powers of two (1/8 to 16x) to stay on the beat. Stills and sources get a
  duration in beats too, which matters for the autopilot (`stills`,
  `sources`).
- **SMPTE**, **Denon** and **Pioneer** (Arena): the playhead follows external
  timecode or a DJ player (section 9).
- **Play modes**: Loop, Ping Pong, Random (jump every Interval within a
  Distance, both in seconds or beats), Play Once and Eject, Play Once and
  Hold.
- **Playmode Away** decides what happens when you come back to a clip: start
  over, **pick-up** where it was, or **relative pick-up** at the position the
  previous clip had reached. The manual notes that relative pick-up on a
  second copy of a timecoded clip makes a safety net if timecode drops out.
- **Cue Points**: press an unset cue point while playing and it takes the
  current time.
- **Beat Looper**: on a BPM-synced clip, loop the last N beats with one click;
  **Catch Up** jumps to where the playhead would have been when the loop ends.

### Layer transitions

A new clip in a layer can fade in over 0 to 10 seconds using any blend or
transition mode, or a random one each time; a clip can override its layer's
time and mode (`layers`, `clips`). Max has transition shaders in Jitter
Tools (the jit.fx.tr family), but each one mixes two inputs that you wire.

## 4. The autopilot

Source: `autopilot`, `clips`, `layers`.

The autopilot advances clips or columns by itself. It exists on the
composition, groups, layers and clips:

- **Direction**: forward, backward, or random. Random has Any, Other (never
  the same one twice in a row, the default) and **Bag** (play everything once
  before reshuffling).
- **Duration**: seconds, beats, clip end, or the longest, shortest, top or
  bottom clip in the column.
- **Clip actions** and **column actions** override the next step: previous,
  next, random, first, last, a specific one, or do nothing (which stops the
  autopilot after that item). A clip can loop N times first.
- A **Master Layer** can drive the composition or group autopilot, so one row
  of clips scripts a whole presentation.
- **Priority**: you win if you trigger something; otherwise the clip beats the
  layer, the layer beats the group, the group beats the composition.

Max has the parts (urn for drawing without repeats, jit.playlist's next), but
not a sequencer with these rules.

## 5. Mixing: blend modes, masks, effects, transforms

Sources: `layers`, `blend-modes`, `effects`, `transform`, `composition`,
`sources`, `lut`.

- **Blend modes** cover ordinary blends (Add is the default, Alpha is a plain
  mix), keys (Luma Key, Luma is Alpha), Displace, 50Mask, and transitions that
  play as the layer fades from 0 to 100%. **"50" variants** reach the full mix
  at 50% opacity, so audio and video faders can both be at the top in an AV
  set. OSC sees 51 blend modes by index (`osc`). New blends are made as Wire
  mixers.
- **Mask Mode** on a layer uses its black and white to hide either the one
  layer below (like a luma track matte) or all layers below.
- **Effects** run in a list per clip, layer, group and composition, top to
  bottom; clip effects first, composition effects last. Every video effect
  has its own opacity and blend mode; every audio effect a Dry/Wet. Hold ALT
  while dropping an effect to add it at zero opacity. **Effect Clips** put
  effects on an empty clip, which then acts on all layers below like an
  adjustment layer, and can be triggered, faded and sequenced like a clip.
- **Presets** set an effect's values once and are then forgotten; changing
  the preset later does not change effects that used it (the manual's
  "octopus" passage in `effects`).
- **Transform** is the first effect on every clip, layer, group and the
  composition and cannot be removed. Extra Transforms can go anywhere in the
  chain, each with opacity and blend mode. Arena's **Slice Transform** places
  content into chosen slices of the output map (section 8).
- **Crossfader**: layers and groups go on bus A or B; buses are composited
  first, then mixed by the crossfader with its own blend mode and curve. Its
  buttons can jump, jump-and-return, or cut while held.
- **Video Router** source: one layer, a group, the layers below, or the
  preview as the input of another layer, with switches for whether the
  input's opacity and bypass count.
- **LUT** effect: a `.cube` colour lookup with opacity and blend mode.

Max's equivalents are separate objects you chain and position: jit.gl.layer
carries position, scale and rotation on the drawing object; Jitter Tools has
composite modes (jit.fx.co.*) and transitions (jit.fx.tr.*); jit.gl.node
captures a group of objects to a texture.

## 6. Parameters, animation, envelopes and the dashboard

Sources: `parameters`, `parameter-animation`, `envelopes`, `dashboard`,
`expressions`, REST API reference.

Every adjustable thing is a **parameter**: sliders (some expand into several,
like rotation X, Y, Z), toggles, event buttons, radio buttons, dropdowns and
colours. All of them share the same features:

- Right-click resets to default. Value boxes accept maths with a few
  functions and constants (`-1920/4`, `pi`, `tau`, `phi`).
- The cogwheel menu sets what drives it. The REST API calls this the
  **phase source**: static, timeline, BPM sync, composition FFT, external
  FFT, the clip's/layer's/group's own FFT, crossfader, clip position,
  transition, or a dashboard dial.
- **Audio analysis**: pick Low, Mid or High, narrow the band with in and out
  points, set Gain and Fall. The audio can push the value up, push it down,
  or set the *speed* the value moves at.
- **Clip Position** ties a parameter to the clip's playhead, through scrubs,
  speed changes and beat loops.
- **Envelopes** reshape the input of a parameter, whatever drives it,
  including MIDI, OSC and the mouse. Keyframes sit on a 0-1 "phase" axis, not
  in seconds, because the same envelope may run in beats or on audio. Each
  keyframe picks a curve to the previous one (Quadratic, Sine, Circular,
  Exponential, Elastic, Back, Bounce, each In/Out, or Hold).
- Toggles, dropdowns and colour palettes can be animated: the timeline shows
  their states, envelope points snap to them, and "Basic" mode runs a toggle
  from a 0-1 slider (above 0.5 is on).
- **Start Settings**: an animation can restart on composition load, clip
  trigger or column trigger, or only by hand; a BPM-synced animation can drop
  its phase lock to start with its clip.
- **Dashboard**: eight dials at the top of each clip, layer, group and
  composition panel. Several parameters can share a dial, each with its own
  in/out points, invert, and **Dial Range** (the part of the dial's travel
  that moves it), so one dial can be a macro.

Max has no animation layer like this. Max's Parameter Mode
(`parameter_mode.json` in Max's userguide) gives names, ranges, initial values
and Live-style modulation, and MIDI/key mapping (`mapping.json`) gives
relative, trigger and pickup modes, but animation is whatever object you wire.

## 7. Control from outside: shortcuts, OSC, DMX, APIs

Sources: `keyboard-shortcuts`, `midi-shortcuts`, `dmx-shortcuts`, `osc`,
`restapi`, `websocket-api`, `mcp-servers`, `connect-grandma2`, REST API
reference.

### Shortcuts (keyboard, MIDI, DMX, OSC)

A shortcut mode colours every assignable control; click one, press a key or
move a control. Then:

- **Modes**: Toggle, Piano (momentary, optionally inverted), Value (jump to a
  set value), Range (what a button jumps between). MIDI CC has Absolute,
  Button (for controllers that send CCs from buttons), Relative and Fake
  Relative (endless knobs that actually send 0-127), with steps and loop.
  Notes add Velocity.
- **Target**: By Position (fader 1 is always layer 1), This (one specific
  item wherever it moves), or Selected.
- **Several shortcuts per parameter**, each with its own settings.
- **Shortcut groups** on dropdowns and radio buttons: step next, previous or
  random, or cycle through chosen items. A CC's value can pick clip 1-128 in a
  layer; a DMX channel spreads 0-255 over a dropdown's options.
- **Keyboard Mouse mode**: hold a key and the mouse drives a parameter.
- **MIDI out**: per state colours (a clip has five states), with colour
  tables for common controllers; two identical controllers are told apart by
  detection order. Ships with layouts for APC40 Mk2, APC Mini and
  nanoKONTROL 2.
- **DMX input** (Arena) arrives over Art-Net into virtual **Lumiverses**, so
  shortcuts survive a change of node or universe. USB DMX boxes are not
  supported. There is an Art-Net monitor per universe and channel.
- Shortcut sets are XML presets; the list marks duplicates in red.

### OSC

Every control has a fixed address, ready without setup
(`/composition/layers/1/video/opacity 0.25`). Many also have a relative
address on the *selected* layer. Values are 0-1, with the real range shown in
the type tag; an `"a"` argument sends an absolute value, `"+"`, `"-"` or
`"*"` change the current value, a string picks a choice by name, and `"?"`
asks for the current value, answered on the same address. Output can send
everything, or a preset of chosen items, with an "all layers" or "all clips"
scope and an optional custom address per item. Port 7000 by default;
ZeroConf/Bonjour discovery; a monitor of the last 200 messages.

### REST, WebSocket, MCP

The webserver (port 8080 for Arena and Avenue, 8081 for Wire) offers a REST
API to list, add, move and remove columns, layers, groups, decks, clips and
effects, fetch thumbnails and capture PNG snapshots of any monitor. Items are
addressed by 1-based index, by a stable id, or as `selected`. The WebSocket
at `/api/v1` sends the composition state, sources and effects on connect and
then accepts `subscribe`, `unsubscribe`, `set`, `get`, `reset` and
`trigger`, plus `post` and `remove` for structural changes. A custom
`index.html` in the root folder becomes a browser page. From 7.26, MCP
servers let AI desktop apps build compositions and Wire patches through the
same API (no output mapping, shortcuts, cue points, presets or envelopes).

Max's nearest: param.osc (reports parameters over OSC, lists them with
`info`), OSCQuery served by Max, maxurl (an HTTP client), and Node for Max for
anything server-shaped.

## 8. Advanced Output: screens, slices, warps, LEDs

Sources: `advanced-output`, `output-setup`, `screens`, `input-selection`,
`output-transformation`, `input-maps`, `edge-blending`, `slice-routing`,
`modifiers`, `dmx`, `fixture-editor`, `10-bit-color-output`,
`lots-of-outputs`, `syphonspout`, `NDI_inputs_and_outputs`, `transform`.

MadMapper's scan already covers most of this ground (slices, masks, warps,
edge blending, fixtures). What Resolume does its own way:

- Output setups are **presets separate from compositions**, so one stage
  setup serves many shows and vice versa.
- A **screen** is one output: a display, a capture card (Arena), Syphon or
  Spout, NDI (each NDI screen is its own source), a DMX Lumiverse, or a
  **virtual** screen whose result can feed a slice on another screen, which
  makes multi-stage warping possible (blend first, then map).
- Two stages: **Input Selection** chooses which pixels a slice takes;
  **Output Transformation** (Arena) moves and warps them. "Match Output
  Shape" / "Match Input Shape" copy one stage's geometry to the other. The
  `input-maps` page is a worked method for LED processors and cube mapping.
- Slices can take the composition, a single layer, a group, the preview or
  another screen as input. Layer routing bypasses blend modes and composition
  effects, and the manual warns not to use it to position content; use Slice
  Transform instead.
- **Slice Transform** puts content into each chosen slice (Fill, Fit,
  Stretch or as a mask) with per-slice bypass, solo and mirror; missing
  slices show red.
- Per screen: opacity, brightness, contrast, RGB and 0-100 ms delay. Per
  slice: flips, colour correction, **Is Key** (send the alpha as a white key
  for a broadcast mixer) and **Black BG**.
- DMX output: fixtures sample the picture; Lumiverses auto-span universes and
  avoid splitting a pixel across universes; ArtSync with an output frame rate
  and a delay (40 ms default) to line lights up with projectors.

## 9. Time sync: BPM, Link, MIDI clock, timecode, DJ players

Sources: `bpm`, `link`, `midi-shortcuts`, `smpte`, `sync-with-dj`,
`sync-to-denon-players`, `sync-to-pioneer-dj-players`, `preferences`.

- **BPM**: type it, Tap it, then **Resync** on the first beat of a phrase to
  send everything BPM-synced back to bar 1. A square circling a square shows
  the beat and lights every 16 beats. **Nudge** buttons speed up or slow down
  by a set percentage only while held. A metronome can go to headphones.
- **Ableton Link** keeps tempo and bar position in sync with any peer;
  Resync and pause are then disabled. **MIDI clock** in is supported (the
  manual calls it "notoriously wavy" next to Link).
- **SMPTE** (Arena): LTC from an audio input, two inputs at once; each clip
  has an offset and a delay in frames. The clip trigger is not part of the
  timecode, so the clip must already be playing.
- **Denon StageLinQ and Pioneer Pro DJ Link** (Arena): a clip linked to a
  track is triggered when the track loads, follows scratching and looping,
  locks its layer until the song ends, can follow the mixer's channel fader,
  and can be sent to a layer chosen per player.

## 10. Recording, rendering, media

Sources: `recording`, `clip-renderer`, `rendering-to-dxv`, `video`,
`stills`, `preparing-media`, `media-manager`, `conversion-with-alley`.

- **Record** the composition, a layer, a group, the crossfader or an output
  screen, with start and duration by hand, by time or by BPM, and drop the
  result on an empty clip. Real time, so dropped frames are recorded.
- **Clip Renderer**: render one clip with its effects offline at its exact
  length into a queue; BPM clips render at the current tempo.
- **DXV** is decoded on the GPU and is "always" the fix for a file that will
  not play. Resolume plays DXV, Photo-JPEG, GIF and (on PC) ProRes itself,
  then asks the OS, then FFmpeg. DXV is 8-bit; for a 16-bit pipeline use
  ProRes and 16-bit PNG/TIFF (`10-bit-color-output`).
- **Stills** load into memory only when triggered, which can hitch at 4K.
- The **Media Manager** relocates missing files by their relative folder
  structure, replaces a file everywhere (Set Path), and collects media into a
  Media folder with a subfolder per deck. It never deletes.

## 11. Wire, the patcher

Sources: `wire-introduction`, `wire-user-interface`, `wire-node-anatomy`,
`fast-patching`, `wire-resolume-integration`, `wire-saving-consolidating`,
`wire-fft`, `wire-midi`, `wire-osc`, `wire-slices`,
`wire-syphon-and-spout`, `isf`, `patch-compatibility`, `layouts`, `lut`.

Wire is the closest thing to Max in the family, and the manual mentions Max
by name as a Syphon partner.

- **Left to right.** Inlets on the left, outlets on the right; Auto-Layout
  sorts by that rule and feedback loops confuse it.
- **Three flows**, shown by port shape: signal (round, every frame), event
  (square, on change, possibly several per frame), attribute (diamond, only
  at compile time; changing it recompiles and it cannot be animated in the
  host). OnChange turns signal into events.
- **Input nodes** (Float, Int with option lists, Bool, Color, Trigger,
  Texture, Spectrum, Slice) become the plugin's controls in Arena, in the
  order of Wire's Dashboard, with foldable input groups and unit suffixes.
  The manual's advice: keep sliders 0-1 and map inside the patch.
- **The disconnection rule**: Wire lets an attribute change hide an inlet and
  drop its cable; Arena refuses such changes so the performer never sees a
  patch break.
- **Patching aids**: create a node from an inlet with only connectable nodes
  offered; chain node creation; double-click a cable to insert a node;
  Expose Inputs; Visibility to hide rarely used ports; Select All Unused (nodes
  that reach no output); Wrap in Comment; thumbnails on nodes; a monitor that
  follows the selected node; a Stats panel with per-node load and minimum
  version.
- **Sharing**: Copy For Sharing (patch as text), Consolidate (copy resources
  beside the patch), Export as Video, and Compile to `.wired` (editable) or
  `.cwired` (locked), usable in Arena without a Wire licence; command-line
  compile too. Old patches get conversion nodes when Wire changes behaviour.
- **ISF** shaders in an ISF node; inputs come from the JSON header; no vertex
  shaders "since we are still dealing with 2D".
- MIDI In/Out, OSC In/Out, Spectrum In (1024 bins from local, composition or
  external audio), Slice In (the host's slices), Syphon and Spout in and out
  of Texture nodes.

---

## Where Max is ahead

Each point is checked against Max's own docs or registry, as noted.

- **Logic.** Max is a programming language with JavaScript, Node, Lua and gen
  inside (`max_system_model.json` dimension 13). Arena and Avenue have no
  scripting; logic must come from outside or from Wire, which only makes
  effects, sources and mixers.
- **Audio.** MSP, MC, gen~ and the installed packages patch audio sample by
  sample. Resolume's audio is playback, a handful of effects, VST hosting and
  FFT for driving visuals.
- **3D.** Jitter has a render tree, cameras, materials, models
  (`max_system_model.json` dimension 15). Resolume and Wire are 2D; Wire has
  no vertex shaders (`isf`).
- **Any data, any sensor.** Max reads serial, HID, MIDI, OSC and anything
  Node can reach, as messages you can process. Resolume accepts keyboard,
  MIDI, OSC and Art-Net into parameters.
- **Building your own interface.** A Max presentation view is a performer UI
  you design (`max_system_model.json` dimension 11). Resolume's panels are
  fixed; a custom surface lives in TouchOSC or a web page.
- **Debugging.** Max has watchpoints, stepping and probes on cords
  (userguide `debugging_and_probing.json`). Resolume has message monitors and
  red marks.
- **Mapping depth on the controller side.** Max's mappings already offer
  relative encoder modes, cycle and momentary trigger modes and **pickup**
  (userguide `mapping.json`); no pickup mode is described in Resolume's
  MIDI pages.
- **Deployment.** Max builds standalones and Max for Live devices and exports
  with RNBO (`max_system_model.json` dimension 18). A Resolume show needs a
  licensed Resolume on the show machine.
- **Built-in Link and NDI are Resolume's**, but Max reaches both through
  packages (Link: `link.beat`, `link.session` in the repo's package library).
