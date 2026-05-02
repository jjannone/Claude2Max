---
name: c2m-sync
description: Run the sync-first step explicitly on a Claude2Max .maxpat — reverse-engineers an embedded spec from boxes/patchlines if missing, or reconciles an existing embedded spec with manual edits made in Max. Use BEFORE editing any existing .maxpat to capture user GUI changes that would otherwise be silently destroyed by the next convert. Also use when the user invokes /c2m-sync, asks "did my edits make it back into the spec?", or pastes in a .maxpat from outside the repo. The repo's PreToolUse Read hook auto-syncs on file reads, but this skill makes the operation visible and pedagogical for students. Skip if the .maxpat was just written by spec2maxpat.py convert (the spec is already authoritative).
argument-hint: "<path/to/patch.maxpat>"
---

# c2m-sync — explicit sync of a .maxpat's embedded spec

Use this skill to make the sync-first rule visible and pedagogical. The repo already has a PreToolUse hook (`hooks/sync_maxpat.py`) that auto-runs on Read, but explicit invocation:

- Surfaces the operation to a student so they understand *why* sync runs before edits
- Lets the user (or you) sync without first reading the file
- Provides a single-command entry point when triaging an externally-sourced .maxpat

## Why sync exists

`spec2maxpat.py convert` regenerates the entire .maxpat from the embedded spec. **Anything in the .maxpat that isn't in the spec is silently destroyed on the next convert.** Sources of such drift include:

- User edits in Max's GUI (moving objects, adding/deleting boxes, hiding cords)
- Programmatic post-processing scripts that mutate the .maxpat directly
- Pasted-in patches from external sources

Sync reconciles the .maxpat back into the embedded spec so convert sees the current state of the world.

## Step 1 — Run sync

```bash
python3 spec2maxpat.py sync -i "$ARGUMENTS"
```

Two cases:

- **No embedded spec** — sync reverse-engineers a spec from the existing boxes and patchlines, embeds it as a hidden `text.codebox` (`id: "obj-spec-embed"`), and prints the new spec to stdout.
- **Has embedded spec** — sync reconciles the existing spec with the current box positions, text, and wiring (picking up any manual edits), updates the embed in place, and prints the updated spec.

After sync, the embedded spec is **authoritative**. You can read it, edit it, and convert it back without losing any of the manual changes you just captured.

## Step 2 — Inspect the result (optional)

To see what sync produced without changing the file again:

```bash
python3 spec2maxpat.py extract -i "$ARGUMENTS"
```

This prints the embedded spec (now updated) without modifying the .maxpat.

## Step 3 — Edit and convert

For any subsequent edit to the patch, the workflow is:

```bash
python3 spec2maxpat.py extract -i "$ARGUMENTS" > /tmp/spec.json
# edit /tmp/spec.json
python3 spec2maxpat.py convert -i /tmp/spec.json -o "$ARGUMENTS"
rm /tmp/spec.json
```

Per `CLAUDE.md`, spec files are **temporary** — write them to `/tmp/`, never the project folder. The `.maxpat` is the single source of truth.

## When NOT to use this skill

- Right after `convert` — the spec is already authoritative; sync would be a no-op.
- For brand-new patches you're building from scratch — there's no .maxpat yet.

## See also

- `hooks/sync_maxpat.py` — the PreToolUse Read hook that auto-syncs in the background. This skill complements it by making sync explicit and pedagogical.
- `spec2maxpat.py` — the converter (`convert`, `extract`, `sync`, `mct` subcommands)
- `CLAUDE.md` § "Working on an existing patch — sync first, always" — the underlying rule
