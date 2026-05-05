# Cycling '74 Projects — Patching Insights

Patching insights extracted from **free, downloadable** patches found in the
Cycling '74 projects gallery. Mirrors the structure of
`c74-forum/forum_insights.md` and `cookbook/cookbook_insights.md` so all
three knowledge sources can be searched the same way.

**Scope**: only entries whose patch is in hand. Commercial/showcase-only
projects belong in `c74_projects_database.md` (the catalog), not here.

**Promotion**: mark entries `[PROMOTED 2026-05-04]` when the insight would
improve `patching/MAX_PATCHING.md`, `SPEC_REFERENCE.md`, `CLAUDE.md`, or
`packages/package_objects.json`. Per the `Rules from Corrected Errors`
rule in CLAUDE.md, every promotion is user-confirmed before writing —
never auto-promoted.

## Audio / MSP — gen~ patterns

### Envelope-driven transient/tonal split via gen~ — *transient_crossfade* (jbaylies, MIT)

[github.com/jbaylies/transient_crossfade](https://github.com/jbaylies/transient_crossfade)

Splits one audio source into two output streams (transient and tonal) by
crossfading between two parallel signals based on an envelope derived from
a third audio input. Implemented entirely in `gen~`. The clean structure:

- `param attack 2 @min 0 @max 20` and `param decay 2000 @min 0 @max 3000` drive a `slide` (the canonical gen~-domain envelope follower — `slide` takes separate up/down time constants).
- `abs → slide(attack/decay) → clip 0 1` produces a normalized envelope from the source. `param env_clip 0..1` lets you pinch the top of the envelope so it decays faster after a transient.
- `param env_sens` (dB-mapped via `dbtoa`) scales the envelope before clamping.
- `mix` does a linear crossfade between the two inputs by the envelope; a parallel `equal-power crossfade` (`sqrt(env)*a + sqrt(1-env)*b`) runs alongside; `param interpolate_crossfades 0..1` and a `selector 2` blend or hard-switch between linear and equal-power.
- Per-input **`param @name predelay @default 0 @min 0 @max 1000`** drives a `samplerate * (predelay/1000) → delay 48000` chain on each audio input — sample-accurate predelay up to 1000 ms (at 48 kHz). The companion `samplerate` object is the canonical way to do millisecond→sample conversion inside gen~.
- Three audio in (in 1, in 2, in 3=env), seven audio out (transient, tonal, plus debug taps for env, raw env, etc.).

**Latency-compensation principle from the README** (worth elevating to a
rule): the envelope input should connect to the sound source as
**directly as possible**; any pre-crossfade FX latency on the audio inputs
then becomes "lookahead" relative to the envelope, which is acoustically
free. Putting FX on the env path instead would add latency to the gate,
producing comb-filtering against the parallel signal path.

`[PROMOTED 2026-05-04]` — three things worth lifting to `patching/MAX_PATCHING.md` § gen~:
1. **`slide` is the canonical gen~ envelope follower** — separate slide-up and slide-down arguments express attack and decay as the standard pair.
2. **`samplerate * (ms/1000) → delay N`** is the canonical millisecond→sample conversion idiom inside gen~ (where there's no `delay~` with millisecond mode).
3. **Equal-power vs linear crossfade is one `selector 2` away** — both can coexist in the same gen~ patch, with a runtime parameter choosing between them, instead of duplicating the patch for each crossfade flavor.

### Parent/child abstraction with multi-outlet signal voicing — *!SHAKE!* (Davor Branimir Vincze)

[github.com/Vinczius/Shake](https://github.com/Vinczius/Shake.git)

Virtual shaker / physical-modeling instrument shipped as two patches:
`!Shake!parent.maxpat` (the user-facing instrument with controls) and
`!Shake!child.maxpat` (an abstraction with **8 audio outlets** for voice
multiplexing). Patterns worth noting:

- The child abstraction declares `in 1` (control), `in~ 1` (audio), `in 2..5` (control), and `out~ 1..8` (8 audio outs) — a single instance can voice 8 simultaneous shaker voices that the parent recombines / spatializes. The labelling pattern matches the CLAUDE.md inlet/outlet convention (`in N` for control, `in~ N` for signal, `out~ N` for signal out), reaffirmed by an external real-world example.
- **`cycle~` at sub-Hz rates as a slow LFO**: the parent uses `cycle~ 0.11` and `cycle~ 0.31` for "Volume Oscillation" and "Pulse Speed Variation". `cycle~` accepts arbitrary float frequencies including very small ones — no need to pre-scale or use `phasor~ + lookup~` for slow modulation.
- **`expr` with multi-arg integer combinators** like `expr $i4 - (2*$i1 + 2*$i2 + $i3)` for combining stochastic counter outputs into resonator coefficient indices. This is the Max-typed analog of a tuple-pack-then-compute idiom.
- **Preset rhythms as parameterized message lists**: `1 $1 1 $2 0 $3 0 $4 0.5 $1 0.5 $2 0 $3 0 $4 ...` — the message box stores a pattern in normalized form (0..1 amplitudes paired with $1-$4 substitutable parameter slots); the receiver substitutes time/pitch/voicing values at evaluation time. A pattrstorage-free preset strategy that survives copy-paste.

`[PROMOTED 2026-05-04]` — *cycle~ at sub-Hz rates as the canonical slow LFO* deserves a one-line note in `patching/MAX_PATCHING.md` modulation section, contrasted against the common student instinct to reach for `phasor~ + lookup~` or build LFO-from-line~ chains.

## Patching Patterns

### Exemplar of a properly-shipped Max community package — *Dirigera Max* (maceq687, MIT)

[github.com/maceq687/dirigera-max](https://github.com/maceq687/dirigera-max)

The repo is a model of how to ship a Max package in 2024+ shape. Useful
to keep as a reference for any Claude2Max-generated package or any
student building one. The full directory layout:

```
dirigera-max/
  package-info.json              ← required metadata; min/max Max version, OS support, homepatcher
  patchers/dirigera.maxpat       ← the abstraction itself
  javascript/dirigera.js         ← JS implementation backing the abstraction
  javascript/dirigera_config-example.json  ← example user config
  help/dirigera.maxhelp          ← help patch (homepatcher reference)
  docs/dirigera.maxref.xml       ← refpage so right-click → reference works
  extras/DirigeraMaxInit.maxpat  ← extras menu entry for first-time setup
  icon.png                       ← package browser icon
  README.md / license.txt        ← repo-level docs
```

The `package-info.json` declares `max_version_min: "8.0"`, OS support
(`macintosh.platform = ["x64", "aarch64"]`, `windows.platform = ["x64"]`),
and a `homepatcher: "dirigera.maxhelp"` that opens when the package is
clicked in the Package Manager. The refpage XML follows the canonical
schema (`<c74object name="dirigera">` with `<digest>`, `<description>`,
`<metadatalist>`, `<inletlist>`, `<outletlist>`, `<methodlist>`) — exactly
the shape `RefpageCache._parse` in `spec2maxpat.py` parses. So a
properly-built community package becomes I/O-resolvable in Claude2Max
specs without any override.

`[PROMOTED 2026-05-04]` — `patching/MAX_PATCHING.md` could grow a section
"Shipping a community package" with this directory layout as the
reference. Especially for the audience of Claude2Max students, knowing
that "putting JS in `javascript/`, refpage in `docs/`, helpfile in
`help/`" is the convention (not arbitrary) is high-leverage.

## Video / Jitter

*(none yet — analyzed candidates so far have been audio/MSP-centric)*

## JS / v8

*(none yet)*

## MIDI / DMX

*(none yet)*

## UI / Presentation

*(none yet)*

## Performance

*(none yet)*

## RNBO

*(none yet — RNBO Preset Backup queued for analysis)*

## LLM / AI-Assisted Patching

*(none yet)*

---

## Future-analysis queue (34 candidates not yet analyzed)

These were confirmed free-extractable in the 2026-05-03 triage but not
yet opened. Listed here so a future session can pick the next chunk
without re-doing the discovery work.

### High-value GitHub repos (queued by pedagogical priority)

| Priority | Repo | Stars | Why |
|---|---|---|---|
| ★★ | [mjcella/facet](https://github.com/mjcella/facet) | 109 | Active live-coding system (NodeJS+browser+Max); 260 MB project |
| ★★ | [valeriorlandini/sonus](https://github.com/valeriorlandini/sonus) | 16 | C++ Max package for algorithmic composition |
| ★★ | [stefanofasciani/DGMD](https://github.com/stefanofasciani/DGMD) | 17 | ML training-data generator infrastructure |
| ★★ | [ceammc/SwiftRNBO](https://github.com/ceammc/SwiftRNBO) | 59 | Swift↔RNBO compatibility — host-integration patterns |
| ★ | [tomoyanonymous/rtpsendreceive](https://github.com/tomoyanonymous/rtpsendreceive) | 21 | RTP audio externals, ffmpeg-based |
| ★ | [michaelreichmann/Circular_Sequencer](https://github.com/michaelreichmann/Circular_Sequencer) | 12 | M4L circular sequencer — UI patterns |
| ★ | [nightshining/Mubu_Generative_Sound_Control_Interface](https://github.com/nightshining/Mubu_Generative_Sound_Control_Interface) | 4 | MuBu generative interface |
| ★ | [janmech/RNBO_PresetBackup_1.2.1](https://github.com/janmech/RNBO_PresetBackup_1.2.1) | 1 | Python — RNBO preset persistence |
| ★ | [mrtnRivera/MaxZine1_Diccionarios](https://github.com/mrtnRivera/MaxZine1_Diccionarios) | 3 | Spanish-language community fanzine |

**Excluded — Pd-shim and binary-port repos** (not native Max/MSP; require `Pd4Max` shim or are bundled Linux plugin binaries; deferred per 2026-05-04 user decision):

- `georgeNikmus/Designing-Sound-Max-Patches` — port of Andy Farnell's *Designing Sound* via Pd4Max
- `georgeNikmus/The-Theory-and-Technique-of-Electronic-Music-Max-Patches` — port of Miller Puckette's *Theory and Technique of Electronic Music* via Pd4Max
- `georgeNikmus/Linux4Max` — Linux audio plugin binaries (FAUST / Adriaensen / Gareus / Radium / Zam) wrapped for Max

### MaxForLive.com free devices

| Title | Author | URL |
|---|---|---|
| Modulus | Stephen Black | <https://www.maxforlive.com/library/device/10950/modulus> |
| PAULA 2.0 (Amiga A1200/PT2 sampler) | Ashleigh Fournier-Kelleher | <https://maxforlive.com/library/device/11737/PAULA> |
| WISE wavetable+sample engine | (page 12-21) | <https://maxforlive.com/library/device/9591/w-i-s-e> |
| Rifflemess | (page 12-21) | <https://maxforlive.com/library/device/9582/rifflemess> |

### Author-website free patches (15 candidates)

See `c74_projects_database.md` "Free-extractable candidates → Author website" for the full list. Notable ones for analysis-pass priority:

- **Cosmolab — Daisy Seed dev kit** (Francesco Mulassano) — gen~ → Daisy MCU pipeline; open hardware
- **MMM4Live** (Renaud Bougueng, Simon Fraser metacreation lab) — academic generative model integration with Live
- **ATTRACTORS** (Julien Bayle) — strange-attractor visualization, Jitter
- **Axoa** (hapax84.free.fr) — old-school personal-page archive
- **CRT Flux Phaser** (James H Connolly)
- **The Pacemaker 1.0** (Max Epperson)

### Google Drive / direct-download

| Title | URL |
|---|---|
| Multiband Madness | <https://drive.google.com/drive/folders/1u_NulzXXXtMp7OV3VlaDuWu_R1918CBl> |
| Sapporoph Sky Machine | <https://drive.google.com/drive/folders/1a2sgTe0L6-V5bWi0oMAlfQA7Dt5xgD0J> |
| 11uilayer external (11olsen.de) | <https://11olsen.de/max-msp-externals/download/6-max-msp-externals/30-11uilayer> |

---

## Session log

- **2026-05-03b** — pages 1-21 surveyed (210 projects), triage pass identified 37 free-extractable candidates. Three candidates analyzed in depth: **transient_crossfade** (jbaylies — gen~ transient/tonal split, 3 promotion-candidate gen~ patterns), **!SHAKE!** (Vinczius — parent/child multi-outlet abstraction, sub-Hz `cycle~` as LFO), **Dirigera Max** (maceq687 — exemplar of properly-shipped Max community package layout). 34 candidates queued above for future sessions.
- **2026-05-03 (am)** — first session. Page 1 enumerated (10 projects). 0 free patches found. Initial finding: gallery is catalog-shaped, not insight-shaped.
