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
- `touchdesigner_max_gap_candidates.json` — 116 candidates, each with the
  Max-side check that was run: 66 from session 1 (things Max may lack) and 50
  from session 2 (things both tools have that TouchDesigner does differently;
  these carry an `advice` field).

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

## Inventory after session 1 (2026-10-02)

The table after session 2 is in the Session 2 entry below.

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

### 2026-10-02 — Session 2 (shared concepts, different approaches)

Session 1 looked for gaps. This pass looked at things both tools have (OSC,
MIDI, presets, components, instancing, timing, ramps and smoothing, noise,
tables and text, movies, image chains, feedback, compositing, shaders, the 3D
scene, audio analysis, interface building, wireless links, start-up, errors,
file handling, data conversion, scripting, networking) and asked where
TouchDesigner's way is better, simpler or just different, and what a Max
patcher should take from it.

**Read 204 pages for the first time**, and re-read 39 that session 1 had
already marked. All 247 pages requested came back; no fetch failed.

- Of the 204: 117 were read in full and 87 partly. As in session 1, "in full"
  for an operator page means its summary plus every parameter label and
  one-line description, with wiki markup removed. Partly read pages were cut
  at a fixed length, between 1,700 and 12,000 characters depending on the
  batch; each state entry's `notes` gives the exact numbers.
- 202 of the 204 were `pending`. The other two, `COMP Instance Page` and
  `COMP Instance 2 Page`, had been `skipped` as fragments; they hold the
  Geometry COMP's instancing parameters, which the `Geometry COMP` page only
  transcludes, so they were read and are now `extracted`.
- The 39 re-read pages keep their session-1 status and have
  "Session 2 … re-read" added to their notes (for instance `Timer CHOP`, now
  12,000 of 12,566 cleaned characters, `Movie File In TOP`, `Cook`,
  `Custom Parameters`, `Transparency`, `Write a GLSL TOP`).
- Four pages were fetched and not read, and are not marked by this session:
  `Phong MAT` and `Introduction to Python Tutorial` (both still pending),
  `Palette:particlesGpu` and `Render TOP` (both extracted in session 1).

**What the cleaning step missed.** For some operator pages the parameter
templates are written in a form the cleaning script does not parse, so the
labels or the descriptions came out blank (for instance `Null CHOP`,
`UDP In DAT`, `UDP Out DAT`, `Sort DAT`, `LFO CHOP`, `DAT to CHOP`, the
menu items of `Movie File In TOP`'s Play Mode, and most `Level TOP` /
`Composite TOP` parameters). Palette pages built from `Custom…` templates
(`Palette/moviePlayer`, `Palette:movieBlender`) were read as raw parameter
names and labels. Five pages have no summary text on the wiki at all:
`Layer TOP`, `ParGroup Execute DAT`, `Palette:multiMix`, `Palette:search`,
`Widget COMP`. `Smooth Operator` is a joke page. Claims in the insights file
rest only on text that was actually shown.

**The Max side.** Every comparison was checked against Max before it was
written:

- Refpages, read with a small script that prints digest, description,
  attribute names and message names (and the full attribute or message
  description where a claim depends on it): about 200 objects across
  `max-ref`, `msp-ref`, `jit-ref` and the bundled Jitter Tools, jit.mo, Jitter
  Geometry and VIDDLL packages.
- `interfaces/obj-qlookup.json`, searched by name for each family (string.*,
  array.*, zl.*, dict.*, pattr, MIDI, OSC, jit.gl.*, and words such as spring,
  pickup, feedback, xml).
- Max's userguide (`docs/userguide/content/`): OSC, Mapping, MIDI, Presets
  and Interpolation, Snapshots, Connecting Parameters, Parameter Mode, Patcher
  Lifecycle, Scheduler and Priority, Abstractions, bpatchers, Subpatchers,
  Polyphony, Strings, Arrays, Conversion Cheat Sheet, Debugging and Probing,
  Search Path, Projects, Transport, Prototypes, Non-real-time Processing, Time
  Value Syntax, and the Jitter topics Video, Video Engine, Textures, Graphics
  Processing, Render Passes, Depth Testing and Layering, JXS File Format and
  Geometry. Each was read to a cut-off of 2,500 to 5,500 characters.
- `packages/query_packages.py search` for easing, o.route, OSC-route, spring,
  perlin, lag, envelope follower, onset, spectral centroid, pickup, soft
  takeover, hysteresis, 14-bit and others.
- `patching/MAX_PATCHING.md` and `scans/c74-forum/forum_insights.md`, by
  `grep`, for known pitfalls on the same topics.

Not checked: Max help patches, and nothing was run in Max. Two pieces of
advice are assembled from documentation only and say so: the custom texture
feedback loop, and driving several movies by frame number.

**Found.** 50 new candidates were appended to
`touchdesigner_max_gap_candidates.json` (116 in all). The first 66 are
unchanged.

| `max_status` | Count |
|---|---|
| `different-approach` | 36 |
| `better-elsewhere` | 13 |
| `unsure` | 1 |

By category: timeline/cueing/show control 11, workflow/authoring 10,
data/tables/scripting 8, control surface/UI building 5, video I/O & playback
5, rendering/3D 4, GPU compute/shaders 4, networking/sync 2, audio 1.
Confidence: 23 high, 27 medium.

The new items add one field to the schema, `advice`: what a Max patcher should
do or take from the comparison.

`touchdesigner_insights.md` gained section 16, "Shared concepts, different
approaches", ending in "Where Max is ahead" (MIDI learn, presets with
interpolation, event timing, tempo-relative time, audio, stepping through a
patch, recording a control, presentation mode, parameters over OSC, string and
array objects).

**Three things in the repo this pass ran into** (not changed; outside this
folder):

- `patching/MAX_PATCHING.md` recommends `line 0.` for Jitter / GL parameters.
  The `jit.line` refpage describes it as the frame-synced replacement.
- `scans/c74-forum/forum_insights.md` says `@depth_enable 1` on `jit.world`
  for layering and `patching/MAX_PATCHING.md` says `@depth_enable 0`. Max's
  userguide page on depth testing and layering says to turn depth testing off
  to use `@layer`.
- Max has no black-render checklist like TouchDesigner's
  `Why is My Render Black`; one would fit in `patching/MAX_PATCHING.md`.

**Inventory after session 2**

| Group | Pages | Extracted | Skipped | Pending |
|---|---|---|---|---|
| TOP operators | 154 | 76 | 0 | 78 |
| CHOP operators | 175 | 113 | 0 | 62 |
| SOP operators | 115 | 4 | 0 | 111 |
| POP operators | 108 | 12 | 0 | 96 |
| DAT operators | 77 | 56 | 0 | 21 |
| MAT operators | 15 | 6 | 1 | 8 |
| COMP operators | 46 | 30 | 0 | 16 |
| palette (ready-made components) | 172 | 32 | 0 | 140 |
| concepts | 138 | 52 | 12 | 74 |
| glossary | 165 | 85 | 3 | 77 |
| operator topics | 14 | 13 | 0 | 1 |
| interface | 6 | 1 | 0 | 5 |
| uncategorized (many are concept pages) | 250 | 84 | 57 | 109 |
| python reference | 774 | 0 | 0 | 774 |
| release notes | 45 | 1 | 0 | 44 |
| operator help fragments | 27 | 2 | 25 | 0 |
| legacy tscript | 1 | 0 | 1 | 0 |
| **Total** | **2,282** | **567** | **99** | **1,616** |

**For a later pass on this theme:** the Python class pages behind the points
above (`Par Class`, `Page Class`, `Run Class`, `oscinDAT Class`,
`midioutCHOP Class`), `Bind CHOP` and `Geometry COMP`'s third instance page in
full, `Render TOP` in full for draw order, `Palette:gestureCapture`,
`Palette:chromaKey`, and the remaining CHOPs that shape control data
(`Cycle CHOP`, `Extend CHOP`, `Resample CHOP` in full, `Sort CHOP`,
`Reorder CHOP`). On the Max side, the custom feedback wiring and the
frame-driven movie sync should be tried in Max before they are relied on.

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

## Session 3 (system model) — 2026-10-02

**Purpose.** Write TouchDesigner's column of the system-level comparison
against the 20 dimensions in `scans/max-gaps/SYSTEM_DIMENSIONS.md`. Earlier
sessions compared features; this one describes how the system as a whole
handles evaluation, time, data, state, naming and structure.

**Output.** `touchdesigner_system_model.json`: 23 items, one per dimension
plus three added ones:

- 21 *What a connection is*: a wire does not move data, it says where to
  fetch it; references by path, expression or export are drawn as dashed
  links.
- 22 *Flags as a second state layer*: every node has on/off states outside
  its parameters (Lock, Bypass, Cooking, Immune, Render …) that do not cook
  and cannot be exported to.
- 23 *The network as queryable data*: operators, parameters, errors and
  timing come back as tables and channels (OP Find DAT, Parameter DAT,
  Error DAT, Perform CHOP).

**How the pages were read.** Wikitext fetched with
`enumerate_touchdesigner.py --fetch` into the session scratchpad and read
there. 74 titles requested, 73 came back; `COMP Common Page` does not exist
under that name (the component common page is `COMP Other Common Page`).

- 18 pages newly read and marked `extracted`: `Network Editor`, `Pane`,
  `Node`, `Wire`, `Link`, `Display Flag`, `Render Flag`, `Selected Flag`,
  `Write a CPlusPlus Plugin`, `Thread Manager`, `Performance Monitor Dialog`,
  `Startup Errors Dialog`, `Licensing`, `Dialogs:Preferences Dialog`,
  `MacOS Environment Variables`, `COMP Other Common Page`,
  `CHOP Common Page`, `TDJSON` (the last two were `skipped` as help
  fragments or not yet read).
- 58 pages re-read for system-level detail (already `extracted`; their
  notes now say so; `Window COMP`, `Pattern Matching`, `Custom Operators`
  and `Panel` were only skimmed): among them `Cook`, `Dependency`, `Event`,
  `Procedural`, `Time Slicing`, `Parameter`, `Parameter Mode`, `Export`,
  `Binding`, `Network Path`, `Operator Shortcuts`, `Component`, `Clone`,
  `Replicator COMP`, `Extensions`, `Component Time`, `Time COMP`, `Timeline`,
  `Absolute Time`, `Perform Mode`, `Engine COMP`, `TouchEngine`, `Undo`,
  `Flag`, `Storage`, `Virtual File System`, `Optimize`, `TouchPlayer`,
  `Error DAT`, `Syncing Multiple Computers`, `Project Packager`, `Python`.
- `MacOS Environment Variables` and `TDJSON` were fetched and skimmed but
  contributed nothing to the model.

**Things found worth recording**

- The `Time Slicing` page gives the maximum time slice as 200 ms; the
  `Dialogs:Preferences Dialog` page describes the same preference in frames
  with a default of 6. The two pages disagree.
- No page read documents a "Realtime" flag directly; it is mentioned in
  passing on `Syncing Multiple Computers` (run with realtime off so no frame
  is skipped) and on `Engine COMP` (an info channel for the realtime flag).
- `COMP Other Common Page` is where external `.tox` loading, Load on Demand,
  clone settings, shortcuts and relative-path behaviour are defined. It is
  the most system-level page among the "help fragments" skipped in
  session 1.

**Not read, and worth reading for this theme:** `Dependency Class`,
`Par Class`, `Project Class`, `Render TOP` in full (draw order),
`Palette:synchroServer` / `Palette:synchroClient`, `Window COMP` in full,
and the `Expose Flag` page.
