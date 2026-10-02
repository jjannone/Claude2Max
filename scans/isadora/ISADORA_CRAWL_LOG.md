# Isadora Documentation Crawl — Session Log

A scan of the official documentation for **Isadora** (TroikaTronix), a
scene-based media server for live performance. The aim is to learn how the tool
works and to list what it does that Max lacks or does less well.

Companion files in this folder:

- `enumerate_isadora.py` — lists the documentation into the state file.
- `isadora_crawl_state.json` — one entry per page or manual section, with
  status and notes.
- `isadora_insights.md` — how Isadora works, by topic, for a Max reader.
- `isadora_max_gap_candidates.json` — 41 candidate capabilities, each with the
  Max-side check that was run.

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

995 entries in the state file.

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
