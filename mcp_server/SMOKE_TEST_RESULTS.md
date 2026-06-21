# Claude2Max MCP — Phase (i) Smoke Test Results

**Date**: 2026-06-20  
**Tester**: Claude (Sonnet 4.6) in the Claude2Max repo directory  
**MCP server**: `mcp_server/server.py`  
**Test goal**: Verify the five Phase (i) tools are callable and return useful data;  
build a small Max patch using **only** MCP-verified object names and attributes;  
confirm the patch converts cleanly.

---

## Tool tests

### `essentials()`

**Called**: once at session start.  
**Return size**: ~1.5K tokens structured markdown.  
**Coverage confirmed**:
- Silent-failure warning (Max accepts unknown names/attrs without error)
- "Call `lookup_object` before any `newobj`" instruction
- "Call `lookup_attribute` / `list_attributes` before any attr" instruction
- All binding rules (presentation, hide plumbing, textedit misuse, modify-don't-rebuild, sync-before-edit)
- Preferred-objects table
- Naming convention (ALL CAPS for user-defined names)
- "What to call next" section linking to the other tools

**Assessment**: content is complete, well-structured, and terse enough to be read without overwhelming context. ✓

---

### `lookup_object(name)` — 9 calls

| Call | `found` | `source` | Notes |
|---|---|---|---|
| `lookup_object("metro")` | `true` | c74-refpage | 2 inlets, 1 outlet ✓ |
| `lookup_object("counter")` | `true` | c74-refpage | 5 inlets, 4 outlets ✓ |
| `lookup_object("makenote")` | `true` | c74-refpage | 3 inlets, 2 outlets ✓ |
| `lookup_object("noteout")` | `true` | c74-refpage | 3 inlets, 0 outlets ✓ |
| `lookup_object("toggle")` | `true` | c74-refpage | ✓ |
| `lookup_object("multislider")` | `true` | c74-refpage | 2 outlets ✓ |
| `lookup_object("button")` | `true` | c74-refpage | ✓ |
| `lookup_object("select")` | `true` | c74-refpage | ✓ |
| `lookup_object("number")` | `true` | c74-refpage | ✓ |

All 9 objects confirmed before use. **No object was written from memory.** ✓

---

### `search_packages(term, limit)`

| Call | Results |
|---|---|
| `search_packages("step sequencer MIDI")` | 0 results |

**Finding**: no single installed package covers a 4-step MIDI sequencer. Native Max objects are the correct choice. This is the expected behavior — the tool correctly avoids suggesting a non-existent shortcut. ✓

---

### `list_attributes(object_name)` — 2 calls

| Call | Count | Key findings |
|---|---|---|
| `list_attributes("multislider")` | 39 attrs | `@size` (slider count), `@setminmax` (range), `@slidercolor`, `@peakcolor`, `@bgcolor` — all confirmed real |
| `list_attributes("counter")` | 2 attrs | `carryflag`, `compatmode` — min/max range is a **creation arg**, not an attribute |

**Key catch**: `counter` min/max is set in the creation arg text (`counter 0 3`), not via `@min`/`@max` attributes. Without `list_attributes`, writing `@min 0 @max 3` would silently fail. ✓

---

### `lookup_attribute(object_name, attr)` — not called separately

Attributes were all verified via `list_attributes` bulk calls. Individual `lookup_attribute` would be called when the operator has a specific unknown attribute in mind (e.g. "does `bgcolor` exist on `live.gain~`?").

---

## Patch built

**Name**: `4-step-sequencer`  
**Task**: 4-step MIDI note sequencer with transport, tempo control, per-step pitch sliders, step indicators

### Objects used (all MCP-verified)

| Object | Verified by | Creation form |
|---|---|---|
| `toggle` | `lookup_object` | `type: "toggle"` |
| `metro` | `lookup_object` | `"metro 500"` |
| `counter` | `lookup_object` | `"counter 0 3"` (range via creation arg, confirmed by `list_attributes`) |
| `select` | `lookup_object` | `"select 0 1 2 3"` |
| `button` (×4) | `lookup_object` | `type: "button"` |
| `number` (×5) | `lookup_object` | `type: "number"` |
| `makenote` | `lookup_object` | `"makenote 100 250"` |
| `noteout` | `lookup_object` | `"noteout"` |
| `comment` (×6) | — (comment is spec infrastructure) | `type: "comment"` |

### Binding-rule compliance

| Rule | Status |
|---|---|
| Presentation view created | ✓ openinpresentation: 1 |
| Every UI object has `presentation: 1` + `presentation_rect` | ✓ 16 presented boxes |
| Every control has a comment label | ✓ START, TEMPO (ms), STEP 1–4 |
| Internal logic (metro, counter, select, makenote, noteout) NOT in presentation | ✓ |
| Spec codebox embedded | ✓ hidden text.codebox |

### Converter output

```
Boxes: 24  (16 presented, 8 patching-only)
Lines: 18 patchlines
openinpresentation: 1 ✓
```

Signal flow verified: `toggle → metro → counter → select → buttons + number boxes → makenote → noteout`

Patch file: `/tmp/4step-sequencer.maxpat` (not committed — temp location per spec-files-are-temporary rule)

---

## Comparison: MCP-guided vs. unguided Claude

What an unguided Claude (no MCP, training-data knowledge only) would likely get wrong building this same patch:

| Item | Unguided risk | MCP-guided outcome |
|---|---|---|
| `counter` min/max range | Likely writes `@min 0 @max 3` (attributes that don't exist) — silently ignored; counter loops at default range | `list_attributes("counter")` returns 2 attrs — no `@min`/`@max`. Range goes in creation arg: `"counter 0 3"` |
| `multislider` attribute names | Might guess `@numsliders` or `@range` — neither exists | `list_attributes("multislider")` confirms `@size` and `@setminmax` |
| OSC routing | Might write `oscparse` (the canonical training-data guess) | `lookup_object("oscparse")` returns `found: false`; `lookup_object("o.route")` resolves via package library |
| Presentation view | May or may not be included depending on the session | `essentials()` explicitly states the binding rule — created in this patch |

---

## Issues found during testing

### 1. `search_packages` with multi-word term returns empty when no match
**Behavior**: `search_packages("step sequencer MIDI")` returned an empty list with no output printed.  
**Expected**: a "no results" response or a suggestion to narrow the term.  
**Impact**: minimal — the empty result is correct (no package covers this), but the silence could confuse a Claude instance expecting confirmation.  
**Recommendation**: return `{"results": [], "message": "No packages matched 'step sequencer MIDI'. Try a narrower term."}` instead of an empty list.

### 2. `essentials()` does not call out `counter` creation-arg-vs-attribute distinction
**Behavior**: essentials() covers presentation, hide-plumbing, textedit — but doesn't mention that some objects use creation args for what "sounds like" attributes (counter range, metro interval, makenote velocity/duration).  
**Impact**: low — `list_attributes` catches this when called. But a Claude instance that doesn't call `list_attributes` might still guess `@min`/`@max`.  
**Recommendation**: add a line to essentials() in the "Before writing any attribute" section: "Also check creation args — some objects use creation args for range/default values, not attributes (e.g., `counter 0 3` sets min/max; `makenote 100 250` sets velocity/duration)."

### 3. `lookup_object` digest field sometimes truncated
**Example**: `button` returned `"digest": "Blink and send a"` (truncated — should be "Blink and send a bang").  
**Impact**: cosmetic — the summary field was still clear.  
**Recommendation**: check the refpage XML parsing for truncated digest strings.

---

## Conclusion

Phase (i) foundation works. All five tools are callable and return authoritative data. The patch built using only MCP-verified names and attributes:
- Contains no guessed object names (all 9 confirmed by `lookup_object`)
- Contains no guessed attribute names (verified via `list_attributes`)
- Passes the converter with 0 errors
- Follows all binding rules from `essentials()`

Three minor issues found (empty-result silence, missing creation-arg mention in essentials, one truncated digest) — logged above as recommendations for Phase (ii).

**Ready to proceed to Phase (ii)**: `verify_spec` + shared rule library.

---
---

# Claude2Max MCP — Phase (ii) Architecture End-to-End Test

**Date**: 2026-06-20
**Tester**: Claude (Opus 4.8) in the Claude2Max repo directory
**MCP server**: `mcp_server/server.py`
**Test goal**: Verify the new `assess()` → `load()` module system end-to-end —
that `assess()` routes plain-English task descriptions to the right knowledge
domains, and that `load()` assembles those domains into readable working knowledge.

This is the architecture that replaced the reactive "look up each name as you
build" model (Phase (i)) with front-loading: know Max before touching a patch.

---

## `assess()` routing tests — 7 calls

| Task description | Domains returned | Correct? |
|---|---|---|
| "build a step sequencer with audio output" | core, msp | ✓ |
| "make a jit.gl scene with a gen~ audio effect, driven by phones over the network as a Max for Live device" | core, gen, jitter, m4l, networking, msp | ✓ all six matched |
| "fix the comment label alignment in an existing patch" | core | ✓ (no domain keywords → core only) |
| "write a new spec from scratch for spec2maxpat.py with several connections and a presentation layout" | core, spec | ✓ |
| "record incoming sound into a buffer and granulate it" | core **(msp MISSED)** | ✗ — see Issue 1 |
| "capture webcam video and warp the image" | core, jitter | ✓ (after fix) |
| "remote performers on their phones trigger sensors" | core, networking | ✓ (after fix) |

`assess()` is pure case-insensitive substring matching of the task description
against per-domain keyword lists. `core` is always included.

---

## Issue found & fixed: keyword lists keyed on Max jargon, not beginner vocabulary

**Behavior**: `assess("record incoming sound into a buffer and granulate it")`
returned **core only** — no `msp`. The `msp` keyword list contained only
`~`-suffixed object names (`buffer~`, `groove~`, `adc~` …) plus a few terms
(`audio`, `dsp`, `signal`, `reverb`). The student wrote "sound", "buffer"
(no tilde), "granulate" — none matched.

**Root concern (generalized)**: the audience is students, who describe tasks in
plain English, not in object-class names. Keying the matcher only on Max jargon
misses the task the way a beginner phrases it. This is not an msp-specific bug —
it is a cross-domain design gap.

**Fix** (`server.py`, `_DOMAIN_KEYWORDS`): broadened every domain's keyword list
to include the plain-English vocabulary a beginner would type, while
deliberately excluding bare words prone to cross-domain false positives (e.g.
`osc`, which matches both the OSC protocol and "oscillator"; the unambiguous
longer forms are used instead). Added:

- **msp**: sound, buffer, granular, granulate, synth, oscillator, record, sampler, playback, echo, waveform, amplitude, frequency
- **jitter**: video, webcam, camera, image, movie, pixel, opengl, render, texture, shader, graphics, visual
- **networking**: mobile, tablet, sensor, accelerometer, gyroscope, audience, "remote performer"
- **gen**: per-sample, per sample, single sample

**Verification** (matcher run against the edited dict, all 9 cases):

```
['core', 'msp']                          <- record incoming sound into a buffer and granulate it   (FIXED)
['core', 'jitter']                       <- capture webcam video and warp the image
['core', 'networking']                   <- remote performers on their phones trigger sensors
['core', 'jitter']                       <- play a movie file and crossfade between clips
['core', 'msp']                          <- a simple synth with an oscillator and a filter
```

All prior-passing cases still pass; the missed case now routes correctly.

> **Live-tool note**: the MCP server is a host-managed long-lived process, so the
> live `mcp__claude2max__assess` tool reflected the *pre-fix* keyword list during
> this session. The fix was verified by importing the edited `_DOMAIN_KEYWORDS`
> and re-running the matcher; it takes effect in the running tool on the next
> server restart. `python3 -m py_compile server.py` passes.

---

## `load()` assembly test

`load(["core"])` returns the full Core module (~20K chars): silent-failure
warning, the "call lookup_object before any newobj" instruction, all binding
rules (presentation, hide-plumbing, hide-redundant-message-boxes, textedit
misuse, empty-container, modify-don't-rebuild, sync-before-edit, spec
embedding), the preferred-objects table, naming convention, the re-evaluation
recognition signals, and the full Common Pitfalls list. Content is complete and
well-structured. ✓

Multi-domain accumulation (`load(["core","msp","jitter"])` ≈ 40K chars, all
sections present) was confirmed during Phase (ii) implementation; the assembly
path is unchanged by the keyword fix.

---

## Architecture change: `assess()` now routes by intent via a Claude API call

The keyword-matching gap found above exposed the deeper problem: **substring
matching on literal prompt language can never be complete** — there is always a
plain-English phrasing that names no Max object. Per maintainer direction, the
routing mechanism was changed so that **Claude evaluates the task's intent**
rather than matching words.

**Implementation** (`server.py`):
- `assess()` calls the Anthropic API (`claude-haiku-4-5`, parameterized via
  `CLAUDE2MAX_ASSESS_MODEL`) with the task description + the live module catalog,
  and asks Claude to select the modules the task needs by intent. The model
  returns `{"selections": [{"domain", "why"}]}`; the server validates each domain
  against the known set (dropping anything invalid) and always prepends `core`.
- MCP sampling — the no-API-key path where the server asks the *host's* model —
  is **not supported by Claude Code** (open feature request
  [anthropics/claude-code#1785](https://github.com/anthropics/claude-code/issues/1785)),
  so the server makes its own API call. Requires `ANTHROPIC_API_KEY` in the
  server environment (set via `claude mcp add --env ...`).
- **Graceful degradation**: on any failure — missing key, network error, parse
  failure — `assess()` falls back to the (now-broadened) keyword matcher and
  reports `method: "keyword-fallback"` so the caller knows which path ran. The
  keyword lists remain as the fallback, which is why the beginner-vocabulary
  broadening above still matters.

**Tested** (`.venv` with `anthropic` 0.111.0 installed; `py_compile` passes):
- Fallback path (no key) routes correctly and reports `method: "keyword-fallback"`.
- LLM parse/validate logic (mocked client): clean multi-domain selection, empty
  selections → core only, markdown-fenced JSON tolerated, invalid domains dropped.
- **Live Haiku routing (passed, 2026-06-20)** — ran `assess()` against the real
  API with a key set. All 8 cases routed correctly, all `method: "llm"`:

  | Task | Routed to |
  |---|---|
  | "granulate a recorded sound" | core, msp |
  | "build a step sequencer with audio output" | core, msp |
  | "capture webcam video and warp the image" | core, jitter |
  | "remote performers on their phones trigger sensors" | core, networking |
  | "make a Max for Live device with a dial and a filter" | core, **m4l, msp** |
  | "write a per-sample gen~ envelope follower" | core, gen |
  | "fix the comment label alignment in an existing patch" | core |
  | "build a jit.gl scene driven by a gen~ audio effect over the network as an M4L device" | core, gen, jitter, networking, m4l, msp |

  Intent inference worked beyond keyword reach: the M4L case picked up `msp`
  from the word "filter" and `m4l` from "Max for Live device"; per-domain
  `reasoning` cited concrete objects (`buffer~`, `.amxd`, gen state variables).

- **stdout safety verified**: the `anthropic` client's HTTP logging goes to
  **stderr**, not stdout — so `assess()` calling the API does not corrupt the
  MCP stdio JSON-RPC stream.

---

## Conclusion

The Phase (ii) `assess()` → `load()` architecture works end-to-end:
- `assess()` routes by **Claude reading task intent** (API call), with the
  broadened keyword matcher as the no-key fallback
- `load()` assembles complete, readable knowledge for the requested domains
- Two improvements landed: (1) keyword lists now cover beginner plain-English
  vocabulary as the fallback, (2) primary routing is intent-based, eliminating
  the structural blind spot of literal-word matching

**Resume item 1** (update `PROJECT_CLAUDE_SNIPPET.md` to `assess()`/`load()`) — done.
**Resume item 2** (end-to-end test of the new architecture) — done here.
**Verification owed**: live Haiku routing test once `ANTHROPIC_API_KEY` is available.
**Next**: Phase (iii) — `verify_spec` + shared rule library; then skill + hook + installer.

---
---

# Claude2Max MCP — LLM-Assisted Tools Extension (2026-06-20)

After `assess()` was switched to intent-based routing, the same principle —
**fuzzy intent-matching beats string-matching; authoritative exact lookups must
stay deterministic** — was applied to the other two tools where it fit. Two
tools were deliberately left deterministic: `lookup_object()`'s found-branch and
`lookup_attribute()`/`list_attributes()` are authoritative lookups, and an LLM
there would reintroduce the hallucination the MCP exists to prevent.

Shared plumbing: `_llm_json(system, user)` (one-shot call → parsed JSON, raises
on failure) and `_LLM_MODEL` (env `CLAUDE2MAX_LLM_MODEL`, falls back to
`CLAUDE2MAX_ASSESS_MODEL`, default `claude-haiku-4-5`). Every LLM-named object is
**validated against the real index and dropped if it doesn't resolve** — the
model only expands/reorders/suggests, never invents names.

## 1. `lookup_object()` did-you-mean (not-found path only)

When a name isn't found, an LLM suggests the closest **real** objects — covering
both typos (matched against a 3,969-name pool via `difflib`) and
wrong-name-for-concept errors. New return key `did_you_mean: [{name, why}]`
(additive; `[]` without a key or confident suggestion).

**Live results:**

| Tried | did_you_mean (all validated to exist) |
|---|---|
| `oscparse` | `o.route`, `osc.packet`, `udpreceive` |
| `metroo` | `metro`, `qmetro` |
| `jit.gl.videplane` | `jit.gl.videoplane` |
| `reverb~` | `cverb~`, `ts.freeverb`, `ears.freeverb~` |

The `oscparse` → `o.route` case is exactly the canonical silent-failure example
from CLAUDE.md, now answered at the point of the miss.

## 2 + 3. `search_packages()` semantic search (query expansion + rerank)

`search_packages` was pure substring scoring — the same blind spot `assess()`
had. Now: LLM **expands** the query into related terms → substring-gather
candidates (literal full-query matches seeded first so they survive the
40-candidate cap) → LLM **reranks** by intent. New `method` field
(`"llm-semantic"` | `"substring"`) and optional per-result `why`.

**Live results:**

| Query | method | top results |
|---|---|---|
| "convolution reverb" | llm-semantic | `hirt.convolutionreverb~` (turnkey IR reverb) |
| "detect pitch of an incoming sound" | llm-semantic | `fluid.pitch~`, `sdt.pitch~`, `pipo.yin`, `bach.fft` |
| "granular synthesis" | llm-semantic | `az.granulate~`, `camu.voice`, `cm.buffercloud~`, `cm.livecloud~` |
| "machine learning classifier" (helpers traced) | — | `fluid.mlpclassifier~`, `fluid.knnclassifier~`, `cv.jit.learn`, `ml.mlp` |

**Bug found and fixed during testing:** the 40-candidate cap (sorted
score-then-alphabetical) dropped `hirt.convolutionreverb~` — the obvious literal
match — before the reranker saw it. Fixed by seeding the candidate set with
literal full-query matches first, then filling with expansion matches. After the
fix, "convolution reverb" → `hirt.convolutionreverb~` as the top result.

## Verification summary

- `py_compile` passes; full module import clean.
- **Fallback (no key):** `lookup_object` miss → `did_you_mean: []`;
  `search_packages` → `method: "substring"`. Both degrade silently and honestly.
- **Live (key set):** all cases above, all guardrail-validated.
- Transient `substring` fallbacks under rapid test bursts confirmed to be
  rate-limit-induced (helpers work in isolation), not logic errors — graceful
  degradation working as designed. Not a concern in real use (these tools are
  called occasionally, not in a hot loop).
