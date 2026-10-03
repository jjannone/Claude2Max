# plugdata Gem Documentation Crawl — Session Log

A read of the documentation for Gem (Graphics Environment for Multimedia), the
OpenGL and video library for Pure Data, as it ships inside plugdata 0.9.3 on
this machine. Gem's Max counterpart is Jitter. The aim is to learn how Gem
works and to list what it does that Jitter does not, or does differently in a
way a Jitter patcher should know.

One of seven parallel scans. Pd vanilla / plugdata itself and the ELSE and
cyclone libraries are covered by sibling scans and are not touched here.

Companion files in this folder:

- `enumerate_plugdata_gem.py` — lists every local Gem file and the web pages
  that carry the rest of the documentation, and keeps the state file. Stdlib
  only, runs on Python 3.9. Re-running it never changes an entry's `status`,
  `session` or `notes`.
- `plugdata_gem_crawl_state.json` — one entry per file or page, keyed by path
  relative to `~/Documents/plugdata` or by URL: `title`, `path` or `url`,
  `group`, `status` (`pending` / `extracted` / `skipped`), `session`, `notes`.
- `plugdata_gem_insights.md` — how Gem works, for a reader who knows Jitter,
  each entry naming the file it came from.
- `plugdata_gem_max_gap_candidates.json` — 50 capabilities to compare against
  Max, each with what was read on the Max side and what it said.

## The sources

| Group in the state file | What it is | Where |
|---|---|---|
| `help` | One help patch per object, 238 of them | `Documentation/14.gem/*-help.pd` |
| `help-support` | Helper patches and shaders the help files use | `Documentation/14.gem/` |
| `examples/<folder>` | Example patches and their shaders, 17 folders | `Documentation/14.gem/examples/` |
| `manual` | The HTML manual and FAQ | `Documentation/14.gem/examples/Documentation/manual/` |
| `docs` | Release notes, known bugs, to-do list, a PDF primer | `Documentation/14.gem/examples/Documentation/` |
| `example-data` | Images, movies, a model, a font | `Documentation/14.gem/examples/data/` |
| `abstractions` | Gem objects that are Pd abstractions | `Abstractions/Gem/` |
| `web-github`, `web-github-help`, `web-github-extra`, `web-github-examples` | Upstream README, and help and example files missing from the plugdata copy | `https://github.com/umlaeute/Gem` |
| `web-plugdata` | plugdata's Gem fork and the release notes that mention Gem | `https://github.com/plugdata-team/…` |
| `web-gem-site` | Gem's home page | `https://gem.iem.at/` |

All local paths are under `~/Documents/plugdata/`. `Extra/Gem/` exists and is
empty.

**Where the concept-level documentation actually is.** The task expected it
online at gem.iem.at. That site could not be read (see Problems). The manual
turned out to be in the plugdata copy itself, under
`examples/Documentation/manual/`, and the same files are in the upstream
repository's `doc/` folder, which is why the enumerator does not list `doc/`
a second time. The manual is old and thin: its Particles, Input and Advanced
pages are placeholders. The real documentation of framebuffers, shaders,
multiple windows and particles is the help patches and the examples.

## Inventory (2026-10-02)

| Group | Listed | Extracted | Pending | Skipped |
|---|---|---|---|---|
| help | 238 | 238 | 0 | 0 |
| help-support | 8 | 3 | 4 | 1 |
| examples (17 folders, plus one Makefile) | 235 | 173 | 59 | 3 |
| manual | 37 | 16 | 0 | 21 |
| docs | 11 | 3 | 3 | 5 |
| example-data | 32 | 0 | 0 | 32 |
| abstractions | 18 | 18 | 0 | 0 |
| web (GitHub, plugdata, gem.iem.at) | 33 | 13 | 19 | 1 |
| **Total** | **612** | **464** | **85** | **63** |

579 entries are local files and 33 are web pages.
`python3 scans/plugdata-gem/enumerate_plugdata_gem.py --status` prints the
current counts by group without touching the network or the plugdata folder.

## Sessions

### 2026-10-02 — Session 1 (Opus 5.5)

**How the patches were read.** A `.pd` file is text: one record per box. A
small extractor (kept in the session scratch area, not in the repo) pulled out
three things from each file: the comment text, the object boxes, and the
message boxes. For the pix help files and the examples a second pass removed
the boilerplate lines every help file repeats ("GEM object", "Inlets:",
`KEYWORDS …`, `AUTHOR …`) and left plain Pd objects such as `trigger` and
`pack` out of the object lists. Cords were not read, so the notes say what
objects are documented to do and which appear together, not exactly how each
example is wired.

**Read**

- All 238 help patches, through the extractor, every line of output.
- The three helper patches `_gemwin.pd`, `_pix2rectangle.pd`,
  `_backendinfo.pd`.
- All 172 example patches in the 17 example folders, including the six-part
  recursion tutorial and the multi-screen projection abstractions, and the
  recursion folder's README.
- All 18 abstractions in `Abstractions/Gem/`. Four long ones (`gemwin`,
  `gemhead`, `gemmouse`, `pix_blobtracker`) had their object lists cut off at
  about 1,500 characters; their comments were read whole.
- The manual: all 16 HTML pages, the FAQ in full.
- `gem.release_notes.txt` in full (versions 0.91 back to 0.50),
  `gem.known_bugs.txt`, `gem.todo.txt`.
- From GitHub: the upstream `README.md`, the four help patches that the
  plugdata copy lacks (`GEMgl`, `glsl`, `modelfiler`, `_textbbox`), and the
  five help patches in `extra/` (`pix_artoolkit`, `pix_drum`,
  `pix_fiducialtrack`, `pix_hit`, `pix_mano`).
- plugdata's release notes for v0.9.0 and v0.9.2 (the lines about Gem only),
  and the top of the `plugdata-gem` README.

**Checked on the Max side** (Max 9.1.5): the object registry
`obj-qlookup.json`; refpages in `C74/docs/refpages/`, in the bundled packages
(`Jitter Tools`, `Jitter Geometry`) and in the user packages folder; the
userguide Jitter topics `depth_layer_blend`, `graphics_engine`,
`jxs_file_format`, `render_passes`, `textures`; the repo's package library
through `packages/query_packages.py`; and the Jitter notes in
`patching/MAX_PATCHING.md` and `scans/c74-forum/forum_insights.md`. About 90
refpages were opened. Each candidate's `max_check` says which.

**Skipped, and why**

- 32 files in `examples/data/`: images, movies, a model, a font.
- 21 images in the manual folder.
- `Makefile.am` files, `astyle.rc`, `CodingStyle.txt`, `Gem.svg`, a
  `.gitignore`: build files, a C++ style guide, a logo.
- `examples/12.multi_screen_projection/config.txt` and `grid.jpg`: saved
  values and a test image.
- `https://gem.iem.at/`: could not be read (below).

**Pending**

- 63 shader source files (`.frag`, `.vert`, `.geom`): 46 under
  `examples/10.glsl/shader/`, 8 under `examples/15.GLSL4/shader/`, 5 in
  `examples/12.multi_screen_projection/` and 4 beside the help files. Only
  `soft_edge.frag` was opened, and only its first 60 lines. The patches that
  load them were all read.
- `GemPrimer.pdf` (19 pages): could not be decoded (below).
- `cMatrix.html`: only the first 1,500 characters read.
- `notes/keynames.org`: key names per window backend, not read.
- 14 upstream example patches that plugdata does not ship, most in
  `examples/15.openGL3.2/` (matrix, lighting, adjacency, tessellation).
- Four plugdata test-release notes and one GitHub discussion.

**Problems**

1. **gem.iem.at is behind a bot check.** `curl` got HTTP 200 and a redirect to
   `https://gem.iem.at/.within.website/?redir=/` for every path tried;
   WebFetch got HTTP 403. `puredata.info` behaves the same way. Nothing from
   those sites was read. The enumerator lists the home page as one entry and
   prints a note when it sees the redirect; it derives no list from it.
2. **The primer PDF could not be read.** The machine has no `pdftotext` or
   `pdftoppm`, and Python has no PDF module. A raw decode of the PDF's
   compressed streams gave the text inside the figures (patch contents) but
   the body text uses a font encoding that does not decode to letters. The
   file is left `pending`, not cited.
3. **Cords are not read.** See above. Where an insight depends on wiring
   (for instance which inlet a framebuffer's texture goes to), it is taken
   from the help text, not from the patch.
4. **Version drift between plugdata and upstream.** The plugdata copy has 8
   help files upstream lacks (among them `GEMglBegin`, `gemargs`,
   `pix_blobtracker`) and lacks 4 that upstream has. Its last example folder
   is `15.GLSL4`; upstream's is `15.openGL3.2` with different files. One local
   example uses `[modelfiler]`, whose help exists only upstream. Statements
   about `[glsl]`, `[modelfiler]` and the `extra/` tracking objects are about
   upstream Gem and may not hold in plugdata.
5. **What plugdata changes is barely documented.** Two release-note lines:
   Gem was turned off in 0.9.0 as unstable and came back in 0.9.2 as
   "experimental", and object names need a `Gem/` prefix unless "Gem" is
   added to the Libraries list. Nothing read says which window backend
   plugdata uses, whether Gem works when plugdata runs as a plugin inside a
   DAW, or which film, camera and image plugins are compiled in.
6. **Help files show their age.** Several describe SGI hardware or Windows NT
   (`pix_indycam`, parts of the FAQ), `[gemorb]` and `[gemtablet]` are now
   stand-ins that print an error, and `[pix_blur]`, `[part_velcone]`,
   `[part_velsphere]` and `[render_trigger]` are marked obsolete in their own
   help. A few help files carry the wrong object name in their synopsis line
   (`pix_aging`, `pix_flip` and `pix_histo` say `[pix_color]`).
7. **Max-side limits.** Max cannot be run from here, so every Max statement is
   from a refpage, the registry, the userguide or the package library. Several
   Jitter refpage entries are stubs (`TEXT_HERE` for `jit.gl.texture` `wrap`,
   `jit.gl.mesh` `instances`). Where a refpage was silent the candidate says
   so, and uses `unsure` or low confidence.

**Candidate counts** (50): different-approach 26, partial 18, unsure 3,
better-elsewhere 2, absent 1.

## What to read next

1. **`GemPrimer.pdf`**, with a PDF tool installed (`brew install poppler`).
   It is the one concept-level document not read.
2. **The shader sources**, starting with `mass.frag`, `link.frag` and
   `fetching2.vert` (the GPU physics example), `blur.frag`, `GLSL_mix.frag`,
   and the two cube-map shaders. They decide how much of the "worked plan"
   advice in the candidates can be turned into a Jitter example.
3. **Upstream `examples/15.openGL3.2/`** (9 patches), which show Gem under a
   modern OpenGL profile: the nearest thing to Jitter's `glcore` engine.
4. **A wiring-aware pass** over the framebuffer, multi-pass and
   multiple-window examples: read the `#X connect` lines so the inlet and
   outlet numbers can be stated.
5. **plugdata's source or issue tracker** for how the Gem window is created
   and what is disabled in plugin builds. The release notes do not say.
6. **In Max, by hand**: whether `jit.gl.sketch`'s `gl…` messages work under
   the `glcore` engine; whether `jit.gl.model` honours `matrixoutput`; whether
   a JXS `param` can be an array. These three would settle candidates now
   marked `unsure` or low confidence.
