#!/usr/bin/env python3
"""fx_shootout_builder.py — first-draft builder for the effect shootout patches.

Builds every `patches/shootouts/<category>-shootout.maxpat` from one slot table, on the
model of `patches/reverb-shootout.maxpat`: one source bus (`s~ SRC_L / SRC_R /
SRC_M`), every effect running in parallel and set 100% wet, a `live.tab` that
picks which one reaches the master through two `selector~` (30 ms crossfade),
and an equal-power master dry/wet.

This script is the FIRST DRAFT only. Once a patch has been opened and edited
in Max, the .maxpat (and the spec embedded in it) is the source of truth —
extract → edit → convert, never re-run this over a patch that has been
touched (CLAUDE.md > Modify, Don't Rebuild). Re-running it overwrites the
files it names.

Every object name, argument order, attribute, message, inlet count and
parameter name in the slot tables below was read from the C74 refpages,
help files, the BEAP clippings, the .amxd files themselves, or `auval -v`
during the 2026-09-08 session that wrote it (see WORK_HISTORY.md).

Usage:  python3 tools/fx_shootout_builder.py [name ...]
        (no names = build them all; names are the keys of PATCHES)
"""
import copy
import glob
import json
import math
import os
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, REPO)
from spec2maxpat import wrapped_lines, wrapped_height  # noqa: E402

MAX = "/Applications/Max.app/Contents/Resources/C74"
BEAP = f"{MAX}/packages/BEAP/clippings"
M4L = f"{MAX}/packages/Max for Live/patchers/Max Audio Effect"
PATCH_DIR = os.path.join(REPO, "patches", "shootouts")
SCRATCH = os.environ.get("FX_SCRATCH", "/tmp")

DARK = [0.13, 0.13, 0.15, 1.0]
AMBER = [1.0, 0.55, 0.0, 1.0]
LIGHT = [0.92, 0.92, 0.92, 1.0]
INK = [0.05, 0.05, 0.05, 1.0]
MID = [0.3, 0.3, 0.32, 1.0]
BGC = [0.08, 0.08, 0.09, 1.0]
FONT = {"fontname": "Monaco", "fontsize": 11.0}

PRES_W = 1400          # presentation row width limit for the panes
PATCH_W = 2300         # patching-view row width limit for the slot blocks
LABEL_H = 20


# ---------------------------------------------------------------------------
# spec builder
# ---------------------------------------------------------------------------

class Spec:
    def __init__(self):
        self.objects = {}
        self.connections = []
        self.labels = []        # presentation-only comments; positioned last

    def add(self, oid, obj):
        assert oid not in self.objects, oid
        self.objects[oid] = obj
        return oid

    def con(self, a, o, b, i):
        assert a in self.objects and b in self.objects, (a, b)
        self.connections.append([a, o, b, i])

    def newobj(self, oid, text, x, y, **kw):
        o = {"type": "newobj", "text": text, "pos": [x, y]}
        o.update(kw)
        return self.add(oid, o)

    def msg(self, oid, text, x, y, **kw):
        o = {"type": "message", "text": text, "pos": [x, y]}
        o.update(kw)
        return self.add(oid, o)

    def comment(self, oid, text, x, y, w=None, **kw):
        o = {"type": "comment", "text": text, "pos": [x, y]}
        if w:
            o["size"] = [w, LABEL_H]
        o.update(kw)
        return self.add(oid, o)

    def label(self, oid, text, rect, color=LIGHT, bold=False, varname=None, lines=None):
        """A presentation-only comment (dark panel background, Monaco 11).
        Sizes the rect for the lines the converter will wrap the text onto and
        returns that height, so callers can budget the row."""
        rect = list(rect)
        if lines is None:
            lines = wrapped_lines(text, rect[2], FONT["fontsize"])
        rect[3] = LABEL_H if lines == 1 else wrapped_height(lines)
        attrs = dict(FONT)
        attrs["textcolor"] = color
        attrs["bgcolor"] = DARK
        if bold:
            attrs["fontface"] = 1
        if varname:
            attrs["varname"] = varname
        if lines > 1:
            attrs["presentation_linecount"] = lines
        o = {"type": "comment", "text": text, "pos": [0, 0],
             "size": [max(40, int(len(text) * 8.5 + 8)), LABEL_H],
             "presentation": list(rect), "attrs": attrs}
        self.add(oid, o)
        self.labels.append(oid)
        return rect[3]

    def panel(self, oid, rect):
        return self.add(oid, {"type": "panel", "pos": [0, 0], "size": [60, 20],
                              "presentation": list(rect),
                              "attrs": {"bgfillcolor": DARK, "bgcolor": DARK,
                                        "rounded": 8, "background": 1}})

    def flonum(self, oid, x, y, lo=None, hi=None, pres=None, integer=False):
        o = {"type": "number" if integer else "flonum", "pos": [x, y]}
        attrs = {}
        if lo is not None:
            attrs["minimum"] = lo
        if hi is not None:
            attrs["maximum"] = hi
        if attrs:
            o["attrs"] = attrs
        if pres:
            o["presentation"] = list(pres)
        return self.add(oid, o)


# ---------------------------------------------------------------------------
# slots
# ---------------------------------------------------------------------------

class Slot:
    """One effect in the shootout. Subclasses implement measure() / build()."""
    kind = "?"

    def __init__(self, short, tab, header, note=None):
        self.short = short      # presentation pane title (after "n · ")
        self.tab = tab          # tab item text (after "n ")
        self.header = header    # patching-view header comment (after "n · ")
        self.note = note        # optional one-line note under the pane
        self.n = None

    # ids
    @property
    def pid(self):
        return f"f{self.n:02d}"

    @property
    def bus(self):
        return f"FX{self.n:02d}"

    def min_pw(self, extra=0):
        """Pane width that keeps the title comment on one line."""
        t = f"{self.n} · {self.short}"
        return int(math.ceil(len(t) * 7.0 * (FONT["fontsize"] / 12.0))) + 8 + 16 + 4 + extra

    def note_h(self, pw):
        if not self.note:
            return 0
        n = wrapped_lines(self.note, pw - 16, FONT["fontsize"])
        return (LABEL_H if n == 1 else wrapped_height(n)) + 4

    def hdr_w(self):
        return int(len(f"{self.n} · {self.header}") * 7.2) + 24

    def title(self, S, px, py, pw, bx=None, by=None):
        """The pane title, with a transparent button over it so clicking the
        title selects the effect: button → [tab index] → s TABSEL → live.tab.
        The button is declared after the comment so it draws on top."""
        p = self.pid
        rect = [px + 8, py + 6, pw - 16, LABEL_H]
        S.label(f"{p}_ptitle", f"{self.n} · {self.short}", rect,
                AMBER, bold=True, varname=f"TITLE_{self.n:02d}")
        if bx is not None:
            # declared AFTER the comment: later boxes draw on top, so the button
            # gets the click (MAX_PATCHING.md > Max .maxpat Internals, z-order)
            S.add(f"{p}_tbtn", {"type": "button", "pos": [bx, by], "presentation": list(rect),
                                "attrs": {"bgcolor": [0.0, 0.0, 0.0, 0.0], "outlinecolor": [0.0, 0.0, 0.0, 0.0],
                                          "blinkcolor": [1.0, 0.55, 0.0, 0.35]}})
            S.msg(f"{p}_tsel", str(self.n - 1), bx, by + 30)
            S.newobj(f"{p}_tsend", "s TABSEL", bx, by + 60)
            S.con(f"{p}_tbtn", 0, f"{p}_tsel", 0)
            S.con(f"{p}_tsel", 0, f"{p}_tsend", 0)

    def hdr(self, S, bx, by, w):
        S.comment(f"{self.pid}_hdr", f"{self.n} · {self.header}", bx, by, w)

    def inputs(self, S, bx, by, ins):
        p = self.pid
        if ins == "stereo":
            S.newobj(f"{p}_rL", "r~ SRC_L", bx, by)
            S.newobj(f"{p}_rR", "r~ SRC_R", bx + 80, by)
            return [f"{p}_rL", f"{p}_rR"]
        S.newobj(f"{p}_rM", "r~ SRC_M", bx, by)
        return [f"{p}_rM"]

    def outputs(self, S, bx, by, x2):
        p = self.pid
        S.newobj(f"{p}_sL", f"s~ {self.bus}_L", bx, by)
        S.newobj(f"{p}_sR", f"s~ {self.bus}_R", x2, by)
        return f"{p}_sL", f"{p}_sR"

    def wire_outs(self, S, src, outs, sL, sR, n_out=None):
        if outs == "stereo":
            S.con(src, 0, sL, 0)
            S.con(src, 1, sR, 0)
        elif outs == "mono":
            S.con(src, 0, sL, 0)
            S.con(src, 0, sR, 0)
        elif outs == "sum":
            for k in range(n_out):
                S.con(src, k, sL, 0)
                S.con(src, k, sR, 0)

    def pane_note(self, S, px, y, pw):
        if self.note:
            return S.label(f"{self.pid}_pnote", self.note, [px + 8, y, pw - 16, LABEL_H]) + 4
        return 0


# --- native MSP / abl object -------------------------------------------------

class Native(Slot):
    """A single object box (plus at most one helper object) with attrui /
    number-box controls.

    text      : the box text
    ins       : "stereo" (r~ SRC_L → in 0, r~ SRC_R → in 1) or "mono" (r~ SRC_M → in 0)
    outs      : "stereo" / "mono" (outlet 0 to both channels) / "sum" (every outlet to both)
    controls  : list of dicts —
        {"attrui": name}                                   → attrui into inlet 0 (of `target`)
        {"flonum": label, "inlet": k, "init": v, "lo", "hi", "int": bool}
                                                            → loadmess → number box → inlet k
        {"toggle": label, "msg": "bypass $1"}              → toggle → message → inlet 0
        {"umenu": label, "items": [...], "msg": "choosePreset $1"}
      each may carry "target": "pre" | "side" | "post" | "feeder" (default "main")
    pre       : {"text": ...}  object between the input and the main object (mono chain)
    side      : {"text": ..., "inlet": k}  object feeding main inlet k (ring-mod oscillator)
    post      : {"text": ..., "n_in": N}  object after main; main outlets 0..N-1 → post inlets 1..N
    feeder    : {"text": ...}  object whose outlet 0 feeds main inlet 0, banged by loadbang
    ui_feeder : {"type": "filtergraph~", "size": [w, h], "attrs": {...}}  presented UI feeding main inlet 0
    wet_msg   : message re-sent by the wet-only broadcast (e.g. "mix 1.")
    io        : optional dict of inlets / outlets / outlettype overrides for the main object
    """
    kind = "native"
    PW = 176
    COL = 140          # patching-view pitch of the number-box columns
    ATTR_W = 150       # room the last attrui of a staircase needs before a column starts
    STEP = 20          # attrui staircase x step
    ROW = 26           # attrui staircase y step

    def __init__(self, short, tab, header, text, ins, outs, controls=(), pre=None, side=None,
                 post=None, feeder=None, ui_feeder=None, wet_msg=None, io=None, note=None,
                 n_out=None, pw=None):
        super().__init__(short, tab, header, note)
        self.text, self.ins, self.outs = text, ins, outs
        self._pw = pw
        self.controls = list(controls)
        self.pre, self.side, self.post, self.feeder, self.ui_feeder = pre, side, post, feeder, ui_feeder
        self.wet_msg, self.io, self.n_out = wet_msg, io or {}, n_out
        if ins == "mono" and not self.note:
            self.note = "mono in → both channels"

    # -- geometry shared by measure() and build() ---------------------------------
    def geom(self):
        g = {}
        g["n_attr"] = sum(1 for c in self.controls if "attrui" in c)
        g["n_col"] = len(self.controls) - g["n_attr"]
        n_fattr = sum(1 for c in self.controls if "attrui" in c and c.get("target") == "feeder")
        x0 = 130
        if self.pre or self.side or self.ui_feeder:
            x0 += 150
        if self.feeder:
            x0 += 120
        g["x0"] = x0
        g["x_col"] = x0 + (self.STEP * (g["n_attr"] - 1) + self.ATTR_W if g["n_attr"] else 0)
        g["x_wet"] = g["x_col"] + self.COL * g["n_col"] + 40
        g["y_feed"] = 70 + self.ROW * n_fattr + 30
        y_main = 70 + self.ROW * max(g["n_attr"], 2) + 30
        if self.pre or self.side or self.ui_feeder:
            y_main = max(y_main, 200)
        if self.feeder:
            y_main = max(y_main, g["y_feed"] + 45)
        g["y_main"] = y_main
        g["y_out"] = y_main + 45 + (45 if self.post else 0)
        text_w = int(len(self.text) * 7) + 24
        feed_w = 100 + int(len(self.feeder["text"]) * 7) + 24 if self.feeder else 0
        g["bw"] = max(460, g["x_wet"] + (120 if self.wet_msg else 0), text_w, feed_w)
        g["bh"] = g["y_out"] + 40
        return g

    def row_h(self, c, pw):
        """Presentation row height for one control: 24, or more if its label wraps."""
        if "flonum" in c:
            lines = wrapped_lines(c["flonum"], pw - 72, FONT["fontsize"])
        elif "toggle" in c:
            lines = wrapped_lines(c["toggle"], pw - 44, FONT["fontsize"])
        else:
            lines = 1
        h = 24 if lines == 1 else int(wrapped_height(lines)) + 4
        if c.get("caption"):
            h += LABEL_H + 4
        return h

    def rows(self):
        pw = self.pw()
        h = sum(self.row_h(c, pw) for c in self.controls)
        if self.ui_feeder:
            h += self.ui_feeder["size"][1] + 4
        return h

    def obj_h(self):
        return wrapped_height(wrapped_lines(self.text, self.pw() - 16), "newobj")

    def pw(self):
        return max(self._pw or self.PW, self.min_pw())

    def measure(self):
        g = self.geom()
        pw = self.pw()
        ph = 30 + self.rows() + self.obj_h() + 8 + self.note_h(pw) + 6
        return pw, ph, max(g["bw"], self.hdr_w()) + 110, g["bh"]

    def build(self, S, px, py, bx, by):
        p = self.pid
        g = self.geom()
        pw, ph, bw, bh = self.measure()
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        ins = self.inputs(S, bx, by + 30, self.ins)

        main = f"{p}_obj"
        obj = {"type": "newobj", "text": self.text, "pos": [bx, by + g["y_main"]]}
        obj.update(self.io)
        S.add(main, obj)
        targets = {"main": main}

        if self.pre:                                    # input → pre → main
            pre = S.newobj(f"{p}_pre", self.pre["text"], bx, by + 140)
            targets["pre"] = pre
            for k, r in enumerate(ins):
                S.con(r, 0, pre, k)
            S.con(pre, 0, main, 0)
        else:
            for k, r in enumerate(ins):
                S.con(r, 0, main, k)

        if self.side:                                   # side → main inlet k
            side = S.newobj(f"{p}_side", self.side["text"], bx + 100, by + 140)
            targets["side"] = side
            S.con(side, 0, main, self.side["inlet"])

        if self.feeder:                                 # loadbang → feeder → main in 0
            lb = S.newobj(f"{p}_lb", "loadbang", bx + 100, by + 70)
            fd = S.newobj(f"{p}_feeder", self.feeder["text"], bx + 100, by + g["y_feed"])
            targets["feeder"] = fd
            S.con(lb, 0, fd, 0)
            S.con(fd, 0, main, 0)

        y_ctl = py + 30
        if self.ui_feeder:                              # presented UI → main in 0
            uf = self.ui_feeder
            o = {"type": uf["type"], "pos": [bx + 100, by + 70], "size": uf["size"],
                 "presentation": [px + 8, y_ctl, uf["size"][0], uf["size"][1]]}
            o.update(uf.get("io", {}))
            if uf.get("attrs"):
                o["attrs"] = uf["attrs"]
            S.add(f"{p}_ui", o)
            S.con(f"{p}_ui", 0, main, 0)
            y_ctl += uf["size"][1] + 4

        x0 = bx + g["x0"]
        i_attr = i_col = 0
        for i, c in enumerate(self.controls):
            tgt = targets.get(c.get("target", "main"), main)
            cid = f"{p}_c{i}"
            if "attrui" in c:
                x, y = x0 + self.STEP * i_attr, by + 70 + self.ROW * i_attr
                i_attr += 1
                S.add(cid, {"type": "attrui", "pos": [x, y],
                            "attrs": {"attr": c["attrui"], "text_width": 82.0},
                            "presentation": [px + 8, y_ctl, pw - 16, 22]})
                S.con(cid, 0, tgt, 0)
            else:
                x = bx + g["x_col"] + self.COL * i_col
                i_col += 1
                if "flonum" in c:
                    S.newobj(f"{cid}_lm", f"loadmess {c['init']}", x, by + 70)
                    S.flonum(cid, x, by + 100, c.get("lo"), c.get("hi"),
                             pres=[px + 8, y_ctl, 50, 22], integer=c.get("int", False))
                    S.con(f"{cid}_lm", 0, cid, 0)
                    S.con(cid, 0, tgt, c["inlet"])
                    S.label(f"{cid}_lbl", c["flonum"], [px + 64, y_ctl + 2, pw - 72, LABEL_H])
                elif "toggle" in c:
                    S.add(cid, {"type": "toggle", "pos": [x, by + 70],
                                "presentation": [px + 8, y_ctl, 22, 22]})
                    S.msg(f"{cid}_m", c["msg"], x, by + 100)
                    S.con(cid, 0, f"{cid}_m", 0)
                    S.con(f"{cid}_m", 0, tgt, 0)
                    S.label(f"{cid}_lbl", c["toggle"], [px + 36, y_ctl + 2, pw - 44, LABEL_H])
                elif "umenu" in c:
                    S.newobj(f"{cid}_lm", "loadmess 0", x + 60, by + 30)
                    S.add(cid, {"type": "umenu", "pos": [x, by + 70], "size": [100, 22],
                                "attrs": {"items": c["items"]},
                                "presentation": [px + 8, y_ctl, pw - 16, 22]})
                    S.msg(f"{cid}_m", c["msg"], x, by + 100)
                    S.con(f"{cid}_lm", 0, cid, 0)
                    S.con(cid, 0, f"{cid}_m", 0)
                    S.con(f"{cid}_m", 0, tgt, 0)
            if c.get("caption"):
                S.label(f"{cid}_cap", c["caption"], [px + 8, y_ctl + 24, pw - 16, LABEL_H])
            y_ctl += self.row_h(c, pw)

        src = main
        if self.post:                                   # main → post → out
            post = S.newobj(f"{p}_post", self.post["text"], bx, by + g["y_main"] + 45)
            targets["post"] = post
            for k in range(self.post["n_in"]):
                S.con(main, k, post, k + 1)
            src = post
        # post-targeted controls were placed above with the others; wire them now
        for i, c in enumerate(self.controls):
            if c.get("target") == "post" and "flonum" in c:
                S.connections.remove([f"{p}_c{i}", 0, main, c["inlet"]])
                S.con(f"{p}_c{i}", 0, targets["post"], c["inlet"])

        oh = self.obj_h()
        obj["presentation"] = [px + 8, y_ctl + 2, pw - 16, oh]
        self.pane_note(S, px, y_ctl + 2 + oh + 6, pw)

        sL, sR = self.outputs(S, bx, by + g["y_out"], bx + 90)
        outs = self.outs
        if self.post and outs != "stereo":
            outs = "mono"
        self.wire_outs(S, src, outs, sL, sR, n_out=self.n_out)

        if self.wet_msg:
            xw = bx + g["x_wet"]
            S.newobj(f"{p}_rwo", "r WETONLY", xw, by + 30)
            S.msg(f"{p}_wet", self.wet_msg, xw, by + 60)
            S.con(f"{p}_rwo", 0, f"{p}_wet", 0)
            S.con(f"{p}_wet", 0, main, 0)


# --- BEAP module -------------------------------------------------------------

_BEAP_CACHE = {}


def beap_clipping(name):
    if name not in _BEAP_CACHE:
        fs = glob.glob(f"{BEAP}/**/bp.{name}.maxpat", recursive=True)
        assert fs, name
        _BEAP_CACHE[name] = json.load(open(fs[0]))["patcher"]["boxes"][0]["box"]
    return _BEAP_CACHE[name]


class Beap(Slot):
    """A BEAP module embedded verbatim from its clipping (the clipping is a
    wrapper: its single box is the module bpatcher, and that box's patcher is
    what we embed — MAX_PATCHING.md > BEAP clipping files are wrappers)."""
    kind = "beap"

    def __init__(self, short, tab, header, clip, varname, ins, outs, mix_dial=None,
                 mix_value="100", note=None, dials=None):
        super().__init__(short, tab, header, note)
        self.clip, self.varname, self.ins, self.outs = clip, varname, ins, outs
        self.mix_dial, self.mix_value = mix_dial, mix_value
        self.dials = dict(dials or {})          # other dials → initial value (set inside the module)
        box = beap_clipping(clip)
        self.w = int(round(box["patching_rect"][2]))
        self.h = int(round(box["patching_rect"][3]))
        if ins == "mono" and not self.note:
            self.note = "mono in → both channels"

    def measure(self):
        pw = max(self.w + 16, self.min_pw())
        ph = 30 + self.h + 8 + self.note_h(pw) + 6
        n_init = len(self.dials) + (1 if self.mix_dial else 0)
        bw = max(self.w + (60 + 240 * n_init if n_init else 20), max(90, self.w - 60) + 100, self.hdr_w()) + 110
        bh = 70 + self.h + 35 + 40 + (30 if n_init else 0)
        return pw, ph, bw, bh

    def build(self, S, px, py, bx, by):
        p = self.pid
        pw, ph, bw, bh = self.measure()
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        ins = self.inputs(S, bx, by + 30, self.ins)

        box = beap_clipping(self.clip)
        inner = copy.deepcopy(box["patcher"])
        inits = dict(self.dials)
        if self.mix_dial:
            inits[self.mix_dial] = float(self.mix_value)
        for dial, val in inits.items():
            hit = False
            for b in inner["boxes"]:
                bb = b["box"]
                if bb.get("varname") == dial:
                    v = bb.setdefault("saved_attribute_attributes", {}).setdefault("valueof", {})
                    v["parameter_initial"] = [float(val)]
                    v["parameter_initial_enable"] = 1
                    hit = True
            assert hit, (self.clip, dial)
        n_in = sum(1 for b in inner["boxes"] if b["box"].get("maxclass") == "inlet")
        n_out = sum(1 for b in inner["boxes"] if b["box"].get("maxclass") == "outlet")
        io_comment = " | ".join(
            [f"in {k}: signal" if k < (2 if self.ins == "stereo" else 1) else f"in {k}: CV (unused)"
             for k in range(n_in)] +
            [f"out {k}: signal" for k in range(n_out)])
        attrs = {"varname": self.varname, "comment": io_comment}
        for k in ("bgmode", "border", "clickthrough", "enablehscroll", "enablevscroll",
                  "lockeddragscroll", "offset", "viewvisibility"):
            if k in box:
                attrs[k] = box[k]
        bp = f"{p}_bp"
        S.add(bp, {"type": "bpatcher", "pos": [bx, by + 70], "size": [self.w, self.h],
                   "presentation": [px + 8, py + 30, self.w, self.h],
                   "attrs": attrs, "maxpat": inner})
        for k, r in enumerate(ins):
            S.con(r, 0, bp, k)
        y_out = by + 70 + self.h + 35
        sL, sR = self.outputs(S, bx, y_out, bx + max(90, self.w - 60))
        self.wire_outs(S, bp, self.outs, sL, sR)
        self.pane_note(S, px, py + 30 + self.h + 6, pw)
        if inits:
            x = bx + self.w + 40
            S.newobj(f"{p}_rwo", "r WETONLY", x, by + 30)
            for k, (dial, val) in enumerate(inits.items()):
                xx = x + 240 * k
                S.msg(f"{p}_wet{k}", fnum(val) if not float(val).is_integer() else str(int(val)), xx, by + 60)
                S.newobj(f"{p}_fwd{k}", f"pattrforward {self.varname}::{dial}", xx, by + 90)
                S.con(f"{p}_rwo", 0, f"{p}_wet{k}", 0)
                S.con(f"{p}_wet{k}", 0, f"{p}_fwd{k}", 0)
            S.comment(f"{p}_wnote",
                      ", ".join(f"{d} → {v}" for d, v in inits.items()) +
                      " on load (the dials' initial values inside the module) and on the wet-only button",
                      bx, y_out + 40, max(300, self.w))


# --- Max for Live device -----------------------------------------------------

class Amxd(Slot):
    """A Max Audio Effect device from Max's own `Max for Live` package, shown
    inline (`viewvisibility 1`, the help-file view attrs). `amxd~` sets a
    device parameter with `<parameter name> <value>`."""
    kind = "amxd"

    def __init__(self, short, tab, header, file, width, wet_param=None, wet_value="100.",
                 note=None):
        super().__init__(short, tab, header, note)
        self.file, self.w = file, int(width)
        self.wet_param, self.wet_value = wet_param, wet_value

    H = 196

    def measure(self):
        pw = max(280, self.w + 20, self.min_pw(60))
        ph = 32 + self.H + 6 + self.note_h(pw) + 8
        wet_w = 300 + int(len(f"{self.wet_param} {self.wet_value}") * 7) + 30 if self.wet_param else 0
        bw = max(460, self.w + 20, self.hdr_w(), wet_w) + 110
        bh = 110 + self.H + 35 + 40
        return pw, ph, bw, bh

    def build(self, S, px, py, bx, by):
        p = self.pid
        pw, ph, bw, bh = self.measure()
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw - 60, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        S.msg(f"{p}_open", "open", bx, by + 30, presentation=[px + pw - 58, py + 6, 50, 22])
        S.newobj(f"{p}_rL", "r~ SRC_L", bx + 70, by + 30)
        S.newobj(f"{p}_rR", "r~ SRC_R", bx + 150, by + 30)
        dev = f"{p}_obj"
        text = f'amxd~ "{self.file}"' if " " in self.file else f"amxd~ {self.file}"
        S.add(dev, {"type": "newobj", "text": text, "pos": [bx, by + 110],
                    "size": [self.w, self.H], "inlets": 3, "outlets": 4,
                    "outlettype": ["signal", "signal", "", ""],
                    "presentation": [px + 8, py + 32, self.w, self.H],
                    "attrs": {"viewvisibility": 1, "bgmode": 1, "border": 0, "clickthrough": 0,
                              "enablehscroll": 0, "enablevscroll": 0, "lockeddragscroll": 0,
                              "lockedsize": 0, "offset": [0.0, 0.0], "varname": f"DEV_{self.n:02d}"}})
        S.con(f"{p}_open", 0, dev, 0)
        S.con(f"{p}_rL", 0, dev, 0)
        S.con(f"{p}_rR", 0, dev, 1)
        if self.wet_param:
            S.newobj(f"{p}_rwo", "r WETONLY", bx + 300, by + 30)
            S.msg(f"{p}_wet", f"{self.wet_param} {self.wet_value}", bx + 300, by + 70)
            S.con(f"{p}_rwo", 0, f"{p}_wet", 0)
            S.con(f"{p}_wet", 0, dev, 0)
        y_out = by + 110 + self.H + 35
        sL, sR = self.outputs(S, bx, y_out, bx + 140)
        self.wire_outs(S, dev, "stereo", sL, sR)
        self.pane_note(S, px, py + 32 + self.H + 6, pw)


# --- Apple AudioUnit through vst~ --------------------------------------------

class AU(Slot):
    """An AudioUnit hosted by `vst~` (`plug_au <name>`). `vst~` sets a named
    parameter with `<name> <float 0..1>` (0 = the parameter's minimum, 1 = its
    maximum — refpage, `anything`), so every init value below is the AU's
    default (or the wet-only choice) normalised into that range."""
    kind = "au"

    def __init__(self, short, tab, header, au, params, note=None):
        super().__init__(short, tab, header, note or "AU parameters: 0–1 of their range")
        self.au = au
        self.params = params      # [(parameter name, init 0..1, label, "flonum"|"toggle")]

    PW = 230

    def col_w(self):
        longest = max(len(f'"{nm}" $1') for nm, *_ in self.params)
        return max(110, int(7 * longest) + 40)

    def row_h(self, lab, pw):
        lines = wrapped_lines(lab, pw - 72, FONT["fontsize"])
        return 24 if lines == 1 else int(wrapped_height(lines)) + 4

    def rows_h(self, pw):
        return sum(self.row_h(lab, pw) for _, _, lab, _ in self.params)

    def measure(self):
        pw = max(self.PW, self.min_pw())
        ph = 58 + self.rows_h(pw) + 8 + 22 + 8 + self.note_h(pw) + 4
        bw = max(520, 200 + self.col_w() * (len(self.params) + 1) + 40, self.hdr_w()) + 110
        bh = 470
        return pw, ph, bw, bh

    def build(self, S, px, py, bx, by):
        p = self.pid
        pw, ph, bw, bh = self.measure()
        n = self.n
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        S.newobj(f"{p}_rL", "r~ SRC_L", bx, by + 30)
        S.newobj(f"{p}_rR", "r~ SRC_R", bx + 80, by + 30)
        vst = f"{p}_obj"
        S.add(vst, {"type": "newobj", "text": "vst~", "pos": [bx, by + 370], "inlets": 2, "outlets": 8,
                    "outlettype": ["signal", "signal", "", "list", "int", "", "", ""],
                    "presentation": [px + 8, py + 58 + self.rows_h(pw) + 8, pw - 16, 22],
                    "attrs": {"varname": f"VST_{n:02d}"}})
        S.con(f"{p}_rL", 0, vst, 0)
        S.con(f"{p}_rR", 0, vst, 1)
        # load the plug-in, then fire the init grid (t fires right to left)
        S.newobj(f"{p}_lb", "loadbang", bx + 200, by + 30)
        S.newobj(f"{p}_t", "t b b", bx + 200, by + 58)
        S.msg(f"{p}_plug", f"plug_au {self.au}", bx + 300, by + 100)
        S.newobj(f"{p}_sinit", f"s AU{n:02d}_INIT", bx + 200, by + 100)
        S.con(f"{p}_lb", 0, f"{p}_t", 0)
        S.con(f"{p}_t", 1, f"{p}_plug", 0)
        S.con(f"{p}_t", 0, f"{p}_sinit", 0)
        S.con(f"{p}_plug", 0, vst, 0)
        S.msg(f"{p}_open", "open", bx + 440, by + 30, presentation=[px + 8, py + 30, 50, 22])
        S.con(f"{p}_open", 0, vst, 0)
        # parameter grid: r AUnn_INIT above, one column per parameter, s TO_VSTnn below
        S.newobj(f"{p}_rinit", f"r AU{n:02d}_INIT", bx + 200, by + 140)
        S.newobj(f"{p}_stov", f"s TO_VST{n:02d}", bx + 200, by + 285)
        cols = [("bypass", 0, "bypass", "toggle")] + list(self.params)
        cw = self.col_w()
        y_row = py + 58
        for j, (name, init, lab, kind) in enumerate(cols):
            x = bx + 200 + cw * j
            cid = f"{p}_p{j}"
            if kind == "toggle":
                S.msg(f"{cid}_i", str(int(init)), x, by + 180)
                S.add(cid, {"type": "toggle", "pos": [x, by + 210],
                            "presentation": [px + 66, py + 30, 22, 22]})
                if j != 0:
                    S.objects[cid]["presentation"] = [px + 8, y_row, 22, 22]
                    S.label(f"{cid}_lbl", lab, [px + 36, y_row + 2, pw - 44, LABEL_H])
                    y_row += self.row_h(lab, pw)
                else:
                    S.label(f"{cid}_lbl", lab, [px + 92, py + 32, 60, LABEL_H])
            else:
                S.msg(f"{cid}_i", fnum(init), x, by + 180)
                S.flonum(cid, x, by + 210, 0.0, 1.0, pres=[px + 8, y_row, 50, 22])
                S.label(f"{cid}_lbl", lab, [px + 64, y_row + 2, pw - 72, LABEL_H])
                y_row += self.row_h(lab, pw)
            qname = f'"{name}"' if " " in name or "/" in name else name
            S.msg(f"{cid}_m", f"{qname} $1", x, by + 240)
            S.con(f"{p}_rinit", 0, f"{cid}_i", 0)
            S.con(f"{cid}_i", 0, cid, 0)
            S.con(cid, 0, f"{cid}_m", 0)
            S.con(f"{cid}_m", 0, f"{p}_stov", 0)
        S.newobj(f"{p}_rtov", f"r TO_VST{n:02d}", bx + 80, by + 330)
        S.con(f"{p}_rtov", 0, vst, 0)
        sL, sR = self.outputs(S, bx, by + 420, bx + 90)
        self.wire_outs(S, vst, "stereo", sL, sR)
        self.pane_note(S, px, py + 58 + self.rows_h(pw) + 8 + 22 + 6, pw)


# ---------------------------------------------------------------------------
# the shared patch
# ---------------------------------------------------------------------------

def build_patch(name, blurb, slots, transport=None):
    S = Spec()
    for i, s in enumerate(slots):
        s.n = i + 2
    N = len(slots) + 1                     # selector inputs incl. DRY
    tab_h = int(21.5 * N + 2)
    top_h = max(380, tab_h + 50)

    # -- header ---------------------------------------------------------------
    S.comment("hdr_note",
              f"{name.upper().replace('-', ' ')} — {blurb} One source bus (s~ SRC_L / SRC_R / SRC_M), "
              f"every effect runs in parallel, the tab picks which one reaches the master via two "
              f"selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; "
              f"the master DRY/WET slider does the global mix (loads at 0.25 wet).",
              20, 12, 900)
    S.objects["hdr_note"]["size"] = [900, 47]

    # -- SOURCE ---------------------------------------------------------------
    S.comment("c_src", "SOURCE — file player, live input (muted on load) and test signals all sum on the bus",
              30, 66, 560)
    S.add("playlist", {"type": "playlist~", "pos": [30, 90], "size": [300, 120], "inlets": 1,
                       "outlets": 5, "outlettype": ["signal", "signal", "signal", "", "dictionary"],
                       "presentation": [20, 40, 300, 200]})
    S.add("ezadc", {"type": "ezadc~", "pos": [360, 210], "presentation": [340, 40, 45, 45]})
    S.add("mute", {"type": "toggle", "pos": [460, 210], "presentation": [340, 92, 22, 22]})
    S.newobj("mute_L", "*~", 360, 300)
    S.newobj("mute_R", "*~", 430, 300)
    S.con("ezadc", 0, "mute_L", 0)
    S.con("ezadc", 1, "mute_R", 0)
    S.con("mute", 0, "mute_L", 1)
    S.con("mute", 0, "mute_R", 1)
    S.comment("c_mute", "live-input mute: toggle × signal, starts closed", 360, 260, 300)
    S.add("btn_impulse", {"type": "button", "pos": [700, 90], "presentation": [340, 130, 24, 24]})
    S.newobj("click", "click~", 700, 130)
    S.newobj("s_test1", "s~ TEST", 700, 170)
    S.con("btn_impulse", 0, "click", 0)
    S.con("click", 0, "s_test1", 0)
    S.add("btn_burst", {"type": "button", "pos": [860, 90], "presentation": [340, 170, 24, 24]})
    S.msg("burst_env", "0.5, 0. 120", 860, 130)
    S.newobj("noise", "noise~", 780, 130)
    S.newobj("burst_line", "line~", 860, 170)
    S.newobj("burst_mul", "*~", 780, 210)
    S.newobj("s_test2", "s~ TEST", 780, 250)
    S.con("btn_burst", 0, "burst_env", 0)
    S.con("burst_env", 0, "burst_line", 0)
    S.con("noise", 0, "burst_mul", 0)
    S.con("burst_line", 0, "burst_mul", 1)
    S.con("burst_mul", 0, "s_test2", 0)
    S.newobj("r_test", "r~ TEST", 250, 300)
    S.newobj("s_src_L", "s~ SRC_L", 30, 385)
    S.newobj("s_src_R", "s~ SRC_R", 150, 385)
    S.con("playlist", 0, "s_src_L", 0)
    S.con("playlist", 1, "s_src_R", 0)
    S.con("mute_L", 0, "s_src_L", 0)
    S.con("mute_R", 0, "s_src_R", 0)
    S.con("r_test", 0, "s_src_L", 0)
    S.con("r_test", 0, "s_src_R", 0)
    S.comment("c_mono", "mono downmix for the mono-input effects (signals sum at the *~ inlet)", 620, 300, 420)
    S.newobj("r_mono_L", "r~ SRC_L", 620, 330)
    S.newobj("r_mono_R", "r~ SRC_R", 700, 330)
    S.newobj("mono_half", "*~ 0.5", 620, 385)
    S.newobj("s_src_M", "s~ SRC_M", 620, 425)
    S.con("r_mono_L", 0, "mono_half", 0)
    S.con("r_mono_R", 0, "mono_half", 0)
    S.con("mono_half", 0, "s_src_M", 0)

    # -- SELECT (tab → v8 → s SEL) ---------------------------------------------
    S.comment("c_tab", f"EFFECT SELECT — live.tab, one column of {N}, conventional order. The v8 maps "
              f"item index → slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title",
              1120, 36, 460)
    S.objects["c_tab"]["size"] = [460, 47]
    S.newobj("lm_tab", "loadmess 0", 1600, 36)
    items = ["1 DRY"] + [f"{s.n} {s.tab}" for s in slots]
    S.add("tab", {"type": "live.tab", "pos": [1140, 90], "size": [340, 150], "outlets": 3,
                  "outlettype": ["", "", "float"], "presentation": [630, 40, 340, tab_h],
                  "attrs": {"num_lines_patching": N, "num_lines_presentation": N,
                            "fontname": "Monaco", "fontsize": 11.0, "spacing_x": 4.0, "spacing_y": 4.0,
                            "rounded": 4.0, "bgcolor": MID, "bgoncolor": AMBER, "textcolor": LIGHT,
                            "textoncolor": INK, "parameter_enable": 1,
                            "saved_attribute_attributes": {
                                "bgcolor": {"expression": ""}, "bgoncolor": {"expression": ""},
                                "textcolor": {"expression": ""}, "textoncolor": {"expression": ""},
                                "valueof": {"parameter_enum": items, "parameter_initial": [0],
                                            "parameter_longname": "FX_SELECT", "parameter_mmax": N - 1,
                                            "parameter_modmode": 0, "parameter_shortname": "FX",
                                            "parameter_type": 2, "parameter_unitstyle": 9}},
                            "varname": "FX_TAB"}})
    S.con("lm_tab", 0, "tab", 0)
    S.newobj("r_tabsel", "r TABSEL", 1500, 8)
    S.con("r_tabsel", 0, "tab", 0)
    S.comment("c_tabsel", "r TABSEL: the transparent button over each pane title sends its tab index here",
              1590, 8, 520)
    S.add("hl_v8", {"type": "newobj", "text": f"v8 fx-shootout-highlight.js {N} @embed 1", "pos": [1140, 330],
                    "inlets": 1, "outlets": 1, "outlettype": [""]})
    S.comment("c_hl", "index → slot number (one column, so index + 1) → s SEL; also lights TITLE_nn",
              1450, 330, 520)
    S.newobj("s_sel", "s SEL", 1140, 370)
    S.con("tab", 0, "hl_v8", 0)
    S.con("hl_v8", 0, "s_sel", 0)

    # -- WET-ONLY broadcast ----------------------------------------------------
    S.comment("c_wetonly", "WET-ONLY — re-sends every effect's mix / dry-wet setting: 500 ms after load, "
              "and from the presented wet-only button", 1640, 66, 560)
    S.newobj("wo_lb", "loadbang", 1640, 100)
    S.newobj("wo_delay", "delay 500", 1640, 140)
    S.newobj("wo_send", "s WETONLY", 1640, 180)
    S.con("wo_lb", 0, "wo_delay", 0)
    S.con("wo_delay", 0, "wo_send", 0)
    S.msg("wo_btn", "wet-only", 1760, 140, presentation=[980, 200, 90, 22],
          attrs=dict(FONT, bgcolor=AMBER, textcolor=INK))
    S.newobj("wo_send2", "s WETONLY", 1760, 180)
    S.con("wo_btn", 0, "wo_send2", 0)

    # -- TRANSPORT (only when something in the patch follows the global transport) --
    if transport:
        S.comment("c_transport", f"TRANSPORT — the global transport; followed by: {transport}", 2000, 230, 500)
        S.newobj("tr_lm", "loadmess 120.", 2000, 260)
        S.flonum("tr_bpm", 2000, 290, 20.0, 300.0, pres=[1110, 262, 54, 22])
        S.msg("tr_tempo", "tempo $1", 2000, 320)
        S.add("tr_run", {"type": "toggle", "pos": [2120, 290], "presentation": [980, 262, 22, 22]})
        S.newobj("tr_obj", "transport", 2000, 360)
        S.con("tr_lm", 0, "tr_bpm", 0)
        S.con("tr_bpm", 0, "tr_tempo", 0)
        S.con("tr_tempo", 0, "tr_obj", 0)
        S.con("tr_run", 0, "tr_obj", 0)
        S.label("p_tr_lbl", f"TRANSPORT — {transport}", [980, 240, 300, LABEL_H], AMBER, bold=True)
        S.label("p_tr_run", "start / stop", [1010, 264, 90, LABEL_H])
        S.label("p_tr_bpm", "bpm", [1170, 264, 50, LABEL_H])

    # -- slots: measure, pack, build ---------------------------------------------
    sizes = [s.measure() for s in slots]
    # presentation rows
    pres_pos = []
    x, y, rowh = 10, top_h + 20, 0
    for s, (pw, ph, bw, bh) in zip(slots, sizes):
        if x > 10 and x + pw > PRES_W:
            x, y, rowh = 10, y + rowh + 10, 0
        pres_pos.append((x, y))
        x += pw + 8
        rowh = max(rowh, ph)
    pres_bottom = y + rowh + 10
    # patching rows
    pat_pos = []
    x, y, rowh = 30, 520, 0
    for s, (pw, ph, bw, bh) in zip(slots, sizes):
        if x > 30 and x + bw > PATCH_W:
            x, y, rowh = 30, y + rowh + 60, 0
        pat_pos.append((x, y))
        x += bw + 40
        rowh = max(rowh, bh)
    pat_bottom = y + rowh + 60
    pat_right = max(px + bw for (px, _), (_, _, bw, _) in zip(pat_pos, sizes))
    for s, (px, py), (bx, by) in zip(slots, pres_pos, pat_pos):
        s.build(S, px, py, bx, by)

    # -- MIXER ----------------------------------------------------------------
    ym = pat_bottom
    S.comment("c_mix", f"MIXER — selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so "
              f"DRY is silence on the wet bus (the master dry path is always live); inlets 2–{N} are the effects",
              30, ym, 1200)
    S.objects["c_mix"]["size"] = [1200, 34]
    for ch, yy in (("L", ym + 60), ("R", ym + 190)):
        S.newobj(f"r_sel_{ch}", "r SEL", 30, yy)
        S.newobj(f"sel_{ch}", f"selector~ {N} 1 @ramptime 30", 30, yy + 50)
        S.newobj(f"s_wet_{ch}", f"s~ WET_{ch}", 30, yy + 100)
        S.con(f"r_sel_{ch}", 0, f"sel_{ch}", 0)
        S.con(f"sel_{ch}", 0, f"s_wet_{ch}", 0)
        for s in slots:
            S.newobj(f"mx_{ch}_{s.n}", f"r~ {s.bus}_{ch}", 120 + 90 * (s.n - 2), yy)
            S.con(f"mx_{ch}_{s.n}", 0, f"sel_{ch}", s.n)

    # -- MASTER ---------------------------------------------------------------
    yM = ym + 340
    S.comment("c_master", "MASTER — global dry/wet crossfade (equal power); wet and dry paths sum at the "
              "live.gain~ inlets → ezdac~", 30, yM, 700)
    S.newobj("mw_rL", "r~ WET_L", 30, yM + 30)
    S.newobj("mw_gain", "r WET_G", 110, yM + 30)
    S.newobj("mw_rR", "r~ WET_R", 200, yM + 30)
    S.newobj("md_rL", "r~ SRC_L", 330, yM + 30)
    S.newobj("md_gain", "r DRY_G", 410, yM + 30)
    S.newobj("md_rR", "r~ SRC_R", 500, yM + 30)
    S.newobj("mw_line", "line~", 110, yM + 70)
    S.newobj("md_line", "line~", 410, yM + 70)
    S.newobj("wetL", "*~", 30, yM + 120)
    S.newobj("wetR", "*~", 200, yM + 120)
    S.newobj("dryL", "*~", 330, yM + 120)
    S.newobj("dryR", "*~", 500, yM + 120)
    S.add("gain", {"type": "live.gain~", "pos": [30, yM + 180], "size": [50, 47],
                   "attrs": {"orientation": 1}, "presentation": [980, 130, 250, 47]})
    S.add("dac", {"type": "ezdac~", "pos": [30, yM + 260], "presentation": [1235, 130, 45, 45]})
    for a, o, b, i in (("mw_rL", 0, "wetL", 0), ("mw_gain", 0, "mw_line", 0), ("mw_rR", 0, "wetR", 0),
                       ("md_rL", 0, "dryL", 0), ("md_gain", 0, "md_line", 0), ("md_rR", 0, "dryR", 0),
                       ("mw_line", 0, "wetL", 1), ("mw_line", 0, "wetR", 1), ("md_line", 0, "dryL", 1),
                       ("md_line", 0, "dryR", 1), ("wetL", 0, "gain", 0), ("dryL", 0, "gain", 0),
                       ("wetR", 0, "gain", 1), ("dryR", 0, "gain", 1), ("gain", 0, "dac", 0),
                       ("gain", 1, "dac", 1)):
        S.con(a, o, b, i)
    # dry/wet control
    xd = 780
    S.comment("c_dw", "DRY/WET 0..1 — wet = sqrt(x), dry = sqrt(1-x); loads at 0.25", xd, yM, 400)
    S.newobj("dw_lm", "loadmess 0.25", xd, yM + 30)
    S.add("dw_slider", {"type": "slider", "pos": [xd, yM + 70], "size": [200, 22],
                        "attrs": {"floatoutput": 1, "size": 1.0, "knobcolor": AMBER,
                                  "elementcolor": MID, "bgcolor": BGC},
                        "presentation": [980, 62, 240, 36]})
    S.flonum("dw", xd, yM + 110, 0.0, 1.0, pres=[1226, 69, 54, 22])
    S.newobj("dw_t", "t f f", xd, yM + 150)
    S.newobj("dw_wet", "expr sqrt($f1)", xd, yM + 190)
    S.newobj("dw_dry", "expr sqrt(1.-$f1)", xd + 150, yM + 190)
    S.msg("dw_wet_ramp", "$1 20", xd, yM + 230)
    S.msg("dw_dry_ramp", "$1 20", xd + 150, yM + 230)
    S.newobj("dw_s_wet", "s WET_G", xd, yM + 270)
    S.newobj("dw_s_dry", "s DRY_G", xd + 150, yM + 270)
    for a, o, b, i in (("dw_lm", 0, "dw_slider", 0), ("dw_slider", 0, "dw", 0), ("dw", 0, "dw_t", 0),
                       ("dw_t", 0, "dw_wet", 0), ("dw_t", 1, "dw_dry", 0),
                       ("dw_wet", 0, "dw_wet_ramp", 0), ("dw_dry", 0, "dw_dry_ramp", 0),
                       ("dw_wet_ramp", 0, "dw_s_wet", 0), ("dw_dry_ramp", 0, "dw_s_dry", 0)):
        S.con(a, o, b, i)

    # -- top panels + their labels ------------------------------------------------
    S.panel("p_src_panel", [10, 10, 600, top_h])
    S.panel("p_shoot_panel", [620, 10, 670, top_h])
    S.label("p_src_title", "SOURCE", [20, 16, 200, LABEL_H], AMBER, bold=True)
    S.label("p_playlist_lbl", "drop audio files on the player, click a clip to play",
            [20, 244, 306, 34], lines=2)
    S.label("p_ezadc_lbl", "live in (DSP on/off)", [392, 52, 200, LABEL_H])
    S.label("p_mute_lbl", "live in OPEN — loads muted", [372, 94, 220, LABEL_H])
    S.label("p_impulse_lbl", "impulse (click~)", [372, 133, 150, LABEL_H])
    S.label("p_burst_lbl", "noise burst 120 ms", [372, 173, 150, LABEL_H])
    S.label("p_shoot_title", f"SHOOTOUT — click an effect; all run in parallel, crossfade in 30 ms",
            [630, 16, 640, LABEL_H], AMBER, bold=True)
    S.label("p_dw_lbl", "DRY / WET  ◄ dry · wet ►  (loads 0.25)", [980, 40, 300, LABEL_H], AMBER, bold=True)
    S.label("p_dw_val", "wet", [1226, 93, 54, LABEL_H])
    S.label("p_gain_lbl", "master", [980, 110, 80, LABEL_H])
    S.label("p_dac_lbl", "audio", [1235, 178, 50, LABEL_H])
    S.label("p_wo_lbl", "re-apply wet-only everywhere", [1075, 203, 205, LABEL_H])

    # -- place the presentation-only labels in a column right of the graph ---------
    lx = max(pat_right, 2400) + 120
    S.comment("c_plbl", "presentation-only labels (they show in the panels)", lx, 30, 330)
    for i, oid in enumerate(S.labels):
        S.objects[oid]["pos"] = [lx, 60 + 26 * i]
    # panels sit in a row under everything in the patching view
    yp = yM + 330
    for i, oid in enumerate(k for k, v in S.objects.items() if v["type"] == "panel"):
        S.objects[oid]["pos"] = [30 + 70 * i, yp]

    spec = {"width": 1444, "height": 900, "bglocked": 1,
            "objects": S.objects, "connections": S.connections}
    extent = (max(1300, max(S.objects[k]["presentation"][0] + S.objects[k]["presentation"][2]
                            for k in S.objects if S.objects[k].get("presentation")) + 10),
              pres_bottom)
    return spec, extent


# ---------------------------------------------------------------------------
# checks on the built file
# ---------------------------------------------------------------------------

def _overlap(a, b):
    return a[0] < b[0] + b[2] and b[0] < a[0] + a[2] and a[1] < b[1] + b[3] and b[1] < a[1] + a[3]


def check_file(path):
    mp = json.load(open(path))
    boxes = [b["box"] for b in mp["patcher"]["boxes"] if b["box"].get("id") != "obj-spec-embed"]
    pres = [b for b in boxes if b.get("presentation") == 1 and b.get("maxclass") != "panel"]
    panels = [b["presentation_rect"] for b in boxes if b.get("maxclass") == "panel"]
    problems = []
    def clear_btn(b):
        return b.get("maxclass") == "button" and (b.get("bgcolor") or [0, 0, 0, 1])[3] == 0
    for i in range(len(pres)):
        for j in range(i + 1, len(pres)):
            if clear_btn(pres[i]) or clear_btn(pres[j]):
                continue
            if _overlap(pres[i]["presentation_rect"], pres[j]["presentation_rect"]):
                problems.append(f"PRES overlap {pres[i].get('text', pres[i]['maxclass'])[:30]!r} × "
                                f"{pres[j].get('text', pres[j]['maxclass'])[:30]!r} "
                                f"{pres[i]['presentation_rect']} {pres[j]['presentation_rect']}")
    for b in pres:
        r = b["presentation_rect"]
        if not any(p[0] <= r[0] and p[1] <= r[1] and r[0] + r[2] <= p[0] + p[2] + 0.5
                   and r[1] + r[3] <= p[1] + p[3] + 0.5 for p in panels):
            problems.append(f"PRES outside every panel {b.get('text', b['maxclass'])[:30]!r} {r}")
    pat = [b for b in boxes if b.get("maxclass") != "panel"]
    for i in range(len(pat)):
        for j in range(i + 1, len(pat)):
            if _overlap(pat[i]["patching_rect"], pat[j]["patching_rect"]):
                problems.append(f"PATCH overlap {pat[i].get('text', pat[i]['maxclass'])[:30]!r} × "
                                f"{pat[j].get('text', pat[j]['maxclass'])[:30]!r} "
                                f"{pat[i]['patching_rect']} {pat[j]['patching_rect']}")
    return problems, len(boxes), len(mp["patcher"]["lines"])


def run(name, blurb, slots, transport=None):
    spec, extent = build_patch(name, blurb, slots, transport)
    spec_path = os.path.join(SCRATCH, f"{name}.spec.json")
    out = os.path.join(PATCH_DIR, f"{name}.maxpat")
    json.dump(spec, open(spec_path, "w"), indent=1)
    r = subprocess.run([sys.executable, os.path.join(REPO, "spec2maxpat.py"), "convert",
                        "-i", spec_path, "-o", out], capture_output=True, text=True)
    tail = "\n".join(r.stderr.strip().splitlines()[-12:])
    if r.returncode != 0:
        print(f"[{name}] CONVERT FAILED\n{tail}")
        return False
    problems, nb, nl = check_file(out)
    c = subprocess.run([sys.executable, os.path.join(REPO, "spec2maxpat.py"), "sync", "-i", out, "--check"],
                       capture_output=True, text=True)
    print(f"[{name}] {len(slots)} effects, {nb} boxes / {nl} cords, presentation {extent[0]}×{extent[1]}, "
          f"sync --check {'matches' if c.returncode == 0 else 'MISMATCH'}, {len(problems)} layout problems")
    for p in problems[:40]:
        print("   ", p)
    verify = [ln for ln in r.stderr.splitlines() if "[verify]" in ln][:3]
    for v in verify:
        print("   ", v)
    return not problems


# ---------------------------------------------------------------------------
# slot tables — every fact here was read from a refpage / help file / clipping /
# .amxd / auval during the 2026-09-08 session
# ---------------------------------------------------------------------------

def att(*names, target="main"):
    return [{"attrui": n, "target": target} for n in names]


def fl(label, inlet, init, lo=None, hi=None, integer=False, target="main"):
    return {"flonum": label, "inlet": inlet, "init": init, "lo": lo, "hi": hi, "int": integer, "target": target}


def umenu(label, items, msg):
    toks = []
    for it in items:
        if toks:
            toks.append(",")
        toks.extend(it.split(" "))
    return {"umenu": label, "items": toks, "msg": msg}


def amxd(short, tab, header, file, width, wet=None, wet_value="100.", note=None):
    return Amxd(short, tab, header, file, width, wet, wet_value, note)


def au(short, tab, header, name, params, note=None):
    return AU(short, tab, header, name, params, note)


def norm(v, lo, hi):
    return round((v - lo) / (hi - lo), 4)


def fnum(v):
    """A float literal Max reads as a float: 0.5, 1., 0.0458"""
    t = f"{float(v):.4g}"
    if "." not in t and "e" not in t:
        t += "."
    return t


PATCHES = {}
TRANSPORT = {   # which effects follow Max's global transport (tempo / start-stop), per patch
    "delay-shootout": "BEAP Sync Delay",
    "modulation-shootout": "Flange-o-tron, DopplerPan",
    "filter-devices-shootout": "Cyclotron (internal sync mode)",
    "special-fx-shootout": "Xformer, CutKiller",
}

# ---- delay ------------------------------------------------------------------
PATCHES["delay-shootout"] = ("delay lines: Ableton delays, BEAP modules, Max for Live devices and Apple's AudioUnit delay.", [
    Native("abl delay~", "abl delay~", "abl.device.delay~ — Live's Delay device (ableton-dsp package); delay is in seconds",
           "abl.device.delay~ @mix 1. @delay 0.25 0.375 @feedback 0.4", "stereo", "stereo",
           controls=[{"attrui": "delay", "caption": "delay: seconds, left right"}]
                    + att("feedback", "pingpong", "filter", "filter_frequency", "filter_width", "modtime", "modfreq", "mix"),
           wet_msg="mix 1.", pw=260),
    Native("abl echo~", "abl echo~", "abl.device.echo~ — Live's Echo device (modulation delay with reverb); delay is in seconds",
           "abl.device.echo~ @mix 1. @delay 0.25 0.375 @feedback 0.4 @reverb 0.5", "stereo", "stereo",
           controls=[{"attrui": "delay", "caption": "delay: seconds, left right"}]
                    + att("feedback", "mod_delay", "mod_freq", "reverb", "width", "channel_mode", "mix"),
           wet_msg="mix 1.", pw=260),
    Native("abl spectraltime~", "abl spectraltime~", "abl.device.spectraltime~ — Live's Spectral Time (spectral delay / freeze); delay_time in seconds",
           "abl.device.spectraltime~ @mix 1. @delay_mix 1. @delay_time 0.25 @feedback 0.4", "stereo", "stereo",
           controls=[{"attrui": "delay_time", "caption": "delay_time: seconds"}]
                    + att("feedback", "delay_mix", "freeze", "spray", "shift", "tilt", "resolution", "mix"),
           wet_msg="mix 1."),
    Beap("BEAP Feedback Delay", "BEAP Feedback Delay", "bp.Feedback Delay — BEAP module, mono, Mix dial",
         "Feedback Delay", "FX_FBDELAY", "mono", "mono", mix_dial="Mix"),
    Beap("BEAP Sync Delay", "BEAP Sync Delay", "bp.Sync Delay — BEAP module, stereo, note-value delays from the global transport",
         "Sync Delay", "FX_SYNCDELAY", "stereo", "stereo", mix_dial="Mix"),
    amxd("amxd Tapped Delay", "amxd Tapped Delay", "amxd~ Tapped Delay.amxd — 16 equally spaced taps with level and pan (Max for Live package)",
         "Tapped Delay.amxd", 412, "wet/dry"),
    amxd("amxd DelayTaps", "amxd DelayTaps", "amxd~ Max DelayTaps.amxd — multi-tap delay, taps drawn as multislider shapes",
         "Max DelayTaps.amxd", 584, "Dry/Wet"),
    amxd("amxd DelayMultiBand", "amxd DelayMultiBand", "amxd~ Max DelayMultiBand.amxd — cascaded cross~ split, one delay per band",
         "Max DelayMultiBand.amxd", 376),
    amxd("amxd Space Echo", "amxd Space Echo", "amxd~ Space Echo.amxd — RE-201-style tape delay with warble and inertia",
         "Space Echo.amxd", 278, "wet/dry"),
    amxd("amxd SpectralDelay", "amxd SpectralDelay", "amxd~ Max SpectralDelay.amxd — pfft~ per-bin delay",
         "Max SpectralDelay.amxd", 504, "Dry/Wet"),
    amxd("amxd Pitch & Echo", "amxd Pitch & Echo", "amxd~ Pitch & Echo.amxd — pitch transposer inside a delay line (harmonizer echo)",
         "Pitch & Echo.amxd", 320, "Dry/Wet"),
    amxd("amxd Feedback Network", "amxd Feedback Network", "amxd~ Feedback Network.amxd — five bandpass + delay units cross-fed, randomised",
         "Feedback Network.amxd", 548, "wet/dry", "1."),
    au("AU Delay", "AU Delay", "vst~ + plug_au AUDelay — Apple's AudioUnit delay", "AUDelay",
       [("Delay Time", norm(0.25, 0.0001, 2.0), "delay time (0–2 s)", "flonum"),
        ("Feedback", norm(50, -99.9, 99.9), "feedback (±99.9 %)", "flonum"),
        ("Dry/Wet Mix", 1.0, "dry/wet (→ wet)", "flonum"),
        ("Lowpass Cutoff Frequency", norm(15000, 10, 22050), "lowpass (10 Hz–22 kHz)", "flonum")]),
])

# ---- modulation ---------------------------------------------------------------
PATCHES["modulation-shootout"] = ("phaser, flanger, chorus, vibrato, tremolo and panning effects.", [
    Native("abl phaser~", "abl phaser~", "abl.dsp.phaser~ — Live's Phaser (ableton-dsp package)",
           "abl.dsp.phaser~ @mix 1.", "stereo", "stereo",
           controls=att("mod", "mod_freq", "notches", "center", "spread", "feedback", "blend", "mix"), wet_msg="mix 1."),
    Native("abl flanger~", "abl flanger~", "abl.dsp.flanger~ — Live's Flanger",
           "abl.dsp.flanger~ @mix 1.", "stereo", "stereo",
           controls=att("mod", "mod_freq", "time", "feedback", "envelope", "env_amount", "waveform", "mix"), wet_msg="mix 1."),
    Native("abl chorus~", "abl chorus~", "abl.dsp.chorus~ — Live's Chorus-Ensemble, chorus mode",
           "abl.dsp.chorus~ @mix 1.", "stereo", "stereo",
           controls=att("rate", "mod", "feedback", "width", "warmth", "mix"), wet_msg="mix 1."),
    Native("abl ensemble~", "abl ensemble~", "abl.dsp.ensemble~ — Live's Chorus-Ensemble, ensemble mode",
           "abl.dsp.ensemble~ @mix 1.", "stereo", "stereo",
           controls=att("rate", "mod", "feedback", "shaping", "width", "warmth", "mix"), wet_msg="mix 1."),
    Native("abl vibrato~", "abl vibrato~", "abl.dsp.vibrato~ — Live's Chorus-Ensemble, vibrato mode",
           "abl.dsp.vibrato~ @mix 1.", "stereo", "stereo",
           controls=att("rate", "mod", "offset", "feedback", "width", "mix"), wet_msg="mix 1."),
    Native("abl doubler~", "abl doubler~", "abl.dsp.doubler~ — Live's Doubler (short modulated delay)",
           "abl.dsp.doubler~ @mix 1.", "stereo", "stereo",
           controls=att("mod", "mod_freq", "time", "feedback", "lfo_blend", "mix"), wet_msg="mix 1."),
    Beap("BEAP Chorus", "BEAP Chorus", "bp.Chorus — BEAP module, mono in / stereo out", "Chorus", "FX_CHORUS", "mono", "stereo"),
    Beap("BEAP Flanger", "BEAP Flanger", "bp.Flanger — BEAP module, mono in / stereo out", "Flanger", "FX_FLANGER", "mono", "stereo"),
    amxd("amxd Chorus x2", "amxd Chorus x2", "amxd~ Chorus x2.amxd — two-band chorus (Max for Live package)", "Chorus x2.amxd", 424, "wet/dry"),
    amxd("amxd Flange-o-tron", "amxd Flange-o-tron", "amxd~ Flange-o-tron.amxd — flanger driven by two step sequencers", "Flange-o-tron.amxd", 403, "wet/dry"),
    amxd("amxd Swirl", "amxd Swirl", "amxd~ Swirl.amxd — mono-to-stereo delay-time modulation", "Swirl.amxd", 308, "wet_dry"),
    amxd("amxd Vibrato Cauldron", "amxd Vibrato Cauldron", "amxd~ Vibrato Cauldron.amxd — allpass pair modulated by smoothed noise", "Vibrato Cauldron.amxd", 250, "wet_dry"),
    amxd("amxd Tremellow", "amxd Tremellow", "amxd~ Tremellow.amxd — stereo tremolo / panning", "Tremellow.amxd", 372, "wet/dry"),
    amxd("amxd Pitch & Vibrato", "amxd Pitch & Vibrato", "amxd~ Pitch & Vibrato.amxd — pitchshift~ with a double-LFO vibrato", "Pitch & Vibrato.amxd", 248, "Dry/Wet"),
    amxd("amxd Audio Rate Pan", "amxd Audio Rate Pan", "amxd~ Audio Rate Pan.amxd — panning at audio rate with modulated rate", "Audio Rate Pan.amxd", 496),
    amxd("amxd DopplerPan", "amxd DopplerPan", "amxd~ Max DopplerPan.amxd — Doppler panner synced to the transport", "Max DopplerPan.amxd", 320),
    amxd("amxd Warpoon", "amxd Warpoon", "amxd~ Warpoon.amxd — ambient chorus, four modulated stereo taps", "Warpoon.amxd", 336, "wet_dry_level"),
    amxd("amxd Nebula", "amxd Nebula", "amxd~ Nebula.amxd — amplitude / phase-inversion swirl for stereo width", "Nebula.amxd", 296),
    amxd("amxd Pendulum", "amxd Pendulum", "amxd~ Pendulum.amxd — four-tap delay swept by a ramp oscillator", "Pendulum.amxd", 250, "wet_dry"),
])

# ---- pitch / ring mod / frequency shift -------------------------------------------
PATCHES["pitch-shootout"] = ("ring modulation, frequency shifting, pitch shifting, harmonizers and retuning.", [
    Native("ring mod (cycle~ *~)", "cycle~ ring mod", "cycle~ → *~ — classic ring modulation (two objects)",
           "*~", "mono", "mono",
           controls=[fl("carrier (Hz)", 0, 440.0, 0.1, 10000.0, target="side")],
           side={"text": "cycle~", "inlet": 1}),
    Native("freqshift~", "freqshift~", "freqshift~ — time-domain frequency shifter (outlet 1 = negative sideband)",
           "freqshift~", "mono", "mono", controls=[fl("shift (Hz)", 1, 100.0, -5000.0, 5000.0)]),
    Native("pitchshift~", "pitchshift~", "pitchshift~ 2 — Ztx pitch shifter, stereo (outlet 2 reports latency)",
           "pitchshift~ 2 @pitchshift 1.5 @quality good", "stereo", "stereo",
           controls=att("pitchshift", "pitchshiftcent", "quality"),
           io={"inlets": 3, "outlets": 3, "outlettype": ["signal", "signal", ""]}),
    Native("retune~", "retune~", "retune~ 440 — Ztx pitch detection + retuning to the nearest note",
           "retune~ 440", "mono", "mono",
           controls=att("retune", "correction_amount", "correction_threshold", "quality")),
    Native("abl ringmod~", "abl ringmod~", "abl.dsp.ringmod~ — Live's ring modulator with drive",
           "abl.dsp.ringmod~ @mix 1.", "stereo", "stereo",
           controls=att("frequency", "enable_drive", "drive", "mix"), wet_msg="mix 1."),
    Native("abl pitchshifter~", "abl pitchshifter~", "abl.dsp.pitchshifter~ — Live's Shifter pitch mode",
           "abl.dsp.pitchshifter~ @mix 1.", "stereo", "stereo",
           controls=att("shift", "window", "wide", "mix"), wet_msg="mix 1."),
    Beap("BEAP Frequency Shifter", "BEAP Freq Shifter", "bp.Frequency Shifter — BEAP module (out 0 = shifted; out 1 = the other sideband, unused)",
         "Frequency Shifter", "FX_FREQSHIFT", "mono", "mono"),
    Beap("BEAP Retuner", "BEAP Retuner", "bp.Retuner — BEAP module around retune~", "Retuner", "FX_RETUNER", "mono", "mono"),
    amxd("amxd AutoRingMod", "amxd AutoRingMod", "amxd~ Max AutoRingMod.amxd — ring mod whose frequency follows the input envelope", "Max AutoRingMod.amxd", 348, "Dry/Wet"),
    amxd("amxd Simple Pitch Shifter", "amxd Simple Pitch Shifter", "amxd~ Simple Pitch Shifter.amxd — pitchshift~ with latency compensation", "Simple Pitch Shifter.amxd", 128, "Dry/Wet"),
    amxd("amxd Dual Harmonizer", "amxd Dual Harmonizer", "amxd~ Dual Harmonizer.amxd — two mono pitch shifters with vibrato and feedback", "Dual Harmonizer.amxd", 438, "Dry/Wet"),
    amxd("amxd Autotuna", "amxd Autotuna", "amxd~ Autotuna.amxd — retune~ auto-tuner with Scala scale files", "Autotuna.amxd", 378, "Dry/Wet"),
    amxd("amxd Microtuner", "amxd Microtuner", "amxd~ Microtuner.amxd — table-based microtonal auto-tuner", "Microtuner.amxd", 606, "Dry/Wet"),
    amxd("amxd Speed Shifter", "amxd Speed Shifter", "amxd~ Speed Shifter.amxd — two tape loops at different speeds feeding back", "Speed Shifter.amxd", 250, "wet/dry"),
    amxd("amxd SpectralHarm", "amxd SpectralHarm", "amxd~ Max SpectralHarm.amxd — pfft~ spectral harmonizer", "Max SpectralHarm.amxd", 456, "Dry/Wet"),
    au("AU Pitch", "AU Pitch", "vst~ + plug_au AUPitch — Apple's pitch shifter", "AUPitch",
       [("Pitch", norm(700, -2400, 2400), "pitch (±2400 cents)", "flonum"),
        ("Effect Blend", 1.0, "blend (→ wet)", "flonum"),
        ("Smoothness", 0.5, "smoothness", "flonum"),
        ("Tightness", 0.5, "tightness", "flonum")]),
    au("AU NewPitch", "AU NewPitch", "vst~ + plug_au AUNewPitch — Apple's newer pitch shifter", "AUNewPitch",
       [("Pitch Scale", norm(700, -2400, 2400), "pitch (±2400 cents)", "flonum"),
        ("Smoothness", norm(8, 3, 32), "smoothness (3–32)", "flonum")]),
])

# ---- filters (MSP + abl) ------------------------------------------------------------
PATCHES["filter-shootout"] = ("MSP and Ableton filter objects (the BEAP modules and the devices have their own patches).", [
    Native("svf~", "svf~", "svf~ → selector~ 4 — state-variable filter; the number picks the outlet (1 LP, 2 HP, 3 BP, 4 notch)",
           "svf~", "mono", "mono",
           controls=[fl("cutoff (Hz)", 1, 800.0, 20.0, 11025.0), fl("resonance", 2, 0.5, 0.0, 1.0),
                     fl("out 1 LP 2 HP 3 BP 4 notch", 0, 1, 1, 4, integer=True, target="post")],
           post={"text": "selector~ 4 1", "n_in": 4}),
    Native("lores~", "lores~", "lores~ — resonant lowpass", "lores~ 1000. 0.5", "mono", "mono",
           controls=att("cutoff", "resonance")),
    Native("reson~", "reson~", "reson~ — resonant bandpass", "reson~ 1. 1000. 10.", "mono", "mono",
           controls=att("cf", "q", "gain")),
    Native("onepole~", "onepole~", "onepole~ — single-pole lowpass", "onepole~", "mono", "mono",
           controls=[fl("cutoff (Hz)", 1, 1000.0, 1.0, 20000.0)]),
    Native("biquad~ + filtergraph~", "biquad~+filtergraph~", "filtergraph~ → biquad~ — the graphical filter editor pair (autoout sends coefficients on load)",
           "biquad~", "mono", "mono",
           ui_feeder={"type": "filtergraph~", "size": [160, 100], "attrs": {"autoout": 1},
                      "io": {"inlets": 8, "outlets": 7,
                             "outlettype": ["list", "float", "float", "float", "float", "list", "int"]}}),
    Native("cross~", "cross~", "cross~ → selector~ 2 — third-order crossover (1 = low band, 2 = high band)",
           "cross~", "mono", "mono",
           controls=[fl("crossover (Hz)", 1, 1000.0, 20.0, 20000.0),
                     fl("out 1 low 2 high", 0, 1, 1, 2, integer=True, target="post")],
           post={"text": "selector~ 2 1", "n_in": 2}),
    Native("fffb~", "fffb~", "fffb~ 4 200. 2. 10. — fixed filter bank, four bandpasses an octave apart, outlets summed",
           "fffb~ 4 200. 2. 10.", "mono", "sum", n_out=4,
           io={"outlets": 4, "outlettype": ["signal", "signal", "signal", "signal"]}),
    Native("cascade~ + filterdesign", "cascade~+filterdesign", "filterdesign → cascade~ — designed IIR filter as second-order sections",
           "cascade~", "mono", "mono",
           feeder={"text": "filterdesign @topology butterworth @response lowpass @frequency 1000. @order 4"},
           controls=att("frequency", "order", "response", "topology", target="feeder")),
    Native("phaseshift~", "phaseshift~", "phaseshift~ — second-order allpass (hear it against the dry path in the master mix)",
           "phaseshift~", "mono", "mono",
           controls=[fl("frequency (Hz)", 1, 1000.0, 20.0, 20000.0), fl("Q", 2, 2.0, 0.1, 20.0)]),
    Native("abl autofilter~", "abl autofilter~", "abl.device.autofilter~ — Live's Auto Filter (inlets 2–3 are the sidechain, unused)",
           "abl.device.autofilter~ @mix 1. @frequency 1200 @resonance 0.4", "stereo", "stereo",
           controls=att("frequency", "resonance", "filtertype", "circuit", "drive", "filterslope",
                        "lfoamount", "lforate", "envamount", "mix"), wet_msg="mix 1."),
    Native("abl filther~", "abl filther~", "abl.dsp.filther~ — distorted lowpass (help file: 1200 0.5 0.2)",
           "abl.dsp.filther~ 1200 0.5 0.2", "mono", "mono", controls=att("frequency", "resonance", "drive")),
    Native("abl meldfilter~", "abl meldfilter~", "abl.dsp.meldfilter~ — Meld's meta-filter (help file: 4000 0.4 0.7)",
           "abl.dsp.meldfilter~ 4000 0.4 0.7", "mono", "mono", controls=att("frequency", "type", "macro1", "macro2")),
    Native("abl dfm~", "abl dfm~", "abl.dsp.dfm~ — digitally modelled analog lowpass (help file: 800 0. 0.5)",
           "abl.dsp.dfm~ 800 0. 0.5", "mono", "mono", controls=att("frequency", "resonance", "pregain")),
    Native("abl vowel~", "abl vowel~", "abl.dsp.vowel~ — vowel bandpass filter",
           "abl.dsp.vowel~ @frequency 800. @resonance 0.5", "mono", "mono", controls=att("frequency", "resonance", "morph")),
    Native("abl modalresonator~", "abl modalresonator~", "abl.dsp.modalresonator~ — modal resonator (help file: 400 0.25)",
           "abl.dsp.modalresonator~ 400 0.25", "mono", "mono",
           controls=att("frequency", "decay", "damping", "ratio", "resonator_type")),
    Native("abl spectralresonator~", "abl spectralresonator~", "abl.device.spectralresonator~ — Live's Spectral Resonator",
           "abl.device.spectralresonator~ @mix 1.", "stereo", "stereo",
           controls=att("frequency", "harmonics", "decay", "unison", "voices", "shift", "stretch", "mod_rate", "mix"),
           wet_msg="mix 1."),
])

# ---- filters (BEAP) ------------------------------------------------------------
PATCHES["filter-beap-shootout"] = ("the BEAP filter modules (Max's BEAP package); every module's CV inlets are left unconnected.", [
    Beap("BEAP LPF", "BEAP LPF", "bp.LPF — BEAP lowpass", "LPF", "FX_LPF", "mono", "mono"),
    Beap("BEAP HPF", "BEAP HPF", "bp.HPF — BEAP highpass", "HPF", "FX_HPF", "mono", "mono"),
    Beap("BEAP MMF", "BEAP MMF", "bp.MMF — BEAP multimode filter", "MMF", "FX_MMF", "mono", "mono"),
    Beap("BEAP Ladder", "BEAP Ladder", "bp.Ladder — BEAP ladder filter", "Ladder", "FX_LADDER", "mono", "mono"),
    Beap("BEAP Diode Ladder", "BEAP Diode Ladder", "bp.Diode Ladder — BEAP diode ladder filter", "Diode Ladder", "FX_DIODELADDER", "mono", "mono"),
    Beap("BEAP Triple Morphing", "BEAP Triple Morphing", "bp.Triple Morphing Filter — three reson~ banks, morphed", "Triple Morphing Filter", "FX_TRIPLEMORPH", "mono", "mono"),
    Beap("BEAP Classroom Filter", "BEAP Classroom Filter", "bp.Classroom Filter — teaching filter with a spectral display", "Classroom Filter", "FX_CLASSROOM", "mono", "mono"),
    Beap("BEAP VBWBP", "BEAP VBWBP", "bp.VBWBP — variable-bandwidth bandpass (cascade~)", "VBWBP", "FX_VBWBP", "mono", "mono"),
    Beap("BEAP MFFB", "BEAP MFFB", "bp.MFFB — morphing fixed filter bank (in 1 = sync, unused)", "MFFB", "FX_MFFB", "mono", "mono"),
    Beap("BEAP Spectral Filter", "BEAP Spectral Filter", "bp.Spectral Filter — drawable spectral filter (in 1 = sync, unused)", "Spectral Filter", "FX_SPECFILT", "mono", "mono"),
    Beap("BEAP Comb Filter", "BEAP Comb Filter", "bp.Comb Filter — BEAP comb filter, Mix dial", "Comb Filter", "FX_COMB", "mono", "mono", mix_dial="Mix"),
])

# ---- filters (devices) -------------------------------------------------------------
PATCHES["filter-devices-shootout"] = ("filter devices: Max for Live package devices and Apple AudioUnit filters.", [
    amxd("amxd Phone Filter", "amxd Phone Filter", "amxd~ Phone Filter.amxd — telephone bandwidth + hiss", "Phone Filter.amxd", 250, "wet/dry"),
    amxd("amxd Mangle Filter", "amxd Mangle Filter", "amxd~ Mangle Filter.amxd — amplitude- and delay-modulation from the input level", "Mangle Filter.amxd", 309, "wet_dry"),
    amxd("amxd Harmonic Filter", "amxd Harmonic Filter", "amxd~ Harmonic Filter.amxd — 25 bandpasses driven by a cellular automaton", "Harmonic Filter.amxd", 737),
    amxd("amxd AutoFilter", "amxd AutoFilter", "amxd~ Max AutoFilter.amxd — one-band filter following the input envelope", "Max AutoFilter.amxd", 452, "Dry/Wet"),
    amxd("amxd FilterTaps", "amxd FilterTaps", "amxd~ FilterTaps.amxd — filtered delay taps in a poly~", "FilterTaps.amxd", 422, "dry/wet"),
    amxd("amxd Spectral Filter", "amxd Spectral Filter", "amxd~ Spectral Filter.amxd — 256-band drawable pfft~ filter", "Spectral Filter.amxd", 350, "wet/dry"),
    amxd("amxd Comber", "amxd Comber", "amxd~ Comber.amxd — two modulated comb filters", "Comber.amxd", 252, "wet/dry"),
    amxd("amxd CombFilterMulti", "amxd CombFilterMulti", "amxd~ Max CombFilterMulti.amxd — five comb filters in a poly~", "Max CombFilterMulti.amxd", 339, "Dry/Wet"),
    amxd("amxd Cyclotron", "amxd Cyclotron", "amxd~ Cyclotron.amxd — step-sequenced lowpass / bandpass (needs its internal sync mode)", "Cyclotron.amxd", 440),
    au("AU Bandpass", "AU Bandpass", "vst~ + plug_au AUBandpass", "AUBandpass",
       [("Center Frequency", norm(1000, 20, 22050), "center (20 Hz–22 kHz)", "flonum"),
        ("Bandwidth", norm(600, 100, 12000), "bandwidth (100–12000 cents)", "flonum")]),
    au("AU Hipass", "AU Hipass", "vst~ + plug_au AUHipass", "AUHipass",
       [("Cutoff Frequency", norm(1000, 10, 22050), "cutoff (10 Hz–22 kHz)", "flonum"),
        ("Resonance", norm(0, -20, 40), "resonance (−20–40 dB)", "flonum")]),
    au("AU Lowpass", "AU Lowpass", "vst~ + plug_au AULowpass", "AULowpass",
       [("Cutoff Frequency", norm(1000, 10, 21829.5), "cutoff (10 Hz–22 kHz)", "flonum"),
        ("Resonance", norm(0, -20, 40), "resonance (−20–40 dB)", "flonum")]),
])

# ---- EQ --------------------------------------------------------------------------
PATCHES["eq-shootout"] = ("equalisers: Live's Channel EQ, the Max for Live EQ devices and Apple's AudioUnit EQs.", [
    Native("abl channeleq~", "abl channeleq~", "abl.device.channeleq~ — Live's Channel EQ (help file: -20. 3. 800 -12)",
           "abl.device.channeleq~ -6. 3. 800 -6", "stereo", "stereo",
           controls=att("lowgain", "midgain", "midfreq", "highgain", "highpass", "gain")),
    amxd("amxd EqGraphic31", "amxd EqGraphic31", "amxd~ Max EqGraphic31.amxd — 31-band graphic EQ", "Max EqGraphic31.amxd", 625),
    amxd("amxd EqParametric4", "amxd EqParametric4", "amxd~ Max EqParametric4.amxd — four parametric bands", "Max EqParametric4.amxd", 568),
    amxd("amxd EqShelving", "amxd EqShelving", "amxd~ Max EqShelving.amxd — low / high shelving", "Max EqShelving.amxd", 250),
    au("AU Filter", "AU Filter", "vst~ + plug_au AUFilter — Apple's five-band filter/EQ", "AUFilter",
       [("Low Gain", 0.5, "low gain (±18 dB)", "flonum"),
        ("Center Gain 1", 0.5, "center 1 gain (±18 dB)", "flonum"),
        ("Center Freq 1", norm(625, 10, 21829.5), "center 1 freq", "flonum"),
        ("High Gain", 0.5, "high gain (±18 dB)", "flonum"),
        ("High Frequency", norm(10000, 10, 21829.5), "high freq", "flonum")]),
    au("AU GraphicEQ", "AU GraphicEQ", "vst~ + plug_au AUGraphicEQ — 10 / 31 band graphic EQ (parameters are named by band)", "AUGraphicEQ",
       [("Number of Bands", 1.0, "bands (0 = 10, 1 = 31)", "flonum"),
        ("100.0 Hz", 0.5, "100 Hz (±20 dB)", "flonum"),
        ("1000.0 Hz", 0.5, "1 kHz (±20 dB)", "flonum"),
        ("10000.0 Hz", 0.5, "10 kHz (±20 dB)", "flonum")]),
    au("AU NBandEQ", "AU NBandEQ", "vst~ + plug_au AUNBandEQ — N-band EQ (by-name messages reach the first band)", "AUNBandEQ",
       [("Global Gain", norm(0, -96, 24), "global gain", "flonum"),
        ("Bypass", 0.0, "band 1 bypass (0 = active)", "flonum"),
        ("Frequency", norm(1000, 10, 21609), "band 1 freq", "flonum"),
        ("Gain", norm(0, -96, 24), "band 1 gain", "flonum"),
        ("Bandwidth", norm(0.5, 0.05, 5), "band 1 bandwidth", "flonum")]),
    au("AU ParametricEQ", "AU ParametricEQ", "vst~ + plug_au AUParametricEQ", "AUParametricEQ",
       [("Center Frequency", norm(2000, 20, 21829.5), "center (20 Hz–22 kHz)", "flonum"),
        ("Q", norm(10, 1, 20), "Q (1–20)", "flonum"),
        ("Gain", 0.5, "gain (±20 dB)", "flonum")]),
    au("AU HighShelf", "AU HighShelf", "vst~ + plug_au AUHighShelfFilter", "AUHighShelfFilter",
       [("Cutoff Frequency", 0.0, "cutoff (10–22 kHz)", "flonum"),
        ("Gain", 0.5, "gain (±40 dB)", "flonum")]),
    au("AU LowShelf", "AU LowShelf", "vst~ + plug_au AULowShelfFilter", "AULowShelfFilter",
       [("Cutoff Frequency", norm(80, 10, 200), "cutoff (10–200 Hz)", "flonum"),
        ("Gain", 0.5, "gain (±40 dB)", "flonum")]),
])

# ---- distortion (MSP + abl) -------------------------------------------------------
PATCHES["distortion-shootout"] = ("MSP and Ableton distortion, saturation, waveshaping and lo-fi objects.", [
    Native("overdrive~", "overdrive~", "overdrive~ — soft-clipping distortion, drive 1–10",
           "overdrive~", "mono", "mono", controls=[fl("drive (1–10)", 1, 4.0, 1.0, 10.0)]),
    Native("degrade~", "degrade~", "degrade~ — sample-rate and bit-depth reduction",
           "degrade~", "mono", "mono",
           controls=[fl("rate ratio (0–1)", 1, 0.25, 0.01, 1.0), fl("bits", 2, 8, 1, 24, integer=True)]),
    Native("*~ → clip~", "*~ clip~", "*~ 6 → clip~ -1. 1. — hard clipping after a gain stage",
           "clip~ -1. 1.", "mono", "mono",
           controls=[fl("drive (gain)", 1, 6.0, 1.0, 40.0, target="pre")], pre={"text": "*~"}),
    Native("*~ → tanh~", "*~ tanh~", "*~ 8 → tanh~ — smooth saturation after a gain stage",
           "tanh~", "mono", "mono",
           controls=[fl("drive (gain)", 1, 8.0, 1.0, 40.0, target="pre")], pre={"text": "*~"}),
    Native("*~ → pong~", "*~ pong~", "*~ 3 → pong~ 0 -0.3 0.3 — wavefolding (mode fold / wrap / clip)",
           "pong~ 0 -0.3 0.3", "mono", "mono",
           controls=[fl("drive (gain)", 1, 3.0, 1.0, 20.0, target="pre")] + att("mode"), pre={"text": "*~"}),
    Native("round~", "round~", "round~ — quantises the signal to a step (bit-crush by amplitude)",
           "round~", "mono", "mono", controls=[fl("step", 1, 0.1, 0.001, 1.0)]),
    Native("downsamp~", "downsamp~", "downsamp~ — sample-and-hold every N samples",
           "downsamp~", "mono", "mono", controls=[fl("hold (samples)", 1, 32, 1, 512, integer=True)]),
    Native("deltaclip~", "deltaclip~", "deltaclip~ — slew-rate limiting as distortion",
           "deltaclip~", "mono", "mono",
           controls=[fl("min slope", 1, -0.02, -1.0, 0.0), fl("max slope", 2, 0.02, 0.0, 1.0)]),
    Native("abl distortion~", "abl distortion~", "abl.dsp.distortion~ — Live's Pedal, distortion mode",
           "abl.dsp.distortion~ @mix 1.", "stereo", "stereo",
           controls=att("gain", "bass", "mid", "midfreq", "treble", "sub", "mix"), wet_msg="mix 1."),
    Native("abl overdrive~", "abl overdrive~", "abl.dsp.overdrive~ — Live's Pedal, overdrive mode",
           "abl.dsp.overdrive~ @mix 1.", "stereo", "stereo",
           controls=att("gain", "bass", "mid", "midfreq", "treble", "sub", "mix"), wet_msg="mix 1."),
    Native("abl fuzz~", "abl fuzz~", "abl.dsp.fuzz~ — Live's Pedal, fuzz mode",
           "abl.dsp.fuzz~ @mix 1.", "stereo", "stereo",
           controls=att("gain", "bass", "mid", "midfreq", "treble", "sub", "mix"), wet_msg="mix 1."),
    Native("abl saturator~", "abl saturator~", "abl.dsp.saturator~ — Live's Saturator",
           "abl.dsp.saturator~ @mix 1. @drive 12", "stereo", "stereo",
           controls=att("drive", "curve", "gain", "post_clip", "oversample", "mix"), wet_msg="mix 1."),
    Native("abl waveshaper~", "abl waveshaper~", "abl.dsp.waveshaper~ — Live's Saturator waveshaper",
           "abl.dsp.waveshaper~ @mix 1. @drive 12", "stereo", "stereo",
           controls=att("drive", "shaper_drive", "curve", "depth", "period", "linearity", "damping", "gain", "mix"),
           wet_msg="mix 1."),
    Native("abl expshaper~", "abl expshaper~", "abl.dsp.expshaper~ — exponential shaper (help file: 0.4)",
           "abl.dsp.expshaper~ 0.4", "mono", "mono", controls=att("amount")),
    Native("abl redux~", "abl redux~", "abl.device.redux~ — Live's Redux (downsample + bit reduction)",
           "abl.device.redux~ @mix 1.", "stereo", "stereo",
           controls=att("bitdepth", "rate", "shape", "jitter", "prefilter", "post_filter", "mix"), wet_msg="mix 1."),
    Native("abl roar~", "abl roar~", "abl.device.roar~ — Live's Roar three-stage saturator",
           "abl.device.roar~ @mix 1.", "stereo", "stereo",
           controls=att("shaper_amount_1", "shaper_type_1", "routing", "filter_frequency_1", "tone_amount",
                        "feedback_amount", "compressor_amount", "blend", "mix"), wet_msg="mix 1."),
    Native("abl drumbuss~", "abl drumbuss~", "abl.device.drumbuss~ — Live's Drum Buss",
           "abl.device.drumbuss~ @mix 1.", "stereo", "stereo",
           controls=att("drive", "distortion", "crunch", "boom", "boomfreq", "transients", "damping", "compressor", "mix"),
           wet_msg="mix 1."),
])

# ---- distortion (modules and devices) ----------------------------------------------
PATCHES["distortion-modules-shootout"] = ("distortion in BEAP modules, Max for Live devices and Apple's AudioUnit.", [
    Beap("BEAP Wavefolder", "BEAP Wavefolder", "bp.Wavefolder — BEAP wavefolder", "Wavefolder", "FX_WAVEFOLD", "mono", "mono"),
    Beap("BEAP Waveshaper", "BEAP Waveshaper", "bp.Waveshaper — BEAP waveshaper (in 1 = gain CV, unused)", "Waveshaper", "FX_WAVESHAPE", "mono", "mono"),
    Beap("BEAP Folder", "BEAP Folder", "bp.Folder — BEAP fold / wrap / clip (in 1–2 = CV, unused)", "Folder", "FX_FOLDER", "mono", "mono"),
    Beap("BEAP Diode", "BEAP Diode", "bp.Diode — BEAP half-wave rectifier (+ only / − only)", "Diode", "FX_DIODE", "mono", "mono"),
    amxd("amxd PluggoFuzz", "amxd PluggoFuzz", "amxd~ PluggoFuzz.amxd — four clipping modes with in/out filters", "PluggoFuzz.amxd", 520),
    amxd("amxd Waveshaper", "amxd Waveshaper", "amxd~ Waveshaper.amxd — drawable transfer curve", "Waveshaper.amxd", 432),
    amxd("amxd MonsterCrunch", "amxd MonsterCrunch", "amxd~ MonsterCrunch.amxd — huge gain, hard clip, lowpass", "MonsterCrunch.amxd", 424, "wet-dry"),
    amxd("amxd WasteBand", "amxd WasteBand", "amxd~ WasteBand.amxd — three bands, each mute / pass / overdrive", "WasteBand.amxd", 422),
    amxd("amxd Noyzckippr", "amxd Noyzckippr", "amxd~ Noyzckippr.amxd — multiplies the input by bandpassed noise", "Noyzckippr.amxd", 250,
         note="wet_dry_left / wet_dry_right → 100 on load and on wet-only"),
    au("AU Distortion", "AU Distortion", "vst~ + plug_au AUDistortion — Apple's multi-stage distortion", "AUDistortion",
       [("Soft Clip Gain", norm(-6.0206, -80, 20), "soft clip gain (−80–20 dB)", "flonum"),
        ("Wet/Dry Mix", 1.0, "wet/dry (→ wet)", "flonum"),
        ("Decimation", 0.5, "decimation", "flonum"),
        ("Decimation Mix", 0.5, "decimation mix", "flonum"),
        ("Polynomial Mix", 0.5, "polynomial mix", "flonum")]),
])
# Noyzckippr has two wet params (left / right) — send both
_noyz = PATCHES["distortion-modules-shootout"][1][8]
_noyz.wet_param, _noyz.wet_value = "wet_dry_left", "100., wet_dry_right 100."

# ---- dynamics ---------------------------------------------------------------------
PATCHES["dynamics-shootout"] = ("compressors, limiters, companders and gain shapers.", [
    Native("omx.comp~", "omx.comp~", "omx.comp~ — OctiMax broadcast compressor (presets via choosePreset)",
           "omx.comp~", "stereo", "stereo",
           controls=[umenu("preset", ["Guitar", "Bass", "Vocal", "Drums", "Program Material"], "choosePreset $1"),
                     {"toggle": "bypass", "msg": "bypass $1"}]),
    Native("omx.peaklim~", "omx.peaklim~", "omx.peaklim~ — OctiMax peak limiter",
           "omx.peaklim~", "stereo", "stereo",
           controls=[umenu("mode", ["Punchy", "Smooth"], "mode $1"), {"toggle": "bypass", "msg": "bypass $1"}]),
    Native("omx.4band~", "omx.4band~", "omx.4band~ — OctiMax 4-band compressor",
           "omx.4band~", "stereo", "stereo",
           controls=[umenu("preset", ["Standard", "Pop", "Movies"], "choosePreset $1"), {"toggle": "bypass", "msg": "bypass $1"}]),
    Native("omx.5band~", "omx.5band~", "omx.5band~ — OctiMax 5-band compressor",
           "omx.5band~", "stereo", "stereo",
           controls=[umenu("preset", ["Universal", "Pop", "Hit_Radio", "FM_Radio"], "choosePreset $1"),
                     {"toggle": "bypass", "msg": "bypass $1"}]),
    Native("limi~", "limi~", "limi~ 2 — lookahead peak limiter, stereo",
           "limi~ 2", "stereo", "stereo",
           controls=att("threshold", "preamp", "postamp", "release", "lookahead", "mode"),
           io={"inlets": 2, "outlets": 2, "outlettype": ["signal", "signal"]}),
    Native("abl compressor~", "abl compressor~", "abl.device.compressor~ — Live's Compressor (mono; help file's attack / release / threshold)",
           "abl.device.compressor~ @attack 0.02 @release 0.08 @threshold -20", "mono", "mono",
           controls=att("threshold", "ratio", "attack", "release", "gain")),
    Native("abl limiter~", "abl limiter~", "abl.device.limiter~ — Live's Limiter",
           "abl.device.limiter~", "stereo", "stereo",
           controls=att("ceiling", "gain", "release", "lookahead", "autorelease", "maximize")),
    Native("abl compander~", "abl compander~", "abl.dsp.compander~ — compressor / expander (mono)",
           "abl.dsp.compander~", "mono", "mono", controls=att("mode", "shape")),
    Beap("BEAP Compressor", "BEAP Compressor", "bp.Compressor — BEAP stereo compressor", "Compressor", "FX_COMPRESSOR", "stereo", "stereo"),
    amxd("amxd Max Compressor", "amxd Max Compressor", "amxd~ Max Compressor.amxd — omx.comp~ with a full interface", "Max Compressor.amxd", 548),
    amxd("amxd Dynamical", "amxd Dynamical", "amxd~ Dynamical.amxd — drawable dynamics curve: compress, expand, gate", "Dynamical.amxd", 440),
    au("AU DynamicsProcessor", "AU Dynamics", "vst~ + plug_au AUDynamicsProcessor", "AUDynamicsProcessor",
       [("Compression Threshold", norm(-15, -100, 20), "threshold (−100–20 dB)", "flonum"),
        ("Headroom", norm(5.6, 0.1, 40), "headroom (0.1–40 dB)", "flonum"),
        ("Attack Time", norm(0.05, 0.001, 0.3), "attack (1–300 ms)", "flonum"),
        ("Release Time", norm(0.03, 0.01, 3.0), "release (10 ms–3 s)", "flonum"),
        ("Master Gain", 0.5, "master gain (±40 dB)", "flonum")]),
    au("AU PeakLimiter", "AU PeakLimiter", "vst~ + plug_au AUPeakLimiter", "AUPeakLimiter",
       [("Pre-Gain", 0.5, "pre-gain (±40 dB)", "flonum"),
        ("Attack Time", norm(0.002, 0.0005, 0.03), "attack (0.5–30 ms)", "flonum"),
        ("Release Time", norm(0.005, 0.001, 0.04), "release (1–40 ms)", "flonum")]),
    au("AU MultibandCompressor", "AU Multiband", "vst~ + plug_au AUMultibandCompressor", "AUMultibandCompressor",
       [("Pre-Gain", 0.5, "pre-gain (±40 dB)", "flonum"),
        ("Post-Gain", 0.5, "post-gain (±40 dB)", "flonum"),
        ("Threshold 1", norm(-22, -100, 0), "threshold 1 (−100–0 dB)", "flonum"),
        ("Attack Time", norm(0.08, 0.001, 0.2), "attack (1–200 ms)", "flonum"),
        ("Release Time", norm(0.12, 0.01, 3.0), "release (10 ms–3 s)", "flonum")]),
])

# ---- special (granular, rhythmic, spectral) ----------------------------------------
PATCHES["special-fx-shootout"] = ("granular, rhythmic and other Max for Live package effects that fit no other category.", [
    amxd("amxd Fragulator", "amxd Fragulator", "amxd~ Fragulator.amxd — chops the input into fragments and loops them", "Fragulator.amxd", 265, "wet_dry"),
    amxd("amxd Granular-to-go", "amxd Granular-to-go", "amxd~ Granular-to-go.amxd — live granular synthesis", "Granular-to-go.amxd", 427, "wet_dry"),
    amxd("amxd Stutterer", "amxd Stutterer", "amxd~ Stutterer.amxd — snapshot-and-loop stutter effect", "Stutterer.amxd", 475, "wet_dry"),
    amxd("amxd SquirrelParade", "amxd SquirrelParade", "amxd~ SquirrelParade.amxd — four granular channels with a modulation matrix", "SquirrelParade.amxd", 406, "wet/dry"),
    amxd("amxd Raindrops", "amxd Raindrops", "amxd~ Raindrops.amxd — a field of moving bandpass particles", "Raindrops.amxd", 250, "wet/dry"),
    amxd("amxd Rye", "amxd Rye", "amxd~ Rye.amxd — Pluggo granular with phase-reversal stereo", "Rye.amxd", 265, "wet/dry"),
    amxd("amxd Wheat", "amxd Wheat", "amxd~ Wheat.amxd — Pluggo granular with a per-grain pitch envelope", "Wheat.amxd", 514, "wet_dry"),
    amxd("amxd Xformer", "amxd Xformer", "amxd~ Xformer.amxd — rhythmic mute / accent groove (transport-driven)", "Xformer.amxd", 604),
    amxd("amxd CutKiller", "amxd CutKiller", "amxd~ Max CutKiller.amxd — rhythmic cutting synced to the transport", "Max CutKiller.amxd", 484, "Dry/wet"),
    amxd("amxd EffectMatrix", "amxd EffectMatrix", "amxd~ Max EffectMatrix.amxd — several effects routed through a matrix~", "Max EffectMatrix.amxd", 574),
    amxd("amxd Average Injector", "amxd Average Injector", "amxd~ Average Injector.amxd — delay and amplitude modulated by the average level", "Average Injector.amxd", 360, "wet_dry"),
])


if __name__ == "__main__":
    names = sys.argv[1:] or list(PATCHES)
    ok = True
    for nm in names:
        blurb, slots = PATCHES[nm]
        ok = run(nm, blurb, slots, TRANSPORT.get(nm)) and ok
    sys.exit(0 if ok else 1)
