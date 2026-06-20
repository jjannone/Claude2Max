#!/usr/bin/env python3
"""
Claude2Max MCP server — Phase (i) complete (Steps 1-5).

Exposes Max/MSP patching knowledge as first-class callable tools so Claude can
query binding rules, object existence, and attribute validity rather than
reasoning from training-data memory (which fails silently in Max).

Usage
-----
Register (user scope — reachable from any cwd):
    claude mcp add --scope user claude2max -- python3 /absolute/path/to/mcp_server/server.py

Run directly for debugging:
    python3 mcp_server/server.py

Tool surface (Phase i — all five tools live)
---------------------------------------------
  essentials()           Bootstrap. Call at session start before any Max work.
  lookup_object()        Authoritative object existence + I/O signature.
  search_packages()      Search 2,795-object package library by term.
  lookup_attribute()     Attribute validity check for a specific attr.
  list_attributes()      All valid attrs for an object (bulk verification).

See mcp_server/DESIGN_DECISIONS.md for locked architectural choices.
See mcp_server/SMOKE_TEST_RESULTS.md for Phase (i) end-to-end test results.
Next: Phase (ii) — verify_spec() + shared rule library.
"""

import json
import sys
from pathlib import Path

from mcp.server.fastmcp import FastMCP

# ── repo-root imports ─────────────────────────────────────────────────────────
# spec2maxpat.py lives one directory up from this file.  Adding the repo root
# to sys.path lets us reuse RefpageCache — the same XML-backed lookup the
# converter already uses — without duplicating the parsing logic.
_REPO_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_REPO_ROOT))

from spec2maxpat import RefpageCache  # noqa: E402 — path must be set first

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
# essentials() — structured binding-rule summary (~1.5K tokens).
# ---------------------------------------------------------------------------

_ESSENTIALS_MD = """\
# Claude2Max — Max/MSP Binding Rules (essentials)

**Max's core failure mode is silent acceptance.** Unknown attributes, made-up
object names, wrong inlet indices — all accepted without error, no warning.
The patch loads and appears to work, then silently misbehaves.

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
    Bootstrap tool — CALL THIS at session start before any Max/MSP work.

    Returns the must-load binding rules for patching with Claude2Max:
    the silent-failure modes, the verification checklist for object names
    and attributes, the binding rules (presentation view, hide plumbing,
    textedit misuse, modify-don't-rebuild, sync-before-edit), the
    preferred-objects table, and the naming convention.

    This replaces the 'read these three files' workflow with queryable
    structured rules. (~1.5K tokens structured summary. For full prose
    use lookup_rule() when available.)
    """
    return _ESSENTIALS_MD


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

    # 3 — Not found
    return {
        "found": False,
        "source": "unknown",
        "numinlets": 0,
        "numoutlets": 0,
        "outlettype": [],
        "digest": "",
        "use_when": "",
        "deprecated_by": "",
        "summary": (
            f"NOT FOUND: '{name}' does not appear in C74 refpages or the "
            f"package library. Do NOT write this name into a patch. "
            f"Max will accept it silently and display a red missing-object box."
        ),
    }


# ---------------------------------------------------------------------------
# search_packages() — Step 3.
# ---------------------------------------------------------------------------

@mcp.tool()
def search_packages(term: str, limit: int = 5) -> dict:
    """
    Search the Claude2Max package library (2,795 installed externals) by term.

    Call this before composing any chain of 3+ native Max objects — there is
    often a single package external that covers the whole chain.

    Scoring: use_when match (highest) > digest match > name match.
    Results are sorted highest-relevance first, then alphabetically.

    Parameters
    ----------
    term  — search term (case-insensitive substring match)
    limit — max results to return (default 5; pass 0 for no cap)

    Return
    ------
    Dict with:
      results  — list of matching objects, each with:
                   name, package, digest, use_when, relevance
      count    — int — number of results returned
      message  — str — human-readable summary (always present, including no-match case)
    """
    term_lower = term.lower().strip()
    matches = []
    for pkg, objs in _pkg_raw().items():
        for name, rec in objs.items():
            digest   = rec.get("digest", "") or ""
            use_when = rec.get("use_when", "") or ""
            score = 0
            if term_lower in use_when.lower():
                score = 3
            elif term_lower in digest.lower():
                score = 2
            elif term_lower in name.lower():
                score = 1
            if score:
                matches.append((score, pkg, name, digest, use_when))

    matches.sort(key=lambda m: (-m[0], m[1], m[2]))
    if limit and limit > 0:
        matches = matches[:limit]

    if not matches:
        return {
            "results": [],
            "count": 0,
            "message": (
                f"No packages matched '{term}'. "
                f"Try a shorter or broader term (e.g. 'reverb' instead of "
                f"'convolution reverb with IR'), or build with native Max objects."
            ),
        }

    relevance_label = {3: "use_when", 2: "digest", 1: "name"}
    results = [
        {
            "name":      name,
            "package":   pkg,
            "digest":    digest,
            "use_when":  use_when,
            "relevance": relevance_label[score],
        }
        for score, pkg, name, digest, use_when in matches
    ]
    return {
        "results": results,
        "count":   len(results),
        "message": f"{len(results)} result(s) for '{term}'.",
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


if __name__ == "__main__":
    mcp.run()
