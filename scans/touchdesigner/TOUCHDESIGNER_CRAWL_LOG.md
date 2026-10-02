# TouchDesigner Documentation Crawl — Session Log

Crawl of the official TouchDesigner documentation (Derivative) at
`https://docs.derivative.ca/`. The purpose is to learn how the tool works and
to list capabilities Max may lack or that TouchDesigner may do better. It is
one of four sibling scans (MadMapper, Isadora and cables.gl are the others and
are not covered here).

Companion files in this folder:

- `enumerate_touchdesigner.py` — lists every doc page through the wiki's API
  and merges the list into the state file. Also fetches page text
  (`--fetch`), records what was read (`--mark`) and prints coverage
  (`--status`). Standard library only, runs on Python 3.9.
- `touchdesigner_crawl_state.json` — one entry per page, keyed by URL:
  `title`, `url`, `group`, `categories`, `status`
  (`pending` / `extracted` / `skipped`), `session`, `notes`.
- `touchdesigner_insights.md` — how the tool works, by topic, for a reader who
  knows Max. Every entry names its source pages.
- `touchdesigner_max_gap_candidates.json` — 66 candidate capabilities, each
  with the Max-side check that was run.

Same pattern as `scans/userguide/` and `scans/cookbook/`.

## The source

- Doc root: `https://docs.derivative.ca/Main_Page`. Confirmed by fetching it on
  2026-10-02: the page title is "TouchDesigner Documentation" and the site is a
  MediaWiki 1.39 wiki.
- The wiki has a public API at `https://docs.derivative.ca/api.php`. The
  enumerator uses `generator=allpages` with `prop=categories`, so the page
  list comes from the wiki's own page registry and not from scraping index
  pages. Page text is read as raw wikitext through the same API.
- The wiki reported 3,416 pages in all namespaces and 2,123 "articles". This
  crawl covers the main namespace only, redirects left out: **2,282 pages**.
  The wiki also has an `Experimental` namespace (docs for experimental
  builds), which was not enumerated.

## Inventory (2026-10-02)

Groups are derived from each page's wiki categories and title; the rules are
in `CATEGORY_GROUPS` in the enumerator.

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| TOP operators | 154 | 40 | 0 | 114 |
| CHOP operators | 175 | 39 | 0 | 136 |
| SOP operators | 115 | 4 | 0 | 111 |
| POP operators | 108 | 12 | 0 | 96 |
| DAT operators | 77 | 28 | 0 | 49 |
| MAT operators | 15 | 4 | 1 | 10 |
| COMP operators | 46 | 24 | 0 | 22 |
| palette (ready-made components) | 172 | 20 | 0 | 152 |
| concepts | 138 | 36 | 12 | 90 |
| glossary | 165 | 66 | 3 | 96 |
| operator topics | 14 | 13 | 0 | 1 |
| interface | 6 | 1 | 0 | 5 |
| uncategorized (many are concept pages) | 250 | 75 | 57 | 118 |
| python reference | 774 | 0 | 0 | 774 |
| release notes | 45 | 1 | 0 | 44 |
| operator help fragments | 27 | 0 | 27 | 0 |
| legacy tscript | 1 | 0 | 1 | 0 |
| **Total** | **2,282** | **363** | **101** | **1,818** |

Run `python3 scans/touchdesigner/enumerate_touchdesigner.py --status` for the
current numbers.

## Sessions

### 2026-10-02 — Session 1 (breadth-first)

**Enumerated** all 2,282 pages into the state file.

**Read 363 pages**, in three passes:

1. Core concepts (60 pages): the product overview, the "First Things to Know"
   guide, every operator family page, cooking, time slicing, parameters and
   their modes, export, binding, cloning, components, extensions, custom
   parameters, custom operators, storage, shortcuts, timeline and time pages,
   timecode, keyframe animation, perform mode, panels, widgets, windows and
   multiple monitors, rendering, instancing, projection mapping, multi-machine
   sync, hardware frame lock, perfect playback, movie playback.
2. I/O, protocols, devices and workflow (135 pages): DMX, Art-Net, sACN,
   GDTF/MVR, lasers, OSC, MIDI, TUIO, MQTT, NDI, network protocols, WebRTC,
   video streaming, RTMP/RTSP/SRT, TouchEngine, TouchPlayer, Python, NumPy,
   OpenCV, VST, TDAbleton, TDBitwig, point clouds, LIDAR, Gaussian splats,
   shared memory, GLSL and compute shaders, colour space, pixel formats, VFS,
   privacy, optimisation and the performance monitor, USD, FBX, Alembic, glTF,
   Bullet, hardware ray tracing, Vulkan, MPCDI, Vioso, Scalable Displays, quad
   reprojection, the interoperability list, the depth camera and tracking
   pages, file types, macOS limits, dialogs, and the 2025.30000 release notes
   (first part only).
3. Operators and palette components that looked like possible Max gaps (166
   pages), plus two shared pages they depend on (`Sync CHOPs Common`,
   `Initialize Start`).

**How the pages were read.** Each page's wikitext was fetched through the API
and cleaned of wiki markup. Long pages were cut to a fixed length before
reading: 9,000 characters in pass 1, 5,500 in pass 2, and 3,000 in pass 3.
Operator pages were reduced to their summary text plus a list of parameter
labels and one-line descriptions. Each state entry's `notes` says either "Read
in full" or how much of the page was read. 110 of the 363 are partly read and
252 were read in full (one, `Tap Tempo`, is an empty page). Treat a partly read page as covered for its summary, not for its detail.

For some operator pages the parameter templates are written in a compact form
the cleaning step did not parse, so only the summary was read (for instance
`Sync In CHOP`, `Inverse Kin CHOP`, `Keyframe CHOP`, `Replicator COMP`).

**Skipped 101 pages**, each with its reason in `notes`:

- Wiki plumbing and test pages (`*.css`, `TestPage`, `APITest`, …).
- Licensing and purchasing pages.
- Legacy Tscript language pages.
- Parameter-page fragments that are transcluded into operator pages
  (`CHOP Common Page`, `COMP Panel Page`, …).

**Fetch problems.**

- The first enumeration run failed with a TLS handshake timeout from Python's
  `urllib` (macOS system Python 3.9, LibreSSL 2.8.3). The script stopped with
  exit code 2 and left the state file alone, as designed. Three test requests
  straight after all succeeded in about 0.3 s, so it was a one-off. The script
  now retries each call up to three times and reports the last cause if all
  fail.
- No page fetch failed. All 363 distinct pages that were requested came back.
- `Tap Tempo` exists but is empty. `COMP` is a stub that lists its category.
- WebFetch was not used. The API returns the full source text, which is more
  complete than a summarised fetch.

**Max-side checks for the candidates.** For each candidate the following were
searched, and the result is in its `max_check` field:

- Max's object registry, `interfaces/obj-qlookup.json`, plus the one bundled
  package registry that exists (`mira`): 1,326 names with digests.
- Digest and description text of 1,389 refpages (`max-ref`, `msp-ref`,
  `jit-ref`, `m4l-ref`, and bundled package docs such as Jitter Tools and
  Jitter Geometry; Gen and RNBO operator pages left out).
- Topic files of Max's own userguide.
- `packages/query_packages.py search` over the installed third-party
  packages.
- For every Max object named as "closest", its refpage was read (digest,
  description, attribute and method names), or its package-library entry.

The package search matches substrings, so short terms return noise ("ndi"
matches "sendi…"). Those hits were read and discarded by hand.

Things not checked: Max's example and help patches, the Package Manager's
catalogue of packages that are not installed, and Max for Live. A capability
marked `absent` means "not found in Max or in the packages on this machine",
not "no third-party package exists anywhere".

## What the next session should read first

1. **The rest of the operator families**, summary only, to finish the map:
   114 TOPs, 136 CHOPs, 96 POPs, 49 DATs, 22 COMPs, 111 SOPs. The POP family
   is the newest and least like anything in Max. Start with `Math Mix POP`,
   `Field POP`, `Proximity POP`, `Lookup Texture POP`, `Copy POP`,
   `Skin Deform POP`, `GLSL Advanced POP`.
2. **Palette components not yet read** (152), especially the mapping and
   sync tools: `Palette:synchroServer`, `Palette:synchroClient`,
   `Palette:cornerPinPOP`, `Palette:kinectCalibration`, `Palette:stitcher`,
   `Palette:moviePlaylist`, `Palette:movieBlender`, `Palette:cameraViewport`,
   `Palette:pushPins`, `Palette:multiTouch`, `Palette:gestureCapture`.
3. **Partly read concept pages worth finishing**: `Learning About POPs`
   (9,000 of 50,818 characters read), `Extensions`, `Transparency`,
   `Color Space`, `Write a GLSL TOP`, `Write a GLSL POP`, `TDAbleton`,
   `Optimize`, `Timer CHOP`, `Movie File In TOP`, `Render TOP`, `PBR MAT`,
   `Palette:lister`, and `Release Notes/2025.30000` (5,500 of 145,369).
4. **Pending concept pages**: `Color Space Workflows`, `Build a List COMP`,
   `Write a GLSL MAT`, `Write a CPlusPlus Plugin`, `CHOP Techniques`,
   `Math Mix Combine Functions`, `POP Rotations`, `Atomic Counters`,
   `Specialization Constants`, `Network Editor`, `Sequential Parameters`
   (partly read), `Custom Parameters` (partly read), `Python Tips`,
   `Introduction to Python Tutorial`, `Pattern Matching Support`.
5. **Python reference (774 pages)** is low priority for this purpose. Read a
   class page only when a candidate depends on it (`Timecode Class`,
   `WebrtcDAT Class`, `TDJSON`).
6. **Refine the candidates.** Entries marked `unsure` or with `low`
   confidence need a closer look on the Max side: `jit.gl.camera`
   projection attributes, `jit.movie` engine options, whether any Jitter
   object runs compute shaders, what `jit.geom.*` runs on, and whether
   uninstalled packages cover NDI, Art-Net, Kinect or TUIO.
