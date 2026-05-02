---
name: c2m-design
description: Design a presentation-mode UI for a Claude2Max .maxpat using the c2m-themes design system (10 themes — lcars, nostromo, territory, cyberpunk, westworld, swiss, bauhaus, memphis, soviet, lcars-bold). Use when the user asks for help designing a presentation panel, presentation view, panel layout, themed UI, or jsui canvas, or invokes /c2m-design. Reads from c2m-themes/ (tokens.css + themes/<theme>.css + README.md) and translates the resulting design back into spec coordinates the converter can use. Skip for non-Claude2Max design work and for purely patching-view edits.
argument-hint: "[theme-name]"
---

# c2m-design — Claude2Max presentation UI design

Use this skill when the user is designing the **presentation view** (the user-facing panel that opens when a `.maxpat` loads) or a **jsui canvas** for a Claude2Max patch, and wants the result themed using the c2m-themes design system.

The patching surface itself is left to Max's native UI — never restyle boxes, cables, or object shapes.

## Step 0 — Decide whether to switch to Opus

Per `CLAUDE.md` "Model Selection", presentation UI design is one of the documented Opus trigger cases. If the user has not already switched, stop and offer them the two options below verbatim:

> "Before we design the presentation UI, choose an approach:
> - **Option A** — run `/model claude-opus-4-7` and we'll design it here (Opus = same model as Claude Design)
> - **Option B** — take the design to [claude.ai/design](https://claude.ai/design), which has separate usage included with your account, then bring the layout back and I'll translate it into spec coordinates
>
> Which would you prefer?"

Wait for the user's choice. If they choose Option B, ask them to describe or paste the layout when they return and translate it into spec coordinates on Sonnet.

## Step 1 — Read the design system

The design system is at the repo root in `c2m-themes/`:

- `c2m-themes/tokens.css` — the role-named CSS contract (`--c2m-bg-*`, `--c2m-fg-*`, `--c2m-stroke-*`, `--c2m-accent-1/2/3`, `--c2m-status-*`, `--c2m-frame-*`)
- `c2m-themes/themes/<theme>.css` — the ten reference themes
- `c2m-themes/README.md` — the per-theme **graphic-elements** reference (rails, scanlines, slabs, dividers, primitives, hairlines) plus token-group reference and per-theme caveats
- `c2m-themes/UPSTREAM-README.md` — additional content rules (typography, color usage, surface inversion, rules for paper-light themes)

Read all of these before proposing a layout. Themes are not just color swaps — each carries characteristic graphic elements that consume real space and must be planned for from the start.

## Step 2 — Pick (or confirm) the theme

If the user passed a theme name as `$ARGUMENTS`, use it. Otherwise ask which of the ten reference themes they want, or whether they want a different aesthetic that you should derive a token map for.

Ten reference themes:

| Theme        | Surface     | Accent palette              | Notes                              |
| ------------ | ----------- | --------------------------- | ---------------------------------- |
| lcars        | deep black  | amber · mauve · orange      | rail + pill endcaps + display font |
| nostromo     | deep black  | phosphor green              | scanlines, VT323, CRT flicker      |
| territory    | deep black  | cyan · amber · magenta      | hairline data grid, dense readouts |
| cyberpunk    | deep black  | yellow · red                | yellow hairline borders, slashes   |
| westworld    | bone white  | ivory · muted red           | crosshairs, no glow, instrument feel|
| swiss        | cream paper | red · ink · indigo          | bold red rule, massive numerals    |
| bauhaus      | cream paper | red · blue · yellow         | red circle / blue square / yellow tri|
| memphis      | warm cream  | pink · teal · yellow        | hard offset shadow, confetti shapes |
| soviet       | cream paper | red · ink · rust            | red title slab, dividers, ink output|
| lcars-bold   | deep black  | amber · mauve · orange      | larger cut of lcars, stronger glow  |

## Step 3 — Design the layout

Hard rules from `CLAUDE.md` and `MAX_PATCHING.md` that always apply:

- ALL CAPS for any user-defined name (sends, receives, buffers, pv/v vars, JS vars, patcher names)
- No emoji, ever
- `presentation_rect` is `[x, y, w, h]` — never two corners
- Mono-first typography; tabular numerals on every readout
- Every presented control needs an adjacent comment label
- Set `openinpresentation: 1` on the patcher so it opens in presentation mode by default
- Exclude infrastructure (metros, routers, loadbangs, print objects) from presentation
- Multislider width = step_count × 40–50px, **never** window-derived
- Comment widths use ~7px/char for default fonts, ~8.5px/char for Courier/Monaco
- Compensate ~4px for Max comment internal padding when aligning labels with controls

Plan the graphic elements **before** placing controls — they consume real space. For instance, a soviet layout needs vertical space reserved for the masthead title slab and horizontal red dividers between sections; an lcars layout needs ~70px reserved for the left rail.

## Step 4 — Translate back into spec coordinates

The output of this skill is either:

1. **An HTML/CSS mock** for visual review (use `c2m-themes/tokens.css` + the chosen theme), OR
2. **Patch deltas** — a list of presentation-mode `presentation_rect` values, `bgcolor` / `textcolor` / `bordercolor` / `tricolor` etc. attribute changes, and any new `panel`/`comment`/`fpic` boxes — applied via `extract → edit → convert` against the existing `.maxpat`.

Per the **"Modify, Don't Rebuild"** rule in `CLAUDE.md`: never rebuild the spec from scratch when adding a theme to an existing patch. Always extract the embedded spec, apply only the deltas, convert back. The original's wiring, defaults, alignment offsets, and tutorial system must survive.

Per **"Never Write API Names From Memory"**: every color attribute name (e.g. `coldcolor`, `warmcolor`, `slidercolor`, `tricolor`, `htricolor`, `checkedcolor`, `bordercolor`, `elementcolor`) must be verified against the object's `<obj>.maxref.xml` before use. Max silently accepts unknown attribute names and ignores them — there is no error message to catch a guess.

## Step 5 — Verify visually

After conversion, take a screenshot of the presentation view via the computer-use MCP and review against the `c2m-themes/README.md` per-theme graphic-elements list. Iterate until the patch reads as the chosen theme, not "wrong colors on a default Max patch." If computer-use is unavailable, say so explicitly rather than claiming success.
