---
name: c2m-explain
description: Use this skill to explain what a Max/MSP `.maxpat` file does — produces a stage-by-stage walkthrough of any patch, naming the objects in each functional unit and describing what they do, with a final list of presentation-view controls. Trigger this skill whenever the user asks "what does this patch do?", "explain this maxpat", "walk me through this patch", or shares a `.maxpat` and wants to understand it without opening Max. Pairs with the existing tutorial system (add_tutorial.py): tutorial = step-by-step *interactive* walkthrough authored once and embedded in the patch; this skill = one-shot *generated* walkthrough produced on demand. Read-only — never mutates the patch. Works without Max installed; reads everything from the .maxpat boxes + lines and the embedded spec.
user-invocable: true
---

This skill explains a Max/MSP `.maxpat` patch by composing existing
Claude2Max infrastructure into a one-shot walkthrough. It is a thin layer
over `c2m_explain.py` at the repo root.

**This file is the upstream/distribution copy of the manifest.** The
in-repo, slash-command-discoverable copy lives at
`.claude/skills/c2m-explain/SKILL.md` — that's the one Claude Code's
auto-discovery loads when invoking `/c2m-explain` in this repo. Keep the
two in rough sync; the local copy is authoritative for behavior.

## How to use

```bash
python3 c2m_explain.py <patch.maxpat>            # walkthrough (default)
python3 c2m_explain.py <patch.maxpat> --summary  # terse one-line-per-stage
```

- **Walkthrough** (default): one section per functional stage, with the
  object texts (exactly as written in Max), a one-line description of each,
  and a sentence describing how the stage connects to neighboring stages.
  Ends with a "Things to tweak" section listing presentation-view controls
  with their nearby comment labels. Suitable for a student opening someone
  else's patch.
- **Summary** (`--summary`): one bullet per stage. Suitable for "remind me
  what this patch does" while iterating.

## What it composes

The script does not try to invent new analysis — it reuses what already
works in this repo:

- **Stage clustering**: `add_tutorial.generate_steps(boxes, lines)` —
  identical groupings to what the tutorial system would produce.
- **Object description cascade**: `add_tutorial.describe_object(box)` —
  curated `OBJ_DESCRIPTIONS` → C74 refpage digest (with
  `add_tutorial.REFPAGE_ALIAS` for symbolic operators `+` → `plus`,
  `<=` → `lessthaneq`, etc., and their `~` MSP variants) →
  installed-package digest from `packages/package_objects.json`. The same
  cascade is now used by `add_tutorial.build_step_description`, so
  tutorial step descriptions and explain-skill object descriptions stay
  in sync.
- **Tutorial overlay (when present)**: if the patch has an embedded
  tutorial (`v8 <name>-tutorial.js` controller + companion JS file), the
  skill parses the JS file's `STEPS` array. When step count matches the
  current cluster count exactly, it overlays the tutorial's authored step
  names + descriptions onto the walkthrough — the patch's author wrote
  them, so they're better than auto-generated text. Mismatch (patch
  drifted since the tutorial was baked in) → silently fall back to
  auto-generated. The header reflects which source was used.
- **Decoration filtering**: `panel` and `fpic` objects are absorbed into a
  per-stage footnote count, so they don't drown out signal/data flow.
  Stages whose only contents are decoration are omitted entirely.
- **Presentation labels**: comments adjacent to controls in
  `presentation_rect` space are matched first, falling back to
  `patching_rect` adjacency.

## When to invoke

Trigger phrases:

- "what does `<file>.maxpat` do?"
- "explain this patch"
- "walk me through `<file>.maxpat`"
- "summarize this patch" → use `--summary`

When the user shares a `.maxpat` (uploaded, pasted via MCT, or referenced
by path) and asks for an explanation rather than a modification.

## When NOT to invoke

- The user wants to **modify** the patch — use the normal extract → edit →
  convert workflow instead.
- The user wants an **interactive** walkthrough they can step through in
  Max — that's `add_tutorial.py`, not this skill.
- The user asks about a specific object's behavior — go straight to its
  refpage (`/Applications/Max.app/Contents/Resources/C74/docs/refpages/`)
  or `python3 packages/query_packages.py search <name>`.

## Read-only contract

The script never writes to the `.maxpat`. If the patch has no embedded
spec, analysis runs directly against `boxes` + `lines` from the file. No
sync, no convert, no tutorial injection.

## Limitations

- Stage names are auto-generated from the dominant object types (e.g.
  "v8 + unpack"). The flow-sentence prose is templated, not LLM-generated.
- Operator alias coverage is limited to the verified set in
  `add_tutorial.REFPAGE_ALIAS`. Add to it as new symbolic operators surface;
  always confirm the alphabetic spelling exists at
  `<C74>/docs/refpages/max-ref/<spelling>.maxref.xml` before adding.
- Presentation labels rely on a comment being roughly to the left of (or
  just above) the control in `presentation_rect` space. Other layouts
  (label below, label far right) are missed.
