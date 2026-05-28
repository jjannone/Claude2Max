---
name: c2m-inspect
description: Inspect the live contents of Max data structures (coll, dict, table, jit.matrix, buffer~) in a running patch by sending OSC to the c2m.inspect abstraction and reading the dumped JSON. Use when debugging — when you need to see what's actually inside a buffer, matrix, dictionary, table, or coll while the patch is running, rather than guessing. Requires that the user has dropped patching/abstractions/c2m.inspect.maxpat into their open patch (or that the skill is allowed to add it).
argument-hint: "ping | scan | dump <tag> <kind> <name>"
---

# c2m-inspect — live data-structure introspection over OSC

Use this skill when a patch is running in Max and you need to see what is actually inside a named data structure. The Max-side abstraction listens on UDP 7474, writes the dump to a `/tmp/c2m_inspect_*.json` file, and the Python sender prints it back to you.

This skill is **diagnostic, not constructive** — it does not modify the patch. It only reads.

## Prerequisites

The user's patch must contain a `[c2m.inspect]` box (the abstraction at `patching/abstractions/c2m.inspect.maxpat`). Two ways to make sure it's loadable:

1. **Add the abstraction directory to Max's search paths.** Options → File Preferences → add the absolute path of `Claude2Max/patching/abstractions/`. After that, `[c2m.inspect]` is loadable from any patch on this machine. The `c2m_inspect.js` lives in the same directory and Max resolves it automatically.
2. **Copy both files into the patch's own directory.** Copy `c2m.inspect.maxpat` and `c2m_inspect.js` next to the patch the user is debugging.

If the user has never used this before, run option 1's instructions through to them once and remember the choice for the rest of the session.

## Workflow

### 1. Confirm the listener is alive

```bash
python3 tools/c2m_inspect_send.py --timeout 1 ping
```

Expected: a JSON dump of `c2m_inspect_pong.json` showing `ok: true`, current `cellcap`, `samplecap`, `tmpdir`, and `asyncdelay_ms`. If it times out, the patch isn't open, the abstraction isn't instantiated, or UDP 7474 is blocked / taken by another process.

### 2. Dump a named data structure

```bash
python3 tools/c2m_inspect_send.py --timeout 3 dump <tag> <kind> <name>
```

- `<tag>` — your label for the dump file (becomes `/tmp/c2m_inspect_<tag>.json`)
- `<kind>` — one of `coll`, `dict`, `table`, `jit.matrix`, `buffer~`
- `<name>` — the Max-side name of the object (the arg you passed to `coll NAME`, `buffer~ NAME`, etc.)

For `coll` and `table` the v8 box writes to a temp file and parses it after a small delay (default 200 ms). If your dumps look empty, raise the delay: send the message `asyncdelay 500` to the `[v8 c2m_inspect.js]` box, or pass `--timeout 5` on the sender.

### 3. Scan capabilities

```bash
python3 tools/c2m_inspect_send.py --timeout 1 scan
```

Lists supported kinds and the current cell / sample caps so you know whether you're seeing a truncated dump.

**IMPORTANT:** all `--*` flags must precede the subcommand. `c2m_inspect_send.py --timeout 5 dump …` is correct; `c2m_inspect_send.py dump … --timeout 5` is not.

## What each kind returns (v1)

| Kind | How | JSON shape |
|------|-----|------------|
| `dict` | direct `Dict.stringify()` | `{contents: <parsed JSON>}` |
| `buffer~` | `Buffer.peek()` per channel | `{framecount, channelcount, length_ms, samples_returned, samples_truncated, channels: [[…],[…]]}` |
| `jit.matrix` | `JitterMatrix.getcell()` per cell | `{dim, planecount, type, total_cells, cells_returned, cells_truncated, cells: [{pos, value},…]}` (1D + 2D only) |

All dumps include `tag`, `kind`, `name`, `ts` (unix ms).

Passing `coll` or `table` returns a structured error explaining the v1 gap (see Limitations).

## Caps (truncation)

`jit.matrix` and `buffer~` dumps are capped to keep result files small.

- Default `cellcap` = 10000 cells per matrix
- Default `samplecap` = 4096 samples per channel

Override by sending attribute messages to the `[v8 c2m_inspect.js]` box: `cellcap 0` (unlimited) or `samplecap 16384`. Or set them as `@cellcap N` / `@samplecap N` in the v8 box text.

`cells_truncated: true` / `samples_truncated: true` in the result flag when the cap kicked in.

## Limitations (v1)

- `multislider`, `pattr`, `jit.cellblock` not yet covered — they need scripting-name lookup which v1 doesn't do. Coverage may extend in v2.
- `jit.matrix` higher-than-2D not yet supported.
- The OSC pathway is one-way ping (Max writes to disk, sender polls disk). No UDP reply.
- One c2m.inspect instance per Max session — port 7474 is hardcoded. If the user is already using UDP 7474 for something else, change the `udpreceive` argument in the abstraction (and pass `--port` to the sender).

## Self-checking pattern

When debugging a patch with multiple data structures, a useful default flow:

1. `ping` first — fail fast if the listener isn't reachable.
2. `dump` each structure you suspect, with distinct tags so the files don't overwrite each other.
3. Read the resulting JSON to compare expected vs actual state.
4. Iterate.

You can run dumps repeatedly — each call overwrites the file with that tag.
