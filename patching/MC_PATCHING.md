# MC (Multichannel) Patching Reference

Specialized companion to `MAX_PATCHING.md`. Covers Max's MC system — the
multichannel-signal wrapper that turns scalar `~` objects into per-channel
arrays without manually duplicating boxes.

This file is **incrementally filled** by the userguide crawl
(`userguide/USERGUIDE_CRAWL_LOG.md`). Topics in scope:

| Userguide topic | Status |
|---|---|
| `mc.json` (top-level overview) | pending |
| `mc/mc_wrapper.json` | pending |
| `mc/mc_channel_topology.json` | pending |
| `mc/mc_dynamic_routing.json` | pending |
| `mc/mc_patchcords.json` | pending |
| `mc/mc_messages_to_wrapper.json` | pending |
| `mc/mc_generated_messages.json` | pending |
| `mc/mc_polyphony.json` | pending |
| `mc/mc_poly_without_polytilde.json` | pending |
| `mc/mc_poly_multiple_patchers.json` | pending |
| `mc/mc_poly_newfeatures.json` | pending |
| `mc/mc_mcvsmcs.json` | pending |
| `mc/mc_audio_delays.json` | pending |
| `mc/mc_function_generators.json` | pending |
| `mc/mc_mixing_panning.json` | pending |
| `mc/mc_spatialization.json` | pending |
| `mc/mc_multichannel_sources.json` | pending |
| `mc/mc_signals_newobjects.json` | pending |
| `mc/mc_visualization.json` | pending |
| `mc/mc_plugins.json` | pending |
| `mc/mc_maxforlive_interface.json` | pending |
| `mc/mc_gen.json` | pending |
| `mc/mc_gen_event_wrapper.json` | pending |
| `mc/mc_gen_instances.json` | pending |
| `mc/mc_gen_newfeatures.json` | pending |
| `mc/mc_gen_newobjects.json` | pending |
| `mc/mc_events_newobjects.json` | pending |
| `mc/mc_events_newfunctions.json` | pending |

## What this companion covers

Cycling '74's MC system — the `mc.*` and `mcs.*` object families, multichannel
patchcords, channel-topology rules, MC↔scalar conversion, MC-flavored
polyphony (`mc.poly~`, `mcs.poly~`, `mc.voiceallocator~`,
`mc.noteallocator~`), MC-with-gen, multichannel routing, panning,
spatialization, and the M4L surface for MC.

The MC system is a separate paradigm from the patcher-level `~` model: a
single MC patchcord carries N independent channels, and most `mc.*` objects
broadcast to every channel automatically. This file captures the principles
that aren't visible in the per-object refpages — channel inheritance rules,
when MC vs MCS is right, how MC interacts with `poly~`, how to think about
MC + Gen instances.

Until the crawl fills this in, consult:

- `polyphony.json` § "mc.poly~ and mcs.poly~" (already extracted in
  `userguide/userguide_insights.md` § Polyphony) — distinguishes
  `mc.poly~` (per-voice channels) from `mcs.poly~` (collapsed MC I/O).
- The MC refpages directly via `RefpageCache` (lookup, not crawl).
- `cookbook/cookbook_insights.md` and `c74-forum/forum_insights.md` for
  community-sourced MC patterns.

## Cross-References

- **Patcher-level audio rules** — see `MAX_PATCHING.md`. Anything about
  signal-graph construction, scheduler interaction, audio-thread cost, etc.,
  applies to MC the same way.
- **Polyphony in general** — see the Polyphony entries in
  `userguide/userguide_insights.md` (and eventually
  `MAX_PATCHING.md` once promoted). MC polyphony is one of three approaches
  alongside `poly~` and `ddg.mono`.
- **Gen inside MC** — when `mc.gen~` instances need iteration semantics,
  see `GEN_PATCHING.md`. The MC overlay (instance count, per-instance
  parameters) is MC-specific and lives here.
- **Refpage source of truth** —
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/msp-mc-ref/<obj>.maxref.xml`,
  parsed by `RefpageCache._parse` in `spec2maxpat.py`.
