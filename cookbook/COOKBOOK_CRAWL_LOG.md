# Max Cookbook Crawl Log

Tracks progress of the Max Cookbook (Christopher Dobrian / UC Irvine) knowledge
crawl. Each session reads this log to see what has been covered, picks the next
focused area, downloads + analyzes patches, appends entries to
`cookbook_insights.md`, and updates this log.

Source: <https://music.arts.uci.edu/dobrian/maxcookbook/>

The cookbook lists 741 recipes alphabetically. Each recipe page has a Chapter
taxonomy (MSP, Jitter, Max, MIDI, etc.), Keywords, a body explanation, and one
or more downloadable example patches.

## How to use this log

- **Before starting a session**: read the "Resume point" section, pick the next
  focused chapter or thematic cluster.
- **During the session**: download patches with the enumerator, then **read each
  patch in full** (signal flow, all box text, non-obvious idioms). The insights
  live in the patches, not the page text.
- **At end of session**: update "Coverage", "Resume point", and "Queue".

## Tooling — the canonical recipe

```bash
# One-time bootstrap (already done once). Pulls slugs from the alphabetical
# examples list saved at /tmp/cookbook_recipes_raw.json.
python3 cookbook/enumerate_cookbook_recipes.py --bootstrap

# Show coverage by status and by chapter.
python3 cookbook/enumerate_cookbook_recipes.py --status

# Fetch chapter/keywords/attachments metadata for the next N pending recipes.
python3 cookbook/enumerate_cookbook_recipes.py --scan-meta --limit 50

# Scan the full corpus (~4 min at 300ms/recipe). Safe to repeat — already
# scanned recipes are skipped.
python3 cookbook/enumerate_cookbook_recipes.py --scan-meta

# Download attachments for one chapter — a session-sized chunk.
python3 cookbook/enumerate_cookbook_recipes.py --download --chapter MSP --limit 10
```

State file: `cookbook/cookbook_crawl_state.json`. Per-recipe status is one of
`pending` → `scanned` → `downloaded` → `scraped`, plus `skipped` for recipes
with no attachment. Downloads live in `/tmp/cookbook/<slug>/` (kept out of the
repo — only the insights and state file are tracked).

## Reading a downloaded patch

`.maxpat` files are JSON. Quick survey of every box's text:

```bash
python3 -c "import json,sys; p=json.load(open(sys.argv[1]))['patcher']; \
    print('\n'.join(b['box'].get('text', b['box']['maxclass']) \
                    for b in p['boxes']))" /tmp/cookbook/<slug>/<file>.maxpat
```

For a richer view, open in Max; for non-Max environments, parse the JSON
directly — every box has `maxclass`, `text` (for `newobj`/`message`/`comment`),
`numinlets`/`numoutlets`, and a `patching_rect`.

## Coverage

Chapters or thematic clusters whose insights have been folded into
`cookbook_insights.md` (or deliberately skipped as low value).

| Date | Area | Recipes scanned | Patches downloaded | Insights written | Notes |
|------|------|-----------------|--------------------|------------------|-------|
| 2026-05-01h | First chunk: MSP envelope/amplitude (11 recipes) — `ab-audio-crossfade`, `adjusting-audio-amplitude`, `adsr-filter-envelope`, `alter-phase-sinusoid-milliseconds`, `amplitude-and-decibels`, `amplitude-inversely-proportional-distance`, `arpeggiate-harmonic-series`, `audio-amplitude-control`, `calculating-doppler-shift-moving-virtual-sound-sources`, `subpatch-suitable-use-poly`, `variation-simple-envelope-follower` | 11 (full corpus scan running in background, paused mid-run for this chunk) | 11 (saved to `/tmp/cookbook/<slug>/`) | 16 entries (11 Audio/MSP, 5 Patching Patterns, 3 PROMOTION-CANDIDATES) | Each `.maxpat` read in full via the box-text dump approach (see `Reading a downloaded patch` above). |
| 2026-05-01j | Second chunk: Jitter matrix-manipulation (12 recipes) — `combine-2-matrices`, `submatrices-and-masking`, `bidirectional-jitmatrix-scroll`, `rotate-zoom-and-offset-video-using-jitrota`, `alpha-masking`, `reveal-sections-image-alphablend`, `crossfade-and-blur-movie-files-using-jitxfade-and-jitmatrix`, `get-column-jitmatrix`, `split-screen-video`, `adjust-brightness-and-contrast-1-plane-char-matrix`, `using-jitter-store-numerical-data`, `stretch-1d-matrix-2d-matrix` | 12 (already in state from 2026-05-01j corpus scan) | 12 (saved to `/tmp/cookbook/<slug>/`) | 12 entries in Video/Jitter (3 PROMOTION-CANDIDATES) | Cluster picked via keyword filter: `{'jit.op','jit.pack','jit.unpack','jit.spill','jit.rota','jit.alphablend','jit.xfade','jit.matrix','jit.scissors','jit.glue','jit.dimmap','jit.repos'}`. |

## Resume point

Corpus scan is complete (735/741 with chapter+keywords+attachments; 5
skipped for no attachment; 1 returned a 404 — slug `204`, possibly typo).
**Final chapter distribution** (run `--status` to refresh):

| Chapter | Recipes |
|---------|---------|
| Max | 350 |
| MSP | 263 |
| Jitter | 118 |
| Max for Live | 7 |
| MIDI | 1 (most MIDI recipes are tagged `Max` or `MSP`; search keywords for `midi`/`ctlin`/`notein`/`makenote` to find them) |

Chunks done so far:
- 2026-05-01h — **MSP envelope/amplitude (11 recipes)** → 16 insights, 3 PROMOTION-CANDIDATEs.
- 2026-05-01j — **Jitter matrix-manipulation (12 recipes)** → 12 insights, 3 PROMOTION-CANDIDATEs.

Pick one of these for the next session (search by keyword via the state
file rather than the raw chapter list — Cookbook recipes are tagged finely):

- **Jitter — second chunk: GL / 3D rendering.** Filter on `jit.gl.render`,
  `jit.gl.videoplane`, `jit.gl.gridshape`, `jit.gl.mesh`, `OpenGL`. ~30
  recipes. Foundation for the more advanced GL forum_insights.md material.
- **Jitter — third chunk: video sources / feedback / effects.** Filter on
  `jit.movie`, `jit.qt.movie`, `jit.grab`, feedback keywords, `jit.fastblur`,
  `jit.repos`. ~40 recipes (note: `jit.qt.movie` is deprecated; many of these
  patches predate `jit.movie`'s arrival but the patterns transfer).
- **MSP — buffer / loop / sampling chunk.** Filter on keywords like
  `buffer~`, `groove~`, `play~`, `record~`, `wave~` (~30 recipes). Tight
  cluster around sample manipulation idioms.
- **MSP — synthesis chunk.** Filter on `cycle~`, `saw~`, `tri~`, `phasor~`,
  `noise~`, `pink~` plus `FM`/`AM`/`additive` keywords. ~25 recipes.
- **Max (general) — sequencer/composition chunk.** Filter on `metro`,
  `counter`, `coll`, `seq`, `transport`, `timepoint`, `qlist`. ~30 recipes.
  Likely the biggest Patching Patterns contributor.
- **MIDI chunk.** Filter on `ctlin`, `notein`, `makenote`, `midiformat`,
  `midiparse`. ~20 recipes scattered across Max/MSP chapters.

Use the keyword filter via Python on `cookbook_crawl_state.json` to build
the next chunk — see the snippet pattern in 2026-05-01h (the
envelope/amplitude pick used `keywords_of_interest = {'line~', 'function',
'adsr~', 'envelope', 'gate~', 'fade', 'amplitude'}`).

## Queue

Topics, recipes, or cross-references spotted but not yet crawled.

- (empty — populate as you crawl)

## Skipped

Recipes visited but not worth extracting from (no attachment, trivial wrapper,
content fully duplicated by an already-extracted recipe). One line each so
future sessions don't re-evaluate.

- (none yet)

## Link-following protocol

On every page, follow linked external resources and classify:

- **Small resource** (single page, self-contained doc): scan immediately and add
  insights inline.
- **Large resource not already addressed** (multi-page site, book, course): note
  it here in the log and surface a task proposal to the user — do not auto-add
  to the queue.
- **Already addressed** (forum.cycling74.com, installed package docs covered by
  `packages/`): note the overlap and skip.

## Promotion pass

At the end of each session, scan `cookbook_insights.md` for
`[PROMOTION-CANDIDATE]` entries and propose adding them to the appropriate
repo file (`SPEC_REFERENCE.md`, `MAX_PATCHING.md`, or the relevant package
entry in `packages/package_objects.json`).

## Session notes / process observations

- (none yet — populate as the crawl proceeds)
