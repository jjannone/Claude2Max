---
name: claude2max-design
description: Use this skill to generate well-branded interfaces and assets for Claude2Max — the Max/MSP patch generator — either for production or throwaway prototypes/mocks/etc. Contains essential design guidelines, colors, type, fonts, assets, and UI kit components for prototyping clean-scifi Max patcher views, presentation panels, and jsui canvases.
user-invocable: true
---

Read the README.md file within this skill, and explore the other available files.

If creating visual artifacts (slides, mocks, throwaway prototypes, etc),
copy assets out and create static HTML files for the user to view. If
working on production code, you can copy assets and read the rules here
to become an expert in designing with this brand.

If the user invokes this skill without any other guidance, ask them what
they want to build or design, ask some questions, and act as an expert
designer who outputs HTML artifacts _or_ production code, depending on
the need.

Key surfaces this system covers:
- **Presentation view** — clean panel that opens when a `.maxpat` loads.
- **`jsui` canvas** — custom-drawn UIs (readouts, meters, step
  sequencers).
- **Tutorial overlay** — bubble-arrow annotations + highlight panels
  layered on top of Max's native patching surface.

The patching surface itself (boxes, cables, object shapes) is **left
to Max's native UI** — do not restyle it.

## Themes

The system is **theme-agnostic**. Components only read role-named
tokens from `tokens.css`. Five reference themes ship in `themes/`:

- `lcars` — Star Trek TNG / Voyager (default; warm amber, pill endcaps)
- `nostromo` — *Alien* MOTHER terminal (phosphor green, scanlines, VT323)
- `territory` — *Blade Runner 2049* (cyan/amber/magenta, dense data)
- `cyberpunk` — *Cyberpunk 2077* (yellow + red, slashes, sharp corners)
- `westworld` — *Westworld* (bone-white surveying instrument)

Pick one per artifact unless the user asks otherwise. Load order:

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="themes/<theme>.css">
```

Or scope a theme with `data-theme="<theme>"` on a sub-tree. Never
hard-code hex values — use `--c2m-bg-*`, `--c2m-fg-*`, `--c2m-stroke-*`,
`--c2m-accent-1/2/3`, `--c2m-status-*`.

Hard rules from upstream `CLAUDE.md`:
- ALL-CAPS for any user-defined name (sends, receives, buffers, JS vars).
- No emoji, ever.
- `presentation_rect` is stored `[x, y, w, h]`, never two corners.
- Mono-first typography. Tabular numerals on every readout.
