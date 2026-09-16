# Max Userguide Crawl — Session Log

Crawl of `/Applications/Max.app/Contents/Resources/C74/docs/userguide/content/` —
Cycling '74's first-party topic / vignette material. Refpages are deliberately
out of scope (already addressable via `RefpageCache`); only the
principle-bearing topic prose lives here.

Companion files in this folder:

- `userguide_crawl_state.json` — per-topic status (`pending` / `extracted` /
  `skipped`) plus the destination patching/*.md file each topic feeds into.
- `userguide_insights.md` — extracted principles, topic-organized.

Mirror of the forum / cookbook crawl pattern. See `c74-forum/FORUM_CRAWL_LOG.md`
and `cookbook/COOKBOOK_CRAWL_LOG.md` for prior art.

## Inventory (frozen at session 1 — 2026-05-07)

- **Total topics**: 147 JSON files (82 top-level + subdirs `gen/`, `jitter/`,
  `m4l/`, `mc/`, `lua/`).
- **Skipped**: 20 (UI/menu walkthroughs and topics that overlap heavily with
  refpages — `action_menu`, `inspector`, `extras_menu`, `format_palette`,
  `file_browser`, `documentation_window`, `external_text_editor`, `repl`,
  `web_browser`, `sidebar_search`, `syntax_coloring`, `color_palette`,
  `illustration_mode`, `package_manager`, `preferences_and_settings`,
  `templates`, `index`, `glossary_common_terms`, `object_reference`, `objects`).
- **Extracted (session 1)**: 7 — the foundational MAX_PATCHING.md cluster.
- **Pending**: 120.

## Distribution by destination

| Destination file | Topics |
|---|---|
| `patching/MAX_PATCHING.md` | 56 |
| `patching/MC_PATCHING.md` | 28 |
| `patching/M4L_PATCHING.md` | 22 |
| `patching/JITTER_PATCHING.md` | 16 |
| `patching/GEN_PATCHING.md` | 4 |
| `patching/JIT_GEN_PATCHING.md` | 1 |
| _(skipped)_ | 20 |

`JITTER_PATCHING.md` and `MC_PATCHING.md` are new files created with this
session — initially scoped stubs that the upcoming jitter/ and mc/ clusters
will fill in.

## Sessions

### 2026-05-07 — Session 1 (Sonnet, paired with Opus 4.7 for analysis)

**Cluster**: foundational MAX_PATCHING.md cluster (7 topics).

| Topic | Destination | Notes |
|---|---|---|
| `patcher_lifecycle.json` | MAX_PATCHING | Init/teardown phases — net new principle area |
| `patching_mechanics.json` | MAX_PATCHING | Productivity shortcuts (low value for spec generation) |
| `scheduler.json` | MAX_PATCHING | Priority model, overdrive, SIAI, defer/deferlow, backlog |
| `polyphony.json` | MAX_PATCHING | poly~/ddg.mono/MC; busy state; mute; mc.poly~/mcs.poly~ |
| `abstractions.json` | MAX_PATCHING | `#`-arg substitution, `#0` unique IDs, patcherargs |
| `subpatchers.json` | MAX_PATCHING | Encapsulation gotcha — state resets to initial |
| `bpatchers.json` | MAX_PATCHING | Embedded vs referenced; `@offset` via thispatcher |

**Insights written**: 26 entries into `userguide_insights.md`, covering Patcher
Lifecycle, Scheduler & Priority, Polyphony, Abstractions/Subpatchers/bpatchers,
and Patching Mechanics.

**Promotion candidates**: 9 entries flagged `[PROMOTION-CANDIDATE]` — primarily
new sections that would extend `patching/MAX_PATCHING.md` (no existing
coverage of lifecycle, scheduler priority, defer/deferlow, polyphony,
abstraction arg substitution, encapsulation reset).

**State updates**: 7 first-cluster entries marked `extracted`; 20 UI/refpage
overlap entries marked `skipped` upfront.

**Resume point**: choose next cluster. Strong candidates:

1. **Patcher fundamentals continued** — `patching.json`, `patching_mechanics.json`
   (already done), `patcher_window.json`, `patch_cords.json`, `messages.json`,
   `message_types.json` — small cluster, finishes the "what is a patcher" core.
2. **Data and state** — `pattr.json`, `parameter_mode.json`, `param_connect.json`,
   `presets_and_interpolation.json`, `snapshots.json`, `dictionaries.json`,
   `arrays.json`, `prototypes.json`, `max_define.json` — high-value for
   converter spec design.
3. **Audio infrastructure** — `audio_channels.json`, `frequency_domain.json`,
   `sample_accurate_messages.json`, `transport.json`, `non_realtime.json`.
4. **MIDI + control** — `midi.json`, `OSC.json`, `mapping.json`,
   `controlling_max_with_messages.json`.
5. **Scripting** — `scripting_overview.json`, `javascript.json`.
6. **JITTER_PATCHING.md fill** — start the 16-topic Jitter cluster (matrix,
   textures, video, video_engine, graphics_engine).
7. **MC_PATCHING.md fill** — start the 28-topic MC cluster (mc_wrapper,
   mc_channel_topology, mc_dynamic_routing, mc_polyphony).
