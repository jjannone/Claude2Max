# Claude2Max MCP — Project CLAUDE.md Snippet

Drop this block into any Max project's `CLAUDE.md` (or `~/.claude/CLAUDE.md` for global effect) to ensure Claude uses the claude2max MCP tools rather than training-data guesses when building or editing Max patches.

---

## Cut here — paste into your project's CLAUDE.md

```markdown
## Max/MSP — Required tool calls before any patch work

The claude2max MCP server is connected (tools named `mcp__claude2max__*`).
Call these tools — do not rely on training-data memory for Max object or attribute names.
Max silently accepts unknown names and ignores them; there is no error message.

### Before adding any `newobj` to a patch
Call `mcp__claude2max__lookup_object(name)`.
- Returns `found: true/false` — if false, stop and find the correct name.
- Returns inlet/outlet counts and use_when guidance.
- Example: `lookup_object("oscparse")` → `found: false`; the correct object is `o.route` from CNMAT Externals.

### Before writing any attribute on an object
Call `mcp__claude2max__list_attributes(object_name)` to see the full valid list,
or `mcp__claude2max__lookup_attribute(object_name, attr)` to check a specific one.
- Example: `bgcolor` on `live.gain~` → `valid: false` (silently ignored in Max).
  Valid color attrs are `coldcolor`, `warmcolor`, `hotcolor`, etc.

### Before composing a chain of 3+ native objects
Call `mcp__claude2max__search_packages(term)`.
- The 2,795-object library often covers the whole chain in one external.

### At session start (or any time you need the binding rules)
Call `mcp__claude2max__essentials()`.
- Returns the full binding rules: presentation view requirements, hide-plumbing rule,
  textedit misuse, modify-don't-rebuild, sync-before-edit, naming convention.
- Also summarises the preferred-objects table (playlist~ for audio, v8 for JS, etc.)
```

---

## Notes for maintainers

- The server must be registered in Claude Code's MCP config pointing at `mcp_server/server.py` in the Claude2Max clone. Run `python3 install_global.py` (Phase iii deliverable, not yet built).
- If the server is unreachable, Claude falls back to reading the prose files directly. The snippet above still applies — it names the tools; Claude will try them and find they're unavailable, then fall back.
- This snippet is the "prose half" of the enforcement architecture. The mechanical half (the PreToolUse hook that blocks `.maxpat` edits until essentials are loaded) is the Phase (iii) deliverable.
- Update this file whenever the tool surface changes (new tools, renamed parameters).
