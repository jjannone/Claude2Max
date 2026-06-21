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
mcp_server/.venv/bin/pip install -r mcp_server/requirements.txt
```

This installs `mcp` (the MCP SDK) and `anthropic` (used by `assess()` — see below).
The `.venv/` directory is in `.gitignore` and does not need to be committed.
Python ≥ 3.10 required.

### 2. Register with Claude Code (user scope)

User scope makes the server reachable from **any** cwd — required for global enforcement.

```bash
claude mcp add --scope user claude2max \
  --env ANTHROPIC_API_KEY=sk-ant-... -- \
  /absolute/path/to/Claude2Max/mcp_server/.venv/bin/python3 \
  /absolute/path/to/Claude2Max/mcp_server/server.py
```

Replace `/absolute/path/to/Claude2Max` with the actual clone path on your machine.
Use the **venv python** (`.venv/bin/python3`), not the system `python3`, so the
`mcp` package installed in step 1 is on the path.

`--env ANTHROPIC_API_KEY=...` powers the three **LLM-assisted** tools, each a
separate billed Anthropic API call (`claude-haiku-4-5` — cheap, fast):

- `assess()` routes a task to knowledge modules by **reading its intent** (not
  keyword matching).
- `lookup_object()` returns **did-you-mean** suggestions when a name isn't found
  (e.g. `oscparse` → `o.route`), each validated to be a real object.
- `search_packages()` runs a **semantic** search — expands the query into related
  terms, then reranks candidates by intent.

Without the key the server still runs; each tool degrades to its deterministic
path and says so (`method: "keyword-fallback"` / `"substring"`, empty
`did_you_mean`). Override the model for all three with
`--env CLAUDE2MAX_LLM_MODEL=...` (the older `CLAUDE2MAX_ASSESS_MODEL` is still
honored for backward compatibility).

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

### Knowledge — front-load before patching (Phase ii)

| Tool | Description |
|---|---|
| `assess(task_description)` | Reads the task's intent and returns the knowledge modules it needs (`core`, `gen`, `jitter`, `m4l`, `networking`, `msp`, `spec`). |
| `load(domains)` | Assembles and returns the full knowledge for those modules as markdown. Additive — call again as the task grows. |
| `essentials()` | Backward-compat alias for `load(["core"])`. |

### Verification — use after knowledge is loaded (Phase i)

| Tool | Description |
|---|---|
| `lookup_object(name)` | Authoritative object existence + I/O: found, source, numinlets, numoutlets, digest, use_when. Call before adding any `newobj`. |
| `search_packages(term, limit=5)` | Search the 2,795-object package library. Call before composing any chain of 3+ native objects. |
| `lookup_attribute(object_name, attr)` | Attribute validity: valid bool, value_type, size, default, inspector_label. Call before writing any attribute. |
| `list_attributes(object_name)` | All valid attribute names for an object, split into all / writable. |

### Safety net — check the whole spec before converting (Phase iii)

| Tool | Description |
|---|---|
| `verify_spec(spec_json)` | Static check on a full spec — **including the anti-guessing layer**: every object name and every attribute is resolved against C74 refpages + the package library. Attribute validity uses the object's own refpage attrs **∪ the jbox base-class attrs** every box inherits, so inherited attrs (textcolor, background, …) pass while invented names (`oscparse`) and family-resemblance attrs (`bgcolor` on `live.gain~`) are caught. Returns `{ok, counts, violations, summary, report}`. The **same** library (`claude2max_verify/`) runs inside `spec2maxpat.py convert`, which **blocks the build** on any error. Run before `convert`; fix anything it flags. |

### Later phases (planned)

| Tool | Description |
|---|---|
| `search_pitfalls(term)` | Search Common Pitfalls + forum/cookbook insights for matches. |
| `lookup_rule(name_fragment)` | Find binding rules by name fragment. |

**`verify_spec` severities** — `error` **(blocks `convert`)**: unresolved object
name, invalid attribute (not in the object's refpage ∪ jbox base), bad connection
refs, malformed connections, out-of-range declared outlet/inlet indices;
`warning`: no presentation view despite UI, unlabelled presented controls, visible
cords on hidden boxes, unhidden formatter message boxes, unlabelled subpatcher
I/O, untracked debug scaffolding; `style`: ALL-CAPS user names, `[v8]` over
`[js]`.

**The convert gate.** `spec2maxpat.py convert` refuses to emit a `.maxpat` when
verification finds an error — turning Max's silent acceptance of invented
names/attrs into an immediate, in-session failure. Escape hatches: mark a real
abstraction `"unverified": true` in the spec (downgrades to a style note), drop a
matching `<name>.maxpat` on the search path, or pass `--allow-unverified` to
override. Attribute validity is the object's own refpage attrs ∪ the jbox
base-class attrs every box inherits; objects with no refpage at all aren't
attribute-checked (use `lookup_attribute` there).

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
  server.py                MCP server entry point
  __init__.py              Package marker
  requirements.txt         SDK pin (mcp>=1.27.0)
  DESIGN_DECISIONS.md      Locked architectural choices (read before modifying)
  README.md                This file
  claude2max_verify/       Shared binding-rule checker (verify_spec)
    __init__.py            Public API: verify_spec, verify_spec_json, format_report
    rules.py               Hand-coded rule library + Violation/SpecContext
    verify.py              Entry points + result-dict shape + format_report
  tests/
    test_verify.py         Golden specs with known violations (27 cases)
```

Run the verify tests standalone (no pytest needed):

```bash
python3 mcp_server/tests/test_verify.py
```
