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
claude2max.load(["core"])
```

The core rules should return. If the tool isn't available,
restart Claude Code to pick up the newly registered MCP server.

---

## Tool surface

### Knowledge — front-load before patching (Phase ii)

| Tool | Description |
|---|---|
| `assess(task_description)` | Reads the task's intent and returns the knowledge modules it needs (`core`, `layout`, `gen`, `jitter`, `m4l`, `networking`, `msp`, `spec`). |
| `load(domains)` | Assembles and returns the full knowledge for those modules as markdown. Additive — call again as the task grows; `core` is sent only when it is in the list (or the list is empty), so a later `load(["jitter"])` does not resend it. `core` is a short tool-facing preface plus every section of `CLAUDE.md` / `patching/MAX_PATCHING.md` / `SPEC_REFERENCE.md` whose heading is tagged `{!core}`, verbatim; `layout` is the `{!layout}` sections (patching-view cord discipline, presentation design, spacing); every other module appends its `{!<domain>}` sections to its file or literal. Tag a heading in the doc and it is in the module on the next call — no digest to maintain. |

### Verification — use after knowledge is loaded (Phase i)

| Tool | Description |
|---|---|
| `lookup_object(name)` | Authoritative object existence + I/O: found, source, numinlets, numoutlets, digest, use_when. Call before adding any `newobj`. |
| `search_packages(term, limit=5)` | Search the 2,943-object package library. Call before composing any chain of 3+ native objects. |
| `lookup_attribute(object_name, attr)` | Attribute validity, decided the **same way the convert gate decides it** — valid if in the object's refpage, the jbox base attrs (universal box attrs like `hidden`/`presentation`/`textcolor`), OR observed on ≥3 shipped help patches. `source` names which. Works even on no-refpage externals (positive-confirms an attr seen in help). Call before writing any attribute. |
| `list_attributes(object_name)` | The **full** valid set (refpage ∪ jbox ∪ help-corpus), partitioned into `refpage_attributes` / `base_attributes` / `observed_only`, plus the `writable` subset. Same set the gate accepts — so the tool and `verify_spec`/convert never disagree. |

### Safety net — check the whole spec before converting (Phase iii)

| Tool | Description |
|---|---|
| `verify_spec(spec_json)` | Static check on a full spec — **including the anti-guessing layer**: every object name and every attribute is resolved against C74 refpages + the package library. Attribute validity uses the object's own refpage attrs **∪ the jbox base-class attrs** every box inherits, so inherited attrs (textcolor, background, …) pass while invented names (`oscparse`) and family-resemblance attrs (`bgcolor` on `live.gain~`) are caught. Returns `{ok, counts, violations, summary, report}`. The **same** library (`claude2max_verify/`) runs inside `spec2maxpat.py convert`, which **blocks the build** on any error. Run before `convert`; fix anything it flags. |
| `verify_patch(path, sweep=False)` | Same rule library run against a `.maxpat` / `.maxhelp` / `.amxd` **on disk**. With an embedded spec it verifies that spec — and first runs `spec2maxpat.spec_matches_patch()`, a content-level comparison of spec entries to boxes by `(maxclass, text)`; a mismatch is reported as a `spec-stale` warning at the top of the list, because every finding after it judges the spec rather than the boxes. Without an embed it checks every nested patcher scope natively. `sweep=True` on a directory aggregates by rule. |

### Knowledge search — find the rule or pitfall by name/term

| Tool | Description |
|---|---|
| `search_pitfalls(term)` | Search the silent-failure corpus — `## Common Pitfalls` (MAX_PATCHING.md) + forum + cookbook insights — ranked by token match. Reach for it on a "fires but does nothing" / "value arrives wrong" / "renders blank" symptom. Honest no-match message (curated, not exhaustive). |
| `lookup_rule(name_fragment)` | Find a binding rule by a fragment of its name across CLAUDE.md, SPEC_REFERENCE.md, MAX_PATCHING.md. Header matches rank above body matches; returns the full rule text so you apply it verbatim instead of paraphrasing. |

The server now exposes **10 tools**. Both of the above are deterministic
corpus searches (no LLM call, no API-key dependency) — exact/token matching over
a small hand-written corpus is reliable where fuzzy intent-matching isn't needed.

**`verify_spec` severities** — `error` **(blocks `convert`)**: unresolved object
name, invalid attribute (not in the object's refpage ∪ jbox base), bad connection
refs, malformed connections, out-of-range declared outlet/inlet indices;
`warning`: no presentation view despite UI, presented controls with no comment
label within 40 px, hidden boxes or cords, unlabelled subpatcher I/O (outside
comment attr AND an adjacent comment box inside), untracked debug scaffolding,
presented boxes that overlap or sit outside every panel, unreadable comment
contrast, a `$N` message fed on its right inlet, `textedit` into a template
without `@outputmode 1`, `select` on UI floats without `@fuzzy`, `jsui` without
`attrs.filename` / `v8` without declared I/O, an enable attribute without its
bounds (`jit.world` without `@enable 1`), kslider demo messages off the displayed
keys, two `jit_matrix` sources into one inlet, and — when the script file can be
found beside the patch — `declareattribute` labels/styles and missing
`setinletassist` / `setoutletassist`; `style`: ALL-CAPS user names, the
preferred-objects table (`pack`/`pak`/`unpack` → `join`/`unjoin`, long-form
`send`/`receive`, `adc~`/`dac~`, `delay~`, `js`), bare `print`, patching-view
`size` on UI boxes, uninitialized controls, and the patching-view geometry
family (cord through unrelated boxes, feeder below its target, fan-out out of
firing order, cord too short, dead-end side-tap button). The full list with its
2026-09-08 calibration table is the header comment of the second rule family
in `claude2max_verify/rules.py`.

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
- (Phase ii) `patching/MAX_PATCHING.md`, `CLAUDE.md`, `SPEC_REFERENCE.md` — binding rules; the `{!core}` / `{!layout}` / `{!<domain>}` heading tags decide which sections each module carries

Caching: every disk-backed cache is an `_FileCache` (package library, object-name
index, the gate resolver, rule sections, pitfall corpus). It reads its source
file(s) once and rebuilds only when a watched file's mtime changes — one `stat`
per source per call, source files are small. Because the MCP host keeps the
server alive for the whole session, this is what lets an edit to a binding-rule
doc / insight file / `package_objects.json` take effect immediately instead of
serving the startup snapshot until restart. (The Max-install refpage XML isn't
watched — it doesn't change during patch work.)

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
    test_verify.py         Golden specs with known violations (44 cases, incl. the spec-vs-boxes fixture in tests/fixtures/)
```

Run the module tests (tag-driven core/layout assembly; needs the venv for `mcp`):

```
mcp_server/.venv/bin/python3 mcp_server/tests/test_modules.py
```

Run the verify tests standalone (no pytest needed):

```bash
python3 mcp_server/tests/test_verify.py
```
