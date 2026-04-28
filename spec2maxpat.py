#!/usr/bin/env python3
"""
spec2maxpat.py — Convert a Claude2Max spec (JSON) to a .maxpat file.

Usage:
    python spec2maxpat.py convert -i spec.json -o patch.maxpat
    python spec2maxpat.py extract -i patch.maxpat -o spec.json
    python spec2maxpat.py sync   -i patch.maxpat
    python spec2maxpat.py mct    -i patch.maxpat   # → Max Compressed Text for clipboard
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
            outlets    = sorted(outletlist.findall("outlet"),
                                key=lambda o: int(o.get("id", 0)))
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
            entry = {
                "type":    attr.get("type", ""),
                "size":    int(attr.get("size", 1)),
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

def guess_newobj_io(text):
    """Guess inlet/outlet counts for a newobj from its text."""
    if not text:
        return None
    parts = text.split()
    obj_name = parts[0]
    args = parts[1:]

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
            n = int(args[0]) if args else 1
            info["numinlets"] = 2
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("switch",):
            n = int(args[0]) if args else 2
            info["numinlets"] = n + 1
            info["numoutlets"] = 1
        elif obj_name in ("spray",):
            n = int(args[0]) if args else 2
            info["numinlets"] = 2
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("funnel",):
            n = int(args[0]) if args else 2
            info["numinlets"] = n
            info["numoutlets"] = 2
        elif obj_name in ("join",):
            n = int(args[0]) if args else 2
            info["numinlets"] = n
            info["numoutlets"] = 1
        elif obj_name in ("unjoin",):
            n = int(args[0]) if args else 2
            info["numinlets"] = 1
            info["numoutlets"] = n
            info["outlettype"] = [""] * n
        elif obj_name in ("selector~",):
            n = int(args[0]) if args else 2
            info["numinlets"] = n + 1
            info["numoutlets"] = 1
            info["outlettype"] = ["signal"]
        elif obj_name in ("matrix~",):
            n_in = int(args[0]) if len(args) > 0 else 2
            n_out = int(args[1]) if len(args) > 1 else 2
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
        src, _, dst, _ = conn
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

    # Parameter enable for live.* objects
    if maxclass.startswith("live."):
        box["box"]["parameter_enable"] = 1
        # live objects need saved_attribute_attributes
        box["box"]["saved_attribute_attributes"] = {
            "valueof": {
                "parameter_longname": user_id,
                "parameter_shortname": user_id,
                "parameter_type": 0,
                "parameter_mmax": 127.0,
                "parameter_mmin": 0.0,
            }
        }

    # Presentation
    pres = obj_spec.get("presentation")
    if pres:
        box["box"]["presentation"] = 1
        if isinstance(pres, list):
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


def extract_spec(maxpat):
    """Extract the Claude2Max spec from a .maxpat dict. Returns dict or None."""
    boxes = maxpat.get("patcher", {}).get("boxes", [])
    for box_wrapper in boxes:
        box = box_wrapper.get("box", {})
        # Check both 'code' (codebox) and 'text' (legacy comment) fields
        text = box.get("code", "") or box.get("text", "")
        if SPEC_MARKER_BEGIN in text:
            start = text.index(SPEC_MARKER_BEGIN) + len(SPEC_MARKER_BEGIN)
            end = text.index(SPEC_MARKER_END)
            spec_json = text[start:end].strip()
            return json.loads(spec_json)
    return None


# ---------------------------------------------------------------------------
# .maxpat → spec  (reverse conversion)
# ---------------------------------------------------------------------------

# Box IDs that are internal Claude2Max scaffolding, never spec objects
_SKIP_BOX_IDS = {"obj-spec-embed", "obj-title"}

# Box attrs to carry back into spec (styling only)
_PRESERVE_ATTRS = {"bgcolor", "textcolor", "color", "fontsize", "fontface", "fontname"}


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
        if len(conn) != 4:
            raise ValueError(f"Connection must be [src, outlet, dst, inlet], got: {conn}")
        src, _, dst, _ = conn
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
        src_id, src_outlet, dst_id, dst_inlet = conn
        lines.append({
            "patchline": {
                "destination": [id_map[dst_id], dst_inlet],
                "source": [id_map[src_id], src_outlet],
            }
        })

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

    # Enable presentation mode if any object has presentation data
    has_presentation = any(obj.get("presentation") for obj in objects.values())
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

        spec = extract_spec(maxpat)
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

        had_spec = extract_spec(maxpat) is not None
        spec, updated_maxpat = sync_spec(maxpat)

        out_path = args.output or args.input
        with open(out_path, "w") as f:
            json.dump(updated_maxpat, f, indent=2)
            f.write("\n")

        action = "reconciled" if had_spec else "generated"
        print(f"Spec {action} — {len(spec.get('objects', {}))} objects, "
              f"{len(spec.get('connections', []))} connections.", file=sys.stderr)
        print(f"Embedded in: {out_path}", file=sys.stderr)
        print(json.dumps(spec, indent=2))


if __name__ == "__main__":
    main()
