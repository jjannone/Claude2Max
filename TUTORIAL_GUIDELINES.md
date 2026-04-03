# Tutorial Generation Guidelines

Read these guidelines before running or modifying `add_tutorial.py`.

## Annotation Comments

- **Always on top** — annotation comments must be appended last in the boxes array so they paint above all other objects. They must never be obscured by patch objects.
- **Bubble arrows** — use `"bubble": 1` with `"bubble_bgcolor"` for the background color (not plain `"bgcolor"`). Set `"bubbleside"` so the arrow points FROM the annotation TOWARD the highlighted group (0=left, 1=top, 2=right, 3=bottom).
- **Arrow direction matters** — compute the correct side based on the relative position of the annotation vs the group center.

## Panels (Highlight Rectangles)

- Panels go on the **background layer** (`"background": 1`) and must have **locked background** (`"locked_bgcolor": 1`) so they don't interfere with users editing the patch.
- Panels are inserted at the front of the boxes list (painted first, behind everything).

## Step Grouping Rules

- **Spatial splitting** — if objects in the same data-flow wave are physically distant (>100px vertical gap or >250px horizontal gap), split them into separate tutorial steps.
- **Merge related objects** — if two steps contain connected objects that are spatially close (Euclidean distance <180px) and the combined group is small (<=4 objects) with a reasonable bounding box (<=400px wide, <=250px tall), merge them into one step.
- **Every object must be covered** — every non-comment, non-tutorial object and message box must appear in exactly one step. Print a warning if any are missing.

## Virtual Layout Model

When placing annotations, build a mental model of the patch layout:
- Know where every object is (x, y, width, height)
- Know the rightmost extent of patch objects
- Place annotations in a right-side column beyond the rightmost object
- Vertically center each annotation on its group's bounding box
- Extend the patch window width to accommodate the annotation column

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
