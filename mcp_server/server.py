#!/usr/bin/env python3
"""
Claude2Max MCP server — Phase (i) + (ii) complete; Phase (iii) verify_spec done.

Exposes Max/MSP patching knowledge as first-class callable tools so Claude can
query binding rules, object existence, and attribute validity rather than
reasoning from training-data memory (which fails silently in Max).

Knowledge architecture
----------------------
assess()  → identify which domain modules the task needs
load()    → load those modules into context (front-loads knowledge before patching)
            modules are additive — call load() again if the task evolves

Verification tools (use after knowledge is loaded)
---------------------------------------------------
lookup_object()     Authoritative object existence + I/O signature.
search_packages()   Search 2,795-object package library by term.
lookup_attribute()  Attribute validity check for a specific attr.
list_attributes()   All valid attrs for an object (bulk verification).
verify_spec()       Static binding-rule check on a spec before converting.
search_pitfalls()   Search Common Pitfalls + forum/cookbook insights by term.
lookup_rule()       Find a binding rule by a fragment of its name.
essentials()        Backward-compat alias for load(["core"]).

The verify_spec() rule library lives in mcp_server/claude2max_verify/ and is
ALSO imported by spec2maxpat.py, so the same checks run automatically at convert
time — one source of truth for the binding rules.

Usage
-----
Register (user scope — reachable from any cwd):
    claude mcp add --scope user claude2max -- python3 /absolute/path/to/mcp_server/server.py

Run directly for debugging:
    python3 mcp_server/server.py

See mcp_server/SMOKE_TEST_RESULTS.md for Phase (i) end-to-end test results.
"""

import json
import os
import sys
from pathlib import Path

from mcp.server.fastmcp import FastMCP

# ── repo-root imports ─────────────────────────────────────────────────────────
# spec2maxpat.py lives one directory up from this file.  Adding the repo root
# to sys.path lets us reuse RefpageCache — the same XML-backed lookup the
# converter already uses — without duplicating the parsing logic.
_REPO_ROOT = Path(__file__).resolve().parent.parent
_MCP_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(_REPO_ROOT))
sys.path.insert(0, str(_MCP_DIR))   # so claude2max_verify resolves when imported

from spec2maxpat import RefpageCache  # noqa: E402 — path must be set first
from spec2maxpat import build_resolver as _build_resolver  # noqa: E402

# Shared rule library — also imported by spec2maxpat.py convert, so verification
# fires both via this tool AND at convert time (single source of truth for rules).
from claude2max_verify import format_report as _verify_report  # noqa: E402
from claude2max_verify import verify_spec_json as _verify_spec_json  # noqa: E402

_refpage = RefpageCache()

# ── package library ───────────────────────────────────────────────────────────
_PACKAGES_PATH = _REPO_ROOT / "packages" / "package_objects.json"
_packages_raw: dict | None = None   # {pkg_name: {obj_name: record}}
_packages_idx: dict | None = None   # {obj_name: (pkg_name, record)}  first-wins


def _pkg_raw() -> dict:
    global _packages_raw
    if _packages_raw is None:
        if _PACKAGES_PATH.exists():
            try:
                with _PACKAGES_PATH.open() as f:
                    _packages_raw = json.load(f)
            except (json.JSONDecodeError, OSError):
                _packages_raw = {}
        else:
            _packages_raw = {}
    return _packages_raw


def _pkg_idx() -> dict:
    global _packages_idx
    if _packages_idx is None:
        idx = {}
        for pkg, objs in _pkg_raw().items():
            for name, rec in objs.items():
                if name not in idx:
                    idx[name] = (pkg, rec)
        _packages_idx = idx
    return _packages_idx


mcp = FastMCP("claude2max")

# ---------------------------------------------------------------------------
# Module system — assess() + load()
# ---------------------------------------------------------------------------

_PATCHING_DIR = _REPO_ROOT / "patching"

_MODULE_FILES: dict[str, list[Path]] = {
    "gen":     [_PATCHING_DIR / "GEN_PATCHING.md"],
    "jitter":  [_PATCHING_DIR / "JIT_GEN_PATCHING.md",
                _PATCHING_DIR / "JITTER_JS_PATCHING.md"],
    "m4l":     [_PATCHING_DIR / "M4L_PATCHING.md"],
    "spec":    [_REPO_ROOT / "SPEC_REFERENCE.md"],
}

_DOMAIN_DESCRIPTIONS: dict[str, str] = {
    "core":       "Binding rules, Common Pitfalls, preferred objects, naming convention — always loaded",
    "gen":        "gen~ / gen programming model (per-sample evaluation, gen-specific objects, idioms)",
    "jitter":     "Jitter matrix, jit.gen, jit.gl.pix, JS-driven JitterMatrix API",
    "m4l":        "Max for Live — LOM access, live.* objects, device lifecycle, .amxd packaging",
    "networking": "node.script, multi-user-template, WebSocket, OSC, phone-driven pieces",
    "msp":        "Audio signal chain, DSP objects, buffer~, audio-specific pitfalls",
    "spec":       "Spec format for spec2maxpat.py — object types, connections, layout fields",
}

# Keyword lists deliberately include BOTH Max jargon (gen~, jit.gl, buffer~)
# AND the plain-English vocabulary a beginner actually types ("sound",
# "granulate", "webcam"). The audience is students, not experts — keying
# only on object names misses the task the way they describe it. Bare words
# prone to false positives across domains (e.g. "osc" — matches both the OSC
# protocol and "oscillator") are deliberately excluded in favour of the
# unambiguous longer form.
_DOMAIN_KEYWORDS: dict[str, list[str]] = {
    "gen":        ["gen~", "codebox", "[gen]", "gen box", "per-sample",
                   "single sample", "per sample"],
    "jitter":     ["jit.", "jitter", "gl.", "jit.gen", "jit.gl", "jit.world",
                   "jit.grab", "jit.pwindow", "jit.matrix", "videoplane", "matrix",
                   "video", "webcam", "camera", "image", "movie", "pixel",
                   "opengl", "render", "texture", "shader", "graphics", "visual"],
    "m4l":        ["m4l", "max for live", "live.", ".amxd", "amxd", "lom",
                   "live object model", "ableton"],
    "networking": ["node.script", "websocket", "wss://", "ws://", "phone",
                   "multi-user", "server.js", "udpreceive", "udpsend", "performer",
                   "mobile", "tablet", "sensor", "accelerometer", "gyroscope",
                   "audience", "remote performer"],
    "msp":        ["audio", "dsp", "signal", "buffer~", "groove~", "cycle~",
                   "adc~", "dac~", "gain~", "filter~", "reverb", "tapin~",
                   "playlist~", "ezdac~", "sound", "buffer", "granular",
                   "granulate", "synth", "oscillator", "record", "sampler",
                   "playback", "echo", "waveform", "amplitude", "frequency"],
    "spec":       ["json spec", "from scratch", "write a spec", "spec file",
                   "spec2maxpat", "converter"],
}

# Inline modules for domains without a dedicated file.

_MSP_MODULE = """\
# Max/MSP — Audio Signal Chain Module

## Signal objects
Objects processing audio use a `~` suffix. Never mix signal and message rate
without a conversion object (`snapshot~`, `number~`, `sig~`).

## Preferred audio objects
- I/O: `ezadc~` / `ezdac~` (toggle-style; click the speaker icon to enable)
- Level: `live.gain~` (stereo-aware, M4L aesthetic) or `gain~`
- Oscillators (bandlimited): `saw~`, `tri~`, `rect~`
- Sample playback: `groove~` — needs a named `buffer~`; supports loop points, speed, direction
- File playback: `playlist~` — multi-file with crossfades; don't build sfplay~ + bank by hand
- Reverb: `bp.Gigaverb` (BEAP, ships with Max) or `bp.Freeverb` (lighter Schroeder)
- Delay: `tapin~` / `tapout~` — NOT `delay~`
- Filter: `biquad~` + `filtergraph~` for visual coefficient editing
- Recording: `record~` — needs a named `buffer~`

## live.gain~ color attributes
Valid: `coldcolor warmcolor hotcolor overloadcolor slidercolor textcolor tricolor
trioncolor tribordercolor focusbordercolor modulationcolor inactivecoldcolor inactivewarmcolor`
NOT valid (silently ignored): `bgcolor peakcolor knobcolor needlecolor`

## Stereo
Preserve both channels through the entire chain to `ezdac~`.
`live.gain~` handles stereo natively (2 signal inlets, 2 signal outlets).

## gen~ context
Audio-rate DSP inside a gen~ box is a separate language — call `load(["gen"])`.
"""

_NETWORKING_MODULE = """\
# Max Networking — node.script + multi-user-template Module

## Use the template — don't build from scratch
When a patch needs phones as controllers, Max driving phone outputs, lobby+roles,
or remote performers over the internet, base it on multi-user-template.
Repo: multi-user-template/ (sibling of Claude2Max on this machine)

## Messages from node.script outlet (Max receives these — route by leading symbol)
```
performer add|remove|role|roles <name> [args]
roster <name1> <name2> ...
sensor <name> <kind> <args...>
    kinds: motion gyro orient heading geo mic touch pointer
           gamepad button slider dial key text midi
cloud status|connected <args>
```

## Messages to node.script inlet (Max → phones)
```
vibrate <ms>             speak <text>
beep <freq> <ms>         display <text>
synthnote <note> <vel>   synthset <param> <val>
synthmode osc|fm|wavetable|sample
setcloudurl wss://...    setpiece <slug>    setroom <slug>
cloudon                  cloudoff
```

## Cloud relay
URL: `wss://mu-relay.jannone-544.workers.dev`
Already deployed — do not stand up a parallel Worker.
Piece + room slug pair selects the Durable Object.

## Critical gotchas
- **textedit outputmode**: outlet 0 emits `text <symbol>` — `[setcloudurl $1]` captures
  `"text"`. Set `@outputmode 1`, use `[route text]`, or hardcode in server.js instead.
- **OSC**: `udpreceive <port>` natively decodes flat OSC messages; `route /foo/bar`
  matches directly. `o.route` (CNMAT odot) needed only for OSC bundles.
- **node.script @watch 1**: re-execs the script but doesn't re-fire loadbang.
  Keep defaults in BOTH the script literals AND loadbang messages.
"""


def _read_md(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except OSError:
        return f"[Module file not found: {path.name}]"


def _extract_section(text: str, header: str) -> str:
    """Extract one `## Header` section from markdown (stops at next `## ` heading)."""
    lines = text.splitlines()
    capturing = False
    result: list[str] = []
    for line in lines:
        if line.strip() == header:
            capturing = True
            result.append(line)
            continue
        if capturing:
            if line.startswith("## ") and line.strip() != header:
                break
            result.append(line)
    return "\n".join(result)


def _build_module(domain: str) -> str:
    """Return the markdown content for a knowledge module."""
    if domain == "msp":
        return _MSP_MODULE
    if domain == "networking":
        return _NETWORKING_MODULE
    paths = _MODULE_FILES.get(domain)
    if not paths:
        return f"[Unknown domain: {domain}]"
    parts = [_read_md(p) for p in paths]
    return "\n\n---\n\n".join(parts)


_RE_EVAL_BLOCK = """\
## Re-evaluation — call load() again when the task evolves

If you encounter an object prefix, pattern, or concept outside what's currently loaded,
stop and call `load([new_domain])` before proceeding. Modules accumulate — each call adds
to context without replacing prior loads.

Recognition signals:
- `jit.` or `gl.` prefix → `load(["jitter"])`
- Work inside a `gen~` or `gen` box → `load(["gen"])`
- `live.*` objects, M4L device, LOM access → `load(["m4l"])`
- `node.script`, WebSocket, phone performers, OSC server → `load(["networking"])`
- Writing a spec from scratch for spec2maxpat.py → `load(["spec"])`
- Audio signal chain, `~` objects, DSP → `load(["msp"])`
- Any object whose prefix or namespace you don't recognise → call `assess()` again
  with the new context before adding it to a patch
"""

# ---------------------------------------------------------------------------
# essentials() — now a backward-compat alias for load(["core"]).
# ---------------------------------------------------------------------------

_ESSENTIALS_MD = """\
# Claude2Max — Max/MSP Binding Rules (essentials)

## Operating stance — you do not know Max from memory

Your training-data recall of Max object names, attributes, and wiring is right on
shape but wrong on specifics often enough to break patches silently. So the rule
is absolute: **every object name and every attribute you put in a spec must come
from a tool call in this session — never from memory.** If a name "sounds right"
for the kind of object, that feeling is not evidence; it is the exact signal to
call `lookup_object` / `list_attributes` before writing it.

This is enforced, not advisory. `spec2maxpat.py convert` runs the same checker as
the `verify_spec` tool and **refuses to build** when it finds an object name that
doesn't resolve (C74 refpage / installed package / abstraction on disk) or a
`live.*` attribute that doesn't exist. A guess no longer ships silently — it
stops the build with an error naming what to fix. Two consequences:

1. Resolve first, write second. Call `verify_spec(spec_json)` before `convert`
   to see and fix everything while you still hold the spec.
2. If `convert` blocks you, the fix is to resolve the name (`lookup_object`) or
   correct it — not to reach for `--allow-unverified`. Override only for a real
   abstraction you've confirmed exists, and prefer marking that object
   `"unverified": true` in the spec so the assertion is explicit and auditable.

**Max's core failure mode is silent acceptance.** Unknown attributes, made-up
object names, wrong inlet indices — all accepted without error, no warning.
The patch loads and appears to work, then silently misbehaves. The gate above
exists to turn that silent, out-of-session failure into a loud, in-session one.

---

## Before writing any object name (`newobj` text field)

Call `lookup_object(name)` — it queries C74 refpages and the 2,795-object
package library authoritatively.  Do NOT write an object name until
`lookup_object` confirms it exists.

**Canonical example of silent failure**: `oscparse` — not in Max 9, accepted as
a missing-object red box. OSC address-routing requires `o.route` from CNMAT
Externals. `lookup_object("oscparse")` returns `found: false`; the right call
is `lookup_object("o.route")` which resolves via the package library.

---

## Before writing any attribute on an object

Call `list_attributes(object_name)` or `lookup_attribute(object_name, attr)`.
Max silently accepts unknown attributes and ignores them — there is no error.

**Also check creation args.** Some objects use creation args for what sounds like
attributes — and those "attributes" don't exist, so writing them silently does nothing:
- `counter 0 3` — min/max range is a **creation arg**, NOT `@min`/`@max` (neither exists)
- `makenote 100 250` — velocity and duration are **creation args**, not attributes
- `metro 500` — interval is a creation arg (also settable via right inlet at runtime)
If `list_attributes` returns 0 or very few attrs, look at the `creation args` field in
`lookup_object` — that's where the configurable values live.

`live.gain~` example — VALID color attrs:
  `coldcolor warmcolor hotcolor overloadcolor slidercolor textcolor tricolor
   trioncolor tribordercolor focusbordercolor modulationcolor
   inactivecoldcolor inactivewarmcolor`
NOT valid (silently accepted, do nothing): `bgcolor peakcolor knobcolor needlecolor`

---

## Binding rules

### Presentation view — required for any patch with UI
- `openinpresentation: 1` at the patcher root
- `presentation: 1` on every operator-visible object
- `presentation_rect: [x, y, w, h]` on each (explicit, independent of patching position)
- Comment label adjacent to every visible control
- Internal logic objects (`route`, `prepend`, `print`, hidden message boxes) stay OUT of presentation
- Exempt: utility subpatchers with no operator surface; pure-DSP patches with no UI

### Hide plumbing patchcords
Cords that only move data without communicating to readers must have `hidden: 1`:
- Formatter cords on `prepend`, `sprintf`, `pack/unpack`, message-box reformatters
- Cords to display-only elements (`comment` as readout, `jit.cellblock`, `jit.pwindow`)
- Any cord touching a hidden box → must also be hidden

### Hide redundant message boxes
A message box that only reformats upstream UI output must have `hidden: 1` (and both cords):
- `[number] → [setport $1] → [node.script]`: the message box is plumbing — hide it.
- Test: "Remove the box mentally. Does the operator still have a way to invoke the action?"
  If YES → hide it. If NO → keep it visible.

### textedit is NOT for set-once configuration
`textedit` has two fatal flaws for config values (URLs, identifiers, API keys):
1. Output fires on Enter only, not on patch load → stale state after reopen
2. Bang emits `text <content>` (multi-element list) not bare content → data corruption
   downstream (e.g., `setcloudurl text wss://…` instead of `setcloudurl wss://…`)
Use instead:
- Hardcode in upstream source code (server.js, v8 script) — preferred for truly fixed values
- `dialog` — bang to prompt; emits a clean symbol with no prefix
- `umenu` — for a small finite set of choices
- `pattr` + `autopattr @autorestore 1` — for values that need persistence + per-patch override
`textedit` IS correct for free-form text the user types repeatedly during a show.

### Never render an empty container when server-driven state hasn't arrived
Distinguish three states: (1) haven't received state yet, (2) state received but empty,
(3) state received with content. Rendering an empty div for cases 1 and 2 is
indistinguishable from "this app is broken." Each not-yet state must surface a
visible placeholder naming which not-yet it is.

### Modify, don't rebuild
When making a new version of an existing patch:
- Default workflow: `sync → extract → edit spec → convert`
- Rebuilding from scratch silently drops: alignment offsets, init defaults, wiring,
  naming conventions, tutorial systems, every micro-decision from prior sessions
- Rebuild only when <50% of structure is shared with the original
- Any pattern noted as "what's working" in prior critique is binding — praise without
  applying is the named failure mode

### Sync before any edit
Run `python3 spec2maxpat.py sync -i <patch>` before ANY edit to a .maxpat.
`convert` regenerates from scratch and destroys manual edits not captured in the spec.

### Spec embedding — required in every .maxpat
Include a hidden `text.codebox` (`id: "obj-spec-embed"`, `hidden: 1`) with the
full spec JSON wrapped in `--- CLAUDE2MAX SPEC ---` / `--- END SPEC ---` delimiters.

---

## Preferred objects (key entries)

| Task | Default | Avoid |
|---|---|---|
| Audio I/O | `ezadc~` / `ezdac~` (toggle-style) | `adc~` / `dac~` |
| Sound file playback | `playlist~` (multi-file, crossfades) | rolling `sfplay~` + bank logic |
| JS / scripting | `v8` (ES6+, faster) | `js` (use only for existing patches) |
| Text input — config | `dialog` (bang → modal → clean symbol) | `textedit` |
| Text input — live | `textedit` | `dialog` |
| List manipulation | `v8` JavaScript (one line) | long `zl`/`pak`/`unpack` chains |
| Range mapping | `scale` | `expr` |
| Sequencer / clock | `metro` (send `1` to start, `0` to stop) | |
| Multi-column display | `jit.cellblock` (`cell <col> <row> set <val>`) | |
| OSC routing | `udpreceive` + `o.route` (CNMAT odot) | `oscparse` (doesn't exist) |
| Reverb | `bp.Gigaverb` (BEAP, ships with Max) | |
| Variable delay | `tapin~` / `tapout~` | `delay~` |

**Before composing any chain of 3+ native objects**, call:
`search_packages(term)` — the 2,795-object library often covers the whole chain in one external.

---

## Naming convention

ALL CAPS for all user-defined names:
- send/receive: `send TEMPO`, `receive PITCH`
- pv/v variables: `pv CURRENT_STATE`
- buffer~/coll names: `buffer~ LOOPBUF`
- JS variables: `var STEP_COUNT = 0`
Does NOT apply to Max built-in names, object class names, or message selectors.

---

## Never regress functionality

When moving a working feature to a different modality (different UI object,
different display, different data path):
- Inventory every piece of information in the current format
- Confirm ALL of it is present in the new one
- A change of modality is not a reason to lose capability

---

## What to call next

- `lookup_object(name)` — before adding any `newobj` to a patch
- `search_packages(term)` — before composing a 3+ native-object chain
- `lookup_attribute(object_name, attr)` — before writing any attribute (Step 4)
- `list_attributes(object_name)` — to see all valid attrs for an object (Step 4)
"""


@mcp.tool()
def essentials() -> str:
    """
    Backward-compatible alias for load(["core"]).

    Prefer the assess() → load() two-call pattern for new work.
    This alias exists so any PROJECT_CLAUDE_SNIPPET that calls essentials()
    still works without change.
    """
    return load(["core"])


# ── module routing — Claude evaluates task intent ─────────────────────────────
# Non-core modules Claude may select. "core" is always loaded by us, so the
# model never has to ask for it.
_SELECTABLE_DOMAINS = [d for d in _DOMAIN_DESCRIPTIONS if d != "core"]

# Model used for every LLM-assisted tool (assess routing, did-you-mean,
# semantic package search). Parameterized so a deployment can point it at a
# different tier without editing code. Haiku is the default — these are fast,
# cheap classification/ranking tasks, not reasoning-heavy ones.
# CLAUDE2MAX_ASSESS_MODEL is still honored for backward compatibility.
_LLM_MODEL = os.environ.get(
    "CLAUDE2MAX_LLM_MODEL",
    os.environ.get("CLAUDE2MAX_ASSESS_MODEL", "claude-haiku-4-5"),
)


def _llm_json(system: str, user: str, max_tokens: int = 1024) -> dict:
    """
    Shared one-shot LLM call returning parsed JSON.

    Used by every LLM-assisted tool (assess, lookup_object did-you-mean,
    search_packages semantic). Raises on any failure (missing key, network,
    parse) so each caller can fall back to its deterministic path. Requires
    ANTHROPIC_API_KEY in the server environment.
    """
    import anthropic  # lazy — server still starts if the package is absent

    client = anthropic.Anthropic()  # reads ANTHROPIC_API_KEY from the environment
    resp = client.messages.create(
        model=_LLM_MODEL,
        max_tokens=max_tokens,
        system=system,
        messages=[{"role": "user", "content": user}],
    )
    text = "".join(b.text for b in resp.content
                   if getattr(b, "type", "") == "text").strip()
    # Tolerate a stray markdown fence even though we ask for none.
    if text.startswith("```"):
        text = text.strip("`")
        text = text[text.find("{"):text.rfind("}") + 1]
    return json.loads(text)


def _assess_system_prompt() -> str:
    """Build the classifier system prompt from the live module catalog."""
    catalog = "\n".join(f"- {d}: {desc}" for d, desc in _DOMAIN_DESCRIPTIONS.items()
                        if d != "core")
    return (
        "You route a Max/MSP task description to the knowledge modules it needs.\n"
        "Decide by the task's INTENT, not by keyword matching — a task that says\n"
        "\"granulate a recorded sound\" needs the audio (msp) module even though it\n"
        "names no `~` objects; a task about \"webcam visuals\" needs jitter even\n"
        "though it never types `jit.`.\n\n"
        "Selectable modules (the `core` module is always loaded, never select it):\n"
        f"{catalog}\n\n"
        "Select a module only when the task genuinely requires that body of\n"
        "knowledge. Many tasks need none (return an empty selections list) — for\n"
        "those, core alone is correct. When unsure whether a domain is truly\n"
        "needed, leave it out; the caller can re-run assess() if scope grows.\n"
        "Respond with ONLY a JSON object of the form:\n"
        '{\"selections\": [{\"domain\": \"<one of the selectable modules>\", '
        '\"why\": \"<short reason tied to the task>\"}]}\n'
        "No prose, no markdown fences — JSON only."
    )


def _llm_assess(task_description: str) -> tuple[list[str], dict[str, str]]:
    """
    Ask Claude which non-core modules the task needs.

    Returns (domains, reasoning) with "core" always first. Raises on any
    failure (missing key, network, parse, no valid selections) so the caller
    can fall back to keyword matching.
    """
    data = _llm_json(_assess_system_prompt(), task_description)

    domains = ["core"]
    reasoning: dict[str, str] = {
        "core": "always loaded — binding rules, Common Pitfalls, preferred objects",
    }
    for sel in data.get("selections", []):
        dom = sel.get("domain")
        if dom in _SELECTABLE_DOMAINS and dom not in domains:   # validate — drop anything unknown
            domains.append(dom)
            reasoning[dom] = sel.get("why", "selected by intent analysis")
    return domains, reasoning


def _keyword_assess(task_description: str) -> tuple[list[str], dict[str, str]]:
    """Substring-keyword fallback used when the LLM path is unavailable."""
    desc = task_description.lower()
    domains = ["core"]
    reasoning: dict[str, str] = {
        "core": "always loaded — binding rules, Common Pitfalls, preferred objects",
    }
    for domain, keywords in _DOMAIN_KEYWORDS.items():
        matched = [kw for kw in keywords if kw in desc]
        if matched:
            domains.append(domain)
            reasoning[domain] = f"matched: {', '.join(matched)}"
    return domains, reasoning


@mcp.tool()
def assess(task_description: str) -> dict:
    """
    Evaluate which knowledge modules are needed for a Max/MSP task.

    Call this at the start of any Max session, then pass the returned
    domains list directly to load(). Two-call pattern:

        modules = assess("build a step sequencer with audio output")
        knowledge = load(modules["domains"])

    The routing is done by Claude reading the task's INTENT — not by matching
    literal words in the description — so plain-English descriptions route
    correctly even when they name no Max objects ("granulate a recorded sound"
    → core + msp). Requires ANTHROPIC_API_KEY in the server's environment; if
    it is unavailable the tool falls back to substring-keyword matching and
    reports `method: "keyword-fallback"`.

    If the task evolves mid-session (e.g. Jitter appears in a patch that
    started as audio-only), call assess() again with the new context and
    load() the additional domains — modules accumulate, they don't reset.

    Parameters
    ----------
    task_description — plain-English description of what will be built or edited.

    Return keys
    -----------
    domains       — list[str] — recommended modules to load (always includes "core")
    reasoning     — dict[str, str] — why each domain was selected
    method        — "llm" (intent analysis) | "keyword-fallback" (no API key / API error)
    next_step     — str — the load() call to make next
    available     — dict[str, str] — all available modules with descriptions
    """
    try:
        domains, reasoning = _llm_assess(task_description)
        method = "llm"
    except Exception as exc:   # missing key, network, parse — degrade, never hard-fail
        domains, reasoning = _keyword_assess(task_description)
        method = "keyword-fallback"
        reasoning["_fallback"] = f"LLM routing unavailable ({type(exc).__name__}); used keyword matching."

    return {
        "domains":   domains,
        "reasoning": reasoning,
        "method":    method,
        "next_step": f"Call load({domains!r}) to load these knowledge modules.",
        "available": _DOMAIN_DESCRIPTIONS,
    }


@mcp.tool()
def load(domains: list) -> str:
    """
    Load Max/MSP knowledge modules into context.

    This is the primary knowledge-acquisition call. Call assess() first to
    determine which domains to request, then call this. The returned text
    is the knowledge Claude uses for the session — front-loaded before any
    patch work begins.

    Modules are additive: calling load() again with new domains adds to
    what is already in context. Call it again whenever the task scope grows
    to include a new domain (Jitter, gen~, M4L, networking, etc.).

    Parameters
    ----------
    domains — list of domain names. "core" is always included even if omitted.
              Available: "core", "gen", "jitter", "m4l", "networking", "msp", "spec"

    Returns
    -------
    Assembled markdown covering all requested modules, ready to be read as
    working knowledge for the session.
    """
    # Normalise — always include core, deduplicate, preserve order.
    seen: set[str] = set()
    ordered: list[str] = []
    for d in (["core"] + list(domains)):
        if d not in seen:
            seen.add(d)
            ordered.append(d)

    sections: list[str] = []

    for domain in ordered:
        if domain == "core":
            # Core = binding rules + re-evaluation signal + Common Pitfalls.
            mp_text = _read_md(_PATCHING_DIR / "MAX_PATCHING.md")
            pitfalls = _extract_section(mp_text, "## Common Pitfalls")
            sections.append(
                f"# Claude2Max — Core Module\n\n"
                f"{_ESSENTIALS_MD}\n\n"
                f"---\n\n"
                f"{_RE_EVAL_BLOCK}\n\n"
                f"---\n\n"
                f"{pitfalls}"
            )
        else:
            desc = _DOMAIN_DESCRIPTIONS.get(domain, domain)
            content = _build_module(domain)
            sections.append(f"# Claude2Max — {domain.upper()} Module\n_{desc}_\n\n{content}")

    loaded_list = ", ".join(ordered)
    header = (
        f"<!-- Claude2Max knowledge loaded: {loaded_list} -->\n"
        f"<!-- If the task evolves to include additional domains, call load([new_domain]) -->\n\n"
    )
    return header + "\n\n---\n\n".join(sections)


# ---------------------------------------------------------------------------
# did-you-mean — LLM suggestion for a name that wasn't found, validated
# against the real index so only objects that actually exist are returned.
# ---------------------------------------------------------------------------

import difflib  # noqa: E402 — used only by the did-you-mean path

_all_names_cache: list | None = None


def _all_object_names() -> list:
    """
    Every known Max object name: C74 built-ins (std-domain refpage stems) +
    installed package externals. Cached. Grounds did-you-mean candidates in
    objects that actually exist, so a typo can be matched by string similarity.
    """
    global _all_names_cache
    if _all_names_cache is None:
        names = set(_pkg_idx().keys())
        c74 = getattr(_refpage, "_c74", None)
        if c74 is not None:
            for domain in RefpageCache._STD_DOMAINS:
                d = c74 / "docs/refpages" / domain
                if d.exists():
                    for p in d.glob("*.maxref.xml"):
                        names.add(p.name[:-len(".maxref.xml")])
        _all_names_cache = sorted(names)
    return _all_names_cache


def _suggest_objects(bad_name: str, k: int = 3) -> list:
    """
    LLM did-you-mean for a name that wasn't found.

    Covers two failure classes: a typo / near-miss (fixed against the
    string-similar pool) and a wrong-name-for-the-concept (the invented name
    describes what a real object actually does). GUARDRAIL: every suggestion
    is re-checked against the real index — names that don't resolve are
    dropped, so the returned list contains ONLY objects that exist. Raises on
    LLM failure so the caller can degrade to no suggestions.
    """
    pool = difflib.get_close_matches(bad_name, _all_object_names(), n=10, cutoff=0.5)
    system = (
        "A Max/MSP user tried to use an object name that does NOT exist in Max.\n"
        "Suggest the real Max objects they most likely meant. Consider two cases:\n"
        "1. Typo / near-miss — correct the spelling to a real object.\n"
        "2. Wrong name for the concept — the invented name describes what an\n"
        "   existing object (built-in or common package external) actually does\n"
        "   (e.g. someone writes `oscparse` meaning OSC address routing, which is\n"
        "   `o.route` from CNMAT, or native `udpreceive` + `route`).\n"
        "Only suggest objects you are confident exist in Max; prefer built-ins and\n"
        "well-known package externals. Return ONLY JSON of the form\n"
        '{"suggestions": [{"name": "<real object>", "why": "<short reason>"}]}.\n'
        "No prose, no markdown fences."
    )
    user = f"Invented name: {bad_name}\n"
    if pool:
        user += "String-similar real object names (possible typo targets): " \
                + ", ".join(pool) + "\n"
    user += "Suggest the most likely real objects."
    data = _llm_json(system, user, max_tokens=512)

    out, seen = [], set()
    for s in data.get("suggestions", []):
        nm = (s.get("name") or "").strip()
        if not nm or nm in seen:
            continue
        # GUARDRAIL — keep only names that actually resolve in the real index.
        if _refpage.lookup(nm) is not None or nm in _pkg_idx():
            out.append({"name": nm, "why": s.get("why", "")})
            seen.add(nm)
        if len(out) >= k:
            break
    return out


# ---------------------------------------------------------------------------
# lookup_object() — Step 3.
# ---------------------------------------------------------------------------

@mcp.tool()
def lookup_object(name: str) -> dict:
    """
    Call this before adding any `newobj` to a Max patch.

    Returns authoritative existence, I/O signature, digest, and use_when
    guidance for the named object.  Queries C74 refpages first (built-in
    Max objects), then the 2,795-object Claude2Max package library
    (installed externals).

    Skipping this call is how you get silent-failure patches: Max accepts
    any name, displays missing-object red boxes only after the patch is
    open, and that's easy to miss in a 100-box patch.

    Return keys
    -----------
    found        — bool. False means the object does not exist as named.
    source       — "c74-refpage" | "package" | "unknown"
    numinlets    — int (0 when unknown)
    numoutlets   — int (0 when unknown)
    outlettype   — list[str] — per-outlet type ("signal", "multichannelsignal", or "")
    digest       — str — one-line description from refpage / package library
    use_when     — str — curated guidance on when and how to use this object
    deprecated_by — str — non-empty when the object is deprecated in favour of another
    summary      — str — human-readable formatted block (paste into reasoning)

    Smoke test cases
    ----------------
    lookup_object("metro")       → found=True, source="c74-refpage"
    lookup_object("oscparse")    → found=False, source="unknown"
    lookup_object("cv.jit.faces") → found=True, source="package"
    """
    name = name.strip()

    # 1 — C74 refpage (built-in Max objects, C74 packages in the app bundle)
    c74 = _refpage.lookup(name)
    if c74 is not None:
        summary_lines = [
            f"FOUND in C74 refpages: {name}",
            f"  {c74['digest']}" if c74["digest"] else "",
            f"  inlets={c74['numinlets']}  outlets={c74['numoutlets']}",
        ]
        if c74["outlettype"]:
            summary_lines.append(f"  outlet types: {c74['outlettype']}")
        if c74["arguments"]:
            args = ", ".join(
                f"{a['name']}({'opt' if a['optional'] else 'req'}, {a['type']})"
                for a in c74["arguments"]
            )
            summary_lines.append(f"  creation args: {args}")
        if c74["seealso"]:
            summary_lines.append(f"  see also: {', '.join(c74['seealso'])}")
        return {
            "found": True,
            "source": "c74-refpage",
            "numinlets": c74["numinlets"],
            "numoutlets": c74["numoutlets"],
            "outlettype": c74["outlettype"],
            "digest": c74["digest"],
            "use_when": "",
            "deprecated_by": "",
            "summary": "\n".join(l for l in summary_lines if l),
        }

    # 2 — Package library (installed externals)
    idx = _pkg_idx()
    if name in idx:
        pkg_name, rec = idx[name]
        digest       = rec.get("digest", "") or ""
        use_when     = rec.get("use_when", "") or ""
        deprecated_by = rec.get("deprecated_by", "") or ""
        numinlets    = rec.get("numinlets", 0)
        numoutlets   = rec.get("numoutlets", 0)
        outlettype   = rec.get("outlettype", [])
        summary_lines = [
            f"FOUND in package library: {name}  (package: {pkg_name})",
        ]
        if deprecated_by:
            summary_lines.append(f"  DEPRECATED — use {deprecated_by} instead")
        if digest:
            summary_lines.append(f"  {digest}")
        summary_lines.append(f"  inlets={numinlets}  outlets={numoutlets}")
        if outlettype:
            summary_lines.append(f"  outlet types: {outlettype}")
        if use_when:
            summary_lines.append(f"  use_when: {use_when}")
        return {
            "found": True,
            "source": "package",
            "numinlets": numinlets,
            "numoutlets": numoutlets,
            "outlettype": outlettype,
            "digest": digest,
            "use_when": use_when,
            "deprecated_by": deprecated_by,
            "summary": "\n".join(summary_lines),
        }

    # 3 — Not found. Offer LLM did-you-mean suggestions (each validated to be a
    # real object). This is the canonical correction moment: a guessed name
    # missed, and the most useful next thing is the real object that was meant.
    try:
        did_you_mean = _suggest_objects(name)
    except Exception:   # no API key, network, parse — degrade to no suggestions
        did_you_mean = []

    summary = (
        f"NOT FOUND: '{name}' does not appear in C74 refpages or the "
        f"package library. Do NOT write this name into a patch. "
        f"Max will accept it silently and display a red missing-object box."
    )
    if did_you_mean:
        sugg = "; ".join(f"{s['name']} ({s['why']})" if s['why'] else s['name']
                         for s in did_you_mean)
        summary += f"\n  Did you mean: {sugg}"

    return {
        "found": False,
        "source": "unknown",
        "numinlets": 0,
        "numoutlets": 0,
        "outlettype": [],
        "digest": "",
        "use_when": "",
        "deprecated_by": "",
        "did_you_mean": did_you_mean,   # [] when no key / no confident suggestion
        "summary": summary,
    }


# ---------------------------------------------------------------------------
# search_packages() — Step 3, with LLM semantic search (expansion + rerank).
# ---------------------------------------------------------------------------

_RELEVANCE_LABEL = {3: "use_when", 2: "digest", 1: "name"}


def _substring_matches(terms: list, cap: int = 0) -> list:
    """
    Scan the package library for any of `terms` (case-insensitive substring).

    Returns candidate dicts {name, package, digest, use_when, score} where
    score = best field hit across all terms (use_when 3 > digest 2 > name 1),
    deduped by object name (first wins), sorted by score then name. `cap`
    bounds the result count (0 = no cap). This is the deterministic core used
    both as the LLM path's candidate gatherer and as the no-key fallback.
    """
    lowered = [t.lower().strip() for t in terms if t and t.strip()]
    by_name: dict = {}
    for pkg, objs in _pkg_raw().items():
        for name, rec in objs.items():
            digest   = rec.get("digest", "") or ""
            use_when = rec.get("use_when", "") or ""
            score = 0
            for t in lowered:
                if t in use_when.lower():
                    score = max(score, 3)
                elif t in digest.lower():
                    score = max(score, 2)
                elif t in name.lower():
                    score = max(score, 1)
            if score and name not in by_name:
                by_name[name] = {
                    "name": name, "package": pkg, "digest": digest,
                    "use_when": use_when, "score": score,
                }
    out = sorted(by_name.values(), key=lambda m: (-m["score"], m["name"]))
    return out[:cap] if cap and cap > 0 else out


def _expand_terms(term: str) -> list:
    """LLM query expansion: term → related Max-domain search terms. Raises on failure."""
    system = (
        "Expand a Max/MSP package-search query into related search terms so a "
        "substring search finds objects that don't contain the literal query "
        "words. Include synonyms, the technique's formal name, and common Max "
        "phrasings. Example: \"convolution reverb\" → impulse response, IR, "
        "convolution, reverberation. Return ONLY JSON: "
        '{"terms": ["...", "..."]}. 4-8 short terms, no prose, no markdown.'
    )
    data = _llm_json(system, term, max_tokens=256)
    return [t for t in data.get("terms", []) if isinstance(t, str) and t.strip()]


def _rerank_packages(term: str, candidates: list, k: int) -> list:
    """
    LLM rerank candidates by intent fit for `term`.

    GUARDRAIL: returns only candidate dicts whose name the model selected and
    that exist in the candidate set — the model reorders, it never invents
    names. Raises on failure so the caller can fall back to substring order.
    """
    by_name = {c["name"]: c for c in candidates}
    listing = "\n".join(
        f"- {c['name']}: {(c['digest'] or '')[:120]}"
        f"{' | use_when: ' + c['use_when'][:200] if c['use_when'] else ''}"
        for c in candidates
    )
    system = (
        "Rank Max/MSP package objects by how well each fits the user's need. "
        "Choose only from the provided list; do not invent names. Order best "
        "fit first; omit poor fits. Return ONLY JSON: "
        '{"ranked": [{"name": "<exact name from the list>", "why": "<short>"}]}. '
        "No prose, no markdown."
    )
    user = f"Need: {term}\n\nCandidates:\n{listing}"
    data = _llm_json(system, user, max_tokens=1024)

    out, seen = [], set()
    for r in data.get("ranked", []):
        nm = (r.get("name") or "").strip()
        if nm in by_name and nm not in seen:   # GUARDRAIL — must be a real candidate
            c = dict(by_name[nm])
            c["why"] = r.get("why", "")
            out.append(c)
            seen.add(nm)
        if k and len(out) >= k:
            break
    return out


def _fmt_results(cands: list, relevance: str) -> list:
    """Shape candidate dicts into the public result schema."""
    results = []
    for c in cands:
        results.append({
            "name":      c["name"],
            "package":   c["package"],
            "digest":    c["digest"],
            "use_when":  c["use_when"],
            "relevance": relevance if relevance else _RELEVANCE_LABEL.get(c.get("score", 0), ""),
            **({"why": c["why"]} if c.get("why") else {}),
        })
    return results


@mcp.tool()
def search_packages(term: str, limit: int = 5) -> dict:
    """
    Search the Claude2Max package library (2,795 installed externals) by intent.

    Call this before composing any chain of 3+ native Max objects — there is
    often a single package external that covers the whole chain.

    When ANTHROPIC_API_KEY is set, the search is semantic: Claude expands the
    query into related terms (so "convolution reverb" finds an object whose
    description says "impulse-response reverberation"), then reranks the
    candidates by intent. Without a key it falls back to plain substring
    scoring (use_when > digest > name) and reports `method: "substring"`.
    Either way, every result is a real library record — the LLM only expands
    and reorders, it never invents object names.

    Parameters
    ----------
    term  — what you need, in plain language
    limit — max results to return (default 5; pass 0 for no cap)

    Return
    ------
    Dict with:
      results  — list of {name, package, digest, use_when, relevance, why?}
      count    — int — number of results returned
      method   — "llm-semantic" | "substring"
      message  — str — human-readable summary (always present, incl. no-match)
    """
    k = limit if (limit and limit > 0) else 0

    # ── semantic path ────────────────────────────────────────────────────────
    try:
        expanded = _expand_terms(term)
        # Seed with literal full-query matches FIRST so the obvious answer
        # (e.g. hirt.convolutionreverb~ for "convolution reverb") always
        # survives the cap, then fill with semantic-expansion matches.
        primary = _substring_matches([term])
        seen = {c["name"] for c in primary}
        extra = [c for c in _substring_matches(expanded) if c["name"] not in seen]
        candidates = (primary + extra)[:40]   # bound the rerank prompt
        terms = [term] + expanded
        if candidates:
            ranked = _rerank_packages(term, candidates, k)
            if ranked:
                return {
                    "results": _fmt_results(ranked, "semantic"),
                    "count":   len(ranked),
                    "method":  "llm-semantic",
                    "message": f"{len(ranked)} result(s) for '{term}' "
                               f"(semantic; expanded terms: {', '.join(terms[1:]) or 'none'}).",
                }
        # expansion succeeded but found nothing → fall through to substring/no-match
    except Exception:
        pass   # no key, network, parse — degrade to substring scoring below

    # ── substring fallback (also the no-API-key path) ─────────────────────────
    matches = _substring_matches([term], cap=k)
    if not matches:
        return {
            "results": [],
            "count": 0,
            "method": "substring",
            "message": (
                f"No packages matched '{term}'. "
                f"Try a shorter or broader term (e.g. 'reverb' instead of "
                f"'convolution reverb with IR'), or build with native Max objects."
            ),
        }
    return {
        "results": _fmt_results(matches, ""),
        "count":   len(matches),
        "method":  "substring",
        "message": f"{len(matches)} result(s) for '{term}'.",
    }


# ---------------------------------------------------------------------------
# lookup_attribute() + list_attributes() — Step 4.
# ---------------------------------------------------------------------------

def _attrs_for(object_name: str) -> tuple[dict | None, str]:
    """
    Return (attributes_dict, source_label) for object_name.
    attributes_dict is None when the object has no refpage (can't verify).
    source_label: "c74-refpage" | "no-refpage".
    """
    c74 = _refpage.lookup(object_name)
    if c74 is not None:
        return c74["attributes"], "c74-refpage"
    return None, "no-refpage"


@mcp.tool()
def lookup_attribute(object_name: str, attr: str) -> dict:
    """
    Call this before writing any attribute on a Max object.

    Returns whether the named attribute is valid for this object, its type,
    default value, and any enumerated valid values.  Max silently accepts
    unknown attributes and ignores them — there is no error message.

    The recognition signal: if an attribute name 'sounds right' for this kind
    of object, that is the exact moment this call is non-optional.

    Parameters
    ----------
    object_name  — the Max object class (e.g. "live.gain~", "metro", "jit.matrix")
    attr         — the attribute name to check (e.g. "bgcolor", "coldcolor")

    Return keys
    -----------
    valid           — bool. False means the attribute does NOT exist on this object.
    value_type      — str — declared type ("int", "float", "symbol", "list", etc.)
    size            — int or str — number of values (may be "variable")
    default         — str — default value as declared in the refpage
    readable        — bool — can be queried with `getattr`
    writable        — bool — can be set with `@attr` or `setattr`
    inspector_label — str — how the attribute appears in Max's Inspector UI
    valid_values    — list[str] — always [] in v1 (Max refpages don't embed enum
                      values in XML; `enumvals` fields are present but null)
    source          — "c74-refpage" | "no-refpage"
    summary         — str — human-readable result block

    Smoke tests
    -----------
    lookup_attribute("live.gain~", "bgcolor")   → valid=False
    lookup_attribute("live.gain~", "coldcolor") → valid=True
    """
    object_name = object_name.strip()
    attr        = attr.strip()

    attrs, source = _attrs_for(object_name)

    if attrs is None:
        # Object has no C74 refpage — can't verify attributes
        # (Check whether the object exists at all for a better error message.)
        obj_found = _refpage.lookup(object_name) is not None or object_name in _pkg_idx()
        if obj_found:
            msg = (
                f"CANNOT VERIFY: '{object_name}' is a known package external "
                f"but has no C74 refpage, so attribute names cannot be "
                f"checked programmatically. Consult the package documentation "
                f"before writing any attribute."
            )
        else:
            msg = (
                f"OBJECT NOT FOUND: '{object_name}' is not in C74 refpages "
                f"or the package library. Resolve the object name first with "
                f"lookup_object() before checking attributes."
            )
        return {
            "valid":           False,
            "value_type":      "",
            "size":            0,
            "default":         "",
            "readable":        False,
            "writable":        False,
            "inspector_label": "",
            "valid_values":    [],
            "source":          source,
            "summary":         msg,
        }

    entry = attrs.get(attr)
    if entry is None:
        return {
            "valid":           False,
            "value_type":      "",
            "size":            0,
            "default":         "",
            "readable":        False,
            "writable":        False,
            "inspector_label": "",
            "valid_values":    [],
            "source":          source,
            "summary": (
                f"INVALID: '{attr}' is NOT a valid attribute of '{object_name}'. "
                f"Max will silently accept and ignore it. "
                f"Call list_attributes('{object_name}') to see all valid attrs."
            ),
        }

    inspector_label = entry.get("label", "") or ""
    size = entry["size"]
    summary_lines = [
        f"VALID: {object_name} @{attr}",
        f"  type={entry['type']}  size={size}  default={entry['default']!r}",
        f"  readable={entry['get']}  writable={entry['set']}",
    ]
    if inspector_label:
        summary_lines.append(f"  inspector label: {inspector_label}")
    return {
        "valid":           True,
        "value_type":      entry["type"],
        "size":            size,
        "default":         entry["default"],
        "readable":        entry["get"],
        "writable":        entry["set"],
        "inspector_label": inspector_label,
        "valid_values":    [],
        "source":          source,
        "summary":         "\n".join(summary_lines),
    }


@mcp.tool()
def list_attributes(object_name: str) -> dict:
    """
    Return all valid attributes for a Max object, sorted alphabetically.

    Use this when writing multiple attributes at once — verify the full set
    up front rather than discovering invalid names one at a time.

    Parameters
    ----------
    object_name — the Max object class (e.g. "live.gain~", "button", "jit.matrix")

    Return keys
    -----------
    found        — bool. False if the object has no refpage (attributes unknown).
    source       — "c74-refpage" | "no-refpage"
    count        — int — number of valid attributes
    attributes   — list[str] — attribute names, alphabetically sorted
    writable     — list[str] — subset that are writable (settable)
    summary      — str — formatted block for easy pasting into reasoning

    Smoke tests
    -----------
    list_attributes("live.gain~")  → includes "coldcolor", NOT "bgcolor"
    list_attributes("metro")       → includes "active", "interval"
    """
    object_name = object_name.strip()
    attrs, source = _attrs_for(object_name)

    if attrs is None:
        obj_found = _refpage.lookup(object_name) is not None or object_name in _pkg_idx()
        if obj_found:
            msg = (
                f"CANNOT LIST: '{object_name}' is a known package external "
                f"but has no C74 refpage. Attribute list unavailable."
            )
        else:
            msg = (
                f"OBJECT NOT FOUND: '{object_name}'. Resolve with lookup_object() first."
            )
        return {
            "found":      False,
            "source":     source,
            "count":      0,
            "attributes": [],
            "writable":   [],
            "summary":    msg,
        }

    all_attrs    = sorted(attrs.keys())
    writable     = sorted(n for n, e in attrs.items() if e["set"])
    summary      = (
        f"{object_name}: {len(all_attrs)} attributes ({source})\n"
        f"  all:      {', '.join(all_attrs)}\n"
        f"  writable: {', '.join(writable)}"
    )
    return {
        "found":      True,
        "source":     source,
        "count":      len(all_attrs),
        "attributes": all_attrs,
        "writable":   writable,
        "summary":    summary,
    }


# ---------------------------------------------------------------------------
# verify_spec() — static binding-rule checker (the safety net)
# ---------------------------------------------------------------------------

@mcp.tool()
def verify_spec(spec_json: str) -> dict:
    """
    Statically check a Claude2Max spec against the binding rules BEFORE converting.

    This is the safety net, not the primary knowledge mechanism — load() front-
    loads the rules so you build correctly; verify_spec() catches what slipped
    through. Run it on your spec JSON right before `spec2maxpat.py convert`. The
    same checks also run automatically at convert time (shared rule library), so
    this tool lets you see and fix violations while you still have the spec in
    hand.

    What it catches (by severity):
      error   — will break the patch or the converter: connection referencing a
                non-existent object, malformed connection shape, outlet/inlet
                index past a declared count.
      warning — binding-rule violations: no presentation view despite UI
                controls, presented controls with no labels, visible cords
                touching hidden boxes, redundant (unhidden) formatter message
                boxes, unlabelled subpatcher inlets/outlets, untracked debug
                scaffolding.
      style   — convention nudges: non-ALL-CAPS user names, [js] instead of [v8].

    Parameters
    ----------
    spec_json — the spec as a JSON string (the same JSON you pass to convert).

    Return keys
    -----------
    ok          — bool. True iff zero errors AND zero warnings.
    counts      — {"error": n, "warning": n, "style": n}
    violations  — list of {rule, severity, location, message, source}
    summary     — one-line headline
    report      — pre-formatted multi-line text block (paste into reasoning)

    Smoke tests
    -----------
    verify_spec('{"objects":{"a":{"type":"toggle"}},"connections":[]}')
        → warning: presentation-required (UI control, no presentation view)
    verify_spec('{"objects":{},"connections":[]}')  → ok: true
    verify_spec('{"objects":{"x":{"type":"newobj","text":"oscparse"}},"connections":[]}')
        → error: object-unresolved ('oscparse' is not a real Max object)
    """
    resolver = _build_resolver()  # authoritative: refpages + package library
    result = _verify_spec_json(spec_json, resolver=resolver)
    result["report"] = _verify_report(result)
    return result


# ---------------------------------------------------------------------------
# search_pitfalls() + lookup_rule() — knowledge-corpus search.
#
# Both are deterministic substring/token searches over curated repo docs. No
# LLM call: unlike assess()/search_packages (fuzzy intent matching over open
# vocabulary), these search a small, hand-written corpus where exact and token
# matches are reliable — and keeping them deterministic means zero per-call
# cost and no dependency on the API key.
# ---------------------------------------------------------------------------

# Docs that carry named binding rules as `## ` headers.
_RULE_DOCS: list[Path] = [
    _REPO_ROOT / "CLAUDE.md",
    _REPO_ROOT / "SPEC_REFERENCE.md",
    _PATCHING_DIR / "MAX_PATCHING.md",
]

# Pitfall / insight corpora: the Common Pitfalls bullet list plus the two
# community-knowledge insight files.
_PITFALL_FORUM = _REPO_ROOT / "c74-forum" / "forum_insights.md"
_PITFALL_COOKBOOK = _REPO_ROOT / "cookbook" / "cookbook_insights.md"

_rule_sections_cache: list | None = None
_pitfall_chunks_cache: list | None = None


def _split_sections(text: str, source: str) -> list:
    """Split markdown into `## ` sections → [{name, body, source}] (body incl. `### `)."""
    sections: list = []
    cur_name: str | None = None
    cur_body: list[str] = []
    for line in text.splitlines():
        if line.startswith("## "):
            if cur_name is not None:
                sections.append({"name": cur_name,
                                 "body": "\n".join(cur_body).strip(),
                                 "source": source})
            cur_name = line[3:].strip()
            cur_body = []
        elif cur_name is not None:
            cur_body.append(line)
    if cur_name is not None:
        sections.append({"name": cur_name,
                         "body": "\n".join(cur_body).strip(),
                         "source": source})
    return sections


def _rule_sections() -> list:
    """All `## ` rule sections across the rule docs, cached. [{name, body, source}]."""
    global _rule_sections_cache
    if _rule_sections_cache is None:
        out: list = []
        for path in _RULE_DOCS:
            if path.exists():
                out.extend(_split_sections(_read_md(path), path.name))
        _rule_sections_cache = out
    return _rule_sections_cache


def _split_blockquote_entries(text: str, source: str) -> list:
    """Split insight files into `> `-block entries, tagged with their `## ` section."""
    entries: list = []
    section = ""
    buf: list[str] = []

    def flush():
        if buf:
            entries.append({"text": " ".join(buf).strip(),
                            "source": source, "section": section})
            buf.clear()

    for line in text.splitlines():
        if line.startswith("## "):
            flush()
            section = line[3:].strip()
        elif line.startswith(">"):
            stripped = line[1:].strip()
            if stripped:                       # skip blank `>` separators
                buf.append(stripped)
        else:
            flush()
    flush()
    return entries


def _pitfall_chunks() -> list:
    """
    All searchable pitfall/insight entries, cached. [{text, source, section}].

    Sources: the `## Common Pitfalls` bullet list in MAX_PATCHING.md, plus every
    `> `-block entry in the forum and cookbook insight files.
    """
    global _pitfall_chunks_cache
    if _pitfall_chunks_cache is None:
        out: list = []

        # Common Pitfalls — one entry per top-level `- ` bullet.
        mp = _PATCHING_DIR / "MAX_PATCHING.md"
        if mp.exists():
            section_txt = _extract_section(_read_md(mp), "## Common Pitfalls")
            cur: list[str] = []
            for line in section_txt.splitlines():
                if line.startswith("- "):
                    if cur:
                        out.append({"text": " ".join(cur).strip(),
                                    "source": "Common Pitfalls",
                                    "section": "Common Pitfalls"})
                    cur = [line[2:]]
                elif cur and line.strip() and not line.startswith("## "):
                    cur.append(line.strip())   # continuation of current bullet
            if cur:
                out.append({"text": " ".join(cur).strip(),
                            "source": "Common Pitfalls",
                            "section": "Common Pitfalls"})

        if _PITFALL_FORUM.exists():
            out.extend(_split_blockquote_entries(_read_md(_PITFALL_FORUM), "forum"))
        if _PITFALL_COOKBOOK.exists():
            out.extend(_split_blockquote_entries(_read_md(_PITFALL_COOKBOOK), "cookbook"))

        _pitfall_chunks_cache = out
    return _pitfall_chunks_cache


def _query_tokens(query: str) -> list:
    """Lowercase, split, drop 1-char tokens — the shared tokeniser for both searches."""
    return [t for t in query.lower().split() if len(t) > 1]


def _truncate(text: str, cap: int) -> str:
    return text if len(text) <= cap else text[:cap].rsplit(" ", 1)[0] + " …"


@mcp.tool()
def search_pitfalls(term: str, limit: int = 8) -> dict:
    """
    Search the silent-failure corpus — Common Pitfalls + forum/cookbook insights.

    Use this when you hit (or want to pre-empt) surprising Max behaviour: an
    object that "fires but does nothing", a value that arrives wrong downstream,
    a UI element that renders blank. The corpus is the hard-won list of
    behaviours Max accepts silently and then misbehaves on — exactly the class of
    bug that does not surface as an error.

    Searches three sources: the `## Common Pitfalls` bullets in
    `patching/MAX_PATCHING.md`, every entry in `c74-forum/forum_insights.md`, and
    every entry in `cookbook/cookbook_insights.md`. Deterministic token search —
    ranks entries by how many of the query's words they contain (whole-phrase
    matches score highest).

    Parameters
    ----------
    term  — what you're looking for, e.g. "textedit output", "trigger order",
            "jit.matrix inlet", "udpreceive osc".
    limit — max entries to return (default 8).

    Return keys
    -----------
    count    — number of matching entries returned
    query    — the term searched
    pitfalls — list of {snippet, source, section}; source ∈
               {"Common Pitfalls", "forum", "cookbook"}
    message  — human-readable headline (names the no-match case explicitly)

    Smoke tests
    -----------
    search_pitfalls("textedit")  → the `text <symbol>` output-prefix trap
    search_pitfalls("trigger order")  → trigger fires right-to-left
    search_pitfalls("zzzznotathing")  → count 0, message says nothing matched
    """
    tokens = _query_tokens(term)
    term_l = term.lower().strip()
    scored: list = []
    for entry in _pitfall_chunks():
        text_l = entry["text"].lower()
        score = 0
        if term_l and term_l in text_l:           # whole-phrase match dominates
            score += 50
        for t in tokens:
            if t in text_l:
                score += 5
        if score:
            scored.append((score, entry))

    scored.sort(key=lambda s: -s[0])
    top = scored[:limit] if limit and limit > 0 else scored
    pitfalls = [{"snippet": _truncate(e["text"], 700),
                 "source": e["source"],
                 "section": e["section"]} for _, e in top]

    if pitfalls:
        msg = f"{len(pitfalls)} pitfall(s) matched '{term}'."
    else:
        msg = (f"No pitfalls matched '{term}'. That is NOT a guarantee the "
               f"behaviour is safe — the corpus is curated, not exhaustive. "
               f"Verify object/attribute names with lookup_object / "
               f"list_attributes before relying on them.")
    return {"count": len(pitfalls), "query": term, "pitfalls": pitfalls, "message": msg}


@mcp.tool()
def lookup_rule(name_fragment: str, limit: int = 5) -> dict:
    """
    Find a Claude2Max binding rule by a fragment of its name.

    The binding rules (Always Create a Presentation View, Always Hide Plumbing
    Patchcords, Never Write API Names From Memory, Modify Don't Rebuild, …) are
    `## ` sections across CLAUDE.md, SPEC_REFERENCE.md, and
    patching/MAX_PATCHING.md. This returns the full rule text so you can apply it
    verbatim instead of paraphrasing from memory.

    Matching is deterministic: a fragment found in a rule's HEADER ranks above a
    fragment found only in its BODY, so "presentation" surfaces the presentation
    rule first even though dozens of rules mention the word.

    Parameters
    ----------
    name_fragment — part of the rule name, e.g. "presentation", "hide plumbing",
                    "textedit", "api names", "rebuild".
    limit         — max rules to return (default 5).

    Return keys
    -----------
    count   — number of rules returned
    query   — the fragment searched
    rules   — list of {rule_name, body, source_file, matched_in}; matched_in ∈
              {"header", "body"}. Long bodies are truncated with a pointer to
              the source file.
    message — human-readable headline

    Smoke tests
    -----------
    lookup_rule("presentation")  → "Always Create a Presentation View …"
    lookup_rule("hide plumbing")  → "Always Hide Plumbing Patchcords …"
    lookup_rule("zzzznotarule")  → count 0
    """
    frag_l = name_fragment.lower().strip()
    tokens = _query_tokens(name_fragment)
    scored: list = []
    for sec in _rule_sections():
        name_l = sec["name"].lower()
        body_l = sec["body"].lower()
        score = 0
        matched_in = ""
        if frag_l and frag_l in name_l:                 # phrase in header — strongest
            score += 100
            matched_in = "header"
        else:
            hdr_hits = sum(1 for t in tokens if t in name_l)
            if hdr_hits:
                score += 20 * hdr_hits
                matched_in = "header"
            elif frag_l and frag_l in body_l:           # phrase in body
                score += 8
                matched_in = "body"
            else:
                body_hits = sum(1 for t in tokens if t in body_l)
                if body_hits:
                    score += body_hits
                    matched_in = "body"
        if score:
            scored.append((score, matched_in, sec))

    scored.sort(key=lambda s: (-s[0], s[2]["name"]))
    top = scored[:limit] if limit and limit > 0 else scored

    rules = []
    for _, matched_in, sec in top:
        body = _truncate(sec["body"], 1800)
        if body != sec["body"]:
            body += f"\n\n[truncated — full rule in {sec['source']}]"
        rules.append({"rule_name": sec["name"], "body": body,
                      "source_file": sec["source"], "matched_in": matched_in})

    if rules:
        msg = f"{len(rules)} rule(s) matched '{name_fragment}'."
    else:
        msg = (f"No rule name matched '{name_fragment}'. Try a broader fragment, "
               f"or load(['core']) for the full binding-rule set.")
    return {"count": len(rules), "query": name_fragment, "rules": rules, "message": msg}


if __name__ == "__main__":
    mcp.run()
