# Jitter Patching Reference

Specialized companion to `MAX_PATCHING.md`, sibling to `GEN_PATCHING.md` /
`JIT_GEN_PATCHING.md`. Covers Jitter — Max's matrix and OpenGL graphics
subsystem — at the level above per-object reference.

This file is **incrementally filled** by the userguide crawl
(`userguide/USERGUIDE_CRAWL_LOG.md`). Topics in scope:

| Userguide topic | Status |
|---|---|
| `jitter/matrix.json` | pending |
| `jitter/textures.json` | pending |
| `jitter/video.json` | pending |
| `jitter/video_engine.json` | pending |
| `jitter/graphics_engine.json` | pending |
| `jitter/graphics_processing.json` | pending |
| `jitter/geometry.json` | pending |
| `jitter/render_passes.json` | pending |
| `jitter/depth_layer_blend.json` | pending |
| `jitter/jxs_file_format.json` | pending |
| `jitter/jitter_expr.json` | pending |
| `lua/*` (5 GL Lua binding topics) | pending |

## What this companion covers

Cycling '74's Jitter system — `jit.matrix`, `jit.gl.*`, video and texture
processing, OpenGL state, render passes, JXS shader binding, and `jit.expr`.
Anything **inside** a `jit.gen` / `jit.gl.pix` box belongs in
`JIT_GEN_PATCHING.md` instead; this file covers the host patcher level —
matrix routing, texture binding, GL pipeline composition, video sources and
sinks, `jit.world` / `jit.gl.render` lifecycle, and the cross-cutting Jitter
idioms.

Until the crawl fills this in, consult:

- `cookbook/cookbook_insights.md` — § Video/Jitter (12 recipes analyzed).
- `c74-forum/forum_insights.md` — § Jitter (Jitter-heavy after pass-5).
- `SPEC_REFERENCE.md` § Jitter Display — JXS texture-binding-by-`<param>`-order
  rule.
- The Jitter refpages directly via `RefpageCache` (lookup, not crawl).

## Cross-References

- **Per-cell / per-pixel gen graphs** — see `JIT_GEN_PATCHING.md`. Anything
  inside a `jit.gen` / `jit.gl.pix` box uses gen-language rules.
- **Audio-rate gen** — see `GEN_PATCHING.md`.
- **Patcher-level Jitter idioms (current)** — see `MAX_PATCHING.md` § "Jitter /
  GL knowledge" until this file is filled out.
- **Refpage source of truth** —
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/jit-ref/<obj>.maxref.xml`,
  parsed by `RefpageCache._parse` in `spec2maxpat.py`.
