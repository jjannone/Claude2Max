# Vezér Documentation Crawl — Session Log

Crawl of Imimot's official Vezér help, to learn how the tool works and to list
what Max lacks or does differently. It follows the ossia score scan and runs
alongside QLab and Resolume scans. Vezér is not installed on this machine, so
everything comes from the docs.

Companion files in this folder:

- `enumerate_vezer.py` — lists every help page and merges the list into the
  state file. Also saves each page's visible text (`--fetch DIR`), records what
  was read (`--mark`) and prints coverage (`--status`). Standard library only,
  tested with `/usr/bin/python3` (Python 3.9).
- `vezer_crawl_state.json` — one entry per page, keyed by URL: `title`, `url`,
  `group`, `status` (`pending` / `extracted` / `skipped`), `session`, `notes`.
- `vezer_insights.md` — how Vezér works, by topic, for a reader who knows Max.
- `vezer_max_gap_candidates.json` — 24 candidates with the Max-side check run.
- `vezer_system_model.json` — Vezér on the 20 dimensions of
  `scans/max-gaps/SYSTEM_DIMENSIONS.md`, plus one (21, output addressing).
- `vezer_butter_tools_suggestions.md` — ideas for Butter_tools.

## The source

- Doc root: `https://imimot.com/help/vezer`. Confirmed by fetching it on
  2026-10-03: "Vezér Help — Imimot Software", plain HTML on Imimot's own site,
  linked from the product page `https://imimot.com/vezer`. There is no PDF
  manual; every topic is its own short page.
- The enumerator starts at the root and follows every link under
  `/help/vezer`, breadth first. That found 88 pages in 13 sections (General,
  Compositions, Tracks, Keyframes, Cues, Recording, OSC Track Extras,
  Controlling Vezér, Import / Export, Tools, Tutorials, FAQ, Public Betas) and
  the changelog.
- Extra pages (group `imimot.com`): the product page and the "Vezér 1.9
  released" blog post.
- Current version per the product page and changelog: 1.9.9 (17 February
  2026). The help pages are all dated 9 August 2026.

## Inventory after session 1 (2026-10-03)

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| home | 1 | 1 | 0 | 0 |
| help | 76 | 76 | 0 | 0 |
| tutorials | 4 | 4 | 0 | 0 |
| faq | 4 | 2 | 2 | 0 |
| account | 2 | 1 | 1 | 0 |
| changelog | 1 | 1 | 0 | 0 |
| imimot.com | 2 | 2 | 0 | 0 |
| **Total** | **90** | **87** | **3** | **0** |

## Session 1 (2026-10-03)

### What was read

Every page in full, as visible text saved by `--fetch` to the session scratch
area (about 14,000 words in all; not kept in the repo). Most pages are one to
four paragraphs. The interpolation page's only content is a screenshot of the
menu, which was viewed (it is cut off after the circular curves).

### Skipped, and why

- License Management, Activation problems, "I lost my license": licensing, not
  about how Vezér works.

### Problems

- **The first coordinator check found nothing written.** The session had
  stalled while reading the ossia score scan. On resume the folder, state file
  and log were written first; the enumerator was then run once in full, which
  took a little over five minutes because of the polite pause between 90
  fetches (the shell's two-minute limit moved it to the background; it
  finished with exit code 0). No fetch failed.
- **Screenshots carry meaning in places.** The interpolation list and the
  playhead-following page exist only as images. Only the interpolation image
  was viewed.
- **Gaps in the docs.** No page covers scripting, LTC, output curves or
  scaling beyond min/max, sending order, threads, or undo. The product page
  mentions MIDI program changes, OSC strings and composition import between
  projects; no help page describes them. Those claims are not used as facts.
- **Changelog is partial.** It covers 1.8.5 (2019) to 1.9.9 only. Features
  are dated from the help pages' own "added in 1.x" notes where given.
- **The Search and Replace page** lists only Art-Net channel and track name,
  while its summary on the General index says OSC addresses too. The system
  model records this as an open question.
- **The 1.7-era OSCQuery page** says Mitti was then the only app supporting
  OSCQuery; that is the docs' statement at the time, not current fact.

### Max-side checking

Every candidate's `max_check` names what was read: the object registry
(`obj-qlookup.json`, core plus bundled packages: no MTC, SMPTE, LTC, MMC,
Art-Net or DMX object), refpages of every object cited (transport, timepoint,
qlist, mtr, seq, detonate, function, rtin, midiin, sxformat, sync~, xctlout,
xctlin, change, speedlim, join, combine, swatch, jit.colorspace, peakamp~,
udpsend, dict, pcontrol, param.osc, curve~), the userguide's OSC page (Max
serves OSCQuery; no client), and `packages/query_packages.py` for DMX, Art-Net,
timecode, MTC, SMPTE, OSCQuery and easing (only `fxwdmxusbpro`, a serial DMX
abstraction, turned up). `max_system_model.json` was used for Max's general
approach.

### Candidate counts

24 candidates: 5 absent, 5 partial (gaps, 10 in all), 13 different-approach
and 1 better-elsewhere (shared concepts with advice, 14 in all). Themes
already well covered by earlier scans (Art-Net, OSCQuery client, recording,
easing) were only added where Vezér does it differently, and say so in
`notes`.

## What to read next

1. The product page's undocumented claims (program changes, OSC strings,
   composition import), if a newer manual or the app's own help appears.
2. The Imimot blog tutorials linked from `/tutorials/other-softwares-and-vezer`
   (Resolume, MadMapper, Modul8, TouchOSC), for working setups.
3. Mitti's help (`https://imimot.com/help/mitti`), which shares NMC and
   OSCQuery with Vezér.
