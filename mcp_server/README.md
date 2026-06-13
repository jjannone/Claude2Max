# Claude2Max MCP Server

Exposes Max/MSP patching knowledge as first-class callable tools so Claude can
query binding rules, object existence, and attribute validity rather than
reasoning from training-data memory (which fails silently in Max).

See `DESIGN_DECISIONS.md` for all locked architectural choices.

---

## Install

### 1. Install the Python SDK

Create a venv inside `mcp_server/` so the install is self-contained and doesn't
conflict with the system Python (required on macOS with Homebrew Python, which
enforces PEP 668):

```bash
cd /path/to/Claude2Max
python3 -m venv mcp_server/.venv
mcp_server/.venv/bin/pip install "mcp[cli]>=1.27.0"
```

The `.venv/` directory is in `.gitignore` and does not need to be committed.
Python ≥ 3.10 required.

### 2. Register with Claude Code (user scope)

User scope makes the server reachable from **any** cwd — required for global enforcement.

```bash
claude mcp add --scope user claude2max -- \
  /absolute/path/to/Claude2Max/mcp_server/.venv/bin/python3 \
  /absolute/path/to/Claude2Max/mcp_server/server.py
```

Replace `/absolute/path/to/Claude2Max` with the actual clone path on your machine.
Use the **venv python** (`.venv/bin/python3`), not the system `python3`, so the
`mcp` package installed in step 1 is on the path.

Verify the registration was written:

```bash
cat ~/.claude.json | python3 -m json.tool | grep -A5 claude2max
```

### 3. Verify the server starts

```bash
python3 /absolute/path/to/Claude2Max/mcp_server/server.py &
```

It should exit silently (the server is stdio-based; it waits for the MCP host to
connect). If it throws `ModuleNotFoundError: No module named 'mcp'`, re-run step 1.

### 4. Confirm in a Claude session

Open any Claude Code session (the cwd doesn't matter). The server should appear in
the available tools. Call:

```
claude2max.essentials()
```

The structured binding-rule summary should return. If the tool isn't available,
restart Claude Code to pick up the newly registered MCP server.

---

## Tool surface

### Phase i (current)

| Tool | Description |
|---|---|
| `essentials()` | Bootstrap — call at session start before any Max work. Returns the must-load binding rules as structured markdown. |

### Phase i Steps 3-4 (coming)

| Tool | Description |
|---|---|
| `lookup_object(name)` | Authoritative object existence + I/O: found, source, numinlets, numoutlets, digest, use_when. Call before any `newobj`. |
| `lookup_attribute(object_name, attr)` | Attribute validity: valid bool, value_type, valid_values. Call before writing any attribute. |
| `list_attributes(object_name)` | All valid attribute names for an object. |
| `search_packages(term, limit=5)` | Search the 2,795-object package library. Call before composing any chain of 3+ native objects. |

### Phase ii (planned)

| Tool | Description |
|---|---|
| `verify_spec(spec_json)` | Static check against spec format + binding rules. Returns `{violations: [{rule, location, severity, message}]}`. |
| `search_pitfalls(term)` | Search Common Pitfalls + forum/cookbook insights for matches. |
| `lookup_rule(name_fragment)` | Find binding rules by name fragment. |

---

## Architecture

The server is a FastMCP stdio server. Claude Code's MCP host starts it as a
subprocess and communicates over stdin/stdout. It is stateless between sessions.

Source files read by the server:
- `mcp_server/server.py` — tool implementations
- (Steps 3-4) `spec2maxpat.py` — `RefpageCache` for C74 object I/O
- (Steps 3-4) `packages/package_objects.json` — installed package externals
- (Phase ii) `patching/MAX_PATCHING.md`, `CLAUDE.md`, `SPEC_REFERENCE.md` — binding rules

Caching: read once at startup, mtime-watched on each call (re-read only when
the source file has changed). Source files are small and change rarely.

---

## Unregister

```bash
claude mcp remove claude2max --scope user
```

---

## Files

```
mcp_server/
  server.py           MCP server entry point
  __init__.py         Package marker
  requirements.txt    SDK pin (mcp>=1.27.0)
  DESIGN_DECISIONS.md Locked architectural choices (read before modifying)
  README.md           This file
```
