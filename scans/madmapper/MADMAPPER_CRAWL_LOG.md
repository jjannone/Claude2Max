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
- `madmapper_max_gap_candidates.json` — 49 capabilities to compare against Max,
  each with what was searched on the Max side and what came back.

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

## Inventory (2026-10-02)

| Group | Listed | Extracted | Pending | Skipped |
|---|---|---|---|---|
| Manual | 99 | 99 | 0 | 0 |
| Website | 29 | 6 | 11 | 12 |
| PDF guides | 23 | 17 | 5 | 1 |
| GitHub documents | 9 | 5 | 4 | 0 |
| **Total** | **160** | **127** | **20** | **13** |

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

## What the next session should read first

1. `https://madmapper.com/extensions/FAQ` — finish it. The MadLaser technical
   sections may answer open questions about DACs and scan settings.
2. `https://madmapper.com/madmapper/faq` and `https://madmapper.com/minimad/faq`.
3. The "Empty Template" Surface FX and one or two factory Materials in the
   GitHub repository, for the per-surface-type shader variables the documents
   do not list.
4. `Libraries/MadSDF.md`, which the manual calls a visual tutorial.
5. PDF guide 10 (Arduino Firmata) and PDF guide 01, to check for anything the
   version 6 manual dropped.
6. If transcripts are available, the MadLaser and Timelines video tutorials.

For the Max comparison, the later pass should settle these, which this session
left open: what `param.osc` and Max's OSCQuery server expose; what clock
sources `transport` accepts; whether an NDI, Art-Net or LTC external exists
outside this machine's packages; and whether `jit.gl.nurbs` control points can
be dragged in the window.
