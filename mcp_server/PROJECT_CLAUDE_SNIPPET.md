# Claude2Max MCP — Project CLAUDE.md Snippet

Drop this block into any Max project's `CLAUDE.md` (or `~/.claude/CLAUDE.md` for global effect)
to ensure Claude front-loads Max knowledge before any patch work begins.

---

## Cut here — paste into your project's CLAUDE.md

```markdown
## Max/MSP — Required tool calls before any patch work

The claude2max MCP server is connected (tools named `mcp__claude2max__*`).
Call these tools — do not rely on training-data memory for Max object or attribute names.
Max silently accepts unknown names and ignores them; there is no error message.

### At session start — front-load Max knowledge before touching any patch

1. Call `mcp__claude2max__assess(task_description)` — describe what you're building in
   plain English. Returns a list of domain modules relevant to the task.
2. Call `mcp__claude2max__load(domains)` with the returned list — assembles and returns
   the full Max knowledge for those domains. Read it. This is your working knowledge
   for the session.

Example:
    assess("build a step sequencer with audio output")
    → domains: ["core", "msp"]
    load(["core", "msp"])
    → ~25K tokens of binding rules, Common Pitfalls, preferred objects, audio guidance

### If the task evolves mid-session

Call `load([new_domain])` again when you encounter something outside what's loaded.
Recognition signals are in the core module, but the key ones:
- `jit.` or `gl.` prefix → `load(["jitter"])`
- Work inside `gen~` / `gen` box → `load(["gen"])`
- `live.*` objects or M4L device context → `load(["m4l"])`
- `node.script`, WebSocket, phone performers → `load(["networking"])`
- Writing a spec from scratch for spec2maxpat.py → `load(["spec"])`
- Audio signal chain, `~` objects → `load(["msp"])`

Modules accumulate — each call adds to context without replacing prior loads.

### Verification tools — use after knowledge is loaded

Before adding any `newobj`:
    `mcp__claude2max__lookup_object(name)` — confirms the object exists and returns I/O signature

Before writing attributes:
    `mcp__claude2max__list_attributes(object_name)` — full valid attribute list
    `mcp__claude2max__lookup_attribute(object_name, attr)` — check one specific attribute

Before composing a chain of 3+ native objects:
    `mcp__claude2max__search_packages(term)` — 2,795-object library may cover it in one external
```

---

## Notes for maintainers

- The server must be registered in Claude Code's MCP config pointing at `mcp_server/server.py`
  in the Claude2Max clone. Run `python3 install_global.py` (Phase iv deliverable, not yet built).
- If the server is unreachable, Claude falls back to reading the prose files directly.
- `essentials()` is kept as a backward-compat alias for `load(["core"])` — old snippets still work.
- The enforcement hook (PreToolUse — blocks `.maxpat` edits until `load()` has been called) is
  the Phase (iii) deliverable.
- Update this file whenever the tool surface changes (new tools, renamed parameters).
