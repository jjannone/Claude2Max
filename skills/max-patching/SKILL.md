---
name: max-patching
description: Load Max/MSP knowledge before any patch work. Invoke when — .maxpat / .maxhelp / .amxd files are mentioned; Max object names appear (metro, live.*, jit.*, gen~, v8, node.script, etc.); user asks to build, edit, fix, or explain a Max patch; OSC+Max, Gen~, Jitter, M4L, or Node-for-Max context. Invoke BEFORE editing any .maxpat / .maxhelp / .amxd file. Skipping produces silent-failure patches — Max accepts invented object names and attributes without error, no warning is emitted.
---

# max-patching — front-load Claude2Max knowledge before any patch work

This skill loads authoritative Max/MSP knowledge from the Claude2Max MCP server,
then writes a session sentinel so the PreToolUse enforcement hook allows Max-file edits.

## Steps — run in order, every session

### 1. Assess which knowledge domains the task needs

Synthesize a one-sentence task description from the current conversation (what is
the user building or fixing?), then call:

```
mcp__claude2max__assess(task_description="<your one-sentence description>")
```

This returns a list of relevant domains, e.g. `["core", "msp"]` or
`["core", "jitter", "m4l"]`. `core` is always included.

If the MCP server is unreachable, skip to the **Fallback** section at the bottom.

### 2. Load knowledge for those domains

```
mcp__claude2max__load(domains=["core", ...])   ← use the list from assess()
```

**If this session has already read `CLAUDE.md`, `SPEC_REFERENCE.md` and `patching/MAX_PATCHING.md` in full, leave `"core"` out of the list.** Core is cut verbatim from those three files, so loading it too sends about 40k tokens twice. Otherwise keep it.

Read the returned markdown — it is your working knowledge for this session.
It contains binding rules, Common Pitfalls, preferred objects, and domain guidance.
`core` is every repo doc section tagged `{!core}`, verbatim. If the task will place boxes
or design a presentation view, make sure `"layout"` is in the list — `assess()` adds it for
build tasks; add it yourself if it is missing.

If `assess()` returned only `["core"]`:

```
mcp__claude2max__load(domains=["core"])
```

### 3. Write the session sentinel

Run this Bash command. The PreToolUse enforcement hook checks for this file before
allowing any edit to a .maxpat / .maxhelp / .amxd file.

```bash
python3 -c "
import os, tempfile, hashlib, time
sid = os.environ.get('CLAUDE_CODE_SESSION_ID') or hashlib.sha1(os.getcwd().encode()).hexdigest()[:16]
p = os.path.join(tempfile.gettempdir(), f'claude2max_loaded_{sid}.flag')
open(p, 'w').write(str(time.time()))
print(f'[claude2max] sentinel written: {p}')
"
```

### 4. Proceed with the user's request

You now have the Max knowledge loaded. Use MCP tools throughout the session:

- Before any `newobj`:  `mcp__claude2max__lookup_object(name)`
- Before writing attrs:  `mcp__claude2max__list_attributes(object_name)`
- Before a chain of 3+:  `mcp__claude2max__search_packages(term)`
- Before converting:    `mcp__claude2max__verify_spec(spec_json)`

If the task scope grows (e.g. you encounter `jit.` objects after loading only core),
call `mcp__claude2max__load(domains=["jitter"])` to add that domain. Core is sent only
when it is in the list, so this adds just the new domain; each call accumulates
without replacing prior loads.

---

## Fallback — MCP server unreachable

If the MCP server fails to respond, read these files directly from the Claude2Max
clone (path from the global `~/.claude/CLAUDE.md` pointer, or the clone path the
user has told you):

1. `Claude2Max/CLAUDE.md`
2. `Claude2Max/SPEC_REFERENCE.md`
3. `Claude2Max/patching/MAX_PATCHING.md`

Then write the sentinel (Step 3 above). The enforcement hook only checks for the
sentinel file, not whether MCP was actually used — so Max-file edits are unblocked
after fallback as long as the sentinel is written.
