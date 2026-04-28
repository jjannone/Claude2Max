# Claude2Max

This repo is a tool for generating Max/MSP patches from Claude-authored JSON specs. Your role is to **write specs and convert them to .maxpat files**.

**Audience**: This tool is designed for students with little coding or CLI experience. CLAUDE.md serves as the primary knowledge base — when their instance of Claude reads it, it should learn everything needed to work with Max/MSP, the spec format, and the converter without requiring prior expertise. Include helpful general information here even if it seems basic — students benefit from it and Claude instances need it to assist them effectively.

## Rules from Corrected Errors

After fixing any error, derive a general rule that would have prevented it. Present the proposed rule(s) to the user in plain language before writing them to CLAUDE.md or SPEC_REFERENCE.md. Only enshrine rules the user confirms. This keeps the knowledge base accurate and user-approved rather than accumulating unreviewed assumptions.

**Always generalize before enshrining — regardless of where the rule comes from.** This applies to rules derived from errors, rules stated by the user, rules observed in practice, and rules inferred from context. Before writing any rule, ask: what is the underlying concern this is guarding against? A rule scoped to the specific incident only helps when that exact incident recurs. A rule scoped to the underlying concern applies across a much broader range of situations. Do not wait for the user to ask for generalization — it is always the right default.

**When writing rules, state the general principle — not the specific fix.** A rule that says "do X in situation Y" only helps when Y recurs exactly. A rule that identifies the underlying concern applies across a broader range of circumstances. Ask: what is the real problem this rule is guarding against? Write the rule around that.

**Lead with intent, follow with example.** State what you're trying to achieve in plain terms first, then illustrate with a concrete case introduced as "for instance." This keeps the principle readable and applicable broadly, while still giving actionable guidance. Rules that lead with a specific method risk being read as recipes rather than principles.

## Verify External State — Never Assert from Memory

Before making any claim about the state of an external or shared system — GitHub repo visibility, remote branch status, CI results, whether a file exists on a remote, whether a service is available — verify it with the appropriate tool first. Memory, inference from local context, and reasonable assumptions are not sufficient. A wrong assertion is worse than a delayed one.

For example: don't say a repo is private because it looks like a personal project; run `gh repo view --json visibility` and check. Don't say a branch exists remotely without `git ls-remote`. Don't say a URL is unreachable without trying it.

This applies beyond GitHub to any external state that can change independently of the local working directory.

## When Building a New Version from an Existing Patch

- **Retain all default values.** Any `loadbang → init` chain, `loadmess`, or hardcoded default in the JS must survive unchanged into the new version. Defaults represent deliberate configuration — they are not incidental and must not be silently dropped.

- **Preserve wiring integrity when modifying patches programmatically.** Patchlines reference boxes by `id`, so renaming a box that has connections silently breaks all wiring to and from it. Keep original IDs intact; only assign new IDs to newly added boxes.

## Never Regress Functionality When Changing Modality

**General rule**: when any working feature — display, control, behavior, format — is moved, replaced, or reimplemented in a different modality, it must arrive at least as capable as it left. A change of modality is not a reason to lose functionality.

This applies to: switching UI objects, reformatting data for a new display, replacing a message with a UI element, moving logic from patch to JS or vice versa, or any other substitution. If the user didn't ask for a feature to be removed, it must survive the transition.

**Specific case — display format**: when moving information from one display context to another (Max console → cellblock, message box → UI element, etc.), carry over all essential elements of the working format — indexing, orientation, field order, readable structure. Do not drop features just because the new modality doesn't force you to include them.

Before implementing any new display for existing data, inventory every piece of information in the current format and confirm all of it is present in the new one.

## Model Selection — When to Use Opus vs Sonnet

Claude Sonnet is the default and handles most tasks. **Do not proceed silently on Sonnet when Opus is warranted** — pause and prompt the user first. Use the exact phrasing below so the prompt is unambiguous.

### Prompt to switch to Opus

When any of the following tasks arises, stop before beginning and say:

> "This task warrants Opus for better results — run `/model claude-opus-4-7`, then let me know and I'll continue."

Trigger cases:

1. **Analyzing a dense or complex existing patch** — non-obvious signal flow, reverse-engineering intent, structural problems
2. **Studying complex documentation** — Max refpages, third-party package docs, API references where subtle distinctions matter
3. **Analyzing installed packages** — evaluating objects, writing `use_when` judgments for `package_objects.json`
4. **Reading complex Cycling '74 forum threads** — synthesizing community knowledge, distinguishing good advice from outdated workarounds
5. **Planning a new complex patch** — architecture decisions, subpatcher decomposition, signal flow design before any spec is written
6. **Designing a presentation mode UI** — layout hierarchy, panel grouping, visual weight, control placement. Opus 4.7 is the same model that powers Claude Design (claude.ai/design); switching brings that same visual reasoning to Max presentation views. For complex UIs the user can also sketch at claude.ai/design first and bring the layout back into Claude Code.

### Prompt to switch back to Sonnet

When the analytical or design phase is complete and implementation begins (spec writing, conversion, file editing), say:

> "The analysis/design phase is done — you can switch back to Sonnet now: `/model claude-sonnet-4-6`."

## Before Beginning Any Work

Read and review the entire Claude2Max repo before starting — `CLAUDE.md`, `SPEC_REFERENCE.md`, `TUTORIAL_GUIDELINES.md`, and `spec2maxpat.py` — so your understanding of the current spec format, converter behavior, and conventions is fully up to date. Do not rely on prior session knowledge alone; the repo is the authoritative source.

**Before constructing or editing any patch**, read `MAX_PATCHING.md`. It contains all patching principles, presentation view guidelines, documentation verification rules, and common pitfalls. Treat its presentation section as a checklist before starting any presentation layout.

## Workflow

### Working on an existing patch — sync first, always

**Before any work on an existing .maxpat**, run sync to capture manual edits the user made in Max:

```bash
python3 spec2maxpat.py sync -i patches/patch.maxpat
```

Update your working spec from the sync output, then make changes, then convert. No exceptions — not even for small fixes. `convert` regenerates the .maxpat from scratch and will silently destroy moved objects, added/deleted objects, hidden objects, and hidden cords.

### Spec files are temporary — do not leave them in the project

The spec is embedded inside every `.maxpat`. Standalone `.json` spec files are only needed as a scratch file during `convert`. Write them to `/tmp/` (or any temp location) rather than the project folder, then delete after converting. The `.maxpat` is the single source of truth; extract the spec from it whenever you need to read or edit it.

```bash
python3 spec2maxpat.py extract -i patch.maxpat > /tmp/spec.json
# edit /tmp/spec.json
python3 spec2maxpat.py convert -i /tmp/spec.json -o patch.maxpat
```

### New patch (from scratch)
1. User describes a Max patch they want
2. You write a JSON spec following the format in `SPEC_REFERENCE.md`
3. You convert it with: `python3 spec2maxpat.py convert -i /tmp/spec.json -o patches/patch.maxpat`
4. User opens in Max, gives feedback, you iterate

The spec is embedded in the `.maxpat` — no separate `.json` file needed. Extract it anytime:

```bash
python3 spec2maxpat.py extract -i patches/patch.maxpat
```

### Existing patch (externally sourced or manually edited)

**Before doing any work on a patch**, sync it to ensure the embedded spec is current:

```bash
python3 spec2maxpat.py sync -i patch.maxpat
```

- **No embedded spec** — reverse-engineers one from boxes and patchlines, embeds it, prints it to stdout.
- **Has embedded spec** — reconciles it with the current box positions, text, and wiring (picks up any manual edits made in Max), updates the embed, prints the updated spec to stdout.

After `sync`, the embedded spec is authoritative. Read it, edit it, then convert:

```bash
python3 spec2maxpat.py convert -i updated-spec.json -o patch.maxpat
```

The `.maxpat` is the single source of truth. All patches live in `patches/`.

## Max Compressed Text (MCT)

**Produce MCT only when the user requests it, or when the user has already provided MCT in the conversation.** Never paste raw `.maxpat` JSON — users can't open it. MCT is the format Max uses for "Copy Compressed": the user copies the block and does **File > New From Clipboard** (or pastes directly into an open patcher) to reconstruct the patch.

### What it looks like

```
----------begin_max5_patcher----------
456.3ocwU1zbBBCDF9d+UjImQIAQT609CnG5wNcbhvJMNPBSHXsii+2aRv5G
SiePsNkCJj7tl28Y2EW+.xbgmIWA03GQu5dzdsd2ceKvr8wK51njsJsfUaCF
...
-----------end_max5_patcher-----------
```

Format: `{compressed_byte_count}.{JUCE_base64(zlib_compress(json))}`, wrapped at 60 chars/line.

### How to produce MCT (Claude Code)

After converting a patch, run:

```bash
python3 spec2maxpat.py mct -i patches/patch.maxpat
```

Copy the full output block (including `begin_max5_patcher` / `end_max5_patcher` lines) into your response.

### How to decode MCT you receive

```bash
python3 -c "
from spec2maxpat import mct_decode
import sys, json
print(json.dumps(json.loads(mct_decode(sys.stdin.read())), indent=2))
" << 'EOF'
----------begin_max5_patcher----------
...paste MCT here...
-----------end_max5_patcher-----------
EOF
```

### Encoding algorithm (for reference)

JUCE's `MemoryBlock::toBase64Encoding` reads the compressed bytes **LSB-first** within each byte, packing 6-bit chunks in this order for bytes b0, b1, b2:

| Chunk | Bits |
|-------|------|
| 0 | b0[5:0] |
| 1 | b0[7:6] \| b1[3:0]<<2 |
| 2 | b1[7:4] \| b2[1:0]<<4 |
| 3 | b2[7:2] |

Alphabet: `.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+`
(`.` = 0, A–Z = 1–26, a–z = 27–52, 0–9 = 53–62, `+` = 63)

The `mct_encode` and `mct_decode` functions in `spec2maxpat.py` implement this exactly.

## Key Files

- `SPEC_REFERENCE.md` — **Read this first.** Complete spec format reference with all object types, connection format, layout guidelines, presentation view, and worked examples.
- `spec2maxpat.py` — The converter. Handles inlet/outlet profiles for 1,694 Max objects (via `max_objects.json`), auto-layout, subpatchers, and spec embedding.
- `max_objects.json` / `build_objects_db.py` — **Deleted.** I/O data now comes directly from the C74 maxref.xml files via `RefpageCache` in `spec2maxpat.py`.

## What the Converter Handles for You

- Correct `numinlets`, `numoutlets`, `outlettype` for known objects
- Variable-argument objects (trigger, pack, unpack, select, route, gate, etc.)
- `parameter_enable` and `saved_attribute_attributes` for `live.*` objects
- Spec embedding as hidden `text.codebox` for round-tripping
- Auto-layout (but always use explicit `pos` — auto-layout is a fallback)

## Modifying Externally-Sourced Patches

When a patch is pasted in from an external source and you modify it:

- **Highlight changed objects** — amber background (`"bgcolor": [1.0, 0.82, 0.45, 1.0]`) + black text (`"textcolor": [0.0, 0.0, 0.0, 1.0]`) on changed message boxes; orange border (`"color": [1.0, 0.55, 0.0, 1.0]`) on changed newobj boxes
- **Color affected patchcords** — apply the same orange (`"color": [1.0, 0.55, 0.0, 1.0]`) to any patchlines that were added or rerouted
- **Annotate changes** — add comment objects labeling what changed (e.g. `"← was: 11clicks"`). Place comments at the right margin (x ≥ 565) or inline only where clearly clear of patchcords. No bgcolor on comments.
- **Embed the spec** — include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) below all other objects with the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters

## What You Must Handle

- **Object text** — write it exactly as you'd type it in Max (e.g. `"metro 500"`, `"cycle~ 440"`, `"jit.noise 4 char 320 240"`)
- **Connections** — get outlet/inlet indices right. Max objects have specific inlet/outlet meanings; know them.
- **Layout** — use explicit `pos` for every object. Follow the layout guidelines in SPEC_REFERENCE.md.
- **Presentation** — use `presentation` field for user-facing layouts. Design presentation views as functional, logical, aesthetic UIs — not copies of the patching layout. Key requirements:
  - Every presented control needs a comment label
  - Set `openinpresentation: 1` on the patcher so it opens in presentation mode by default
  - Exclude infrastructure (metros, routers, loadbangs, print objects) from presentation view
  - After converting, post-process the .maxpat to add `presentation_rect` to each presented box
  - Use screenshots (computer-use MCP) to verify layout before reporting done; if unavailable, note it
  - **See `MAX_PATCHING.md` for all layout rules, spacing formulas, and presentation design principles**
- **Subpatcher, abstraction, and poly~ inlet/outlet labeling** — every `inlet` and `outlet` object in a subpatcher, abstraction, or poly~ abstraction must be labeled in two places:
  1. **Outside** (in the parent patcher): set the `@comment` attribute on the `p`/`poly~` object itself, describing each inlet and outlet — index, expected type, and purpose. E.g. `"in 0: bang — trigger generate  |  out 0: list — permutation"`. In the spec, use `attrs: {"comment": "..."}`.
  2. **Inside** (within the subpatcher): both of the following, for every `inlet` and `outlet` object:
     - Set `attrs: {"comment": "..."}` on the `inlet`/`outlet` spec entry — this writes the `comment` key directly to the box and appears as a tooltip/label in the Inspector.
     - Place an actual `comment` box immediately adjacent, describing what the inlet receives or outlet sends. E.g. next to inlet: `"← bang: trigger generate"`, next to outlet: `"→ list: permutation result"`.
  Never create an encapsulated unit without both levels of labeling. This applies at creation time, not as an afterthought.
- **Objects not in the converter's lookup tables** — use `inlets`, `outlets`, and `outlettype` overrides in the spec. This is common for third-party externals.
- **Always embed the spec** — every .maxpat produced using the Claude2Max workflow must include a hidden `text.codebox` (`id: "obj-spec-embed"`, `"hidden": 1`) placed below all other objects, containing the full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters. This applies whether the output is from the converter or assembled manually — if you used Claude2Max thinking (read SPEC_REFERENCE, wrote or modified a spec), embed it.

## v8 / JavaScript Objects

`v8` (Chrome V8 engine) and `js` (SpiderMonkey) objects share the same Max JS API. Prefer `v8` for new patches.

**Spec usage** — `v8` is not in the converter's lookup table; always specify inlet/outlet counts:

```json
{
  "type": "newobj",
  "text": "v8 onesound.js",
  "inlets": 1, "outlets": 6,
  "outlettype": ["", "", "", "bang", "bang", "int"]
}
```

**External JS files** — place `.js` files in the same directory as the `.maxpat`. Max resolves them relative to the patch file.

**jsui objects** — use `"type": "jsui"` with `attrs: {"filename": "script.js"}`, not `type: "newobj", text: "jsui script.js"`. The `filename` attribute is how Max natively associates a JS file with a jsui; omitting it leaves the object unlinked and non-functional. Always include it:

```json
{
  "type": "jsui",
  "pos": [10, 28], "size": [560, 340],
  "inlets": 1, "outlets": 2,
  "outlettype": ["", ""],
  "attrs": { "filename": "script.js" }
}
```

Use just the filename (not an absolute path) so the patch is portable — Max finds the file in the patch's own directory.

**Message routing** — Max dispatches incoming messages by selector (first word) to JS functions of the same name. Arguments follow as function parameters:

| Max message | JS function called |
|-------------|--------------------|
| `bang`       | `function bang()` |
| `setmode 1`  | `function setmode(val)` where `val=1` |
| `parsetarget 13:00:00` | `function parsetarget(str)` where `str="13:00:00"` |

- Set `inlets` and `outlets` globals at the top: `inlets = 1; outlets = 6;`
- Output with `outlet(n, value)`. To send a bang: `outlet(n, "bang")`.
- Use `post("message\n")` for Max console output.
- Extra message arguments beyond the function's parameters are silently ignored.

**When to use v8** — replace chains of `date`, `sprintf`, `match`, `change`, `fromsymbol`, `pack/unpack` logic with a single v8 object when the logic involves string parsing, date/time arithmetic, or stateful comparisons. v8 is not a DSP object — do not put signal processing inside JS.

## Naming Convention

Make user-defined names visually distinct from Max built-ins so patches are readable at a glance: use **ALL CAPS** for all arbitrary names you create — for instance `send TEMPO`, `receive PITCH`, `pv CURRENT_STATE`, `buffer~ LOOPBUF`, `var STEP_COUNT = 0;`. This applies to patcher names, send/receive names, pv and v variables, buffer~ names, coll names, JS variables, and any other user-defined symbol or identifier. It does NOT apply to Max built-in names, object names, or message selectors.


## Tutorial System

`add_tutorial.py` adds an interactive step-by-step tutorial to any `.maxpat`. **Read `TUTORIAL_GUIDELINES.md` before running or modifying the tutorial system.**

### Basic usage (static descriptions)

```bash
python3 add_tutorial.py -i patches/patch.maxpat [-o patches/patch-with-tutorial.maxpat]
```

### AI-enhanced descriptions (recommended)

Two ways to get AI-written, pedagogical step descriptions:

**From Claude Code (no API key needed):**

```bash
# 1. Analyze — outputs step groupings as JSON
python3 add_tutorial.py --analyze -i patches/patch.maxpat > steps.json

# 2. You (Claude Code) read steps.json, write better names/descriptions/placement,
#    save as enhanced-steps.json (same array format, with name/description/placement keys)

# 3. Generate with enhanced descriptions
python3 add_tutorial.py -i patches/patch.maxpat --steps-json enhanced-steps.json
```

The `--steps-json` file is a JSON array with one object per step:
```json
[
  {"name": "Overview", "description": "...", "placement": "right"},
  {"name": "Camera Capture", "description": "...", "placement": "right"}
]
```
`placement` is `"right"`, `"left"`, `"above"`, or `"below"` — controls where the annotation bubble appears relative to the highlighted objects. Falls back to `"right"` if the chosen side doesn't fit.

**With an API key (fully automated):**

```bash
export ANTHROPIC_API_KEY=sk-...
python3 add_tutorial.py --ai -i patches/patch.maxpat
```

### Features

- Analyzes the patch data-flow graph, splits spatially distant objects, merges related connected objects
- Adds a `umenu` + `prev`/`next` message buttons + `loadbang` at the top-right of the patch
- Generates a companion `<patch-name>-tutorial.js` alongside the `.maxpat` — place this next to the .maxpat when opening in Max
- Each step highlights its objects with a background panel (locked, background layer) and shows a bubble-arrow annotation comment
- `loadbang` auto-initializes to step 0 when the patch opens
- The `v8` controller uses `patcher.getnamed()` to show/hide panels and annotations per step

**When to use**: After creating a teaching patch or a complex patch the user wants to understand stage by stage.

## Upstream Maintenance

No external dependencies or build steps. `spec2maxpat.py` looks up I/O counts directly from the Cycling '74 maxref.xml files bundled with Max.app, on demand and per object, caching results for the session. No JSON database, no `build_objects_db.py`. Works automatically as long as Max is installed at a standard path (`/Applications/Max.app`, `/Applications/Max 9.app`, or `/Applications/Max 8.app`). Degrades gracefully if Max is not found — falls back to spec-provided I/O counts.

Hand-verified entries in `NEWOBJ_IO` inside `spec2maxpat.py` always take precedence — those correct cases where even the official docs are wrong (e.g. `gain~` outlet 1 type).

## Keeping Docs in Sync

Whenever you learn something new about Max behavior, fix a bug, or add/change a feature, **immediately** propagate that knowledge to all relevant files before committing:

- `SPEC_REFERENCE.md` — object behavior, .maxpat format details, layout rules; object-specific behavioral notes and pitfalls
- `MAX_PATCHING.md` — patching principles, presentation guidelines, documentation rules, common pitfalls
- `TUTORIAL_GUIDELINES.md` — tutorial generation lessons and conventions
- `CLAUDE.md` — workflow, process rules, cross-cutting conventions
- `WORK_HISTORY.md` — session summary (create it if absent)

**Before every commit/push**, check: did this session produce insights that belong in the reference docs? If so, update them in the same commit. Do not wait for the user to ask — this is automatic.

## New User Setup

**At the start of every conversation**, after the long-gap check, run this:

```bash
USER_EMAIL=$(git config user.email)
echo "$USER_EMAIL"
```

If `USER_EMAIL` is `jannone@mac.com`, skip this section entirely.

Otherwise:

```bash
USER_NAME=$(git config user.name | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
BRANCH="insights/${USER_NAME}"
git branch --list "$BRANCH"
```

If the branch does not exist (empty output):

```bash
git checkout -b "$BRANCH"
```

Then greet the new user:

> "Welcome to Claude2Max. I've created a branch **`insights/<your-name>`** to track your session. As we work together, I'll log useful discoveries, workflow improvements, and corrections to `insights.md` on this branch. If anything seems worth sharing with other users, I'll let you know — it only takes a PR to contribute it back."

Create `insights.md` if it doesn't exist:

```markdown
# Claude2Max Insights — <user name>

Discoveries, corrections, and workflow improvements gathered during use.
Candidates for upstream PRs are marked **[PR candidate]**.

## Log

```

From that point forward in the session:
- Append any confirmed new rule, correction, or non-obvious workflow insight to `insights.md` under the `## Log` section with today's date
- Mark entries `**[PR candidate]**` when they seem broadly useful (not just specific to this user's patch)
- At the end of the session, if there are any PR candidates, remind the user: "There are N entries in `insights.md` marked as PR candidates — consider opening a pull request to share them upstream."

## Work History

**At the start of every conversation, and after any gap of more than one hour within a conversation:**
1. Read `WORK_HISTORY.md` to get up to date with recent changes.
2. Read `TASK_QUEUE.md` and report any pending tasks to the user before beginning other work. Say something like: "There are N pending tasks in the queue — [list them briefly]. Want to work on any of these, or something else?"

To detect a long gap within a conversation, run this on every incoming message:
```bash
LAST=/tmp/claude2max_session_check
NOW=$(date +%s)
if [ ! -f "$LAST" ] || [ $(( NOW - $(cat "$LAST") )) -gt 3600 ]; then
    echo "CHECK_NEEDED"
    echo $NOW > "$LAST"
else
    echo "OK"
fi
```
If the output is `CHECK_NEEDED`, run the session-start checks above. If `OK`, proceed normally. This resets on reboot, which is fine — a reboot implies a fresh start.

When a queued task is completed, mark it `- [x]` and move it to the Done section with a completion date.

**Task queue notation** — always use plain English markers, never checkbox symbols:
- `[pending]` — not yet started
- `[in progress]` — currently being worked on (include a brief note of where things stand)
- `[complete]` — finished (move to Done section)

When adding a task to the queue, always write a full expanded description — enough for any Claude instance to pick it up cold without this conversation's context. Include: what to build, where (file/function), why it's needed, implementation notes, prerequisites, and how it fits into the larger system. Also present the expanded description to the user in chat so they can confirm it captures the intent correctly before it's committed.

At the end of any session where meaningful work was done, append an entry to `WORK_HISTORY.md`. Do this automatically — no need for the user to ask. Format: `- YYYY-MM-DD: <1-2 sentence summary>`

**If `WORK_HISTORY.md` does not exist, create it** with a minimal header before appending:

```markdown
# Work History
```

**Do not rely solely on the stop hook.** Sessions that hit the context limit are cut off without firing the hook. Instead, update `WORK_HISTORY.md` proactively — after any significant milestone within a session, not only at the very end.

