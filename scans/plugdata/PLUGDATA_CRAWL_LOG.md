# plugdata / Pure Data Documentation Crawl — Session Log

A read of the documentation for plugdata, the Pure Data (Pd) vanilla it is built
on, heavylib and pdlua, as installed on this machine, plus plugdata's web
documentation. The aim is to learn how Pd works and to list what it does that
Max does not, or does differently. Pd and Max are siblings, so most of the yield
is "same idea, different way". One of seven parallel scans; ELSE / cyclone and
Gem have their own.

Companion files in this folder:

- `enumerate_plugdata.py` — lists the local documentation files and the web
  pages and keeps the state file. Stdlib only, runs on Python 3.9. Re-running it
  never changes an entry's `status`, `session` or `notes`.
- `plugdata_crawl_state.json` — one entry per file or page, keyed by path
  relative to `~/Documents/plugdata` or by URL: `title`, `path` or `url`,
  `group`, `status` (`pending` / `extracted` / `skipped`), `session`, `notes`.
- `plugdata_insights.md` — how Pd and plugdata work, by topic, each entry
  naming the file it came from.
- `plugdata_max_gap_candidates.json` — 63 capabilities compared against Max,
  each with what was read on the Max side.

## The sources

| Group in the state file | What it is | Where |
|---|---|---|
| `1.manual` | Pd's HTML manual, "Updated for Pd version 0.55-2" | `~/Documents/plugdata/Documentation/1.manual/` |
| `2.control.examples`, `3.audio.examples`, `4.data.structures` | The three tutorial series, as patches | `Documentation/` |
| `5.reference` | One help patch per vanilla object, plus plugdata's four DAW objects | `Documentation/5.reference/` |
| `6.externs`, `7.stuff`, `8.topics` | C external examples, extra patches, three HTML topic pages | `Documentation/` |
| `11.heavylib`, `Abstractions/heavylib` | heavylib help patches and the abstractions themselves | `Documentation/11.heavylib/`, `Abstractions/heavylib/` |
| `13.pdlua`, `Extra/pdlua` | pdlua help, examples, tutorial PDF; `pd.lua`, `pdx.lua` | `Documentation/13.pdlua/`, `Extra/pdlua/` |
| `Abstractions` | Top-level abstractions: `param`, `playhead`, `daw_storage`, `plugin_latency`, and Pd's `rev1~` etc. | `Abstractions/*.pd` |
| `Extra/Presets` | Six example plugin patches | `Extra/Presets/` |
| `web:plugdata.org` | Site pages and the object reference bundle | `https://plugdata.org/` |
| `web:plugdata-book` | The official documentation book (7 chapters) | `https://plugdata.org/docs/book/` |
| `web:github` | README and wiki | `plugdata-team/plugdata` |
| `web:hvcc` | Heavy compiler documentation | `https://wasted-audio.github.io/hvcc/latest/` |
| `web:pd-lua` | The pd-lua tutorial, HTML edition | `https://agraef.github.io/pd-lua/tutorial/pd-lua-intro.html` |

**How the doc root was found.** `https://plugdata.org/documentation.html` is
the site's documentation index. Its "Official Documentation" link goes to
`docs.html`, which is only a frame around `docs/book/index.html`, a HonKit
book. The index also links the Heavy docs and the pd-lua tutorial as part of
plugdata's documentation, which is why those two are enumerated. `sitemap.xml`
on plugdata.org returns 404.

**Not in this scan.** `Documentation/9.else`, `10.cyclone`,
`12.live-electronics-tutorial`, `14.gem` and `Abstractions/else`, `cyclone`,
`Gem` belong to sibling scans and are not listed in the state file.

**No extra packages.** `~/Documents/plugdata/Externals/` is empty (0 entries),
and `Patches/` is empty. Nothing beyond what plugdata ships is installed.

## Inventory (2026-10-02)

| Group | Listed | Extracted | Pending | Skipped |
|---|---|---|---|---|
| 1.manual | 120 | 5 | 1 | 114 |
| 2.control.examples | 30 | 29 | 0 | 1 |
| 3.audio.examples | 133 | 12 | 121 | 0 |
| 4.data.structures | 24 | 23 | 0 | 1 |
| 5.reference | 170 | 120 | 43 | 7 |
| 6.externs | 14 | 1 | 13 | 0 |
| 7.stuff | 22 | 6 | 12 | 4 |
| 8.topics | 10 | 2 | 2 | 6 |
| 11.heavylib | 28 | 28 | 0 | 0 |
| 13.pdlua | 123 | 8 | 114 | 1 |
| Abstractions | 12 | 4 | 8 | 0 |
| Abstractions/heavylib | 62 | 2 | 59 | 1 |
| Extra/pdlua | 4 | 0 | 3 | 1 |
| Extra/Presets | 57 | 0 | 54 | 3 |
| web:plugdata.org | 9 | 5 | 4 | 0 |
| web:plugdata-book | 7 | 7 | 0 | 0 |
| web:github | 8 | 6 | 2 | 0 |
| web:hvcc | 37 | 11 | 26 | 0 |
| web:pd-lua | 1 | 0 | 1 | 0 |
| **Total** | **871** | **269** | **463** | **139** |

809 local files and 62 web pages. Most of the 139 skipped entries are the
manual's 113 figure pictures.
`python3 scans/plugdata/enumerate_plugdata.py --status` prints the current
counts without touching the disk folder or the network.

## Sessions

### 2026-10-02 — Session 1 (Opus 5.5)

**How the patches were read.** A `.pd` help file is text: comments are `#X
text` lines, objects `#X obj`, messages `#X msg`. A small script printed, for
each file, every comment, object and message box, indented by subpatch. That
text is what was read. Three things were dropped by the script and so were not
seen: the box positions and cords, the argument strings of GUI objects (`bng`,
`tgl`, sliders, number boxes), and, in the reference help files from `bonk~`
onward, comments shorter than about a dozen characters and exact repeats of a
line within one file. So "read" below means every sentence of documentation in
the patch, not its wiring.

**Read**

- The manual: contents page and chapters 1 to 4 in full (introduction, theory
  of operation, installing, externals). Section 2.11, "Pd vs. MAX", is Pd's
  own list of differences and is the base of several comparisons.
- All 29 control tutorial files and all 23 data-structure tutorial patches.
- 120 reference help patches, which cover every object family named in the
  task: `clone`, `block~` / `switch~`, `expr` family, `text`, `array`, `list`,
  `file`, send / receive (control and signal), `throw~` / `catch~`, delay
  lines, inlets and outlets, `savestate`, `declare`, `pdcontrol`,
  `namecanvas`, messages to Pd and to windows, `pd~`, the network and OSC and
  FUDI objects, MIDI, the data-structure objects, the GUI objects (`bng`,
  `cnv`, atom boxes), `sigmund~`, `bonk~`, `vline~`, `snake~`, the sound-file
  objects, and plugdata's `param`, `playhead`, `daw_storage`,
  `plugin_latency`.
- 12 audio tutorial patches, picked for the comparison: block size and
  feedback (G04), execution order (G05), FFT (I01, I03, I07), oversampling
  (J07), polyphony with `clone` (D11), control/signal conversion (C03, C04,
  C06), offline rendering (B16), the introduction (A00).
- All 28 heavylib help patches, the heavylib README and changelog.
- pdlua: both help patches, five example scripts, and the HTML tutorial from
  "Signals and graphics" to the end.
- The four plugdata DAW abstractions themselves (`param.pd`, `playhead.pd`,
  `daw_storage.pd`, `plugin_latency.pd`).
- Web: plugdata.org home, documentation, about and support pages; all 7 book
  chapters; the README; 5 wiki pages; 11 Heavy pages (index, getting started,
  patching, generators index, DPF, Daisy, Pd external, C, supported objects,
  unsupported objects, MIDI).

**Skipped, and why**

- 113 manual figures, 6 topic-page figures and other pictures, sounds and
  licence texts: not documentation text. The enumerator marks these itself.
- Manual chapter 6 (building Pd from source): outside a patching comparison.
- Data files that example patches load (`15.file.txt`, `qlist.txt`, preset
  text files and the like).

**Left pending, and why**

- 41 reference help patches for objects with a plain Max twin, left out to
  keep the read to the areas that differ: the simple filters (`lop~`, `hip~`,
  `vcf~`, `rpole~`, `rzero~`, `rzero_rev~`), oscillators and noise, unary
  operators and trigonometry, `tabread` / `tabwrite` / `tabplay~` /
  `tabosc4~`, `makenote`, `stripnote`, `moses`, `unpack`, the reverbs,
  `fiddle~`, `pique`, `framp~`, `lrshift~`, `hilbert~`, `output~`, and the
  slider, radio, toggle, number-box and VU help files. **These GUI help files
  matter for anyone porting a GUI-heavy patch and should be read next.**
- `bob~-help.pd` and `slop~-help.pd`: read in part. `8.topics/slop-tilde.htm`:
  read up to the start of the compander section. `8.topics/expr.htm`: not
  read; the expr help patch was.
- Manual chapter 5 (release notes): read from 0.55-2 back to 0.43.
- 121 audio tutorial patches.
- The pd-lua tutorial's first half (basics, inlets and outlets, tables,
  clocks, receivers, dollar symbols): headings only. The local PDF copy was
  not opened; this machine has no PDF text tool on the path, so the HTML
  edition was fetched.
- 114 pdlua example files; `pd.lua` (only its list of function names was
  read); `pdx.lua` (header comment only); the second half of the pdlua
  README.
- The insides of the 59 heavylib abstractions, and Pd's own abstractions
  (`rev1~`, `hilbert~`, `output~` …).
- `Extra/Presets`: listed only.
- `6.externs`: the README was read; the C sources and test patches were not.
- Web: `download.html` and `store.html`; the object reference bundle beyond
  names and one-line descriptions; 26 Heavy pages (JavaScript, Unity, Wwise,
  FMOD, OWL, custom generators, Daisy board files, the C and C++ API, the IR
  pages, the design records, the changelog); two wiki pages whose content the
  book repeats.

**Problems**

- **plugdata's own features are thinly documented.** The book has seven short
  chapters. Its "DAW parameter automation", "Tempo syncing" and "Sound not
  working" headings have no text under them. Nothing read describes the
  editor, themes, the palette, presets or how plugdata exposes Pd's package
  manager. The two wiki pages about the interface hold one screenshot each.
  What these notes say about `param`, `playhead`, `daw_storage` and
  `plugin_latency` comes from their help patches and from reading the
  abstractions.
- `plugin_latency-help.pd` is an empty patch (one canvas line).
- `param-help.pd` describes the object's messages in loose comment boxes with
  no text tying each description to an inlet. The pairing in the notes
  (`create`, `range`, `mode`, the change-state inlet) follows the order the
  comments appear in and should be confirmed in plugdata.
- The manual disagrees with the tutorial on one point: section 2.8.1 says a
  saved abstraction change reaches "all invocations of it as they are
  created", while `12.PART2.subpatch.pd` says other copies do not update until
  the patch is reloaded.
- The manual's statement that Max's `buffer~` cannot be drawn into with the
  mouse is out of date: Max 9's `waveform~` refpage describes a draw mode.
- The shared scratch folder was also used by sibling scans; a helper script of
  the same name was overwritten once mid-session. No repo file was affected.
- The enumerator's failure paths were tested: a missing plugdata folder and an
  unreachable host both print the cause, exit with code 2, and leave the state
  file byte-for-byte unchanged. A second run with `--local-only` also left it
  unchanged.

**The Max side**

Each candidate was checked against Max 9 on this machine: the object registry
(`interfaces/obj-qlookup.json`, 1,323 names), refpages, the userguide topic
files, this repo's `patching/MAX_PATCHING.md` and `CLAUDE.md`, and the package
library through `packages/query_packages.py`. What was read is in each
candidate's `max_check`. Nothing was run in Max or in plugdata.

Result: 63 candidates — 38 different-approach, 17 partial, 3 absent, 3 unsure,
2 better-elsewhere. Forty are "same concept, different way" with an advice
line. The true gaps are few: user-defined graphical data structures, running
one DSP block on demand, and per-patch dependency declaration. The largest
practical difference is deployment: plugdata is a patcher that loads as a
plugin in any DAW and compiles patches to plugins and firmware at no cost.

## What the next session should read first

1. The slider, radio, toggle, number-box and VU help patches in
   `5.reference`, for a full account of Pd's GUI objects.
2. `8.topics/expr.htm` and the rest of `slop-tilde.htm`.
3. The first half of the pd-lua tutorial, then `pd.lua` and the `dial` and
   `osci3d~` examples, to confirm the graphics API (layers, SVG) against code.
4. The remaining Heavy pages, in this order: JavaScript, Unity, Wwise, the C
   API, Daisy board files.
5. One or two `Extra/Presets` patches (LIRA-8, AlmondOrgan), to see how a
   finished plugdata instrument uses `param` and stores its state.
6. In the plugdata application itself: the settings, theme, palette and
   package pages, which no document read here describes.

For the Max comparison, a later pass should settle what this session left
open: whether `poly~ @vs 1` is allowed; whether a `pattr` inside an
abstraction is saved per instance in the parent; whether `adstatus` can select
the NonRealTime driver by message; whether Max's `expr` accepts several
expressions; what `filepath` means by paths "specific to a single patch";
whether Max has any command-line mode; and how a Max for Live device declares
its latency.

### 2026-10-02 — Session 2 (system model)

**Task.** Describe Pd, plugdata and Gem against the 20 dimensions in
`scans/max-gaps/SYSTEM_DIMENSIONS.md`, as one column of a system-level
comparison. Output: `plugdata_system_model.json`, 23 items (the 20 dimensions
plus three added ones).

**Read this session**

- Manual chapter 2 again, sections 2.1.1, 2.1.4, 2.2.1, 2.4.2–2.4.3, 2.5–2.8.2
  and 2.11 (scheduling, determinism, persistence, DSP sorting, blocking,
  nonlocal signals, multichannel, dollar signs, subpatches, Pd vs. MAX).
- Manual chapter 3, sections 3.2 and 3.4 (command line, paths, every startup
  flag), and chapter 4 sections 4.1–4.6 (externals, GUI plugins, deken,
  `[declare]`, slash prefixes, overriding, search order).
- Help patches: `pd~`, `pd-messages` (dynamic patching, fast-forward,
  compatibility), `trace`, `clone`, `savestate`, `declare`, `sliders` (newly
  read: IEM GUI properties as messages, init mode, feedback protection),
  `gui-boxes`.
- Raw `.pd` text of `gop-abs.pd` and `16.more.arrays.pd`, to see the file
  format (`#X coords`, `#A` array data).
- `8.topics/fudi.htm` (opening): FUDI is both the GUI-to-engine protocol and
  the patch file format.
- Web, re-read: plugdata.org home, the README, Basic-operation, the DAW, FAQ
  and Getting Started chapters. New: plugdata's GitHub release notes through
  the API (v0.1 to v0.9.3-2), which are the only source found for presentation
  mode, plugin mode, the Inspector, the signal debugger, the activity overlay,
  autosave and the CPU meter.
- Gem: the render-model sections of `scans/plugdata-gem/plugdata_gem_insights.md`
  (not the Gem help files themselves).
- Max side, only to word the contrasts: refpage digests of `pv`,
  `pattrstorage`, `thispatcher`, `pfft~`, `mc.pack~`, `bpatcher`, `js`,
  `mute~`; userguide topics `scheduler`, `messages`, `debugging_and_probing`,
  `parameter_mode`, `non_realtime`, `snapshots`, `patcher_lifecycle` (openings
  only). `poly~` has no refpage at the expected path, so it is not named.

**Added dimensions.** 21 "Patch as message script" (the file, object creation
and dynamic patching are one message mechanism). 22 "Behaviour versioning"
(the `compatibility` message). 23 "Engine and GUI split" (separate processes
over FUDI; plugdata is a new GUI on the same engine).

**Open after this session**

- How plugdata stores presentation-mode layout in a `.pd` file, and what
  vanilla Pd does with it.
- Whether plugdata runs the engine in-process (libpd) or over a socket, and on
  which thread in a plugin host.
- How Gem's frame clock interacts with audio blocks; which Gem window backend
  plugdata uses.
- The `[param]` inlet pairing, still unconfirmed in plugdata.
