#!/usr/bin/env python3
"""
Claude2Max MCP server — Phase i, Step 2.

Exposes Max/MSP patching knowledge as first-class callable tools so Claude can
query binding rules, object existence, and attribute validity rather than
reasoning from training-data memory (which fails silently in Max).

Usage
-----
Register (user scope — reachable from any cwd):
    claude mcp add --scope user claude2max -- python3 /absolute/path/to/mcp_server/server.py

Run directly for debugging:
    python3 mcp_server/server.py

Tool surface (Phase i)
----------------------
  essentials()           Bootstrap. Call at session start before any Max work.
  lookup_object()        Step 3 — authoritative object existence + I/O.
  lookup_attribute()     Step 4 — attribute validity check.
  list_attributes()      Step 4 — all valid attrs for an object.

See mcp_server/DESIGN_DECISIONS.md for locked architectural choices.
"""

from mcp.server.fastmcp import FastMCP

mcp = FastMCP("claude2max")

# ---------------------------------------------------------------------------
# essentials() — structured binding-rule summary (~1.5K tokens).
#
# Initial content is a hand-written constant; Steps 3-4 will add file-reading
# with mtime-based caching when source files need to be ingested at runtime.
# ---------------------------------------------------------------------------

_ESSENTIALS_MD = """\
# Claude2Max — Max/MSP Binding Rules (essentials)

**Max's core failure mode is silent acceptance.** Unknown attributes, made-up
object names, wrong inlet indices — all accepted without error, no warning.
The patch loads and appears to work, then silently misbehaves.

---

## Before writing any object name (`newobj` text field)

1. Verify built-in objects:
   `ls /Applications/Max.app/Contents/Resources/C74/docs/refpages/max-ref/ | grep -i <name-fragment>`
2. Verify installed package externals:
   `python3 packages/query_packages.py search "<name>"` (from Claude2Max repo)
3. If both return nothing → the object does not exist as named. Do NOT write it.

**Canonical example of silent failure**: `oscparse` — not in Max 9, accepted as
a missing-object red box. OSC address-routing requires `o.route` from CNMAT
Externals. The `ls` check above returns nothing for `oscparse`; it returns
`osc.codebox osc.packet param.osc` — none of which route by address.

---

## Before writing any attribute on an object

Verify it appears in the refpage XML:
    /Applications/Max.app/Contents/Resources/C74/docs/refpages/<domain>/<objname>.maxref.xml

Max silently accepts unknown attributes and ignores them — there is no error
message. The recognition signal: **if a name "sounds right" for this kind of
object, that is the exact moment verification is non-optional.**

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

**Before composing any chain of 3+ native objects**, run:
`python3 packages/query_packages.py search "<term>"`
The 2,795-object library often covers the whole chain in one external.

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

- `lookup_object(name)` — before adding any `newobj` to a patch (Step 3)
- `lookup_attribute(object_name, attr)` — before writing any attribute (Step 4)
- `list_attributes(object_name)` — to see all valid attrs for an object (Step 4)
- `search_packages(term)` — before composing a native-object chain (Step 3)
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


if __name__ == "__main__":
    mcp.run()
