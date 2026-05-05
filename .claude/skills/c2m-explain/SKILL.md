---
name: c2m-explain
description: Generate a stage-by-stage plain-English walkthrough of any Claude2Max .maxpat without opening Max. Names the objects in each functional unit (with their text exactly as written), describes what they do, sketches the data flow between stages, and lists presentation-view controls with their nearby comment labels. Read-only — never mutates the patch. Use when the user asks "what does this patch do?", "explain this maxpat", "walk me through this patch", "summarize this patch", or invokes /c2m-explain. Pairs with /c2m-tutorial — tutorial = step-by-step *interactive* walkthrough authored once and embedded in the patch; this skill = one-shot *generated* walkthrough produced on demand. If the patch already has an embedded tutorial whose step count matches the current cluster shape, the skill overlays the tutorial's hand-authored step names + descriptions.
argument-hint: "<path/to/patch.maxpat> [--summary]"
---

# c2m-explain — one-shot walkthrough of a .maxpat

Use this skill when the user has a `.maxpat` and wants to know what it does without launching Max. The output is structured Markdown — one section per functional stage — that the user can read directly or that you can summarize further.

This skill is read-only. It does not call `sync`, does not run `convert`, does not mutate the patch.

## Step 1 — Run the script

Pass the patch path as `$ARGUMENTS`. For the default walkthrough mode:

```bash
python3 c2m-explain/c2m_explain.py "$ARGUMENTS"
```

For a terser one-line-per-stage view (useful when iterating on a patch and "remind me what this does" is enough):

```bash
python3 c2m-explain/c2m_explain.py "$ARGUMENTS" --summary
```

The script reuses Claude2Max infrastructure rather than reinventing analysis:

- `add_tutorial.generate_steps()` for spatial + wave-depth clustering — same groupings the tutorial system would use
- `add_tutorial.describe_object()` cascade: curated `OBJ_DESCRIPTIONS` → C74 refpage digest (with operator alias for `+`/`-`/`==`/`<=`/etc. and their `~` MSP variants) → installed-package digest from `packages/package_objects.json`
- `panel` and `fpic` are filtered out of per-stage object lists (counted in a footnote instead) so visual scaffolding doesn't drown signal flow
- Stages whose only contents are decoration are omitted entirely
- Comments adjacent to controls in `presentation_rect` space are matched first, falling back to `patching_rect` adjacency

## Step 2 — Tutorial-aware overlay

If the patch has an embedded tutorial (a `v8 <name>-tutorial.js` controller box plus the companion JS file), the skill parses the JS file's `STEPS` array. When `len(tutorial_steps) == len(generated_clusters)` exactly, it **overlays** the tutorial's authored step names and per-step descriptions onto the walkthrough — the patch's author wrote them, so they're better than auto-generated text. A header note appears: *"Stage names and prose below are taken from the patch's embedded tutorial — the patch's author wrote them."*

If the count doesn't match (the patch drifted since the tutorial was baked in — boxes added, removed, or reorganized), the skill silently falls back to auto-generated text. Misattributing the wrong tutorial step to the wrong cluster would mislead worse than no overlay at all, so the safety check is strict.

When you see the overlay header note in the output, treat the descriptions as authoritative for that patch and lean on them when answering follow-up questions.

## Step 3 — Read the output

The walkthrough has this shape:

```
# Walkthrough: <patch-name>

This patch has N processing objects across M functional stages[, opens in presentation view].
The walkthrough follows signal/data flow stage by stage.

[*Stage names and prose below are taken from the patch's embedded tutorial...*]

## Stage 1: <auto-or-tutorial label>

[<tutorial description if overlay applies>]

This is a starting stage — its output flows into Stage 3 (...), Stage 4 (...).

- `<object text exactly as in Max>` — <one-line description> [*[<package> package]* if from installed package]
- ...
- *(plus N decoration objects: panel)*

## Stage 2: ...
[...repeating per stage...]

## Things to tweak (presentation view)

- **<adjacent comment label>** → `<control text>`
- ...
```

The "Things to tweak" section lists every box with `presentation: 1` (excluding panels, fpic, and comments themselves), pairing each with the nearest comment to its left in presentation space.

## Step 4 — When to invoke bare

If invoked without `$ARGUMENTS`, ask the user which `.maxpat` to explain — don't guess from the working directory.

## When NOT to invoke

- The user wants to **modify** the patch — use the normal extract → edit → convert workflow (or `/c2m-sync` first if needed).
- The user wants an **interactive** walkthrough they can step through inside Max — that's `/c2m-tutorial`, not this skill.
- The user asks about a specific object's behavior in isolation — go straight to its refpage at `/Applications/Max.app/Contents/Resources/C74/docs/refpages/` or `/c2m-package-search <name>` for installed-package objects.

## Limitations

- Stage names are auto-generated from the dominant object types (e.g. "v8 + unpack") unless the embedded tutorial provides better ones.
- The flow-sentence prose ("This stage receives input from Stage X and sends results to Stage Y") is templated, not LLM-generated.
- Operator-symbol alias coverage is limited to the verified set in `add_tutorial.REFPAGE_ALIAS`. Add new entries as symbolic operators surface; always confirm the alphabetic spelling exists at `<C74>/docs/refpages/max-ref/<spelling>.maxref.xml` before adding (Max accepts unknown attribute names silently — verification is mandatory).
- Presentation labels rely on a comment being roughly to the left of (or just above) the control in `presentation_rect` space. Other layouts (label below, label far right, label above-and-right) are missed.

## See also

- `c2m-explain/c2m_explain.py` — the implementation
- `c2m-explain/UPSTREAM-SKILL.md` — the upstream-distribution copy of this manifest
- `add_tutorial.py` — `generate_steps`, `describe_object`, and `REFPAGE_ALIAS` shared with this skill
- `/c2m-tutorial` — the complementary skill that *adds* an interactive tutorial to a patch
- `/c2m-package-search` — for digging into a specific package object referenced in the walkthrough
