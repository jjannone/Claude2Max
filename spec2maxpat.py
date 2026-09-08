#!/usr/bin/env python3
"""
spec2maxpat.py — Convert a Claude2Max spec (JSON) to a .maxpat file.

Usage:
    python spec2maxpat.py convert -i spec.json -o patch.maxpat
    python spec2maxpat.py extract -i patch.maxpat -o spec.json
    python spec2maxpat.py sync   -i patch.maxpat
    python spec2maxpat.py mct    -i patch.maxpat   # → Max Compressed Text for clipboard
    python spec2maxpat.py verify patch.maxpat [dir ...] [--summary] [--json]
    cat spec.json | python spec2maxpat.py convert > patch.maxpat

Spec format:
{
  "name": "my-patch",
  "width": 800,
  "height": 600,
  "objects": {
    "metro": { "type": "newobj", "text": "metro 500" },
    "toggle": { "type": "toggle" },
    "num": { "type": "number" }
  },
  "connections": [
    ["toggle", 0, "metro", 0],
    ["metro", 0, "num", 0]
  ]
}
"""

import argparse
import collections
import copy
import json
import os
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

# ---------------------------------------------------------------------------
# Shared binding-rule checker (optional — degrades gracefully if absent).
# Lives under mcp_server/claude2max_verify; the SAME library backs the MCP
# server's verify_spec() tool, so convert-time and tool-time checks agree.
# ---------------------------------------------------------------------------
try:
    sys.path.insert(0, str(Path(__file__).resolve().parent / "mcp_server"))
    from claude2max_verify import format_report as _verify_report
    from claude2max_verify import verify_resolver_only as _verify_resolver_only
    from claude2max_verify import verify_spec as _verify_spec
except Exception:  # pragma: no cover — checker is a convenience, never required
    _verify_spec = None
    _verify_report = None
    _verify_resolver_only = None


# Universal box attributes, inherited by every box from the jbox base class.
# Source of truth at runtime is jbox.maxref.xml (parsed in _build_base_attrs);
# this is the verified fallback for when Max isn't installed. Read from
# .../docs/refpages/max-ref/jbox.maxref.xml — NOT written from memory.
_JBOX_FALLBACK_ATTRS = {
    "annotation", "background", "color", "fontface", "fontname", "fontsize",
    "hidden", "hint", "ignoreclick", "jspainterfile", "patching_rect",
    "position", "presentation", "presentation_rect", "rect", "size",
    "textcolor", "textjustification", "valuepopup", "valuepopuplabel", "varname",
}

# Max object abbreviations that have no refpage under their own name AND that
# nothing mechanical can discover — unlike operators (`/`, `&`, `>>`), which ARE
# discoverable because their refpage declares the real name in the XML root's
# `name` attribute and so are harvested by RefpageCache.name_aliases().
# These shorthands appear in no `name` attribute anywhere, so they must be
# listed. Each target was verified to resolve to a real maxref.xml.
_VERIFIED_WORD_ALIASES = {
    "t": "trigger",
    "sel": "select",
    "s": "send",
    "r": "receive",
    "b": "bangbang",
    "del": "delay",
    "j": "join",
    "i": "int",      # int.maxref.xml — name="int"; `i` is Max shorthand
    "f": "float",    # float.maxref.xml — name="float"; `f` is Max shorthand
    "v": "value",    # value.maxref.xml; `v` is Max shorthand
}


class _GateResolver:
    """Authoritative resolver passed to claude2max_verify's anti-guessing rules.

    Wraps the same sources the converter already trusts — C74 refpages
    (RefpageCache) and the curated package library (PackageObjectsCache) — plus
    an on-disk abstraction check and the refpage attribute universe. Built once
    via build_resolver(); see the duck type in claude2max_verify/rules.py.
    """

    def __init__(self, refpage, package_cache, search_dirs):
        self._rp = refpage
        self._pkg = package_cache
        self._dirs = [Path(d) for d in search_dirs if d]
        self._db_names, _db_aliases = refpage.object_db()  # Max's own object registry
        self._bundled = None                          # lazy; _bundled_abstractions()
        self._aliases = self._build_alias_map()
        self._base_attrs = self._build_base_attrs()  # jbox: inherited by every box
        self._observed = self._load_observed_attrs()  # help-corpus attr ground truth

    def _build_base_attrs(self):
        """Attributes every box inherits from the jbox base class.

        Max object refpages list only object-SPECIFIC attributes; universal box
        attributes (textcolor, background, hidden, varname, presentation, …) live
        once in jbox.maxref.xml and are inherited, not re-listed. Unioning these
        is what makes attribute validation correct for ALL objects, not just the
        few whose refpages happen to be self-contained.
        """
        r = self._rp.lookup("jbox")
        if r:
            return set(r.get("attributes", {}).keys())
        # jbox refpage absent (no Max install): fall back to the verified core set
        return set(_JBOX_FALLBACK_ATTRS)

    def _load_observed_attrs(self):
        """Load the maxhelp corpus observed-attrs map, pre-filtered.

        Applies the three integration cautions from maxhelp/maxhelp_insights.md:
        - Drop rnbo*/frozen* artifact keys (RNBO-export / freeze metadata, not user attrs)
        - Apply ≥3-box frequency floor (drops one-off noise / version cruft)
        - For no-refpage objects the observed set is a positive allowlist only;
          attrs_for() still returns None for those — the caller must not use the
          observed set to flag attrs on objects whose full attr space is unknown.
        """
        import json as _json
        observed_path = Path(__file__).resolve().parent / "maxhelp" / "maxhelp_observed_attrs.json"
        try:
            raw = _json.loads(observed_path.read_text())
            objects = raw.get("objects", {})
            result = {}
            for obj_name, data in objects.items():
                if obj_name.startswith("_"):
                    continue
                attrs = data.get("attrs", {}) if isinstance(data, dict) else {}
                filtered = {
                    k for k, v in attrs.items()
                    if v >= 3 and not k.startswith(("rnbo", "frozen"))
                }
                if filtered:
                    result[obj_name] = filtered
            return result
        except (OSError, KeyError, TypeError, _json.JSONDecodeError):
            return {}

    def _build_alias_map(self):
        """Map short/operator object names to the refpage that documents them.

        Many valid objects have no refpage under their own name: operators
        (`/` -> div.maxref.xml) and common abbreviations (`t` -> trigger).

        Operators are HARVESTED from the refpages' own `name` attribute rather
        than hand-listed — see RefpageCache.name_aliases(). A hand-maintained
        table is a drift hazard and was measurably incomplete: it carried 23
        entries and was missing `/`, `&`, `|`, `>>`, `<<`, `!-`, `!/`, `/~` and
        the whole `mc.*` operator family, which made the convert gate BLOCK
        patches using division. Harvesting yields 56 with no collisions.

        The word aliases below still need the hand-maintained table: `i`/`f`/`t`
        and friends are Max shorthand with no refpage of their own AND no
        `name` attribute pointing at them, so nothing mechanical can find them.
        They come second so a harvested (authoritative) entry always wins.
        """
        _db_names, db_aliases = self._rp.object_db()
        aliases = dict(self._rp.name_aliases())
        aliases.update(db_aliases)            # Max's own registry outranks globbing
        aliases.update(_VERIFIED_WORD_ALIASES)
        return aliases

    def resolve_object(self, name):
        r = self._rp.lookup(name)
        if r is not None:
            return {"source": "c74-refpage", "numinlets": r["numinlets"],
                    "numoutlets": r["numoutlets"], "outlettype": r["outlettype"]}
        p = self._pkg.lookup(name)
        if p is not None:
            return {"source": "package", **p}
        # Operator / abbreviation alias -> documented refpage name
        alias = self._aliases.get(name)
        if alias:
            r = self._rp.lookup(alias)
            if r is not None:
                return {"source": "c74-refpage-alias", "numinlets": r["numinlets"],
                        "numoutlets": r["numoutlets"], "outlettype": r["outlettype"]}
        # Max's own object registry (interfaces/obj-qlookup.json + package
        # max.db.json). Authoritative for EXISTENCE even when no refpage
        # documents the object — jit.gl.layer and the whole jit.mo family are
        # real objects Max instantiates but ship no refpage of their own, and
        # were being reported as invented names. I/O counts are unknown from
        # this source, so they come back as 0 and the caller falls back to its
        # own defaults; existence is the question this rule is asking.
        if name in self._db_names:
            return {"source": "max-object-db", "numinlets": 0,
                    "numoutlets": 0, "outlettype": []}
        return None

    def attrs_for(self, name):
        """Complete valid-attribute set for an object.

        Returns (set, source) where set = own refpage attrs ∪ jbox base attrs
        ∪ help-corpus observed attrs (≥3-box floor, rnbo/frozen filtered).
        Returns (None, "no-refpage") when the object has no refpage — callers
        must treat None as "can't enumerate" and NOT use the observed set to
        flag attrs on such objects (positive allowlist only for no-refpage objects).

        Mirrors the alias resolution from resolve_object() so operator abbreviations
        (`t`, `+`, `sel`, …) get their refpage attrs checked rather than skipping.
        """
        r = self._rp.lookup(name)
        if r is None:
            alias = self._aliases.get(name)
            if alias:
                r = self._rp.lookup(alias)
        if r is None:
            return None, "no-refpage"
        own = set(r.get("attributes", {}).keys())
        # Union the help-corpus observed set; keyed by the box text token (the
        # same name the spec uses), so a direct lookup on `name` is correct even
        # after alias resolution — the corpus sees the abbreviated form.
        observed = self._observed.get(name, set())
        return own | self._base_attrs | observed, "c74-refpage"

    def base_attrs(self):
        """The jbox base-class attribute set every box inherits (read-only copy).

        Public accessor so consumers (e.g. the MCP attribute tools) can label an
        attribute's provenance — "this is a universal box attr, not object-specific"
        — using the SAME set the gate validates against, with no duplicated load.
        """
        return set(self._base_attrs)

    def observed_attrs(self, name):
        """Help-corpus observed attrs for one object (≥3-box floor, filtered).

        Empty set when the object isn't in the corpus. For no-refpage objects this
        is a POSITIVE allowlist only — a non-empty return confirms an attr is real
        (seen in shipped help patches); it never licenses flagging an attr absent
        from it, since the object's full attr space is unknown.
        """
        return set(self._observed.get(name, set()))

    def messages_for(self, name):
        """Documented message (method) names for an object, from its refpage methodlist.

        Returns (set, source) where set = the names in the refpage `<methodlist>`,
        or (None, "no-refpage") when the object has no refpage. Mirrors the alias
        resolution in resolve_object so operator abbreviations get their refpage
        methods checked. NOTE: refpage methodlists are materially incomplete (more
        so than attributelists), so callers should treat a miss as a SUSPICION
        (warning), not a certainty — there is no jbox/observed backstop for
        messages the way there is for attributes.
        """
        r = self._rp.lookup(name)
        if r is None:
            alias = self._aliases.get(name)
            if alias:
                r = self._rp.lookup(alias)
        if r is None:
            return None, "no-refpage"
        return set(r.get("messages", {}).keys()), "c74-refpage"

    def healthy(self):
        """True if object resolution is actually working (a core C74 object resolves).

        Used to distinguish "gate ran and found nothing" from "gate could not run"
        (refpages missing / cache broken) — the latter must fail LOUD, not silent,
        or the whole anti-guessing guarantee silently evaporates.
        """
        return self.resolve_object("metro") is not None

    def abstraction_exists(self, name):
        for d in self._dirs:
            try:
                if (d / f"{name}.maxpat").exists():
                    return True
            except OSError:
                continue
        # Abstractions shipped INSIDE the Max install (Max.app/.../patchers/**)
        # are on Max's default search path, so a patch may reference them by bare
        # name from anywhere — M4L.bal2~, pluggo.MiscCtrl, thru and ~700 others
        # live there. Without this they read as invented names. Scanned once and
        # cached, not per-lookup.
        return name.lower() in self._bundled_abstractions()

    def _bundled_abstractions(self):
        """Lowercased names of .maxpat abstractions bundled in the Max install.

        Case-folded because Max's object lookup is case-insensitive and patches
        in the wild disagree with the file on disk (`pluggo.miscCtrl` in a patch
        vs `pluggo.MiscCtrl.maxpat` on disk). Matching case-sensitively reported
        those as invented names. Scanned once and cached, not per-lookup.
        """
        if self._bundled is not None:
            return self._bundled
        names = set()
        c74 = getattr(self._rp, "_c74", None)
        if c74 is not None:
            for root in (c74 / "patchers", c74 / "packages"):
                if not root.is_dir():
                    continue
                try:
                    for f in root.rglob("*.maxpat"):
                        names.add(f.stem.lower())
                except OSError:
                    pass
        self._bundled = names
        return names

def build_resolver(search_dirs=None):
    """Construct the authoritative resolver for the anti-guessing checks.

    Returns None if the verify library isn't importable (checker is optional).
    search_dirs are extra directories to scan for abstractions (a <name>.maxpat);
    cwd and the repo patches/ dir are always included.
    """
    if _verify_spec is None:
        return None
    dirs = [Path.cwd(), Path(__file__).resolve().parent / "patches"]
    if search_dirs:
        dirs.extend(search_dirs)
    return _GateResolver(REFPAGE_CACHE, PACKAGE_OBJECTS_CACHE, dirs)


def _gate_spec(spec, allow_unverified=False, search_dirs=None, stream=sys.stderr):
    """Validate a spec before converting and decide whether to BLOCK the build.

    Runs claude2max_verify WITH the authoritative resolver, so object names and
    attributes are checked against C74 refpages + the package library — the
    anti-guessing layer. Prints findings to stderr (stdout stays pure .maxpat).

    Returns True if convert should proceed, False if it must abort. Any `error`
    severity (unresolved object name, invalid attribute, malformed/dangling
    connection) blocks unless allow_unverified is set. Warnings/style never block.
    """
    if _verify_spec is None:
        # The checker isn't importable at all — say so LOUDLY. A silent skip here
        # means the anti-guessing guarantee has evaporated and nobody knows.
        print(
            "[verify] WARNING: anti-guessing checks are DISABLED — the "
            "claude2max_verify library could not be imported. Object/attribute/"
            "message names are NOT being verified; invented names will pass "
            "through and fail silently in Max.",
            file=stream,
        )
        return True  # converter's own ValueErrors still apply
    try:
        resolver = build_resolver(search_dirs)
        if resolver is None or not resolver.healthy():
            # Resolver couldn't initialise or can't resolve a core object (metro)
            # → C74 refpages missing / cache broken. The structural rules still
            # run, but the anti-guessing layer is blind. Fail LOUD, not silent.
            why = ("the verify library is unavailable" if resolver is None
                   else "C74 refpages were not found (resolve_object('metro') "
                        "returned None) — check the Max install path")
            print(
                f"[verify] WARNING: anti-guessing object/attribute/message checks "
                f"are DEGRADED because {why}. Names that don't exist in Max will "
                f"NOT be caught here and will fail silently. Structural checks "
                f"still apply.",
                file=stream,
            )
        result = _verify_spec(spec, resolver=resolver)
    except Exception as exc:
        # A checker bug must never block a legitimate build — but it must not pass
        # silently either, or a regression in the gate disables the gate invisibly.
        print(
            f"[verify] WARNING: the verifier raised {exc!r} and was skipped for "
            f"this build. Anti-guessing checks did NOT run. This is a bug worth "
            f"reporting; the patch was built UNVERIFIED.",
            file=stream,
        )
        return True
    if result.get("violations"):
        print("[verify] " + _verify_report(result).replace("\n", "\n[verify] "),
              file=stream)
    errors = result.get("counts", {}).get("error", 0)
    if errors and not allow_unverified:
        print(
            f"\n[verify] BLOCKED: {errors} error(s) above must be fixed before "
            f"converting. These are names/attributes/connections that do not "
            f"exist in Max and would fail silently. Resolve them (lookup_object / "
            f"list_attributes), or re-run with --allow-unverified to override.",
            file=stream,
        )
        return False
    return True


# ---------------------------------------------------------------------------
# Native .maxpat content gate — anti-guessing over a HAND-EDITED patch file.
#
# The convert gate only covers patches produced THROUGH the converter. The most
# tempting shortcut — open the .maxpat JSON and edit a box by hand — bypasses it
# entirely. gate_maxpat_file() closes that hole: it reads a native .maxpat /
# .maxhelp / .amxd, transforms each patcher scope into the spec shape the rule
# library consumes, and runs the SAME anti-guessing resolver rules (object name +
# attribute + message) the convert gate runs. Wired into a PostToolUse hook, it
# tells Claude — in-session — when a hand-edit introduced an invented name.
# ---------------------------------------------------------------------------

# Object-box classes whose nested patcher holds code in a DIFFERENT language than
# Max. Their contents must not be checked against Max's object set — see
# _iter_patcher_scopes. gen/jit.gen share the gen language (GEN_PATCHING.md,
# JIT_GEN_PATCHING.md); rnbo~ holds RNBO code.
_FOREIGN_LANGUAGE_BOXES = frozenset({
    "gen", "gen~", "jit.gen", "jit.pix", "jit.gl.pix", "jit.gl.slab", "jit.expr",
    "rnbo~",
})

# Box keys that are structural, not attributes (mirrors maxhelp/extract_observed_attrs).
_MAXPAT_STRUCTURAL_KEYS = frozenset({
    "id", "maxclass", "text", "numinlets", "numoutlets", "outlettype",
    "patching_rect", "presentation_rect", "patcher", "saved_object_attributes",
    "saved_attribute_attributes", "prototypename", "style",
})


def _load_maxpat_json(text):
    """Parse a .maxpat/.maxhelp (plain JSON) or .amxd (ampf-prefixed JSON)."""
    text = text.lstrip("﻿ \t\r\n")
    if text.startswith("{"):
        try:
            return json.loads(text)
        except json.JSONDecodeError:
            pass
    i = text.find("{")  # .amxd carries an 'ampf...' binary header before the JSON
    if i >= 0:
        try:
            obj, _ = json.JSONDecoder().raw_decode(text[i:])
            return obj
        except json.JSONDecodeError:
            return None
    return None


def _native_box_to_obj(box):
    """A native .maxpat box → the {type, text, attrs} shape the rule library reads."""
    mc = box.get("maxclass")
    if not isinstance(mc, str) or not mc:
        return None
    obj = {"type": mc}
    if box.get("text"):
        obj["text"] = box["text"]  # needed for newobj class AND message selectors
    keys = set(box.keys()) - _MAXPAT_STRUCTURAL_KEYS
    soa = box.get("saved_object_attributes")
    if isinstance(soa, dict):
        keys |= set(soa.keys())
    saa = box.get("saved_attribute_attributes")
    if isinstance(saa, dict):
        keys |= {k for k in saa if k != "valueof"}
    if keys:
        obj["attrs"] = {k: 1 for k in keys}  # rules check attr NAMES, not values
    # carry an explicit unverified flag through if the author set one
    if box.get("unverified"):
        obj["unverified"] = box["unverified"]
    return obj


def _iter_patcher_scopes(patcher):
    """Yield (objects, connections) for this patcher and every nested subpatcher.

    Each scope is independent so box ids (which repeat across subpatchers) and the
    connections that reference them stay consistent within their own scope.

    Subpatchers belonging to a NON-MAX LANGUAGE are not descended into. A `gen~`
    / `gen` / `jit.gen` / `jit.gl.pix` box holds gen code, and `rnbo~` holds RNBO
    code; both are separate languages with their own vocabularies (`history`,
    `swiz`, `clamp`, `param~`, `setparam`, …) that are NOT Max objects. Walking
    into them and checking their operators against Max's object set produced
    ~15% of all object-unresolved errors on the C74 corpus — the checker was
    reporting correct gen code as invented Max names. The boundary is the same
    one CLAUDE.md draws when it sends gen work to GEN_PATCHING.md.
    """
    objects, conns = {}, []
    for entry in patcher.get("boxes", []) or []:
        box = entry.get("box") if isinstance(entry, dict) else None
        if not isinstance(box, dict):
            continue
        bid = box.get("id")
        if bid in _SKIP_BOX_IDS:
            continue  # our own infra boxes (spec embed, title) — not user content
        # Spec-embed boxes vary by format (text.codebox @code, or an older
        # newobj/comment @text); detect by the marker, as the extractor does.
        if SPEC_MARKER_BEGIN in (box.get("code") or box.get("text") or ""):
            continue
        o = _native_box_to_obj(box)
        if bid and o:
            objects[bid] = o
        sub = box.get("patcher")
        if isinstance(sub, dict):
            text = (box.get("text") or "").strip()
            cls = text.split()[0] if text else ""
            if cls in _FOREIGN_LANGUAGE_BOXES:
                continue  # gen / RNBO code — not Max objects; see docstring
            yield from _iter_patcher_scopes(sub)
    for entry in patcher.get("lines", []) or []:
        pl = entry.get("patchline") if isinstance(entry, dict) else None
        if not isinstance(pl, dict):
            continue
        src, dst = pl.get("source"), pl.get("destination")
        if (isinstance(src, list) and len(src) >= 2
                and isinstance(dst, list) and len(dst) >= 2):
            conns.append([src[0], src[1], dst[0], dst[1]])
    yield objects, conns


def gate_maxpat_file(path, stream=sys.stderr):
    """Run the anti-guessing resolver rules over a native .maxpat/.maxhelp/.amxd file.

    Returns a result dict: {checked, ok, counts, violations, summary, report,
    [degraded], [error]}. `checked` is False when the file couldn't be parsed or
    the resolver is unavailable (anti-guessing did NOT run — reported loudly).
    """
    p = Path(path)
    blank = {"checked": False, "ok": True, "counts": {"error": 0, "warning": 0, "style": 0},
             "violations": [], "summary": "", "report": ""}
    if _verify_resolver_only is None:
        print("[c2m-gate] WARNING: verify library unavailable — hand-edited "
              ".maxpat NOT checked for invented names.", file=stream)
        return {**blank, "error": "verify-lib-unavailable"}
    try:
        text = p.read_text(encoding="utf-8", errors="replace")
    except OSError as exc:
        return {**blank, "error": f"unreadable: {exc}"}
    data = _load_maxpat_json(text)
    if not isinstance(data, dict) or not isinstance(data.get("patcher"), dict):
        return {**blank, "error": "not-a-patcher-file"}

    resolver = build_resolver([str(p.parent)])
    if resolver is None or not resolver.healthy():
        why = ("verify library unavailable" if resolver is None
               else "C74 refpages not found (resolve_object('metro') is None)")
        print(f"[c2m-gate] WARNING: anti-guessing DEGRADED — {why}. "
              f"'{p.name}' was NOT checked for invented names.", file=stream)
        return {**blank, "degraded": True, "error": why}

    all_v, counts = [], {"error": 0, "warning": 0, "style": 0}
    for objects, conns in _iter_patcher_scopes(data["patcher"]):
        if not objects:
            continue
        res = _verify_resolver_only({"objects": objects, "connections": conns}, resolver)
        all_v.extend(res["violations"])
        for k in counts:
            counts[k] += res["counts"].get(k, 0)
    ok = counts["error"] == 0 and counts["warning"] == 0
    summary = (f"{counts['error']} error(s), {counts['warning']} warning(s) — "
               f"invented names in {p.name}" if not ok
               else f"clean — no invented names in {p.name}")
    result = {"checked": True, "ok": ok, "counts": counts,
              "violations": all_v, "summary": summary}
    result["report"] = _verify_report(result) if all_v else summary
    return result


def verify_patch_file(path, resolver=None, use_resolver=True, stream=sys.stderr):
    """Run the FULL binding-rule library against a .maxpat/.maxhelp/.amxd file on disk.

    Unlike gate_maxpat_file (anti-guessing resolver rules only — deliberately
    silent on principle checks like presentation/labels that don't map cleanly
    onto an arbitrary native patch), this runs every rule in the library —
    structural + anti-guessing — and is the general "how clean is this patch"
    instrument behind the verify_patch MCP tool and the `verify` CLI command.

    Prefers the embedded Claude2Max spec when present (single scope, full
    fidelity — presentation/layout fields included). Falls back to a per-
    nested-subpatcher native-to-spec conversion (_iter_patcher_scopes) when no
    embed is found, which is the shape every C74 help patch, bundled-package
    patch, and hand-edited file is in — this is what makes the corpus sweep
    (validating rule false-positive rates against patches Claude2Max never
    touched) possible.

    resolver: pass a pre-built _GateResolver to reuse across many files in a
    sweep (building one is not free). If omitted and use_resolver is True, one
    is built fresh scoped to this file's directory. Pass use_resolver=False to
    skip the anti-guessing layer entirely and check structural rules only.

    Returns: {checked, ok, counts, violations, summary, report, mode,
              scopes_checked, [degraded], [error]}
    `mode` is "embedded-spec" or "native-scopes". `checked` is False when the
    file couldn't be parsed or the verify library is unavailable.
    """
    p = Path(path)
    blank = {"checked": False, "ok": True, "counts": {"error": 0, "warning": 0, "style": 0},
             "violations": [], "summary": "", "report": "", "mode": None, "scopes_checked": 0}
    if _verify_spec is None:
        print(f"[verify] WARNING: claude2max_verify unavailable — '{p.name}' NOT checked.",
              file=stream)
        return {**blank, "error": "verify-lib-unavailable"}
    try:
        text = p.read_text(encoding="utf-8", errors="replace")
    except OSError as exc:
        return {**blank, "error": f"unreadable: {exc}"}
    data = _load_maxpat_json(text)
    if not isinstance(data, dict) or not isinstance(data.get("patcher"), dict):
        return {**blank, "error": "not-a-patcher-file"}

    active_resolver = resolver
    degraded = False
    if use_resolver and active_resolver is None:
        active_resolver = build_resolver([str(p.parent)])
    if use_resolver and (active_resolver is None or not active_resolver.healthy()):
        why = ("verify library unavailable" if active_resolver is None
               else "C74 refpages not found (resolve_object('metro') is None)")
        print(f"[verify] WARNING: anti-guessing DEGRADED — {why}. "
              f"'{p.name}' checked WITHOUT resolver rules.", file=stream)
        active_resolver = None
        degraded = True
    if not use_resolver:
        active_resolver = None

    try:
        embedded = extract_spec(data, stream=stream)
    except SpecEmbedError as exc:
        # A corrupt embed must not abort the check — fall back to verifying the
        # patch's own boxes, which is what the file actually contains.
        print(f"[spec] WARNING: {exc} "
              f"Verifying '{p.name}' from its boxes instead of its embedded spec.",
              file=stream)
        embedded = None
    if embedded is not None:
        result = _verify_spec(embedded, resolver=active_resolver)
        result["mode"] = "embedded-spec"
        result["scopes_checked"] = 1
        result["report"] = _verify_report(result)
    else:
        all_v, counts = [], {"error": 0, "warning": 0, "style": 0}
        n_scopes = 0
        for objects, conns in _iter_patcher_scopes(data["patcher"]):
            if not objects:
                continue
            n_scopes += 1
            res = _verify_spec({"objects": objects, "connections": conns},
                                resolver=active_resolver)
            all_v.extend(res["violations"])
            for k in counts:
                counts[k] += res["counts"].get(k, 0)
        ok = counts["error"] == 0 and counts["warning"] == 0
        summary = (f"{counts['error']} error(s), {counts['warning']} warning(s), "
                   f"{counts['style']} style — {p.name} ({n_scopes} scope(s))")
        result = {"ok": ok, "counts": counts, "violations": all_v, "summary": summary,
                  "mode": "native-scopes", "scopes_checked": n_scopes}
        result["report"] = _verify_report(result) if all_v else summary
    result["checked"] = True
    if degraded:
        result["degraded"] = True
    return result


def iter_verify_targets(paths, kinds=("maxpat", "maxhelp", "amxd")):
    """Expand a list of file/directory paths into a sorted list of files to verify.

    A file path is included as-is (extension not checked — an explicit path is
    an explicit request). A directory is walked recursively for `*.<kind>` per
    the requested kinds, sorted for a deterministic sweep order.
    """
    ext_map = {"maxpat": ".maxpat", "maxhelp": ".maxhelp", "amxd": ".amxd"}
    out = []
    for raw in paths:
        p = Path(raw)
        if p.is_file():
            out.append(p)
        elif p.is_dir():
            for kind in kinds:
                ext = ext_map.get(kind)
                if ext:
                    out.extend(sorted(p.rglob(f"*{ext}")))
    return out


# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

SPEC_MARKER_BEGIN = "--- CLAUDE2MAX SPEC ---"
SPEC_MARKER_END = "--- END SPEC ---"

# Default inlet/outlet profiles per maxclass
MAXCLASS_DEFAULTS = {
    "newobj":   {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "message":  {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "comment":  {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "number":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"]},
    "flonum":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["float", "bang"]},
    "toggle":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["int"]},
    "button":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["bang"]},
    "slider":   {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "dial":     {"numinlets": 1, "numoutlets": 1, "outlettype": ["float"]},
    # kslider has 2 inlets (note / velocity) and 2 outlets (note out left,
    # velocity out right — velocity fires first). Its refpage <misc name="Output">
    # lists a single entry, so a refpage-derived count under-resolves it to 1/1.
    "kslider":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "inlet":    {"numinlets": 0, "numoutlets": 1, "outlettype": [""]},
    "outlet":   {"numinlets": 1, "numoutlets": 0, "outlettype": [""]},
    "textedit": {"numinlets": 1, "numoutlets": 4, "outlettype": ["", "int", "", ""]},
    "live.dial": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"]},
    "live.slider": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"]},
    "live.toggle": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "live.numbox": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"]},
    "live.menu": {"numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"]},
    "preset":   {"numinlets": 1, "numoutlets": 5, "outlettype": ["preset", "int", "preset", "int", ""]},
    "gswitch2": {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "multislider": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "jit.pwindow": {"numinlets": 1, "numoutlets": 2, "outlettype": ["jit_matrix", ""]},
    "gain~":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", ""]},
    "ezdac~":   {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "ezadc~":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["signal", "signal"]},
    "meter~":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["float"]},
    "scope~":   {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "number~":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", "float"]},
    "live.gain~": {"numinlets": 2, "numoutlets": 5, "outlettype": ["signal", "signal", "", "float", "list"]},
}

# Common newobj inlet/outlet overrides based on object name
NEWOBJ_IO = {
    "+":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "-":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "*":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "/":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "%":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "+.":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "-.":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "*.":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "/.":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "metro":    {"numinlets": 2, "numoutlets": 1, "outlettype": ["bang"]},
    "counter":  {"numinlets": 5, "numoutlets": 4, "outlettype": ["int", "bang", "int", "int"]},
    "random":   {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "select":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["bang", ""]},
    "sel":      {"numinlets": 2, "numoutlets": 2, "outlettype": ["bang", ""]},
    "route":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "gate":     {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "switch":   {"numinlets": 3, "numoutlets": 1, "outlettype": [""]},
    "spray":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "funnel":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["int", ""]},
    "join":     {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "unjoin":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "selector~": {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "matrix~":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", "signal"]},
    "trigger":  {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "t":        {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "pipe":     {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "delay":    {"numinlets": 2, "numoutlets": 1, "outlettype": ["bang"]},
    "del":      {"numinlets": 2, "numoutlets": 1, "outlettype": ["bang"]},
    "timer":    {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "clocker":  {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "line":     {"numinlets": 3, "numoutlets": 2, "outlettype": ["", "bang"]},
    "line~":    {"numinlets": 3, "numoutlets": 2, "outlettype": ["signal", "bang"]},
    "pack":     {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "unpack":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "zl":       {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.group": {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.len":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.nth":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.reg":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.rev":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.rot":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.sect":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.slice": {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.sort":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.sub":   {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.union": {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "zl.unique":{"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "iter":     {"numinlets": 2, "numoutlets": 1, "outlettype": [""]},
    "buddy":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["", ""]},
    "swap":     {"numinlets": 2, "numoutlets": 2, "outlettype": ["int", "int"]},
    "split":    {"numinlets": 3, "numoutlets": 2, "outlettype": ["int", "int"]},
    "clip":     {"numinlets": 3, "numoutlets": 1, "outlettype": [""]},
    "scale":    {"numinlets": 6, "numoutlets": 1, "outlettype": [""]},
    "drunk":    {"numinlets": 3, "numoutlets": 1, "outlettype": ["int"]},
    "urn":      {"numinlets": 2, "numoutlets": 2, "outlettype": ["int", "bang"]},
    "coll":     {"numinlets": 2, "numoutlets": 4, "outlettype": ["", "", "", ""]},
    "dict":     {"numinlets": 2, "numoutlets": 4, "outlettype": ["dictionary", "", "", ""]},
    "table":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["int", "bang"]},
    "sprintf":  {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "regexp":   {"numinlets": 1, "numoutlets": 5, "outlettype": ["", "", "", "", ""]},
    "tosymbol": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "fromsymbol": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "atoi":     {"numinlets": 3, "numoutlets": 1, "outlettype": [""]},
    "itoa":     {"numinlets": 1, "numoutlets": 1, "outlettype": ["int"]},
    "prepend":  {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "append":   {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "print":    {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "loadbang": {"numinlets": 1, "numoutlets": 1, "outlettype": ["bang"]},
    "closebang": {"numinlets": 0, "numoutlets": 1, "outlettype": ["bang"]},
    "deferlow": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "defer":    {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "bangbang": {"numinlets": 1, "numoutlets": 2, "outlettype": ["bang", "bang"]},
    "b":        {"numinlets": 1, "numoutlets": 2, "outlettype": ["bang", "bang"]},
    "int":      {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "i":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["int"]},
    "float":    {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "f":        {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "send":     {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "s":        {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "receive":  {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "r":        {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "value":    {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "v":        {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "if":       {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "expr":     {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "vexpr":    {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "makenote": {"numinlets": 3, "numoutlets": 2, "outlettype": ["float", "float"]},
    "noteout":  {"numinlets": 3, "numoutlets": 0, "outlettype": []},
    "notein":   {"numinlets": 1, "numoutlets": 3, "outlettype": ["int", "int", "int"]},
    "ctlout":   {"numinlets": 3, "numoutlets": 0, "outlettype": []},
    "ctlin":    {"numinlets": 1, "numoutlets": 3, "outlettype": ["int", "int", "int"]},
    "pgmout":   {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "midiin":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["int"]},
    "midiout":  {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "midiparse": {"numinlets": 1, "numoutlets": 7, "outlettype": ["", "", "", "", "", "", ""]},
    "midiformat": {"numinlets": 7, "numoutlets": 1, "outlettype": ["int"]},
    "borax":    {"numinlets": 3, "numoutlets": 9, "outlettype": ["int", "int", "int", "int", "int", "int", "int", "int", "int"]},
    "flush":    {"numinlets": 1, "numoutlets": 2, "outlettype": ["int", "int"]},
    "stripnote": {"numinlets": 2, "numoutlets": 2, "outlettype": ["int", "int"]},
    "cycle~":   {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "saw~":     {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "rect~":    {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "tri~":     {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "phasor~":  {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "noise~":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["signal"]},
    "pink~":    {"numinlets": 1, "numoutlets": 1, "outlettype": ["signal"]},
    "sig~":     {"numinlets": 1, "numoutlets": 1, "outlettype": ["signal"]},
    "+~":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "-~":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "*~":       {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "dac~":     {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "adc~":     {"numinlets": 1, "numoutlets": 2, "outlettype": ["signal", "signal"]},
    "ezdac~":   {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "ezadc~":   {"numinlets": 1, "numoutlets": 2, "outlettype": ["signal", "signal"]},
    "gain~":    {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", ""]},
    "svf~":     {"numinlets": 3, "numoutlets": 4, "outlettype": ["signal", "signal", "signal", "signal"]},
    "biquad~":  {"numinlets": 6, "numoutlets": 1, "outlettype": ["signal"]},
    "lores~":   {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "reson~":   {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "onepole~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "hip~":     {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "lop~":     {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "slide~":   {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "rampsmooth~": {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "snapshot~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "number~":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", "float"]},
    "scope~":   {"numinlets": 2, "numoutlets": 0, "outlettype": []},
    "meter~":   {"numinlets": 1, "numoutlets": 1, "outlettype": ["float"]},
    "avg~":     {"numinlets": 1, "numoutlets": 1, "outlettype": ["float"]},
    "peakamp~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["float"]},
    "groove~":  {"numinlets": 3, "numoutlets": 3, "outlettype": ["signal", "signal", "signal"]},
    "play~":    {"numinlets": 1, "numoutlets": 2, "outlettype": ["signal", "bang"]},
    "record~":  {"numinlets": 3, "numoutlets": 1, "outlettype": ["signal"]},
    "buffer~":  {"numinlets": 1, "numoutlets": 2, "outlettype": ["float", "bang"]},
    "sfplay~":  {"numinlets": 2, "numoutlets": 2, "outlettype": ["signal", "bang"]},
    "sfrecord~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["signal"]},
    "adsr~":    {"numinlets": 5, "numoutlets": 4, "outlettype": ["signal", "signal", "", ""]},
    "function": {"numinlets": 1, "numoutlets": 4, "outlettype": ["float", "", "", "bang"]},
    "mc.cycle~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["multichannelsignal"]},
    "mc.dac~":  {"numinlets": 1, "numoutlets": 0, "outlettype": []},
    "mc.adc~":  {"numinlets": 1, "numoutlets": 1, "outlettype": ["multichannelsignal"]},
    "mc.pack~": {"numinlets": 2, "numoutlets": 1, "outlettype": ["multichannelsignal"]},
    "mc.unpack~": {"numinlets": 1, "numoutlets": 1, "outlettype": ["signal"]},
    "mc.gain~": {"numinlets": 2, "numoutlets": 2, "outlettype": ["multichannelsignal", ""]},
    "js":       {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "v8":       {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "poly~":    {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "thispoly~": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "patcher":  {"numinlets": 0, "numoutlets": 0, "outlettype": []},
    "bpatcher": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "umenu":    {"numinlets": 1, "numoutlets": 3, "outlettype": ["int", "", ""]},
    "radiogroup": {"numinlets": 1, "numoutlets": 1, "outlettype": [""]},
    "tab":      {"numinlets": 1, "numoutlets": 3, "outlettype": ["int", "", ""]},
    "matrixctrl": {"numinlets": 1, "numoutlets": 2, "outlettype": ["list", ""]},
    "live.text": {"numinlets": 1, "numoutlets": 2, "outlettype": ["", ""]},
    "live.tab":  {"numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"]},
}

# ---------------------------------------------------------------------------
# Refpage cache — looks up C74 maxref.xml files on demand, one per object
# ---------------------------------------------------------------------------

class RefpageCache:
    """
    On-demand lookup of Max object I/O from Cycling '74's maxref.xml files.
    Parses one XML file per unknown object; caches results for the session.
    Falls back gracefully when Max is not installed or a refpage doesn't exist.
    """
    _C74_SUBPATH   = Path("Contents/Resources/C74")
    _STD_DOMAINS   = ["max-ref", "msp-ref", "jit-ref", "m4l-ref"]
    _MAX_LOCATIONS = [
        "/Applications/Max.app",
        "/Applications/Max 9.app",
        "/Applications/Max 8.app",
    ]

    def __init__(self):
        self._cache  = {}          # name -> dict or None
        self._c74    = self._find_c74()
        self._name_aliases = None  # lazy; see name_aliases()
        self._objdb = None         # lazy; see object_db()

    def object_db(self):
        """Max's OWN object database — the most authoritative name source there is.

        The Max install ships `interfaces/obj-qlookup.json`: every object Max
        will instantiate, each optionally carrying an `alias` field naming the
        object it is shorthand for (`v` -> value, `i` -> int, `t` -> trigger).
        Packages ship the same file, plus `interfaces/max.db.json` whose
        `maxdb.aliases` map registers package-level aliases (jit.mo.sin ->
        jit.mo.func, jit.time -> jit.mo.time).

        Why this beats refpages for existence checking: refpage coverage is
        incomplete (jit.gl.layer and the whole jit.mo family have no refpage of
        their own), whereas this database is what Max itself consults. Crucially
        it also draws the language boundary correctly — gen/RNBO operators
        (`history`, `swiz`, `clamp`) are absent from it, because they are NOT
        Max objects, so using it as an allowlist does not blur gen into Max.

        Returns (names:set, aliases:dict). Empty/absent files degrade to empty.
        """
        if self._objdb is not None:
            return self._objdb
        names, aliases = set(), {}
        if self._c74 is not None:
            qlookups = [self._c74 / "interfaces" / "obj-qlookup.json"]
            dbs = [self._c74 / "interfaces" / "max.db.json"]
            pkgs = self._c74 / "packages"
            if pkgs.is_dir():
                for pkg in sorted(pkgs.iterdir()):
                    if pkg.is_dir():
                        qlookups.append(pkg / "interfaces" / "obj-qlookup.json")
                        dbs.append(pkg / "interfaces" / "max.db.json")
            for p in qlookups:
                try:
                    data = json.loads(p.read_text())
                except (OSError, json.JSONDecodeError):
                    continue
                if not isinstance(data, dict):
                    continue
                for name, rec in data.items():
                    names.add(name)
                    if isinstance(rec, dict) and rec.get("alias"):
                        aliases[name] = rec["alias"]
            for p in dbs:
                try:
                    data = json.loads(p.read_text())
                except (OSError, json.JSONDecodeError):
                    continue
                amap = (data.get("maxdb") or {}).get("aliases") if isinstance(data, dict) else None
                if isinstance(amap, dict):
                    for name, target in amap.items():
                        if isinstance(target, str):
                            aliases[name] = target
                            names.add(name)
        self._objdb = (names, aliases)
        return self._objdb

    def name_aliases(self):
        """Harvest {real object name -> refpage filename stem} from the refpages.

        C74 cannot store a refpage for `/` or `&` under that filename, so it
        names the FILE with a word (div.maxref.xml, bitand.maxref.xml) and
        declares the object's real name in the XML root's `name` attribute
        (`<c74object name="/">`). That attribute is therefore the authoritative
        mapping, and harvesting it is strictly better than a hand-maintained
        table: it cannot drift, it needs no per-entry verification, and it finds
        aliases nobody would think to write down (`mc.*~` -> mc.times~,
        `ggate` -> gswitch2, `swap` -> fswap).

        Only entries where name != filename are returned — a refpage whose name
        matches its filename resolves by the normal path and needs no alias.
        Names containing a space are documentation "group" pages (e.g. "Jitter
        Matrix Operators"), not objects, and are excluded.
        """
        if self._name_aliases is not None:
            return self._name_aliases
        aliases = {}
        if self._c74 is not None:
            for domain in self._STD_DOMAINS:
                d = self._c74 / "docs/refpages" / domain
                if not d.is_dir():
                    continue
                for f in d.glob("*.maxref.xml"):
                    stem = f.name[: -len(".maxref.xml")]
                    try:
                        nm = ET.parse(f).getroot().get("name")
                    except (ET.ParseError, OSError):
                        continue
                    if nm and nm != stem and " " not in nm:
                        aliases[nm] = stem
        self._name_aliases = aliases
        return aliases

    def _find_c74(self):
        for loc in self._MAX_LOCATIONS:
            p = Path(loc) / self._C74_SUBPATH
            if p.exists():
                return p
        return None

    def _find_xml(self, name):
        """Return Path to <name>.maxref.xml, or None if not found."""
        if self._c74 is None:
            return None
        # Standard domains first
        for domain in self._STD_DOMAINS:
            p = self._c74 / "docs/refpages" / domain / f"{name}.maxref.xml"
            if p.exists():
                return p
        # C74 packages
        packages = self._c74 / "packages"
        if packages.exists():
            for pkg in sorted(packages.iterdir()):
                if not pkg.is_dir():
                    continue
                for sub in ["docs/refpages", "docs/refpages1", "docs"]:
                    p = pkg / sub / f"{name}.maxref.xml"
                    if p.exists():
                        return p
                # Packages may nest refpages one level deeper under a domain dir
                # the way the core install does — RNBO ships
                # packages/RNBO/docs/refpages/max/rnbo~.maxref.xml, so a flat
                # check of docs/refpages misses it and rnbo~ reads as invented.
                refroot = pkg / "docs" / "refpages"
                if refroot.is_dir():
                    try:
                        for domain in sorted(refroot.iterdir()):
                            if domain.is_dir():
                                p = domain / f"{name}.maxref.xml"
                                if p.exists():
                                    return p
                    except OSError:
                        pass
        return None

    @staticmethod
    def _outlet_type(t):
        t = (t or "").strip().lower()
        if t == "signal":
            return "signal"
        if t in ("multi-channel signal", "multichannelsignal"):
            return "multichannelsignal"
        return ""

    def _parse(self, xml_path):
        try:
            root = ET.parse(xml_path).getroot()
        except ET.ParseError:
            return None

        # ── I/O counts (existing) ────────────────────────────────────────────
        inletlist  = root.find("inletlist")
        numinlets  = len(inletlist.findall("inlet")) if inletlist is not None else 1
        outletlist = root.find("outletlist")
        if outletlist is not None:
            # Outlet `id` should be an int but third-party refpages occasionally
            # carry non-numeric markers (e.g. odot uses `id="1--"`). Tolerate by
            # falling back to source order when an id can't be coerced.
            def _outlet_key(o, _i=[0]):
                _i[0] += 1
                try:
                    return int(o.get("id", _i[0]))
                except ValueError:
                    return _i[0]
            outlets    = sorted(outletlist.findall("outlet"), key=_outlet_key)
            numoutlets = len(outlets)
            outlettype = [self._outlet_type(o.get("type", "")) for o in outlets]
        else:
            numoutlets = 0
            outlettype = []

        # ── Digest ───────────────────────────────────────────────────────────
        digest_el = root.find("digest")
        digest = digest_el.text.strip() if digest_el is not None and digest_el.text else ""

        # ── Attributes ───────────────────────────────────────────────────────
        attributes = {}
        for attr in root.findall("attributelist/attribute"):
            aname = attr.get("name", "")
            if not aname:
                continue
            raw_size = attr.get("size", "1")
            try:
                size_val = int(raw_size)
            except ValueError:
                size_val = raw_size
            entry = {
                "type":    attr.get("type", ""),
                "size":    size_val,
                "default": attr.get("default", ""),
                "get":     attr.get("get", "1") == "1",
                "set":     attr.get("set", "1") == "1",
            }
            # Default and enum values live inside a nested attributelist
            inner = attr.find("attributelist")
            if inner is not None:
                dflt = inner.find("attribute[@name='default']")
                if dflt is not None and dflt.get("value"):
                    entry["default"] = dflt.get("value")
                # Enum labels come from the "label" sibling of enumvals
                lbl = inner.find("attribute[@name='label']")
                if lbl is not None and lbl.get("value"):
                    entry["label"] = lbl.get("value")
            attributes[aname] = entry

        # ── Messages ─────────────────────────────────────────────────────────
        messages = {}
        for method in root.findall("methodlist/method"):
            mname = method.get("name", "")
            if not mname:
                continue
            args = []
            for arg in method.findall("arglist/arg"):
                args.append({
                    "name":     arg.get("name", ""),
                    "type":     arg.get("type", ""),
                    "optional": arg.get("optional", "0") == "1",
                })
            inlet_attr = method.find("attributelist/attribute[@name='inlet']")
            inlet = inlet_attr.get("value") if inlet_attr is not None else None
            messages[mname] = {"args": args, "inlet": inlet}

        # ── Object arguments ─────────────────────────────────────────────────
        arguments = []
        for objarg in root.findall("objarglist/objarg"):
            arguments.append({
                "name":     objarg.get("name", ""),
                "type":     objarg.get("type", ""),
                "optional": objarg.get("optional", "0") == "1",
                "units":    objarg.get("units", ""),
            })

        # ── Output descriptions ───────────────────────────────────────────────
        outputs = []
        for misc in root.findall("misc"):
            if misc.get("name") == "Output":
                for entry in misc.findall("entry"):
                    desc_el = entry.find("description")
                    desc = ""
                    if desc_el is not None and desc_el.text:
                        desc = " ".join(desc_el.text.split())  # normalise whitespace
                    outputs.append({"name": entry.get("name", ""), "description": desc})

        # ── See-also ─────────────────────────────────────────────────────────
        seealso = [sa.get("name") for sa in root.findall("seealsolist/seealso")
                   if sa.get("name")]

        return {
            "numinlets":  numinlets,
            "numoutlets": numoutlets,
            "outlettype": outlettype,
            "digest":     digest,
            "attributes": attributes,
            "messages":   messages,
            "arguments":  arguments,
            "outputs":    outputs,
            "seealso":    seealso,
        }

    def describe(self, name):
        """Return a human-readable summary of an object for quick verification."""
        r = self.lookup(name)
        if r is None:
            return f"{name}: NOT FOUND in refpages"
        lines = [
            f"{name}: {r['digest']}",
            f"  inlets={r['numinlets']}  outlets={r['numoutlets']}  types={r['outlettype']}",
        ]
        if r["arguments"]:
            args = ", ".join(f"{a['name']}({'opt' if a['optional'] else 'req'}, {a['type']})"
                             for a in r["arguments"])
            lines.append(f"  args: {args}")
        if r["attributes"]:
            lines.append(f"  attrs: {', '.join(r['attributes'].keys())}")
        if r["seealso"]:
            lines.append(f"  see also: {', '.join(r['seealso'])}")
        return "\n".join(lines)

    def lookup(self, name):
        """Return full metadata dict for name, or None if not found."""
        if name not in self._cache:
            xml_path = self._find_xml(name)
            self._cache[name] = self._parse(xml_path) if xml_path else None
        return self._cache[name]

REFPAGE_CACHE = RefpageCache()


class PackageObjectsCache:
    """
    Lazy lookup of installed-package object I/O from package_objects.json.

    Used by `guess_newobj_io` as a fallback after the built-in NEWOBJ_IO table
    and the Cycling '74 RefpageCache both miss — covers third-party externals
    and abstractions that aren't documented in C74 refpages but are documented
    in the curated package library.

    The library is treated as advisory: if the file is missing, malformed, or
    the requested object isn't present, lookup() returns None and the caller
    falls through to whatever spec-supplied overrides the user provided.
    """

    DEFAULT_PATH = Path(__file__).parent / "packages" / "package_objects.json"

    def __init__(self, path=None):
        self._path = Path(path) if path else self.DEFAULT_PATH
        self._index = None  # {object_name: io_dict} — built on first lookup

    def _build_index(self):
        if not self._path.exists():
            self._index = {}
            return
        try:
            with self._path.open() as f:
                data = json.load(f)
        except (json.JSONDecodeError, OSError):
            self._index = {}
            return

        # Flatten {pkg: {obj: rec}} -> {obj: io_record}.
        # If the same object name appears in multiple packages (rare but
        # possible), the first one wins — package iteration order is alphabetic
        # via dict insertion order. A future refinement could prefer entries
        # where `kind == "external"` over abstractions, but in practice
        # collisions don't happen for objects worth fallback-resolving.
        index = {}
        for pkg, objs in data.items():
            for name, rec in objs.items():
                if name in index:
                    continue
                # Only entries with a real I/O signature are useful as fallback.
                # Helpfile-derived records sometimes have numinlets=0 because
                # the canonical instance couldn't be found — skip those.
                if rec.get("numinlets", 0) == 0 and rec.get("numoutlets", 0) == 0:
                    continue
                index[name] = {
                    "numinlets":  rec.get("numinlets", 1),
                    "numoutlets": rec.get("numoutlets", 0),
                    "outlettype": rec.get("outlettype", []),
                    "_package":   pkg,
                }
        self._index = index

    def lookup(self, name):
        """Return I/O dict (numinlets/numoutlets/outlettype) or None."""
        if self._index is None:
            self._build_index()
        rec = self._index.get(name)
        if rec is None:
            return None
        # Strip metadata key before returning to caller
        return {k: v for k, v in rec.items() if not k.startswith("_")}

    def package_of(self, name):
        """Return the package the object came from, or None."""
        if self._index is None:
            self._build_index()
        rec = self._index.get(name)
        return rec.get("_package") if rec else None


PACKAGE_OBJECTS_CACHE = PackageObjectsCache()

# Fixed sizes for UI objects
UI_SIZES = {
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

X_MARGIN = 50
Y_MARGIN = 50
X_SPACING = 170
Y_SPACING = 55

DEFAULT_FONT_SIZE = 12.0
DEFAULT_FONT_NAME = "Arial"


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def _positional_args(tokens):
    """Creation args with @attribute declarations stripped out.

    Attributes may appear anywhere after the object name and are never
    positional, so an inlet/outlet count derived from arg POSITION must not see
    them: `join @triggers -1` has zero positional args (2 inlets, the default),
    not two. Everything from an `@name` token up to the next `@name` — or the
    end — is attribute syntax, values included.
    """
    out, in_attr = [], False
    for tok in tokens:
        if tok.startswith("@"):
            in_attr = True
            continue
        if not in_attr:
            out.append(tok)
    return out


def _int_arg(args, index, default):
    """args[index] as an int, or `default` when absent or non-numeric.

    Creation args are text: an object whose first arg is normally a count can
    still be given a symbol, and a count derived from one must degrade to the
    object's default rather than raising on the way to a patch.
    """
    try:
        return int(args[index])
    except (IndexError, ValueError, TypeError):
        return default


def guess_newobj_io(text):
    """Guess inlet/outlet counts for a newobj from its text."""
    if not text:
        return None
    parts = text.split()
    obj_name = parts[0]
    args = _positional_args(parts[1:])

    # Direct lookup
    if obj_name in NEWOBJ_IO:
        info = dict(NEWOBJ_IO[obj_name])
        # Adjust for variable-outlet objects
        if obj_name in ("trigger", "t", "b", "bangbang"):
            n = max(len(args), 2) if obj_name in ("b", "bangbang") else max(len(args), 1)
            if obj_name in ("b", "bangbang"):
                info["numoutlets"] = n
                info["outlettype"] = ["bang"] * n
            else:
                info["numoutlets"] = n
                info["outlettype"] = [""] * n
        elif obj_name in ("pack", "buddy"):
            n = max(len(args), 2)
            info["numinlets"] = n
            info["numoutlets"] = 1
        elif obj_name in ("unpack",):
            n = max(len(args), 2)
            info["numinlets"] = 1
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("select", "sel"):
            n = max(len(args), 1)
            info["numinlets"] = 2 if n == 1 else 1
            info["numoutlets"] = n + 1
            info["outlettype"] = ["bang"] * n + [""]
        elif obj_name in ("route",):
            n = max(len(args), 1)
            info["numinlets"] = 1
            info["numoutlets"] = n + 1
            info["outlettype"] = [""] * (n + 1)
        elif obj_name in ("gate",):
            n = _int_arg(args, 0, 1)
            info["numinlets"] = 2
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("switch",):
            n = _int_arg(args, 0, 2)
            info["numinlets"] = n + 1
            info["numoutlets"] = 1
        elif obj_name in ("spray",):
            n = _int_arg(args, 0, 2)
            info["numinlets"] = 2
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("funnel",):
            n = _int_arg(args, 0, 2)
            info["numinlets"] = n
            info["numoutlets"] = 2
        elif obj_name in ("join",):
            n = _int_arg(args, 0, 2)
            info["numinlets"] = n
            info["numoutlets"] = 1
        elif obj_name in ("unjoin",):
            # Refpage objarg `outlets`: "Specifies the number of outlets (in
            # addition to the rightmost outlet, which is always present)."
            # So `unjoin 3` has FOUR outlets — three groups plus the remainder.
            n = _int_arg(args, 0, 2)
            info["numinlets"] = 1
            info["numoutlets"] = n + 1
            info["outlettype"] = [""] * (n + 1)
        elif obj_name in ("selector~",):
            n = _int_arg(args, 0, 2)
            info["numinlets"] = n + 1
            info["numoutlets"] = 1
            info["outlettype"] = ["signal"]
        elif obj_name in ("matrix~",):
            n_in = _int_arg(args, 0, 2)
            n_out = _int_arg(args, 1, 2)
            info["numinlets"] = n_in
            info["numoutlets"] = n_out
            info["outlettype"] = ["signal"] * n_out
        return info

    # Subpatcher
    if obj_name == "p" or obj_name.startswith("p "):
        return {"numinlets": 1, "numoutlets": 1, "outlettype": [""]}

    # Fallback to C74 refpage (on-demand, cached)
    refpage = REFPAGE_CACHE.lookup(obj_name)
    if refpage is not None:
        return dict(refpage)

    # Final fallback: curated installed-package library. Covers third-party
    # externals/abstractions that aren't in C74 refpages but have been
    # documented in package_objects.json. Lets the user reference these
    # objects in a spec without supplying inlets/outlets overrides.
    pkg = PACKAGE_OBJECTS_CACHE.lookup(obj_name)
    if pkg is not None:
        return dict(pkg)

    return None


def estimate_text_width(text):
    """Estimate pixel width for an object's text."""
    if not text:
        return 40
    return max(len(text) * 7 + 20, 40)


# ---------------------------------------------------------------------------
# Layout engine — patching view
# ---------------------------------------------------------------------------

def auto_layout(objects, connections):
    """
    Assign (x, y) positions using topological layering.

    Phase 2 improvements over the original:
    - Objects that share a common downstream destination are grouped at the
      same y (side-by-side), so cables drop cleanly into separate inlets.
    - Within a layer, objects are sorted by their first downstream destination
      to keep logically related inputs spatially adjacent.
    """
    # Build adjacency
    successors   = collections.defaultdict(list)
    predecessors = collections.defaultdict(list)
    in_degree    = collections.defaultdict(int)
    for obj_id in objects:
        in_degree.setdefault(obj_id, 0)
    for conn in connections:
        src, _, dst, _ = conn[:4]
        successors[src].append(dst)
        predecessors[dst].append(src)
        in_degree[dst] = in_degree.get(dst, 0) + 1

    # BFS longest-path layering
    layers = {}
    queue  = collections.deque()
    for obj_id in objects:
        if in_degree.get(obj_id, 0) == 0:
            queue.append(obj_id)
            layers[obj_id] = 0
    in_deg_copy = dict(in_degree)
    while queue:
        node = queue.popleft()
        for succ in successors[node]:
            new_layer = layers[node] + 1
            if succ not in layers or layers[succ] < new_layer:
                layers[succ] = new_layer
            in_deg_copy[succ] -= 1
            if in_deg_copy[succ] == 0:
                queue.append(succ)
    for obj_id in objects:
        if obj_id not in layers:
            layers[obj_id] = 0

    # Group by layer
    layer_groups = collections.defaultdict(list)
    for obj_id, layer in layers.items():
        layer_groups[layer].append(obj_id)

    # Within each layer, sort so objects feeding the same destination are
    # adjacent.  Primary key: first successor's name (groups shared inputs).
    # Secondary key: object id (determinism).
    def sort_key(obj_id):
        succs = successors.get(obj_id, [])
        return (succs[0] if succs else "\xff", obj_id)

    for layer in layer_groups:
        layer_groups[layer].sort(key=sort_key)

    # Assign coordinates.  Objects that share exactly the same set of
    # successors are placed at the same y so they appear side-by-side.
    positions = {}
    for layer_idx in sorted(layer_groups.keys()):
        members = layer_groups[layer_idx]
        row     = 0
        prev_succ_key = None
        for obj_id in members:
            obj_spec  = objects[obj_id]
            if "pos" in obj_spec:
                positions[obj_id] = tuple(obj_spec["pos"])
                continue
            succ_key = tuple(sorted(successors.get(obj_id, [])))
            # Advance row only when the successor group changes
            if prev_succ_key is not None and succ_key != prev_succ_key:
                row += 1
            prev_succ_key = succ_key
            x = X_MARGIN + layer_idx * X_SPACING
            y = Y_MARGIN + row * Y_SPACING
            positions[obj_id] = (x, y)

    return positions


# ---------------------------------------------------------------------------
# Layout engine — presentation view
# ---------------------------------------------------------------------------

# Grid constants (can be overridden via top-level "layout" key in spec)
PRES_MARGIN_X  = 15    # outer left margin
PRES_MARGIN_Y  = 35    # top margin (below title)
PRES_ROW_H     = 27    # vertical step between rows
PRES_COL_GAP   = 260   # horizontal distance between column starts


def presentation_layout(objects, layout_cfg=None):
    """
    Compute presentation_rect for objects with layout hints.

    An object's "presentation" field may be:
      [x, y]           — explicit position; w/h from object size
      [x, y, w, h]     — fully explicit
      {"col": N, "row": N}              — grid placement
      {"col": N, "row": N, "x_off": X} — grid with in-column x offset

    Global grid config comes from the spec's top-level "layout.presentation"
    dict (all keys optional):
      margin_x, margin_y, row_height, col_gap

    Returns {user_id: [x, y, w, h]} for all objects with presentation hints.
    """
    cfg       = (layout_cfg or {}).get("presentation", {})
    margin_x  = cfg.get("margin_x",   PRES_MARGIN_X)
    margin_y  = cfg.get("margin_y",   PRES_MARGIN_Y)
    row_h     = cfg.get("row_height", PRES_ROW_H)
    col_gap   = cfg.get("col_gap",    PRES_COL_GAP)

    result = {}
    for user_id, obj_spec in objects.items():
        pres = obj_spec.get("presentation")
        if not pres:
            continue

        # Object size
        maxclass = obj_spec.get("type", "newobj")
        text     = obj_spec.get("text", "")
        if obj_spec.get("size"):
            w, h = obj_spec["size"]
        elif maxclass in UI_SIZES:
            w, h = UI_SIZES[maxclass]
        else:
            w = estimate_text_width(text)
            h = 22

        if isinstance(pres, list):
            if len(pres) == 2:
                result[user_id] = [float(pres[0]), float(pres[1]), float(w), float(h)]
            elif len(pres) >= 4:
                result[user_id] = [float(v) for v in pres[:4]]
        elif isinstance(pres, dict):
            col   = pres.get("col", 0)
            row   = pres.get("row", 0)
            x_off = pres.get("x_off", 0)
            x     = margin_x + col * col_gap + x_off
            y     = margin_y + row * row_h
            ow    = pres.get("w", w)   # per-object size override
            oh    = pres.get("h", h)
            result[user_id] = [float(x), float(y), float(ow), float(oh)]

    return result


# ---------------------------------------------------------------------------
# Box builder
# ---------------------------------------------------------------------------

def build_box(user_id, obj_spec, index, x, y):
    """Build a .maxpat box dict from a spec object."""
    maxclass = obj_spec.get("type", "newobj")
    text = obj_spec.get("text", "")

    # Determine inlet/outlet profile
    defaults = MAXCLASS_DEFAULTS.get(maxclass, {"numinlets": 1, "numoutlets": 1, "outlettype": [""]})
    io_info = dict(defaults)

    # For newobj, try to guess from text
    if maxclass == "newobj" and text:
        guessed = guess_newobj_io(text)
        if guessed:
            io_info = guessed

    # Allow spec overrides
    numinlets = obj_spec.get("inlets", io_info["numinlets"])
    numoutlets = obj_spec.get("outlets", io_info["numoutlets"])
    outlettype = obj_spec.get("outlettype", io_info["outlettype"])

    # Sizing — spec override takes priority over defaults
    if obj_spec.get("size"):
        w, h = obj_spec["size"]
    elif maxclass in UI_SIZES:
        w, h = UI_SIZES[maxclass]
    else:
        w = estimate_text_width(text)
        h = 22

    box = {
        "box": {
            "id": f"obj-{index}",
            "maxclass": maxclass,
            "numinlets": numinlets,
            "numoutlets": numoutlets,
            "outlettype": outlettype,
            "patching_rect": [float(x), float(y), float(w), float(h)],
        }
    }

    # Text for objects that need it
    if text and maxclass in ("newobj", "message", "comment"):
        box["box"]["text"] = text
    elif text and maxclass not in ("newobj", "message", "comment"):
        # Some UI objects store text too (e.g. live.text)
        if maxclass in ("live.text",):
            box["box"]["text"] = text

    # Presentation — accept either obj["presentation"] or a sibling
    # obj["presentation_rect"]. When both are present, presentation_rect wins
    # (it is more specific). This makes hand-edited specs forgiving when the
    # author writes the obvious field name, and lets reconcile_spec round-trip
    # live rects without translating field names.
    pres = obj_spec.get("presentation")
    pres_rect_sibling = obj_spec.get("presentation_rect")
    if pres or pres_rect_sibling:
        box["box"]["presentation"] = 1
        if isinstance(pres_rect_sibling, list) and len(pres_rect_sibling) >= 4:
            box["box"]["presentation_rect"] = [float(v) for v in pres_rect_sibling[:4]]
        elif isinstance(pres, list):
            if len(pres) == 2:
                box["box"]["presentation_rect"] = [float(pres[0]), float(pres[1]), float(w), float(h)]
            elif len(pres) >= 4:
                box["box"]["presentation_rect"] = [float(v) for v in pres[:4]]

    # Extra attributes from spec
    attrs = obj_spec.get("attrs", {})
    for k, val in attrs.items():
        box["box"][k] = val

    # Handle subpatcher
    if "patcher" in obj_spec:
        sub_maxpat = convert_patcher(obj_spec["patcher"])
        box["box"]["patcher"] = sub_maxpat
        box["box"]["saved_object_attributes"] = {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
        }

    # Linecount for multiline comments
    if maxclass == "comment" and text:
        linecount = text.count("\n") + 1
        if linecount > 1:
            box["box"]["linecount"] = linecount

    return box


# ---------------------------------------------------------------------------
# Spec embedding / extraction
# ---------------------------------------------------------------------------

def build_spec_embed(spec, x, y):
    """Build a hidden codebox containing the embedded spec for round-tripping."""
    spec_text = json.dumps(spec, indent=2)
    embed_text = f"{SPEC_MARKER_BEGIN}\n{spec_text}\n{SPEC_MARKER_END}"

    return {
        "box": {
            "id": "obj-spec-embed",
            "maxclass": "text.codebox",
            "numinlets": 1,
            "numoutlets": 1,
            "outlettype": [""],
            "patching_rect": [float(x), float(y), 500.0, 300.0],
            "code": embed_text,
            "fontsize": 9.0,
            "hidden": 1,
        }
    }


# The canonical spec-embed box: build_spec_embed() always writes this id and
# this maxclass, and _SKIP_BOX_IDS already names the id as our own scaffolding.
SPEC_EMBED_ID = "obj-spec-embed"
SPEC_EMBED_MAXCLASS = "text.codebox"


class SpecEmbedError(ValueError):
    """The chosen spec-embed box carries the marker but its body is unusable.

    Raised instead of returning a lesser candidate. A patch whose canonical
    embed is corrupt must fail loudly: the alternative is handing a caller a
    partial spec, and `convert` writes whatever spec it is given — so a decoy
    that happens to parse would erase every box the real embed described.
    """


def _spec_embed_candidates(maxpat):
    """Every top-level box carrying the spec marker, in file order.

    Returns a list of (box_id, maxclass, text) triples. More than one is not an
    error by itself — leftovers from prior convert cycles, comments quoting the
    format, and half-finished hand edits all coexist in a long-lived boxes
    array — but it does mean the caller must discriminate rather than take the
    first hit.
    """
    out = []
    for wrapper in maxpat.get("patcher", {}).get("boxes", []) or []:
        box = wrapper.get("box", {}) if isinstance(wrapper, dict) else None
        if not isinstance(box, dict):
            continue
        # Check both 'code' (codebox) and 'text' (legacy comment / newobj)
        text = box.get("code", "") or box.get("text", "") or ""
        if SPEC_MARKER_BEGIN in text:
            out.append((box.get("id", ""), box.get("maxclass", ""), text))
    return out


def _choose_spec_embed(candidates):
    """Pick the real embed from marker-bearing candidates. Most specific first."""
    for cand in candidates:
        if cand[0] == SPEC_EMBED_ID:
            return cand
    for cand in candidates:
        if cand[1] == SPEC_EMBED_MAXCLASS:
            return cand
    return candidates[0]


def _describe_candidate(cand):
    bid, maxclass, _ = cand
    return f"{bid or '<no id>'} ({maxclass or 'unknown maxclass'})"


def extract_spec(maxpat, stream=sys.stderr):
    """Extract the Claude2Max spec from a .maxpat dict. Returns dict or None.

    Selection is by canonical id first, maxclass second, file order last — see
    _choose_spec_embed. When more than one box carries the marker the losers are
    named on `stream` rather than dropped silently. Pass stream=None to silence.

    Raises SpecEmbedError if the chosen box's body is truncated or not JSON.
    """
    candidates = _spec_embed_candidates(maxpat)
    if not candidates:
        return None

    chosen = _choose_spec_embed(candidates)
    bid, maxclass, text = chosen

    if len(candidates) > 1 and stream is not None:
        others = ", ".join(_describe_candidate(c) for c in candidates if c is not chosen)
        print(f"[spec] WARNING: {len(candidates)} boxes carry '{SPEC_MARKER_BEGIN}'. "
              f"Using {_describe_candidate(chosen)}; ignoring {others}. "
              f"Stale marker-bearing boxes should be deleted — before this "
              f"discriminator existed, whichever one sorted first won.",
              file=stream)

    start = text.index(SPEC_MARKER_BEGIN) + len(SPEC_MARKER_BEGIN)
    end = text.find(SPEC_MARKER_END, start)
    if end == -1:
        raise SpecEmbedError(
            f"spec embed in box {_describe_candidate(chosen)} has no "
            f"'{SPEC_MARKER_END}' terminator — the body is truncated. "
            f"Repair or remove the box; do not convert from it."
        )

    spec_json = text[start:end].strip()
    try:
        return json.loads(spec_json)
    except json.JSONDecodeError as exc:
        raise SpecEmbedError(
            f"spec embed in box {_describe_candidate(chosen)} is not valid JSON "
            f"({exc.msg} — line {exc.lineno}, col {exc.colno}; "
            f"{len(spec_json)} chars total). "
            f"Repair it, or rebuild the spec from the patch's boxes with "
            f"`sync` on a copy — do not convert from a partial spec."
        ) from exc


# ---------------------------------------------------------------------------
# .maxpat → spec  (reverse conversion)
# ---------------------------------------------------------------------------

# Box IDs that are internal Claude2Max scaffolding, never spec objects
_SKIP_BOX_IDS = {"obj-spec-embed", "obj-title"}

# Box attrs to carry back into spec on sync.
# Anything Max stores on a box that affects appearance, identity, or runtime
# behavior must be listed here — otherwise sync drops it from the spec and the
# next convert cycle erases it from the .maxpat. Tutorial breakage rules:
#   - identity: varname (scripting name — referenced by JS via patcher.getnamed())
#   - visibility: hidden (panels/annotations start hidden; JS unhides current step)
#   - z-order: background (panels render BEHIND highlighted objects, not on top)
#   - panel chrome: bordercolor / border / rounded
#   - patcher-box chrome: locked_bgcolor  --  NOT a panel attr. Real only on `p`
#     (826 boxes corpus-wide); absent from panel's refpage, from the jbox base
#     set, and from all 12,920 panel boxes in the help corpus. Listed here
#     because this whitelist is class-agnostic and `p` boxes legitimately carry
#     it; the class-aware check is rule_attribute_resolves, which correctly
#     flags it on panel. Do not read this list as "valid on the classes above".
#   - styling: bgcolor / textcolor / color / fontsize / fontface / fontname
#   - bubble comments: bubble / bubbleside / bubblepoint / bubbletextmargin
_PRESERVE_ATTRS = {"bgcolor", "textcolor", "color", "fontsize", "fontface", "fontname",
                   "varname", "hidden", "background", "bordercolor", "border",
                   "rounded", "locked_bgcolor",
                   "bubble", "bubbleside", "bubblepoint", "bubbletextmargin",
                   "bubble_bgcolor",   # bubble comments use this, NOT plain bgcolor
                   "items", "prefix"}   # umenu menu items + auto-prefix


def _collect_boxes(maxpat):
    """Return {box_id: box_dict} for all non-internal boxes in a .maxpat."""
    result = {}
    for wrapper in maxpat.get("patcher", {}).get("boxes", []):
        box = wrapper.get("box", {})
        bid = box.get("id", "")
        # Skip internal scaffolding by ID
        if bid in _SKIP_BOX_IDS:
            continue
        # Skip spec embed regardless of ID (catches hand-edited patches)
        code = box.get("code", "") or ""
        if SPEC_MARKER_BEGIN in code:
            continue
        result[bid] = box
    return result


def _make_spec_id(box, used_ids):
    """Derive a clean, unique spec ID from a box dict."""
    text = box.get("text", "")
    maxclass = box.get("maxclass", "obj")
    base = text.split()[0] if text else maxclass
    base = re.sub(r"[^a-zA-Z0-9]", "_", base).strip("_") or "obj"
    candidate = base
    i = 2
    while candidate in used_ids:
        candidate = f"{base}_{i}"
        i += 1
    return candidate


def _box_to_spec_obj(box):
    """Convert a raw .maxpat box dict to a Claude2Max spec object."""
    maxclass = box.get("maxclass", "newobj")
    text = box.get("text", "")
    rect = box.get("patching_rect", [0, 0, 40, 22])
    x, y, w, h = (float(v) for v in rect[:4])

    obj = {"type": maxclass, "pos": [int(x), int(y)]}

    if text and maxclass in ("newobj", "message", "comment", "live.text"):
        obj["text"] = text

    # Size — include only when meaningfully non-default
    default_wh = UI_SIZES.get(maxclass)
    if default_wh:
        if (int(w), int(h)) != default_wh:
            obj["size"] = [int(w), int(h)]
    elif int(h) != 22:
        obj["size"] = [int(w), int(h)]

    # Presentation
    if box.get("presentation"):
        prect = box.get("presentation_rect")
        if prect:
            obj["presentation"] = [int(prect[0]), int(prect[1]), int(prect[2]), int(prect[3])]
        else:
            obj["presentation"] = [0, 0]

    # Styling attrs
    attrs = {}
    for k in _PRESERVE_ATTRS:
        if k not in box:
            continue
        val = box[k]
        if k == "fontsize" and val == DEFAULT_FONT_SIZE:
            continue
        if k == "fontface" and val == 0:
            continue
        if k == "fontname" and val == DEFAULT_FONT_NAME:
            continue
        attrs[k] = val
    if attrs:
        obj["attrs"] = attrs

    return obj


def _build_connections(lines, bid_to_spec):
    """Build spec connections list from raw patchlines and a box_id→spec_id map."""
    connections = []
    for wrapper in lines:
        line = wrapper.get("patchline", {})
        src = line.get("source", [None, 0])
        dst = line.get("destination", [None, 0])
        src_bid, src_out = src[0], int(src[1])
        dst_bid, dst_in = dst[0], int(dst[1])
        if src_bid in bid_to_spec and dst_bid in bid_to_spec:
            connections.append([bid_to_spec[src_bid], src_out, bid_to_spec[dst_bid], dst_in])
    return connections


def maxpat_to_spec(maxpat):
    """
    Reverse-engineer a Claude2Max spec from a .maxpat with no embedded spec.
    Generates stable IDs from object text, preserves positions and styling.
    """
    patcher = maxpat.get("patcher", {})
    rect = patcher.get("rect", [100, 100, 800, 600])
    box_by_id = _collect_boxes(maxpat)

    used_ids = set()
    id_map = {}
    for bid, box in box_by_id.items():
        sid = _make_spec_id(box, used_ids)
        used_ids.add(sid)
        id_map[bid] = sid

    objects = {id_map[bid]: _box_to_spec_obj(box) for bid, box in box_by_id.items()}
    connections = _build_connections(patcher.get("lines", []), id_map)

    return {
        "width": int(rect[2]) if len(rect) > 2 else 800,
        "height": int(rect[3]) if len(rect) > 3 else 600,
        "objects": objects,
        "connections": connections,
    }


def reconcile_spec(existing_spec, maxpat):
    """
    Update an existing embedded spec to reflect manual edits made in Max.

    Matching strategy:
      1. Position + type match (primary — handles most cases)
      2. Type + text match (fallback — for objects moved by the user)

    Matched objects: pos and text are updated from the current box; all other
    spec fields (inlet/outlet overrides, attrs, presentation) are preserved.
    Deleted boxes: removed from spec.
    New boxes: appended with auto-generated IDs.
    Connections: fully rebuilt from current patchlines.
    """
    patcher = maxpat.get("patcher", {})
    rect = patcher.get("rect", [100, 100, 800, 600])
    spec_objects = existing_spec.get("objects", {})
    box_by_id = _collect_boxes(maxpat)

    # Position → box_id lookup (rounded to tolerate float drift from Max)
    pos_to_bid = {}
    for bid, box in box_by_id.items():
        r = box.get("patching_rect", [0, 0, 0, 0])
        pos_to_bid[(round(r[0]), round(r[1]))] = bid

    spec_to_bid = {}
    matched_bids = set()

    # Pass 1: position + type
    for sid, sobj in spec_objects.items():
        pos = sobj.get("pos", [0, 0])
        key = (round(pos[0]), round(pos[1]))
        if key in pos_to_bid:
            candidate = pos_to_bid[key]
            if box_by_id[candidate].get("maxclass") == sobj.get("type"):
                spec_to_bid[sid] = candidate
                matched_bids.add(candidate)

    # Pass 2: type + text fallback
    for sid, sobj in spec_objects.items():
        if sid in spec_to_bid:
            continue
        stype = sobj.get("type", "")
        stext = sobj.get("text", "")
        for bid, box in box_by_id.items():
            if bid in matched_bids:
                continue
            if box.get("maxclass") == stype and box.get("text", "") == stext:
                spec_to_bid[sid] = bid
                matched_bids.add(bid)
                break

    # Full box_id → spec_id map
    bid_to_spec = {bid: sid for sid, bid in spec_to_bid.items()}
    used_ids = set(spec_objects.keys())
    for bid in box_by_id:
        if bid not in bid_to_spec:
            new_id = _make_spec_id(box_by_id[bid], used_ids)
            used_ids.add(new_id)
            bid_to_spec[bid] = new_id

    # Build updated objects
    updated_objects = {}

    # Existing objects that matched a current box
    for sid, bid in spec_to_bid.items():
        box = box_by_id[bid]
        updated = dict(spec_objects[sid])
        r = box.get("patching_rect", [0, 0, 0, 0])
        updated["pos"] = [int(r[0]), int(r[1])]
        if spec_objects[sid].get("type") in ("newobj", "message", "comment", "live.text"):
            box_text = box.get("text", "")
            if box_text:
                updated["text"] = box_text
            elif "text" in updated:
                del updated["text"]

        # Patching size — fold live patching_rect w/h back into spec.
        # Use the same "meaningfully non-default" test as _box_to_spec_obj so
        # specs stay clean of redundant size declarations.
        w_live, h_live = int(r[2]), int(r[3])
        maxclass_live = box.get("maxclass", spec_objects[sid].get("type", "newobj"))
        default_wh = UI_SIZES.get(maxclass_live)
        if default_wh:
            if (w_live, h_live) != default_wh:
                updated["size"] = [w_live, h_live]
            elif "size" in updated:
                del updated["size"]
        elif h_live != 22:
            updated["size"] = [w_live, h_live]
        elif "size" in updated:
            del updated["size"]

        # Presentation — fold live presentation_rect back into spec as the
        # canonical 4-element list form. A box dropped from presentation in
        # Max removes the field from the spec. Drop the sibling
        # `presentation_rect` field if it ever leaked in: the canonical form
        # lives under `presentation`.
        if box.get("presentation"):
            prect = box.get("presentation_rect")
            if prect and len(prect) >= 4:
                updated["presentation"] = [int(prect[0]), int(prect[1]),
                                            int(prect[2]), int(prect[3])]
            elif "presentation" not in updated:
                updated["presentation"] = [0, 0]
        elif "presentation" in updated:
            del updated["presentation"]
        if "presentation_rect" in updated:
            del updated["presentation_rect"]

        # Re-extract preserved attrs (varname, styling, hidden) from the live box
        # so manual edits in Max are captured. Merge into existing spec attrs;
        # box value wins on conflict because the live patch is the source of truth.
        merged_attrs = dict(updated.get("attrs", {}))
        for k in _PRESERVE_ATTRS:
            if k not in box:
                continue
            val = box[k]
            if k == "fontsize" and val == DEFAULT_FONT_SIZE:
                merged_attrs.pop(k, None)
                continue
            if k == "fontface" and val == 0:
                merged_attrs.pop(k, None)
                continue
            if k == "fontname" and val == DEFAULT_FONT_NAME:
                merged_attrs.pop(k, None)
                continue
            merged_attrs[k] = val
        if merged_attrs:
            updated["attrs"] = merged_attrs
        elif "attrs" in updated:
            del updated["attrs"]
        updated_objects[sid] = updated

    # New boxes (no spec entry)
    for bid, box in box_by_id.items():
        if bid not in matched_bids:
            updated_objects[bid_to_spec[bid]] = _box_to_spec_obj(box)

    connections = _build_connections(patcher.get("lines", []), bid_to_spec)

    updated = dict(existing_spec)
    updated["objects"] = updated_objects
    updated["connections"] = connections
    updated["width"] = int(rect[2]) if len(rect) > 2 else existing_spec.get("width", 800)
    updated["height"] = int(rect[3]) if len(rect) > 3 else existing_spec.get("height", 600)
    return updated


def embed_spec_in_maxpat(spec, maxpat):
    """Replace (or add) the Claude2Max spec embed box in a .maxpat dict."""
    maxpat = copy.deepcopy(maxpat)
    patcher = maxpat["patcher"]
    boxes = [b for b in patcher.get("boxes", [])
             if b.get("box", {}).get("id") != "obj-spec-embed"]

    max_y = max(
        (b["box"].get("patching_rect", [0, 0, 0, 0])[1] + b["box"].get("patching_rect", [0, 0, 0, 0])[3]
         for b in boxes),
        default=0.0
    )
    boxes.append(build_spec_embed(spec, X_MARGIN, max_y + 40))
    patcher["boxes"] = boxes
    return maxpat


def sync_spec(maxpat):
    """
    Generate or reconcile the embedded spec for a .maxpat.

    Returns (spec_dict, updated_maxpat_dict).
    If no spec is embedded, reverse-engineers one from the patch.
    If a spec is embedded, reconciles it with the current box/line state.
    """
    existing = extract_spec(maxpat)
    spec = reconcile_spec(existing, maxpat) if existing else maxpat_to_spec(maxpat)
    return spec, embed_spec_in_maxpat(spec, maxpat)


# ---------------------------------------------------------------------------
# Core conversion
# ---------------------------------------------------------------------------

def convert_patcher(spec):
    """Convert a spec dict to a .maxpat patcher dict (no top-level wrapper)."""
    objects = spec.get("objects", {})
    connections = spec.get("connections", [])
    width = spec.get("width", 800)
    height = spec.get("height", 600)

    # Validate connections
    for conn in connections:
        if len(conn) not in (4, 5):
            raise ValueError(
                f"Connection must be [src, outlet, dst, inlet] or "
                f"[src, outlet, dst, inlet, attrs], got: {conn}"
            )
        if len(conn) == 5 and not isinstance(conn[4], dict):
            raise ValueError(
                f"Connection 5th element must be an attrs dict, got: {conn[4]!r}"
            )
        src, _, dst, _ = conn[:4]
        if src not in objects:
            raise ValueError(f"Connection source '{src}' not found in objects")
        if dst not in objects:
            raise ValueError(f"Connection destination '{dst}' not found in objects")

    # Layout — patching view
    positions = auto_layout(objects, connections)

    # Layout — presentation view (grid-based hints → presentation_rect)
    layout_cfg  = spec.get("layout", {})
    pres_rects  = presentation_layout(objects, layout_cfg)

    # Build boxes
    boxes = []
    id_map = {}  # user_id -> "obj-N"
    for index, (user_id, obj_spec) in enumerate(objects.items(), start=1):
        x, y = positions.get(user_id, (X_MARGIN, Y_MARGIN))
        box = build_box(user_id, obj_spec, index, x, y)
        # Apply computed presentation_rect for grid-placed objects
        if user_id in pres_rects and isinstance(obj_spec.get("presentation"), dict):
            box["box"]["presentation"]      = 1
            box["box"]["presentation_rect"] = pres_rects[user_id]
        boxes.append(box)
        id_map[user_id] = f"obj-{index}"

    # Build patchlines
    lines = []
    for conn in connections:
        src_id, src_outlet, dst_id, dst_inlet = conn[:4]
        patchline = {
            "destination": [id_map[dst_id], dst_inlet],
            "source": [id_map[src_id], src_outlet],
        }
        if len(conn) == 5:
            patchline.update(conn[4])
        lines.append({"patchline": patchline})

    # Calculate extent for spec embed placement
    max_y = max((positions[uid][1] for uid in objects), default=Y_MARGIN) + 80
    spec_y = max(max_y + 40, height - 200)

    patcher = {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 0,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1,
        },
        "classnamespace": "box",
        "rect": [100.0, 100.0, float(width), float(height)],
        "gridsize": [15.0, 15.0],
        "boxes": boxes,
        "lines": lines,
        "default_fontsize": DEFAULT_FONT_SIZE,
        "default_fontname": DEFAULT_FONT_NAME,
    }

    # Enable presentation mode if any object has presentation data.
    # Accept either field — presentation_rect alone is sufficient.
    has_presentation = any(
        obj.get("presentation") or obj.get("presentation_rect")
        for obj in objects.values()
    )
    if has_presentation:
        patcher["openinpresentation"] = 1

    # Add name as title comment
    name = spec.get("name")
    if name:
        title_box = {
            "box": {
                "id": "obj-title",
                "maxclass": "comment",
                "numinlets": 1,
                "numoutlets": 0,
                "outlettype": [],
                "patching_rect": [float(X_MARGIN), 15.0, 400.0, 24.0],
                "text": name,
                "fontsize": 16.0,
                "fontface": 1,
            }
        }
        patcher["boxes"].insert(0, title_box)

    return patcher


def convert_spec(spec):
    """Convert a spec dict to a complete .maxpat dict with embedded spec."""
    patcher = convert_patcher(spec)

    # Embed the spec as a hidden comment
    max_y = 0.0
    for box_wrapper in patcher["boxes"]:
        rect = box_wrapper["box"].get("patching_rect", [0, 0, 0, 0])
        max_y = max(max_y, rect[1] + rect[3])

    embed_box = build_spec_embed(spec, X_MARGIN, max_y + 40)
    patcher["boxes"].append(embed_box)

    return {"patcher": patcher}


# ---------------------------------------------------------------------------
# Max Compressed Text (MCT) — encode/decode the begin_max5_patcher format
# ---------------------------------------------------------------------------
#
# MCT is the compressed clipboard format Max uses for "Copy Compressed".
# Format: {byte_count}.{JUCE_base64(zlib_compress(json))} wrapped in
#   ----------begin_max5_patcher----------
#   -----------end_max5_patcher-----------
# lines, 60 chars per line.
#
# Encoding algorithm: JUCE MemoryBlock::toBase64Encoding reads bits LSB-first
# within each byte, producing 6-bit chunks in this order for bytes b0,b1,b2:
#   chunk0 = b0[5:0]
#   chunk1 = b0[7:6] | b1[3:0]<<2
#   chunk2 = b1[7:4] | b2[1:0]<<4
#   chunk3 = b2[7:2]
# Alphabet: ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+"
# (period = 0, A–Z = 1–26, a–z = 27–52, 0–9 = 53–62, + = 63)
#
# Sources: cycling74.com/forums/format-of-compressed-json,
#          github.com/juce-framework/JUCE (juce_MemoryBlock.cpp)

_JUCE_ALPHA = ".ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+"
_JUCE_TABLE = {c: i for i, c in enumerate(_JUCE_ALPHA)}


def mct_encode(json_str):
    """Encode a .maxpat JSON string to Max Compressed Text (MCT) format."""
    import zlib as _zlib
    data = json_str.encode("utf-8") if isinstance(json_str, str) else json_str
    compressed = _zlib.compress(data, level=9)
    chars = []
    for i in range(0, len(compressed), 3):
        chunk = compressed[i:i+3]
        n = len(chunk)
        b = [chunk[j] if j < n else 0 for j in range(3)]
        chars.append(_JUCE_ALPHA[b[0] & 0x3F])
        chars.append(_JUCE_ALPHA[(b[0] >> 6) | ((b[1] & 0xF) << 2)])
        if n >= 2:
            chars.append(_JUCE_ALPHA[(b[1] >> 4) | ((b[2] & 0x3) << 4)])
        if n >= 3:
            chars.append(_JUCE_ALPHA[b[2] >> 2])
    encoded = "".join(chars)
    header = f"{len(compressed)}."
    line_len = 60
    first_chunk = line_len - len(header)
    lines = [header + encoded[:first_chunk]]
    pos = first_chunk
    while pos < len(encoded):
        lines.append(encoded[pos:pos + line_len])
        pos += line_len
    body = "\n".join(lines)
    return f"----------begin_max5_patcher----------\n{body}\n-----------end_max5_patcher-----------"


def mct_decode(mct_str):
    """Decode a Max Compressed Text block to a JSON string."""
    import zlib as _zlib
    lines = mct_str.strip().splitlines()
    body = "".join(l for l in lines if not l.startswith("---"))
    i = 0
    while i < len(body) and body[i].isdigit():
        i += 1
    encoded = "".join(c for c in body[i+1:] if c in _JUCE_TABLE)
    result = []
    pos = 0
    while pos < len(encoded):
        rem = len(encoded) - pos
        if rem >= 4:
            v = [_JUCE_TABLE[encoded[pos+j]] for j in range(4)]
            result.append((v[0] & 0x3F) | ((v[1] & 0x3) << 6))
            result.append((v[1] >> 2) | ((v[2] & 0xF) << 4))
            result.append((v[2] >> 4) | ((v[3] & 0x3F) << 2))
            pos += 4
        elif rem == 3:
            v = [_JUCE_TABLE[encoded[pos+j]] for j in range(3)]
            result.append((v[0] & 0x3F) | ((v[1] & 0x3) << 6))
            result.append((v[1] >> 2) | ((v[2] & 0xF) << 4))
            pos += 3
        elif rem == 2:
            v = [_JUCE_TABLE[encoded[pos+j]] for j in range(2)]
            result.append((v[0] & 0x3F) | ((v[1] & 0x3) << 6))
            pos += 2
        else:
            break
    return _zlib.decompress(bytes(result)).decode("utf-8")


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Convert between Claude2Max spec JSON and .maxpat files."
    )
    subparsers = parser.add_subparsers(dest="command", help="Command to run")

    # convert
    p_convert = subparsers.add_parser("convert", help="Convert spec JSON to .maxpat")
    p_convert.add_argument("-i", "--input", help="Input spec JSON file (default: stdin)")
    p_convert.add_argument("-o", "--output", help="Output .maxpat file (default: stdout)")
    p_convert.add_argument("--no-verify", action="store_true",
                           help="Skip the binding-rule + anti-guessing check entirely")
    p_convert.add_argument("--allow-unverified", action="store_true",
                           help="Run the check but build even if it finds errors "
                                "(unresolved object names, invalid attributes). "
                                "Escape hatch — prefer fixing the spec.")

    # extract
    p_extract = subparsers.add_parser("extract", help="Extract spec from .maxpat")
    p_extract.add_argument("-i", "--input", required=True, help="Input .maxpat file")
    p_extract.add_argument("-o", "--output", help="Output spec JSON file (default: stdout)")

    # sync
    p_sync = subparsers.add_parser(
        "sync",
        help="Generate or update embedded spec from a .maxpat (handles patches with or without an existing spec)"
    )
    p_sync.add_argument("-i", "--input", required=True, help="Input .maxpat file")
    p_sync.add_argument("-o", "--output", help="Output .maxpat file (default: overwrite input)")

    # mct
    p_mct = subparsers.add_parser(
        "mct",
        help="Encode a .maxpat to Max Compressed Text (begin_max5_patcher) format for pasting into Max"
    )
    p_mct.add_argument("-i", "--input", required=True, help="Input .maxpat file")

    # verify
    p_verify = subparsers.add_parser(
        "verify",
        help="Run the binding-rule library against .maxpat/.maxhelp/.amxd file(s) or a directory sweep"
    )
    p_verify.add_argument("path", nargs="+",
                          help="File(s) and/or director(y/ies) to check. A directory is walked "
                               "recursively for the requested --kinds.")
    p_verify.add_argument("--kinds", default="maxpat,maxhelp,amxd",
                          help="Comma-separated file kinds to include when a path is a directory "
                               "(default: maxpat,maxhelp,amxd)")
    p_verify.add_argument("--no-resolver", action="store_true",
                          help="Skip the anti-guessing resolver rules (object/attribute/message "
                               "existence) — structural principle rules only")
    p_verify.add_argument("--summary", action="store_true",
                          help="Print an aggregate rule-hit table (rule x count x sample "
                               "locations) instead of per-file reports")
    p_verify.add_argument("--json", action="store_true",
                          help="Emit machine-readable JSON instead of formatted text")
    p_verify.add_argument("--limit", type=int, default=None,
                          help="Stop after this many files (directory sweep)")

    args = parser.parse_args()

    if args.command is None:
        # Default to convert if piped
        args.command = "convert"
        args.input = None
        args.output = None

    if args.command == "convert":
        if args.input:
            with open(args.input, "r") as f:
                spec = json.load(f)
        else:
            spec = json.load(sys.stdin)

        if not getattr(args, "no_verify", False):
            extra_dirs = [Path(args.input).resolve().parent] if args.input else []
            if args.output:
                extra_dirs.append(Path(args.output).resolve().parent)
            if not _gate_spec(spec,
                              allow_unverified=getattr(args, "allow_unverified", False),
                              search_dirs=extra_dirs):
                sys.exit(1)  # blocked — nothing written

        maxpat = convert_spec(spec)
        output = json.dumps(maxpat, indent=2)

        if args.output:
            with open(args.output, "w") as f:
                f.write(output)
                f.write("\n")
        else:
            print(output)

    elif args.command == "extract":
        with open(args.input, "r") as f:
            maxpat = json.load(f)

        try:
            spec = extract_spec(maxpat)
        except SpecEmbedError as exc:
            print(f"Corrupt Claude2Max spec embed: {exc}", file=sys.stderr)
            sys.exit(1)
        if spec is None:
            print("No Claude2Max spec found in this .maxpat file.", file=sys.stderr)
            sys.exit(1)

        output = json.dumps(spec, indent=2)
        if args.output:
            with open(args.output, "w") as f:
                f.write(output)
                f.write("\n")
        else:
            print(output)

    elif args.command == "mct":
        with open(args.input, "r") as f:
            content = f.read()
        print(mct_encode(content))

    elif args.command == "sync":
        with open(args.input, "r") as f:
            maxpat = json.load(f)

        try:
            had_spec = extract_spec(maxpat) is not None
            spec, updated_maxpat = sync_spec(maxpat)
        except SpecEmbedError as exc:
            # Refuse to touch the file. Reverse-engineering a replacement spec
            # here would look like a successful sync while quietly discarding
            # whatever the corrupt embed still held.
            print(f"Corrupt Claude2Max spec embed: {exc} "
                  f"Nothing written to '{args.input}'.", file=sys.stderr)
            sys.exit(1)

        out_path = args.output or args.input
        with open(out_path, "w") as f:
            json.dump(updated_maxpat, f, indent=2)
            f.write("\n")

        action = "reconciled" if had_spec else "generated"
        print(f"Spec {action} — {len(spec.get('objects', {}))} objects, "
              f"{len(spec.get('connections', []))} connections.", file=sys.stderr)
        print(f"Embedded in: {out_path}", file=sys.stderr)
        print(json.dumps(spec, indent=2))

    elif args.command == "verify":
        kinds = tuple(k.strip() for k in args.kinds.split(",") if k.strip())
        targets = iter_verify_targets(args.path, kinds=kinds)
        if args.limit:
            targets = targets[:args.limit]
        if not targets:
            print("No matching files found.", file=sys.stderr)
            sys.exit(1)

        use_resolver = not args.no_resolver
        # Build one resolver up front and reuse it across the whole sweep —
        # building it per file is needless overhead at corpus scale (thousands
        # of files) and unnecessary at single-file scale too.
        resolver = build_resolver() if use_resolver else None
        if use_resolver and (resolver is None or not resolver.healthy()):
            print("[verify] WARNING: anti-guessing resolver unavailable/unhealthy — "
                  "sweeping with structural rules only.", file=sys.stderr)
            resolver = None

        results = []
        any_error = False
        for path in targets:
            res = verify_patch_file(str(path), resolver=resolver, use_resolver=use_resolver)
            res["path"] = str(path)
            results.append(res)
            if res.get("checked") and res["counts"]["error"] > 0:
                any_error = True
            if not args.json and not args.summary:
                if not res.get("checked"):
                    print(f"{path}: NOT CHECKED — {res.get('error', 'unknown')}", file=sys.stderr)
                elif res["violations"]:
                    print(f"\n{path} [{res['mode']}]", file=sys.stderr)
                    print(res["report"], file=sys.stderr)

        if args.json:
            print(json.dumps(results, indent=2))
        elif args.summary:
            # rule name -> {count, severity, examples: [location, ...]}
            by_rule: dict = {}
            n_checked = sum(1 for r in results if r.get("checked"))
            n_unchecked = len(results) - n_checked
            for r in results:
                for v in r.get("violations", []):
                    entry = by_rule.setdefault(
                        v["rule"], {"count": 0, "severity": v["severity"], "examples": []})
                    entry["count"] += 1
                    if len(entry["examples"]) < 3:
                        entry["examples"].append(f"{r['path']}:{v['location']}")
            print(f"Swept {len(results)} file(s) — {n_checked} checked, "
                  f"{n_unchecked} unchecked.")
            print(f"{sum(1 for r in results if r.get('checked') and r['counts']['error'])} "
                  f"file(s) with errors, "
                  f"{sum(1 for r in results if r.get('checked') and r['counts']['warning'])} "
                  f"with warnings.\n")
            for rule, info in sorted(by_rule.items(), key=lambda kv: -kv[1]["count"]):
                print(f"  {info['count']:5d}  [{info['severity']:7s}]  {rule}")
                for ex in info["examples"]:
                    print(f"                        e.g. {ex}")
        else:
            n_checked = sum(1 for r in results if r.get("checked"))
            n_clean = sum(1 for r in results if r.get("checked") and r["ok"])
            print(f"\n{n_checked}/{len(results)} checked, {n_clean} clean.", file=sys.stderr)

        if any_error:
            sys.exit(1)


if __name__ == "__main__":
    main()
