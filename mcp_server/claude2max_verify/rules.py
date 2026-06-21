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
}


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
class SpecContext:
    """Pre-computed views over a spec so rules don't each re-walk it."""

    def __init__(self, spec: dict):
        self.spec = spec if isinstance(spec, dict) else {}
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


def rule_presented_controls_need_labels(ctx: SpecContext) -> list:
    """
    Binding rule: a control worth showing is worth labelling.  Coarse check —
    if there are presented interactive controls but zero presented comment
    boxes, the presentation has no labels at all.
    """
    presented_controls = [
        oid for oid, obj in ctx.objects.items()
        if isinstance(obj, dict) and ctx.has_presentation(obj)
        and is_interactive(ctx.maxclass(obj))
    ]
    if not presented_controls:
        return []
    presented_comment = any(
        isinstance(o, dict) and ctx.maxclass(o) == "comment" and ctx.has_presentation(o)
        for o in ctx.objects.values()
    )
    if presented_comment:
        return []
    return [Violation(
        "presented-controls-need-labels", WARNING, "patcher",
        f"{len(presented_controls)} control(s) are in the presentation view but "
        f"there are no presented comment labels. Every visible control needs a "
        f"label.",
        "CLAUDE.md > Always Create a Presentation View",
    )]


def rule_hidden_box_cords_hidden(ctx: SpecContext) -> list:
    """
    Binding rule (symmetry): every patchcord touching a hidden box must itself
    be hidden. A visible cord ending in a hidden box is worse than no cord.
    """
    out = []
    for i, conn in enumerate(ctx.connections):
        if not isinstance(conn, (list, tuple)) or len(conn) < 4:
            continue
        src, dst = conn[0], conn[2]
        s_obj, d_obj = ctx.objects.get(src), ctx.objects.get(dst)
        s_hidden = isinstance(s_obj, dict) and ctx.is_hidden(s_obj)
        d_hidden = isinstance(d_obj, dict) and ctx.is_hidden(d_obj)
        if (s_hidden or d_hidden) and not ctx.conn_hidden(conn):
            which = src if s_hidden else dst
            out.append(Violation(
                "hidden-box-cord-visible", WARNING, f"connections[{i}]",
                f"Connection {src}→{dst} touches hidden box '{which}' but is not "
                f"itself hidden. Add a trailing {{\"hidden\": 1}} attrs dict to "
                f"the connection.",
                "CLAUDE.md > Always Hide Plumbing Patchcords",
            ))
    return out


def rule_redundant_message_box(ctx: SpecContext) -> list:
    """
    Binding rule: a message box that only reformats an upstream UI control's
    output is plumbing — hide it (and its cords). Detected as: a VISIBLE
    message box whose only inbound source is an interactive control and which
    forwards downstream.
    """
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "message":
            continue
        if ctx.is_hidden(obj):
            continue
        ins = ctx.incoming.get(oid, [])
        outs = ctx.outgoing.get(oid, [])
        if not ins or not outs:
            continue
        # Every inbound source is an interactive UI control?
        srcs = [ctx.objects.get(c[0]) for _i, c in ins]
        if srcs and all(
            isinstance(s, dict) and is_interactive(ctx.maxclass(s)) for s in srcs
        ):
            out.append(Violation(
                "redundant-message-box", WARNING, oid,
                f"Message box '{oid}' sits between a UI control and a consumer — "
                f"it looks like a formatter (plumbing). Set hidden:1 on it and on "
                f"its cords, unless the operator clicks it directly.",
                "CLAUDE.md > Always Hide Redundant Message Boxes",
            ))
    return out


def _check_io_labels(objects: dict, path: str, out: list) -> None:
    """Recursive: inlet/outlet boxes inside a (sub)patcher need a comment attr."""
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
        # recurse into nested patchers
        sub = obj.get("patcher")
        if isinstance(sub, dict):
            nested = sub.get("objects", {})
            if isinstance(nested, dict):
                _check_io_labels(nested, f"{path}{oid}/", out)


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


def rule_prefer_v8(ctx: SpecContext) -> list:
    """Convention: use v8, not the older js object, for new patches."""
    out = []
    for oid, obj in ctx.objects.items():
        if not isinstance(obj, dict) or ctx.maxclass(obj) != "newobj":
            continue
        toks = ctx.text(obj).split()
        if toks and toks[0] == "js":
            out.append(Violation(
                "prefer-v8", STYLE, oid,
                f"'{oid}' uses [js]. Prefer [v8] for new patches (ES6+, faster) "
                f"unless modifying a patch that already uses js.",
                "CLAUDE.md > Preferred Objects (JS / scripting)",
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
            out.append(Violation(
                "attribute-invalid", ERROR, oid,
                f"'{a}' is not a valid attribute of '{cls}' (checked against its "
                f"refpage + inherited jbox base attrs). Max will silently accept "
                f"and ignore it — no error. Verify the real name with "
                f"list_attributes('{cls}').",
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
    rule_hidden_box_cords_hidden,
    rule_redundant_message_box,
    rule_subpatcher_labels,
    rule_debug_marking,
    # style
    rule_allcaps_names,
    rule_prefer_v8,
]

# Rules that need an authoritative resolver (object/attribute existence). Run
# only when one is supplied. This is the anti-guessing layer.
RESOLVER_REGISTRY = [
    rule_object_resolves,
    rule_attribute_resolves,
    rule_maxclass_resolves,
]


def run_all(spec: dict, resolver=None) -> list:
    """Run every registered rule, return violations sorted by severity.

    If ``resolver`` is supplied, the anti-guessing rules (object/attribute
    existence against C74 refpages + the package library) run too.
    """
    ctx = SpecContext(spec)
    violations: list = []
    for rule in REGISTRY:
        try:
            violations.extend(rule(ctx) or [])
        except Exception as exc:  # a buggy rule must never sink the whole check
            violations.append(Violation(
                "rule-crashed", STYLE, rule.__name__,
                f"Internal: rule {rule.__name__} raised {exc!r}; skipped.",
                "claude2max_verify",
            ))
    if resolver is not None:
        for rule in RESOLVER_REGISTRY:
            try:
                violations.extend(rule(ctx, resolver) or [])
            except Exception as exc:
                violations.append(Violation(
                    "rule-crashed", STYLE, rule.__name__,
                    f"Internal: rule {rule.__name__} raised {exc!r}; skipped.",
                    "claude2max_verify",
                ))
    violations.sort(key=lambda v: (_SEV_ORDER.get(v.severity, 9), v.rule))
    return violations
