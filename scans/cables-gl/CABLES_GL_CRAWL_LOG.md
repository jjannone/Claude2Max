# cables.gl Documentation Crawl — Session Log

Crawl of the official cables.gl documentation and op reference. cables.gl is
a browser-based node-patching tool for real-time graphics, by undev, with a
desktop build called cables standalone. The purpose is to learn how the tool
works and to list things Max does not have, or that cables arguably does
better.

Companion files in this folder:

- `enumerate_cables_gl.py` — builds and refreshes the state file. Standard
  library only, runs on Python 3.9.
- `cables_gl_crawl_state.json` — one entry per doc page, op namespace and
  op, with `status` (`pending` / `extracted` / `skipped`).
- `cables_gl_insights.md` — how the tool works, by topic, for a Max reader.
- `cables_gl_max_gap_candidates.json` — 42 candidate capabilities, each with
  the Max-side check that was run.

Same pattern as `scans/userguide/` and `scans/cookbook/`.

## Sources

| Source | URL | Used for |
|---|---|---|
| Sitemap | `https://cables.gl/sitemap.xml` | Every doc page and op page URL |
| Documentation index | `https://cables.gl/docs/docs` | Page titles; cross-check on the sitemap |
| Op index | `https://cables.gl/ops` | Every namespace and op, each op with a one-line digest |
| Doc pages | `https://cables.gl/docs/...` | The prose documentation |
| Namespace pages | `https://cables.gl/ops/<namespace>` | Extension descriptions |
| Op pages | `https://cables.gl/op/<full op name>` | Summary, documentation, port list |

All of these are plain server-rendered HTML. `curl` and `urllib` read them
with no JavaScript, so the GitHub repositories were not needed.

**Not used: `https://cables.gl/api/ops`.** It returns the op list as JSON,
but `robots.txt` disallows `/api/`, so the enumerator leaves it alone. The
sitemap and the op index give the same list.

## Inventory (2026-10-02)

| Kind | Count | How counted |
|---|---|---|
| Doc pages | 130 | Sitemap and docs index agree exactly |
| Op namespaces | 98 | Section headings on the op index |
| Ops | 1,370 | Op index. The sitemap has 1,358 of them; 12 are in the index only |
| **State entries** | **1,598** | |

The sitemap also holds 2,023 public patch pages and some user, team and
patchlist pages. Those are not documentation and are not in the state file.

Ops by top-level namespace: Gl 359, Array 185, Extension 111, Html 94,
Math 83, String 63, Devices 48, Graphics 48, Json 42, Trigger 41, Data 34,
Ui 34, TimeLine 26, WebAudio 25, Sidebar 22, Boolean 21, Vars 21, Number 20,
Anim 17, Cables 16, Color 14, Website 11, Templates 10, Debug 9, Date 8,
Audio 5, Net 3.

Old op versions are not listed. The op index shows only the current version
of each op, so `Ops.Gl.Texture_v3` is there and `Ops.Gl.Texture` is not.

## State file format

A dict. The key is a doc page's URL, an op's full name, or
`namespace:<name>`. Each value has `title`, `url`, `group`, `status`,
`session`, `notes`, plus three extra fields:

- `kind` — `doc`, `namespace` or `op`.
- `digest` — the one-line description from the op index (empty for docs).
  This is the site's own text, kept short, so the file can be searched.
- `listed_in` — for ops, whether the sitemap, the op index or both list it.

`group` is `docs/<section>` for a doc page and the namespace for an op.

## Sessions

### 2026-10-02 — Session 1 (Opus 5.5)

**Enumerated**: everything, 1,598 entries.

**Read**:

| What | Count | Status now |
|---|---|---|
| Doc pages | 130 of 130 | `extracted` |
| Namespace pages | 98 of 98 | `extracted` |
| Op index page | 1 (all 1,370 digests) | not an entry of its own |
| Op pages | 115 of 1,370 | `extracted` |
| Op pages not opened | 1,255 | `pending` |

What "read" means for each:

- **Doc pages.** All 130 fetched and read in full. Several are section
  index pages with only a list of child links, and many FAQ pages are a
  paragraph or two. The 11 shortest are marked as such in `notes`.
- **Namespace pages.** All 98 fetched. Each lists the same ops and digests
  as the op index, which was read in full. The 25 `Ops.Extension.*` pages
  also carry a short description and a maintainer, and those were read.
- **Op pages.** 115 chosen because the digest suggested something Max may
  lack, or because the op is central (`MainLoop`, `ImageCompose`,
  `CustomShader`, `Sequence`, `Repeat`, `SubPatch`). Each page gives a
  summary, a documentation block, and the input and output ports.
- **The other 1,255 ops** are `pending`. Only their one-line digest has been
  read. Their `notes` say that.

**Max side.** Each candidate was checked against the local Max install and
the repo's package library. The checks and what came back are in each
candidate's `max_check` field. The sources were:

- `C74/interfaces/obj-qlookup.json` — 1,323 object names.
- 1,940 `.maxref.xml` files under `C74/` — names and digests, and the full
  attribute and message lists of about 35 objects cited as closest matches.
- `C74/docs/userguide/content/` — keyword search, with the matched passages
  read in a few files. No userguide topic was read in full.
- `python3 packages/query_packages.py search` — about 40 terms.

**Result**: 42 candidates. By status: 26 partial, 9 unsure, 6 absent,
1 better-elsewhere. The last one is compute shaders, which this machine has
through the Compute package.

## Fetch problems

None. Every request returned HTTP 200. The enumerator ran three times and a
dry run once, with the same counts each time.

Things to know about the site:

- Each doc page repeats the whole navigation list (about 3 KB) before its
  own text. Strip it before reading.
- Each op page prints its documentation twice, once rendered and once as
  Markdown source.
- Many op pages have no documentation text, only ports. This is common in
  the newer extensions: `Ops.Extension.WebGpu`, `Ops.Extension.Ai`,
  `Ops.Extension.HtmlToTexture`, `Ops.Extension.Rapier3d.SoftBody`. Claims
  about those ops rest on names and ports alone, and the insights file and
  the candidates say so where it matters.

## Not read, and why

- **Video tutorials.** Many doc pages point to YouTube for the detail. The
  timeline page is the main case: it is five steps long and sends the reader
  to videos and a blog post. Nothing from a video is in the insights file.
- **The cables blog and changelog** (`https://cables.gl/changelog`). Not
  part of the docs tree.
- **Generated API docs** at `https://jsdoc.cables.gl/` (core, ui,
  standalone). Listed on a doc page; not fetched.
- **Example patches.** Each op page links one. A patch page is an editor,
  not text.
- **GitHub repositories** (`cables`, `cables_ui`, `cables_electron`,
  `cables_extensionops`, `cables_dev`). The site was readable, so they were
  not needed. Op source code is there.

## Known weak spots in this session's output

- **Timeline.** The largest candidate rests on the shortest doc page. How
  keys, easing and curves work in practice was not read anywhere.
- **Max userguide.** Searched by keyword only. A feature described in other
  words would be missed. The candidates on profiling, flow display and
  collaboration depend on this.
- **Packages not installed.** A Max package that is not on this machine was
  not searched. Mediapipe and VR are the candidates most likely to have one.
- **`max_status`.** Where a Max object looked close, the status is `partial`
  even if the fit is loose. Treat `partial` as "look closer", not as "Max
  has it".

## What the next session should read first

1. **Timeline in depth.** Find a written source: the blog post linked from
   `docs/2_1_timeline/animation`, or the `cables_ui` repository. Then read
   the 19 `Ops.TimeLine` op pages still pending.
2. **`Ops.Gl.ShaderEffects`**, the 32 pages still pending, to settle what
   the effect modules can do. This is the strongest rendering candidate.
3. **`Ops.Gl.ImageCompose`** and its Math and Noise parts, 105 pages
   pending. Compare against Max's `jit.fx.*` (83 refpages) and
   `jit.gl.pass` effects. Left out of the candidates this session because
   Max looks well covered.
4. **`Ops.Extension.WebGpu`**, 21 pages pending, and the WebGPU source in
   `cables_extensionops`, since the op pages have no documentation.
5. **`Ops.Devices`**, 42 pages pending: the rest of MIDI, keyboard, mouse,
   touch and WebXR.
6. **`Ops.Sidebar`** and **`Ops.Html`**, 108 pages pending, for the
   UI-building candidates.
7. **`Ops.Array`**, 184 pages pending. Low priority. It is a utility set
   and Max's matrix and list objects cover the ground.

Run `python3 scans/cables-gl/enumerate_cables_gl.py` first. It keeps every
`status`, `session` and `notes` already in the state file, adds new ops as
`pending`, and flags entries that have left the site with
`gone_from_site` without deleting them. `--status` prints coverage.
`--dry-run` fetches and reports without writing.
