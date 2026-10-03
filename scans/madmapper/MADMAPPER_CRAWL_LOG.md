# MadMapper Documentation Crawl — Session Log

A read of the official documentation for MadMapper (GarageCube / 1024
architecture), the projection, light and laser mapping program. The aim is to
learn how it works and to list what it does that Max does not, or does better.
One of four parallel scans; TouchDesigner, Isadora and cables.gl have their own
folders under `scans/`.

Companion files in this folder:

- `enumerate_madmapper.py` — lists every documentation page and keeps the state
  file. Stdlib only, runs on Python 3.9. Re-running it never changes a page's
  `status`, `session` or `notes`.
- `madmapper_crawl_state.json` — one entry per page, keyed by URL:
  `title`, `url`, `group`, `status` (`pending` / `extracted` / `skipped`),
  `session`, `notes`.
- `madmapper_insights.md` — how MadMapper works, by topic, each entry naming
  the page it came from.
- `madmapper_max_gap_candidates.json` — 82 entries. The first 49 (session 1)
  are capabilities Max lacks or only partly has. The next 33 (session 2) are
  things both programs have, done differently, each with an `advice` field for
  someone working in Max.

## The sources

| Group in the state file | What it is | Where |
|---|---|---|
| chapter names (`1.-introduction` … `glossary-of-terms`) | The manual for MadMapper 6 | `https://docs.madmapper.com/madmapper/6/` |
| `website` | Product, feature, FAQ and tutorial-index pages | `https://madmapper.com/sitemap.xml` |
| `pdf-guide` | PDF guides linked from the tutorial pages | `https://madmapper.com/files/…`, `https://download.madmapper.com/minimad/…` |
| `github-materials` | Shader-format documents the manual points to | `https://github.com/madmappersoftware/MadMapper-Materials` |

The manual is the doc root. It was found by fetching
`https://docs.madmapper.com/`, whose landing page is titled "Madmapper
Documentations" and carries the whole table of contents. `madmapper.com` has no
manual of its own; `/doc` and `/user-guide` there return 404.

There is no separate scripting or API reference. The nearest things are the OSC
address list (a manual page) and the shader-format documents on GitHub.

## Inventory (2026-10-02, after session 2)

| Group | Listed | Extracted | Pending | Skipped |
|---|---|---|---|---|
| Manual | 99 | 99 | 0 | 0 |
| Website | 29 | 17 | 0 | 12 |
| PDF guides | 23 | 22 | 0 | 1 |
| GitHub documents | 9 | 9 | 0 | 0 |
| **Total** | **160** | **147** | **0** | **13** |

After session 1 the totals were 127 extracted, 20 pending, 13 skipped.

`python3 scans/madmapper/enumerate_madmapper.py --status` prints the current
counts without touching the network.

## Sessions

### 2026-10-02 — Session 1 (Opus 5.5)

**Read**

- All 99 manual pages, as text extracted from the fetched HTML. The longest is
  the release-notes history (versions 3.7.0 to 6.1.1), which is the only place
  several modules and generators are named.
- Six website pages: features, software, the three extension pages and the
  extensions overview.
- Seventeen PDF guides: Masking, Mesh Warping, Scenes and Cues, Cue Scheduler,
  Calendar Scheduler, Modules, Weather & Pollution Modules, Realtime Reactive
  Visuals, Space Scanner Guide, Control Surface Module Guide, Stream Deck
  Plugin, MiniMad Controller, MadLaser Guide, MadLaser AVB Support,
  MadProjectorControl Guide, MadAI Cheat Sheet, MiniMad 3 User Guide.
- Five GitHub documents: README, MaterialsDoc, MadMapperSurfaceFxDoc,
  LaserMaterialsDoc, MadLaserMaterialShapeLibrary.

**Skipped, and why**

- Twelve website pages that are not documentation: legal, privacy, company,
  gallery, pricing, support contact and event pages.
- The French translation of the MiniMad guide.

**Left pending, and why**

- `madmapper.com/extensions/FAQ` — read only in part (the MadAI sections and
  the MadLaser general questions). Its MadLaser "Technical Help" and "Tips and
  Tricks" sections are unread. Two entries cite this page, both for MadAI.
- `madmapper.com/madmapper/faq`, `minimad/faq`, `minimad/product`,
  `madcompendium` — fetched, not read.
- Five tutorial index pages — fetched only to collect the PDF links. They are
  mostly lists of video tutorials.
- The site's home page — not fetched.
- PDF guides 01 (Introduction to the User Interface, 29 pages), 02 (My First
  Video Mapping), 03 (My First MiniMad Video Export), 10 (Arduino Firmata) and
  the older 24-page MiniMad guide — downloaded, not read. The manual covers the
  same subjects.
- GitHub `Libraries/MadNoise.md` and `Libraries/MadSDF.md` — fetched, not read;
  their function lists are in a manual page that was read.
  `Materials/README.md` fetched, not read. `Materials/Demos/SDF/README.md` not
  fetched.

**Not enumerated at all**

- The video tutorials on MadMapper's YouTube channel. The manual sends readers
  there often, so some behaviour is documented only on video.
- The shader source files in the GitHub repository (about 3,100 files). The
  Surface FX document says the variables available to each kind of FX are
  documented in comments inside the "Empty Template" FX, so that detail lives
  in those files.
- The GarageCube forum.

**Fetch problems**

- No page failed in the end. Three manual pages under `what's-new` first came
  back 404 because the apostrophe had been percent-encoded; the server wants it
  literal. The enumerator now leaves it alone.
- The manual's table of contents is not made of links. It is a list of
  `<li data-page-href="…">` items, so a first pass that looked for `<a href>`
  found 24 pages instead of 99. The enumerator reads both shapes and stops with
  an error if it finds none.
- The table of contents is repeated inside every page's main content. Text
  extraction cuts it off.
- One tutorial page holds a link that is an unfilled script template
  (`${DLurl}/minimad/minimad-userguide.pdf`). It is ignored; the same file is
  linked properly elsewhere.
- The PDFs were downloaded to a scratch folder and their text extracted with
  macOS PDFKit. None is saved in the repo. Pages that are mostly pictures (the
  MiniMad button maps) extract as scattered fragments.
- The enumerator's failure path was tested with a bad host and a bad repository
  name: it printed the cause, exited with code 2, and left the state file
  byte-for-byte unchanged.

**Reliability of the source**

The manual contradicts itself in about ten places (OSC port, fixture file
extension, universe count, minimum macOS, whether DXV is supported, and
others). They are tabled at the end of `madmapper_insights.md`. One page still
contains an editor's note addressed to whoever was assembling the manual, and
the appendices page describes seven appendices by title with no content behind
them. Treat the manual's exact numbers as claims to confirm in the program.

**The Max side**

Each candidate was checked against Max 9.1.5 on this machine: the object
registry (`interfaces/obj-qlookup.json`, 1,323 names), every refpage's name,
digest, description and full text, the userguide topics, and the repo's package
library through `packages/query_packages.py`. What was searched and what came
back is in each candidate's `max_check`. Objects named in `max_closest` had
their refpage or package entry read, with exceptions stated in `notes`.
Nothing was run in Max.

Result: 49 candidates — 20 absent, 25 partial, 3 unsure, 1 better-elsewhere.
The clearest gaps are whole areas, not single features: DMX and Art-Net / sACN
with fixtures that sample video, everything to do with lasers, camera-based
calibration, automatic soft-edge blending, and a keyframe timeline over
arbitrary parameters.

### 2026-10-02 — Session 2 (Opus 5.5): shared concepts, different approaches

Session 1 looked for what Max lacks. This pass looked at what both programs
have, and asked where MadMapper's way is better, simpler or just different in
a way a Max patcher should know.

**Read**

- All 20 pages session 1 left pending: 11 website pages (both FAQs in full,
  the MiniMad product and FAQ pages, the home page, five index pages, the
  MadCompendium page), 5 PDF guides (01 Introduction to the User Interface,
  02 My First Video Mapping, 03 My First MiniMad Video Export, 10 Arduino
  Firmata, the older 24-page MiniMad guide) and 4 GitHub documents (MadNoise,
  MadSDF, two short READMEs). Nothing is pending now.
- Re-read 25 manual pages on the shared ground: media bin, codecs, the control
  page and the OSC list, surfaces, outputs and loopbacks, master settings,
  audio input, scenes and cues, preferences and expert mode, project files,
  backup, performance, modules, troubleshooting, audio routing, shortcuts. Also
  PDF guides 09 (Modules) and 12 (Realtime Reactive Visuals) again.
- The five tutorial index pages are lists of video titles and PDF links. They
  are marked extracted because they were read; the videos were not watched.
- MadSDF.md was read with its pictures removed and long lines cut. The pictures
  show what each example draws.

**The Max side**

Read for this pass, in Max 9 on this machine: the refpages of jit.movie,
jit.playlist, jit.movie~, jit.world, jit.window, jit.displays, jit.gl.cornerpin,
jit.gl.videoplane, jit.gl.node, jit.gl.slab, jit.gl.shader, jit.gl.pix,
jit.gl.meshwarp, jit.gl.textureset, jit.fx.subtexture, jit.fx.delay,
jit.fx.tr.xfade, jit.mo.time, jit.mo.func, jit.grab, transport, metro,
pattrstorage, pattrhub, param.osc, udpsend, udpreceive, gamepad, key, maximum,
peakamp~, fffb~, snapshot~, slide, and the Link package's link.session,
link.beat and link.phasor~; the shared jit.gl attributes in
`jit.group-gl.maxref.xml`; and the userguide topics jitter/depth_layer_blend,
jitter/video, jitter/video_engine, OSC, mapping, projects, snapshots,
presets_and_interpolation, pattr, objects (annotations and hints) and
standalones_and_collectives. Nothing was run in Max.

**Found**

33 entries appended to `madmapper_max_gap_candidates.json` (entries 50 to 82):
27 `different-approach`, 6 `better-elsewhere`, none `unsure`. A new section 12
in `madmapper_insights.md`, with a "Where Max is ahead" list. Five more rows in
the table of things the documents disagree about.

The strongest:

- Draw order. MadMapper's list is the order. Max's `layer` defaults to 0 for
  everything and Max's own page calls the result indeterminate.
- Max has a mesh warp object, `jit.gl.meshwarp`, with masks, undo and a JSON
  save file. Session 1 said there was none.
- Max has a no-copy crop, `jit.fx.subtexture`, which gives MadMapper's
  input-rectangle-then-warp arrangement as two objects.
- Movie sound: `jit.movie` plays it past the patch; `jit.movie~` is needed to
  get it into MSP. MadMapper's manual documents the same trap in its own engine.
- `jit.world`'s `fps` does nothing on a Mac while `displaylink` is on.
- Max 9's parameter OSC addresses have `/raw` and `/normalized`, the same two
  entries MadMapper gives with a direct address and a mapped Control.
- `pattrstorage` can report whether the current preset has been edited
  (`getedited`), and can leave clients out of recall (`active`,
  `subscribemode`), which is what stops presets restarting media.
- `transport` reports its clock sources with `getclocksources`, and the Link
  package installs one. This answers part of an open question from session 1.

**A correction to session 1**

Session 1 searched the main object registry (`interfaces/obj-qlookup.json`) and
the refpage folders, and concluded there was no warp object. Objects that ship
in packages inside the Max application (`C74/packages/Jitter Tools`, `jit.mo`,
`VIDDLL`) are in neither. `jit.gl.meshwarp`, `jit.gl.textureset`, the whole
`jit.fx.*` family, `jit.mo.*` and `jit.movie~` live there. Session 1's entries
were left as written; entry 61 ("A warp grid with masks, undo and its own save
file") carries the correction. Other session 1 Max checks may have the same
blind spot and have not been re-checked.

**Problems**

- Max's userguide pages are stored as compiled page code. The text was pulled
  out with a pattern match that drops inline code words, so a few sentences
  arrived with the attribute or message name missing (the video engine names,
  the message that loads a movie into memory). Those names are not quoted in
  the entries.
- jit.movie's refpage does not say what each `loop` value means. The entry on
  playback modes says so and is marked medium.
- Which display a fullscreen Max window lands on is not in the refpages. The
  entry on fullscreen is marked medium for that reason.
- No page failed to fetch.

## What the next session should read first

Items 1, 2, 4 and 5 of session 1's list were done in session 2. What is left:

1. The "Empty Template" Surface FX and one or two factory Materials in the
   GitHub repository, for the per-surface-type shader variables the documents
   do not list.
2. If transcripts are available, the MadLaser and Timelines video tutorials.
3. Re-check session 1's 49 Max comparisons against the packages bundled inside
   the Max application (`C74/packages/*/docs`), which session 1 did not
   search.

For the Max comparison, still open: the names of the clock sources
`transport` reports (it needs Max running: send `getclocksources`); whether an
NDI, Art-Net or LTC external exists outside this machine's packages; whether
`jit.gl.nurbs` control points can be dragged in the window; what each
`jit.movie` `loop` value does; and which display a fullscreen `jit.world`
uses. Session 2 settled what `param.osc` and the OSC userguide page expose
(parameter addresses with `/raw` and `/normalized`, and OSCQuery as a
preference).

### 2026-10-03 — Session 3 (Opus 5.5): system model

Sessions 1 and 2 compared MadMapper with Max feature by feature. This pass
describes MadMapper's general approach, against the 20 dimensions in
`scans/max-gaps/SYSTEM_DIMENSIONS.md`, so it can be set beside Max and the
other tools.

**Read**

Re-read 31 manual pages, fetched fresh as text: interface overview, toolbar
and workspace, keyboard shortcuts, preferences and expert mode, project file
structure, backup and recovery, master settings, audio input and beat
detection, media bin, surfaces and the surface inspector, DMX fundamentals,
outputs, loopbacks, timeline export, MiniMad, modules, scenes and cues, the
timelines overview, keyframe editing, track types, time markers, live
performance and control, the OSC command list, performance, MadAI,
troubleshooting, the glossary, the v6 feature page and the at-a-glance page.
Each carries a "Session 3: system model" note in the state file. Other facts
were taken from `madmapper_insights.md`, marked "(session 1)" or "(session 2)"
in the model. No new pages were added; statuses are unchanged.

**Written**

`madmapper_system_model.json`: 23 items. Dimensions 1 to 20, plus three that
MadMapper adds:

- 21 *Input space and output space*: every surface has a crop geometry and a
  warp geometry, edited in two views.
- 22 *One composition for video, light and laser*: three kinds of layer and
  three kinds of output, with fixtures sampling the video picture.
- 23 *Calibration to the physical room*: scanners, cursors and test patterns
  on the real output, 3D calibration, laser safety.

Confidence is high for 17 items, medium for 5 (rates, encapsulation, names,
errors, several machines) and low for one (performance and concurrency),
because the manual says nothing about threads or cost meters.

**Gaps the docs leave**

The order in which Controls, modules, cues and timelines are applied within a
frame; whether hidden surfaces still render their media; how shader compile
errors appear; how missing media is relinked; what a rename does to existing
OSC users and Controls; whether undo covers cue and timeline edits.

**Problems**

`6.-outputs` failed once with a fetch error and succeeded on retry.
