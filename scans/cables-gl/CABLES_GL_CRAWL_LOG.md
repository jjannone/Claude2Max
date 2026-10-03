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
- `cables_gl_max_gap_candidates.json` — 87 candidates, each with the
  Max-side check that was run: 42 gaps from session 1, and 45 shared
  concepts done differently from session 2.

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

### 2026-10-02 — Session 2 (Opus 5.5): shared concepts, different approaches

**Purpose.** Session 1 looked for things Max lacks. This pass looked at
things both tools have, to find where the cables way is better, simpler or
just different in a way a Max patcher should know. The output is advice for
someone working in Max.

**Read on the cables side**:

| What | Count | Status now |
|---|---|---|
| Op pages newly read | 380 | `extracted`, `session` 2026-10-02, with a note |
| Op pages read again (already `extracted`) | 23 | unchanged |
| Doc pages read again | 15 | unchanged (all were `extracted`) |
| Op pages read in total | 495 of 1,370 | |
| Op pages still not opened | 875 | `pending` |

Newly read ops by top-level namespace: Gl 105, Array 29, Trigger 27,
Math 25, Devices 23, String 18, Ui 17, Anim 14, Graphics 14, Json 14,
Number 14, WebAudio 14, Sidebar 12, Boolean 8, Cables 7, Debug 7,
TimeLine 7, Vars 7, Data 6, Html 4, Color 3, Audio 2, Date 1, Templates 1,
Website 1.

**207 of the 380 newly read op pages have no documentation text**, only a
one-line summary and a port list. Each such entry says so in its `notes`.
Port lists were still useful: most of this pass's findings come from which
ports an op has (an easing dropdown, a mask input, a Finished trigger, a
Found output).

Doc pages read again for detail: `dev_callbacks`, `dev_ports_trigger`,
`guidelines`, `image_composition`, `usual_suspects`, `dev_ops`,
`dev_ports_array`, `dev_ports_value`, `lights`, `dev_gui_ui_attributes`,
`subpatchops`, `arrays` (performance), `beginner2_transformations`,
`shader` and `dev_creating_ports`.

Same method as session 1: plain HTTP requests to `https://cables.gl/op/<name>`
and `https://cables.gl/docs/<path>`, about one every 0.35 seconds. `/api/`
was not used. Every request returned HTTP 200.

**Read on the Max side.** A comparison is only as good as its Max half, so
each item was checked before it was written:

- Refpages (`.maxref.xml`) of about 180 Max objects: digest, description,
  attribute names and message names for all of them, and the full text of
  the attributes and outlets each candidate relies on. They include the
  shared GL attribute page `jit.group-gl`, the Jitter Tools, Jitter Geometry
  and jit.mo packages inside the Max install, and the `ease` package in
  `~/Documents/Max 9/Packages`.
- Userguide topics: `jitter/depth_layer_blend` (in full),
  `jitter/render_passes` (first part), `jitter/jxs_file_format` (the param
  and bind passages), `integers_vs_floats`, `mapping`, `conversion`
  (headings), and keyword passages of `dictionaries`, `arrays`,
  `jitter/textures` and `jitter/graphics_processing`.
- The object registry, for names that do not exist: nothing contains "lfo",
  "spring", "perlin", "valid", "default" or "fallback".
- Repo docs, by keyword only: `patching/MAX_PATCHING.md`,
  `patching/JITTER_JS_PATCHING.md`, `scans/c74-forum/forum_insights.md` and
  `scans/packages/tutorials_insights.md`, for known Max pitfalls on the same
  ground (draw order, texture cords, loading order, fast sources into v8).
- `packages/query_packages.py search`: spring, easing, perlin, "low
  frequency", smooth, threshold.

Nothing was tested in a running Max. Where a claim about Max behaviour goes
past what a refpage says, the candidate's `notes` say so.

**Result**: 45 candidates appended to `cables_gl_max_gap_candidates.json`
(now 87). The first 42 are byte-for-byte unchanged. By status:
33 `different-approach`, 12 `better-elsewhere`, 0 `unsure`. By category:
data/tables/scripting 11, rendering/3D 10, workflow/authoring 9,
timeline/cueing/show control 5, control surface/UI building 4,
GPU compute/shaders 3, video I/O & playback 2, audio 1. Each new item has an
`advice` field: a pattern to copy in Max, a Max attribute to prefer, or an
object worth building.

`cables_gl_insights.md` gained section 17, "Shared concepts, different
approaches", with a "Where Max is ahead" subsection and a "Not settled"
subsection.

**Strongest findings** (full text in the candidates file):

1. Draw order. cables draws in trigger order; Max's userguide says objects
   in the same layer draw in an indeterminate order.
2. `jit.world @fps` has no effect while `@displaylink` is 1, the Mac default.
3. Shader uniforms: a cables uniform is a port; a JXS uniform also needs a
   `<param>` and a `<bind>` tag, and is set by message.
4. Image effects in cables each carry blend mode, amount and mask; a Max
   `jit.fx` object has none of the three.
5. Easing is a dropdown on most cables ops; in Max it is the `ease` package.
6. Max has no spring for a plain number and no object that tests whether a
   texture is valid.
7. Loading: cables has patch-wide loading status; Max has `loadbang` and
   per-object done signals.
8. Failure reporting: cables ops have Found, Valid and Has Error outputs;
   Max reports to the console.
9. `jit.gl.node` can overwrite attributes on its children, which is Max's
   nearest match to a cables branch.
10. `jit.mo.time` is Max's frame-locked LFO, ramp, noise and delta-time
    source.

**Weak spots in this session's output**:

- No Max claim was tested in Max. The ones most worth a test: that
  `enable 0` on a `jit.gl.node` stops its children; what `dict` sends for
  `get` on a missing key; which message `jit.movie` sends when a read ends.
- `jit.fx`: only `jit.fx.blur`'s attribute list was read. The claim that
  `jit.fx` objects have no mix or mask rests on that one page plus the 83
  object names.
- cables variable scope, texture feedback and particles are not settled;
  see "Not settled in this pass" in the insights file.
- Third-party Max packages were searched for six terms only. An installed
  package may already hold a spring, an analysis abstraction or a loading
  gate.

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

### After session 2

Items 2, 3, 5, 6 and 7 above are partly done: `Ops.Gl.ShaderEffects` 4 more
pages read (28 pending), `Ops.Gl.ImageCompose` 23 read (82 pending), `Ops.Devices` 23
read, `Ops.Sidebar` 12 read, `Ops.Array` 29 read. Item 1 (timeline in depth)
and item 4 (WebGPU) are untouched. Still worth doing:

1. **Test the Max claims** listed under session 2's weak spots, in a running
   Max.
2. **Read the other 82 `jit.fx` refpages** for mix, mask and blend
   attributes, to settle the image-effect comparison.
3. **Texture feedback in cables**: find a written source or an example
   patch, since no op page explains the Clear switch.
4. **`Ops.Html`** (about 85 pages pending) and the rest of `Ops.Sidebar`,
   for the UI-building comparison with presentation mode.
5. **The rest of `Ops.Array`, `Ops.String` and `Ops.Json`** (about 250 pages
   pending), against `zl`, `array.*`, `string.*` and `dict.*`. Low priority.

## Session 3 (system model), 2026-10-02

Goal: describe how cables works as a system, against the 20 dimensions in
`scans/max-gaps/SYSTEM_DIMENSIONS.md`. Output: `cables_gl_system_model.json`,
24 items (the 20 dimensions plus four added: 21 values vs triggers, 22 the
browser as platform, 23 patches online with owners and permissions, 24
loading as an observable phase).

Method: the same curl fetch of server-rendered HTML as sessions 1 and 2. No
`/api/` use. Claims come from pages read this session or recorded in
`cables_gl_insights.md`.

Read this session:

- **Re-read docs** (already extracted): ui_walkthrough, keys, timeline
  animation, dev_ops, dev_callbacks, dev_ports_value, dev_ports_trigger,
  guidelines, subpatchops, object_ports, dev_gui_ui_attributes,
  dev_hello_op, dev_embed_vars, dev_embed_functions, embedding, multiplayer,
  files, standalone general and coding_ops, performance tools, profiler,
  technical FAQ, the docs index.
- **Re-read op and namespace pages**: MainLoop_v2, VarSetNumber_v2,
  VarGetNumber_v2, SubPatch, PatchInput, UIMode, Timer_v2, TimeLineTime,
  TimelineConfig, FreezeNumber, RenderAnim_v2, TimeDelta,
  TriggerOnChangeNumber_v2, Interval, Presets_v2, PatchInfo_v2,
  LoadingStatus_v2, Number.Preset, Trigger.Sequence, TriggerSend,
  Gl.Performance, GetSubPatchName; namespaces Ops.Vars and Ops.Cables.
- **Newly read** (were pending): TimeLine.AutoPlay, TimeLinePlay,
  TimeLineFrame_v2, TimeLineSetTime, Ui.Subpatch2Template,
  Ui.SubPatchInput, Html.Utils.PlayerControlPanel_v2, Date.Milliseconds,
  Cables.PatchFileList; and the blog post `https://blog.cables.gl/animations/`
  (linked from the timeline doc; added to the state file as
  `blog:animations`). blog.cables.gl has no robots.txt (404).

New facts this session, not in the insights file before:

- The timeline has repeat modes (off, repeat, mirror, offset), interpolation
  methods (linear, step, preset curves, bezier, clip), loop areas, and named
  reusable animation clips that update everywhere they are used (blog post).
- Editing an op's code in the web editor is a save, and the Hello Op
  tutorial then reloads the patch; the standalone watches op files.
- TriggerSend reaches into subpatches. Variable names are case sensitive.
- Preset stores its data on ports marked "used internally by op", which
  is how a preset survives a save: it is port state like any other.
- UIMode can report a "remote viewer" mode; no page explains it.

Still open (also in the JSON's `open_questions`): order among several
cables on one trigger output; whether variables have any per-instance
scope; SubPatchOp arguments and instance updating; whether an op can
rewire the graph at runtime; what the remote viewer is.
