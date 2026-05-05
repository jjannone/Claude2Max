# Cycling '74 Projects Crawl — Log

Tracks progress of the **Cycling '74 Projects Crawl** task in `TASK_QUEUE.md`.
Source: <https://cycling74.com/projects> — the community projects gallery.

## Recipe

The gallery exposes a clean Next.js JSON payload (`__NEXT_DATA__` →
`pageProps.postData.results[]`). No HTML scraping needed —
`enumerate_c74_projects.py` walks the JSON directly. Each listing-page
fetch returns 10 projects with summary metadata; per-project detail fetch
adds the full body for inline-content detection.

| Stage | Tool | Output |
|---|---|---|
| Enumerate one or more pages (cheap — one HTTP per page) | `python3 c74-projects/enumerate_c74_projects.py --pages 1-5` | tab-separated listing: topic, slug, title, website_url |
| Scan project bodies for inline MCT or attachment nodes (one extra HTTP per project — slower) | `… --pages 1-5 --detect-content` | listing + mct/attach counts |
| Filter to projects with inline artifacts | `… --has-content` (or `--has-mct`, `--has-attach`) | only the rare projects with inline patches |
| Download inline artifacts (rare on the projects gallery) | `… --download /tmp/c74-projects` | files saved per slug; state marked `downloaded` |
| Mark new/updated only (vs state) | `… --diff` | skips already-scraped unchanged projects |
| Just print the gallery total | `… --total` | total + perPage |

State file `c74_projects_crawl_state.json` records every enumerated project
with a freshness signal (`modified_at`). Re-running with `--diff` shows
only NEW or UPDATED.

## Why this differs from the forum and cookbook crawls

- **Forum threads** embed patches inline as MCT (`patcher`) blocks — the
  patch travels in the JSON. `c74-forum/enumerate_forum_threads.py` decodes
  them.
- **Cookbook recipes** attach `.maxpat` files to each recipe page; we
  download and analyze the attachment.
- **Projects** rarely embed patches at all. The patch (if free) usually
  lives at an external URL: GitHub, MaxForLive.com, gumroad, the author's
  personal site, the Ableton M4L marketplace, or a commercial product page.
  Many projects are commercial — paid devices or installations that were
  never source-released. The metadata still has indexing value (a catalog
  of "what people built with Max"), but the *insight* yield from any given
  project is much lower than from a forum or cookbook artifact.

This shapes the workflow:

1. **Enumerate** → metadata-only catalog goes to `c74_projects_database.md`.
2. **Triage**: for each project, decide if a free patch is reachable.
   - Inline MCT or attachment → download + analyze (rare — 0/110 so far).
   - External URL pointing to GitHub, MaxForLive.com, GitLab → fetch + analyze (~6% so far).
   - External URL pointing to a paid store (gumroad, ko-fi, vstopia, vendor product page) → catalog-only; mark `commercial`.
   - External URL pointing to an author website → manual eyeball: is it a download page or a product-purchase page? Mark `author-site` until classified.
   - No external URL → showcase-only; catalog-only; mark `showcase`.
3. **Insights**: only when an actual patch is in hand. Write to
   `c74_projects_insights.md`. Mark entries `[PROMOTION-CANDIDATE]` where
   they'd improve `patching/MAX_PATCHING.md`, `SPEC_REFERENCE.md`, or
   `packages/package_objects.json`.

## Coverage

| Pages enumerated | Projects captured | Inline patches | Free-extractable (all sources) | Commercial | Author-site unclassified | Showcase |
|---|---|---|---|---|---|---|
| 1-21 (of 183) | 210 | 0 | 37 (15 GitHub + 4 m4l + 2 drive + 1 dl-page + 15 author-free) | 118 | 6 | 49 |

Total gallery size: **1,822 projects across 183 pages (10/page)**.

The era-split hypothesis from the page 1-11 survey was confirmed in the page 12-21 extension:

| Cohort | Total | Free | Yield rate |
|---|---|---|---|
| Pages 1-11 (2024-2026) | 110 | 7 (raw) → 12 (after triage) | ~11% |
| Pages 12-21 (2021-2023) | 100 | 12 (raw) → 25 (after triage) | ~25% |

Older era is **~5× more open-source** than the recent-launch tier. The triage
pass added 15 free-author entries to the raw-URL-pattern total of 22, plus 3
fileshare/download-page entries — final 37/210 free-extractable.

## Resume point

Three productive directions:

1. **Analysis pass on the 37 free-extractable** — clone GitHub repos, fetch MaxForLive devices, open patches in Max, write insights to `c74_projects_insights.md`. Highest insight-yield-per-effort.
2. **Continue forward — pages 22-31** — extends the older-era sample to test whether the open-source rate climbs further at deeper pages.
3. **Sample-deep at pages 50, 100, 150** — confirms whether the era-trend is monotonic or hits a floor.

## Findings — pages 1-21 survey (2026-05-03)

The detailed gallery-shape observations live in `c74_projects_database.md`
under "Observations on the Cycling '74 Projects Gallery" — that section is
maintained per-session and is the authoritative log of meta-patterns. The
LOG keeps the per-session pointer so future Claude instances can find both.

**Pages 1-11 (2024-2026 vintage):**
- 7 raw free-external by URL pattern (5 GitHub + 2 MaxForLive.com)
- After triage: 12 free-extractable total
- 59-77 commercial / 10-49 showcase / residual author-site (mixed)

**Pages 12-21 (2021-2023 vintage):**
- 12 raw free-external by URL pattern (10 GitHub + 2 MaxForLive.com) — 5× more than recent tier
- After triage: 25 free-extractable total
- Older pages have far more academic GitHub-hosted projects

**Combined 1-21 status distribution: 37 free-extractable / 118 commercial / 49 showcase / 6 still-ambiguous out of 210.**

**Triage tooling notes** (developed during 2026-05-03b):

- URL-pattern matcher in `enumerate_c74_projects.py` handles the easy cases (github.com, *.github.io, maxforlive.com, *.gumroad.com, gum.co, ko-fi.com, drive.google.com, dropbox.com, mega.nz, youtube/vimeo/bandcamp).
- For "author-site" residual, lexical scan of the `website_url` body for buy-keywords (`add to cart`, `purchase`, `usd $/€/£`, `paypal`) vs free-keywords (`free download`, `open source`, `MIT/GPL`, `creative commons`) gives a verdict in most cases. ~70 URLs per minute is the practical fetch rate.
- Manual academic-domain overrides (`metacreation.net`, `cosmolab.faselunare.com`, etc.) catch the academic free-pattern that the lexical heuristic misses (no buy-words but no explicit free-words either).
- `*.gumroad.com` URLs sometimes ship with leading whitespace in the gallery JSON; classifier strips before parsing.
- Slugs containing non-ASCII characters (em-dash, accented Latin, Spanish ñ) crashed the original `fetch_project()` — patched 2026-05-03 to URL-encode via `urllib.parse.quote(slug, safe='/-')`.

**The 37 free-extractable candidates** are listed in
`c74_projects_database.md` "Free-extractable candidates" section, organized
by source (GitHub / MaxForLive / Drive / direct-download / author).

**Notable archive-quality finds** (high pedagogical value):

- **Andy Farnell's "Designing Sound" Max patches** — <https://github.com/georgeNikmus/Designing-Sound-Max-Patches>
- **Curtis Roads' "Theory and Technique of Electronic Music" Max patches** — <https://github.com/georgeNikmus/The-Theory-and-Technique-of-Electronic-Music-Max-Patches>
- **Linux audio plugins for Max/MSP** — <https://github.com/georgeNikmus/Linux4Max>
- **Facet** (mjcella) — actively-maintained algorithmic composition system — <https://github.com/mjcella/facet>
- **MaxZine vol 1** (Spanish-language community fanzine) — <https://github.com/mrtnRivera/MaxZine1_Diccionarios>

**Strategic implication unchanged**: the projects gallery's primary value
is *catalog* (answering "is there an existing M4L device that does X?")
rather than *insight extraction* like the forum and cookbook crawls. But
the older era yields enough academic free patches that an analysis pass
on the highest-value candidates will produce real `patching/MAX_PATCHING.md`-quality
insights. Andy Farnell + Curtis Roads alone should be a substantial
pedagogical contribution.

## Findings — first session (2026-05-03, page 1 only)

Initial 10-project sample (now subsumed into the pages 1-21 survey above).
Worth keeping for the audit trail: page 1 was a worst case for free-yield
(0 free-extractable, 7/10 commercial, 3/10 showcase) — extension to pages
2-21 plus triage recovered 37 candidates total.

## Tooling

- `enumerate_c74_projects.py` — cataloger; full CLI documented in `--help`.
- `c74_projects_crawl_state.json` — per-project state with freshness signal and decision.
- `c74_projects_database.md` — searchable catalog (deliverable for the indexing axis).
- `c74_projects_insights.md` — patching insights from any free patches we do find (deliverable for the patterns axis).
