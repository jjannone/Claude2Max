# Tutorial Generation Guidelines

Read these guidelines before running or modifying `add_tutorial.py`.

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
