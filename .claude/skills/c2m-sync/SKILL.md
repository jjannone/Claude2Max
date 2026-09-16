---
name: c2m-sync
description: Run the sync-first step explicitly on a Claude2Max .maxpat — reverse-engineers an embedded spec from boxes/patchlines if missing, or reconciles an existing embedded spec with manual edits made in Max. Use BEFORE editing any existing .maxpat to capture user GUI changes that would otherwise be silently destroyed by the next convert. Also use when the user invokes /c2m-sync, asks "did my edits make it back into the spec?", or pastes in a .maxpat from outside the repo. The repo's PreToolUse Read hook only checks a patch on read and asks before syncing; this skill is how the sync actually runs. Skip if the .maxpat was just written by spec2maxpat.py convert (the spec is already authoritative).
argument-hint: "<path/to/patch.maxpat>"
---

# c2m-sync — explicit sync of a .maxpat's embedded spec

Use this skill to make the sync-first rule visible and pedagogical. The repo has a PreToolUse hook (`hooks/sync_maxpat.py`) that runs `sync --check` whenever a `.maxpat`, `.maxhelp` or `.amxd` is read. It writes nothing: when the spec is out of step, or missing, it tells you to ask the user before syncing. This skill is what runs the sync once they agree, and it surfaces the operation to a student and gives a single-command entry point when triaging an externally-sourced patch.

The rule and the failure mode it protects against live in `CLAUDE.md` § "Working on an existing patch — sync first, always" — read that for the *why*. This skill is the *how*.

## Step 1 — Run sync

```bash
python3 spec2maxpat.py sync -i "$ARGUMENTS"
```

Two cases:

- **Embedded scripts** — before touching the spec, sync compares every `v8 … @embed 1` box's stored script with its `.js` on disk: identical → nothing; file newer or equal → stored copy refreshed; file missing → restored from the stored copy; patch newer and different → sync stops with `SCRIPT CONFLICT` and writes nothing (resolve with `--script-from-disk` or `--script-from-patch`). Rule: `CLAUDE.md > Embed the Script in Every v8 Box`.
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

- `hooks/sync_maxpat.py` — the PreToolUse Read hook. It checks the embedded spec on every read and writes nothing; since 2026-09-16 a mismatch is reported with a prompt to ask the user before re-syncing, instead of a silent sync that could overwrite an edit made in Max or by another session.
- `spec2maxpat.py` — the converter (`convert`, `extract`, `sync`, `mct` subcommands)
- `CLAUDE.md` § "Working on an existing patch — sync first, always" — the underlying rule
