# Tutorial Generation Guidelines

Read these guidelines before running or modifying `add_tutorial.py`, **and before fixing any reported tutorial breakage**.

## Tutorial structural contract

A tutorial is functional when **every box and patchline below is present with every listed attribute set**. These are the structural invariants of the system; verify against them directly. (If a working example is needed for visual reference, any patch in `patches/` whose tutorial is currently functional will do — but the *contract* below is authoritative, not any specific file.)

1. **Scripting names (`varname`) on every tutorial box**
   - Every panel has `varname: "tut-panel-N"` for N = 0..steps-1
   - Every annotation has `varname: "tut-ann-N"` for N = 0..steps-1
   - The JS uses `patcher.getnamed(varname)` — without varname the lookup fails silently and the JS appears inert
2. **Panel attrs (every `tut-panel-*` box)**
   - `hidden: 1` — panels start invisible; the JS unhides only the current step's panel
   - `background: 1` — render BEHIND highlighted objects, not on top of them
   - `locked_bgcolor: 1` — panel is locked so it can't be dragged/resized while editing the rest of the patch
   - Highlight visual: `bgcolor` (translucent fill), `bordercolor`, `border` (border width), `rounded` (corner radius)
3. **Annotation comment attrs (every `tut-ann-*` box)**
   - `hidden: 1`
   - `bubble: 1` — without this it renders as a plain rectangle and Max stretches its width to fit a single line of text
   - `bubble_bgcolor: [r, g, b, a]` — bubble fill color. **Plain `bgcolor` does NOT apply when `bubble: 1` — only `bubble_bgcolor` does.**
   - `bubbleside` — direction the arrow tail points: `0=top, 1=left, 2=bottom, 3=right`. Choose so the arrow points from the bubble toward the panel it describes
   - `patching_rect` parked at the shared **stow position** (see "Comment pile" below); width fixed at the standard bubble width (`220.0`)
4. **Tutorial nav controls**
   - umenu `items` is populated with tokenized step labels (e.g. `["0:", "Overview", ",", "1:", "loadmess", "+", "unpack", ...]`); without items the menu is empty
   - umenu's first outlet must be type `"int"` so the selected index reaches `msg_int(step)` in the JS
5. **Patchlines** — the four nav controls all wire to the v8 controller's inlet 0:
   - `tut-umenu:0 → tut-v8:0`
   - `tut-prev:0 → tut-v8:0`
   - `tut-next:0 → tut-v8:0`
   - `tut-loadbang:0 → tut-v8:0`
6. **JS controller**
   - `STEPS`, `ANNOTATION_IDS`, `PANEL_IDS` arrays are present with matching lengths
   - `STOW_RECT` and `ACTIVE_RECTS` constants are defined (see "Comment pile" below)
   - `gotoStep()` hides + stows all annotations and panels, then shows + repositions the current step's pair

The diagnostic script under [Sync/convert breakage modes](#syncconvert-breakage-modes--what-not-to-lose) surfaces violations of items 1–4 in one call. Run it before guessing what's wrong.

## Comment pile — annotations are stowed when not current

Tutorial annotation comments are bubble callouts that take up significant space. To avoid cluttering the patcher when a step is not current, all annotations are **parked at a single shared stow position** (a "comment pile") in the `.maxpat`. The JS controller moves the current step's annotation to its real position only while that step is active, and back to the pile when another step is selected.

- The **stow position** is a single `[x, y, w, h]` chosen per patch (typically `x=10`, `y` just below the patch's lowest visible object). All annotations share it, so in unlocked editing mode users see one small stack of overlapping outlines, not a maze of bubbles scattered over the patch.
- The **active position** for each annotation is baked into the JS file as the `ACTIVE_RECTS` array, with one entry per step in `[x1, y1, x2, y2]` form (Max box-rect format — top-left + bottom-right corners, *not* `[x, y, w, h]`).
- The JS holds a `STOW_RECT` constant in the same `[x1, y1, x2, y2]` form.
- `gotoStep(N)`:
  1. For each annotation: `obj.hidden = 1; obj.rect = STOW_RECT`
  2. For each panel: `obj.hidden = 1`
  3. Show current panel: `obj.hidden = 0`
  4. Show + reposition current annotation: `obj.rect = ACTIVE_RECTS[N]; obj.hidden = 0`

This pattern means a tutorial can be added to any patch without permanently displacing the patch's working area with bubble callouts.

**When generating a new tutorial JS or repairing one, both `STOW_RECT` and `ACTIVE_RECTS` must be present** — otherwise `gotoStep` either crashes (undefined ref) or shows annotations at their stowed corner location.

## Annotation Comments

- **Always on top** — annotation comments must be placed FIRST in the boxes array. In Max, earlier items in the array render on top (in front). They must never be obscured by patch objects.
- **Bubble arrows** — use `"bubble": 1` with `"bubble_bgcolor"` for the background color (not plain `"bgcolor"`). Max `@bubbleside` values: **0=top, 1=left, 2=bottom, 3=right**. The arrow appears on that side of the comment, pointing outward toward the group.
- **Arrow direction matters** — if the annotation is to the RIGHT of the group, use `bubbleside=1` (arrow on left, pointing left toward group). If ABOVE, use `bubbleside=2` (arrow on bottom, pointing down). If to the LEFT, use `bubbleside=3` (arrow on right). If BELOW, use `bubbleside=0` (arrow on top).

## Panels (Highlight Rectangles)

- Panels go on the **background layer** (`"background": 1`) and must have **locked background** (`"locked_bgcolor": 1`) so they don't interfere with users editing the patch.
- Panels are inserted at the END of the boxes list (painted behind everything in Max).

## Step Grouping Rules

- **Spatial splitting** — if objects in the same data-flow wave are physically distant (>100px vertical gap or >250px horizontal gap), split them into separate tutorial steps.
- **Merge related objects** — if two steps contain connected objects that are spatially close (Euclidean distance <180px) and the combined group is small (<=4 objects) with a reasonable bounding box (<=400px wide, <=250px tall), merge them into one step.
- **Every object must be covered** — every non-comment, non-tutorial object and message box must appear in exactly one step. Print a warning if any are missing.

## Annotation Placement

Annotations are placed flexibly adjacent to their highlighted group — not in a fixed column. The `--steps-json` and `--ai` modes accept a `placement` hint per step (`"right"`, `"left"`, `"above"`, `"below"`). Default is `"right"`.

- **Right** (default): annotation to the right of the panel, arrow on left (`bubbleside=1`)
- **Left**: annotation to the left of the panel, arrow on right (`bubbleside=3`)
- **Above**: annotation above the panel, arrow on bottom (`bubbleside=2`)
- **Below**: annotation below the panel, arrow on top (`bubbleside=0`)
- If the chosen side pushes the annotation off-screen, it falls back to right or below
- Extend the patch window width to accommodate any annotations that extend beyond the original bounds

## General Principles

- Idempotent: strip all `tut-*` objects before regenerating
- Strip BEFORE generating steps (so old tutorial objects don't affect grouping)
- The tutorial nav bar (umenu + prev/next + v8) goes at the top-right of the patch
- `loadbang` auto-initializes to step 0 when the patch opens

## Tutorial state — what MUST round-trip through sync/convert

The tutorial only works when every one of these properties is intact in the `.maxpat`. They are easy to lose silently in a sync/convert cycle, so the spec must capture them. All listed names must appear in `_PRESERVE_ATTRS` (in `spec2maxpat.py`) — if you add a new tutorial-affecting attribute, add it there too, and verify a sync→convert round-trip preserves it.

### On every panel (`tut-panel-N`)

| Attr | Required value | Why |
|------|---------------|-----|
| `varname` | `tut-panel-N` (matches `PANEL_IDS[N]` in the JS) | `patcher.getnamed()` finds boxes by scripting name (`varname`), not `id`. Without it, the JS can't show/hide the panel. |
| `hidden` | `1` | Panels start hidden; the JS unhides only the current step's panel. Without it, all panels are visible at once and the patching view is unreadable. |
| `background` | `1` | Panels render BEHIND highlighted objects, not on top. Without it, the panel obscures the very objects it's meant to highlight. |
| `locked_bgcolor` | `1` | Panel is locked so users editing the patch don't accidentally drag or resize it. |
| `bgcolor`, `bordercolor`, `border`, `rounded` | (see `add_tutorial.py`) | Visual style of the highlight box. |

### On every annotation comment (`tut-ann-N`)

| Attr | Required value | Why |
|------|---------------|-----|
| `varname` | `tut-ann-N` (matches `ANNOTATION_IDS[N]` in the JS) | Same `getnamed()` requirement as panels. |
| `hidden` | `1` | Annotations start hidden; only the current step's annotation is shown. |
| `bubble` | `1` | Without this the comment renders as a plain rectangle, not a callout, and Max stretches its width to fit the text on a single line. |
| `bubble_bgcolor` | `[1.0, 0.98, 0.72, 1.0]` (warm yellow) | The bubble's fill color. **Plain `bgcolor` does NOT work on bubble comments — must use `bubble_bgcolor`.** |
| `bubbleside` | `0` for Overview (arrow on top, sits below nav bar), `1` for others (arrow on left, sits to the right of its panel) | Direction of the bubble's arrow tail. `0=top, 1=left, 2=bottom, 3=right`. |
| `patching_rect` | `[x, y, 220.0, est_height]` | Bubble comments use a fixed standard width (`ann_w = 220px` per `add_tutorial.py`). Without setting width explicitly, Max will stretch the rect horizontally as the text grows. |

### On the tutorial umenu (`tut-umenu`)

| Attr | Required value | Why |
|------|---------------|-----|
| `items` | Tokenized step labels with `","` separators | Without `items`, the menu is empty. The JS expects to receive the selected step *index* on the umenu's int outlet — items are what populate the menu the user clicks. |
| `numoutlets` | `3` (with `outlettype: ["int", "", ""]`) | First outlet (int = selection index) goes to v8. The other outlets are unused but match Max's umenu defaults. |

### Patchlines that must exist

- `tut-umenu:0 → tut-v8:0` (selection)
- `tut-prev:0 → tut-v8:0` (back button)
- `tut-next:0 → tut-v8:0` (forward button)
- `tut-loadbang:0 → tut-v8:0` (auto-init on patch open)

If any one of these is missing, the corresponding control silently does nothing.

## Sync/convert breakage modes — what NOT to lose

Tutorials are fragile across `spec2maxpat.py sync → convert` cycles because spec must explicitly capture every property listed above. Historically broken in three ways:

1. **`varname` dropped from spec** — the spec re-extraction step in `reconcile_spec()` didn't re-read attrs from live boxes for matched objects. Fixed by re-extracting `_PRESERVE_ATTRS` from each matched box during reconcile, not just `pos` and `text`.

2. **Tutorial control patchlines dropped** — happened when an in-memory spec edit created a stale-spec mismatch and a subsequent convert wrote a fresh `.maxpat` from the stale spec. Mitigation: always re-sync immediately before editing the spec, never edit a spec file that's older than the current `.maxpat`.

3. **Defaults for `hidden` / `background` / `items` not captured** — these aren't styling, they're *runtime behavior*. Anything that affects what a box DOES (not just how it looks) must be in `_PRESERVE_ATTRS`. The full required set is documented at the top of `_PRESERVE_ATTRS` in `spec2maxpat.py`.

When you suspect a tutorial is broken, run this checklist before fixing symptoms:

```bash
python3 spec2maxpat.py sync -i patches/<patch>.maxpat > /tmp/spec.json
python3 -c "
import json
spec = json.load(open('/tmp/spec.json'))
panels = [v for v in spec['objects'].values() if v.get('attrs',{}).get('varname','').startswith('tut-panel-')]
anns   = [v for v in spec['objects'].values() if v.get('attrs',{}).get('varname','').startswith('tut-ann-')]
umenus = [v for v in spec['objects'].values() if v.get('type') == 'umenu' and v.get('attrs',{}).get('items')]
print(f'panels with tut-* varname: {len(panels)}')
print(f'annotations with tut-* varname: {len(anns)}')
print(f'umenus with items: {len(umenus)}')
for p in panels[:1]: print('panel attrs sample:', p.get('attrs'))
for a in anns[:1]:   print('ann attrs sample:',   a.get('attrs'))
"
```

If any panel/annotation count is below the expected step count, or if `hidden`/`background` are missing from the sample attrs, the tutorial is broken at the spec level.

## Lessons Learned (Process Notes for Claude)

- **Strip order matters** — always `strip_tutorial()` before `generate_steps()`. If you strip after, the old tut-panel and tut-ann objects inflate the box list and distort spatial calculations.
- **Y-only clustering fails** — Max patches spread objects horizontally. Two objects at the same Y but 600px apart in X (e.g. camera controls at x=38 vs scale controls at x=699) are NOT spatially related. Always cluster using both X and Y distance.
- **Consecutive-only merging is too restrictive** — steps are ordered by wave depth, so connected objects like `loadmess → flonum` can end up separated by unrelated steps at the same wave. Use any-pair merging (not just consecutive) to find connected groups.
- **Bounding box limits prevent runaway merges** — without them, a chain of connected objects can absorb half the patch into one step. Cap merged groups at ~400px wide, ~250px tall, <=4 objects.
- **Multi-pass merging** — a single merge pass can miss opportunities created by earlier merges. Loop until stable.
- **Max comment `bgcolor` vs `bubble_bgcolor`** — plain `bgcolor` on a comment does not work when `bubble` is enabled. Use `bubble_bgcolor` instead.
- **`ignoreclick` is not `locked_bgcolor`** — the user specifically wants `locked_bgcolor` (the Max attribute for locking background objects), not `ignoreclick`.
- **Test on multiple patches** — always run on at least 2-3 patches of different complexity to catch edge cases (empty groups, single-object steps, very wide patches).
- **Max z-order is FIRST = on top** — earlier items in the `boxes` array render in front. This is the opposite of many GUI frameworks. Annotations must be FIRST in the array, panels LAST. Previous attempts that put annotations last resulted in them being hidden behind other objects.
- **@bubbleside values: 0=top, 1=left, 2=bottom, 3=right** — these refer to which side of the comment the arrow appears on. The arrow points outward from that side toward the described group. Previous code incorrectly assumed 0=left; confirmed by user testing that 0=top.
- **Don't force annotations into a fixed column** — flexible placement (right/left/above/below of each group) looks better than stacking all annotations in a right-side column. The user explicitly prefers annotations positioned next to their groups, not rigidly aligned.
- **AI-generated descriptions are much better than static dictionaries** — the `OBJ_DESCRIPTIONS` dict produces mechanical "object — does X. object — does Y." text. AI (via `--ai` or Claude Code `--steps-json`) produces contextual descriptions that explain *why* objects are connected and what the group achieves in the patch's data flow. Always prefer AI descriptions for student-facing tutorials.
