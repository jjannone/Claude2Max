# plugdata ELSE / cyclone / Live Electronics Tutorial — Session Log

A read of three things bundled with plugdata: the ELSE library, the cyclone
library, and the Live Electronics Tutorial. The aim is to learn how ELSE is
designed, where cyclone's clones differ from the Max objects they copy, and
what the tutorial teaches that a Max patcher can use, and to list what these
do that Max does not, or does differently. One of seven parallel scans. Pd
vanilla, plugdata itself and Gem are covered by sibling scans and are left
out here.

Companion files in this folder:

- `enumerate_plugdata_else.py` — lists every file in the six source folders
  and keeps the state file. Stdlib only, runs on Python 3.9. Re-running it
  never changes a file's `status`, `session` or `notes`. With `--text FILE`
  it prints the comment text and boxes of one `.pd` file.
- `plugdata_else_crawl_state.json` — one entry per file, keyed by its path
  relative to the plugdata folder: `title`, `url`, `group`, `status`
  (`pending` / `extracted` / `skipped`), `session`, `notes`, `listed`.
- `plugdata_else_insights.md` — how ELSE is organized and designed, its
  object families, what cyclone says about Max, and a digest of the tutorial.
- `plugdata_else_tutorial_notes.md` — the long tutorial notes, 555 items,
  each with its source patch. Not in the original file list for this scan;
  kept because the digest in the insights file uses about a tenth of them.
- `plugdata_else_max_gap_candidates.json` — 77 capabilities compared against
  Max, each with what was looked up on the Max side.

## The sources

Everything is local. plugdata 0.9.3 copies its documentation into
`~/Documents/plugdata` (the `Versions` folder there holds `0.9.3`).

| Group in the state file | What it is | Folder under `~/Documents/plugdata` |
|---|---|---|
| `else` | One help patch per ELSE object | `Documentation/9.else` |
| `else-extra` | ELSE's overview patches, changelog, MERDA modules and their help, example data | `Extra/else` |
| `else-abstractions` | The Pd source of ELSE objects that are abstractions | `Abstractions/else` |
| `cyclone` | One help patch per cyclone object | `Documentation/10.cyclone` |
| `cyclone-abstractions` | cyclone's overview patch and three abstractions | `Abstractions/cyclone` |
| `live-electronics-tutorial` | The tutorial, 12 parts | `Documentation/12.live-electronics-tutorial` |

A help file is a `.pd` text file. Its documentation is the `#X text`
comment records plus the objects it demonstrates. Text inside an example
subpatch sits between `#N canvas` and `#X restore` records.

Versions, as the files state them: ELSE "1.0-0 Release Candidate 13"
(`Extra/else/CHANGELOG.txt`); cyclone updated to Max 7, version number not
read (`Abstractions/cyclone/All_about_cyclone.pd`). The libraries' GitHub
READMEs were not consulted; the local files were enough.

## Inventory (2026-10-02)

| Group | Listed | Extracted | Pending | Skipped |
|---|---|---|---|---|
| `else` | 551 | 551 | 0 | 0 |
| `else-extra` | 154 | 5 | 84 | 65 |
| `else-abstractions` | 251 | 0 | 0 | 251 |
| `cyclone` | 207 | 14 | 184 | 9 |
| `cyclone-abstractions` | 4 | 1 | 0 | 3 |
| `live-electronics-tutorial` | 638 | 581 | 8 | 49 |
| **Total** | **1805** | **1152** | **276** | **377** |

`python3 scans/plugdata-else/enumerate_plugdata_else.py --status` prints the
current counts.

"Extracted" does not mean the same depth everywhere. The `notes` field of
each entry says which of these applies:

- **ELSE help, 36 files: read in full**, including the text of every example
  subpatch: `adsr~ args circuit~ clock del~ dispatch envgen~ format knob
  loadbanger markov message metronome midi mono notedur2ratio op~ pattern
  pdlink phaseseq~ player~ popmenu presets rec rescale retrieve router
  sample~ score sequencer speed suspedal synth~ tabgen var voices`.
- **ELSE help, 515 files: top-level text read.** That is the description,
  arguments, flags and the inlet and outlet lines. Lines of fewer than three
  words were dropped by the extractor, and the text inside example
  subpatches was not read.
- **Tutorial, 581 patches: read in full by reading sub-agents** (see below).
- **cyclone, 14 files: read in full**: `average~ buffer~ counter cycle~ grab
  mtr play~ prob pv scale seq sprintf table train~`.

## Sessions

### 2026-10-02 — Session 1 (Opus 5.5)

**How the reading was done**

1. A small extractor pulled comment text and box lists out of every `.pd`
   file. The same logic is in the enumerator's `--text` option.
2. ELSE: the top-level text of all 551 help files was read in one pass
   (about 300 KB). Then the subpatch text of 36 files that mattered most.
   The category list came from the subpatch names in
   `Extra/else/All_else_objects.pd`.
3. cyclone: a keyword filter (Max, differ, unlike, original, ELSE, plugdata,
   vanilla, not implemented, deprecated, bug, fix) pulled about 55 KB of
   lines out of 179 files. Those lines were read. Fourteen files with real
   statements about Max were then read in full.
4. Tutorial: the extracted text was about 750 KB, so it was split by part
   and given to four reading sub-agents, each told to read every line, to
   restate and not copy, to name the source patch on every item, and to add
   nothing from memory. They returned 555 items. All four sets of notes were
   then read here, and the digest in the insights file was written from them.
5. Max side: every candidate was checked against Max 9.1.5's
   `obj-qlookup.json`, the refpages, `transform-defaults.json`, the user
   guide topics on time values, mapping, parameter mode, non-real-time
   processing and Ableton DSP, and the repo's `query_packages.py`.

**Read**

- All 551 ELSE help files (depth as above).
- `Extra/else`: `All_about_else.pd`, `All_else_objects.pd`, `about.MERDA.pd`,
  `presets.m-help.pd`, `seq8.m~-help.pd`, and the first 60 lines of
  `CHANGELOG.txt`.
- cyclone: 14 help files in full, filtered lines of about 165 more, and
  `All_about_cyclone.pd`.
- All 581 tutorial patches.

**Skipped, and why**

- 251 files in `Abstractions/else` and 3 in `Abstractions/cyclone`: the Pd
  source of abstraction objects. The help file is the documented surface.
  They would matter to someone porting an abstraction to Max.
- 116 media files across the folders (audio, MIDI, images, SoundFonts,
  `brane.m~` preset data): not documentation.
- 6 example data files that help patches load (`coll.txt`, `funbuff.txt`
  and so on), and cyclone's object-browser script.

**Left pending**

- 184 cyclone help files: only filtered lines were read, or nothing. They
  describe objects that exist in Max, so their main text is of little use to
  a Max reader; what was wanted from them (statements of difference) was
  taken by the filter. A statement phrased without any of the filter's
  keywords would have been missed.
- 23 MERDA module help files in `Extra/else`, and about 60 other files there
  (example patches, score and preset text files, `README.pdf`).
- The rest of ELSE's `CHANGELOG.txt` after line 60.
- In the tutorial: two PDFs, a SuperCollider and a Processing example, and
  four score text files of which only the start was sampled.

**Problems and things to know**

- **The tutorial boxes rarely carry the `else/` prefix.** The tutorial loads
  ELSE with a path declaration, so only a handful of boxes say `else/…`. An
  object seen in a tutorial box is therefore not proved to be an ELSE object
  by the tutorial alone. Every ELSE object named in the insights file was
  checked against the ELSE help folder.
- **The box list per tutorial patch was capped at 30.** A long patch may use
  objects the sub-agents never saw. The comment text was not capped.
- **The top-level ELSE read dropped very short lines** (fewer than three
  words) and lines that are only arrows or "see also". Argument lines such
  as "1) float -" lost their continuation when the help file put the
  description in a separate comment. Where an argument's meaning mattered
  for a candidate, the file was re-read in full.
- **The documents contain errors.** Wrong object names in descriptions,
  copied "alternative" lines in cyclone that name the wrong object, two
  defaults stated for one setting. They are collected in Part 4 of the
  insights file. Nothing was corrected silently.
- **cyclone speaks about Max 7.** Where its help says "Max does X", that was
  true of the Max it cloned. Two such claims were checked against Max 9.1.5
  and hold (`scale` loads in classic mode; `seq` has no pause). One was
  found out of date: cyclone calls ELSE's `xselect~` "much better" than
  `selector~`, but Max's `selector~` and `gate~` now have a `ramptime`
  attribute that crossfades.
- **Max 9.1.5 bundles more than expected.** The `ableton-dsp` package inside
  the Max application has about 75 `abl.dsp.*` and `abl.device.*` objects
  (chorus, flanger, phaser, reverbs, compressor, Euclidean ramp, velvet
  noise, FM oscillators), and the registry has `sfizz~`, an SFZ player.
  Several things that would have been listed as absent are covered by these.
- **Nothing was tested in Pd, plugdata or Max.** Every statement about
  behaviour is what a document says.
- **One entry rests partly on general knowledge and says so.** The Euclidean
  formula in the candidates file's notes is a common one, not from a help
  file. Two `notes` fields flag a Max fact that was not read from a refpage
  in this session (the number box's note-name display; reaching patcher lock
  state from JavaScript).

**Candidates written: 77**

| `max_status` | Count |
|---|---|
| `different-approach` | 36 |
| `partial` | 33 |
| `absent` | 5 |
| `better-elsewhere` | 3 |

Three carry the tool name `plugdata (cyclone)`; the rest `plugdata (ELSE)`.
By category: audio 51, data/tables/scripting 8, workflow/authoring 7,
control surface/UI building 6, timeline/cueing/show control 3,
networking/sync 2.

The five marked absent: a discrete-summation oscillator (`blip~`), dynamic
stochastic synthesis (`gendyn~`), the Plaits port (`plaits~`), analog circuit
simulation from a netlist (`circuit~`), and an abstraction that reacts to a
click on its own box (`click`).

## What to read next

1. **The 515 ELSE help files' example subpatches.** The top level says what
   an object is; the subpatches say how it behaves at the edges. Start with
   the families a Max abstraction might copy: `tabplayer~`, `tabreader~`,
   `xselect2~`, `pan~`, `fdn.rev~`, `function`, `keyboard`, `sh~`,
   `tempo`, `chance`, `rand.hist`, `osc.route`, `midi.learn`.
2. **The 23 MERDA module help files** (`Extra/else/*.m~-help.pd`), for the
   panel conventions, if a module set for Max is ever wanted.
3. **`Abstractions/else/*.pd`** for any ELSE abstraction worth porting. The
   source is a Pd patch, so it reads as a recipe: `player~`, `presets`,
   `vocoder~`, `compress~`, `plate.rev~`, `grain.sampler~`.
4. **The cyclone help files in full**, only if someone needs to run a Max
   patch in Pd. For Max work the difference list in the insights file is the
   useful part.
5. **The rest of the ELSE changelog**, for the history of design decisions.
