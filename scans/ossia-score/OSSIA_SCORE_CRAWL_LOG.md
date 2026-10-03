# ossia score Documentation Crawl — Session Log

Crawl of the official ossia score documentation, to learn how the tool works
and to list what Max lacks or does differently. It is the eighth sibling scan
(MadMapper, TouchDesigner, Isadora, cables.gl and the three plugdata scans came
first). ossia score is not installed on this machine, so everything comes from
the docs.

Companion files in this folder:

- `enumerate_ossia_score.py` — lists every doc page and merges the list into
  the state file. Also saves the raw Markdown (`--fetch DIR`), records what was
  read (`--mark`) and prints coverage (`--status`). Standard library only,
  runs on Python 3.9 (tested with `/usr/bin/python3`).
- `ossia_score_crawl_state.json` — one entry per page, keyed by public URL:
  `title`, `url`, `group`, `source_path` (path in the GitHub repo), `status`
  (`pending` / `extracted` / `skipped`), `session`, `notes`.
- `ossia_score_insights.md` — how score works, by topic, for a reader who knows
  Max. Every entry names its source pages.
- `ossia_score_max_gap_candidates.json` — 48 candidates with the Max-side check
  that was run.
- `ossia_score_system_model.json` — score on the 20 dimensions of
  `scans/max-gaps/SYSTEM_DIMENSIONS.md`, plus one (21, units and dataspaces).

## The source

- Doc root: `https://ossia.io/score-docs/`. Confirmed by fetching it on
  2026-10-03: a Jekyll "just-the-docs" site on GitHub Pages titled "Score
  documentation", which links its source on GitHub.
- Source: GitHub repo `ossia/score-docs`, branch `master`. The enumerator lists
  it with one call to the GitHub tree API, then reads each Markdown file from
  `raw.githubusercontent.com`.
- **Public URLs do not follow repo paths.** Each page's URL comes from its
  front-matter `permalink`; for example
  `docs/reference-manual/processes/library/scenario.md` is published at
  `/score-docs/processes/scenario.html`, and `docs/in-depth/polyphony.md` at
  `/score-docs/docs/advanced/polyphony.html`. The enumerator reads every file's
  front matter for this reason.
- Check: the 247 `score-docs` links in the published site's navigation were
  compared with the enumerated list. All 247 are in the state file. The state
  file has 4 extra: an empty `automation.md` (no permalink) and the 3 ossia.io
  pages below.
- Extra pages (group `ossia.io`): the libossia API reference
  `https://ossia.io/ossia-docs/` (one long page covering every binding,
  including Max), the libossia Max and OSCQuery feature pages (both stubs:
  "TODO"), and `https://ossia.io/score/features/addresses.html` (address
  patterns and type aliases). They came from `https://ossia.io/sitemap.xml`,
  which has 38 URLs and does not list the score-docs pages.

## Inventory after session 1 (2026-10-03)

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| quick start | 12 | 12 | 0 | 0 |
| in depth | 22 | 22 | 0 | 0 |
| common practices | 15 | 15 | 0 | 0 |
| processes | 99 | 98 | 1 | 0 |
| devices | 35 | 35 | 0 | 0 |
| panels | 6 | 6 | 0 | 0 |
| reference | 7 | 5 | 0 | 2 |
| faq | 6 | 6 | 0 | 0 |
| examples | 35 | 11 | 0 | 24 |
| integrations | 2 | 1 | 0 | 1 |
| development | 8 | 3 | 5 | 0 |
| home | 1 | 1 | 0 | 0 |
| ossia.io | 4 | 4 | 0 | 0 |
| **Total** | **252** | **219** | **6** | **27** |

## Session 1 (2026-10-03)

### What was read

- **In full**: home, all of quick start, in depth, common practices, panels
  and FAQ (troubleshooting included); the Processes overview and Scenario
  pages; the glossary, command-line, preferences and protocols-and-formats
  references; the basics, automation and tempo examples; the development pages
  on plug-ins, architecture and Avendish (to its first examples); the Blender
  integration page; the changelog (only a table of release links: 3.8.0 is
  February 2026).
- **Devices**: all 35 pages, the first ~90 lines of each. Mapper, Serial and
  WebSocket run longer and their later code examples were not read.
- **Processes**: all 98 non-empty pages. For most, the prose was read with
  code blocks and bold bullet lists filtered out (first ~45 lines). 21 longer
  pages (JavaScript, ISF Shaders, CSF Compute Shaders, Render Pipeline,
  ExprTK, Control surface, Geo Zones, HDF5, GBAP, Matrix, Classifier,
  Regressor, Qwen LLM and others) were read only in their first part; the
  state file notes which.
- **libossia reference**: the prose on devices, nodes, parameters, the
  attribute list, units and the Max-binding notes. The code samples for other
  bindings were skimmed, not read.

### Skipped, and why

- `docs/reference-manual/processes/library/automation.md`: empty file (0
  bytes). The automation reference is `automation_float`.
- Five development pages (build from source, hacking, Linux packaging, release
  builds, development index): instructions for building score, not about how
  it works.

### Problems

- **Many stubs.** Pages with only "Reference is not yet available" or "TODO":
  HTTP, Joystick, Kinect, LSL and libav devices; DBAP, Gestures, Text, Display
  utilities, Graphics utilities and Mapping utilities processes; Package
  manager; the in-depth "Execution engine" page (two headings, no text). The
  glossary entries for Automation, Branch, Condition, Protocol, Slot, State,
  Timeline and Trigger are empty headings. The Spatial audio page has TODO
  sections (VBAP, Ambisonics, Ambix and IEM).
- **Condition syntax is undocumented** in the pages read. Conditions and
  trigger expressions are described by what they do, not by their grammar.
- **Images and videos** carry much of the meaning on the timeline pages; only
  the text was read.
- **Docs disagree with themselves in places.** The camera device page says
  Syphon is not yet supported, while the Syphon device page and the
  livestreaming page describe Syphon input and output (available since 3.0.4).
  The insights follow the newer pages.
- **ossia-max** could only be read about in the libossia reference, whose
  install note still says "Max 7" and "upon public release". The Max feature
  page is a stub. ossia-max is not installed here, so nothing about it was
  checked in Max.
- The first run of the enumerator wrote 251 entries; adding the libossia
  reference to `EXTRA_PAGES` and re-running gave 252 with every status, session
  and note kept, which also confirmed the merge works.

### Max-side checking

Every gap candidate's `max_check` says what was read on the Max side: the
object registry (`obj-qlookup.json`, core plus bundled packages), refpages of
every object cited (qlist, transport, timepoint, mtr, line, pattrstorage,
pattr, scale, zmap, peak, trough, slide, regexp, vst~, matrix~, jit.gl.slab,
jit.gl.shader, jit.spill, jit.colorspace, jit.gl.model, nodes, serial, hid,
attrui, thispatcher, node.script, rnbo~ and others), the userguide's OSC page
and preferences page (Max serves OSCQuery but no client is described), and
`packages/query_packages.py` for installed third-party packages (FrameLib
`fl.spatial~` for DBAP, `dot.autoscale`, `pipo.1euro`, `fxwdmxusbpro`,
`max-ble`, Data Knot and FluCoMa regressors, the Compute package's
`jit.gpu.compute`, the Link package). `max_system_model.json` was used for
Max's general approach.

### Candidate counts

48 candidates: 14 absent, 18 partial (gaps, 32 in all), 15 different-approach
and 1 better-elsewhere (shared concepts with advice, 16 in all).

## What to read next

1. The 24 pending example pages (3D, audio, video, devices, advanced), which
   may show features the reference pages leave as stubs.
2. The later parts of the 21 long process pages, especially JavaScript (state
   and timing helpers), CSF Compute Shaders, Render Pipeline and Geo Zones.
3. The rest of the Mapper, Serial and WebSocket device pages.
4. The `shortcuts` and `reference-manual` index pages (pending).
5. The GitHub release notes linked from the changelog, for features newer than
   the docs.
6. The ossia-max repository's own README and help files, to confirm the object
   names listed in the insights (`[ossia]`, `[ossia.device]`,
   `[ossia.model]`, `[ossia.parameter]`, `[ossia.remote]`) before anyone
   relies on them.
