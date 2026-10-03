# Isadora Documentation Crawl — Session Log

A scan of the official documentation for **Isadora** (TroikaTronix), a
scene-based media server for live performance. The aim is to learn how the tool
works and to list what it does that Max lacks or does less well.

Companion files in this folder:

- `enumerate_isadora.py` — lists the documentation into the state file.
- `isadora_crawl_state.json` — one entry per page or manual section, with
  status and notes.
- `isadora_insights.md` — how Isadora works, by topic, for a Max reader.
- `isadora_max_gap_candidates.json` — 89 items, each with the Max-side check
  that was run: 41 gap candidates from session 1, and 48 shared-concept
  comparisons from session 2.

Same pattern as `scans/userguide/` and `scans/cookbook/`.

## Sources

All four were verified by fetching on 2026-10-02.

| Source | Where | What it is |
|---|---|---|
| Manual | <https://troikatronix.com/files/isadora-manual.pdf> | *Isadora Manual v4.0*, October 2024, 887 pages, 69 MB. Linked from <https://troikatronix.com/get-it/>. Its title metadata calls it a "rough version". Holds the reference chapters, an Actors Reference (340 actors) and a Controls Reference (21 controls). |
| Knowledge base | <https://support.troikatronix.com/support/solutions> | A Freshdesk portal: 227 articles in 27 folders. Tutorials, how-tos, release notes, licensing. |
| Product pages | <https://troikatronix.com/isadora/> and `/izzycast/` | 21 marketing pages, one per feature area. |
| Add-ons | <https://troikatronix.com/add-ons/> | 148 pages, one per downloadable plugin, user actor or example file. |

Not used: the community forum (<https://community.troikatronix.com>), which is
user discussion, not documentation.

## Inventory (2026-10-02)

995 entries in the state file. The table below is the state after session 1;
the counts after session 2 are in that session's entry.

| Group | Entries | Extracted | Partly read | Description only | Fetched, not read | Not fetched | Skipped |
|---|---|---|---|---|---|---|---|
| Manual sections | 599 | 205 | 16 | 315 | 0 | 63 | 0 |
| Knowledge base | 227 | 7 | 9 | 0 | 100 | 58 | 53 |
| Product pages | 21 | 10 | 0 | 0 | 11 | 0 | 0 |
| Add-ons | 148 | 0 | 0 | 0 | 0 | 148 | 0 |

What the columns mean, since the state file has only three statuses:

- **Extracted** — fetched and read to the end this session. Status `extracted`.
- **Partly read** — status `pending`; the note gives how many characters were
  read out of how many.
- **Description only** — status `pending`. For an actor, the opening
  description was read and the list of input and output properties was not.
  For a control, the first 650 characters.
- **Fetched, not read** — status `pending`; the text sits in the session's
  scratch folder, which is not kept.
- **Skipped** — status `skipped`. The 53 licensing and purchasing articles,
  judged from their titles to hold no feature content. They were not fetched.

## How the enumerator works

`python3 scans/isadora/enumerate_isadora.py` reads the knowledge-base index and
every folder page (folders are paginated), then the two WordPress sitemaps for
product pages and add-ons. It uses only the standard library.

The manual is too large to download on every run, and the PDF has **no
outline**. Passing a local copy with `--manual-pdf` adds one entry per line of
its printed table of contents (pages 2–13). That step needs `pypdf`, which was
installed in a scratch virtualenv, not in the repo. Without `pypdf` the script
says so and leaves the manual entries alone.

Re-running merges: status, session and notes already in the state file are
kept. If any index fetch fails or yields nothing, the script exits non-zero and
does not write the file. Both behaviours were tested this session, the failure
case against an unreachable host using a scratch copy of the script.

Manual keys look like `manual#p0386-activate-scene`: the printed page number,
then the heading.

## Session 1 — 2026-10-02 (Opus)

### Read in full

- **Manual p.14–25** — overview, interface tour.
- **Manual p.135–224** — the Isadora Reference chapter: media, the Scene List,
  cue numbering, Go Triggers, fade times, editing actors and links, value
  scaling, User Actors and Macros, Snapshots, Control Panels, preferences,
  run-only files, the Status Window, Cue Sheets, Pause Engine, Blind Mode.
- **Manual p.225–258** — Stage Setup, edge blending, the Projector actor,
  recording the output, multi-channel sound, Core Audio.
- **Manual p.277–324** — IzzyMap reference, live input, capture to disk,
  timecode, MIDI, OSC, HID, serial, the input parsing and output formatting
  languages.
- **27 actor entries**, among them Activate Scene, Jump, Jump++, Jump to Cue,
  Preload Scene, Envelope Generator++, Timed Trigger, Time of Day, Matrix Value
  Receive, Movie Player, Sound Player, MTC Compare, MTC Movie Locker, Send MIDI
  Show Control, MIDI Show Control Watcher, Send PJLink, Net Broadcaster, Open
  Isadora File, Javascript, GLSL Shader, Blacktrax Watcher, Get Global Values.
- **7 knowledge-base articles** — Activate Scene how-to, Global Value actors,
  Matrix Value routing, triggering cues from QLab, the initialize feature, port
  shapes and fills, IzzyCast FAQ.
- **10 product pages** under `/isadora/`.

### Read in part

- The opening description of every other actor (294 entries) and the first 650
  characters of every control (21 entries). This is enough to say what each
  one is for, and not enough to cite its properties.
- 16 long actor entries: Pythoner, OpenNI Tracker, Eyes++, Data Array, Stage
  Background, Capture Stage to Movie, VISCA PTZ Controller, IzzyCast Create
  Session, NDI Watcher, Skeleton Decoder, Matrix Color Send, OSC Address
  Listener, ArtNet Send, Syphon Stage Output, Text Draw, Projector.
- 9 knowledge-base articles: Javascript, preloading, image recognition, LED
  strips over Art-Net, multiple displays, the GLSL tutorial, multi-channel
  audio, global User Actor syncing, and the Isadora 4 release notes (the
  opening 7,000 of 145,000 characters, plus a scan of lines beginning "NEW").

### Not read

- Manual p.26–134: installing, activation, display set-up, eleven tutorials.
- Manual p.259–276: the two IzzyMap tutorials.
- Manual p.325–335: troubleshooting and support policy.
- 100 knowledge-base articles that were fetched: the rest of the How To,
  scripting, Guru Session and performance folders, older release notes.
- 58 knowledge-base articles not fetched: troubleshooting, the nine
  "Understanding IzzyCast" articles, legacy Isadora 2 material.
- The 11 `/izzycast/` product pages (fetched, not read).
- All 148 add-on pages.

### Max-side checks

Each candidate in `isadora_max_gap_candidates.json` records what was searched.
The sources were Max's object registry (`interfaces/obj-qlookup.json`, 1,323
names), the refpages of about 40 objects (digest, description, attribute and
message names), the userguide topic list and six topics, the bundled packages
folder, and `packages/query_packages.py search` for about 35 terms.

Two limits on those checks. Externals that exist for Max but are not installed
on this machine (Art-Net, NDI, Kinect, Python hosts) could not be verified, so
several "absent" entries mean "absent from this install". And `max-mxj` network
classes were found by file name only.

## Fetch problems and caveats

- **The manual is 69 MB and slow.** The first download ran past the 120-second
  limit and was moved to the background; a retry started a second writer on the
  same file. Both were stopped and the file was downloaded again cleanly. It
  was kept in scratch, not in the repo.
- **No PDF outline.** Sections were enumerated from the printed table of
  contents instead.
- **Text only.** The manual was read as text extracted by `pypdf`. Screenshots,
  diagrams and icons were not seen, and seven pages yielded under 50
  characters. `pypdf` printed eleven "wrong pointing object" warnings; no page
  failed to extract.
- **Three actor entries were not located** in the extracted text: the
  deprecated `Syphon to Image, Classic`, `Syphon to Texture, Classic` and
  `Syphon To Video, Classic`. Their text runs on from the previous entry.
- **The manual trails the software.** It is v4.0; the release notes run to
  4.5 and list VST3 support, a cross-platform audio type and about a dozen
  audio actors that the manual does not contain. Those were seen as headings
  only.
- **Sources disagree on Stage limits.** A knowledge-base article says 16
  Stages; the product page says 16 displays and up to 48 Stages.
- **`Get Stage Image`** is named on a product page and in the manual's
  `3D Renderer` entry, but has no entry of its own in the Actors Reference.
- **The knowledge base has no sitemap** (`/sitemap.xml` returns 404), so it is
  enumerated by walking its folder pages.
- Many knowledge-base pages are a video with a short text stub. The 17
  "Isadora 101" tutorials and most Guru Sessions are like this, and their
  content cannot be read as text.

## Next session — read these first

1. **Isadora 4 release notes, in full**
   (<https://support.troikatronix.com/support/solutions/articles/13000106556-isadora-4-release-notes>).
   It is the only written source for everything after v4.0: VST3, the audio
   data type, `Audio to Text`, and items headed "Joystick" and "Color Picker"
   whose nature was not read.
   Several candidates rest on headings from it.
2. **The nine "Understanding IzzyCast" articles** and the `/izzycast/` product
   pages, to turn the IzzyCast candidate from a description into a mechanism.
3. **Property lists of the show-control actors** read only by description:
   `Activate Scene Amount`, `Deactivate Scene`, `Matrix Value Send`,
   `ArtNet Receive`, `Edge Blend Mask`, `Global Edge Blend Mask`,
   `Timecode Comparator`, `Timecode Calculator`, `MTC Reader`,
   `Capture Camera to Movie`, `Show-Hide Control`, `Set Control Focus`.
4. **The Controls Reference** (manual p.829–887), in full. `Bin Picker`,
   `Scene Select`, `Next Cue` and `Stage Preview` matter most.
5. **The IzzyMap tutorials** (manual p.259–276) and the two IzzyMap
   knowledge-base articles, for how parameters are published as inputs.
6. **The knowledge-base scripting folder**: the rest of the GLSL tutorial (the
   comment convention that turns uniforms into inputs), loading external data
   with Javascript, the skeleton-tracking article, the PJLink article.
7. **Add-ons.** Start from the list of titles; many are user actors that show
   what the community had to build for itself.

On the Max side, the later pass should open `net.maxhole.maxhelp` in
`max-mxj`, read the `debugging_and_probing` and `non_realtime` userguide
topics, and check whether `jit.gl.meshwarp` can load an external mesh file.

## Session 2 — 2026-10-02 (Opus)

A second pass with a different question. Session 1 listed what Max lacks. This
pass looked at what both tools have, and asked where Isadora's way is better,
simpler or different enough that a Max patcher should know.

No new downloads. The pass read the manual text that session 1 had extracted
into the scratch folder, and knowledge-base articles session 1 had fetched and
not read.

### Read in full

- **217 more actor entries** of the Actors Reference (description and property
  list), plus a re-read of four that session 1 had already read (Movie Player,
  Sound Player, Projector, Text Draw). These cover the logic, maths, timing,
  generator, text, routing, MIDI, OSC, keyboard, mouse, user-actor, movie,
  sound, capture, compositing, drawing and 3D-player actors.
- **All 21 entries of the Controls Reference**, Manual p.829–887.
- **Manual p.115–119**, Tutorial 8: property types, triggers, value scaling,
  Init.
- **Manual p.325–330**: Optimizing for Speed and Resetting the Preferences.
- **10 knowledge-base articles**: the Gate, Selector and Router `exec src`
  article; the v2.0 actor processing mode; JSON Parser and Bundler; grouping
  JSON with Javascript; mixed format media warning; Optimizing for Speed;
  moving a show to another computer; moving between macOS and Windows; virtual
  MIDI ports; slow performance from third-party software.

### Read in part

- Manual p.108–114, the end of Tutorial 7. The entry stays `pending`.
- Manual p.331, the first page of Installing Multiple Versions. Stays `pending`.

### Still not read

About 90 actor entries keep their session 1 status: the five IzzyCast actors,
Arduino Firmata, OpenNI Tracker, the Skeleton actors, Rokoko, Leap Motion,
Pythoner, VISCA, RTMP Streamer, NDI Watcher, the 3D particle, rope, mosaic,
line, quad-distort and mesh actors, the Eyes and Blob actors, the edge-blend
actors, the Syphon and Spout actors, the LanBox, Art-Net, Matrix, serial and
TCP actors, the two Capture-to-disk actors, and every actor marked Deprecated
or Classic. Session 1 read some of these in full; the state file says which.

### Counts after session 2

| Group | Entries | Extracted | Pending | Skipped |
|---|---|---|---|---|
| Manual sections | 599 | 450 | 149 | 0 |
| Knowledge base | 227 | 17 | 157 | 53 |
| Product pages | 21 | 10 | 11 | 0 |
| Add-ons | 148 | 0 | 148 | 0 |
| **Total** | 995 | 477 | 465 | 53 |

257 state entries changed: 255 newly `extracted`, and two notes updated on
entries that stay `pending`.

### What was written

- `isadora_max_gap_candidates.json`: 48 items appended, 41 to 89. The first 41
  are unchanged. By status: 34 `different-approach`, 14 `better-elsewhere`. By
  confidence: 32 high, 15 medium, 1 low. Each has an `advice` field for a Max
  patcher, which the first 41 do not have.
- `isadora_insights.md`: a new section 10, "Shared concepts, different
  approaches", with a "Where Max is ahead" subsection.

### Main findings

1. Isadora's small logic actors bundle the edge detection Max leaves to a
   second object: comparisons with true/false triggers, a threshold with a dead
   band, a change filter with a tolerance.
2. A Selector re-sends the chosen input's value when the selection changes.
   Max's `switch` stores nothing.
3. Isadora evaluates by pulling from the end of a chain, so a closed Gate can
   stop everything upstream. Max pushes, so the gate has to go at the top.
4. Init values on inputs execute and propagate. A Max creation argument does
   not.
5. A sub-patch can switch itself off, and its ports declare type, range and
   help text.
6. Several message-rate generators have no single Max object: an LFO, a
   fixed-rate seek, a pausable stopwatch, a tap tempo.
7. The Controls follow the value they control, and menus can fill themselves
   from the target's options. Max's `attrui` already does both for real
   attributes.
8. Max is ahead on maths, structured data, lists, blend modes, 3D, audio
   routing and debugging.

### Max-side checks in this pass

Refpages opened for about 95 objects, read through a small script that prints
the digest, description, arguments, messages and attributes. Also read: the GL
group and matrix-operator group pages, Max's `transform-defaults.json` for
`jit.gl.layer` and `jit.gl.videoplane`, the userguide pages on subpatchers,
patcher lifecycle, mapping, strings and debugging, the installed `ease`
package's refpage, and package-library entries for about 15 objects.

Limits of those checks:

- The userguide pages are compiled; they were read as extracted string
  fragments, so wording was seen and layout was not.
- `delay`'s refpage and help file do not say what a second bang does while one
  is pending. The candidate that depends on it says so.
- `jit.gl.textureset` has a refpage but is not in the core object registry.
  Whether it loads was not confirmed.
- A search of every refpage for "premult" found nothing. The advice on
  premultiplied sources is worked out from the blend-factor table, not tested.
- Nothing was run in Max.

### Problems

- The Actors Reference text has copy errors that had to be read around: several
  entries carry mislabelled or borrowed property descriptions (Lines, Matte++,
  Colorizer, 3D Stage Orientation).
- Property lists are flattened by text extraction, so input and output names
  run into their descriptions.

### Next session — changes to the list above

Items 4 (Controls Reference) and part of 3 (`Deactivate Scene`, `Show-Hide
Control`, `Set Control Focus`) are done. Still open from item 3:
`Activate Scene Amount`, `Matrix Value Send`, `ArtNet Receive`, the edge-blend
actors, the timecode actors, `Capture Camera to Movie`. Items 1, 2, 5, 6 and 7
are untouched.

For the shared-concepts question, the remaining sources are the knowledge-base
tutorials on Control Panels and User Actors (mostly video stubs), Tutorials 9
to 11 in the manual, and the add-on pages, which show what users built because
the core actors did not cover it.

## Session 3 (system model) — 2026-10-02 (Opus)

Goal: describe how Isadora works as a system, against the 20 dimensions in
`scans/max-gaps/SYSTEM_DIMENSIONS.md`, for the side-by-side comparison with
Max. Output: `isadora_system_model.json`, 23 items (the 20 dimensions plus
three added ones).

### How the sources were read

The manual was downloaded again into the session's scratch folder (69 MB,
887 pages, not kept) and every page was extracted to text with `pypdf` in a
scratch virtualenv. The PDF page index equals the printed page number. Twelve
knowledge-base articles were fetched and converted to text.

### Read in full this session

- **Manual p.14–25** (overview, interface tour), re-read.
- **Manual p.76–134**: Tutorials 7 (Scenes), 8, 9, 10 (User Actors), 11
  (Projector), and Online Resources. p.76–107 and p.120–134 were new.
- **Manual p.135–224**, re-read for system-level material: media, Scene List,
  links and value scaling, mutable ports, User Actors and Macros, Snapshots,
  Control Panels, preferences (frame rate and service tasks, after-load
  behaviour, default resolution, GPU sharing), run-only files, Status
  Window, Cue Sheets, Pause Engine, Blind Mode.
- **Manual p.228–231** (Stage list, Virtual Stages, Stage settings, external
  outputs), **p.244–245** (Render Speed), **p.325–328** (Optimizing for Speed).
- **Actor entries**: Activate Scene, Broadcaster, Listener, Enter Scene
  Trigger/Value, Gate, GLSL Shader, Go Forward/Backward, Javascript, Net
  Broadcaster, Projector (to p.653), Scene Intensity, User Actor On/Off, and
  the vid-gpu / vid-cpu / vid-ci converter entries (p.438, p.453, p.515).
- **KB articles in full**: v2.0 actor processing mode, exec src, Global
  Values, Getting Started with Javascript, GLSL Shader tutorial, Preloading,
  Keeping Global User Actors in Sync, Arranging Multiple Stages, Missing
  Plugins, Login Items.

### Read in part

- Pythoner entry: p.657–661 of p.657–675.
- KB *Working with Multiple Displays*: all but about 3,000 characters of macOS
  setup steps.
- KB *Isadora 4 Release Notes*: the 4.5 VST and audio-type sections, the
  Control Panel and Pythoner sections, and a keyword scan of the rest.

### What the model found

The five choices that shape Isadora work most:

1. **Scenes are the unit of structure, and the host switches them.** An
   inactive Scene does nothing. Secondary Scenes run alongside. Crossfades
   between Scenes are a host service.
2. **Evaluation pulls from the ends of chains.** A closed gated Gate stops
   everything upstream. Where several links meet one input, screen position
   (top to bottom) decides order.
3. **Inputs hold values, and values persist.** Every value is saved and
   remembered across Scene exits. Init values run through the patch on each
   entry. Snapshots store a whole Scene.
4. **Every link scales and converts.** Output limits map onto input scale
   ranges by default, and types are checked when the link is drawn.
5. **Interface and media sit beside the patch, reached by number.** Control
   Panels link to inputs by Control ID; media, Stages and Scenes are numbered
   lists.

Dimensions added: 21 *Link scaling and conversion*, 22 *Activation
lifecycle*, 23 *Transitions between parts*.

### Gaps that remain

- Whether the pull algorithm runs every cycle or only on change.
- Fan-out order from one output.
- Threads, and how 4.5 audio is clocked against the frame clock.
- Any scripting API that edits the patch; a C++ SDK; a runtime-only player;
  media collection or relinking beyond replacing one reference.
