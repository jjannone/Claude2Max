# QLab Documentation Crawl — Session Log

Crawl of the official QLab 5 manual, to learn how QLab works and to list what
Max lacks or does differently. A sibling of the ossia score, Vezér and
Resolume scans. QLab is not installed on this machine, so everything comes
from the manual.

Companion files in this folder:

- `enumerate_qlab.py` — lists every manual page and merges the list into the
  state file. Also saves each page's visible text (`--fetch DIR`), records what
  was read (`--mark`) and prints coverage (`--status`). Standard library only,
  runs on Python 3.9 (tested with `/usr/bin/python3`).
- `qlab_crawl_state.json` — one entry per page, keyed by public URL: `title`,
  `url`, `group`, `status` (`pending` / `extracted` / `skipped`), `session`,
  `notes`.
- `qlab_insights.md` — how QLab works, by topic, for a reader who knows Max.
- `qlab_max_gap_candidates.json` — 42 candidates with the Max-side check run.
- `qlab_system_model.json` — QLab on the 20 dimensions of
  `scans/max-gaps/SYSTEM_DIMENSIONS.md`, plus 21 (the operator and the
  playhead) and 22 (licences gate features in the same file).
- `qlab_butter_tools_suggestions.md` — ideas for Butter_tools.
- `qlab_clone_inventory.md` — Audio and Video cue features with exact
  behaviour and nearest Max objects, for the later question of a Max clone.

## The source

- Doc root: `https://qlab.app/docs/v5/`. `https://qlab.app/docs/` redirects
  there (fetched 2026-10-03). The home page says "Updated August 31, 2026 for
  QLab 5.6.3". A PDF of the same manual is linked at
  `https://qlab.app/docs/QLab_5_Reference_Manual.pdf` (not used).
- The site is Next.js rendered on the server, so each page's HTML holds its
  text. The pages have no `<main>` element; the enumerator keeps the text from
  the page's first top-level heading to the "Still have a question?" footer.
- Page list: the union of the `/docs/v5/` links in the doc root's navigation
  (96) and the `/docs/v5` entries in `https://qlab.app/sitemap.xml` (97). The
  sitemap adds `/tutorials/intro-to-devamp-cues/`; the union is 97 pages.
- Re-running the enumerator after marking pages kept every status and note,
  which confirmed the merge works.

## Inventory after session 1 (2026-10-03)

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| home | 1 | 1 | 0 | 0 |
| general | 9 | 8 | 1 | 0 |
| fundamentals | 11 | 11 | 0 | 0 |
| tools | 10 | 10 | 0 | 0 |
| audio | 8 | 8 | 0 | 0 |
| video | 9 | 9 | 0 | 0 |
| lighting | 7 | 7 | 0 | 0 |
| networking | 12 | 12 | 0 | 0 |
| scripting | 7 | 7 | 0 | 0 |
| other-cues | 8 | 8 | 0 | 0 |
| tutorials | 15 | 12 | 3 | 0 |
| **Total** | **97** | **93** | **4** | **0** |

## Session 1 (2026-10-03)

### What was read

- **In full**: every fundamentals, audio, video, lighting (except the fixture
  list), networking, other-cues and tools page; the scripting pages on Script
  cues, OSC queries, the Parameter Reference and Examples; the general pages on
  what's new, features by licence, preferences and system recommendations;
  every tutorial page except the three skipped (most tutorial pages are short
  download descriptions; Sam's Toolbox is a full page).
- **In part** (the state file says which part):
  - OSC dictionary (309 KB): introduction (ports, replies, updates, `/live`,
    `+/-`, booleans), the whole Workspace messages section, selected cue
    entries; all 1,176 method headings listed.
  - AppleScript dictionary: introduction and command headings.
  - Change log: the 5.6 release notes in full, earlier releases by heading.
  - Light Library: prose; fixture list skimmed.
  - Preparing Your Mac: Show Mode section and performance tips.
  - Keyboard Shortcuts: the default controls table.

### Skipped, and why

- `/general/licenses/`: buying, activating and moving licences.
- `/tutorials/understanding-usb-c/`, `/tutorials/how-to-use-a-mac/`,
  `/tutorials/basic-networking/`: general essays not about QLab (headings read).

### Problems

- **A truncated page**: `/fundamentals/cue-lists/` ends mid-sentence in the
  On Stop / freewheel paragraph. Checked in the raw HTML: the published page
  itself stops there.
- **Several tutorials are stubs**: "Many of these tutorials are not yet
  written"; Object Audio Basics and Audio Workflow have only headings.
- **Images carry meaning** on the video output, object audio and fade pages
  (heatmaps, gravity and shadow examples); only the text was read.
- **Formulas are not given** for the S-curve, parametric curve, slider audio
  domain, object-audio gain law and edge-blend curve.
- **An accident, repaired**: while checking whether
  `scans/max-gaps/build_max_gaps.py` had a help option, it ran and rewrote
  `scans/max-gaps/max_gaps.json` and `max_gaps.md` (adding 111 entries from
  the qlab, vezer and resolume candidate files). Both files had no changes
  before this session, so they were restored with `git checkout`; nothing
  else outside `scans/qlab/` was touched. The run did confirm that the
  builder reads `qlab_max_gap_candidates.json` without errors.

### Max-side checking

Every candidate's `max_check` says what was read. Objects were checked against
`obj-qlookup.json` (core plus bundled packages), the init mapping files (for
`jit.gl.layer`, `jit.gl.movie`, `jit.fx.subtexture`) and their refpages:
qlist, coll, urn, delay, pipe, playlist~, jit.playlist, sfplay~, groove~,
buffer~, jit.movie, matrix~, mc.matrix~, crosspatch, live.gain~, curve~,
line~, mc.line~, function, waveform~, nodes, pan~, edge~, jit.gl.videoplane
and the shared jit.group-gl attributes (layer, blend, blend_mode, quat,
anchor), jit.gl.node, jit.world, jit.gl.cornerpin, jit.gl.meshwarp (Jitter
Tools), jit.alphablend, jit.gl.slab, jit.gl.pix, jit.gl.text, jit.grab,
jit.pwindow, filewatch, pattrstorage, param.osc, udpreceive, udpsend, key,
speedlim, onebang, clip~, transport, timepoint, mtr, seq, rtin, sync~, mute~,
pcontrol, vst~, average~, sprintf, regexp, route, translate, matrixctrl, the
ease package (user package, refpages read). Shaders found in Jitter Tools:
`tr.edgeblend.jxs` (gradient alpha for edge blending) and the `co.*`
composite shaders (overlay, softlight, hardlight, dodge, burn and others).
The Max userguide's OSC, Scheduler and Priority, Sample Accurate Messages and
Preferences pages were read (one audio Input Device and one Output Device per
driver). `packages/query_packages.py` was searched for timecode, LTC, Syphon,
edge blend, cue list, crossfade, panning, VBAP and spat: Syphon objects,
Panning Tools and abclib `abc.vbap~` exist; nothing for timecode or cue lists.
`max_system_model.json` was used for Max's general approach.

### Candidate counts

42 candidates: 10 absent and 15 partial (gaps, 25 in all); 14
different-approach and 3 better-elsewhere (shared concepts with advice, 17 in
all).

## What to read next

1. The rest of the OSC dictionary, especially the Audio, Video, Fade and
   Group cue sections, entry by entry, for the clone inventory.
2. The PDF manual, to see whether its images explain the curve and object
   audio maths better than the web text.
3. The release notes before 5.6, for behaviour changes not yet in the manual.
4. The tutorial workspaces themselves (downloads), which the manual says
   explain cue sequences, devamp and blend modes in Memo cues.
