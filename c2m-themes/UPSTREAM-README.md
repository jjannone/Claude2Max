# Claude2Max Design System

A theme-agnostic clean-scifi visual system for Max/MSP **presentation
panels** and **`jsui` canvases**, built for the
[Claude2Max](https://github.com/jjannone/Claude2Max) toolchain.

The system gives Claude a single component vocabulary that can render in
any of five sci-fi reference looks — pick one per patch (or per panel)
by linking the matching theme stylesheet on top of `tokens.css`.

> **Source repository:** `jjannone/Claude2Max` (default branch `main`).
> Read entry points: `README.md`, `CLAUDE.md`, `SPEC_REFERENCE.md`,
> `TUTORIAL_GUIDELINES.md`, `patches/*.maxpat`.

---

## What Claude2Max is

Claude2Max lets a student describe a Max/MSP patch in JSON and convert
it to a real `.maxpat` that opens directly in Max 9. Claude is the
author — it writes the spec, the converter does layout, the spec is
embedded back into the patch for round-tripping. `add_tutorial.py`
walks students through a finished patch step by step (highlight panels +
bubble-arrow annotations).

The system here styles the **two surfaces Claude2Max actually authors**:

1. **Presentation view** — the clean control panel that opens when the
   patch loads (`openinpresentation: 1`), often built with `jsui`.
2. **Tutorial overlay** — annotations + highlight panels drawn over
   Max's native canvas during a guided walkthrough.

> **Patching is Max's job.** Boxes, cables, grid, and object shapes are
> left to Max's native UI. We never restyle them.

---

## Themes

The system ships **five reference themes**. Same component code, same
token names — only the values change. Pick the theme that fits the
patch's mood:

| Theme        | Reference                                  | Vibe                                                  |
| ------------ | ------------------------------------------ | ----------------------------------------------------- |
| `lcars`      | Star Trek TNG / Voyager (Mike Okuda)       | Warm amber on matte black, pill endcaps, Antonio.     |
| `nostromo`   | *Alien* (1979) — MOTHER terminal           | Phosphor green CRT, scanlines, VT323 dot-matrix.      |
| `territory`  | *Blade Runner 2049* (Territory Studio)     | Cyan/amber/magenta data dashboard, Rajdhani, hairline strokes. |
| `cyberpunk`  | *Cyberpunk 2077* HUD                       | Yellow + red, sharp corners, slashes, chromatic glitch. |
| `westworld`  | *Westworld* (Perception NYC)               | Bone-white on near-black, surveying instrument, no glow. |

Switch themes by linking the right CSS:

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="themes/territory.css">
```

Or scope a theme to a sub-tree with `data-theme`:

```html
<div data-theme="nostromo"> … MOTHER readout … </div>
```

LCARS is the conventional default for first-run Claude2Max patches.

---

## Index

| File / folder                   | What's in it                                                |
| ------------------------------- | ----------------------------------------------------------- |
| `README.md`                     | This file. High-level system + foundations.                 |
| `SKILL.md`                      | Agent Skill manifest — drop-in for Claude Code.             |
| `tokens.css`                    | Theme-neutral semantic tokens (the only file components read). |
| `themes/lcars.css`              | LCARS theme overrides.                                      |
| `themes/nostromo.css`           | Nostromo / *Alien* MOTHER theme overrides.                  |
| `themes/territory.css`          | *Blade Runner 2049* theme overrides.                        |
| `themes/cyberpunk.css`          | *Cyberpunk 2077* theme overrides.                           |
| `themes/westworld.css`          | *Westworld* theme overrides.                                |
| `assets/`                       | Logo, glyphs, icon refs.                                    |
| `preview/`                      | Cards rendered in the Design System tab.                    |
| `ui_kits/presentation_panel/`   | jsui-style presentation panel — primary product surface.    |
| `ui_kits/tutorial_overlay/`     | Bubble-arrow annotation + highlight-panel tutorial state.   |

---

## Token model

Components reference **only role-named tokens** from `tokens.css`. The
appearance of a role is set by the active theme.

| Role group             | Examples                                              |
| ---------------------- | ----------------------------------------------------- |
| Surfaces (`--c2m-bg-*`) | `void`, `deep`, `base`, `raised`, `sunken`, `tooltip` |
| Foregrounds (`--c2m-fg-*`) | `primary`, `secondary`, `muted`, `disabled`, `on-accent` |
| Strokes (`--c2m-stroke-*`) | `faint`, `base`, `strong`                          |
| Accents (`--c2m-accent-*`) | `1` (primary), `2` (secondary), `3` (tertiary), `1-tint`, `2-tint` |
| Status (`--c2m-status-*`) | `ok`, `warn`, `err`, `info`                        |
| Type families          | `--c2m-font-display`, `--c2m-font-mono`, `--c2m-font-ui` |
| Frame metaphors        | `--c2m-frame-rail-show`, `--c2m-frame-scanline`, `--c2m-frame-grain`, `--c2m-frame-corner` |

If you find yourself hard-coding a hex, you're off the rails — add a
token instead.

---

## Content Fundamentals

Claude2Max writes for **students with little coding experience** — every
surface, error, and label has to be readable cold. Copy is short,
imperative, jargon-free.

- **Voice**: instructional and second-person ("Click to start", "Drag a
  cable from this outlet"). No marketing voice. No emoji.
- **Casing**: **ALL-CAPS for any name Claude invents** — `send`/`receive`
  names, `pv` patcher variables, `buffer~` names, JS variable names.
  Body copy stays sentence-case.
- **Tracking**: caps labels are tracked +0.14em (`--c2m-tracking-caps`).
- **Tone**: confident and procedural — never apologetic. Errors name the
  fix, not the failure.
- **Numbers**: always tabular-nums so readouts don't jitter.
- **What we don't do**: emoji, exclamation points, congratulations,
  "🎉 Done!" toasts, gradient marketing buttons, anthropomorphic
  ("Claude thinks…") copy.

---

## Visual Foundations

### Color (theme-driven)

Every theme provides three accents (`--c2m-accent-1/2/3`), four status
colors, and a three-tier surface stack. The accent values change per
theme; the **roles** don't:

- **Accent 1** = primary brand accent (LCARS amber, Nostromo green,
  Territory cyan, Cyberpunk yellow, Westworld bone).
- **Accent 2** = secondary highlight or alert ramp.
- **Accent 3** = tertiary / data dimension (Territory magenta,
  Westworld red).
- **Status err** is theme-tuned but always reads as "stop now".

### Type (theme-driven)

Three families per theme: **display**, **mono**, **ui**. Most copy uses
mono. Display only for big readouts and section titles. UI only for body
sentences (tutorial bubbles, help text). The scale `10/12/13/15/18/24/34/56/88`
is invariant across themes.

### Backgrounds

No images, no gradients. Flat fills layered: `void → deep → base →
raised`. Some themes opt into a `--c2m-frame-scanline` overlay
(Nostromo, Territory) — applied as a `repeating-linear-gradient`, never
an image.

### Shape

Corners are theme-driven via `--c2m-frame-corner`:
- LCARS → `pill` (endcaps only, body 2px)
- Nostromo / Cyberpunk / Territory / Westworld → `sharp` (0–2px)

Borders are 1px hairlines (`--c2m-stroke-base`) — never colored borders
for grouping, except where the theme mandates it (Cyberpunk yellow
hairlines).

### Motion (theme-invariant)

- **Default ease**: `cubic-bezier(0.2, 0.8, 0.2, 1)` — snappy.
- **Mechanical**: `cubic-bezier(0.7, 0, 0.3, 1)` for state changes.
- **Durations**: 60 / 120 / 200 / 400ms.
- **No bounces, no spring physics**. State changes are crossfades or
  instantaneous.
- **Hover**: stroke goes `--c2m-stroke-base` → `--c2m-stroke-strong` +
  `--c2m-glow-1`. No translate.
- **Press**: surface drops one level (`bg-raised` → `bg-sunken`).

### Layout

- **Grid**: 4px base. Component padding `space-3` inside, `space-5`
  between groups, `space-7` between sections.
- **Density**: high. Max patches expose a lot of state; small mono
  labels over whitespace.
- **Transparency / blur**: not used.

---

## Iconography

Claude2Max has **no built-in icon font**. Max uses object shapes as
iconography; `jsui` UIs draw their own glyphs.

- **Primary**: 1px-stroke geometric SVG drawn from primitives
  (circles, squares, triangles, chevrons). Stroke uses `currentColor`.
- **CDN substitution**: [Tabler Icons](https://tabler-icons.io/) when a
  needed glyph is outside the geometric set. Flagged as a substitution.
- **No emoji.**
- **Unicode glyphs** used where they're already part of Max's vocabulary:
  `▶ ◀ ■ ● ◯ ▲ ▼ ◊ ⏵ ⏸`. Drawn in mono.

---

## Caveats & Substitutions

- **Antonio for Eurostile/Microgramma** (LCARS theme). Antonio is the
  closest free match. Override `--c2m-font-display` if a licensed face
  is available.
- **VT323 for Nostromo terminal face**. The film used a custom
  dot-matrix; VT323 is the closest free CRT face.
- **Rajdhani for Territory / Cyberpunk display**. The films use custom
  faces; Rajdhani is the closest condensed-technical free match.
- **No real product icon set in upstream.** Tabler is used as the
  substitute family.
- **No brand logo provided.** A wordmark is generated from the type
  system in `assets/logo.svg` — geometric, mono-style, easy to replace.
