# Resolume Documentation Crawl — Session Log

Crawl of the official Resolume manual (Arena, Avenue, Wire and Alley), to
learn how the tool works and to list what Max lacks or does differently. It
is one of three sibling scans run on 2026-10-03 (with QLab and Vezér), after
MadMapper, TouchDesigner, Isadora, cables.gl, the three plugdata scans and
ossia score. Resolume is not installed on this machine, so everything comes
from the docs.

Companion files in this folder:

- `enumerate_resolume.py` — lists every manual page and merges the list into
  the state file. Also saves each page's text (`--fetch DIR`), records what
  was read (`--mark`) and prints coverage (`--status`). Standard library only,
  runs on Python 3.9 (tested with `/usr/bin/python3`).
- `resolume_crawl_state.json` — one entry per page, keyed by URL: `title`,
  `url`, `group`, `status` (`pending` / `extracted` / `skipped`), `session`,
  `notes`.
- `resolume_insights.md` — how Resolume works, by topic, for a reader who
  knows Max. Every section names its source pages.
- `resolume_max_gap_candidates.json` — 45 candidates with the Max-side check
  that was run.
- `resolume_system_model.json` — Resolume on the 20 dimensions of
  `scans/max-gaps/SYSTEM_DIMENSIONS.md`, plus one (21, targeting by position,
  identity or selection).
- `resolume_butter_tools_suggestions.md` — ideas for Butter_tools.

## The source

- Doc root: `https://resolume.com/support/en`. Confirmed by fetching it on
  2026-10-03. `https://resolume.com/support` serves the same page. It lists
  every manual page as cards under twelve `<h1>` section headings: FAQ,
  Installing & Registering, Workflow, Content, Output, Controlling Resolume,
  Best Practices, Getting started with LED Strips, Nerds, Resolume Alley,
  Resolume Wire, Troubleshooting. Each page is
  `https://resolume.com/support/en/<slug>`, its text inside `<main>`.
- Wire's manual is part of the same site (the Resolume Wire section, 13
  pages). `https://resolume.com/support/wire` is a Wire-only index whose links
  are all on the main index. The two top-navigation links
  (`/support/en/avenue-arena`, `/support/en/wire`) are index pages and are not
  listed.
- Extra pages (group `API reference`), linked from the "REST API & Webserver"
  page: the Arena & Avenue REST API reference `https://resolume.com/docs/restapi/`,
  a Swagger UI page whose content is `swagger.yaml` (10,557 lines, OpenAPI
  3.1), and the Wire REST API reference `https://resolume.com/docs/wirerestapi/`.
- Each page shows version tags (v 6 ... v 7.29); the newest seen is 7.29
  (`installer-stuck`); the MCP page is 7.26.0.

## Inventory after session 1 (2026-10-03)

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| FAQ | 4 | 4 | 0 | 0 |
| Installing & Registering | 5 | 5 | 0 | 0 |
| Workflow | 12 | 12 | 0 | 0 |
| Content | 12 | 12 | 0 | 0 |
| Output | 10 | 10 | 0 | 0 |
| Controlling Resolume | 11 | 11 | 0 | 0 |
| Best Practices | 9 | 9 | 0 | 0 |
| Getting started with LED Strips | 6 | 6 | 0 | 0 |
| Nerds | 9 | 9 | 0 | 0 |
| Resolume Alley | 2 | 2 | 0 | 0 |
| Resolume Wire | 13 | 13 | 0 | 0 |
| Troubleshooting | 14 | 14 | 0 | 0 |
| API reference | 2 | 1 | 0 | 1 |
| **Total** | **109** | **108** | **0** | **1** |

## Session 1 (2026-10-03)

### What was read

- **All 107 manual pages, in full**, from the text of each page's `<main>`
  (saved with `--fetch` to the session scratchpad). Images and videos were
  not seen; a few pages (blend modes, layers, autopilot) lean on pictures.
- **REST API reference**: the `swagger.yaml` header (access by index, by-id
  and selected; URL encoding), the full list of paths, the parameter-type
  schemas and `ParameterView`, and the phase-source, clip `connect` and
  monitor-snapshot endpoints. Not every endpoint was read.
- The DIY Pixel Lab's Arduino and ESP32 setup steps were read but are
  hardware instructions and were not used.

### Not read, and why

- `https://resolume.com/docs/wirerestapi/` (pending): the page exists; its
  spec file was not located.
- Wire's Data Types and Instancing articles are referenced from the Wire
  User Interface page but are not published: `/support/en/wire-data-types`,
  `/support/en/wire-instancing` and similar guesses redirect to the support
  index. Wire's node reference lives inside the application (node finder
  descriptions and example patches), not on the site.

### Problems

- **Older pages lag the product.** Several pages are tagged v 6 only
  (Advanced Output, Screens, Input Selection, Output Transformation, Edge
  Blending, Keyboard Shortcuts, BPM, Live Inputs). Their file paths mention
  "Resolume Avenue-Arena 5", and Live Inputs still says audio capture is not
  supported. Newer behaviour may differ; the insights say which page each
  claim comes from.
- **Names differ between the manual and the API.** The manual's
  "Clip/Layer/Group FFT" is `entity_fft` in the REST API, and the manual's
  animation options are the API's "phase source". The insights use the
  manual's words and give the API's where it helps.
- The MCP page reads partly like setup instructions for AI apps; it was
  treated as documentation only.

### Enumerator checks

- First run wrote 107 pages. Titles first came out as slugs, because each
  card links twice (an image link, then the title); fixed to take the text
  link. Adding the two API references and re-running gave 109 with every
  status, session and note kept, which confirmed the merge works.
- A forced failure (index parse raising) printed the cause, exited 1 and left
  the state file byte-for-byte unchanged.

### Max-side checking

Every gap candidate's `max_check` says what was read on the Max side: the
object registry (`obj-qlookup.json`, core plus bundled packages), refpages of
every object cited (jit.playlist, jit.polymovie, jit.movie and its `loop`
modes, jit.gl.videoplane, jit.gl.node, jit.xfade, the Jitter Tools
`jit.fx.tr.*` and `jit.fx.co.*` shaders, jit.gl.meshwarp, jit.record, metro
`@quantize`, transport, function, param.osc, mousestate, maxurl, flonum,
umenu, urn, fffb~, peakamp~, slide, change), `transform-defaults.json` for
jit.gl.layer versus jit.gl.videoplane, the userguide's `mapping.json` (MIDI
and key mappings with relative, trigger and pickup modes),
`parameter_mode.json`, `non_realtime.json`, `OSC.json`, `projects.json` and
`debugging_and_probing.json`, and `packages/query_packages.py` (no timecode,
SMPTE, DMX/Art-Net, WebSocket or clip-launcher objects; Link package:
`link.beat`, `link.session`; tap tempo only in Upshot). `max_system_model.json`
was used for Max's general approach.

### Candidate counts

45 candidates: 10 absent, 18 partial (gaps, 28 in all), 17
different-approach (shared concepts with advice). Two weaker ones were left
out (Wire's Select All Unused, and per-node load in Wire's Stats panel, whose
Max side could not be confirmed); both are described in the insights.

MadMapper already covers projection mapping, DMX pixel mapping, edge
blending, fixtures and codec advice, so those appear here only where
Resolume does something its own way (Slice Transform, virtual-screen
routing, Wire's Slice In).

## What to read next

1. The Wire REST API reference's spec file.
2. The remaining REST endpoints in `swagger.yaml` (clip transport fields,
   deck and column parameters) for the exact parameter names behind the
   manual's features.
3. Wire's in-app node descriptions and example patches, if a copy of Wire is
   ever available; the site documents the editor, not the nodes.
4. Resolume's release notes or blog for features newer than the v 6 pages,
   especially the Advanced Output.
