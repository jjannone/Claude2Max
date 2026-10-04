# QLab Clone Inventory: Audio and Video Cues

Input for a later task: deciding whether a QLab-style player for **sound and
video** can be built in Max as Butter tools. This file lists each feature that
Audio cues and Video cues need, how the QLab 5 manual says it behaves, and the
nearest Max objects. It does **not** give a verdict on feasibility.

Sources: the QLab 5 manual at `https://qlab.app/docs/v5/` (updated for 5.6.3),
read on 2026-10-03; paths below are after `/docs/v5`. Max side: every object
named was checked against Max's registry (`obj-qlookup.json`, core plus
bundled packages) or the init mapping files, and its refpage was read; the
refpage fact relied on is quoted or summarised. "none found" means the
registry, the refpages and `packages/query_packages.py` turned up nothing.

**Kind** column:

- **Plain patching**: ordinary Max objects wired together do it; no new tool.
- **New Butter object**: needs a new script, UI or abstraction (named in
  Butter's style where obvious), built on Max objects for any timing.
- **Max cannot** (with the reason): no route found in Max as installed.
- **Mixed**: part of each; the row says which part.

Reminder for the evaluation: JavaScript (`v8`, `v8ui`) runs on Max's
low-priority thread (userguide *Scheduler and Priority*: UI events are
low-priority; timing objects such as `metro`, `delay`, `pipe` are
high-priority), so any timing below must come from real Max objects or signals.

**Corrections after review (2026-10-03).** Two limits in the tables below turned out
not to be limits once the refpages were read: `sfplay~` has a "bang when done
playing" outlet (so auto-follow has an end report for audio), and `jit.movie~`
(bundled VIDDLL package) sends a movie's audio track into MSP (so audio in
video can be routed). The verdict is in Butter_tools'
`docs/QLAB_CLONE_EVALUATION.md`.

---

## 1. The cue list, GO and the playhead

| Feature | Exact behaviour in the docs | Source | Nearest Max (checked) | Kind |
|---|---|---|---|---|
| Cue list | Linear list, top to bottom; any number per workspace; deleting a list deletes its cues (undoable). Each list has its own playhead. Only the *active* list responds to GO, keyboard playhead keys, and workspace MIDI/OSC playback controls; triggers work in every list. | `/fundamentals/cue-lists/` | `qlist` (stores timed or untimed message lines; `next`), `coll`, `butter_table` (Butter, sortable table) | New Butter object (list UI and state) |
| GO | Starts the cue standing by, then moves the playhead to the next cue *or cue sequence*. Default key space. Green border = a GO would do something. | `/fundamentals/workspace/` | `key`, `button` | Plain patching once a list exists |
| Playhead | Light triangle at the left edge; clicking a cue's status column moves it there. "Lock playhead to selection" (workspace setting) moves both together. | `/fundamentals/workspace/`, `/fundamentals/workspace-settings/` | none found | New Butter object |
| Standby display and notes | Shows "number • name" of the standing-by cue; the Notes field shows that cue's notes (styled text, emoji, images), editable there or in the inspector. | `/fundamentals/workspace/` | `comment`, `textedit` | Plain patching (display), part of the list object |
| Cue numbers | Text, may be empty, unique in the workspace; "1", "1.0", "1.00" differ; reordering never renumbers; renumber tool (start, increment, prefix, suffix) skips numbers already used. Auto-number new cues by an increment, inserting 2.5 between 2 and 3. OSC-safe: ASCII, no space or `# * , / ? [ ] { }`. | `/fundamentals/inspector/`, `/fundamentals/workspace/`, `/tools/tools-menu/`, `/fundamentals/workspace-settings/` | `coll`/`dict` keys | Plain patching (data), list object |
| Cue names | Free text, need not be unique; default names (Audio/Video: file name; Fade: "fade " + target name, "fade and stop …" if stopping); a default name follows a renamed target; deleting a name restores the default. | `/fundamentals/inspector/` | none needed | List object |
| Move playhead | Up/down by cue or by sequence; GoTo cues set it; OSC `/playhead/{n}`, `/playhead/next`, `/previous`, `/nextSequence`, `/previousSequence`, `/none`. | `/scripting/osc-dictionary-v5/`, `/other-cues/goto-cues/` | none found | List object |
| Start vs GO vs trigger vs preview | GO: plays the sequence, moves the playhead. Hotkey/MIDI/timecode/wall-clock trigger: plays the sequence, playhead stays. Preview: plays only that cue, **skips pre-wait**, ignores continues, playhead stays. Start cue / OSC start: starts without moving the playhead. | `/fundamentals/cue-sequences/`, `/tools/auditioning-cues/`, `/other-cues/transport-cues/` | none found | List object (policy) |
| Carts | Grid 1×1 to 15×15, no playhead, cues fired in any order; no auto-continue/auto-follow and no Groups in carts; starting a cart *loads* all its cues. | `/fundamentals/cue-carts/` | `matrixctrl` (grid of cells, refpage) for the grid UI | Optional; New Butter object |
| Multiple windows | Any list or cart can open in a secondary window (no toolbar or inspector); in Show mode they say SHOW MODE. | `/fundamentals/workspace/` | `pcontrol`, patcher tabs | Plain patching |
| Active Cues sidebar | Every playing or paused cue with elapsed/remaining time, pause/resume and panic per row, a progress bar that can be dragged to scrub. Newest at the bottom by default. | `/fundamentals/workspace/` | none found | New Butter object (UI) |

Unclear in the docs: what happens if GO arrives while the cue standing by is
still loading; whether the playhead skips disarmed-and-skipped cues when
moving (implied by "as though it does not exist", `/fundamentals/inspector/`).

## 2. Timing: waits, durations, continue modes

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Pre-wait | Delay before the cue's action starts. In carts (QLab 5) too. Timeline group: drag in the Timeline tab sets it. | `/fundamentals/inspector/`, `/general/new-in-qlab-5/` | `delay`, `pipe` (high-priority timing) | Plain patching inside a cue player |
| Duration | Time to complete, excluding waits; editable only for some types (Wait, Fade, still-image Video with a template default in 5.6, Mic/Camera if finite); instantaneous cues show none. | `/fundamentals/inspector/`, `/general/change-log/` | — | Cue model |
| Post-wait | Only matters with auto-continue; starts counting when the cue starts. Auto-follow shows post-wait = duration, not editable. | `/fundamentals/inspector/` | `delay` | Plain patching |
| Auto-continue | Starting this cue starts the next after the post-wait (0 by default, so together). | `/fundamentals/cue-sequences/` | `delay` → next start | List object + plain patching |
| Auto-follow | Next cue starts when this cue *completes*; follows the actual length (if the cue is lengthened, the next waits longer). | `/fundamentals/cue-sequences/` | Needs a "done" report: `jit.movie` `loopreport`/end; `sfplay~` (end report not checked here); `groove~` none in refpage | Mixed: list object + a reliable end-of-media report per player |
| Time entry and display | Seconds, m:s or h:m:s, decimals to 0.001; shown to 0.01/0.1 s because many timers cost performance. | `/fundamentals/inspector/` | `translate` (converts Max time formats, refpage) | List object |
| Wait cue | Only elapses; post-wait auto = duration; used in sequences or as a timer. | `/other-cues/wait-cues/` | `delay` | Plain patching |
| Sync of starts | Cues started by one action start "simultaneously"; cues on the same audio output patch stay sample-locked; waits use the **system clock**, so a pre-wait start is not sample-aligned. | `/audio/introduction-to-audio/` | MSP: all signal objects share one audio clock; `sfplay~`/`groove~` started by the same scheduler event in the same vector start together. Sample-accurate starts need Overdrive + Scheduler in Audio Interrupt (userguide *Sample Accurate Messages*) | Plain patching, with scheduler settings |

Unclear: whether "simultaneous" start of many heavy cues waits for the slowest
to load (the Load page says QLab waits until every cue in a sequence is ready,
`/other-cues/transport-cues/`, which implies GO latency grows).

## 3. Group cues

| Mode | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Timeline (default in QLab 5) | All children start together; placement by pre-wait; order irrelevant; children may **not** auto-continue/follow (group breaks). Timeline tab: drag (snaps to other cues' edges, slices and the yellow playback line; ⌘ disables), nudge ±0.1/±0.01 s, trim start/end, slip (Audio/Video without slices), pin lanes, zoom. | `/fundamentals/group-cues/` | `delay` per child; no timeline editor (`mtr` records message tracks only) | Mixed: timing is plain patching; the Timeline editor is a New Butter object (overlaps planned `butter_score`) |
| Playlist | One child at a time, each forced to auto-continue with post-wait = duration. Auto-shuffle (re-ordered at each load or start; italic; not saved). Loop until stopped (needs ≥1 child with non-zero duration). Crossfade of **main audio level and opacity only**, separate fade-out/fade-in curves (custom or linear, editable points); a child shorter than the crossfade breaks. Second trigger: plays next / plays previous (with crossfade and wrap). | `/fundamentals/group-cues/` | `playlist~`, `jit.playlist` (refpages: `next`, `loop`, `int` to play a clip; **no crossfade or shuffle attribute listed**); `urn` for shuffles | Mixed: two alternating players with a crossfade (plain patching) wrapped as a New Butter object |
| Start First And Enter | Starts first child; playhead moves to the next child; acts as a folder. | `/fundamentals/group-cues/` | — | List object |
| Start First | Starts first child; playhead moves past the group; the rest run only through continues, independently of GO. | `/fundamentals/group-cues/` | — | List object |
| Start Random | Starts a random child that is armed and not playing; every armed child once before repeats; memory resets when the workspace opens. | `/fundamentals/group-cues/` | `urn` (refpage: random without duplicates, bang on exhaustion) | Plain patching + list object |
| Nesting | Groups contain any cue type including Groups; collapse/expand all with `<` `>`. | `/fundamentals/group-cues/` | — | List object |

## 4. Audio cue playback

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| File types | Any Core Audio type; AIFF/WAV/CAF recommended; MP3 discouraged (variable decode delay makes exact timing impossible); audio track of video files usable. | `/audio/audio-cues/` | `sfplay~` (AIFF, WAVE, MP3, OGG, FLAC, M4A, CAF…), `buffer~` + `groove~` | Plain patching |
| Channels, rates | First 24 channels (2 without licence); 8–192 kHz, 8–32 bit, converted on the fly to the patch's device. | `/audio/audio-cues/` | `sfplay~` channel count by argument; `mc.` versions | Plain patching (`sfplay~` refpage `srate`; Max resamples, behaviour not checked in Max) |
| Start/end time | Default 0 and file end; set by typing, dragging markers, or ⇧I/⇧O at the playback position; batch-editable for several cues. | `/audio/audio-cues/`, `/general/new-in-qlab-5/` | `sfplay~` `seek` (start ms, optional end; **always deferred to low priority**), `preload` cue regions; `groove~` loop points | Mixed: playback is plain; waveform editor is a New Butter object or `waveform~` |
| Play count / infinite loop | Integer count or infinite. | `/audio/audio-cues/` | `sfplay~` `loop`; `groove~` loop | Plain patching (count needs a counter) |
| Slices | Markers (keyboard M); play count per slice (letter = infinite, 0 = seamless skip; ≥1 slice >0); markers ≥0.05 s apart; AIFF/WAV markers import automatically; slices drawn in Timeline groups. | `/audio/audio-cues/` | `groove~` (`setloop` one pair), `sfplay~` (`preload` numbered regions, `loopone`) | New Butter object (`butter.slices~`-style, signal-timed) |
| Devamp | Target Audio/Video cue; at end of current slice (or of cue): exit loop and continue; or also start next cue at that instant (post-wait computed live); or stop target and start next. Second trigger can devamp. | `/other-cues/devamp-cues/`, `/fundamentals/inspector/` | `edge~` on a sync signal; `jit.movie` `loopreport` → `loopnotify` | New Butter object (needs sample-accurate loop-end event for audio) |
| Rate and pitch | Rate 0.03–33; pitch follows like tape unless *Preserve pitch* (more CPU); rate fadeable by Fade cues. | `/audio/audio-cues/`, `/audio/fading-audio/` | `sfplay~` `speed`, `timestretch`, `pitchshift`; `groove~` signal rate, `timestretch` | Plain patching |
| Integrated fade envelope | Drawn on the waveform; custom (smooth) or linear; optionally locked to start/end; edits heard only after restart; arrow-key point editing. | `/audio/audio-cues/` | `function` (breakpoint editor, output to `line~`), `waveform~` (buffer viewer/editor) | Mixed: `function` + `line~`/`curve~` (plain), but drawn over the waveform = New Butter object |
| Waveform view | Sum or single channel; zoom; open in external editor. | `/audio/audio-cues/` | `waveform~` (needs a `buffer~`, so the file is loaded to RAM) | Plain patching for buffered audio; for disk streaming none found |
| Audio FX | AudioUnit effects per cue, in list order, bypassable; channel count must match the AU; must report a tail time; on cue outputs and device outputs too (output AUs not fadeable). | `/audio/audio-cues/`, `/audio/audio-output-patch-editor/` | `vst~` (hosts VST/AU plug-ins; refpage) | Plain patching |
| Tail-out status | Yellow slope while effects still sound after stop; QLab keeps the path open a little longer. | `/fundamentals/workspace/` | none found | Butter object (state) |
| Mic cues | Live input through the same matrix/effects; run until stopped; main level defaults to -inf; up to 24 inputs from a chosen first channel; input and output may be different devices (drift ≤ input buffer + output buffer + margin; 0–3 ms measured over two hours). | `/audio/mic-cues/`, `/general/new-in-qlab-5/` | `adc~`; Max uses one Input Device and one Output Device per driver (userguide *Preferences*) | Mixed: one device pair is plain; several devices at once need a macOS aggregate device; drift compensation not documented for Max |

## 5. Levels, the matrix mixer and audio output patches

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Cue matrix | Rows = file/input channels; columns = cue outputs; row 0 = output levels, column 0 = input levels, corner = main. Path level = input + crosspoint + output + main (dB add). Blank = -inf. Cue outputs not routed in the patch draw grey handles. | `/audio/introduction-to-audio/`, `/audio/audio-cues/` | `matrix~`/`mc.matrix~` (list `in out gain`, `@ramp` ms), `dbtoa`, `live.gain~` | Mixed: DSP is plain patching; the dB grid UI is a New Butter object |
| Level entry | Type or drag; dragging stops at 0 dB, typing above 0 allowed up to the max limit; unsigned numbers read as negative; option-click toggles 0/-inf (map editor). | `/audio/audio-cues/`, `/fundamentals/inspector/`, `/audio/audio-map-editor/` | `live.gain~` range -70 to +6 dB by default | Butter UI |
| Gangs | Type the same text into fields to link them; linked fields move by equal dB until one hits a limit, then catch up. | `/audio/audio-cues/` | none found | Butter UI |
| Input names | Per cue; from video channel-layout metadata if present. | `/audio/audio-cues/`, `/video/video-cues/` | — | Butter UI |
| "Routed" dog-ear | Tab marked if any input reaches any output above -inf, ignoring main. | `/audio/audio-cues/` | — | Butter UI |
| Trim | Post-fader main/output/object trims not reachable by fades, MIDI, OSC or any automation. | `/audio/audio-cues/` | `live.gain~` / `gain~` with no automation wired | Plain patching (by convention) |
| Mute / solo | On cue outputs and patch outputs. | `/general/new-in-qlab-5/` | `matrix~` gains, `mute~` (whole subpatch DSP) | Plain patching |
| Output patch | 1–128 cue outputs → patch matrix → device outputs; own main level; output names (⌥return for two lines); AUs on cue outputs (pairs grouped for stereo AUs) and device outputs; unlimited patches, several per device; "system output" option; copy/export by drag. | `/audio/audio-output-patch-editor/`, `/fundamentals/workspace-settings/`, `/general/new-in-qlab-5/` | `mc.matrix~`, `mc.dac~`, `vst~` | Mixed: one device is plain patching; **several devices at once: Max cannot** without an OS aggregate device (one Output Device per driver, userguide *Preferences*) |
| Volume limits | Max default +12 (≥ -30); min default -60 (-180 to -40) treated as silence; apply to faders, fades, AppleScript and OSC. | `/fundamentals/workspace-settings/` | `clip`/`clip~` | Plain patching |
| Patch fades and resets | Fade and Reset cues can target an output patch (or map), affecting every cue using it. | `/fundamentals/cues/`, `/audio/fading-audio/` | — | Butter object (needs the patch as a named target) |
| Object audio (5.5) | Maps, marks (levels, gravity 0.1–5, shadow 0–90°), filters (width, angle, per-output pass), cue and map objects, spread, heatmap, test object. Needs an Audio licence. | `/audio/object-audio/`, `/audio/audio-map-editor/` | `nodes` (distance weights from circles), abclib `abc.vbap~` (package library) | New Butter object (the gain law is not documented; see unclear) |

Unclear: the exact gain law of marks, gravity and shadow (only shown as
images); whether matrix level changes are ramped (QLab says Levels tab changes
"take effect live"); the slider-domain curve.

## 6. Fades and fade curves

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Fade cue model | Target: a cue, a patch or a map; default duration 5 s (template); must change ≥1 parameter or it is broken; only active parameters change. Several Fade cues on one target with different active parameters run together. | `/fundamentals/cues/`, `/audio/fading-audio/` | `line~` per parameter, `pattrstorage` | Mixed: ramps are plain; the fade-cue model (targets, active set) is a New Butter object |
| Curve shapes | S-Curve (default), Custom (smooth control points), Parametric (one *Intensity* value), Linear (sharp points, multi-step), 2D Path (not for audio levels). Rising and falling curves separate, lockable. | `/audio/fading-audio/`, `/video/fading-video/` | `curve~` (−1…1 curve parameter), `line~` (128 segment pairs), `ease` package (installed user package) | Mixed: shapes by `curve~`/`line~` lists; S-curve and parametric formulas **not documented**, so must be approximated |
| Audio domain | Slider (console fader feel), decibel (log), linear. Equal power = parametric + linear domain; equal gain = linear + linear domain. | `/audio/fading-audio/` | `dbtoa`, `atodb` | Plain patching (slider-domain curve unknown) |
| Absolute / relative | Absolute sets end values. Relative adds (audio dB, translation, rotation) or multiplies (scale, opacity). Absolute clears earlier relative changes (QLab 5). Relative raises capped by max volume limit. | `/audio/fading-audio/`, `/video/fading-video/` | none found | New Butter object |
| Stop target when done | Stops the target at the end of the fade. | `/audio/fading-audio/` | — | Plain patching |
| Set from target | Copies the target's current levels/geometry as the fade's start values (⇧⌘T, ⌃⌥⌘V). | `/audio/fading-audio/`, `/video/fading-video/` | — | Butter object |
| Revert Fade Action | Restores only what this fade changed, keeping later changes. | `/audio/fading-audio/` | none found | New Butter object |
| Live fade preview | Edits to a Fade cue act live while the target plays; per workspace since 5.4. | `/tools/tools-menu/` | — | Butter object |
| Fade AU parameters | All parameters of one AU fade as a whole from the target's state to the fade's state; "Set Audio FX from Target". | `/audio/fading-audio/` | `vst~` (parameter messages; whole-state interpolation not checked) | Unclear in Max (plug-in parameter access by message exists; interpolating a whole state needs reading all parameters) |
| Fade rate | Fade playback rate of Audio/Video cues to a target rate (0.03–33). | `/audio/fading-audio/` | `sfplay~` `speed`; `jit.movie` `rate` | Plain patching |
| 2D path fades | Objects (audio) and video translation/rotation/scale; draw, circle, flip, rotate 90°, reverse, smooth, loop (5.6), merge %, canvas width/height, alignment of origin. | `/audio/fading-audio/`, `/video/fading-video/`, `/general/change-log/` | `nodes`, `function` (1D) | New Butter object (`butter_path` idea) |
| Panic fade | Every cue fades over the panic duration, then stops; second panic = immediate stop. | `/fundamentals/workspace-settings/` | `line~` into each player's gain | Plain patching per player + a coordinator |

## 7. Video cue playback and geometry

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Codecs and containers | MPEG-1/2/4, H.263/264/265, ProRes family, Photo-JPEG, DV, Hap/Hap Alpha/Hap Q; recommended ProRes 422 Proxy, Hap, ProRes LT; alpha via ProRes 4444 or Hap Alpha, premultiplied; .mov/.mp4; stills PNG/JPG (no PSD/PDF); max 16,000 px per side. | `/video/video-cues/` | `jit.movie` (`engine` avf/qt/viddll), `jit.gl.movie` = `jit.movie @output_texture 1` (init mapping) | Plain patching (Hap support in Max's engines not checked here) |
| Hold at end | Last frame stays and the cue stays active until stopped; otherwise the cue stops at its last frame. Stills run until stopped unless given a duration. | `/video/video-cues/` | `jit.movie` `loop` (default 1); end behaviour with loop 0 not checked | Plain patching (verify in Max) |
| Clock | Follow video clock (display refresh; the heuristic picks the highest-refresh output, physical before virtual) or audio clock (patch device; may skip/repeat a frame). | `/video/video-cues/` | none found (no clock-source attribute in `jit.movie` refpage) | Max cannot choose a movie's clock source; resync by patching is the workaround |
| Fill Stage | Fit (letterbox, empty areas are transparent, not black), Fill (crop), Stretch. | `/video/video-cues/` | `jit.gl.videoplane` `preserve_aspect`; `transform_reset` (jit.group-gl) | Plain patching |
| Custom geometry | Natural pixel size; crop in pixels per side (not fadeable; use Shutter or Window effects to fade); translation in pixels from stage centre (+ up/right); scale multiplier with lockable aspect; 3D rotation as quaternions (fades take the short path, <180° per axis unless single-axis mode); anchor point. | `/video/video-cues/`, `/video/fading-video/` | `jit.gl.videoplane` with jit.group-gl `position`, `scale`, `rotatexyz`, `quat`, `anchor`; crop via `jit.movie` `srcrect` (matrix) or `jit.fx.subtexture` (a `v8` script mapped in init) | Plain patching (pixel-to-GL unit conversion needed) |
| Opacity | 0–100% (fades to whole numbers); target's own alpha kept. | `/video/video-cues/`, `/video/fading-video/` | jit.group-gl `color` alpha with `blend_enable` | Plain patching |
| Smooth | Anti-aliased vs nearest-neighbour scaling. | `/video/video-cues/` | `jit.gl.videoplane` `interp` | Plain patching |
| Layers | 1001 per stage (bottom, 1–999, top); same layer: later-started on top. | `/video/video-cues/` | jit.group-gl `layer` (default 0; same-layer order **not guaranteed**) | Mixed: assign unique layers per start (Butter logic) |
| Blend modes | 24 per-cue modes (Normal … Source Atop Compositing), against lower layers. | `/video/video-cues/`, `/video/blend-modes/`, `/scripting/parameter-reference/` | jit.group-gl `blend` (add, multiply, screen, exclusion, colorblend, alphablend, coloradd, alphaadd); Jitter Tools `co.*` shaders (overlay, softlight, hardlight, dodge, burn, difference…) for `jit.gl.slab` | Mixed: simple modes plain; the rest need per-layer shader compositing (New Butter object) |
| Video effects | Ordered stack of live effects (Color Controls … Drop Shadow), each with scripting names and ranges in the Parameter Reference; Shutter (rectangle/ellipse, feather 0–800) and Window are fadeable crops. | `/video/video-cues/`, `/scripting/parameter-reference/` | `jit.gl.slab` with Jitter Tools shaders; `jit.gl.pix` | Plain patching per effect; matching QLab's exact list is work, not a blocker |
| Rate | 0.03–33, fadeable; H.264/H.265 perform poorly when rate changes. | `/video/video-cues/`, `/video/fading-video/` | `jit.movie` `rate` | Plain patching |
| Audio in video | Levels, Objects, Trim, Audio FX tabs as Audio cues; track choice if several. | `/video/video-cues/` | `jit.movie` `vol` only (refpage); multichannel movie audio routing not found in the refpage read | Unclear/likely Max cannot route a movie's audio channels into MSP from `jit.movie` alone; separate audio file is the workaround |
| Text cues | Styled text rendered as PNG; width settable, height automatic; fonts not copied with the workspace. | `/video/text-cues/` | `jit.gl.text` | Plain patching |
| Camera cues | Webcam, Blackmagic, Syphon, NDI, with embedded Mic cue. | `/video/camera-cues/` | `jit.grab`; Syphon package `jit.gl.syphonclient` | Plain patching (NDI: none found) |

## 8. Video output: stages, regions, routes, masks, edge blends, warping

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Stage | Virtual raster up to 16384²; any frame rates mixed; black drawn only while a cue runs unless *Keep rendering between cues*; stage layer orders stages on one device, ties alphabetical. | `/video/video-output/`, `/video/introduction-to-video/` | `jit.gl.node` (render children to a sub-context, capture) | Plain patching |
| Regions | Lettered, coloured; each to one route; move/draw modes; edges snap to stage edges, centrelines and other regions; arrow keys move 1/10 px, ⌥ resizes. | `/video/video-output/` | `jit.gl.videoplane` showing part of the stage texture | Mixed (texture coords by patching; editor = New Butter object) |
| Routes | Region → route → device; route size 1–30,000 px; rotation 90° steps; rear projection mirror; scaling center/fit/stretch/fill; device missing shown in italics; guides per route. | `/video/video-output/` | `jit.world`/`jit.window` per output | Plain patching (editor UI = Butter) |
| Partial outputs | A route can use part of a device (for DualHead/TripleHead style splitters). | `/video/video-output/` | `jit.window` spanning displays | Plain patching |
| Masks | Greyscale image, black masks, white shows; scaled live if size differs (costs performance); reloaded automatically when the file changes; no built-in editor. | `/video/video-output/` | `jit.butter.alphamask` (Butter), `jit.alphablend`, `jit.gl.meshwarp` drawn masks, `filewatch` (refpage: bangs when a file is altered) | Plain patching (`filewatch` → reload the mask image) |
| Edge blending | Overlapping regions blend automatically; manual widths if *Auto edge blends* off; one blend gamma per stage; grid option to disable blends while aligning. | `/video/video-output/` | Jitter Tools `tr.edgeblend.jxs` (gradient alpha, `fade` vec4) in `jit.gl.slab` | New Butter object (automatic widths from overlap) |
| Warping | Per region; perspective (default, continuous), linear, Bézier (16 points per mesh split); mesh splits 1–32 in powers of two; linked control points across regions; reset to stage or route size. | `/video/video-output/` | `jit.gl.meshwarp` (Jitter Tools: meshdim, NURBS, JSON save), `jit.gl.cornerpin` | Mixed: per region plain; linked points across regions = Butter logic |
| Grids and guides | Alignment grid per region (white/black, exportable PNG); guides with outline, centrelines, registration marks and route name. | `/video/video-output/` | none found | New Butter object (simple drawing) |
| Syphon / NDI outputs | Virtual devices; kept alive until the workspace closes, even after panic. | `/video/video-output/` | Syphon package `jit.gl.syphonserver`; NDI none found | Plain patching (Syphon); Max cannot (NDI, no object installed) |
| Blackmagic outputs | Device modes, internal/external keying, BGRA/Y'CbCr. | `/video/video-output/` | none found | Max cannot as installed |
| Monitor windows | For each stage, input, audition and map; float and clone. | `/tools/monitor-windows/` | `jit.pwindow` (displays matrices or GL scenes in a patcher, refpage), extra `jit.window` | Plain patching |

Unclear: the edge-blend curve beyond "gamma"; how Fit leaves transparent
(not black) bars interacts with stage background.

## 9. Loading and preloading

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Load | Prepares a cue "right up to and not including" starting it; a sequence starts only when every cue in it is ready; usually unnecessary on modern Macs. | `/other-cues/transport-cues/` | `sfplay~` `open`/`preload`; `jit.movie` `asyncread` | Plain patching per player |
| Auto-load | Load this cue after the previous cue plays; workspace default option. | `/fundamentals/inspector/`, `/fundamentals/workspace-settings/` | — | List object |
| Load to time | Tool or Load cue; negative = from the end; applies through the following sequence; OSC `loadActionAt` adds the pre-wait automatically, `loadFileAt` ignores slice counts. | `/tools/tools-menu/`, `/other-cues/transport-cues/`, `/scripting/osc-dictionary-v5/` | `sfplay~` `seek` (deferred to low priority), `jit.movie` `time`/`frame` | Mixed: per player plain; sequence-wide load-to-time = list object computing each child's offset |

## 10. Workspace settings that a clone would need

General: minimum time between GOs; key-up re-arm; panic duration; cue to run
when the workspace opens (playhead unaffected; ⌃⌥ suppresses) and before it
closes; auto-number increment; auto-load default; lock playhead to selection
(`/fundamentals/workspace-settings/`). Controls: editable shortcuts (Esc and
double-Esc fixed), workspace MIDI/MSC and OSC mappings for GO etc. Audition:
per output class. Templates: default properties per cue type, workspace
templates. Audio: output patches, input patches, maps, volume limits. Video:
stages, routes, devices, input patches. File management: copy media into the
project folder, backups, rotation. Import/export of any settings section.
Max side: `pattrstorage`/`dict` for persistence (refpages), Max projects for
media. **Kind: New Butter object** (a settings store, likely inside the
planned `butter.pat`), plain patching underneath.

## 11. Show mode, panic and safety

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Show mode | Disables inspector, toolbar, toolbox, Load to Time, Find, adding/deleting/moving and editing cues; still allows quit, open/close/save, Esc, OSC/AppleScript edits, workspace settings; confirms before closing. "Safety, not security." | `/fundamentals/workspace/` | Locked patch, presentation mode (`max_system_model.json` dim 11) | Plain patching (lock + presentation) |
| OS protection in Show mode | Blocks ⌘Tab, Mission Control/Exposé, enables Dock hiding, prevents sleep and App Nap ("latency critical"). | `/general/qlab-preferences/`, `/general/preparing-your-mac/` | none found | Max cannot (no object found to block OS features); set the Mac up by hand |
| Panic / hard stop | Esc = panic over panic duration; second during fade = immediate; double-Esc = hard stop (stops effects tails too); per-cue panic (S, double = hard stop); pause/resume all `[` `]`. | `/fundamentals/workspace-settings/`, `/general/keyboard-shortcuts/` | `key`, `line~` per player | Plain patching + coordinator |
| Double-GO protection | Time window; red border; refused GOs flash; covers mouse, GO key, workspace MIDI/MSC/OSC GO, not cue triggers or AppleScript. | `/fundamentals/workspace-settings/` | `speedlim`, `onebang` | Plain patching |
| Reset | Hard stop all, clear temporary properties, playheads to top, load first cues; open cue does not rerun. | `/fundamentals/workspace/` | — | List object + settings store |
| Arm / disarm / skip | Disarmed: timing kept, no action; skip if disarmed: removed from sequence. | `/fundamentals/inspector/`, `/fundamentals/cue-sequences/` | `gate` | List object |
| Second triggers | Nothing / panic / stop / hard stop / hard stop & restart / devamp; on-release option. | `/fundamentals/inspector/` | — | Player policy (Butter) |
| Fade & stop others / duck others | Peers, list, all; duck/boost by level over time while running. | `/fundamentals/inspector/` | `line~` on other players' gains | List object + plain patching |
| Broken cues and warnings | Red X with reason (missing file, file in Trash, no patch, missing AU, invalid slice counts, licence); broken cue in a sequence still runs its timing; Warnings tab with help links. | `/audio/audio-cues/`, `/video/video-cues/`, `/tools/workspace-status-window/` | Max console; `jit.movie`/`sfplay~` print errors | New Butter object (validation and status list) |
| Audition | Per output class: unchanged / none / alternate patch / audition window; Audition GO (⌥space), Audition Preview (⌥V), Always audition; normal start interrupts an audition. | `/tools/auditioning-cues/` | `gate`, `selector~`, `send` names | New Butter object (patch-wide routing switch) |
| Overrides | Global per-protocol input/output switches (MIDI, MSC, SysEx, network ext/local, timecode, DMX out). | `/tools/override-controls/` | `gate` per input object | Plain patching + coordinator |
| Backups | Autosave copies (5–600 s after last change, at least every 10 min of continuous work; only after first manual save), pre-save backup, ≤1 per minute, rotation. | `/fundamentals/workspace-settings/`, `/general/qlab-preferences/` | none found | Max cannot automatically (no autosave object found); a script could write copies |
| Temporary vs saved | Fades, Target cues, `/live` OSC changes are temporary; never saved or marked dirty; cleared by Reset. | `/fundamentals/workspace/`, `/scripting/osc-dictionary-v5/` | `pattrstorage` (saved presets vs current values) | New Butter object (policy in the settings store) |

## 12. OSC control of all of it

| Feature | Exact behaviour | Source | Nearest Max | Kind |
|---|---|---|---|---|
| Transport | UDP and TCP on 53000 (TCP SLIP-framed); replies on 53001 or `/udpReplyPort`; plain text on UDP 53535; per-workspace ports; unprefixed messages reach every workspace on the port. | `/scripting/osc-dictionary-v5/` | `udpreceive`/`udpsend` (refpages); TCP OSC: none found in refpages read | Mixed: UDP plain patching; TCP/SLIP via `node.script` (refpage exists) |
| Access | Passcodes (4 digits) with view/edit/control; no-passcode row; growing delay after wrong passcodes; UDP clients forgotten after 61 s without keep-alive (`/forgetMeNot`, `/udpKeepAlive`). | `/fundamentals/workspace-settings/`, `/scripting/osc-dictionary-v5/` | none found | New Butter object (in JS, low priority is fine) |
| Addressing | `/cue/{number}/…`, `/cue/selected`, `/cue/playhead`, `/cue_id/{id}`, wildcards `? * [] [!] {}`; `/workspace/{id or name}/…`. | `/networking/using-osc/`, `/scripting/osc-dictionary-v5/` | `regexp` (PCRE matching, refpage); CNMAT odot `o.route` is not installed (package library) | New Butter object |
| Read/write conventions | No argument reads; argument writes; `/+ n` `/- n` increments (5.5: lists roll over; delta may be in the address); `/live` changes the running value only, no undo, less CPU; booleans accept numbers, OSC T/F and words (Yes, true, 0…). | `/scripting/osc-dictionary-v5/` | — | New Butter object |
| Replies and updates | `/reply/{address}` + JSON `{workspace_id, address, status, data}`; `/alwaysReply`; `/replyFormat` templates; `/updates 1` pushes `/update/workspace/{id}/cue_id/{id}` and playback-position changes. | `/scripting/osc-dictionary-v5/` | `dict` for JSON | New Butter object |
| Workspace methods | `/go [n]` (string argument), `/auditionGo`, `/panic`, `/panicInTime t`, `/pause`, `/resume`, `/stop`, `/hardStop`, `/reset`, `/playhead/…`, `/select/…`, `/new type`, `/move`, `/delete`, `/renumber`, `/save`, `/showMode`, `/doubleGoWindowRemaining`, `/thump`. | `/scripting/osc-dictionary-v5/` | — | New Butter object |
| Cue methods (A/V relevant) | start, stop, pause, resume, togglePause, load, loadAt, loadActionAt, preview, panic, hardStop, reset; preWait, postWait, duration, tempDuration, continueMode, armed, flagged, notes, name, number, colorName; level/{row}/{col}, gang, mute, solo, liveAverageLevel/{out} {low} {high}; rate, preservePitch, startTime, endTime, playCount, infiniteLoop, sliceMarkers, addSliceMarker; opacity, translation, scale, rotation, quaternion, anchor, crop*, layer, blendMode, videoEffects, fillStage, fillStyle, holdLastFrame, stage; isRunning, isPaused, isLoaded, isBroken, actionElapsed, percentActionElapsed; valuesForKeys (JSON list of keys). | `/scripting/osc-dictionary-v5/` | — | New Butter object (mapping to player parameters) |
| Show control broadcast | `/listen`, `/ignore`, scoped forms; events go/auditionGo/cue start/cue stop/playhead with number, name, uniqueID, type; all-cue events; `/eventFormat` tokens. | `/networking/show-control-broadcast/` | `param.osc` (parameter reports only) | New Butter object |
| Queries | `#/address#` in outgoing messages, live while the sending cue runs. | `/scripting/osc-queries/` | `sprintf` | Plain patching (in Max, ordinary patching replaces the need) |
| Custom incoming mapping | Workspace Settings → Controls → OSC: capture a device's message for GO, panic, etc. | `/fundamentals/workspace-settings/` | `udpreceive` + `route` | Plain patching |
| Duplicate filter | Identical OSC messages within 0.1 s (default, global preference) are discarded. | `/general/qlab-preferences/` | `speedlim`/`change` | Plain patching |

## 13. Gaps in the docs relevant to a clone

- S-Curve and Parametric curve formulas; the slider audio domain mapping.
- Object-audio gain law (gravity, shadow, filters).
- Edge-blend curve shape and how gamma applies.
- Whether matrix and level edits are ramped when made live.
- GO latency rules when a sequence contains unloaded heavy cues.
- The exact end-of-file behaviour of Video cues without Hold at end
  (stops "after it reaches its last frame"; whether the last frame is shown for
  one refresh is not stated).
- The Cue Lists page's text ends mid-sentence (On Stop / freewheel).

## 14. What a sound-and-video clone would skip

Light cues and the Light Dashboard (patch, definitions, command language,
subcontrollers, parking); Network cues and device descriptions; MIDI cues,
MIDI File cues and MSC (send and receive); Timecode cues and incoming
timecode triggers; Script cues and the AppleScript dictionary; Collaboration;
QLab Remote and Stream Deck integration; licensing tiers; NDI and Blackmagic
devices; Camera cues' NDI audio; wall clock triggers (optional, easy to add);
cue carts (optional).
