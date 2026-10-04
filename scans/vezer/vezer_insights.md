# Vezér Insights

Notes on how Vezér works, written for a reader who knows Max and not Vezér.
Every entry comes from Imimot's official help pages at
`https://imimot.com/help/vezer`, fetched and read on 2026-10-03, or from the
product page `https://imimot.com/vezer`. Sources are given as the path after
`https://imimot.com/help/vezer`; the state file holds each exact URL.

Vezér is not installed on this machine. Nothing here is from memory of the
product. Names are spelled as the docs spell them. The help is short (about
14,000 words over 87 pages), and much of it is a sentence or two per page, so
several topics the brief asked about are simply not documented (see the end).

Companion files: `VEZER_CRAWL_LOG.md` (what was read), `vezer_crawl_state.json`
(per-page status), `vezer_max_gap_candidates.json` (24 candidates),
`vezer_system_model.json` (the 20 dimensions plus one),
`vezer_butter_tools_suggestions.md`.

---

## 1. What Vezér is

Source: product page; `/tutorials/other-softwares-and-vezer`.

A macOS timeline sequencer for control data only: MIDI notes and CCs, OSC
messages and Art-Net DMX, with audio files as reference. It makes no sound
or picture of its own (apart from playing audio files). It sits beside media
software (the tutorials name Resolume, MadMapper, Modul8, CoGe, VDMX, Ableton
Live, TouchOSC) and tells it what to do over time.

For a Max user: imagine a project full of `function` editors, each wired to
one `udpsend`, `ctlout` or DMX output, all locked to one clock, with cue
markers on top. That is the whole program. ossia score (the previous scan) is
a timeline with a dataflow engine inside it; Vezér has no engine at all.

## 2. Compositions: many timelines in one project

Sources: `/compositions/what-is-a-composition-in-vezer`,
`/compositions/composition-preferences`, `/compositions/faq`,
`/general/composition-queue-mode`, `/changelog`.

- A **Composition** is a group of tracks with its own duration, frame rate
  (up to 125 fps since 1.9.9), tempo, sync source, loop range and cue track.
  A project holds any number.
- Several compositions can play at once. **Solo** mode makes triggering one
  stop the others (and can black out DMX when it does).
- **Queue** mode chains them: the master Play starts the first, and each starts
  the next at its end. The queue can loop, and can start from the selected one.
- Composition names must be unique; OSC addresses them by name, by index
  (from 1) or as `current`.
- The working range (loop points) limits playback; regions outside it are
  darkened. Version 1.9 added "Cut Work Area" and "Insert Time at Playhead".

Max comparison: `transport` with a name gives several independent clocks
(its refpage: "multiple named transports running simultaneously"), but no
keyframe lanes belong to them.

## 3. Tracks: one lane per output

Sources: `/tracks` and every page under it.

Every track has a name (for management only), an enable button, a **Bang**
button that sends its current value, and the active keyframe's time and value.
The types:

| Track | Sends | Notes |
|---|---|---|
| MIDI CC | one CC on one channel | 14-bit option on CC 0-31 (MSB with LSB 32 higher) |
| MIDI Notes | notes in a range | per-keyframe NoteOn and NoteOff velocity |
| OSC Value | int, float or boolean | min and max per track; option to send 0-1 floats whatever the range; 2 or 5 decimal places |
| OSC Flag | an address per keyframe | no value, no interpolation; fixed arguments allowed |
| Color | RGBA to OSC or Art-Net | keys drawn in their colour; linear or no interpolation |
| Art-Net Value | DMX channel(s) | channel lists like `1x10, 12, 24`; 16-bit option over two channels |
| Audio | an audio file | not keyframes; see section 8 |

When too many keyframes are visible at the zoom level, a track shows a
low-resolution view and only the whole group can be edited.

**Processing** (`/tracks/processing`): tracks are sampled at the composition's
frame rate. An interpolating value track never sends the same value twice in a
row ("optimised value sending", on by default); keyframes always send. Outside
playback a track only sends when its settings change, or on scrub or keyframe
drag if those preferences are on.

**OSC range change** (`/tracks/osc-value-track`): when min or max changes,
existing keyframes are recalculated into the new range, clamped, or deleted.
Max's `function` has the first behaviour built in: its refpage says `setrange`
moves all points so they "remain in the same place given the new range".

## 4. Keyframes and curves

Sources: `/keyframes/*`.

- Double-click creates, Delete removes. The **active keyframe** (thick white
  border) shows its time and value in the track settings; Tab jumps to them.
- Time and value fields take absolute values (`2:00:00` minutes, `2:00`
  seconds, `2` frames; `(-27)` for a negative value) or relative ones with a
  sign (`+2:00`, `-27`). Typing `i` inverts the selection in time or value.
  Alt-drag on the first or last of three or more selected keys stretches them.
- **Interpolation** is per keyframe, from a right-click menu. The page's text is
  one sentence; its screenshot of the menu (viewed) lists No Interpolation,
  Linear, then Ease-In, Ease-Out and Ease-In-Out for Quadratic, Cubic,
  Quartic, Quintic, Sine and Circular. The screenshot is cut off there, so any
  further families are unknown. No curve handles or bezier editing are
  described.
- Cut, copy, paste and paste-in-place work across tracks and compositions;
  values are converted to the target track's range. Pasting colour keys onto a
  value track uses luminance; pasting value keys onto a colour track asks which
  RGB or HSB channels they drive.
- "Select Same/Different" picks keys by value.

## 5. Cues

Sources: `/cues` and every page under it.

Each composition has a cue track between the timeline and the tracks.

- **Stop** cue: playback pauses when reached, even when the composition is
  following external sync. **Marker**: a reference point that does nothing.
- Either can repeat: **Play once**, **Loop** a set number of times (back to it
  from the next cue, or from the end), or **Infinite Loop**. A loop is broken
  by switching cues off or jumping to the next cue.
- Cues can be created from selected keyframes, moved, stretched, and named;
  `<$>` in a name becomes the cue's index.
- **Move By Cue**: hold the mouse two seconds on a cue to move or stretch it
  with all the keyframes it governs (locked tracks are left alone).
- OSC: `jumptocueatindex`, `jumptocuewithname`, `playcueatindex`,
  `playcuewithname`, and `resetcuestates`, which clears every cue's loop count
  and played state.

## 6. Time, tempo and sync

Sources: `/compositions/tempo-and-synchronisation`,
`/compositions/transmit-midi-timecode-mtc`,
`/compositions/transmit-midi-machine-control-mmc`,
`/controlling-vezer/mmc-transport`, `/tools/*`, `/general/nmc-protocol`.

- **Tempo is a speed control.** 120 BPM is normal; 60 plays at half speed. BPM
  can be typed, set by MIDI or OSC, or measured from a MIDI clock source
  (Vezér waits for a MIDI Start). Tempo does not change audio playback.
- **Sync per composition**: SPP (follow MIDI clock start, stop and position) or
  MTC (follow timecode). An SMPTE offset sets where the composition starts in
  the incoming timecode; the display counts down to it.
- **Transmit**: a composition can send MTC (a full-frame message on every jump,
  plus a start-time offset) and MMC (Play, Stop, Rewind, Locate). MMC goes to
  device 127 by default, or to the composition's index, so one machine's
  composition 3 drives another's composition 3. A composition cannot both send
  MTC and follow a sync source.
- **Receive MMC**: device ID 0 is the master transport, 127 the current
  composition, 1-126 a composition by index. Locate needs matching frame rates.
  Off by default.
- Standalone **MIDI Clock Generator** (with tap tempo) and **MTC Generator**
  tools.
- **NMC**: Imimot's own protocol for broadcasting transport and locate between
  Vezér and Mitti (Imimot's video player) on a local network. Its format is not
  documented.
- **LTC** is not mentioned anywhere in the help.

Max comparison: no MTC, MMC or SMPTE object exists in the registry
(`obj-qlookup.json`); `rtin` receives MIDI clock, `sync~` follows and makes MIDI
beat clock, and `sxformat` can build sysex such as MMC by hand.

## 7. Recording

Sources: `/recording/general`, `/recording/filtering`,
`/general/preferences-global-behaviours`, `/tracks/14-bit-midi-support`,
`/tracks/16-bit-art-net-support`.

- With record on and playback running, any incoming MIDI CC, MIDI note (with
  velocity), OSC number or boolean, or Art-Net channel that is not MIDI-learned
  to Vezér's controls gets a new track of the right type. Later passes record
  into the same track; renaming a track makes the next pass start a fresh one.
- A multi-value OSC message gives one track per argument, addressed `/xy#n`,
  which is the same `#n` syntax used to group tracks back into one message on
  output (section 9).
- Recording overwrites the same span even when nothing arrives. It can stop at
  the loop end or keep overwriting around the loop.
- **Normalised recording** keeps a keyframe only where the value changes
  direction, so a fader move becomes a few editable points.
- A filter table lists every message received this session; ticking entries
  limits what is recorded. 14-bit CC and 16-bit DMX must be marked by their MSB
  in the filter preferences, since they cannot be detected.
- A track cannot record and play at once.

Max comparison: `mtr` records messages per inlet and plays them back (its
refpage), but creates no tracks from addresses and keeps every event.

## 8. Audio tracks and audio to keyframes

Sources: `/tracks/audio-track`, `/general/preferences-audio`, `/changelog`.

Audio tracks play wav, aif, mp3, m4a, aac, or the audio of an mp4, from a start
time, through the project's default device or their own, with a channel map.
Several audio files in one composition start together (1.8.9). Selecting part
of the waveform and pasting it onto another track turns its envelope into
keyframes; a filter button (highpass, mid, lowpass, cutoff by right-click)
changes what is converted, not what is heard. "Trim or expand composition to
audio length" fits the timeline to a file. Aggregate audio devices are not
supported.

## 9. OSC in detail

Sources: `/osc-track-extras/*`, `/tracks/osc-color-tracks`,
`/general/outputs-of-vezer`, `/tracks/osc-value-track`.

- **Outputs** are named and chosen per track. Vezér can auto-discover some
  apps' OSC inputs and reconnects to Bonjour OSC targets when they reappear.
- **Grouping**: tracks addressed `/example#1`, `/example#2` are sent as one
  message `/example` with two values.
- **Address keywords**: `$COMP` (composition name), `$COMPINDEX`, `$TRACK`
  (track name), and a bare `$` for the track's own value inside the address
  (`/layer$/trigger`). Fixed arguments go in angle brackets (`<100>`,
  `<42.24>`, `<"text">`); the track value goes last unless `<$>` places it;
  `<$F>` sends the frame number.
- **Colour formats**: standard OSC colour (RGBA), an array in a chosen range,
  or one message per channel with suffixes, each recommended for particular
  apps.
- **OSC Presets** save an address, track type and range, grouped in `.plist`
  files that can be shared.
- **OSCQuery client** (1.7): a server's address space can be browsed and
  searched; double-clicking an address makes a track with its type and range,
  or a Flag track for addresses with no arguments. In 1.7 the docs say only
  Mitti supported OSCQuery; MadMapper's OSCQuery demo is linked in the
  tutorials.

## 10. Controlling Vezér from outside

Sources: `/controlling-vezer/*`, `/cues/jumping-to-a-specific-cue`.

- **Show OSC Namespaces** colours every OSC-controllable item yellow and shows
  a selected item's address. **MIDI Learn** colours learnable items red.
- Playhead: `/vezer/<comp>/playhead` (0-1, or `hh:mm:ss:ff` since 1.8.9),
  `jumptoframe`, `nextframe`, `prevframe`.
- Compositions: `stopcomps`, `triggernextcomp`, `triggerprevcomp`,
  `triggercompatindex`, `triggercompwithname`, `selectcompatindex`,
  `selectcompwithname`. `/vezer/rotatehue` turns all colour outputs.
  `/vezer/loadproject <path>` loads a project and discards unsaved changes.
- **Feedback** to a chosen OSC output: each composition's playhead (0-1 and as
  time text), `pausedbycue` with the cue name, button states, and the current
  composition's name.
- **Queries** with replies: composition info by name, index or current (name
  and length in seconds), number of compositions, number of cues, a cue's name
  or its time in frames.

## 11. DMX and Art-Net

Sources: `/general/preferences-art-net`, `/tracks/art-net-value-track`,
`/tools/*`, `/general/preferences-global-behaviours`, product page.

Vezér sends Art-DMX by broadcast to named virtual outputs (up to 256: 16
subnets of 16 universes), which can be made automatically from discovered
nodes. Tools: **DMX Soft Patching** (source universe and channel to
destination, filled automatically from channels in use), **DMX Output
Monitor**, **DIP Switch Calculator**, and an **Art-Net Color Master Fader** that
scales every colour track. "DMX Blackout on Mute" sends zero when a track is
muted; "on Solo" when another composition is triggered. Incoming Art-Net can
be recorded (1.4.1). sACN is not mentioned.

## 12. Running a show

Sources: `/general/preferences-global-behaviours`,
`/tutorials/open-project-on-system-startup`, `/general/outputs-of-vezer`,
`/general/search-and-replace`, `/tracks/sorting-tracks`.

- Preferences decide how a composition puts devices in a known state: send the
  first keyframe on start, send the last keyframe before the playhead after a
  jump or a mid-way start, resend on unmute, process while scrubbing. Together
  these are a simple "chase": after any jump, every lane pushes its value.
- Rewind on stop, playhead following, recording stops at loop end.
- For installations: add the project file to macOS login items, turn on
  "Disable confirm on Quit", and decide with "Ignore Play buttons on loading"
  whether a project saved while playing starts playing.
- Choosing a MIDI output disables the matching input automatically, to stop a
  loop.
- Project-wide retargeting: Search and Replace on Art-Net channels and track
  names, track sorting by name, type, Art-Net channel, MIDI channel or OSC
  address, and the DMX soft patch.

## 13. Files, import and export

Sources: `/import-export/*`, `/tracks/audio-track`.

- Standard MIDI files import (SMF 0 and 1; notes without length, CCs, track
  names and channels; other data ignored) and MIDI tracks export as SMF 1 at
  120 BPM within each composition's working range.
- JSON keyframes import onto a selected track: an array under `keyframes`, each
  with `time` (timecode text or frame number), and `value`, `ColorValue` or
  `flagAddress`; only `linear` interpolation.
- ASE colour swatches import as a colour track.
- Render to XML writes compositions, tracks, keyframes and processed values.
- Audio files beside the project or in a `files` folder are stored relatively.

## Not documented

The brief asked about these; the help pages say nothing:

- **Scripting.** No JavaScript or any other language. The product page sets
  "keyframes, curves, markers, and track lanes" against "hidden scripts".
- **LTC.** Only MIDI timecode is described.
- **Output scaling beyond min/max.** No per-track curve, offset or unit
  conversion on output, other than the 0-1 normalised-float option.
- **Order of sending** within a frame, threads, and performance.
- **Undo**, other than one changelog fix.
- The product page mentions MIDI program changes, OSC strings and composition
  import between projects; no help page describes them.

---

## Where Max is ahead

Each point is checked against Max's own docs or registry, as noted.

- **It computes.** A Max patch transforms, combines and reacts to input
  (`max_system_model.json` dimension 1). Vezér only plays back what was drawn
  or recorded; an incoming message can trigger a composition or be recorded,
  but cannot be processed into an output.
- **Message-level order.** Depth-first order and `trigger` (`max_system_model.json`
  dimension 2); Vezér's docs say nothing about order within a frame.
- **Scripting and extension.** `v8`, `node.script`, gen and the SDK
  (dimensions 13 and 19). Vezér has none.
- **Reuse.** Abstractions with arguments and `poly~` replication (dimension
  8). Vezér reuses by duplicating and renaming.
- **Sub-frame timing.** Max's scheduler works in milliseconds and the audio
  clock in samples (dimension 3). Vezér's tracks are sampled at the
  composition frame rate, at most 125 fps.
- **Platforms and deployment.** Max runs on macOS and Windows and builds
  standalones (dimension 18); Vezér is a macOS app only.
- **Curve shapes.** `function` has a per-segment curve factor and `curve~`
  exponential ramps (refpages), and the `ease` package and `butter_ease.js`
  name more families (back, bounce, elastic, exponential) than Vezér's menu
  shows.
