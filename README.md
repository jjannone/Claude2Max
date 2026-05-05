# Claude2Max

**Vibecoding Max/MSP — describe a patch in plain JSON, get a working `.maxpat`.**

Claude2Max is a toolkit for generating, modifying, and explaining Max/MSP patches with the help of an LLM (Claude). You describe the patch you want in plain English — maybe sketching in a few specific objects you have in mind — and Claude translates that into a JSON spec the converter turns into a `.maxpat` file. The spec is embedded inside the generated patch, so Claude can read it back, reason about the patch later, and make targeted edits without rebuilding from scratch.

The tool is designed for students and educators with little coding or CLI experience. Claude reads the repo's documentation files (`CLAUDE.md`, `SPEC_REFERENCE.md`, `patching/MAX_PATCHING.md`) at the start of each session and uses them as a knowledge base — anything Claude needs to know about the spec format, conventions, and Max/MSP itself lives in those files.

---

## Features

### The Spec Format

A Claude2Max spec is a JSON file with two main sections — `objects` and `connections` — plus optional `subpatchers`, `attrs`, and presentation metadata. Object text is written exactly as you'd type it in Max (`metro 500`, `+ ~ 0.5`, `cv.jit.faces`). Inlets and outlets are addressed by index. Layout is auto-computed by default; explicit `pos` and `presentation_rect` are honored when supplied. See [SPEC_REFERENCE.md](SPEC_REFERENCE.md) for the full grammar and worked examples.

### Round-Trip via Embedded Spec

Every `.maxpat` produced by Claude2Max contains a hidden `text.codebox` carrying the full spec wrapped in `--- CLAUDE2MAX SPEC ---` delimiters. This makes the patch its own source of truth: there are no stray `.json` files cluttering the project, and Claude can `extract`, edit, and `convert` against any patch — including patches the user has been hand-editing in Max.

### Sync — Capture Manual Edits Before Re-Converting

The `sync` command reads a `.maxpat`, diffs the live boxes against the embedded spec, and updates the spec to reflect manual changes (moved objects, hidden cords, edited attributes). Running it before `convert` prevents the regenerator from silently overwriting GUI work the user did in Max. A pre-edit hook auto-runs sync whenever Claude reads a `.maxpat`, and the `/c2m-sync` slash command makes it explicit and pedagogical for students.

### Refpage-Grounded I/O Profiles

Inlet/outlet counts, signal-rate types, attribute names, message selectors, and digests are looked up on demand from Cycling '74's bundled `*.maxref.xml` files via a session-cached `RefpageCache`. There is no external object database to maintain — the cache always matches the installed Max version. 130+ stock Max objects are covered; unknown objects can be supplied by the spec or fall through to the package library.

### Curated Package Library — 2,795+ Installed Package Objects

`packages/package_objects.json` indexes every installed Max-package object (currently 2,795 across 68+ packages — bach, FluCoMa, HISSTools, FFTease, cv.jit, FrameLib, MuBu, Sound Design Toolkit, CNMAT Externals, RTC-lib, Digital Orchestra Toolbox, and many more). Each entry carries a digest, I/O counts, kind, and a hand-written `use_when` field that explains *when to reach for this object instead of a long native chain* — including key attributes, message selectors, and constructor arguments needed to wire it correctly. The `/c2m-package-search` slash command surfaces relevant entries before any 3+ object native chain is composed. Per-package paradigms (bach lllls, FrameLib frame chains, FluCoMa corpus workflow, etc.) are documented in `packages/package_concepts.md`.

### Interactive Tutorial System

`add_tutorial.py` analyzes a patch's data-flow graph, clusters objects into pedagogical stages, and bakes an interactive step-by-step tutorial directly into the `.maxpat`. The tutorial inserts a `umenu` + prev/next nav, highlight panels with locked background color, and bubble-arrow annotation comments driven by a generated v8 controller. A two-pass workflow lets Claude write enhanced step descriptions before the tutorial is generated. Triggered with `/c2m-tutorial`. Structural contract documented in [TUTORIAL_GUIDELINES.md](TUTORIAL_GUIDELINES.md).

### One-Shot Patch Walkthroughs

`/c2m-explain` produces a stage-by-stage plain-English walkthrough of any `.maxpat` without opening Max. It names the objects in each functional unit (with their text exactly as written), describes what they do via the same refpage + package-digest cascade the tutorial system uses, and lists presentation-view controls with their nearby comment labels. If the patch already has a baked-in tutorial whose step count matches the current cluster shape, the walkthrough overlays the tutorial's hand-authored step names and descriptions. Read-only — never mutates the patch.

### Themed Presentation-View Design System

`c2m-themes/` is a CSS-token-driven design system with 10 themes: `lcars`, `lcars-bold`, `nostromo`, `territory`, `cyberpunk`, `westworld`, `swiss`, `bauhaus`, `memphis`, `soviet`. Tokens (`--c2m-bg`, `--c2m-accent`, `--c2m-text`, `--c2m-frame`, etc.) are translated by `/c2m-design` into spec coordinates and color attributes the converter consumes. Tutorials, panel chrome, and jsui canvases all read from the same token contract.

### Max Compressed Text (MCT)

The converter exports and decodes Max's "Copy Compressed" format, the encoding the Cycling '74 forum uses for shared patches. `python3 spec2maxpat.py mct -i patches/foo.maxpat` produces an MCT block ready to paste into Max via **File > New From Clipboard**; the inverse decode is one Python pipe. Documented end-to-end in `SPEC_REFERENCE.md` § "MCT Encoding Algorithm" and § "Max's Three Patch Serialization Formats" (`.maxpat` envelope vs copy-paste JSON vs MCT — same payload, different wrapping/compression).

### Knowledge Base

Beyond the spec format, the repo carries curated patching knowledge gathered from the wider Max ecosystem:

- `c74-forum/forum_insights.md` — non-obvious behaviors, preferred patterns, and performance pitfalls extracted from the Cycling '74 forums (with the artifact-bearing-thread crawl framework that produced them).
- `cookbook/cookbook_insights.md` — insights from the Max Cookbook (Dobrian / UC Irvine), each example patch downloaded and read in full.
- `patching/MAX_PATCHING.md` — patching principles, presentation-view guidelines, common pitfalls, and the documentation-verification rules that prevent silent-failure bugs (e.g. invented attribute names that Max accepts and ignores).

These sources are consulted by Claude during design and debugging, alongside the official refpages.

### Slash Commands

User-invocable Claude Code skills, all in `.claude/skills/`:

| Command | Purpose |
|---------|---------|
| `/c2m-sync` | Capture manual edits before any convert |
| `/c2m-explain` | One-shot walkthrough of an existing patch |
| `/c2m-tutorial` | Bake an interactive step-by-step tutorial into a patch |
| `/c2m-design` | Design a themed presentation panel and translate it into spec coordinates |
| `/c2m-package-search` | Search the curated package library before composing a long native chain |

### Auto-Surfaced Reminders via Hooks

`hooks/inject_admonitions.py` re-surfaces `{!pre-edit}`-tagged and `{!pre-commit}`-tagged headings as `additionalContext` at the matching moment — for instance, the "Keeping Docs in Sync" rule fires when Claude is about to run `git commit`. New reminders are added by tagging a Markdown heading; no Python changes needed.

### Bidirectional with Manual Max Workflow

Because the spec is embedded and `sync` is non-destructive, you can move freely between Max's GUI and Claude:

1. Claude generates a patch from a spec.
2. You open it, drag things around, add hidden cords, tweak attributes.
3. Next session, Claude reads the patch, sync runs automatically, and the embedded spec reflects your edits.
4. Claude makes a targeted change and re-converts.

No manual diffing or re-pasting required.

---

## Comparison with Other Claude / LLM ↔ Max Tools

The contemporary field is small and converges on three architectures: **imperative-Python codegen**, **live-MCP mutation**, and **declarative-spec codegen**. Claude2Max occupies the third cell and adds two things that no other project combines: refpage-grounded I/O verification and a curated installed-package library.

| Project | Architecture | File Artifact? | Object Verification | Package Knowledge | Round-Trip | Tutorials |
|---------|-------------|----------------|---------------------|-------------------|------------|-----------|
| **Claude2Max** | Declarative spec → `.maxpat` | Yes | C74 refpage XML (on demand) | 2,795 objects, curated `use_when` | Embedded spec + sync | Built-in (`/c2m-tutorial`, `/c2m-explain`) |
| **MaxPyLang** (Barnard PL Labs) | Imperative Python API → `.maxpat` | Yes | Type system in the Python API | None curated | None — code is the source | None |
| **MaxMCP** | MCP server, mutates running Max | No (live patch) | Whatever Max accepts at runtime | None curated | Live state; no file source | None |
| **tiianhk / MaxMSP-MCP** | MCP server, mutates running Max | No (live patch) | Whatever Max accepts at runtime | None curated | Live state | First-class "explain this patch" |
| **Patch Pal** (yeschat GPT) | Conversational GPT | No (chat advice only) | None | None | N/A | N/A |
| **esling / maxmsp_ai** | Research / experimental | Varies | None published | None | Varies | None |
| **taylorbrook / MAX-MSP_CC_Framework** | Object I/O database (data only) | No (reference data) | The database itself | None | N/A | N/A |

### Architecture trade-offs

**Imperative Python (MaxPyLang).** The LLM writes Python that calls a typed API; running the script emits a `.maxpat`. Strong points: type checking on the Python side, no JSON shape to memorize. Weak points: every patch is one-shot codegen — if you edit the patch in Max, your edits don't survive the next run unless you re-derive them in Python. There's no curated package knowledge or refpage-grounded I/O; the LLM still has to know which Max objects exist and what their inlets do.

**Live MCP mutation (MaxMCP, tiianhk).** The LLM speaks to a running Max via an MCP server and mutates the patch in place. Strong points: immediate visual feedback, no save/load round-trip. Weak points: there is no file artifact and no source of truth — the patch lives only in Max's memory until you save it manually, and every "what should I build?" decision is made without a stable reference document the LLM can re-read. Object existence and attribute names are caught only when Max throws (or, more dangerously, silently accepts an unknown attribute and ignores it). MaxMCP does ship a useful Claude Code plugin/skills surfacing pattern, which Claude2Max has adopted.

**Conversational GPT (Patch Pal).** A chat assistant trained or prompted on Max documentation. Useful for "how would I…" questions. Cannot produce or modify a `.maxpat`.

**Claude2Max (declarative spec → file).** The spec is plain JSON; the converter is a single Python file with no dependencies; the patch and the spec live in the same file. The trade-off is a JSON shape to learn, but Claude reads `SPEC_REFERENCE.md` at the start of every session and writes specs as fluently as it writes code. The architectural payoff is that **the patch is its own source of truth**: students get a file they can save, share, version, and re-open weeks later without losing what was in their head when they first built it.

### What Claude2Max keeps that no other tool does

- **Refpage-grounded I/O.** Inlet counts, attribute names, message selectors, and digests come from the actual `*.maxref.xml` files Max ships with — not from the LLM's memory or a static database that drifts behind Max releases. This catches the silent-failure class of bug (Max accepts unknown attribute names and ignores them) that 2023-vintage LLM-emits-Max-JSON experiments documented as a primary foot-gun.
- **Curated installed-package library with `use_when`.** 2,795 package objects, each with a hand-written judgment about when to reach for it instead of a long native chain. The LLM consults this *before* composing a chain, not after.
- **Embedded spec round-trip.** The `.maxpat` is the source of truth; manual edits in Max are preserved by `sync`; there are no stray `.json` files in the project.
- **First-class tutorials and explanations.** `/c2m-tutorial` bakes an interactive walkthrough into the patch itself; `/c2m-explain` generates a fresh walkthrough on demand — neither requires the LLM to be present when the student opens the patch.
- **Themed presentation-view design system.** 10 themes with a token contract, translated automatically into spec coordinates.

### What's worth borrowing from the field

- **MaxMCP's plugin/skills surfacing pattern** — codify guidelines as user-invocable slash commands instead of relying entirely on a long `CLAUDE.md`. Adopted (the `/c2m-*` commands).
- **tiianhk's "explain this patch" workflow** — Adopted as `/c2m-explain`, with a tutorial-aware overlay added.
- **Live-Max integration** — for performance/iteration scenarios where save-and-reopen is the wrong cadence, an MCP layer in front of Claude2Max would complement the file-first architecture rather than replace it. Not currently implemented.

---

## Usage

Convert a spec to a Max patch:

```
python3 spec2maxpat.py convert -i /tmp/spec.json -o patches/my-patch.maxpat
```

Extract the spec from an existing patch:

```
python3 spec2maxpat.py extract -i patches/my-patch.maxpat -o /tmp/spec.json
```

Capture manual edits before re-converting:

```
python3 spec2maxpat.py sync -i patches/my-patch.maxpat
```

Produce an MCT block (paste into Max via **File > New From Clipboard**):

```
python3 spec2maxpat.py mct -i patches/my-patch.maxpat
```

## Example Spec

```json
{
  "name": "simple-synth",
  "objects": {
    "toggle":   { "type": "toggle" },
    "metro":    { "type": "newobj", "text": "metro 500" },
    "random":   { "type": "newobj", "text": "random 128" },
    "makenote": { "type": "newobj", "text": "makenote 100 200" },
    "noteout":  { "type": "newobj", "text": "noteout" }
  },
  "connections": [
    ["toggle",   0, "metro",    0],
    ["metro",    0, "random",   0],
    ["random",   0, "makenote", 0],
    ["makenote", 0, "noteout",  0],
    ["makenote", 1, "noteout",  1]
  ]
}
```

See [SPEC_REFERENCE.md](SPEC_REFERENCE.md) for the full format, including subpatchers, presentation mode, v8/JS objects, attribute syntax, and worked examples for common patterns.

## Setup

After cloning, run this once to enable spec-only diffs for `.maxpat` files:

```
git config diff.claude2max.textconv "python3 spec2maxpat.py extract -i"
```

This makes `git diff` show changes to the embedded spec instead of the raw `.maxpat` JSON.

## Requirements

- Python 3.6+ (no external dependencies)
- Max 8 or Max 9 (refpages are read from the installed Max bundle)
- Claude Code (recommended) for the slash commands and the auto-surfaced documentation hooks

## Repo Map

| File / Folder | What it is |
|---------------|------------|
| [`spec2maxpat.py`](spec2maxpat.py) | The converter (`convert`, `extract`, `sync`, `mct`). On-demand `RefpageCache`. |
| [`add_tutorial.py`](add_tutorial.py) | Tutorial generator (data-flow analysis → step clustering → v8 controller). |
| [`c2m-explain/c2m_explain.py`](c2m-explain/c2m_explain.py) | One-shot walkthrough generator. Read-only. |
| [`SPEC_REFERENCE.md`](SPEC_REFERENCE.md) | Full spec format reference. Read first. |
| [`patching/MAX_PATCHING.md`](patching/MAX_PATCHING.md) | Patching principles, presentation guidelines, doc-verification rules. |
| [`TUTORIAL_GUIDELINES.md`](TUTORIAL_GUIDELINES.md) | Tutorial structural contract and breakage diagnostic. |
| [`CLAUDE.md`](CLAUDE.md) | Workflow, process rules, and cross-cutting conventions for any Claude instance. |
| [`packages/`](packages/) | Curated package library (`package_objects.json`), per-package concepts, query CLI. |
| [`c74-forum/`](c74-forum/) | Forum-knowledge crawl framework + `forum_insights.md`. |
| [`cookbook/`](cookbook/) | Max Cookbook crawl framework + `cookbook_insights.md`. |
| [`c2m-themes/`](c2m-themes/) | CSS-token-driven design system, 10 themes. |
| [`patches/`](patches/) | Generated patches live here. |
| [`.claude/skills/`](.claude/skills/) | The five `/c2m-*` slash commands. |
| [`hooks/`](hooks/) | Pre-edit / pre-Read / pre-commit hooks (sync, admonition surfacing). |
