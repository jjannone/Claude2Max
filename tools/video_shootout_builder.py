#!/usr/bin/env python3
"""video_shootout_builder.py — first-draft builder for the video effect shootouts.

Builds every `patches/shootouts/video/video-<category>-shootout.maxpat`, the video
twin of `tools/fx_shootout_builder.py` (the audio shootouts). One source (a movie
player that loads Max's own `chickens.mp4`, or the webcam), one effect at a time,
a `live.tab` that picks which, and a master dry/wet crossfade into an embedded
`jit.pworld` display.

How a frame travels (every stage is a GL texture, never a CPU matrix):

    jit.playlist / jit.grab → switch 2 → s VSRC
    r VSRC → gate N ──outlet n-1──→ s VINnn → [effect nn] → s VFXnn
    r VFXnn → switch N inlet n  (inlet 1 = the dry source: slot 1 is DRY)
    r VSRC → jit.fx.tr.xfade in 0 (dry, hot) ; switch → in 1 (wet)
          → jit.gl.layer @blend_enable 0 → drawn into the jit.pworld

The `gate` means only the chosen effect is fed, so twenty GPU effects do not all
run at once. The cost: a time-based effect (delay, feedback, trails) starts
from empty each time it is selected.

Two options per patch (the third item of a PATCHES entry):
  two_sources — clip B (a second jit.playlist, loads sunflower.mp4) on s VSRCB,
                received at each slot's `b_inlets` (the blend, mix and CPU patches).
  matrix      — the effects are CPU (matrix) objects: the source is read back
                into a 640 × 360 jit.matrix before the gate (`t b l` copies the
                texture in, then bangs it out), and clip B into s VSRCB_M.

A GPU slot whose CPU predecessor still ships (jit.brcosa → jit.fx.brcosa …)
says so in its pane note (`cpu=`); the CPU shootout holds only the CPU objects
with no newer version. Effects whose work grows with frame size per pass
(pixelsorting, bsort: one pass per pixel column; kuwahara: a large kernel) get
their input shrunk first (`pre_dim=`) with jit.gl.texture @adapt 0 @dim, the
idiom Vizzie's own SLIDR uses.

Two kinds of slot:
  Fx  — a Jitter FX object from Max's Jitter Tools package (`jit.fx.*`), with an
        attrui per attribute, the effect's reason to exist first
        (MAX_PATCHING.md > A comparison pane leads with the control...).
  Vz  — a Vizzie module, loaded by name in a bpatcher exactly as its clipping in
        `packages/Vizzie/clippings/` does, drawn inline with its own dials.

This script is the FIRST DRAFT only. Once a patch has been opened and edited in
Max, the .maxpat is the source of truth: edit its boxes and sync, never re-run
this over it (CLAUDE.md > Never Use convert Unless It Is Specifically Needed).

Sources for every name and value below (read 2026-09-26):
  * jit.fx.* names, ports, attributes and defaults: the refpages in
    `packages/Jitter Tools/docs/jit.fx/`, the scripts in `code/fx/js`, the
    shaders in `code/fx/jxs`, and `init/jitter-tools-objectmappings.txt`.
  * demo values: the object's own help file (box text, or the range of the
    `fx.param.anim` animator the help wires to that attribute).
  * the source / display wiring: `jit.fx.wake.maxhelp` (jit.playlist
    @output_texture 1 → effect → jit.gl.layer @blend_enable 0, jit.pworld).
  * Vizzie: each clipping's single bpatcher box, and the module patcher's inlet
    comments and dial ranges. A demo value is sent into a Vizzie inlet ONLY when
    that inlet's dial runs 0–1, because a Vizzie data inlet wraps its input into
    0–1 and passes it to the dial as-is (patchers/utils/data-handler.maxpat).

Usage:  python3 tools/video_shootout_builder.py [name ...]
        (no names = build them all; names are the keys of PATCHES)
"""
import glob
import json
import os
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(REPO, "tools"))
sys.path.insert(0, REPO)
import fx_shootout_builder as fx  # noqa: E402  (shared Spec, Slot, colours, checks)
from fx_shootout_builder import (Spec, Slot, FONT, DARK, AMBER, LIGHT, INK, MID,  # noqa: E402
                                 LABEL_H, wrapped_lines, wrapped_height)

C74 = "/Applications/Max.app/Contents/Resources/C74"
VIZZIE = f"{C74}/packages/Vizzie/clippings"
PATCH_DIR = os.path.join(REPO, "patches", "shootouts", "video")
SCRATCH = os.environ.get("FX_SCRATCH", "/tmp")

PRES_W = 1400
PATCH_W = 2300

# The movie jit.playlist loads on open: the clip Cycling '74's own jit.fx help
# files use, stored in the box exactly as those help files store it.
DEMO_CLIP = {"clips": [{"absolutepath": "chickens.mp4", "filename": "chickens.mp4",
                        "filekind": "moviefile", "id": "u169008532", "loop": 1,
                        "content_state": {}}]}
# The second clip, for effects with two inputs: the one the same help files put
# in their second jit.playlist (jit.fx.co.screen.maxhelp, jit.fx.tr.dissolve.maxhelp).
DEMO_CLIP_B = {"clips": [{"absolutepath": "sunflower.mp4", "filename": "sunflower.mp4",
                          "filekind": "moviefile", "id": "u169008533", "loop": 1,
                          "content_state": {}}]}


# ---------------------------------------------------------------------------
# slots
# ---------------------------------------------------------------------------

class VSlot(Slot):
    """Shared names for a video slot: VINnn in, VFXnn out; `bname` (set by
    build_patch) is the channel carrying the B clip to inlets in b_inlets."""
    b_inlets = ()
    bname = "VSRCB"

    def wire_b(self, S, target, port_xs, bx, y):
        """One [r <bname>] straight above each B inlet of `target`."""
        for k in self.b_inlets:
            rb = S.newobj(f"{self.pid}_rb{k}", f"r {self.bname}", bx + port_xs(k) - 19, y)
            S.con(rb, 0, target, k)

    @property
    def vin(self):
        return f"VIN{self.n:02d}"

    @property
    def vfx(self):
        return f"VFX{self.n:02d}"


class Fx(VSlot):
    """One Jitter FX object: r VINnn → object → s VFXnn, an attrui per attribute."""
    kind = "fx"
    PW = 250
    STEP = 20
    ROW = 26
    ATTR_W = 150

    def __init__(self, text, header, controls=(), note=None, pw=None, cpu=None, b_inlets=(), pre_dim=None):
        cls = text.split()[0]
        short = cls[len("jit."):] if cls.startswith("jit.") else cls
        if cpu:   # the older CPU (matrix) object this one replaces
            note = "; ".join(x for x in (note, f"newer GPU version of the CPU object {cpu}") if x)
        if b_inlets:
            note = "; ".join(x for x in (note, ", ".join(f"in {k} = clip B" for k in b_inlets)) if x)
        if pre_dim:   # the jit.gl.texture @adapt 0 @dim idiom Vizzie's SLIDR uses to rescale its input
            note = "; ".join(x for x in (note, f"input downsampled to {pre_dim[0]} × {pre_dim[1]} first "
                                               f"(its cost grows with the frame size)") if x)
        super().__init__(short, short, f"{cls} — {header}", note)
        self.pre_dim = pre_dim
        self.text = text
        self.controls = list(controls)
        self._pw = pw
        self.b_inlets = tuple(b_inlets)

    def text_w(self):
        return int(len(self.text) * 7) + 24

    def pre_h(self):
        return 45 if self.pre_dim else 0

    def pw(self):
        return max(self._pw or self.PW, self.min_pw())

    def obj_h(self):
        return wrapped_height(wrapped_lines(self.text, self.pw() - 16), "newobj")

    def rows_h(self):
        return 23 * len(self.controls)

    def geom(self):
        n = len(self.controls)
        y_main = 70 + self.ROW * max(n, 2) + 30 + (40 if self.b_inlets else 0) + self.pre_h()
        return {"y_main": y_main, "y_out": y_main + 45,
                "bw": max(460, 120 + self.STEP * max(n - 1, 0) + self.ATTR_W + 40, self.text_w())}

    def measure(self):
        g = self.geom()
        pw = self.pw()
        ph = 30 + self.rows_h() + 4 + self.obj_h() + 8 + self.note_h(pw) + 6
        return pw, ph, max(g["bw"], self.hdr_w()) + 110, g["y_out"] + 40

    def build(self, S, px, py, bx, by):
        p = self.pid
        g = self.geom()
        pw, ph, bw, bh = self.measure()
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        S.newobj(f"{p}_rin", f"r {self.vin}", bx, by + 30)
        main = S.newobj(f"{p}_obj", self.text, bx, by + g["y_main"])
        if self.pre_dim:              # r VINnn → smaller texture → the effect
            pre = S.newobj(f"{p}_pre", f"jit.gl.texture @adapt 0 @dim {self.pre_dim[0]} {self.pre_dim[1]}",
                           bx, by + 70)
            S.con(f"{p}_rin", 0, pre, 0)
            S.con(pre, 0, main, 0)
        else:
            S.con(f"{p}_rin", 0, main, 0)
        y_ctl = py + 30
        for i, attr in enumerate(self.controls):          # a staircase feeding in 0
            cid = f"{p}_c{i}"
            S.add(cid, {"type": "attrui", "pos": [bx + 120 + self.STEP * i, by + 70 + self.pre_h() + self.ROW * i],
                        "attrs": {"attr": attr, "text_width": 110.0},
                        "presentation": [px + 8, y_ctl, pw - 16, 22]})
            S.con(cid, 0, main, 0)
            y_ctl += 23
        oh = self.obj_h()
        S.objects[main]["presentation"] = [px + 8, y_ctl + 4, pw - 16, oh]
        self.pane_note(S, px, y_ctl + 4 + oh + 6, pw)
        S.newobj(f"{p}_sout", f"s {self.vfx}", bx, by + g["y_out"])
        S.con(main, 0, f"{p}_sout", 0)
        # B inlets: a receive just above the object's right-hand ports
        self.wire_b(S, main, lambda k: self.text_w() - 19, bx, by + g["y_main"] - 40)


_VZ_CACHE = {}
_VZ_IO = {}


def vizzie_io_comment(module):
    """The bpatcher's outside label, read from the module's own inlet / outlet
    comments in port order (left to right)."""
    if module not in _VZ_IO:
        fs = glob.glob(f"{C74}/packages/Vizzie/patchers/**/{module}", recursive=True)
        assert len(fs) == 1, (module, fs)
        boxes = [b["box"] for b in json.load(open(fs[0]))["patcher"]["boxes"]]
        ins = sorted((b for b in boxes if b["maxclass"] == "inlet"), key=lambda b: b["patching_rect"][0])
        outs = sorted((b for b in boxes if b["maxclass"] == "outlet"), key=lambda b: b["patching_rect"][0])
        _VZ_IO[module] = " | ".join([f"in {k}: {b.get('comment') or '?'}" for k, b in enumerate(ins)] +
                                    [f"out {k}: {b.get('comment') or 'video output'}" for k, b in enumerate(outs)])
    return _VZ_IO[module]


def vizzie_clipping(name):
    """The single bpatcher box of a Vizzie clipping (EFFECT/BRCOSR.maxpat …)."""
    if name not in _VZ_CACHE:
        fs = glob.glob(f"{VIZZIE}/*/{name}.maxpat")
        assert len(fs) == 1, (name, fs)
        boxes = json.load(open(fs[0]))["patcher"]["boxes"]
        assert len(boxes) == 1 and boxes[0]["box"]["maxclass"] == "bpatcher", name
        _VZ_CACHE[name] = boxes[0]["box"]
    return _VZ_CACHE[name]


class Vz(VSlot):
    """A Vizzie module, loaded by name in a bpatcher the way its clipping does.

    demo: {inlet: value} sent once on load, only into inlets whose dial runs 0–1."""
    kind = "vizzie"

    def __init__(self, clip, header, demo=None, note=None, b_inlets=()):
        super().__init__(f"Vizzie {clip}", f"Vizzie {clip}", f"{clip} — {header}", note)
        self.clip = clip
        self.demo = dict(demo or {})
        self.b_inlets = tuple(b_inlets)
        box = vizzie_clipping(clip)
        self.box = box
        self.w = int(round(box["patching_rect"][2]))
        self.h = int(round(box["patching_rect"][3]))
        if not self.note:
            self.note = ("loads with " + ", ".join(f"inlet {k} → {v}" for k, v in self.demo.items())
                         if self.demo else "loads at the module's own settings — turn its dials")
            if self.b_inlets:
                self.note += "; " + ", ".join(f"in {k} = clip B" for k in self.b_inlets)

    def measure(self):
        pw = max(self.w + 16, self.min_pw())
        ph = 30 + self.h + 6 + self.note_h(pw) + 6
        bw = max(460, self.w + 60 + (160 if self.demo else 0), self.hdr_w()) + 110
        bh = 110 + self.h + 35 + 40
        return pw, ph, bw, bh

    def build(self, S, px, py, bx, by):
        p = self.pid
        pw, ph, bw, bh = self.measure()
        S.panel(f"{p}_panel", [px, py, pw, ph])
        self.title(S, px, py, pw, bx + bw - 100, by)
        self.hdr(S, bx, by, bw - 110)
        S.newobj(f"{p}_rin", f"r {self.vin}", bx, by + 30)
        box = self.box
        attrs = {"name": box["name"], "varname": box["varname"], "comment": vizzie_io_comment(box["name"])}
        for k in ("bgmode", "border", "clickthrough", "enablehscroll", "enablevscroll",
                  "lockeddragscroll", "offset", "viewvisibility"):
            if k in box:
                attrs[k] = box[k]
        bp = f"{p}_bp"
        S.add(bp, {"type": "bpatcher", "pos": [bx, by + 110], "size": [self.w, self.h],
                   "inlets": box["numinlets"], "outlets": box["numoutlets"],
                   "outlettype": list(box["outlettype"]),
                   "presentation": [px + 8, py + 30, self.w, self.h], "attrs": attrs})
        S.con(f"{p}_rin", 0, bp, 0)
        if self.demo:
            ks = sorted(self.demo)
            vals = " ".join(fx.fnum(self.demo[k]) for k in ks)
            lm = S.newobj(f"{p}_lm", f"loadmess {vals}", bx + 90, by + 30)
            if len(ks) == 1:
                S.con(lm, 0, bp, ks[0])
            else:
                # unjoin N has N+1 outlets: N single values, then the remainder,
                # which here is the last value (CLAUDE.md > One loadmess ...)
                uj = S.newobj(f"{p}_uj", f"unjoin {len(ks) - 1}", bx + 90, by + 65)
                S.con(lm, 0, uj, 0)
                for i, k in enumerate(ks):
                    S.con(uj, i, bp, k)
        S.newobj(f"{p}_sout", f"s {self.vfx}", bx, by + 110 + self.h + 35)
        S.con(bp, 0, f"{p}_sout", 0)
        n_in = box["numinlets"]      # Max spreads the ports between 19 px insets
        self.wire_b(S, bp, lambda k: 19 + k * (self.w - 38) / (n_in - 1), bx, by + 70)
        self.pane_note(S, px, py + 30 + self.h + 6, pw)


# ---------------------------------------------------------------------------
# the shared patch
# ---------------------------------------------------------------------------

def build_patch(name, blurb, slots, two_sources=False, matrix=False):
    """two_sources: add clip B (s VSRCB) for effects with a second input.
    matrix: the effects are CPU (matrix) objects, so the source is read back into
    a jit.matrix before the gate (and clip B into s VSRCB_M)."""
    S = Spec()
    bname = "VSRCB_M" if matrix else "VSRCB"
    for i, s in enumerate(slots):
        s.n = i + 2
        s.bname = bname
    N = len(slots) + 1                     # tab items incl. DRY
    tab_h = int(21.5 * N + 2)
    top_h = max(360, tab_h + 50)

    S.comment("hdr_note",
              f"{name.upper().replace('-', ' ')} — {blurb} One source (movie or webcam) on s VSRC. "
              f"A gate feeds only the chosen effect, a switch passes only its output, and the master "
              f"dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. "
              + ("The effects are CPU objects: each frame is read back from the GPU into a 640 × 360 jit.matrix "
                 "before the gate, and their matrices go back up at the crossfade."
                 if matrix else "Everything is a GL texture.")
              + (" Clip B (sunflower.mp4) on s VSRCB is the second input of every two-input effect."
                 if two_sources else ""),
              20, 12, 900)
    S.objects["hdr_note"]["size"] = [900, 47]

    # -- SOURCE ---------------------------------------------------------------
    S.comment("c_src", "SOURCE — the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; "
              "the switch passes one", 30, 66, 620)
    S.newobj("pl_lm", "loadmess 1", 30, 90)
    S.add("playlist", {"type": "jit.playlist", "pos": [30, 120], "size": [360, 60],
                       "inlets": 1, "outlets": 3, "outlettype": ["jit_gl_texture", "", "dictionary"],
                       "presentation": [20, 40, 360, 100],
                       "attrs": {"output_texture": 1}, "box_extras": {"data": DEMO_CLIP}})
    S.con("pl_lm", 0, "playlist", 0)
    # webcam: the toggle opens the camera and moves the switch (t fires right to left)
    S.add("cam_tog", {"type": "toggle", "pos": [430, 90], "presentation": [20, 168, 22, 22]})
    S.newobj("cam_t", "t i i", 430, 130)
    S.newobj("cam_sel", "sel 1 0", 520, 175)
    S.msg("cam_open", "open", 520, 220)
    S.msg("cam_close", "close", 580, 220)
    S.newobj("cam_grab", "jit.grab @output_texture 1 @automatic 1", 520, 265)
    S.newobj("cam_plus", "+ 1", 430, 220)
    S.con("cam_tog", 0, "cam_t", 0)
    S.con("cam_t", 1, "cam_sel", 0)
    S.con("cam_t", 0, "cam_plus", 0)
    S.con("cam_sel", 0, "cam_open", 0)
    S.con("cam_sel", 1, "cam_close", 0)
    S.con("cam_open", 0, "cam_grab", 0)
    S.con("cam_close", 0, "cam_grab", 0)
    S.comment("c_cam", "webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie",
              660, 130, 360)
    S.objects["c_cam"]["size"] = [360, 34]
    S.newobj("src_lm", "loadmess 1", 130, 255)
    S.newobj("src_sw", "switch 2", 30, 320)
    S.con("src_lm", 0, "src_sw", 0)
    S.con("cam_plus", 0, "src_sw", 0)
    S.con("playlist", 0, "src_sw", 1)
    S.con("cam_grab", 0, "src_sw", 2)
    S.newobj("s_vsrc", "s VSRC", 30, 365)
    S.con("src_sw", 0, "s_vsrc", 0)

    if two_sources:
        S.comment("c_srcb", "CLIP B — the second input of the two-input effects (loads sunflower.mp4)",
                  430, 400, 340)
        S.newobj("plb_lm", "loadmess 1", 430, 425)
        S.add("playlist_b", {"type": "jit.playlist", "pos": [430, 455], "size": [300, 60],
                             "inlets": 1, "outlets": 3, "outlettype": ["jit_gl_texture", "", "dictionary"],
                             "presentation": [20, 222, 360, 100],
                             "attrs": {"output_texture": 1}, "box_extras": {"data": DEMO_CLIP_B}})
        S.con("plb_lm", 0, "playlist_b", 0)
        S.newobj("s_vsrcb", "s VSRCB", 430, 540)
        S.con("playlist_b", 0, "s_vsrcb", 0)
        S.label("p_srcb_lbl", "CLIP B — the second input",
                [20, 198, 360, LABEL_H], AMBER, bold=True)
        if matrix:   # clip B read back into a matrix for the CPU objects
            S.newobj("mb_r", "r VSRCB", 800, 400)
            S.newobj("mb_t", "t b l", 800, 440)
            S.newobj("mb_m", "jit.matrix 4 char 640 360 @thru 0", 800, 480)
            S.newobj("mb_s", "s VSRCB_M", 800, 520)
            S.con("mb_r", 0, "mb_t", 0)
            S.con("mb_t", 1, "mb_m", 0)       # the texture, copied in first (t fires right to left)
            S.con("mb_t", 0, "mb_m", 0)       # then the bang that outputs it
            S.con("mb_m", 0, "mb_s", 0)

    # -- SELECT (tab → v8 → s SEL) ---------------------------------------------
    S.comment("c_tab", f"EFFECT SELECT — live.tab, one column of {N}, conventional order. The v8 maps "
              f"item index → slot number (1 = DRY) and lights the pane title", 1460, 90, 460)
    S.objects["c_tab"]["size"] = [460, 47]
    S.newobj("lm_tab", "loadmess 0", 1140, 50)
    items = ["1 DRY"] + [f"{s.n} {s.tab}" for s in slots]
    S.add("tab", {"type": "live.tab", "pos": [1140, 90], "size": [300, 150], "outlets": 3,
                  "outlettype": ["", "", "float"], "presentation": [400, 40, 280, tab_h],
                  "attrs": {"num_lines_patching": N, "num_lines_presentation": N,
                            "fontname": "Monaco", "fontsize": 11.0, "spacing_x": 4.0, "spacing_y": 4.0,
                            "rounded": 4.0, "bgcolor": MID, "bgoncolor": AMBER, "textcolor": LIGHT,
                            "textoncolor": INK, "parameter_enable": 1,
                            "saved_attribute_attributes": {
                                "bgcolor": {"expression": ""}, "bgoncolor": {"expression": ""},
                                "textcolor": {"expression": ""}, "textoncolor": {"expression": ""},
                                "valueof": {"parameter_enum": items, "parameter_initial": [0],
                                            "parameter_longname": "VFX_SELECT", "parameter_mmax": N - 1,
                                            "parameter_modmode": 0, "parameter_shortname": "VFX",
                                            "parameter_type": 2, "parameter_unitstyle": 9}},
                            "varname": "VFX_TAB"}})
    S.con("lm_tab", 0, "tab", 0)
    S.newobj("r_tabsel", "r TABSEL", 1240, 50)
    S.con("r_tabsel", 0, "tab", 0)
    S.comment("c_tabsel", "r TABSEL: the transparent button over each pane title sends its tab index here",
              1330, 50, 520)
    # the shared script lives one folder up, in patches/shootouts/, for audio/ and video/ alike
    S.add("hl_v8", {"type": "newobj", "text": "v8 fx-shootout-highlight.js @embed 1", "pos": [1140, 330],
                    "inlets": 1, "outlets": 1, "outlettype": [""]})
    S.comment("c_hl", "index → slot number (one column, so index + 1) → s SEL; also lights TITLE_nn",
              1450, 330, 520)
    S.newobj("s_sel", "s SEL", 1140, 370)
    S.newobj("lm_hl", "loadmess embed 1", 1140, 300)   # keeps the stored script through a Max save
    S.con("lm_hl", 0, "hl_v8", 0)
    S.con("tab", 0, "hl_v8", 0)
    S.con("hl_v8", 0, "s_sel", 0)

    # -- slots: measure, pack, build ---------------------------------------------
    sizes = [s.measure() for s in slots]
    pres_pos = []
    x, y, rowh = 10, top_h + 20, 0
    for s, (pw, ph, bw, bh) in zip(slots, sizes):
        if x > 10 and x + pw > PRES_W:
            x, y, rowh = 10, y + rowh + 10, 0
        pres_pos.append((x, y))
        x += pw + 8
        rowh = max(rowh, ph)
    pres_bottom = y + rowh + 10
    pat_pos = []
    y0 = 640 if two_sources else 520
    x, y, rowh = 30, y0, 0
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

    # -- ROUTER: gate feeds the chosen effect, switch passes its output ----------
    ym = pat_bottom
    PITCH = 80
    S.comment("c_route", f"ROUTER — gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch "
              f"inlet n passes effect n's output, and inlet 1 is the dry source itself", 30, ym, 1200)
    S.objects["c_route"]["size"] = [1200, 34]
    S.newobj("g_rsel", "r SEL", 30, ym + 50)
    xg = 30 + PITCH * (N - 1)              # over the gate's data inlet, its right edge
    if matrix:
        ym += 90
        S.newobj("g_rsrc", "r VSRC", xg, ym - 40)
        S.newobj("g_t", "t b l", xg, ym)
        S.newobj("g_m", "jit.matrix 4 char 640 360 @thru 0", xg, ym + 40)
        S.con("g_rsrc", 0, "g_t", 0)
        S.con("g_t", 1, "g_m", 0)          # the texture, copied in first (t fires right to left)
        S.con("g_t", 0, "g_m", 0)          # then the bang that outputs it
        ym += 40
    else:
        S.newobj("g_rsrc", "r VSRC", xg, ym + 50)
    # 80 px between ports, so each send sits straight under its outlet
    # (Max centres the first and last ports 19 px in from the edges and spaces the
    # rest evenly — MAX_PATCHING.md > Give every port room — so a box 80 * (count - 1)
    # + 38 wide puts its ports 80 px apart, and a box at x + 80 * k lines up with port k)
    gw = PITCH * (N - 1) + 38
    S.newobj("gate", f"gate {N}", 30, ym + 90, size=[gw, 22],
             inlets=2, outlets=N, outlettype=[""] * N)
    S.con("g_rsel", 0, "gate", 0)
    S.con("g_m" if matrix else "g_rsrc", 0, "gate", 1)
    for s in slots:
        k = s.n - 1                       # outlet index; outlet 0 (DRY) feeds nothing
        S.newobj(f"g_s{s.n}", f"s {s.vin}", 30 + PITCH * k, ym + 145)
        S.con("gate", k, f"g_s{s.n}", 0)

    ys = ym + 220
    sw_w = PITCH * N + 38
    S.newobj("sw_rsel", "r SEL", 30, ys)
    S.newobj("sw_rdry", "r VSRC", 30 + PITCH, ys)
    for s in slots:                       # one receive straight above each inlet
        S.newobj(f"sw_r{s.n}", f"r {s.vfx}", 30 + PITCH * s.n, ys)
    S.newobj("wet_sw", f"switch {N}", 30, ys + 55, size=[sw_w, 22],
             inlets=N + 1, outlets=1, outlettype=[""])
    S.con("sw_rsel", 0, "wet_sw", 0)
    S.con("sw_rdry", 0, "wet_sw", 1)
    for s in slots:
        S.con(f"sw_r{s.n}", 0, "wet_sw", s.n)

    # -- MASTER: dry/wet crossfade → layer → jit.pworld --------------------------
    S.newobj("s_vwet", "s VWET", 30, ys + 110)
    S.con("wet_sw", 0, "s_vwet", 0)
    yM = ys + 170
    S.comment("c_master", "MASTER — dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; "
              "xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld", 30, yM, 800)
    S.newobj("m_rdry", "r VSRC", 30, yM + 40)
    S.newobj("m_rwet", "r VWET", 110, yM + 40)
    S.add("m_xf_ui", {"type": "attrui", "pos": [230, yM + 40],
                      "attrs": {"attr": "xfade", "text_width": 110.0},
                      "presentation": [700, 316, 300, 22]})
    S.newobj("m_xf", "jit.fx.tr.xfade @xfade 1.", 30, yM + 90)
    S.newobj("m_layer", "jit.gl.layer @blend_enable 0", 30, yM + 140)
    S.con("m_rdry", 0, "m_xf", 0)
    S.con("m_xf_ui", 0, "m_xf", 0)
    S.con("m_rwet", 0, "m_xf", 1)
    S.con("m_xf", 0, "m_layer", 0)
    S.add("pworld", {"type": "jit.pworld", "pos": [30, yM + 190], "size": [480, 270],
                     "attrs": {"erase_color": [0.0, 0.0, 0.0, 1.0]},
                     "presentation": [700, 40, 480, 270]})

    # -- top panels + their labels ------------------------------------------------
    S.panel("p_src_panel", [10, 10, 380, top_h])
    S.panel("p_shoot_panel", [396, 10, 294, top_h])
    S.panel("p_out_panel", [696, 10, 494, top_h])
    S.label("p_src_title", "SOURCE", [20, 16, 200, LABEL_H], AMBER, bold=True)
    S.label("p_playlist_lbl", "drop movies on the player; click a clip to play it",
            [20, 144, 360, LABEL_H])
    S.label("p_cam_lbl", "webcam (loads off) — on replaces the movie", [48, 170, 332, LABEL_H])
    S.label("p_shoot_title", "EFFECT — click one", [406, 16, 274, LABEL_H], AMBER, bold=True)
    S.label("p_out_title", "OUTPUT — only the chosen effect runs", [706, 16, 474, LABEL_H], AMBER, bold=True)
    S.label("p_xf_lbl", "xfade: 0 = dry source, 1 = the effect (loads 1)", [706, 342, 474, LABEL_H])

    lx = max(pat_right, 2400) + 120
    S.comment("c_plbl", "presentation-only labels (they show in the panels)", lx, 30, 330)
    for i, oid in enumerate(S.labels):
        S.objects[oid]["pos"] = [lx, 60 + 26 * i]
    yp = yM + 500
    for i, oid in enumerate(k for k, v in S.objects.items() if v["type"] == "panel"):
        S.objects[oid]["pos"] = [30 + 70 * i, yp]

    pres_right = max(1200, max(S.objects[k]["presentation"][0] + S.objects[k]["presentation"][2]
                               for k in S.objects if S.objects[k].get("presentation")) + 10)
    spec = {"width": pres_right, "height": pres_bottom + 10, "bglocked": 1,
            "openinpresentation": 1, "objects": S.objects, "connections": S.connections}
    return spec, (pres_right, pres_bottom)


def run(name, blurb, slots, opts=None):
    spec, extent = build_patch(name, blurb, slots, **(opts or {}))
    spec_path = os.path.join(SCRATCH, f"{name}.spec.json")
    out = os.path.join(PATCH_DIR, f"{name}.maxpat")
    os.makedirs(PATCH_DIR, exist_ok=True)
    json.dump(spec, open(spec_path, "w"), indent=1)
    r = subprocess.run([sys.executable, os.path.join(REPO, "spec2maxpat.py"), "convert",
                        "-i", spec_path, "-o", out], capture_output=True, text=True)
    tail = "\n".join(r.stderr.strip().splitlines()[-15:])
    if r.returncode != 0:
        print(f"[{name}] CONVERT FAILED\n{tail}")
        return False
    problems, nb, nl = fx.check_file(out)
    c = subprocess.run([sys.executable, os.path.join(REPO, "spec2maxpat.py"), "sync", "-i", out, "--check"],
                       capture_output=True, text=True)
    print(f"[{name}] {len(slots)} effects, {nb} boxes / {nl} cords, presentation {extent[0]}×{extent[1]}, "
          f"sync --check {'matches' if c.returncode == 0 else 'MISMATCH'}, {len(problems)} layout problems")
    for p in problems[:40]:
        print("   ", p)
    for v in [ln for ln in r.stderr.splitlines() if "[verify]" in ln or "warn" in ln.lower()][:8]:
        print("   ", v)
    return not problems


# ---------------------------------------------------------------------------
# slot tables
# ---------------------------------------------------------------------------

PATCHES = {}

PATCHES["video-color-shootout"] = ("colour and tone: brightness / contrast, hue, thresholds and colour maps.", [
    Fx("jit.fx.brcosa @contrast 1.6 @saturation 1.8", "brightness / contrast / saturation (1 = unchanged)",
       ["contrast", "saturation", "brightness", "luma"], pw=300, cpu="jit.brcosa"),
    Fx("jit.fx.hue @hue 90.", "hue rotation in degrees", ["hue"], cpu="jit.hue"),
    Fx("jit.fx.threshold", "smooth threshold around a colour value", ["amt", "smoothness"]),
    Fx("jit.fx.rgb2luma", "RGB to luminance (the scales weight each plane)", ["rscale", "gscale", "bscale"], cpu="jit.rgb2luma"),
    Vz("BRCOSR", "brightness / contrast / saturation"),
    Vz("HUSALIR", "hue / saturation / lightness gains"),
    Vz("COLORIZR", "procedural colouring from one plane"),
    Vz("2TONR", "duotone from two colours"),
    Vz("POSTERIZR", "fewer colour levels (posterize)"),
    Vz("SOLARIZR", "solarize"),
    Vz("TECHNICOLOR8R", "Technicolor process simulation"),
    Vz("MUTIL8R", "scale / fold / wrap each of R, G, B"),
    Vz("MAPPR", "a mapping function per colour plane"),
    Vz("PLANEMAPPR", "remap the R, G, B, A planes"),
])

PATCHES["video-filter-shootout"] = ("blur, sharpen, smoothing and edge detection.", [
    Fx("jit.fx.cf.gaussian @amt 20.", "gaussian blur (help file sweeps amt 0–100)", ["amt"]),
    Fx("jit.fx.cf.directional @amt 2. @angle 45.", "directional blur (help file sweeps amt 0–5)",
       ["amt", "angle"]),
    Fx("jit.fx.cf.radial @amt 1.", "radial or spin blur around a centre", ["amt", "center", "mode"]),
    Fx("jit.fx.cf.tiltshift", "tilt-shift: sharp band, blurred around it",
       ["blur_amount", "slope", "center", "angle", "mode"]),
    Fx("jit.fx.cf.sharpen @amt 0.5", "sharpening (amt × 4 in the shader)", ["amt"]),
    Fx("jit.fx.cf.bilateral", "edge-preserving bilateral smoothing (no settings)", []),
    Fx("jit.fx.cf.kuwahara", "anisotropic Kuwahara: a painterly smoothing",
       ["kernel_size", "sharpness", "hardness", "pre_blur"], pre_dim=(640, 360)),
    Fx("jit.fx.sobel", "Sobel edge detection", ["threshold"], cpu="jit.sobel"),
    Fx("jit.fx.brass @width 2.", "emboss (help file sweeps width 1–5)", ["width", "offset"], pw=300, cpu="jit.brass"),
    Vz("EMBOSSR", "embossed-image look"),
    Vz("SKETCHR", "line drawing from edges"),
    Vz("TRACR", "gradient edge detection"),
])

PATCHES["video-geometry-shootout"] = ("rotate, zoom, mirror, warp, tile and scatter the image.", [
    Fx("jit.fx.rota @theta 0.5 @zoom 1.3 1.3", "rotate (radians) and scale about an anchor",
       ["theta", "zoom", "offset", "anchor", "boundmode"], pw=280, cpu="jit.rota"),
    Fx("jit.fx.camera @boundmode mirroredrepeat @blur_amount 1.5", "a virtual camera with motion blur (help-file settings)",
       ["zoom", "tilt", "lookat", "blur_amount", "boundmode"], pw=300),
    Fx("jit.fx.dimmap @invert 1 0", "swap or flip the image's dimensions (help-file setting)", ["invert", "map"], cpu="jit.dimmap"),
    Vz("KALEIDR", "kaleidoscope folding"),
    Vz("TESSEL8R", "tessellation, mandala-like"),
    Vz("TWIRLR", "twist around a centre"),
    Vz("REFLECTR", "funhouse-mirror warps"),
    Vz("FOLDR", "fold along two axes"),
    Vz("PINCHR", "pinch / warp"),
    Vz("STRETCHR", "stretch from an origin", demo={1: 0.5, 2: 0.5, 3: 0.3, 4: 0.3}),
    Vz("ROTATR", "rotate and offset"),
    Vz("ZOOMR", "zoom"),
    Vz("PANNR", "move the image"),
    Vz("TRANS4MR", "zoom / rotate / offset in one"),
    Vz("FRACTALIZR", "meta-image of repeated frames", demo={1: 0.3, 2: 0.3}),
    Vz("SCRAMBLR", "subdivide and scramble"),
    Vz("PIXL8R", "pixelate", demo={1: 0.5, 2: 0.5}),
    Vz("FOGGR", "scatter pixels into dust"),
])

PATCHES["video-time-shootout"] = ("delay, feedback, trails and freeze — effects that remember earlier frames.", [
    Fx("jit.fx.slide @slide_up 10. @slide_down 40.", "per-pixel smoothing over time (help file sweeps 1–100)",
       ["slide_up", "slide_down"], cpu="jit.slide"),
    Fx("jit.fx.wake @ff 0.25 @fb 0.7", "feedback with a blur stage (help-file settings)",
       ["fb", "ff", "bleed", "gain"], cpu="jit.wake"),
    Fx("jit.fx.tp.delay @delay 15.", "frame delay (help file sweeps 1–29 frames)", ["delay", "interp", "max_delay"]),
    Fx("jit.fx.tp.filter", "temporal filter: low / high / band pass on each pixel over time",
       ["cutoff", "q", "filtertype", "fps"]),
    Vz("DELAYR", "delay line with feedback", demo={2: 0.5}),
    Vz("FEEDR", "feedback on itself"),
    Vz("FREEZR", "freeze a frame — click its freeze button"),
    Vz("SLIDR", "smear over time"),
])

PATCHES["video-glitch-shootout"] = ("lo-fi, retro and glitch looks, plus effects that draw new images from the input.", [
    Fx("jit.fx.bitcrush @color_levels 6", "fewer colour levels, optional dithering (help file sweeps 2–10)",
       ["color_levels", "dithering"]),
    Fx("jit.fx.grain", "analog film grain", ["amt", "size", "colored", "color_tint"]),
    Fx("jit.fx.crt", "CRT monitor simulation",
       ["warp_amount", "scan_line_strength", "aberation_amount", "roll_line_amount", "noise_amount",
        "vignette_amount"], pw=280),
    Fx("jit.fx.vhs", "VHS playback simulation", ["smear", "wiggle", "wiggle_speed"]),
    Fx("jit.fx.pixelsorting", "pixel sorting above a threshold (one pass per pixel column, every frame)",
       ["threshold", "sortdir", "dimmode", "invert"], pre_dim=(320, 180)),
    Fx("jit.fx.bsort", "bubble sort of the pixels (one pass per pixel column, every frame)",
       ["dimmode", "max_iterations"], cpu="jit.bsort", pre_dim=(320, 180)),
    Fx("jit.fx.ameba @steps 8 8", "downsample / upsample oddities (help file sweeps steps 1–100)",
       ["steps", "gain", "mode"], cpu="jit.ameba"),
    Fx("jit.fx.altern @width 10 10", "a coloured screen with gaps (help-file setting)",
       ["width", "interval", "bgcolor"], pw=300, cpu="jit.altern"),
    Fx("jit.fx.conway", "Conway's game of life seeded by brightness", ["amt"], cpu="jit.conway"),
    Fx("jit.fx.ge.flowfield", "lines that flow along the image",
       ["rotation", "step", "alpha", "randomness", "fade", "filter"]),
    Fx("jit.fx.ge.lineinterp @outputmode effect @range 0.01 0.1", "lines drawn from edges (help-file settings)",
       ["range", "rangemode", "dimmode", "colormode", "outputmode"], pw=280),
    Fx("jit.fx.ge.pattern @indimscale 0.25 0.25 @mode 1 @line_fade 3. @radius 0.2 @line_width 1.5",
       "Voronoi / Delaunay pattern (help-file settings)",
       ["mode", "radius", "line_width", "amt", "randomness", "num_edges"], pw=300),
    Fx("jit.fx.ge.randlines", "random lines between bright pixels", ["amt", "radius", "alpha"]),
    Vz("DOWNSAMPLR", "downsample and planemap"),
    Vz("RESAMPLR", "interpolate and resample"),
    Vz("ZAMPLR", "up / downsample"),
    Vz("INTERPOL8R", "resample with interpolation"),
    Vz("WYPR", "slice / wipe into bands"),
    Vz("SEPR8R", "offset the R, G, B planes", demo={1: 0.03, 6: 0.03}),
])

PATCHES["video-blend-shootout"] = ("blend modes and keyers: clip A (movie or webcam) over clip B.", [
    Fx("jit.fx.co.normal @amount 1. 1. 1. 1.", "normal (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.additive @amount 1. 1. 1. 1.", "add (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.subtractive @amount 1. 1. 1. 1.", "subtract (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.multiply @amount 1. 1. 1. 1.", "multiply (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.screen @amount 1. 1. 1. 1.", "screen (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.overlay @amount 1. 1. 1. 1.", "overlay (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.softlight @amount 1. 1. 1. 1.", "soft light (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.hardlight @amount 1. 1. 1. 1.", "hard light (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.brightlight @amount 1. 1. 1. 1.", "bright light (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.darken @amount 1. 1. 1. 1.", "darken (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.lighten @amount 1. 1. 1. 1.", "lighten (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.difference @amount 1. 1. 1. 1.", "difference (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.exclude @amount 1. 1. 1. 1.", "exclusion (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.negate @amount 1. 1. 1. 1.", "negation (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.average @amount 1. 1. 1. 1.", "average (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.burn @amount 1. 1. 1. 1.", "colour burn (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.dodge @amount 1. 1. 1. 1.", "colour dodge (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.reflect @amount 1. 1. 1. 1.", "reflect (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.glow @amount 1. 1. 1. 1.", "glow (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.freeze @amount 1. 1. 1. 1.", "freeze (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.heat @amount 1. 1. 1. 1.", "heat (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.inverse @amount 1. 1. 1. 1.", "inverse (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.stamp @amount 1. 1. 1. 1.", "stamp (amount per plane: 0 = A only, 1 = the full blend)",
       ["amount"], pw=300, b_inlets=(1,)),
    Fx("jit.fx.co.chromakey", "chroma key: B shows where A is near the key colour",
       ["color", "tol", "fade", "binary", "invert", "mode"], pw=300, b_inlets=(1,), cpu="jit.chromakey"),
    Fx("jit.fx.co.lumakey", "luma key: B shows where A is near a brightness",
       ["luma", "tol", "fade", "binary", "invert", "mode"], pw=300, b_inlets=(1,), cpu="jit.lumakey"),
    Vz("MODEMIXR", "mix A and B by a blend mode", b_inlets=(1,)),
    Vz("OPER8R", "combine A and B with an operator", b_inlets=(1,)),
], {"two_sources": True})

PATCHES["video-mix-shootout"] = ("transitions, keys and other effects that combine clip A with clip B.", [
    Fx("jit.fx.tr.xfade @xfade 0.5", "crossfade (0 = A, 1 = B)", ["xfade"], b_inlets=(1,), cpu="jit.xfade"),
    Fx("jit.fx.tr.dissolve @amt 0.5", "random-pixel dissolve (amt 0 = A, 1 = B)", ["amt", "fade", "freq"],
       b_inlets=(1,)),
    Fx("jit.fx.tr.gridwipe @wipe 0.5 0.5", "wipe through a grid of cells", ["wipe", "scale", "origin", "fade", "invert"],
       pw=280, b_inlets=(1,)),
    Fx("jit.fx.tr.shrinkwipe @wipe 0.5 0.5", "wipe by shrinking cells", ["wipe", "scale", "fade", "invert"],
       pw=280, b_inlets=(1,)),
    Fx("jit.fx.tr.vignettes @wipe 0.5 0.5", "wipe through vignettes", ["wipe", "scale", "fade", "invert"],
       pw=280, b_inlets=(1,)),
    Fx("jit.fx.tr.huefade @amt 0.5", "fade through hue", ["amt"], b_inlets=(1,)),
    Fx("jit.fx.tr.rotfade @amt 0.5 @rotation 180", "fade while rotating (help-file rotation)",
       ["amt", "rotation", "motionblur", "bluramount"], b_inlets=(1,)),
    Fx("jit.fx.tr.slide @amt 0.5", "slide B in over A", ["amt", "slidedir", "motionblur", "bluramount"],
       b_inlets=(1,)),
    Fx("jit.fx.tr.zoomfade @amt 0.5 @zoom 2.", "fade while zooming (help-file zoom)",
       ["amt", "zoom", "motionblur", "bluramount"], b_inlets=(1,)),
    Fx("jit.fx.alphaglue @lum2alpha 1.", "B's brightness becomes A's alpha (shows over the dry clip)",
       ["lum2alpha", "fade", "thresh", "plane"], b_inlets=(1,)),
    Fx("jit.fx.eclipse @steps 8 8", "a grid of A tinted by B (help file sweeps steps 10–500)",
       ["steps", "enable_tint", "mode"], b_inlets=(1,), cpu="jit.eclipse"),
    Fx("jit.fx.repos @amt 0.1 @mode 1", "B's colours move A's pixels (relative offsets)",
       ["amt", "mode", "boundmode", "channel"], b_inlets=(1,), cpu="jit.repos"),
    Fx("jit.fx.tp.warp", "time-warp slices of A, timed by B", ["num_slices"], b_inlets=(1,)),
    Fx("jit.fx.concat", "A and B side by side", ["concatdim"], b_inlets=(1,), cpu="jit.concat"),
    Fx("jit.fx.multiplex", "A and B interleaved line by line", ["multiplexdim"], b_inlets=(1,), cpu="jit.multiplex"),
    Vz("XFADR", "crossfade A and B", b_inlets=(1,)),
    Vz("MIXFADR", "crossfade with an operator mode", b_inlets=(1,)),
    Vz("CHROMAKEYR", "chroma key", b_inlets=(1,)),
    Vz("LUMAKEYR", "luma key", b_inlets=(1,)),
], {"two_sources": True})

PATCHES["video-cpu-shootout"] = ("the CPU (matrix) effects that have no newer GPU version.", [
    Fx("jit.fastblur @mode 4 @range 6", "blur or sharpen with a square kernel 6 pixels out",
       ["range", "mode", "ring", "center", "ripple"]),
    Fx("jit.avg4 @x 6 @y 6", "average four points 6 pixels away", ["x", "y", "mode"]),
    Fx("jit.robcross", "Roberts-cross edge detection", ["thresh"]),
    Fx("jit.fluoride", "neon glow", ["lum", "tol", "glow", "mode"]),
    Fx("jit.hatch @grid 10", "crosshatching (help-file grid)", ["grid", "thresh", "bgcolor"], pw=280),
    Fx("jit.plur", "\"Peace Love Unity Rave\" resampling", ["scale", "x_step", "y_step", "x_range", "y_range", "mode"]),
    Fx("jit.streak @prob 0.3", "cells streak into lines", ["prob", "scale", "direction", "mode"]),
    Fx("jit.tiffany", "resample into rectangular facets", ["xrange", "yrange", "xskip", "yskip", "grid"]),
    Fx("jit.scanslide @slide_up 10 @slide_down 10", "smooth along each scanline", ["slide_up", "slide_down", "dimmode",
                                                                                   "offset", "mode"]),
    Fx("jit.sprinkle @prob 0.3 @x_range 20 @y_range 20", "scatter pixels", ["prob", "x_range", "y_range"]),
    Fx("jit.rubix @rows 4 @cols 4 @prob 0.3", "a grid of cells that update at random", ["rows", "cols", "prob",
                                                                                        "probmono", "dots"]),
    Fx("jit.resamp @xscale 2. @yscale 2.", "resample: scale and shift", ["xscale", "yscale", "xshift", "yshift", "wrap"]),
    Fx("jit.mxform2d @mxform 1. 0.3 0. 0.2 1. 0. 0. 0. 1.", "a 3 × 3 transform matrix (here a shear)",
       ["mxform", "boundmode", "offset_x", "offset_y", "interp"], pw=320),
    Fx("jit.scalebias @rscale 1.5 @gscale 0.6 @bbias 0.2", "multiply and add per plane",
       ["rscale", "gscale", "bscale", "rbias", "gbias", "bbias"]),
    Fx("jit.clip @min 0.2 @max 0.8", "limit values to a range", ["min", "max"]),
    Fx("jit.normalize", "stretch each plane to the full range", ["amp", "global"]),
    Fx("jit.plume @xinterval 20 @yinterval 20 @xamount 30 @yamount 30 @wrap 1",
       "displace A by B's brightness (help-file settings)", ["xamount", "yamount", "xinterval", "yinterval", "wrap"],
       pw=280, b_inlets=(1,)),
    Fx("jit.roy", "halftone: A drawn with B as the halftone pattern", ["x", "y", "shades"], b_inlets=(1,)),
    Fx("jit.op @op absdiff", "an operator between A and B (here the difference)", ["op", "val"], b_inlets=(1,)),
], {"two_sources": True, "matrix": True})


if __name__ == "__main__":
    names = sys.argv[1:] or list(PATCHES)
    ok = True
    for nm in names:
        blurb, slots = PATCHES[nm][:2]
        ok = run(nm, blurb, slots, PATCHES[nm][2] if len(PATCHES[nm]) > 2 else None) and ok
    sys.exit(0 if ok else 1)
