#!/usr/bin/env python3
"""
claude2max_verify.rules — the binding-rule checks behind verify_spec().

Each rule is a plain function ``rule(ctx) -> list[Violation]`` registered in
``REGISTRY``.  Rules are HAND-CODED (not parsed from the markdown docs) because
the binding rules are stable and hand-coding is the only way to make the checker
reliable — see DESIGN_DECISIONS.md, open-decision 1.

The module is intentionally dependency-free (no ``mcp``, no ``spec2maxpat``) so
BOTH the MCP server AND ``spec2maxpat.py convert`` can import it.

Severity contract
-----------------
ERROR    will break the patch or the converter (missing object ref, malformed
         connection, outlet/inlet index past a declared count).
WARNING  a binding-rule violation — the patch loads but is wrong for the
         operator (no presentation view, unhidden plumbing, unlabelled
         subpatcher I/O, untracked debug scaffolding).
STYLE    a convention nudge (ALL-CAPS user names, prefer v8 over js).

Each Violation carries a ``source`` string pointing at the doc section that
states the rule, so a reader can go verify the rule itself.
"""

from __future__ import annotations

from dataclasses import dataclass, field

# ── severity levels ───────────────────────────────────────────────────────────
ERROR = "error"
WARNING = "warning"
STYLE = "style"

_SEV_ORDER = {ERROR: 0, WARNING: 1, STYLE: 2}


@dataclass
class Violation:
    rule: str          # short stable id, e.g. "connection-missing-object"
    severity: str      # ERROR | WARNING | STYLE
    location: str      # where in the spec — object id, or "connections[3]"
    message: str       # human-readable explanation + suggested fix
    source: str = ""   # doc section that states the binding rule

    def to_dict(self) -> dict:
        return {
            "rule": self.rule,
            "severity": self.severity,
            "location": self.location,
            "message": self.message,
            "source": self.source,
        }


# ── object-class taxonomy ─────────────────────────────────────────────────────
# Interactive UI controls — an operator manipulates these at runtime.  Presence
# of any one means the patch "has a UI" and therefore needs a presentation view.
# (comment / message are deliberately excluded — see is_interactive.)
_INTERACTIVE = {
    "toggle", "button", "number", "flonum", "slider", "rslider", "dial",
    "multislider", "textedit", "umenu", "attrui", "kslider", "tab",
    "matrixctrl", "pictslider", "function", "filtergraph~", "itable",
    "nslider", "led", "gswitch", "preset", "jit.cellblock", "jit.pwindow",
    "ezdac~", "ezadc~", "gain~", "playlist~", "incdec", "spectroscope~",
    "scope~", "meter~",
}

# Nominal patching-view box sizes for UI classes — a MIRROR of
# spec2maxpat.UI_SIZES (this module must not import the converter). A test in
# tests/test_verify.py asserts the two tables agree, so drift is caught.
_NOMINAL_UI_SIZES = {
    "inlet":    (30, 30),
    "outlet":   (30, 30),
    "toggle":   (24, 24),
    "button":   (24, 24),
    "slider":   (20, 140),
    "dial":     (40, 48),
    "number":   (50, 22),
    "flonum":   (50, 22),
    "multislider": (120, 80),
    "function": (200, 100),
    "scope~":   (130, 130),
    "jit.pwindow": (160, 120),
    "preset":   (100, 40),
    "live.dial": (44, 47),
    "live.slider": (48, 100),
    "live.toggle": (44, 20),
    "live.numbox": (44, 20),
    "live.menu": (100, 20),
    "live.text": (44, 20),
    "live.tab":  (100, 20),
    "gain~":    (22, 140),
    "ezdac~":   (45, 45),
    "ezadc~":   (45, 45),
    "meter~":   (12, 100),
    "umenu":    (100, 22),
    "radiogroup": (18, 90),
    "matrixctrl": (100, 100),
    "textedit": (200, 80),
}

# Objects whose first argument is a user-defined NAME that the ALL-CAPS naming
# convention applies to.  Maps object-class → token index of the name argument.
_NAMED_FIRST_ARG = {
    "send", "s", "receive", "r", "send~", "receive~", "pv", "v", "value",
    "buffer~", "coll", "table", "dict", "pattr", "funbuff", "nodes", "data",
}

# The reserved magenta used to mark debug scaffolding (CLAUDE.md "Clearly Mark
# Debug Additions").  Compared with a small float tolerance.
_DEBUG_MAGENTA = (1.0, 0.3, 0.8, 1.0)

# newobj first-tokens that are structurally valid without a refpage/package hit.
# Subpatchers ("p"/"patcher") have no refpage named after them; an inline
# "patcher" key is handled separately. Everything else (v8, js, gen~, poly~, …)
# DOES have a refpage and resolves normally — if it doesn't on some install, the
# per-object "unverified" flag is the escape hatch.
_STRUCTURAL_NEWOBJ = {"p", "patcher"}

# Objects that load a custom script / codebox and can `declareattribute` (or
# `param`) arbitrary attribute names the refpage cannot list. Their attribute set
# is open-ended, so refpage-based attribute validation would false-positive on
# every custom attr (e.g. @dotsize on a v8ui). Skip attribute checks for these.
_CUSTOM_ATTR_OBJECTS = {
    "jsui", "v8ui", "js", "v8", "jspainter",
    "mxj", "mxj~",
    "gen~", "gen", "jit.gen", "jit.expr", "jit.gl.pix", "jit.gl.slab",
    "rnbo~",
    # codebox-family content holders: their free-form `code` content attribute is
    # real but not enumerated in the refpage attributelist (the converter's own
    # hidden spec-embed box uses text.codebox @code).
    "text.codebox", "dict.codebox", "coll.codebox", "osc.codebox",
    "v8.codebox",
}

# Belt-and-suspenders supplement to the jbox base attrs the resolver unions in
# (resolver.attrs_for already returns own-refpage ∪ jbox). These cover the few
# box-universal keys the converter round-trips that aren't in jbox's
# <attributelist> — chiefly `comment` (Claude2Max uses attrs.comment to label
# inlets/outlets). Suppressing these is SAFE — it can only miss a real error,
# never create a false one.
_UNIVERSAL_BOX_ATTRS = {
    "comment", "varname", "hidden", "presentation", "presentation_rect",
    "patching_rect", "rect", "fontsize", "fontname", "fontface",
    # linecount: how many lines a box renders. Absent from jbox.maxref.xml and
    # from every max-ref refpage, but observed in the C74 corpus on classes with
    # nothing in common (trigger, folder, string.remove, jit.gl.layer,
    # jit.time.perlin) — the signature of universal box metadata Max writes, not
    # an object-specific attribute. Same class of key as the rest of this set.
    "linecount",
    # presentation_linecount: the same metadata for the presentation view — Max
    # writes it on any wrapped box (newobj / message / comment, 535 in the C74
    # help corpus), and the converter sets it when a presented text box is
    # narrower than its text.
    "presentation_linecount",
}

# Attribute-name prefixes written onto boxes by Max's OWN tooling rather than by
# a patch author. They are not user-settable attributes, appear in no refpage,
# and flagging them says nothing about whether the author guessed a name — the
# author never typed them. Measured on the 11,873-file C74 corpus these were
# 98.6% of every attribute-invalid hit (21,185 of 21,487), which is what made
# the ERROR tier unusable:
#   rnbo*   — RNBO stamps rnbo_serial / rnbo_uniqueid / rnbo_classname /
#             rnbo_extra_attributes / rnboinfo on boxes inside an rnbo~ patcher
#   frozen* — patch/device freezing stores frozen_object_attributes and
#             frozen_box_attributes
# The resolver already filters these OUT of the observed-attrs allowlist
# (see _GateResolver._load_observed_attrs); this is the matching suppression on
# the reporting side, so the two halves agree.
_TOOL_STAMPED_ATTR_PREFIXES = ("rnbo", "frozen")

# Two boxes whose left edges are this close are "in a column" for the
# short-cord exemption in rule_cord_too_short.
_COLUMN_ALIGN_PX = 4

# Box keys Max treats as structure, not attributes: a parameter-enabled object
# (live.tab, live.menu, live.dial, …) keeps its parameter block — initial value,
# range, longname, unit style — under `saved_attribute_attributes`, and a box
# holding a subpatcher keeps its description/tags under
# `saved_object_attributes`. Neither appears in any refpage attribute list, and
# both are valid on any box that carries them. They reach a spec's `attrs`
# because that is the only channel the converter copies into a box (and sync
# preserves them — spec2maxpat._PRESERVE_ATTRS), so the attribute rule must not
# read them as invented names. The native gate already skips them
# (spec2maxpat._MAXPAT_STRUCTURAL_KEYS); this keeps the two paths agreeing.
_STRUCTURAL_BOX_KEYS = frozenset({"saved_attribute_attributes", "saved_object_attributes"})

# Messages nearly every object accepts — never flag these as suspect. Kept small
# and high-confidence: flagging a REAL message as fake is worse than missing one.
_UNIVERSAL_MESSAGES = {
    "bang", "int", "float", "list", "symbol", "set", "anything",
}

# Objects whose inlet-0 input is DATA being shaped / routed / matched, not a
# method selector. A leading symbol in a message into one of these is content,
# not a method call, so the message rule must NOT check it against their
# methodlist. (zl.* handled by prefix.) Membership only SUPPRESSES a check, so a
# generous list trades missed errors (acceptable) for zero false positives.
_PASSTHROUGH_TARGETS = {
    "prepend", "append", "message", "sprintf", "combine", "tosymbol",
    "fromsymbol", "route", "routepass", "router", "select", "sel",
    "gate", "ggate", "switch", "gswitch", "gswitch2", "swap",
    "pack", "pak", "unpack", "vexpr", "expr", "if", "trigger", "t",
    "bangbang", "b", "buddy", "bucket", "pipe", "delay", "deferlow",
    "join", "spell", "atoi", "itoa", "regexp", "match", "change", "thresh",
    "onebang", "speedlim", "qlim", "decode", "iter", "counter", "grab",
}


def _is_symbol_selector(s: str) -> bool:
    """A leading-alphabetic token that reads as a method name (not a number / $1)."""
    return bool(s) and s[0].isalpha() and all(c.isalnum() or c in "_." for c in s)


def _is_numeric_literal(text: str) -> bool:
    """True for an object-box text that is just a number (`5`, `-1`, `1.`).

    Max instantiates a bare number in an object box as an int/float constant, so
    such a box is valid and must not be reported as an unknown object name.
    Observed throughout C74's own shipped patches, which do not ship broken boxes.
    """
    try:
        float(text)
        return True
    except (TypeError, ValueError):
        return False


def _is_unverified(obj) -> bool:
    """Author has explicitly asserted this object is real without refpage proof."""
    return _truthy(obj.get("unverified")) or _truthy(
        (obj.get("attrs") or {}).get("unverified") if isinstance(obj, dict) else None
    )


def is_interactive(maxclass: str) -> bool:
    """True if an operator manipulates this object class at runtime."""
    if maxclass in _INTERACTIVE:
        return True
    if maxclass.startswith("live."):
        # live.comment / live.line are decoration, not controls.
        return maxclass not in ("live.comment", "live.line")
    return False


def _truthy(v) -> bool:
    return v in (1, "1", True, 1.0)


# ── spec accessors (forgiving — verify must never crash on a weird spec) ───────
def _min_object_box_width(obj: dict):
    """24 + 15 px per port on the busier side, from the spec's declared
    `inlets` / `outlets`; None when neither is declared. Mirrors
    spec2maxpat.min_object_box_width. Rule: MAX_PATCHING.md > Give every port room."""
    counts = [n for n in (obj.get("inlets"), obj.get("outlets")) if isinstance(n, int)]
    return 24 + 15 * max(counts) if counts else None


class SpecContext:
    """Pre-computed views over a spec so rules don't each re-walk it."""

    def __init__(self, spec: dict, base_dir=None, native=False):
        self.spec = spec if isinstance(spec, dict) else {}
        # Directory the patch lives in, when known (verify_patch_file supplies
        # it). Rules that read a sibling file — the JS attribute scanner —
        # resolve relative script names against it; None means "can't".
        self.base_dir = base_dir
        # True when the spec was derived from a native patch's boxes rather
        # than authored (verify_patch_file's native-scopes mode). Rules about
        # spec-authoring fields that the derivation does not carry — declared
        # v8 I/O, jsui attrs.filename — cannot be judged there and no-op.
        self.native = native
        objs = self.spec.get("objects", {})
        self.objects: dict[str, dict] = objs if isinstance(objs, dict) else {}
        conns = self.spec.get("connections", [])
        self.connections: list = conns if isinstance(conns, list) else []
        self.debug_ids = set(self.spec.get("debug_additions", []) or [])

        # incoming / outgoing maps keyed by object id.  Each entry is the raw
        # connection plus its index, so rules can report a precise location.
        self.incoming: dict[str, list] = {oid: [] for oid in self.objects}
        self.outgoing: dict[str, list] = {oid: [] for oid in self.objects}
        for i, conn in enumerate(self.connections):
            if not isinstance(conn, (list, tuple)) or len(conn) < 4:
                continue
            src, _so, dst, _di = conn[0], conn[1], conn[2], conn[3]
            if dst in self.incoming:
                self.incoming[dst].append((i, conn))
            if src in self.outgoing:
                self.outgoing[src].append((i, conn))

    # -- per-object helpers ----------------------------------------------------
    @staticmethod
    def maxclass(obj: dict) -> str:
        return obj.get("type", "newobj") if isinstance(obj, dict) else "newobj"

    @staticmethod
    def text(obj: dict) -> str:
        return (obj.get("text") or "") if isinstance(obj, dict) else ""

    @staticmethod
    def attrs(obj: dict) -> dict:
        a = obj.get("attrs", {}) if isinstance(obj, dict) else {}
        return a if isinstance(a, dict) else {}

    @classmethod
    def is_hidden(cls, obj: dict) -> bool:
        # hidden round-trips through attrs (see spec2maxpat _PRESERVE_ATTRS);
        # tolerate a stray top-level key too.
        return _truthy(cls.attrs(obj).get("hidden")) or _truthy(obj.get("hidden"))

    @staticmethod
    def has_presentation(obj: dict) -> bool:
        if not isinstance(obj, dict):
            return False
        return bool(obj.get("presentation") or obj.get("presentation_rect"))

    @staticmethod
    def conn_hidden(conn) -> bool:
        return len(conn) == 5 and isinstance(conn[4], dict) and _truthy(conn[4].get("hidden"))

    # -- geometry (patching view) ------------------------------------------
    @classmethod
    def box_rect(cls, obj: dict):
        """Patching-view rect [x, y, w, h] for an object, or None when it has
        no explicit `pos` (auto-laid-out — never guess a position).

        `size` is often absent: after a `sync`, reconcile_spec records it only
        when the live height differs from 22. Fallbacks mirror the converter:
        a UI class takes its nominal size (_NOMINAL_UI_SIZES); a text box is
        22 px high and `len(text) * 7 + 20` wide (spec2maxpat.estimate_text_width).
        """
        if not isinstance(obj, dict):
            return None
        pos = obj.get("pos")
        if not isinstance(pos, (list, tuple)) or len(pos) < 2:
            return None
        try:
            x, y = float(pos[0]), float(pos[1])
        except (TypeError, ValueError):
            return None
        size = obj.get("size")
        if isinstance(size, (list, tuple)) and len(size) >= 2:
            try:
                return [x, y, float(size[0]), float(size[1])]
            except (TypeError, ValueError):
                pass
        mc = cls.maxclass(obj)
        if mc in _NOMINAL_UI_SIZES:
            w, h = _NOMINAL_UI_SIZES[mc]
            return [x, y, float(w), float(h)]
        text = cls.text(obj)
        w = max(len(text) * 7 + 20, 40) if text else 40
        if mc == "newobj":
            w = max(w, _min_object_box_width(obj) or 0)
        return [x, y, float(w), 22.0]

    @staticmethod
    def pres_rect(obj: dict):
        """Presentation rect [x, y, w, h], or None. `presentation_rect` wins
        over `presentation`; a 2-element `presentation` has no size and a dict
        (grid hint) is not a rect — both return None."""
        if not isinstance(obj, dict):
            return None
        for key in ("presentation_rect", "presentation"):
            v = obj.get(key)
            if isinstance(v, (list, tuple)) and len(v) >= 4:
                try:
                    return [float(c) for c in v[:4]]
                except (TypeError, ValueError):
                    return None
        return None


# ───────────────────────────────────────────────────────────────────────────
# ERROR rules — these break the patch or the converter
# ───────────────────────────────────────────────────────────────────────────

def rule_connection_shape(ctx: SpecContext) -> list:
    """Connections must be [src, outlet, dst, inlet] or that + an attrs dict."""
    out = []
    for i, conn in enumerate(ctx.connections):
        loc = f"connections[{i}]"
        if not isinstance(conn, (list, tuple)) or len(conn) not in (4, 5):
            out.append(Violation(
                "connection-shape", ERROR, loc,
                f"Connection must have 4 elements [src, outlet, dst, inlet] or "
                f"5 with a trailing attrs dict; got {conn!r}.",
                "SPEC_REFERENCE.md > Connections",
            ))
            continue
        if len(conn) == 5 and not isinstance(conn[4], dict):
            out.append(Violation(
                "connection-shape", ERROR, loc,
                f"5th connection element must be an attrs dict; got {conn[4]!r}.",
                "SPEC_REFERENCE.md > Connections",
            ))
    return out


def rule_connection_refs(ctx: SpecContext) -> list:
    """Both endpoints of every connection must exist in objects."""
    out = []
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue  # shape rule already reported it
        src, dst = conn[0], conn[2]
        if src not in ctx.objects:
            out.append(Violation(
                "connection-missing-object", ERROR, f"connections[{i}]",
                f"Connection source '{src}' is not defined in objects. "
                f"The converter raises ValueError on this.",
                "spec2maxpat.py convert_patcher",
            ))
        if dst not in ctx.objects:
            out.append(Violation(
                "connection-missing-object", ERROR, f"connections[{i}]",
                f"Connection destination '{dst}' is not defined in objects. "
                f"The converter raises ValueError on this.",
                "spec2maxpat.py convert_patcher",
            ))
    return out


def rule_io_index_range(ctx: SpecContext) -> list:
    """
    Outlet / inlet indices must fall within a count the spec explicitly
    declares.  Only fires when the object declares ``outlets`` / ``inlets`` —
    we never guess counts here (guessing would produce false positives).
    """
    out = []
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        src, so, dst, di = conn[0], conn[1], conn[2], conn[3]
        loc = f"connections[{i}]"
        s_obj = ctx.objects.get(src)
        d_obj = ctx.objects.get(dst)
        if isinstance(s_obj, dict) and isinstance(s_obj.get("outlets"), int):
            if isinstance(so, int) and so >= s_obj["outlets"]:
                out.append(Violation(
                    "io-index-range", ERROR, loc,
                    f"Outlet {so} on '{src}' exceeds its declared "
                    f"{s_obj['outlets']} outlet(s) (valid 0..{s_obj['outlets'] - 1}).",
                    "SPEC_REFERENCE.md > Connections",
                ))
        if isinstance(d_obj, dict) and isinstance(d_obj.get("inlets"), int):
            if isinstance(di, int) and di >= d_obj["inlets"]:
                out.append(Violation(
                    "io-index-range", ERROR, loc,
                    f"Inlet {di} on '{dst}' exceeds its declared "
                    f"{d_obj['inlets']} inlet(s) (valid 0..{d_obj['inlets'] - 1}).",
                    "SPEC_REFERENCE.md > Connections",
                ))
    return out


def rule_empty_newobj(ctx: SpecContext) -> list:
    """A newobj / message with no text becomes a blank, useless box."""
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        mc = ctx.maxclass(obj)
        if mc in ("newobj", "message") and not ctx.text(obj).strip():
            out.append(Violation(
                "empty-newobj", WARNING, oid,
                f"'{oid}' is a {mc} with empty text — it will render as a blank "
                f"box. Give it object text or remove it.",
                "SPEC_REFERENCE.md > Object Fields",
            ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# WARNING rules — binding-rule violations
# ───────────────────────────────────────────────────────────────────────────

def rule_presentation_required(ctx: SpecContext) -> list:
    """
    Binding rule: any patch with a UI gets a presentation view.  If the spec
    contains interactive controls but NO object opts into presentation, the
    converter won't set openinpresentation and the operator is stuck in the
    edit graph.
    """
    interactive = [
        oid for oid, obj in ctx.objects.items()
        if isinstance(obj, dict) and is_interactive(ctx.maxclass(obj))
        and not ctx.is_hidden(obj)
    ]
    if not interactive:
        return []
    any_presented = any(ctx.has_presentation(o) for o in ctx.objects.values())
    if any_presented:
        return []
    sample = ", ".join(interactive[:5]) + ("…" if len(interactive) > 5 else "")
    return [Violation(
        "presentation-required", WARNING, "patcher",
        f"Patch has {len(interactive)} interactive control(s) ({sample}) but no "
        f"object sets presentation/presentation_rect. Add a presentation view "
        f"(unless this is a utility/DSP patch with no operator).",
        "CLAUDE.md > Always Create a Presentation View",
    )]


_LABEL_REACH_PX = 40.0   # edge-to-edge distance within which a comment counts as a control's label
# Controls that render their own label: attrui shows the attribute name it is
# bound to. Calibration 2026-09-08 on patches/: 48 per-control hits, 30 of
# them attrui rows in reverb-shootout sitting 54–78 px from a section header.
_SELF_LABELLED = {"attrui"}


def _edge_distance(a, b) -> float:
    """Shortest edge-to-edge distance between two [x, y, w, h] rects (0 if they touch/overlap)."""
    dx = max(b[0] - (a[0] + a[2]), a[0] - (b[0] + b[2]), 0.0)
    dy = max(b[1] - (a[1] + a[3]), a[1] - (b[1] + b[3]), 0.0)
    return (dx * dx + dy * dy) ** 0.5


def rule_presented_controls_need_labels(ctx: SpecContext) -> list:
    """
    Binding rule: a control worth showing is worth labelling. Two tiers:
      1. coarse — presented interactive controls but NO presented comment at
         all → one finding for the whole patch (not one per control).
      2. per-control — each presented control needs a presented `comment`
         within _LABEL_REACH_PX (edge to edge) in the presentation view.
         Controls without a presentation rect (2-element `presentation`)
         cannot be measured and are skipped.
    `message` boxes are their own label (MAX_PATCHING.md > Prefer a labeled
    message box over a button + comment) and are not interactive here.
    Deliberately NO inverse check (a comment with no control near it) — John
    discarded it 2026-09-08.
    Calibration 2026-09-08: see docstring note in TASK_QUEUE item 13(s).
    """
    presented_controls = [
        (oid, obj) for oid, obj in ctx.objects.items()
        if isinstance(obj, dict) and ctx.has_presentation(obj)
        and is_interactive(ctx.maxclass(obj))
        and ctx.maxclass(obj) not in _SELF_LABELLED
    ]
    if not presented_controls:
        return []
    comments = [
        ctx.pres_rect(o) for o in ctx.objects.values()
        if isinstance(o, dict) and ctx.maxclass(o) == "comment" and ctx.has_presentation(o)
    ]
    if not any(isinstance(o, dict) and ctx.maxclass(o) == "comment" and ctx.has_presentation(o)
               for o in ctx.objects.values()):
        return [Violation(
            "presented-controls-need-labels", WARNING, "patcher",
            f"{len(presented_controls)} control(s) are in the presentation view but "
            f"there are no presented comment labels. Every visible control needs a "
            f"label.",
            "CLAUDE.md > Always Create a Presentation View",
        )]
    comment_rects = [r for r in comments if r]
    out = []
    for oid, obj in presented_controls:
        r = ctx.pres_rect(obj)
        if r is None or not comment_rects:
            continue
        nearest = min(_edge_distance(r, c) for c in comment_rects)
        if nearest > _LABEL_REACH_PX:
            out.append(Violation(
                "control-unlabelled", WARNING, oid,
                f"Presented control '{oid}' ({ctx.maxclass(obj)}) has no comment "
                f"label within {_LABEL_REACH_PX:.0f} px in the presentation view "
                f"(nearest is {nearest:.0f} px away). Put a comment beside it.",
                "CLAUDE.md > Always Create a Presentation View",
            ))
    return out


# Two legitimate uses of `hidden` survive the never-hide rule, and both are
# exempt here. They share a property: neither is an authoring choice about
# tidiness, which is what the rule forbids.
#   1. The embedded spec codebox — storage in the shape of a box: no inlets, no
#      outlets, no graph role.
#   2. Boxes whose visibility is RUNTIME STATE driven by code. The tutorial
#      system's highlight panels and bubble annotations start hidden and are
#      unhidden one step at a time by the generated v8 controller via
#      `patcher.getnamed()`; their contract is a `tut-panel-N` / `tut-ann-N`
#      varname (TUTORIAL_GUIDELINES.md). Here `hidden` is an initial value a
#      state machine owns, not a decision to keep something off a reader's
#      screen.
# Anything else hidden is a rule violation.
_HIDDEN_EXEMPT_IDS = {"obj-spec-embed", "spec_embed", "spec-embed"}
_HIDDEN_EXEMPT_VARNAME_PREFIXES = ("tut-panel-", "tut-ann-")


def _hidden_is_runtime_state(obj: dict) -> bool:
    """True when a box's `hidden` is an initial value that code toggles."""
    attrs = obj.get("attrs")
    varname = attrs.get("varname", "") if isinstance(attrs, dict) else ""
    return isinstance(varname, str) and varname.startswith(
        _HIDDEN_EXEMPT_VARNAME_PREFIXES
    )


def rule_no_hidden_elements(ctx: SpecContext) -> list:
    """
    Binding rule: never hide a patchcord or a box. The presentation view already
    decides what the operator sees; `hidden` acts only on the patching view,
    which belongs to whoever edits or learns the patch. Hiding there removes
    information from its only readership.

    Replaced `rule_hidden_box_cords_hidden` and `rule_redundant_message_box`
    (2026-09-07), which enforced the opposite default.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or oid in _HIDDEN_EXEMPT_IDS:
            continue
        if _hidden_is_runtime_state(obj):
            continue
        if ctx.is_hidden(obj):
            out.append(Violation(
                "hidden-box", WARNING, oid,
                f"Box '{oid}' is marked hidden. Nothing in a patch is hidden — "
                f"keep it visible in the patching view and simply leave it out "
                f"of the presentation view (no presentation:1).",
                "CLAUDE.md > Never Hide Patchcords or Boxes",
            ))
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        if ctx.conn_hidden(conn):
            out.append(Violation(
                "hidden-cord", WARNING, f"connections[{i}]",
                f"Connection {conn[0]}→{conn[2]} is hidden. Drop the "
                f"{{\"hidden\": 1}} attrs dict — every patchcord is visible. If "
                f"the region looks tangled, fix the layout instead.",
                "CLAUDE.md > Never Hide Patchcords or Boxes",
            ))
    return out


_IO_COMMENT_REACH_PX = 60.0


def _check_io_labels(objects: dict, path: str, out: list) -> None:
    """Inlet/outlet boxes inside one (sub)patcher need BOTH a comment
    attr (the outside tooltip) AND an adjacent `comment` box inside the scope.

    Adjacency is edge-to-edge within _IO_COMMENT_REACH_PX in the patching view;
    when a scope has no positions to measure, any comment in the scope counts.
    Deeper subpatchers are checked when run_all reaches their own scope.
    """
    comment_rects = []
    any_comment = False
    for o in objects.values():
        if isinstance(o, dict) and o.get("type") == "comment":
            any_comment = True
            r = SpecContext.box_rect(o)
            if r:
                comment_rects.append(r)
    for oid, obj in objects.items():
        if not isinstance(obj, dict):
            continue
        mc = obj.get("type", "newobj")
        if mc in ("inlet", "outlet"):
            attrs = obj.get("attrs", {})
            if not (isinstance(attrs, dict) and (attrs.get("comment") or "").strip()):
                out.append(Violation(
                    "io-label-missing", WARNING, f"{path}{oid}",
                    f"{mc} '{oid}' has no comment attr. Label every inlet/outlet "
                    f"inside an encapsulation (purpose + type).",
                    "CLAUDE.md > subpatcher/abstraction inlet/outlet labeling",
                ))
            r = SpecContext.box_rect(obj)
            if r and comment_rects:
                near = min(_edge_distance(r, c) for c in comment_rects) <= _IO_COMMENT_REACH_PX
            else:
                near = any_comment
            if not near:
                out.append(Violation(
                    "io-comment-box-missing", WARNING, f"{path}{oid}",
                    f"{mc} '{oid}' has no adjacent comment box inside the "
                    f"encapsulation (within {_IO_COMMENT_REACH_PX:.0f} px). The "
                    f"comment attr labels the port outside; a comment box beside "
                    f"the {mc} labels it inside — both are required.",
                    "CLAUDE.md > What You Must Handle > subpatcher inlet/outlet labeling",
                ))


def rule_subpatcher_labels(ctx: SpecContext) -> list:
    """
    Binding rule: every subpatcher / poly~ / bpatcher must be labelled OUTSIDE
    (a comment attr describing its inlets/outlets) and its inlet/outlet boxes
    must be labelled INSIDE.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        mc = ctx.maxclass(obj)
        has_sub = isinstance(obj.get("patcher"), dict)
        is_encaps = has_sub or mc in ("poly~", "bpatcher")
        if not is_encaps:
            continue
        if not (ctx.attrs(obj).get("comment") or "").strip():
            out.append(Violation(
                "subpatcher-label-missing", WARNING, oid,
                f"Encapsulation '{oid}' ({mc}) has no outside comment attr "
                f"describing its inlets/outlets. Add attrs.comment "
                f"(\"in 0: … | out 0: …\").",
                "CLAUDE.md > subpatcher/abstraction inlet/outlet labeling",
            ))
        # inside labels
        sub = obj.get("patcher")
        if isinstance(sub, dict) and isinstance(sub.get("objects"), dict):
            _check_io_labels(sub["objects"], f"{oid}/", out)
    return out


def _color_is(val, target) -> bool:
    if not isinstance(val, (list, tuple)) or len(val) < 4:
        return False
    try:
        return all(abs(float(val[i]) - target[i]) < 0.02 for i in range(4))
    except (TypeError, ValueError):
        return False


def rule_debug_marking(ctx: SpecContext) -> list:
    """
    Binding rule: debug scaffolding is marked with the reserved magenta and
    tracked in debug_additions, and must NOT be in the presentation view.
    Two failure modes checked:
      - magenta-coloured object not listed in debug_additions
      - object listed in debug_additions that is presented
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        bg = ctx.attrs(obj).get("bgcolor")
        looks_debug = _color_is(bg, _DEBUG_MAGENTA)
        if looks_debug and oid not in ctx.debug_ids:
            out.append(Violation(
                "debug-untracked", WARNING, oid,
                f"'{oid}' uses the reserved debug magenta but is not listed in "
                f"the top-level debug_additions array. Track it so cleanup can "
                f"find it.",
                "CLAUDE.md > Clearly Mark Debug Additions",
            ))
        if oid in ctx.debug_ids and ctx.has_presentation(obj):
            out.append(Violation(
                "debug-in-presentation", WARNING, oid,
                f"Debug object '{oid}' is in the presentation view. Debug "
                f"scaffolding is patching-view only — never presentation.",
                "CLAUDE.md > Clearly Mark Debug Additions",
            ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# WARNING rules, second family — presentation geometry and silent-failure
# wiring (TASK_QUEUE item 13, 2026-09-08). Each docstring names the doc
# section it enforces.
#
# Calibration, 2026-09-08 — hit counts with `spec2maxpat.py verify --summary
# --no-resolver` over `patches/` (7 files, embedded specs) and the C74 help
# corpus (1,015 files, native-scopes mode). A rule that fires on most of C74's
# own patches measures a convention they never adopted; all of these hold at
# WARNING / STYLE per the hold-all-promotion decision.
#
#   rule                          patches/   C74 help   note
#   presentation-overlap               2          0     corpus specs carry no presentation rects
#   comment-contrast                   0          0
#   control-unlabelled                14          0     48 before exempting attrui (self-labelled)
#   io-comment-box-missing             0          0
#   template-on-right-inlet            0          0
#   textedit-into-template             0          0
#   select-float-needs-fuzzy           0          1
#   script-filename-missing            0      3,332*    *native mode; now no-ops there (ctx.native)
#   script-io-undeclared               4        968*    *same — derived specs never declare I/O
#   attribute-group-incomplete         0          4
#   attribute-required                 0         42     jit.world without @enable 1, as the doc warns
#   kslider-demo-range                 0          0
#   jit-matrix-fan-in                  —          —     resolver-gated; corpus run was --no-resolver
#   cord-crosses-unrelated-box        95          0     panels excluded; attrui columns dominate
#                                                       (2026-09-16: ports moved toward the box edges as Max
#                                                       draws them; 228 fewer hits over 25 patches with a
#                                                       3.5 px inset, before the measured 19 px replaced it)
#   feeder-below-target                0          0
#   fanout-order                       2          0
#   cord-too-short                   103          0     older repo layouts used 25–30 px rows
#   button-side-tap                    4         69
#   preferred-object                   6        549     plus prefer-v8 960 (js in C74 help)
#   print-needs-name                   0         45
#   patching-size-override            12          0     64 before allowing attrui (content-sized)
#   control-init-on-load              19      2,514     C74 convention: uninitialized number boxes
#   attr-* / script-io-unlabelled      4          0     JS scanner; needs base_dir
#
# Added 2026-09-16 from c2m_layout.py, measured over `patches/` (20 files):
#   patching-overlap                  58          0     label/control kisses of 2–7 px in the older sequencers
#   cord-long                        198          0     169 leave an r~ that could sit by its inlet
#   box-off-canvas                    13          0     one per patch; every shootout's presentation overruns its window
#   off-grid                           1          0     silent unless ≥80% of ≥5 boxes share a grid
#
# Geometry and presentation rules read `pos` / presentation rects, which a
# native-derived spec does not carry, so their corpus count is structurally 0.
# ───────────────────────────────────────────────────────────────────────────

_OVERLAP_TOLERANCE_PX = 1.0   # Max rounds rects on save; a 1 px kiss is not a collision

# Classes whose job is to sit behind other boxes. An overlap with one is the
# backdrop working, not a layout bug. (c2m_layout.py also counted `bpatcher`;
# a bpatcher is a real box with ports, so it is not exempt here.)
_BACKDROP_CLASSES = frozenset({"panel", "fpic"})


def _is_click_target(ctx: "SpecContext", obj: dict) -> bool:
    """A button drawn fully transparent (bgcolor alpha 0) is a click target
    laid over something readable — a comment made clickable."""
    if not isinstance(obj, dict) or ctx.maxclass(obj) != "button":
        return False
    attrs = obj.get("attrs") if isinstance(obj.get("attrs"), dict) else obj
    bg = attrs.get("bgcolor")
    return isinstance(bg, (list, tuple)) and len(bg) == 4 and float(bg[3]) == 0.0


def _click_target_over_label(ctx: "SpecContext", a: dict, b: dict) -> bool:
    """True when one box is a transparent click target and the other is the
    comment it makes clickable — overlapping its label is its purpose."""
    return ((_is_click_target(ctx, a) and ctx.maxclass(b) == "comment")
            or (_is_click_target(ctx, b) and ctx.maxclass(a) == "comment"))


def _rects_intersect(a, b, tol=_OVERLAP_TOLERANCE_PX):
    """Overlap depth (min of x/y penetration) if a and b intersect by more than tol, else 0."""
    ox = min(a[0] + a[2], b[0] + b[2]) - max(a[0], b[0])
    oy = min(a[1] + a[3], b[1] + b[3]) - max(a[1], b[1])
    if ox > tol and oy > tol:
        return min(ox, oy)
    return 0.0


def _rect_inside(inner, outer) -> bool:
    return (outer[0] <= inner[0] and outer[1] <= inner[1]
            and inner[0] + inner[2] <= outer[0] + outer[2]
            and inner[1] + inner[3] <= outer[1] + outer[3])


def rule_presentation_overlap(ctx: SpecContext) -> list:
    """(a) Presented boxes must not intersect, and must sit inside a panel.

    Pairwise rectangle intersection over every presented non-panel box, then
    containment: when at least one presented panel exists, every presented
    non-panel box must lie inside some panel. Panels are excluded from the
    pairwise pass (nested panels are legitimate). Boxes with no presentation
    rect (2-element `presentation`) are skipped.
    Source: MAX_PATCHING.md > Every presentation row needs its own vertical
    budget ("treat any hit as a layout bug"). Motivating case: kslider-restrike,
    where Max resized the kslider 576×70 → 560×83 on resave and the 9 px
    overlap with the hint comment shipped.
    """
    presented = []
    panels = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or not ctx.has_presentation(obj):
            continue
        r = ctx.pres_rect(obj)
        if r is None:
            continue
        mc = ctx.maxclass(obj)
        if mc == "panel":
            panels.append((oid, r))
        elif mc in _BACKDROP_CLASSES:
            continue  # an fpic backdrop sits behind controls by design
        else:
            presented.append((oid, r))
    out = []

    for i in range(len(presented)):
        for j in range(i + 1, len(presented)):
            (a_id, a), (b_id, b) = presented[i], presented[j]
            if _click_target_over_label(ctx, ctx.objects[a_id], ctx.objects[b_id]):
                continue
            depth = _rects_intersect(a, b)
            if depth:
                out.append(Violation(
                    "presentation-overlap", WARNING, f"{a_id} × {b_id}",
                    f"Presented boxes '{a_id}' {[int(v) for v in a]} and '{b_id}' "
                    f"{[int(v) for v in b]} overlap by {depth:.0f} px in the "
                    f"presentation view. Re-flow the row — every presented control "
                    f"needs its own vertical budget.",
                    "MAX_PATCHING.md > Every presentation row needs its own vertical budget",
                ))
    if panels:
        for oid, r in presented:
            if not any(_rect_inside(r, pr) for _pid, pr in panels):
                out.append(Violation(
                    "presentation-outside-panel", WARNING, oid,
                    f"Presented box '{oid}' {[int(v) for v in r]} lies inside no "
                    f"presented panel. Grow the panel meant to hold it or move the box.",
                    "MAX_PATCHING.md > Every presentation row needs its own vertical budget",
                ))
    return out


def _is_presented(ctx: SpecContext, obj: dict) -> bool:
    # Spec mode carries `presentation` / `presentation_rect` on the object; the
    # native derivation carries only attr names, so `presentation` lands in attrs.
    return ctx.has_presentation(obj) or _truthy(ctx.attrs(obj).get("presentation"))


_PANEL_LAYER_SOURCE = "MAX_PATCHING.md > Presentation panels live in the background layer"


def rule_panel_background_layer(ctx: SpecContext) -> list:
    """Presentation panels live in the background layer.

    A panel is scenery: it groups controls, it is never a control, and while
    someone edits the patch it must not be selectable or in the way of a click.
    Three settings make that true, and the converter supplies the third (it
    emits every `panel` box after every non-panel box), so this rule checks the
    two the author has to write:

    (a) `panel-not-background` — a presented panel without `background: 1`
        (Max's Arrange > Include in Background). Both modes.
    (b) `panel-bglocked-missing` — a spec with presented panels whose root
        lacks `bglocked: 1` (Max's View > Lock Background: "objects in the
        background cannot be selected"). Spec mode only — the native
        derivation carries no patcher-level keys, and no shipped C74 help file
        locks its background (0 of 584 carrying the key), so a native warning
        would be noise on files that are meant to be taken apart.

    Motivating case: reverb-shootout (2026-09-08) declared one panel per
    section next to that section's controls — every panel painted over the
    controls declared before it and every panel was selectable while editing.
    Ableton's own ABL Effect Modules set background: 1 on 83 of 85 panels.
    """
    out = []
    presented_panels = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "panel":
            continue
        if not _is_presented(ctx, obj):
            continue
        presented_panels.append(oid)
        if not _truthy(ctx.attrs(obj).get("background")):
            out.append(Violation(
                "panel-not-background", WARNING, oid,
                f"Presented panel '{oid}' is not on the background layer. Set "
                f"attrs.background: 1 (Max's Arrange > Include in Background) so "
                f"it paints behind every control and, with the background locked, "
                f"cannot be selected while editing.",
                _PANEL_LAYER_SOURCE,
            ))
    if presented_panels and not ctx.native and not _truthy(ctx.spec.get("bglocked")):
        out.append(Violation(
            "panel-bglocked-missing", WARNING, "(patcher)",
            f"Patch has {len(presented_panels)} presented panel(s) but the spec "
            f"root does not set bglocked: 1 (Max's View > Lock Background). "
            f"Without it every panel is selectable and draggable while editing. "
            f"Add \"bglocked\": 1 at the top level of the spec; the converter "
            f"writes it to the patcher and sync carries it back.",
            _PANEL_LAYER_SOURCE,
        ))
    return out


def _srgb_to_linear(c: float) -> float:
    c = max(0.0, min(1.0, c))
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def _luminance(rgba) -> float:
    r, g, b = (_srgb_to_linear(float(rgba[i])) for i in range(3))
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


_CONTRAST_MIN = 3.0   # WCAG large-text minimum; calibrate before raising


def rule_comment_contrast(ctx: SpecContext) -> list:
    """(b) A comment's text must read against its own background.

    Only comments that set BOTH `bgcolor` and `textcolor` are judged (one alone
    pairs with Max's default, which is calibrated for the canvas). Background
    alpha below 0.1 is effectively transparent and skipped. Ratio below
    _CONTRAST_MIN fires. `bubble_bgcolor` is deliberately not considered.
    Source: MAX_PATCHING.md > A comment's text must contrast with its own
    background ("a one-line luminance diff over the spec is enough").
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "comment":
            continue
        attrs = ctx.attrs(obj)
        bg, fg = attrs.get("bgcolor"), attrs.get("textcolor")
        if not (isinstance(bg, (list, tuple)) and isinstance(fg, (list, tuple))
                and len(bg) >= 3 and len(fg) >= 3):
            continue
        try:
            if len(bg) >= 4 and float(bg[3]) < 0.1:
                continue
            lb, lf = _luminance(bg), _luminance(fg)
        except (TypeError, ValueError):
            continue
        hi, lo = max(lb, lf), min(lb, lf)
        ratio = (hi + 0.05) / (lo + 0.05)
        if ratio < _CONTRAST_MIN:
            out.append(Violation(
                "comment-contrast", WARNING, oid,
                f"Comment '{oid}' has text/background contrast {ratio:.2f}:1 "
                f"(below {_CONTRAST_MIN:.0f}:1) — textcolor {list(fg[:3])} on bgcolor "
                f"{list(bg[:3])} is unreadable. Lighten the text or darken the panel.",
                "MAX_PATCHING.md > A comment's text must contrast with its own background",
            ))
    return out


_DOLLAR_RE = __import__("re").compile(r"\$\d")


def _has_template(text: str) -> bool:
    return bool(_DOLLAR_RE.search(text or ""))


def rule_template_on_right_inlet(ctx: SpecContext) -> list:
    """(h) A `$N` message box must be fed on its LEFT inlet.

    The right inlet replaces the stored text without output — the template is
    silently overwritten with the incoming value and the patch keeps running
    with a mutated message box. No legitimate use is known.
    Source: MAX_PATCHING.md > A message box's RIGHT inlet replaces the box's
    stored text without triggering output.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "message":
            continue
        if not _has_template(ctx.text(obj)):
            continue
        for i, conn in ctx.incoming.get(oid, []):
            if conn[3] == 1:
                out.append(Violation(
                    "template-on-right-inlet", WARNING, f"connections[{i}]",
                    f"'{conn[0]}' feeds inlet 1 of message '{oid}' "
                    f"(\"{ctx.text(obj)}\"). The right inlet REPLACES the stored text "
                    f"and emits nothing — the $-template is silently overwritten. "
                    f"Wire it to inlet 0.",
                    "MAX_PATCHING.md > A message box's RIGHT inlet replaces the box's stored text",
                ))
    return out


def _text_attr(obj: dict, name: str):
    """An attribute from `attrs` or from an `@name value` token pair in `text`."""
    attrs = SpecContext.attrs(obj)
    if name in attrs:
        return attrs[name]
    toks = SpecContext.text(obj).split()
    for i, tok in enumerate(toks):
        if tok == "@" + name and i + 1 < len(toks):
            return toks[i + 1]
    return None


def rule_textedit_into_template(ctx: SpecContext) -> list:
    """(l) `textedit` outlet 0 carries a `text` prefix unless `@outputmode 1`.

    Flag an outlet-0 cord from such a textedit into a `$N` message, `prepend`,
    or `sprintf`. `[route text]` between them is the sanctioned fix and is not
    flagged. Source: MAX_PATCHING.md > textedit outlet 0 emits `text <symbol>`
    by default; CLAUDE.md > Don't Use textedit for Set-Once Configuration.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "textedit":
            continue
        mode = _text_attr(obj, "outputmode")
        if mode is not None and str(mode) not in ("0", "0.0"):
            continue
        for i, conn in ctx.outgoing.get(oid, []):
            if conn[1] != 0:
                continue
            tgt = ctx.objects.get(conn[2])
            if not isinstance(tgt, dict):
                continue
            tmc, ttext = ctx.maxclass(tgt), ctx.text(tgt)
            first = ttext.split()[0] if ttext.split() else ""
            bad = ((tmc == "message" and _has_template(ttext))
                   or (tmc == "newobj" and first in ("prepend", "sprintf")))
            if bad:
                out.append(Violation(
                    "textedit-into-template", WARNING, f"connections[{i}]",
                    f"textedit '{oid}' (outputmode 0) feeds '{conn[2]}' — its output "
                    f"is `text <content>`, so the literal symbol `text` lands in the "
                    f"template/format. Set `@outputmode 1`, insert `[route text]`, or "
                    f"hardcode the value.",
                    "MAX_PATCHING.md > textedit outlet 0 emits text <symbol> by default",
                ))
    return out


_FLOAT_UI_SOURCES = {"dial", "slider", "rslider", "flonum", "multislider"}


def rule_select_float_needs_fuzzy(ctx: SpecContext) -> list:
    """(m) `select` against a float from a UI source needs `@fuzzy`.

    UI floats arrive as 0.14999999…; `select 0.15` misses them silently.
    Fires when a `select`/`sel` has a float literal arg, no `@fuzzy`, and any
    incoming cord from a dial/slider/rslider/flonum/multislider/live.* control.
    Source: MAX_PATCHING.md > select with float values from UI requires @fuzzy.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        toks = ctx.text(obj).split()
        if not toks or toks[0] not in ("select", "sel"):
            continue
        if "@fuzzy" in toks:
            continue
        has_float = any("." in a and _is_numeric_literal(a) for a in toks[1:] if not a.startswith("@"))
        if not has_float:
            continue
        for i, conn in ctx.incoming.get(oid, []):
            src = ctx.objects.get(conn[0])
            if not isinstance(src, dict):
                continue
            smc = ctx.maxclass(src)
            if smc in _FLOAT_UI_SOURCES or (smc.startswith("live.") and is_interactive(smc)):
                out.append(Violation(
                    "select-float-needs-fuzzy", WARNING, oid,
                    f"'{ctx.text(obj)}' compares floats but is fed by '{conn[0]}' "
                    f"({smc}), whose values arrive as 0.1499999… and never match "
                    f"exactly. Add `@fuzzy 0.001` (or compare on ints).",
                    "MAX_PATCHING.md > select with float values from UI requires @fuzzy",
                ))
                break
    return out


def rule_script_object_declarations(ctx: SpecContext) -> list:
    """(k) `jsui`/`v8ui` need `attrs.filename`; `v8`/`js` need declared I/O.

    (1) A `jsui`/`v8ui` object without a non-empty `attrs.filename` is unlinked
        and non-functional; `jsui foo.js` as a newobj is the same mistake.
    (2) A `v8`/`js` newobj without `inlets`, `outlets`, and `outlettype` is
        built on the converter's defaults, which are not the script's.
    (3) A `v8`/`js` newobj that names a script but does not ask for `@embed 1`
        (and carries no `attrs.textfile` with embed 1) runs only while the .js
        sits next to the patch — a red box the moment the file does not travel.
    Source: SPEC_REFERENCE.md > v8 / JavaScript Objects (jsui objects; "always
    override inlets, outlets, and outlettype"); CLAUDE.md > Embed the Script in
    Every v8 Box.
    """
    if ctx.native:
        return []   # a derived spec carries neither attrs.filename nor declared I/O
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        mc = ctx.maxclass(obj)
        toks = ctx.text(obj).split()
        if mc in ("jsui", "v8ui"):
            fn = ctx.attrs(obj).get("filename")
            if not (isinstance(fn, str) and fn.strip()):
                out.append(Violation(
                    "script-filename-missing", WARNING, oid,
                    f"'{oid}' is a {mc} with no attrs.filename — the object is "
                    f"unlinked and draws nothing. Set attrs: {{\"filename\": \"script.js\"}}.",
                    "SPEC_REFERENCE.md > v8 / JavaScript Objects",
                ))
        elif mc == "newobj" and toks and toks[0] in ("jsui", "v8ui"):
            out.append(Violation(
                "script-filename-missing", WARNING, oid,
                f"'{oid}' is written as newobj \"{ctx.text(obj)}\". Use type "
                f"\"{toks[0]}\" with attrs.filename instead — the filename attribute is "
                f"how Max links the script.",
                "SPEC_REFERENCE.md > v8 / JavaScript Objects",
            ))
        elif mc == "newobj" and toks and toks[0] in ("v8", "js"):
            missing = [k for k in ("inlets", "outlets", "outlettype") if k not in obj]
            if missing:
                out.append(Violation(
                    "script-io-undeclared", WARNING, oid,
                    f"'{oid}' ({ctx.text(obj)}) does not declare {', '.join(missing)}. "
                    f"Script objects are not in the converter's I/O table — declare "
                    f"all three to match the script's `inlets` / `outlets`.",
                    "SPEC_REFERENCE.md > v8 / JavaScript Objects",
                ))
            script = next((t for t in toks[1:] if not t.startswith("@")), None)
            embed_tok = "1" if "@embed" not in toks else toks[toks.index("@embed") + 1:][:1] or ["1"]
            asks = "@embed" in toks and embed_tok[0] not in ("0", "0.")
            tf = ctx.attrs(obj).get("textfile")
            carried = isinstance(tf, dict) and tf.get("embed") == 1
            if script and not asks and not carried:
                out.append(Violation(
                    "script-not-embedded", WARNING, oid,
                    f"'{oid}' ({ctx.text(obj)}) loads {script} from disk only. Add "
                    f"`@embed 1` to the box text so the converter stores the source in "
                    f"the patch and the box still runs when the .js does not travel with it.",
                    "CLAUDE.md > Embed the Script in Every v8 Box",
                ))
            elif script and not _has_embed_feeder(ctx, oid):
                # Verified in Max 9 (2026-09-10): with the .js present, a save
                # drops the stored copy unless `embed 1` reached the box as a
                # message after load; the creation attribute alone is overridden.
                out.append(Violation(
                    "script-embed-not-kept", WARNING, oid,
                    f"'{oid}' ({ctx.text(obj)}) has no [loadmess embed 1] feeding it. "
                    f"Max drops the stored script on save while the .js is present unless "
                    f"`embed 1` arrives as a message after load — add a [loadmess embed 1] "
                    f"object wired to this box's left inlet.",
                    "CLAUDE.md > Embed the Script in Every v8 Box",
                ))
    return out


def _has_embed_feeder(ctx: SpecContext, oid: str) -> bool:
    """True when a [loadmess embed 1] or an `embed 1` message box feeds oid."""
    for conn in ctx.spec.get("connections") or []:
        if not (isinstance(conn, (list, tuple)) and len(conn) >= 4 and conn[2] == oid):
            continue
        src = ctx.objects.get(conn[0])
        if not isinstance(src, dict):
            continue
        toks = ctx.text(src).split()
        mc = ctx.maxclass(src)
        if (mc == "newobj" and toks[:3] == ["loadmess", "embed", "1"]) or \
           (mc == "message" and toks[:2] == ["embed", "1"]):
            return True
    return False


# {class: [(toggle_attr, [required companions])]} — an enable switch without
# its bounds is a no-op.
_ATTR_GROUPS = {
    "jit.matrix": [("usedstdim", ["dstdimstart", "dstdimend"]),
                   ("usesrcdim", ["srcdimstart", "srcdimend"])],
}
# {class: [(attr, required_value)]} — creation attributes that must be present.
_REQUIRED_ATTRS = {
    "jit.world": [("enable", "1")],
}


def rule_attribute_group_incomplete(ctx: SpecContext) -> list:
    """(o) A toggle attribute without its companions; `jit.world` without `@enable 1`.

    Attributes are read from `attrs` and from `@name value` tokens in `text`.
    Source: SPEC_REFERENCE.md > Attribute groups: an enable switch without its
    bounds is a no-op; MAX_PATCHING.md > Max Patching Knowledge > jit.world
    @enable defaults to 0.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        cls = _classname(ctx, obj)
        for toggle, companions in _ATTR_GROUPS.get(cls, []):
            v = _text_attr(obj, toggle)
            if v is None or str(v) in ("0", "0.0"):
                continue
            missing = [c for c in companions if _text_attr(obj, c) is None]
            if missing:
                out.append(Violation(
                    "attribute-group-incomplete", WARNING, oid,
                    f"'{oid}' sets @{toggle} without {', '.join('@' + c for c in missing)} "
                    f"— the switch is on but its bounds are unset, so it does nothing.",
                    "SPEC_REFERENCE.md > Attribute groups: an enable switch without its bounds is a no-op",
                ))
        for attr, want in _REQUIRED_ATTRS.get(cls, []):
            v = _text_attr(obj, attr)
            if v is None or str(v).rstrip("0").rstrip(".") != want:
                out.append(Violation(
                    "attribute-required", WARNING, oid,
                    f"'{oid}' ({cls}) does not set @{attr} {want} as a creation "
                    f"attribute — it defaults off and renders nothing until enabled.",
                    "MAX_PATCHING.md > jit.world @enable defaults to 0",
                ))
    return out


_KSLIDER_OFFSET_DEFAULT = 36
_KSLIDER_RANGE_DEFAULT = 48


def rule_kslider_demo_range(ctx: SpecContext) -> list:
    """(v) Messages into a kslider must address keys it displays.

    Displayed range is [offset, offset + range) from attrs (defaults 36 / 48,
    SPEC_REFERENCE.md > kslider). For each `message` wired to inlet 0:
    `chord p v p v …` → every p; `set n` → n; a bare int → itself. `$N`
    templates cannot be evaluated and are skipped.
    Source: CLAUDE.md > Demos, Help Files, and Test Patches Must Demonstrate
    Functionality Visibly ("every demo input must address currently-visible state").
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "kslider":
            continue
        try:
            offset = int(float(_text_attr(obj, "offset") or _KSLIDER_OFFSET_DEFAULT))
            rng = int(float(_text_attr(obj, "range") or _KSLIDER_RANGE_DEFAULT))
        except (TypeError, ValueError):
            continue
        lo, hi = offset, offset + rng
        for i, conn in ctx.incoming.get(oid, []):
            if conn[3] != 0:
                continue
            src = ctx.objects.get(conn[0])
            if not isinstance(src, dict) or ctx.maxclass(src) != "message":
                continue
            text = ctx.text(src)
            if _has_template(text):
                continue
            toks = text.split()
            notes = []
            if toks and toks[0] == "chord":
                notes = toks[1::2]
            elif toks and toks[0] == "set" and len(toks) > 1:
                notes = [toks[1]]
            elif len(toks) == 1:
                notes = toks
            bad = []
            for n in notes:
                try:
                    v = int(float(n))
                except (TypeError, ValueError):
                    continue
                if not (lo <= v < hi):
                    bad.append(v)
            if bad:
                out.append(Violation(
                    "kslider-demo-range", WARNING, conn[0],
                    f"message '{conn[0]}' (\"{text}\") sends note(s) {bad} to kslider "
                    f"'{oid}', which displays {lo}–{hi - 1}. The message fires but "
                    f"lands off-screen and reads as dead. Use notes in range, or set "
                    f"@offset / @range to include them.",
                    "CLAUDE.md > Demos, Help Files, and Test Patches Must Demonstrate Functionality Visibly",
                ))
    return out


def rule_jit_matrix_fan_in(ctx: SpecContext, resolver) -> list:
    """(n) Two jit_matrix sources fanned into one inlet is a structural conflict.

    Resolver-gated: an outlet's type comes from the spec's own `outlettype`
    override, else `resolver.resolve_object(name)["outlettype"]`. Groups
    connections by (destination, inlet) and flags any group with two or more
    distinct matrix sources. A resolver that returns no outlet types → no-op.
    Source: MAX_PATCHING.md > Two jit_matrix sources fanned into one inlet is
    a structural conflict.
    """
    if resolver is None:
        return []
    groups: dict = {}
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        src = ctx.objects.get(conn[0])
        if not isinstance(src, dict):
            continue
        types = src.get("outlettype")
        if not isinstance(types, list):
            info = resolver.resolve_object(_classname(ctx, src))
            types = info.get("outlettype") if isinstance(info, dict) else None
        if not isinstance(types, list):
            continue
        so = conn[1]
        if not (isinstance(so, int) and 0 <= so < len(types)):
            continue
        if types[so] != "jit_matrix":
            continue
        groups.setdefault((conn[2], conn[3]), []).append((i, conn[0]))
    out = []
    for (dst, inlet), members in groups.items():
        srcs = sorted({s for _i, s in members})
        if len(srcs) >= 2:
            out.append(Violation(
                "jit-matrix-fan-in", WARNING, f"{dst}[{inlet}]",
                f"{len(srcs)} jit_matrix sources ({', '.join(srcs)}) fan into inlet "
                f"{inlet} of '{dst}'. Give each matrix source its own inlet and "
                f"dispatch on `inlet` in JS.",
                "MAX_PATCHING.md > Two jit_matrix sources fanned into one inlet is a structural conflict",
            ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# STYLE rules, second family — patching-view geometry (TASK_QUEUE item 13
# (c)–(g)). All read pos/size via SpecContext.box_rect and skip any object
# without an explicit `pos`.
# ───────────────────────────────────────────────────────────────────────────

_ROW_PX = 55.0            # one layout row (spec2maxpat Y_SPACING); cords shorter than this are "local"
_CORD_WIDEN_PX = 3.0
_CORD_MIN_OVERLAP_AREA = 20.0
_CORD_TOO_SHORT_PX = 15.0


_PORT_INSET_PX = 19.0   # port centre to box edge, both sides; measured by John in Max 2026-09-16


def _port_x(rect, index, count) -> float:
    """x of the centre of outlet/inlet `index` on a box with `count` ports.

    Max centres the first port 19 px in from the box's left edge and the last
    port 19 px in from its right edge, and spreads the rest evenly between them.
    So port 0 is at x + 19 whatever the count. With the count unknown, a port
    other than 0 falls back to the centre. A box narrower than two insets is not
    measured; its ports are clamped to the centre (an assumption, not checked).
    """
    x, w = rect[0], rect[2]
    inset = min(_PORT_INSET_PX, w / 2.0)
    if index == 0:
        return x + inset
    if isinstance(count, int) and count > 1 and isinstance(index, int) and 0 < index < count:
        return x + inset + index * (w - 2 * inset) / (count - 1)
    return x + w / 2.0


def _cord_geometry(ctx: SpecContext, conn):
    """(src_rect, dst_rect, cord_rect) for a positioned connection, else None."""
    if not isinstance(conn, (list, tuple)) or len(conn) < 4:
        return None
    s, d = ctx.objects.get(conn[0]), ctx.objects.get(conn[2])
    sr, dr = ctx.box_rect(s), ctx.box_rect(d)
    if sr is None or dr is None:
        return None
    x0 = _port_x(sr, conn[1], s.get("outlets") if isinstance(s, dict) else None)
    x1 = _port_x(dr, conn[3], d.get("inlets") if isinstance(d, dict) else None)
    y0, y1 = sr[1] + sr[3], dr[1]
    left, right = min(x0, x1) - _CORD_WIDEN_PX, max(x0, x1) + _CORD_WIDEN_PX
    top, bottom = min(y0, y1), max(y0, y1)
    return sr, dr, [left, top, right - left, bottom - top]


def _cord_crossings(ctx: SpecContext, conn, rects) -> tuple:
    """(crossed box ids, whether they are all comments) for one cord.

    Local cords — a vertical span under one row — and cords without geometry
    cross nothing. Shared by cord-crosses-unrelated-box and cord-long, so a
    cord is reported by exactly one of them.
    """
    g = _cord_geometry(ctx, conn)
    if g is None:
        return [], True
    _sr, _dr, cord = g
    if cord[3] < _ROW_PX:
        return [], True
    crossed, only_comments = [], True
    for oid, r in rects.items():
        if r is None or oid in (conn[0], conn[2]):
            continue
        if ctx.maxclass(ctx.objects[oid]) == "panel":
            continue  # background z-order; cords run over panels by design
        ox = min(cord[0] + cord[2], r[0] + r[2]) - max(cord[0], r[0])
        oy = min(cord[1] + cord[3], r[1] + r[3]) - max(cord[1], r[1])
        if ox > 0 and oy > 0 and ox * oy >= _CORD_MIN_OVERLAP_AREA:
            crossed.append(oid)
            if ctx.maxclass(ctx.objects[oid]) != "comment":
                only_comments = False
    return crossed, only_comments


def rule_cord_crosses_unrelated_box(ctx: SpecContext) -> list:
    """(c) A cord that runs past boxes it does not connect should be an s/r pair.

    The axis-aligned rectangle spanned by a cord's two endpoints (widened by a
    few px) must not intersect any third box by more than a minimum area.
    Cords with a vertical span under one row (~55 px) are local and skipped.
    Crossing only a comment is reported but said to be milder.
    Source: MAX_PATCHING.md > A cord that runs past objects it does not
    connect becomes s / r (rule of thumb; STYLE).
    """
    out = []
    rects = {oid: ctx.box_rect(o) for oid, o in ctx.objects.items()}
    for i, conn in enumerate(ctx.connections):
        crossed, only_comments = _cord_crossings(ctx, conn, rects)
        if crossed:
            note = " (only comments — milder)" if only_comments else ""
            out.append(Violation(
                "cord-crosses-unrelated-box", STYLE, f"connections[{i}]",
                f"Cord {conn[0]}:{conn[1]} → {conn[2]}:{conn[3]} runs through "
                f"{', '.join(crossed)}{note}. Replace it with [s NAME] under "
                f"'{conn[0]}' and [r NAME] above '{conn[2]}', or re-flow the layout.",
                "MAX_PATCHING.md > A cord that runs past objects it does not connect becomes s / r",
            ))
    return out


def rule_feeder_below_target(ctx: SpecContext) -> list:
    """(d) An input (message box or UI control) sits above the object it feeds.

    Flags a `message` or interactive source drawn below its destination, so the
    cord runs upward and reads as broken. A two-box cycle (the destination also
    feeds the source) is exempt — one of those cords must go up.
    Source: MAX_PATCHING.md > Signal flow runs top-to-bottom — inputs above,
    outputs below.
    """
    out = []
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        s, d = ctx.objects.get(conn[0]), ctx.objects.get(conn[2])
        if not isinstance(s, dict) or not isinstance(d, dict):
            continue
        smc = ctx.maxclass(s)
        if not (smc == "message" or is_interactive(smc)):
            continue
        sr, dr = ctx.box_rect(s), ctx.box_rect(d)
        if sr is None or dr is None or sr[1] <= dr[1]:
            continue
        if any(c[2] == conn[0] for _j, c in ctx.outgoing.get(conn[2], [])):
            continue  # feedback pair
        out.append(Violation(
            "feeder-below-target", STYLE, f"connections[{i}]",
            f"'{conn[0]}' ({smc}) at y={sr[1]:.0f} feeds '{conn[2]}' at y={dr[1]:.0f} "
            f"— the cord runs upward. Move the feeder above its target.",
            "MAX_PATCHING.md > Signal flow runs top-to-bottom — inputs above, outputs below",
        ))
    return out


def rule_fanout_order(ctx: SpecContext) -> list:
    """(e) Destinations of a multi-outlet fan-out sit in firing order.

    Max fires outlets right to left, so the destination fed by a higher-index
    outlet should sit further right. Equal x counts as satisfied; when one
    outlet feeds several boxes, the leftmost is compared. `trigger`/`t` is
    named in the message since order is its whole purpose.
    Source: MAX_PATCHING.md > Lay fan-out destinations out right-to-left, in
    execution order.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        per_outlet: dict = {}
        for _i, conn in ctx.outgoing.get(oid, []):
            d = ctx.objects.get(conn[2])
            dr = ctx.box_rect(d)
            if dr is None or not isinstance(conn[1], int):
                continue
            cx = dr[0] + dr[2] / 2.0
            cur = per_outlet.get(conn[1])
            if cur is None or cx < cur[0]:
                per_outlet[conn[1]] = (cx, conn[2])
        if len(per_outlet) < 2:
            continue
        outlets = sorted(per_outlet)
        for a in range(len(outlets)):
            for b in range(a + 1, len(outlets)):
                oa, ob = outlets[a], outlets[b]
                xa, da = per_outlet[oa]
                xb, db = per_outlet[ob]
                if xa > xb:
                    name = ctx.text(obj).split()[0] if ctx.text(obj).split() else ctx.maxclass(obj)
                    is_t = name in ("trigger", "t")
                    out.append(Violation(
                        "fanout-order", STYLE, oid,
                        f"'{oid}' ({name}) outlet {oa} → '{da}' sits RIGHT of outlet "
                        f"{ob} → '{db}', but Max fires outlet {ob} first. Swap them so "
                        f"destinations read right-to-left in execution order"
                        f"{' — on a trigger the order is the whole point' if is_t else ''}.",
                        "MAX_PATCHING.md > Lay fan-out destinations out right-to-left, in execution order",
                    ))
                    break
    return out


def rule_cord_too_short(ctx: SpecContext) -> list:
    """(f) Leave room under a box for its cords to read as cords.

    Vertical clearance `dst.y - (src.y + src.h)` that is positive but under
    15 px is a cord too short to see or click; the doc recommends ~30 px.
    Negative clearance is (d)'s or the overlap rule's territory.

    Exempt: a straight vertical drop — source and destination left edges
    within a few px — inside a column. A vertical cord between two stacked
    boxes reads as "this feeds that" at any length; the clearance is needed
    for cords that travel sideways. John's compact parameter columns
    (2026-09-08: init message → flonum → parameter message, 8 px apart)
    are the case.
    Source: MAX_PATCHING.md > Leave enough vertical space under a box for its
    cords to read as cords.
    """
    out = []
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        sr = ctx.box_rect(ctx.objects.get(conn[0]))
        dr = ctx.box_rect(ctx.objects.get(conn[2]))
        if sr is None or dr is None:
            continue
        gap = dr[1] - (sr[1] + sr[3])
        if abs(dr[0] - sr[0]) <= _COLUMN_ALIGN_PX and conn[1] == 0 and conn[3] == 0:
            continue  # a straight drop within a column: readable at any length
        if 0 < gap < _CORD_TOO_SHORT_PX:
            out.append(Violation(
                "cord-too-short", STYLE, f"connections[{i}]",
                f"Only {gap:.0f} px between the bottom of '{conn[0]}' and the top of "
                f"'{conn[2]}' — the cord is barely visible. Leave ~30 px.",
                "MAX_PATCHING.md > Leave enough vertical space under a box for its cords to read as cords",
            ))
    return out


def rule_button_side_tap(ctx: SpecContext) -> list:
    """(g) A pass-through indicator button belongs inline on the cord.

    If two or more cords leave one outlet and one ends at a `button` with no
    outgoing connections, that button is a side tap — wire it inline instead.
    A presented button is an operator control and is exempt.
    Source: MAX_PATCHING.md > Buttons used as pass-through indicators are
    inline on the cord, not on a side tap.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        by_outlet: dict = {}
        for i, conn in ctx.outgoing.get(oid, []):
            by_outlet.setdefault(conn[1], []).append((i, conn))
        for outlet, cords in by_outlet.items():
            if len(cords) < 2:
                continue
            for i, conn in cords:
                d = ctx.objects.get(conn[2])
                if (isinstance(d, dict) and ctx.maxclass(d) == "button"
                        and not ctx.outgoing.get(conn[2]) and not ctx.has_presentation(d)):
                    others = [c[2] for _j, c in cords if c is not conn]
                    out.append(Violation(
                        "button-side-tap", STYLE, f"connections[{i}]",
                        f"button '{conn[2]}' dead-ends a side tap from '{oid}' outlet "
                        f"{outlet}. Wire it inline instead: {oid} → {conn[2]} → "
                        f"{', '.join(others)}.",
                        "MAX_PATCHING.md > Buttons used as pass-through indicators are inline on the cord",
                    ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# Whole-patch layout — folded in from c2m_layout.py (2026-09-16, at John's
# direction). c2m_layout was a separate report module that judged the same
# boxes this file does; its checks now live here so one mechanism judges a
# layout. Not carried over: its pure metrics (bounding box, density, alignment
# groups), which have no pass/fail, and its presentation overlap and
# orphan-label checks, which already existed as presentation-overlap and
# control-unlabelled.
# ───────────────────────────────────────────────────────────────────────────

_SPEC_EMBED_ID = "obj-spec-embed"   # storage in the shape of a box — never laid out
_RECEIVE_CLASSES = frozenset({"r", "receive", "r~", "receive~"})
_LONG_CORD_PX = 600.0               # centre to centre; c2m_layout's threshold
_GRID_CANDIDATES = (15, 10, 5)      # coarsest first; Max's own default grid is 15
_GRID_FIT_RATIO = 0.8               # share of boxes that must sit on a grid for it to count
_GRID_MIN_BOXES = 5                 # fewer boxes than this cannot establish a grid
_GRID_TOL_PX = 0.5


def _laid_out(ctx: SpecContext, oid, obj) -> bool:
    """A box the reader actually sees placed: not the spec embed, not hidden
    (runtime-state boxes such as tutorial highlights overlap by design)."""
    return isinstance(obj, dict) and oid != _SPEC_EMBED_ID and not ctx.is_hidden(obj)


def rule_box_too_narrow(ctx: SpecContext) -> list:
    """An object box narrower than 24 + 15 px per port crowds its ports.

    Only boxes with an explicit `size` and a declared inlet or outlet count can
    be judged (a spec without `size` is widened by convert). Convert widens a
    narrow `size` itself; when editing an existing patch, widen the box.
    Source: MAX_PATCHING.md > Give every port room.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        size = obj.get("size")
        need = _min_object_box_width(obj)
        if need is None or not isinstance(size, (list, tuple)) or not size:
            continue
        try:
            w = float(size[0])
        except (TypeError, ValueError):
            continue
        if w < need:
            out.append(Violation(
                "box-too-narrow", STYLE, oid,
                f"'{oid}' ({ctx.text(obj).split()[0] if ctx.text(obj).split() else 'newobj'}) "
                f"is {w:.0f} px wide; with its ports it needs at least {need} px. Widen it.",
                "MAX_PATCHING.md > Give every port room",
            ))
    return out


def rule_patching_overlap(ctx: SpecContext) -> list:
    """Boxes in the patching view must not intersect.

    A box drawn over another hides its text, and a cord into a covered inlet
    cannot be seen or clicked. Pairwise intersection over every positioned box,
    beyond a 1 px tolerance. Exempt: backdrops (panel, fpic), hidden boxes, the
    spec embed, and a transparent button laid over the comment it makes
    clickable. The patching-view twin of presentation-overlap.
    Source: MAX_PATCHING.md > Boxes in the patching view do not overlap.
    """
    boxes = []
    for oid, obj in ctx.objects.items():
        if not _laid_out(ctx, oid, obj) or ctx.maxclass(obj) in _BACKDROP_CLASSES:
            continue
        r = ctx.box_rect(obj)
        if r is not None:
            boxes.append((oid, r))
    out = []
    for i in range(len(boxes)):
        for j in range(i + 1, len(boxes)):
            (a_id, a), (b_id, b) = boxes[i], boxes[j]
            if _click_target_over_label(ctx, ctx.objects[a_id], ctx.objects[b_id]):
                continue
            depth = _rects_intersect(a, b)
            if depth:
                out.append(Violation(
                    "patching-overlap", STYLE, f"{a_id} × {b_id}",
                    f"'{a_id}' {[int(v) for v in a]} and '{b_id}' {[int(v) for v in b]} "
                    f"overlap by {depth:.0f} px in the patching view — one hides the "
                    f"other's text or ports. Move one of them clear.",
                    "MAX_PATCHING.md > Boxes in the patching view do not overlap",
                ))
    return out


def rule_long_cord(ctx: SpecContext) -> list:
    """A cord that crosses the patch is a candidate for s / r.

    Flags a cord whose endpoints' centres are more than ~600 px apart. A cord
    that also runs through unrelated boxes is left to
    cord-crosses-unrelated-box, so each cord is reported once.
    Source: MAX_PATCHING.md > A cord that runs past objects it does not
    connect becomes s / r (rule of thumb; STYLE).
    """
    out = []
    rects = {oid: ctx.box_rect(o) for oid, o in ctx.objects.items()}
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        if not isinstance(conn[0], str) or not isinstance(conn[2], str):
            continue
        sr, dr = rects.get(conn[0]), rects.get(conn[2])
        if sr is None or dr is None:
            continue
        dx = (sr[0] + sr[2] / 2.0) - (dr[0] + dr[2] / 2.0)
        dy = (sr[1] + sr[3] / 2.0) - (dr[1] + dr[3] / 2.0)
        length = (dx * dx + dy * dy) ** 0.5
        if length <= _LONG_CORD_PX:
            continue
        crossed, _only_comments = _cord_crossings(ctx, conn, rects)
        if crossed:
            continue  # cord-crosses-unrelated-box already reports this cord
        src = ctx.objects.get(conn[0])
        src = src if isinstance(src, dict) else {}
        head = (ctx.text(src).split() or [""])[0]
        head_line = f"Cord {conn[0]}:{conn[1]} → {conn[2]}:{conn[3]} runs {length:.0f} px."
        if head in _RECEIVE_CLASSES:
            # A receive exists so it can sit anywhere: moving it is the whole fix.
            advice = (f" '{conn[0]}' is already a [{head}], so it can sit anywhere — "
                      f"move it next to '{conn[2]}' and the cord becomes local.")
        else:
            types = src.get("outlettype")
            declared = (types[conn[1]] if isinstance(types, list) and isinstance(conn[1], int)
                        and 0 <= conn[1] < len(types) else "")
            # Max saves some signal outlets with a blank type (r~ does), so a
            # blank type falls back to the ~ naming convention.
            signal = declared == "signal" or (declared in ("", None) and head.endswith("~"))
            s_obj, r_obj = ("s~", "r~") if signal else ("s", "r")
            caution = (" Give each such cord its own name: senders sharing a name "
                       "sum into one receiver." if signal else "")
            advice = (f" At that length the reader loses which two boxes it joins: put "
                      f"[{s_obj} NAME] under '{conn[0]}' and [{r_obj} NAME] above "
                      f"'{conn[2]}', or move the two boxes closer.{caution}")
        out.append(Violation(
            "cord-long", STYLE, f"connections[{i}]",
            head_line + advice,
            "MAX_PATCHING.md > A cord that runs past objects it does not connect becomes s / r",
        ))
    return out


def rule_box_off_canvas(ctx: SpecContext) -> list:
    """Every box of the view the patch opens in fits its window.

    The window is the spec's `width` × `height` (convert's default 800 × 600).
    A patch with any presented box opens in presentation — convert sets
    `openinpresentation` then — so presented boxes are checked against the
    window and a miss is a WARNING: the operator opens the patch and a control
    is cut off. Otherwise the patching view opens, and a miss is STYLE. The
    view the patch does not open in may scroll freely.
    Source: MAX_PATCHING.md > Max Patching Knowledge ("Set patcher width and
    height large enough to contain all objects without scrolling").
    """
    try:
        win_w = float(ctx.spec.get("width", 800))
        win_h = float(ctx.spec.get("height", 600))
    except (TypeError, ValueError):
        return []
    presented = [(oid, o) for oid, o in ctx.objects.items()
                 if _laid_out(ctx, oid, o) and ctx.has_presentation(o)]
    if presented:
        view, severity = "presentation", WARNING
        rects = [(oid, ctx.pres_rect(o)) for oid, o in presented]
    else:
        view, severity = "patching", STYLE
        rects = [(oid, ctx.box_rect(o)) for oid, o in ctx.objects.items() if _laid_out(ctx, oid, o)]
    rects = [(oid, r) for oid, r in rects if r is not None]
    past = [oid for oid, r in rects if r[0] + r[2] > win_w or r[1] + r[3] > win_h]
    before = [oid for oid, r in rects if r[0] < 0 or r[1] < 0]
    if not past and not before:
        return []
    # One finding per patch: a window too small is one cause, however many
    # boxes it cuts off, and the useful number is the size that fits them all.
    need_w = max(r[0] + r[2] for _oid, r in rects)
    need_h = max(r[1] + r[3] for _oid, r in rects)
    parts = []
    if past:
        sample = ", ".join(past[:4]) + ("…" if len(past) > 4 else "")
        parts.append(
            f"{len(past)} box(es) of the {view} view extend past its {int(win_w)} × "
            f"{int(win_h)} window ({sample}); the {view} view needs about "
            f"{int(max(need_w, win_w))} × {int(max(need_h, win_h))}. Grow the spec's "
            f"width / height to that, or bring the boxes in")
    if before:
        sample = ", ".join(before[:4]) + ("…" if len(before) > 4 else "")
        parts.append(
            f"{len(before)} box(es) start left of or above the window's origin "
            f"({sample}), which no window size reveals — move them in")
    return [Violation(
        "box-off-canvas", severity, "patcher",
        "; ".join(parts) + f". This is the view the patch opens in, so the "
        f"{'operator' if view == 'presentation' else 'reader'} has to scroll to find them.",
        "MAX_PATCHING.md > Max Patching Knowledge — patcher width and height contain all objects",
    )]


def rule_off_grid(ctx: SpecContext) -> list:
    """A box off the grid the rest of the patch uses is a slip.

    Detects the coarsest grid (15, 10 or 5 px) that at least 80% of positioned
    boxes sit on — at least five of them — and flags the ones that do not.
    When no grid fits there is nothing to hold boxes to and the rule is silent.
    Comments are left out entirely: a label is deliberately offset to
    compensate for its text padding, which is an observed-good pattern
    (CLAUDE.md > Modify, Don't Rebuild). Patching view only.
    Source: MAX_PATCHING.md > Keep boxes on the grid the patch already uses.
    """
    pts = []
    for oid, obj in ctx.objects.items():
        if not _laid_out(ctx, oid, obj) or ctx.maxclass(obj) == "comment":
            continue
        r = ctx.box_rect(obj)
        if r is not None:
            pts.append((oid, r[0], r[1]))
    if len(pts) < _GRID_MIN_BOXES:
        return []

    def on(v, step):
        return abs(v - round(v / step) * step) < _GRID_TOL_PX

    for step in _GRID_CANDIDATES:
        n_on = sum(1 for _oid, x, y in pts if on(x, step) and on(y, step))
        if n_on / len(pts) >= _GRID_FIT_RATIO:
            break
    else:
        return []
    out = []
    for oid, x, y in pts:
        if on(x, step) and on(y, step):
            continue
        nx, ny = round(x / step) * step, round(y / step) * step
        out.append(Violation(
            "off-grid", STYLE, oid,
            f"'{oid}' sits at ({x:g}, {y:g}), while {n_on} of {len(pts)} boxes in "
            f"this patch sit on a {step} px grid. Move it to ({nx:g}, {ny:g}).",
            "MAX_PATCHING.md > Keep boxes on the grid the patch already uses",
        ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# STYLE rules, third family — preferred objects and initialization nudges
# (TASK_QUEUE item 13 (j), (p), (q), (t)).
# ───────────────────────────────────────────────────────────────────────────

# first_token -> (replacement, rule id, source). One table, one mechanism;
# the js row keeps its historical rule id.
_PREFERRED_OBJECTS = {
    "js":       ("v8", "prefer-v8",
                 "CLAUDE.md > Preferred Objects (JS / scripting)"),
    "pack":     ("join", "preferred-object",
                 "CLAUDE.md > Prefer the Object That States Its Behavior in an Attribute"),
    "pak":      ("join @triggers -1", "preferred-object",
                 "CLAUDE.md > Prefer the Object That States Its Behavior in an Attribute"),
    "unpack":   ("unjoin (n+1 outlets — the arg counts groups)", "preferred-object",
                 "CLAUDE.md > Prefer the Object That States Its Behavior in an Attribute"),
    "send":     ("s", "preferred-object", "MAX_PATCHING.md > Write send / receive in their short forms"),
    "receive":  ("r", "preferred-object", "MAX_PATCHING.md > Write send / receive in their short forms"),
    "send~":    ("s~", "preferred-object", "MAX_PATCHING.md > Write send / receive in their short forms"),
    "receive~": ("r~", "preferred-object", "MAX_PATCHING.md > Write send / receive in their short forms"),
    "adc~":     ("ezadc~", "preferred-object", "CLAUDE.md > Preferred Objects for Common Tasks"),
    "dac~":     ("ezdac~", "preferred-object", "CLAUDE.md > Preferred Objects for Common Tasks"),
    "delay~":   ("tapin~ / tapout~", "preferred-object", "CLAUDE.md > Preferred Objects for Common Tasks"),
}
# (upstream first token, downstream first token) -> replacement
_PREFERRED_CHAINS = {
    ("midiin", "midiparse"):    "notein / ctlin / bendin directly",
    ("midiformat", "midiout"):  "noteout / ctlout directly",
}


def rule_preferred_object(ctx: SpecContext) -> list:
    """(j) One table-driven nudge toward the preferred-objects table.

    Rows: pack/pak/unpack → join/unjoin (binding), send/receive long forms →
    s/r (binding), adc~/dac~ → ez*, delay~ → tapin~/tapout~, js → v8 (the old
    rule_prefer_v8, folded in). Chains: midiin→midiparse, midiformat→midiout.
    `midiformat → vst~` is correct and not flagged.
    Source: CLAUDE.md > Preferred Objects for Common Tasks (and the rows' own sections).
    """
    out = []
    first = {}
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        toks = ctx.text(obj).split()
        if not toks:
            continue
        first[oid] = toks[0]
        row = _PREFERRED_OBJECTS.get(toks[0])
        if row:
            repl, rid, src = row
            out.append(Violation(
                rid, STYLE, oid,
                f"'{oid}' uses [{toks[0]}]. Prefer [{repl}]"
                + (" for new patches (ES6+, faster) unless modifying a patch that already uses js."
                   if toks[0] == "js" else " — see the preferred-objects table."),
                src,
            ))
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        key = (first.get(conn[0]), first.get(conn[2]))
        repl = _PREFERRED_CHAINS.get(key)
        if repl:
            out.append(Violation(
                "preferred-object", STYLE, f"connections[{i}]",
                f"[{key[0]}] → [{key[1]}] chain — use {repl}.",
                "CLAUDE.md > Preferred Objects for Common Tasks",
            ))
    return out


def rule_print_needs_name(ctx: SpecContext) -> list:
    """(p) A bare `print` labels nothing in the console.
    Source: MAX_PATCHING.md > Do not grow an object's interface for monitoring
    — monitor with print <descriptive-name>."""
    out = []
    for oid, obj in ctx.objects.items():
        if isinstance(obj, dict) and ctx.maxclass(obj) == "newobj" \
                and ctx.text(obj).strip() == "print":
            out.append(Violation(
                "print-needs-name", STYLE, oid,
                f"'{oid}' is a bare [print]. Give it a name ([print HELD]) so its "
                f"console lines are tellable apart from other prints.",
                "MAX_PATCHING.md > Do not grow an object's interface for monitoring",
            ))
    return out


# UI classes whose patching-view box is legitimately content-sized.
_SIZE_ALLOWED = {
    "comment", "message", "panel", "jsui", "v8ui", "jit.pwindow", "multislider", "attrui",
    "textedit", "umenu", "jit.cellblock", "function", "filtergraph~", "kslider",
    "live.text", "live.menu", "live.tab", "playlist~", "bpatcher", "scope~",
    "spectroscope~", "matrixctrl", "pictslider", "itable", "nslider", "preset",
}


def rule_patching_size_override(ctx: SpecContext) -> list:
    """(q) Do not resize UI boxes in the patching view without reason.

    Flags `size` on an interactive / live.* class outside the content-sized
    allowlist, unless it equals the class's nominal size (a synced default);
    and any `size` at all on inlet/outlet (they are 30×30 and change shape).
    Source: MAX_PATCHING.md > Preserve each object's default box size in the
    patching view; SPEC_REFERENCE.md > Inlet and Outlet Object Sizes.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        size = obj.get("size")
        if not (isinstance(size, (list, tuple)) and len(size) >= 2):
            continue
        mc = ctx.maxclass(obj)
        if mc in ("inlet", "outlet"):
            out.append(Violation(
                "io-box-resized", STYLE, oid,
                f"{mc} '{oid}' has an explicit size {list(size[:2])}. Inlet and outlet "
                f"boxes are 30×30; another size draws the wrong shape. Remove `size`.",
                "SPEC_REFERENCE.md > Inlet and Outlet Object Sizes",
            ))
            continue
        if mc in _SIZE_ALLOWED or not is_interactive(mc):
            continue
        nominal = _NOMINAL_UI_SIZES.get(mc)
        try:
            if nominal and (int(size[0]), int(size[1])) == tuple(nominal):
                continue
        except (TypeError, ValueError):
            pass
        out.append(Violation(
            "patching-size-override", STYLE, oid,
            f"'{oid}' ({mc}) sets a patching-view size {list(size[:2])}. Keep the "
            f"default box size there; size for layout belongs in presentation_rect.",
            "MAX_PATCHING.md > Preserve each object's default box size in the patching view",
        ))
    return out


_INIT_CONTROLS = {"number", "flonum", "toggle", "dial", "slider", "umenu"}


def _creation_args(text: str) -> list:
    """Positional creation args of a box's text: the object name and every
    `@name value…` run removed (attributes may appear anywhere after the name)."""
    out, in_attr = [], False
    for tok in text.split()[1:]:
        if tok.startswith("@"):
            in_attr = True
        elif not in_attr:
            out.append(tok)
    return out


def _destinations_hold_the_value(ctx: SpecContext, oid: str) -> bool:
    """True when every cord out of `oid` lands on inlet i >= 1 of an object box
    whose creation args include an i-th value (`[+ 12]` inlet 1, `[metro 250]`
    inlet 1, `[makenote 100 200]` inlets 1 and 2). That argument is the inlet's
    initial state, so the control feeding it needs no init of its own."""
    cords = ctx.outgoing.get(oid) or []
    if not cords:
        return False
    for _i, conn in cords:
        inlet = conn[3]
        tgt = ctx.objects.get(conn[2])
        if (not isinstance(tgt, dict) or ctx.maxclass(tgt) != "newobj"
                or not isinstance(inlet, int) or inlet < 1
                or len(_creation_args(ctx.text(tgt))) < inlet):
            return False
    return True


def rule_control_init_on_load(ctx: SpecContext) -> list:
    """(t) A control with nothing feeding it has undefined state on load.

    Two cases are not reported, because the patch already has the default
    (CLAUDE.md > Don't Add an Object That Duplicates What an Object Already in
    the Patch Does): a toggle, which starts off; and a control whose every cord
    lands on an inlet that the destination's creation argument already sets.

    Weakest defensible form: any incoming cord (loadmess, loadbang → message,
    a live data source) is assumed to initialize the control. Suppressed for
    the whole scope when an `autopattr` is present (@autorestore); `live.*`
    objects save their own value and are exempt.
    Source: MAX_PATCHING.md > Every control must initialize to a known state
    on patch load.
    """
    if any(isinstance(o, dict) and ctx.maxclass(o) == "newobj"
           and ctx.text(o).split()[:1] == ["autopattr"] for o in ctx.objects.values()):
        return []
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) not in _INIT_CONTROLS:
            continue
        if ctx.incoming.get(oid):
            continue
        if ctx.maxclass(obj) == "toggle":
            continue  # starts off and sends nothing until clicked: off is its known state
        if _destinations_hold_the_value(ctx, oid):
            continue
        out.append(Violation(
            "control-init-on-load", STYLE, oid,
            f"'{oid}' ({ctx.maxclass(obj)}) has nothing feeding it, so its state on "
            f"load is whatever the file saved — undefined for the operator. Feed it "
            f"a [loadmess <default>] or a loadbang'd message, or put the scope under "
            f"an [autopattr].",
            "MAX_PATCHING.md > Every control must initialize to a known state on patch load",
        ))
    return out


def rule_declareattribute_conventions(ctx: SpecContext) -> list:
    """(u) JS-side check of declareattribute labels/styles and assist strings.

    For every jsui / v8ui / v8 / js box whose script can be found (attrs.filename
    or the second text token, resolved against ctx.base_dir), scan the file with
    claude2max_verify.jsattrs and flag: a label whose first word is not the
    attribute's first word; min 0 / max 1 with no style "onoff"; enumvals with no
    enum/enumindex style; a 4-float default with no style "rgba"; and, for v8/js,
    inlet/outlet indices with no setinletassist / setoutletassist. Silent when
    the file is not found or base_dir is unknown.
    Source: CLAUDE.md > Attribute Labels Must Begin With the Attribute's Own
    Word; > Match the Generated Control to the Attribute's Value Space;
    > What You Must Handle (v8/js inlet/outlet labeling).
    """
    if not ctx.base_dir:
        return []
    from . import jsattrs  # local import keeps rules importable without it at top level
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        mc = ctx.maxclass(obj)
        toks = ctx.text(obj).split()
        script = None
        if mc in ("jsui", "v8ui"):
            script = ctx.attrs(obj).get("filename")
        elif mc == "newobj" and toks and toks[0] in ("v8", "js") and len(toks) > 1:
            script = toks[1]
        if not isinstance(script, str) or not script.strip():
            continue
        path = jsattrs.find_script(script, ctx.base_dir)
        if path is None:
            continue
        for finding in jsattrs.check_script(path, want_assist=(mc == "newobj")):
            out.append(Violation(
                finding["rule"], WARNING, f"{oid} ({path.name})", finding["message"],
                finding["source"],
            ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# STYLE rules — convention nudges
# ───────────────────────────────────────────────────────────────────────────

def rule_allcaps_names(ctx: SpecContext) -> list:
    """Convention: user-defined names (send/receive/pv/buffer~/coll/…) ALL CAPS."""
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        toks = ctx.text(obj).split()
        if len(toks) < 2 or toks[0] not in _NAMED_FIRST_ARG:
            continue
        name = toks[1]
        if name.startswith("$") or name.startswith("#"):
            continue  # argument substitution / patcher arg — not a literal name
        if any(c.islower() for c in name) and any(c.isalpha() for c in name):
            out.append(Violation(
                "allcaps-name", STYLE, oid,
                f"'{toks[0]} {name}' — user-defined names use ALL CAPS by "
                f"convention (e.g. '{toks[0]} {name.upper()}').",
                "CLAUDE.md > Naming Convention",
            ))
    return out


# ───────────────────────────────────────────────────────────────────────────
# RESOLVER-GATED rules — the anti-guessing layer. These are the heart of "Claude
# does not know Max": they validate object names and attributes against the
# AUTHORITATIVE sources (C74 refpages + installed package library), not memory.
# They only run when a resolver is supplied (convert and the MCP tool supply one;
# standalone callers without Max installed skip them).
#
# Resolver duck type (see spec2maxpat.build_resolver):
#   resolve_object(name)        -> dict | None   (None = unknown)
#   attrs_for(name)             -> (set|None, source)
#       set = object's own refpage attrs UNION the jbox base attrs it inherits;
#       None = object has no refpage (can't enumerate the valid set)
#   messages_for(name)          -> (set|None, source)   [optional]
#       set = the names in the object's refpage methodlist; None = no refpage.
#       Optional — rule_message_resolves no-ops if the resolver lacks it.
#   abstraction_exists(name)    -> bool   (a <name>.maxpat on the search path)
# ───────────────────────────────────────────────────────────────────────────

def _classname(ctx: SpecContext, obj: dict) -> str:
    """The identifier to resolve: newobj's first token, else the maxclass."""
    mc = ctx.maxclass(obj)
    if mc == "newobj":
        toks = ctx.text(obj).split()
        return toks[0] if toks else ""
    return mc


def rule_object_resolves(ctx: SpecContext, resolver) -> list:
    """
    THE anti-guessing rule (newobj). Every newobj's object name must resolve to a
    real C74 object, an installed package external, or an abstraction on disk.
    An unresolved name is the silent-failure mode — in Max it loads as a
    missing-object red box. ERROR (blocks convert) unless the author explicitly
    sets "unverified": true.
    """
    if resolver is None:
        return []
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        if isinstance(obj.get("patcher"), dict):
            continue  # inline subpatcher — valid by construction
        name = _classname(ctx, obj)
        if not name or name in _STRUCTURAL_NEWOBJ or name.startswith(("#", "$")):
            continue
        if _is_numeric_literal(name):
            continue  # a bare number in an object box is an int/float constant
        if resolver.resolve_object(name) is not None:
            continue
        if resolver.abstraction_exists(name):
            continue
        if _is_unverified(obj):
            out.append(Violation(
                "object-unverified", STYLE, oid,
                f"'{name}' is marked \"unverified\" — shipping without refpage / "
                f"package confirmation. Make sure it is a real abstraction or "
                f"external on the Max search path.",
                "CLAUDE.md > Never Write API Names From Memory",
            ))
            continue
        out.append(Violation(
            "object-unresolved", ERROR, oid,
            f"'{name}' is not a known Max object, installed package external, or "
            f"abstraction on disk. This is the silent-failure mode — in Max it "
            f"loads as a missing-object red box. Resolve it with lookup_object(), "
            f"fix the name, or set \"unverified\": true if it is an abstraction you "
            f"have confirmed exists.",
            "CLAUDE.md > Never Write API Names From Memory",
        ))
    return out


def rule_maxclass_resolves(ctx: SpecContext, resolver) -> list:
    """
    UI / non-newobj maxclass sanity. A typo'd maxclass (e.g. 'jit.pwindo') is a
    guess too. WARNING not ERROR — refpage coverage for internal UI maxclasses
    has gaps, so this nudges rather than blocks.
    """
    if resolver is None:
        return []
    skip = {"newobj", "message", "comment", "inlet", "outlet", "subpatcher"}
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        mc = ctx.maxclass(obj)
        if mc in skip or isinstance(obj.get("patcher"), dict):
            continue
        if resolver.resolve_object(mc) is not None or _is_unverified(obj):
            continue
        out.append(Violation(
            "maxclass-unresolved", WARNING, oid,
            f"maxclass '{mc}' has no C74 refpage or package entry. It may be a "
            f"typo (e.g. 'jit.pwindo' for 'jit.pwindow') or a UI class without a "
            f"refpage. Confirm with lookup_object('{mc}').",
            "CLAUDE.md > Never Write API Names From Memory",
        ))
    return out


def rule_attribute_resolves(ctx: SpecContext, resolver) -> list:
    """
    THE anti-guessing rule (attributes) — for every object with a refpage.

    The valid set for an object is its OWN refpage attrs UNION the jbox base-class
    attrs every box inherits (textcolor, background, hidden, varname, presentation,
    …). Object refpages list only object-SPECIFIC attrs and never re-list the
    inherited ones, so the union — assembled by resolver.attrs_for — is what makes
    "absent from the valid set" actually mean "invalid" instead of "merely
    inherited". An attr outside that union is the family-resemblance trap (e.g.
    bgcolor on live.gain~, whose real color attrs are coldcolor / warmcolor / …):
    Max silently accepts and ignores it.

    Objects with no refpage (resolver.attrs_for → None) can't be enumerated, so
    their attributes are not checked here (lookup_attribute remains the tool for
    those).
    """
    if resolver is None:
        return []
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict):
            continue
        attrs = ctx.attrs(obj)
        if not attrs or _is_unverified(obj):
            continue
        cls = _classname(ctx, obj)
        if not cls or cls in _STRUCTURAL_NEWOBJ or cls in _CUSTOM_ATTR_OBJECTS:
            continue  # custom-script objects declare arbitrary attrs; can't enumerate
        valid, _src = resolver.attrs_for(cls)
        if valid is None:
            continue  # no refpage → can't enumerate the valid set; don't block
        for a in attrs:
            if a in _UNIVERSAL_BOX_ATTRS or a in valid:
                continue
            if a in _STRUCTURAL_BOX_KEYS:
                continue  # parameter block / subpatcher metadata, not an attr
            if a.startswith(_TOOL_STAMPED_ATTR_PREFIXES):
                continue  # written by Max's tooling, not by the patch author
            out.append(Violation(
                "attribute-invalid", ERROR, oid,
                f"'{a}' is not a valid attribute of '{cls}' (checked against its "
                f"refpage + inherited jbox base attrs). Max will silently accept "
                f"and ignore it — no error. Verify the real name with "
                f"list_attributes('{cls}').",
                "CLAUDE.md > Never Write API Names From Memory",
            ))
    return out


def rule_message_resolves(ctx: SpecContext, resolver) -> list:
    """
    Anti-guessing for MESSAGES (method selectors) — WARNING severity.

    A `message` box's first token is a method selector sent to whatever its outlet
    feeds at inlet 0. If that selector is absent from the target's documented
    methodlist, it MAY be an invented message Max will silently ignore (the same
    silent-failure mode as a bad attribute, on a surface nothing else checks).

    WARNING, not ERROR, on purpose: refpage methodlists are materially incomplete
    (much more than attributelists) and there is no jbox/observed backstop for
    messages, so an absence is a SUSPICION worth surfacing, not a certainty worth
    blocking the build. Firing is deliberately conservative — flag only when the
    selector is symbolic, non-universal, and absent from EVERY *checkable*
    dispatching target's methods AND attributes (an attribute name sent as a
    message sets that attribute) (resolves, has a non-empty methodlist, isn't a
    data-passthrough/router or a custom-script object). That keeps false positives
    near zero while still catching `chord`→metro-style invented messages.

    (Promotion path to ERROR: mine an observed-messages corpus from the help
    patches — message-box text traced to its target — to backstop the incomplete
    methodlists, exactly as observed-attrs backstops the attribute rule.)
    """
    if resolver is None or not hasattr(resolver, "messages_for"):
        return []
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "message":
            continue
        toks = ctx.text(obj).split()
        if not toks:
            continue
        sel = toks[0]
        if sel in _UNIVERSAL_MESSAGES or not _is_symbol_selector(sel):
            continue  # numeric / $-template / punctuation → not a named selector
        checkable = []  # (target_class, methodset) for inlet-0 dispatching targets
        for _i, conn in ctx.outgoing.get(oid, []):
            if len(conn) < 4 or conn[3] != 0:
                continue  # a selector is only interpreted at the left inlet (0)
            tgt = ctx.objects.get(conn[2])
            if not isinstance(tgt, dict):
                continue
            tcls = _classname(ctx, tgt)
            if (not tcls or tcls in _PASSTHROUGH_TARGETS or tcls.startswith("zl")
                    or tcls in _CUSTOM_ATTR_OBJECTS or _is_unverified(tgt)):
                continue
            msgs, _src = resolver.messages_for(tcls)
            if not msgs:
                continue  # no / empty methodlist → can't judge this target
            if "anything" in msgs:
                # The refpage documents an `anything` method: this object accepts
                # ANY selector by definition (button: "When any message is
                # received in the inlet…"). Not a guess — an authoritative
                # wildcard, so nothing sent here can be an invented message.
                checkable = []
                break
            # Every attribute is also settable by sending its name as a message
            # (`mix 1.` does what an attrui for `mix` does), so an attribute
            # name is documented behaviour, not a guess.
            attrs, _asrc = (resolver.attrs_for(tcls) if hasattr(resolver, "attrs_for")
                            else (None, ""))
            checkable.append((tcls, msgs | (attrs or set())))
        if not checkable or any(sel in msgs for _t, msgs in checkable):
            continue
        targets = sorted({t for t, _ in checkable})
        out.append(Violation(
            "message-unverified", WARNING, oid,
            f"message '{sel}' is not in the documented methodlist of its "
            f"target(s) [{', '.join(targets)}]. It may be an invented message Max "
            f"will silently ignore — or a real-but-undocumented one. Check the "
            f"object's messages with lookup_object('{targets[0]}') before relying "
            f"on it.",
            "CLAUDE.md > Never Write API Names From Memory",
        ))
    return out


# ── registry — order is the report order ──────────────────────────────────────
REGISTRY = [
    # errors
    rule_connection_shape,
    rule_connection_refs,
    rule_io_index_range,
    # warnings
    rule_empty_newobj,
    rule_presentation_required,
    rule_presented_controls_need_labels,
    rule_no_hidden_elements,
    rule_subpatcher_labels,
    rule_debug_marking,
    # warnings — item 13 family (2026-09-08)
    rule_presentation_overlap,
    rule_panel_background_layer,
    rule_comment_contrast,
    rule_template_on_right_inlet,
    rule_textedit_into_template,
    rule_select_float_needs_fuzzy,
    rule_script_object_declarations,
    rule_attribute_group_incomplete,
    rule_kslider_demo_range,
    rule_declareattribute_conventions,
    # style
    rule_allcaps_names,
    rule_preferred_object,
    rule_print_needs_name,
    rule_patching_size_override,
    rule_control_init_on_load,
    # style — patching-view geometry
    rule_cord_crosses_unrelated_box,
    rule_feeder_below_target,
    rule_fanout_order,
    rule_cord_too_short,
    rule_button_side_tap,
    # whole-patch layout — folded in from c2m_layout.py (2026-09-16)
    rule_patching_overlap,
    rule_box_too_narrow,
    rule_long_cord,
    rule_box_off_canvas,
    rule_off_grid,
]

# Rules that need an authoritative resolver (object/attribute/message existence).
# Run only when one is supplied. This is the anti-guessing layer — the same set
# runs at convert time, via the verify_spec tool, AND via the post-edit .maxpat
# content gate (run_resolver_rules), so all three agree on what's a guess.
RESOLVER_REGISTRY = [
    rule_object_resolves,
    rule_attribute_resolves,
    rule_message_resolves,
    rule_maxclass_resolves,
    rule_jit_matrix_fan_in,
]


# Boxes whose nested patcher holds another language (gen, RNBO), not Max. Their
# contents are not checked against Max's rules or object set. Mirrors
# spec2maxpat._FOREIGN_LANGUAGE_BOXES (this module must not import the converter).
_FOREIGN_LANGUAGE_BOXES = frozenset({
    "gen", "gen~", "jit.gen", "jit.pix", "jit.gl.pix", "jit.gl.slab", "jit.expr",
    "rnbo~",
})


def iter_spec_scopes(spec: dict, prefix: str = ""):
    """Yield (prefix, sub_spec) for a spec and every nested `patcher` sub-spec.

    The prefix is the box-id path to the scope (`tab_2/` for a subpatcher of the
    root), used to label where a finding is. gen and RNBO sub-specs are skipped.
    """
    if not isinstance(spec, dict):
        return
    yield prefix, spec
    objs = spec.get("objects")
    if not isinstance(objs, dict):
        return
    for oid, obj in objs.items():
        if not isinstance(obj, dict):
            continue
        sub = obj.get("patcher")
        if not isinstance(sub, dict) or not isinstance(sub.get("objects"), dict):
            continue
        words = (obj.get("text") or "").split()
        if words and words[0] in _FOREIGN_LANGUAGE_BOXES:
            continue
        yield from iter_spec_scopes(sub, f"{prefix}{oid}/")


def _run_rules(rules, ctx, prefix, *extra) -> list:
    out: list = []
    for rule in rules:
        try:
            found = rule(ctx, *extra) or []
        except Exception as exc:  # a buggy rule must never sink the whole check
            found = [Violation(
                "rule-crashed", STYLE, rule.__name__,
                f"Internal: rule {rule.__name__} raised {exc!r}; skipped.",
                "claude2max_verify",
            )]
        for v in found:
            if prefix:
                v.location = f"{prefix}{v.location}"
            out.append(v)
    return out


def run_resolver_rules(spec: dict, resolver) -> list:
    """Run ONLY the anti-guessing resolver rules (object / attribute / message).

    Used by the post-edit .maxpat content gate, which wants the silent-failure
    name checks without the spec-format principle warnings (presentation, labels,
    debug marking) that don't map cleanly onto a hand-edited native patch. Returns
    the same Violation objects the convert gate produces — one rule library, so
    convert and the post-edit gate flag identically. Walks every nested scope.
    """
    violations: list = []
    for prefix, scope in iter_spec_scopes(spec):
        violations.extend(_run_rules(RESOLVER_REGISTRY, SpecContext(scope), prefix, resolver))
    violations.sort(key=lambda v: (_SEV_ORDER.get(v.severity, 9), v.rule))
    return violations


def run_all(spec: dict, resolver=None, base_dir=None, native=False) -> list:
    """Run every registered rule on the spec and every nested `patcher` sub-spec,
    return violations sorted by severity.

    If ``resolver`` is supplied, the anti-guessing rules (object/attribute
    existence against C74 refpages + the package library) run too.
    ``base_dir`` (the patch's directory) lets file-reading rules resolve
    sibling scripts; None disables them. ``native`` marks a spec derived from
    a native patch's boxes (see SpecContext.native). A finding inside a
    subpatcher has its location prefixed with the box-id path (`tab_2/m5`).
    """
    violations: list = []
    for prefix, scope in iter_spec_scopes(spec):
        ctx = SpecContext(scope, base_dir=base_dir, native=native)
        violations.extend(_run_rules(REGISTRY, ctx, prefix))
        if resolver is not None:
            violations.extend(_run_rules(RESOLVER_REGISTRY, ctx, prefix, resolver))
    violations.sort(key=lambda v: (_SEV_ORDER.get(v.severity, 9), v.rule))
    return violations
