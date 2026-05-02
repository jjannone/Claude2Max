# Claude2Max Design System — Theme Bundle

Self-contained snapshot of the Claude2Max token contract plus **ten themes**
(five canonical + five new). Drop the contents into the upstream
`Claude2Max-design` repo and you're done — no other changes required.

## Contents

```
tokens.css                  ← the contract (role-named --c2m-* vars)
themes/
  lcars.css                 ← canonical
  nostromo.css              ← canonical
  territory.css             ← canonical
  cyberpunk.css             ← canonical
  westworld.css             ← canonical
  swiss.css                 ← NEW · Müller-Brockmann / International Style
  bauhaus.css               ← NEW · Bayer / Moholy-Nagy
  memphis.css               ← NEW · Sottsass / Milan 1981
  soviet.css                ← NEW · Rodchenko / Lissitzky
  lcars-bold.css            ← NEW · alternate cut of LCARS, pushed
UPSTREAM-README.md          ← upstream system docs (content rules, type, color)
UPSTREAM-SKILL.md           ← upstream agent skill manifest
```

## Install

Drop the files into the upstream Claude2Max design system, preserving paths:

```bash
cp tokens.css      /path/to/Claude2Max-design/tokens.css
cp themes/*.css    /path/to/Claude2Max-design/themes/
```

Then add the new five to `SKILL.md`'s themes list.

## Use

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="themes/swiss.css">
```

Or scope per sub-tree:

```html
<div data-theme="bauhaus"> ... </div>
<div data-theme="memphis"> ... </div>
<div data-theme="soviet"> ... </div>
<div data-theme="lcars-bold"> ... </div>
```

## New themes — one-line each

| Theme        | Surface     | Accent 1 / 2 / 3              | Rail | Corner          | Glow              |
| ------------ | ----------- | ----------------------------- | ---- | --------------- | ----------------- |
| swiss        | cream paper | red · ink · indigo            | off  | sharp           | none              |
| bauhaus      | cream paper | red · blue · yellow           | off  | sharp + circle  | none              |
| memphis      | warm cream  | pink · teal · yellow          | off  | sharp + pill    | hard offset       |
| soviet       | cream paper | red · ink · rust              | off  | sharp           | none (grain on)   |
| lcars-bold   | deep black  | amber · mauve · orange        | on   | pill            | strong amber      |

## Caveats

**Surface inversion.** Four of the new five (swiss / bauhaus / memphis /
soviet) are **paper-light**, not deep-black. Components that read
`--c2m-fg-primary` adapt automatically. Components that hard-code
`color: white` on dark backgrounds will misrender — fix at the component,
not the theme.

**Memphis glow.** `--c2m-glow-1` is repurposed as a hard offset shadow
(`4px 4px 0 #1a1a1a`). Components that consume glow as `box-shadow` get
the effect; components that use `filter: drop-shadow()` won't pick it up.

**Bauhaus shape mapping.** When drawing primitive shapes, follow Bayer's
mapping: red = circle (accent-1), blue = square (accent-2), yellow =
triangle (accent-3).

**Soviet wedges.** Sister-theme to LCARS in conviction. Use diagonal red
wedges (`clip-path: polygon(0 0, 100% 50%, 0 100%)`) as section markers,
equivalent to LCARS elbows.

## Per-theme graphic elements reference

Themes are not just color swaps. Each one has characteristic graphic elements that, when feasible in Max, deepen the aesthetic. This table is a **reference and source of inspiration**, not a requirement. Use what works in Max's object model; skip what doesn't. Color palette, typography, and layout alone already carry the theme.

Use this as a guide when applying a theme to a `.maxpat`. All items are optional — apply them when they add real visual value in Max, leave them out when they don't.

### Canonical themes

| Theme        | Graphic elements |
| ------------ | ---------------- |
| `lcars`      | **Vertical left rail** (full-height amber `panel`, `rounded` ≈ 30, ~70 px wide) · **Top header bar** (amber, `rounded` ≈ 32, ~36 px tall) with display-font title · **Section pill labels** along the rail (small comments with black-on-amber, centered) · *Mauve secondary accent block* near header right · *Pill endcaps* on every grouped panel (`rounded` ≥ 18) |
| `lcars-bold` | Same as `lcars` but **larger** — header bar ≥ 56 px tall with title ≥ 36 px display font, rail ≥ 80 px wide, **stronger glow** (use brighter amber accent fills, no faint outlines), more **mauve / orange accent blocks** for showpiece feel |
| `nostromo`   | **Scanline overlay** as a `jsui` canvas drawing horizontal `rgba(0,255,0,0.04)` lines at 2 px pitch, full-presentation, layered above panels · *VT323 dot-matrix font* on every readout (use a Max comment font that approximates) · **CRT flicker** optional via `jsui` low-frequency alpha jitter · sharp 0–2 px corners on all panels |
| `territory`  | **Hairline data-grid overlay** as `jsui` (1 px cyan lines, ~32 px pitch) · **Three-color readouts** — primary cyan, secondary amber, tertiary magenta — split across panels rather than mixed · **Section number tags** (small magenta comments like "01 / 04" at panel top-left) · sharp corners |
| `cyberpunk`  | **Yellow hairline borders** (1 px, `--c2m-accent-1`) on every panel — borders are intentional in this theme, not avoided · **Slash motif** — diagonal yellow `panel` strips (use a thin tall `panel` rotated visually via clip-path equivalent: a narrow triangle shape) at section corners · **Red status callouts** for any error/active state · sharp corners, no rounding |
| `westworld`  | **Bone-white surveying-instrument feel** — thin ivory `panel` outlines, no fills, **no glow** · **Crosshair / register marks** as `comment` glyphs (`+`, `·`, `○`) at panel corners · **Annotation text** in muted-red small caps near each readout, like instrument labels · sharp corners |

### New themes

| Theme        | Graphic elements |
| ------------ | ---------------- |
| `swiss`      | **Bold red horizontal rule** (~4–6 px tall `panel`, accent-1) under each section title · **Strict left-aligned grid** — every label and value snaps to the same x · **Massive section numerals** (display font, ≥ 56 px, indigo) as the section's primary label · sharp corners, no glow, paper-cream background |
| `bauhaus`    | **Primitive shape mapping** — red **circle** (`panel` with `rounded` = ½ side or jsui circle) for accent-1, blue **square** (sharp `panel`) for accent-2, yellow **triangle** (jsui) for accent-3 · One large primitive per section as its visual anchor · **Geometric grid** of thin black hairlines · paper-cream background |
| `memphis`    | **Hard offset shadow** on every panel — duplicate each `panel` as a black `panel` shifted `+4 px, +4 px` and placed beneath (z-order behind) · **Mixed pill + sharp corners** (alternate per panel) · **Confetti shapes** — small pink/teal/yellow `panel` triangles and circles scattered as background decoration · warm-cream surface |
| `soviet`     | **Heavy red title slab** (≥ 10 px tall `panel`, accent-1, full-width under title) — the masthead element · **Display-scale title** (≥ 38 px Helvetica Neue Black or similar, all caps, ink) — Rodchenko poster volume, never timid · **Red horizontal section dividers** (4 px `panel` strips, accent-1) between every major section — these are the constructivist grid · **Sectional figure/ground** — every control group sits on a `panel` of `--c2m-bg-sunken` or `--c2m-bg-deep`; never let controls float on the base cream alone · **Inverted output zone** — give the audio output section an ink-colored `panel` to invert figure/ground (parameter zones are dark-on-cream, output zone is cream-on-ink) · **Two-tier section labels** — large display-font header (e.g. "PITCH") paired with a small monospace subtitle giving the actual range or units (e.g. "MIDI 36 — 84"), the pair anchors each section · **Ink number boxes** on interactive controls — `bgcolor` ink, `textcolor` cream, `tricolor`/`htricolor` red — they read as instrument readouts, not default Max chrome · **Differentiated read-only displays** — sunken-cream `bgcolor`, ink text, no triangle, `ignoreclick 1` — read-only ≠ interactive at a glance · **Styled toggle** — `bgcolor` ink, `checkedcolor` red — the X is the binary state · sharp corners throughout (`rounded: 0`) · *Optional, omit unless they earn space:* diagonal red wedge markers, paper-grain `jsui` overlay |

### How to read a theme's graphic-element signals

If you're applying a theme not listed above, derive its graphic elements from these CSS tokens before starting:

- `--c2m-frame-rail-show: 1` → draw a full-height accent-1 rail panel
- `--c2m-frame-corner: pill` → use `rounded` ≥ 16 on all grouped panels
- `--c2m-frame-corner: sharp` → use `rounded` = 0–2
- `--c2m-frame-scanline: <gradient>` → render the gradient as a `jsui` overlay
- `--c2m-frame-grain: <gradient>` → render as a low-alpha `jsui` noise/grain overlay
- Bright `--c2m-glow-1` (heavy alpha) → use saturated accent fills on action elements; thin/faint accents will under-deliver
- Paper-light `--c2m-bg-base` → invert assumptions: dark text on light, no glow effects, ink-color hairlines instead of light strokes

A themed patch without its graphic elements reads as "wrong colors on a default Max patch." Plan the presentation layout around the graphic elements from the start — they consume real space.

## Hard rules (still apply, all themes)

From upstream `README.md` / `CLAUDE.md`:

- ALL-CAPS for any user-defined Max name (sends, receives, buffers, JS vars).
- No emoji, ever.
- `presentation_rect` is `[x, y, w, h]`, never two corners.
- Tabular numerals on every readout.
- Mono-first typography; display only for large readouts and section titles.
- Never restyle Max's patching surface — only presentation panels, jsui
  canvases, and tutorial overlays.

## Token groups (read by components)

- `--c2m-bg-{void,deep,base,raised,sunken,tooltip}`
- `--c2m-fg-{primary,secondary,muted,disabled,on-accent}`
- `--c2m-stroke-{faint,base,strong}`
- `--c2m-accent-{1,2,3,1-tint,2-tint}`
- `--c2m-status-{ok,warn,err,info}`
- `--c2m-font-{display,mono,ui}`
- `--c2m-radius-{sm,md,pill}`
- `--c2m-glow-{1,2,err}`
- `--c2m-frame-{rail-show,scanline,grain,corner}`

Every theme in this bundle defines the full set. No new tokens added.
