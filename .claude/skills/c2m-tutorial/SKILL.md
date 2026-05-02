---
name: c2m-tutorial
description: Add an interactive step-by-step tutorial to a Claude2Max .maxpat using the two-pass workflow (analyze → enhance descriptions → generate). The tutorial inserts a umenu + prev/next nav, highlight panels, and bubble-arrow annotations driven by a generated v8 controller. Use when the user wants to make a patch self-teaching, asks to "add a tutorial", "walk through this patch step by step", or invokes /c2m-tutorial. Skip for one-shot explanations (use /c2m-explain instead) and for patches that are too small to benefit (< ~6 objects).
argument-hint: "<path/to/patch.maxpat>"
---

# c2m-tutorial — add an interactive tutorial to a .maxpat

Use this skill when the user wants to add an embedded, navigable tutorial to a patch — a umenu + prev/next + highlight panels + bubble annotations that step through the patch object-by-object.

Read `TUTORIAL_GUIDELINES.md` before invoking. It contains the structural contract (panel attrs, annotation attrs, umenu items, JS controller shape) and the comment-pile pattern, plus a sync/convert breakage diagnostic.

## Step 0 — Sync the patch first

Per the **sync-first rule** in `CLAUDE.md`, before doing anything to an existing .maxpat:

```bash
python3 spec2maxpat.py sync -i "$ARGUMENTS"
```

This captures any manual edits the user made in Max so they survive the upcoming convert. No exceptions.

## Step 1 — Analyze (no API key needed)

```bash
python3 add_tutorial.py --analyze -i "$ARGUMENTS" > /tmp/tutorial-steps.json
```

This walks the patch's data-flow graph (spatial clustering + connection-based merging), splits spatially distant objects, and emits one entry per step with `objects`, a generic `name`, a generic `description`, and a default `placement` ("right"). The output is intentionally generic — it's the scaffolding for you to enhance.

## Step 2 — Enhance the descriptions

Read `/tmp/tutorial-steps.json` and write a richer version to `/tmp/tutorial-steps-enhanced.json`. For each step:

- **`name`** — short noun phrase, ALL CAPS only if it's a Max user-defined name (e.g. "Camera Capture", "Tempo Routing", "MIDI to Voltage")
- **`description`** — pedagogical, 2–4 sentences. Explain what this functional unit does, how it fits into the larger patch, and any non-obvious objects (cross-reference `packages/package_objects.json` for installed-package objects, the C74 refpages for native objects).
- **`placement`** — `"right"`, `"left"`, `"above"`, or `"below"`. Choose based on where the highlighted objects sit and where there's empty patch real estate for the bubble. Falls back to `"right"` if the chosen side doesn't fit.

The schema:

```json
[
  {"name": "Overview", "description": "...", "placement": "right"},
  {"name": "Camera Capture", "description": "...", "placement": "right"}
]
```

The first step ("Overview") should describe the patch as a whole — what it does, what to listen/look for, how to drive it.

## Step 3 — Generate

```bash
python3 add_tutorial.py -i "$ARGUMENTS" --steps-json /tmp/tutorial-steps-enhanced.json
```

This adds the umenu + prev/next + loadbang at the top-right of the patching view, generates a companion `<patch-name>-tutorial.js` alongside the .maxpat, and embeds the spec as usual. Each step highlights its objects with a locked background panel (`tut-panel-N` varname) and shows a bubble-arrow annotation (`tut-ann-N` varname).

## Step 4 — Verify

Open the patch in Max. Confirm:

- `loadbang` initializes to step 0 on patch open
- Prev/next buttons move through steps
- Each panel highlights only its step's objects
- Bubble annotations point in the chosen `placement` direction
- The companion `*-tutorial.js` file is in the same directory as the `.maxpat`

If anything is wrong, re-read `TUTORIAL_GUIDELINES.md` for the structural contract and the diagnostic script. Common failure modes: missing `varname` (breaks JS targeting), `hidden: 0` on a panel (shows in patching view when it shouldn't), missing `bubble: 1` on annotations (renders as a plain comment), wrong `bubbleside` (arrow points the wrong way: 0=top, 1=left, 2=bottom, 3=right).

## Step 5 — Cleanup

After successful verification, delete the temp JSON files:

```bash
rm -f /tmp/tutorial-steps.json /tmp/tutorial-steps-enhanced.json
```

## Alternative: API-key-driven generation

If the user has `ANTHROPIC_API_KEY` set and wants automated descriptions instead of you writing them:

```bash
export ANTHROPIC_API_KEY=sk-...
python3 add_tutorial.py --ai -i "$ARGUMENTS"
```

This calls Haiku to generate names + descriptions in one pass. Faster, but less pedagogical than the two-pass workflow above.

## See also

- `TUTORIAL_GUIDELINES.md` — full structural contract, comment-pile pattern, breakage diagnostic
- `add_tutorial.py` — the implementation
- `CLAUDE.md` § "Tutorial System" — workflow reference
