#!/usr/bin/env python3
"""First-draft builder for patches/waveform-reference.maxpat.

Layout model.  Everything on a tab is a BLOCK: a panel with a title, a vertical
stack of controls with a comment to the right of each, and the object boxes the
controls drive at the bottom.  One block holds one object's parameters, so what
belongs to what is never in doubt.  Blocks flow left to right and wrap.

Audio flows straight down the page: the input plumbing sits above the blocks,
the objects live in the blocks, the output plumbing sits below them.

FIRST DRAFT ONLY.  Once the patch has been opened and edited in Max the
`.maxpat` is the source of truth: edit the boxes and run
`python3 spec2maxpat.py sync -i patches/waveform-reference.maxpat`.
Never re-run this builder over an edited patch.

    python3 tools/waveform_reference_builder.py -o /tmp/waveform-reference.json
    python3 spec2maxpat.py convert -i /tmp/waveform-reference.json \
        -o patches/waveform-reference.maxpat
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import waveform_reference_notes as NOTES           # noqa: E402

# Heights measured with butter_comment's own parser by tools/measure_butter_notes.py.
# Re-run that after editing waveform_reference_notes.py.
_H = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                  "waveform_reference_notes_h.json")
try:
    with open(_H) as _f:
        NOTE_H = json.load(_f)
except OSError:
    NOTE_H = {}


# A v8ui's script-declared attributes are NOT top-level box keys. Max writes
# every attribute declared with embed:1 into one `embedstate` array on the box,
# alphabetically, each row [name, value...] — and it writes the whole set, not
# only the ones that differ. Measured 2026-09-22 by saving a one-box patch from
# Max and reading it back, because nothing that ships with Max or in any
# installed package saves a jsui/v8ui script attribute. A value written as a
# top-level key instead is accepted into the file and silently ignored on load:
# the object instantiates and draws nothing. See CLAUDE.md > An Attribute an
# Object Declares in Its Own Code Is Stored Somewhere Else.
BUTTER_COMMENT_EMBEDSTATE = [
    ["bgcolor", 0, 0, 0, 0], ["bubble", 0], ["bubble_bgcolor", 1, 1, 1, 1],
    ["bubble_outlinecolor", 0, 0, 0, 1], ["bubblepoint", 0.5],
    ["bubbleside", 1], ["bubbletextmargin", 0], ["bubbleusescolors", 0],
    ["underline", 0], ["z_autoheight", 0], ["z_bullet", "\u2022"],
    ["z_codebg", 0.5, 0.5, 0.5, 0.18], ["z_headingscale", 1],
    ["z_hyperlinkcolor", 0.2, 0.45, 0.95, 1], ["z_indent", 14],
    ["z_linespacing", 1.25], ["z_linkunderline", 1], ["z_markdown", 1],
    ["z_monofont", ""], ["z_padding", 4], ["z_paraspacing", 0.5],
    ["z_pointsize", 12, 10], ["z_sendto", ""],
    ["z_tablecolor", 0.5, 0.5, 0.5, 0.55], ["z_tablefill", 1],
    ["z_tablepad", 4], ["z_tablewrap", 0.34], ["z_text", ""], ["z_wrap", 1],
]


def butter_embedstate(values):
    """The full embedstate array, with `values` overriding the defaults."""
    unknown = set(values) - {r[0] for r in BUTTER_COMMENT_EMBEDSTATE}
    if unknown:
        raise KeyError("not butter_comment attributes: %s" % sorted(unknown))
    rows = []
    for row in BUTTER_COMMENT_EMBEDSTATE:
        name = row[0]
        if name in values:
            v = values[name]
            rows.append([name] + (list(v) if isinstance(v, list) else [v]))
        else:
            rows.append(list(row))
    return rows


# ---------------------------------------------------------------- palette ---
INK = [0.08, 0.08, 0.09, 1.0]
PAGE_BG = [0.15, 0.16, 0.19, 1.0]
BLOCK_BG = [0.21, 0.22, 0.26, 1.0]
SCOPE_BG = [0.10, 0.11, 0.13, 1.0]
TXT = [0.90, 0.90, 0.92, 1.0]
DIM = [0.68, 0.70, 0.74, 1.0]
ACCENT = [1.0, 0.55, 0.0, 1.0]
TAB_BG = [0.30, 0.30, 0.32, 1.0]
GRID = [0.28, 0.29, 0.32, 1.0]

MONO = "Monaco"
FS = 10.0
CHAR_W = 6.3

# ------------------------------------------------------------- block grid ---
PAD = 10
CTL_W = 220          # every control column is this wide, on every block
COMMENT_W = 300
BLOCK_W = PAD + CTL_W + PAD + COMMENT_W + PAD      # 550
BLOCK_GAP = 20
WIDE_W = BLOCK_W * 2 + BLOCK_GAP                   # 1120

COL_X = [20, 20 + BLOCK_W + BLOCK_GAP]             # 20, 590
WIN_W = COL_X[1] + BLOCK_W + 20                    # 1180

BLOCK_Y0 = 230
BLOCK_GAP_Y = 16
TITLE_LEAD = 8
ROW_H = 30            # presentation row pitch
ROW_H_INIT = 30
P_ROW_H = 30
OBJ_H = 46

IN_BAND_Y = 140       # r~ SRC lives here, above every block


def est_width(text, size=FS):
    return int(len(text) * size * 0.62) + 14


def wrapped_lines(text, width, size=FS):
    per = max(8, int(width / (size * 0.62)))
    n = 0
    for para in text.split("\n"):
        n += max(1, -(-len(para) // per))
    return n


def comment_h(text, width, size=FS):
    return 6 + 15 * wrapped_lines(text, width, size)


def attrui_text_width(attr):
    """The attrui's label column: its spinner, the attribute name, padding."""
    return int(18 + len(attr) * CHAR_W + 12)


def attrui_width(attr, value_w=80):
    return min(CTL_W, attrui_text_width(attr) + value_w)


def comment(text, pos, pres=None, width=130, height=18, color=None, size=FS,
            face=0):
    box = {
        "type": "comment", "text": text,
        "pos": [pos[0], pos[1]], "size": [width, height],
        "attrs": {"fontname": MONO, "fontsize": size, "textcolor": color or DIM},
    }
    if face:
        box["attrs"]["fontface"] = face
    if pres:
        box["presentation"] = list(pres)
    return box


SCOPE_ATTRS = {
    "mode": 1,                 # 0 history, 1 trigger — inlet 1 is the trigger
    "samples": 800.0,
    "trigger_threshold": 0.0,
    "trigger_direction": 1,    # rising
    "grid": 3,
    "vertical_divisions": 4,
    "horizontal_divisions": 8,
    "rounded": 3.0,
    "bgcolor": SCOPE_BG, "activebgcolor": SCOPE_BG,
    "linecolor": ACCENT, "activelinecolor": ACCENT,
    "gridcolor": GRID, "activegridcolor": GRID,
}


def live_tab_spec(items, longname, lines=1):
    return {
        "type": "live.tab",
        "attrs": {
            "num_lines_patching": lines, "num_lines_presentation": lines,
            "fontname": MONO, "fontsize": FS,
            "spacing_x": 3.0, "spacing_y": 3.0, "rounded": 3.0,
            "bgcolor": TAB_BG, "bgoncolor": ACCENT,
            "textcolor": TXT, "textoncolor": INK,
            "parameter_enable": 1,
            "saved_attribute_attributes": {
                "bgcolor": {"expression": ""},
                "bgoncolor": {"expression": ""},
                "textcolor": {"expression": ""},
                "textoncolor": {"expression": ""},
                "valueof": {
                    "parameter_enum": list(items), "parameter_initial": [0],
                    "parameter_longname": longname,
                    "parameter_mmax": len(items) - 1, "parameter_modmode": 0,
                    "parameter_shortname": longname[:14],
                    "parameter_type": 2, "parameter_unitstyle": 9,
                },
            },
            "varname": longname,
        },
    }


# ------------------------------------------------------------- row makers ---
def A(uid, attr, target, note, value_w=80):
    """An attrui row: the attrui sized to fit its own name plus its value."""
    return ("attr", uid, attr, target, note, value_w)


def C(uid, spec, note, w=62, init=None, h=22):
    return ("ctl", uid, spec, note, w, init, h)


def M(uid, text, note, w=None):
    return ("ctl", uid, {"type": "message", "text": text}, note,
            w or min(CTL_W, est_width(text) + 26), None, 22)


class Page:
    """One patcher tab."""

    def __init__(self, key, tab_title, header, blurb, notes):
        self.key = key
        self.tab_title = tab_title
        self.notes_lines = notes
        self.objects = {}
        self.connections = []
        self._band = set()          # boxes in the plumbing bands
        self._col = 0
        self._y = [BLOCK_Y0, BLOCK_Y0]      # per-column cursor, patching
        self._py = [BLOCK_Y0, BLOCK_Y0]     # per-column cursor, presentation
        self._n = 0

        self.add("header", {
            "type": "comment", "text": header,
            "pos": [20, 14], "size": [WIN_W - 60, 24],
            "presentation": [20, 14, WIN_W - 60, 24],
            "attrs": {"fontname": MONO, "fontsize": 13.0, "fontface": 1,
                      "textcolor": ACCENT},
        })
        bh = comment_h(blurb, WIN_W - 60)
        self.add("blurb", {
            "type": "comment", "text": blurb,
            "pos": [20, 44], "size": [WIN_W - 60, bh],
            "presentation": [20, 44, WIN_W - 60, bh],
            "attrs": {"fontname": MONO, "fontsize": FS, "textcolor": TXT},
        })

    # ------------------------------------------------------------ pieces --
    def add(self, uid, spec):
        self.objects[uid] = spec
        return uid

    def conn(self, a, ao, b, bi):
        self.connections.append([a, ao, b, bi])

    def band(self, uid, text, x, y, kind="newobj"):
        """A plumbing box: patching only, never on the card."""
        self.add(uid, {"type": kind, "text": text, "pos": [x, y]})
        self._band.add(uid)
        return uid

    # ------------------------------------------------------------- blocks --
    def block(self, title, rows=(), objects=(), wide=False, desc=None,
              ctl_w=None, band_objects=False, group_init=None):
        """A panel: title, a vertical stack of control+comment rows, objects.

        objects: [(uid, text, dx, row[, kind])] drawn at the bottom of the
        block.  band_objects places them in the plumbing band instead.
        """
        cw = ctl_w or CTL_W
        span = 2 if wide else 1
        col = 0 if wide else self._col
        if wide and self._col:                      # a wide block starts a row
            col = 0
            self._y[0] = self._y[1] = max(self._y)
            self._py[0] = self._py[1] = max(self._py)
        x = COL_X[col]
        y, py = self._y[col], self._py[col]
        w = WIDE_W if wide else BLOCK_W
        note_w = w - PAD * 3 - cw
        idx = self._n
        self._n += 1

        th = comment_h(title, w - PAD * 2)
        self.add("b%d_title" % idx,
                 comment(title, (x + PAD, y + TITLE_LEAD),
                         (x + PAD, py + TITLE_LEAD, w - PAD * 2, th),
                         width=w - PAD * 2, height=th, color=TXT, face=1))
        ry = y + TITLE_LEAD + th + 6
        pry = py + TITLE_LEAD + th + 6
        if desc:
            dh = comment_h(desc, w - PAD * 2, 9.0)
            self.add("b%d_desc" % idx,
                     comment(desc, (x + PAD, ry), (x + PAD, pry, w - PAD * 2, dh),
                             width=w - PAD * 2, height=dh, size=9.0))
            ry += dh + 6
            pry += dh + 6

        if group_init:
            # one loadmess for settings that belong together, split by unjoin —
            # two boxes however many settings there are
            n = len(group_init.split()) - 1
            self.band("gi_%d" % idx, group_init, x + PAD, ry)
            self.band("gj_%d" % idx, "unjoin %d" % (n - 1), x + PAD, ry + 26)
            self.conn("gi_%d" % idx, 0, "gj_%d" % idx, 0)
            ry += 56
            self._group_init = ("gj_%d" % idx, 0)
        for row in rows:
            if row[0] == "attr":
                _, uid, attr, target, note, value_w = row
                aw = attrui_width(attr, value_w)
                self.add(uid, {
                    "type": "attrui",
                    "pos": [x + PAD, ry], "size": [aw, 22],
                    "presentation": [x + PAD, pry, aw, 22],
                    "attrs": {"attr": attr, "text_width": attrui_text_width(attr),
                              "fontname": MONO, "fontsize": FS},
                })
                self.conn(uid, 0, target, 0)
                nh = comment_h(note, note_w, 9.0)
                self.add(uid + "_n",
                         comment(note, (x + PAD + cw + PAD, ry + 2),
                                 (x + PAD + cw + PAD, pry + 2, note_w, nh),
                                 width=note_w, height=nh, size=9.0))
                ry += max(ROW_H, nh + 8)
                pry += max(P_ROW_H, nh + 8)
            else:
                _, uid, spec, note, w_, init, h_ = row
                nh = comment_h(note, note_w, 9.0)
                iy = 0
                if init == "group":
                    src, k = self._group_init
                    self.conn(src, k, uid, 0)
                    self._group_init = (src, k + 1)
                    init = None
                elif init:
                    self.band(uid + "_init", init, x + PAD, ry)
                    iy = 26
                spec = dict(spec)
                spec["pos"] = [x + PAD, ry + iy]
                if spec["type"] not in ("flonum", "number"):
                    spec["size"] = [w_, 22]
                spec["presentation"] = [x + PAD, pry, w_, h_]
                if h_ != 22:
                    spec["size"] = [w_, h_]
                self.add(uid, spec)
                if init:
                    self.conn(uid + "_init", 0, uid, 0)
                self.add(uid + "_n",
                         comment(note, (x + PAD + cw + PAD, ry + iy + 2),
                                 (x + PAD + cw + PAD, pry + 2, note_w, nh),
                                 width=note_w, height=nh, size=9.0))
                ry += max(ROW_H + iy, nh + 8 + iy, h_ + 8 + iy)
                pry += max(P_ROW_H, nh + 8, h_ + 8)

        ry += 6
        pry += 6
        nrows = 0
        for o in objects:
            uid, text, dx, orow = o[0], o[1], o[2], o[3]
            kind = o[4] if len(o) > 4 else "newobj"
            nrows = max(nrows, orow + 1)
            spec = {"type": kind, "text": text,
                    "pos": [x + PAD + dx, ry + orow * OBJ_H],
                    "presentation": [x + PAD + dx, pry + orow * 26,
                                     min(w - PAD * 2 - dx, est_width(text) + 22),
                                     22]}
            self.add(uid, spec)
            if band_objects:
                self._band.add(uid)
        ry += nrows * OBJ_H + PAD
        pry += nrows * 26 + PAD

        self.add("b%d_panel" % idx, {
            "type": "panel", "pos": [x, y], "size": [40, 24],
            "presentation": [x, py, w, pry - py],
            "attrs": {"background": 1, "rounded": 6, "bgcolor": BLOCK_BG},
        })

        if wide:
            self._y[0] = self._y[1] = ry + BLOCK_GAP_Y
            self._py[0] = self._py[1] = pry + BLOCK_GAP_Y
            self._col = 0
        else:
            self._y[col] = ry + BLOCK_GAP_Y
            self._py[col] = pry + BLOCK_GAP_Y
            self._col = 1 - col
        return idx

    # -------------------------------------------------------- input band --
    def input_band(self):
        """[r~ SRC], above every block.  The drive [*~] is an object inside the
        drive block, so the flonum that sets it sits above it, not below."""
        self.band("src_in", "r~ SRC", 20, IN_BAND_Y)
        return "src_in"

    # ------------------------------------------------------- output band --
    def output_block(self, src, outlet=0, trigger=None, title="output", by=None):
        """The scope and the master-bus switch, as the last block on the page.

        In trigger mode live.scope~ locks to whatever is on its second inlet,
        so the UNSHAPED source goes there: the trace stays still however far
        the shaper bends the waveform.
        """
        idx = self._n
        col = self._col
        x, py = COL_X[col], self._py[col]
        by = by if by is not None else max(self._y) + 60
        w = BLOCK_W
        self._n += 1

        th = comment_h(title, w - PAD * 2)
        self.add("b%d_title" % idx,
                 comment(title, (x + PAD, by - 26),
                         (x + PAD, py + TITLE_LEAD, w - PAD * 2, th),
                         width=w - PAD * 2, height=th, color=TXT, face=1))
        self._band.add("b%d_title" % idx)
        pry = py + TITLE_LEAD + th + 6

        self.add("scope", {
            "type": "live.scope~", "pos": [x + PAD, by],
            "presentation": [x + PAD, pry, w - PAD * 2, 180],
            "attrs": dict(SCOPE_ATTRS),
        })
        self._band.add("scope")
        self.conn(src, outlet, "scope", 0)
        if trigger:
            self.conn(trigger, 0, "scope", 1)
        pry += 186

        self.add("gate_tog", {"type": "toggle", "pos": [x + PAD, by + 90],
                              "presentation": [x + PAD, pry, 15, 15]})
        self.add("gate_tog_lbl",
                 comment("to output — add this tab to the master bus",
                         (x + PAD + 30, by + 92),
                         (x + PAD + 26, pry, 420, 18), width=300, color=TXT))
        self.band("gate_msg", "$1 20", x + PAD, by + 130, kind="message")
        self.band("gate_line", "line~", x + PAD, by + 170)
        self.band("gate_mul", "*~", x + PAD + 160, by + 210)
        self.band("send_l", "s~ REF_L", x + PAD + 160, by + 250)
        self.band("send_r", "s~ REF_R", x + PAD + 300, by + 250)
        self._band.update(("gate_tog", "gate_tog_lbl"))
        self.conn("gate_tog", 0, "gate_msg", 0)
        self.conn("gate_msg", 0, "gate_line", 0)
        self.conn("gate_line", 0, "gate_mul", 1)
        self.conn(src, outlet, "gate_mul", 0)
        self.conn("gate_mul", 0, "send_l", 0)
        self.conn("gate_mul", 0, "send_r", 0)
        pry += 26

        self.add("b%d_panel" % idx, {
            "type": "panel", "pos": [x, by - 34], "size": [40, 24],
            "presentation": [x, py, w, pry - py],
            "attrs": {"background": 1, "rounded": 6, "bgcolor": BLOCK_BG},
        })
        self._band.add("b%d_panel" % idx)
        self._py[col] = pry + BLOCK_GAP_Y
        self._col = 1 - col

    def rearm(self, sources, x, y, tag="ra"):
        """Drop the scope out of trigger mode and back, on any bang."""
        self.band(tag + "_off", "mode 0", x, y, kind="message")
        self.band(tag + "_del", "delay 250", x, y + 44)
        self.band(tag + "_on", "mode 1", x, y + 88, kind="message")
        for u in sources:
            self.conn(u, 0, tag + "_off", 0)
        self.conn(tag + "_off", 0, tag + "_del", 0)
        self.conn(tag + "_del", 0, tag + "_on", 0)
        self.conn(tag + "_off", 0, "scope", 0)
        self.conn(tag + "_on", 0, "scope", 0)

    def retrigger(self, picker, sel, x, y):
        """live.tab -> selector~, with the scope dropped out of trigger mode
        across the change.

        In trigger mode live.scope~ holds the frame it captured until the next
        trigger arrives.  Switch the source or the shaper mid-capture and the
        held frame is the one containing the change — the join you see on
        screen.  Worse, if the new signal never crosses the threshold in the
        trigger direction, no further trigger comes and that frame stays.  So
        the change is bracketed: history mode first (which always redraws),
        the switch, then back to trigger a moment later.  `t i b` fires its
        right outlet first, which is the bang.
        """
        self.band("rt_t", "t i b", x, y)
        self.band("rt_off", "mode 0", x + 140, y + 44, kind="message")
        self.band("rt_del", "delay 250", x + 140, y + 88)
        self.band("rt_on", "mode 1", x + 140, y + 132, kind="message")
        self.band("sel_plus", "+ 1", x, y + 44)
        self.conn(picker, 0, "rt_t", 0)
        self.conn("rt_t", 1, "rt_off", 0)        # fires first: leave trigger mode
        self.conn("rt_t", 0, "sel_plus", 0)      # then switch
        self.conn("rt_off", 0, "rt_del", 0)
        self.conn("rt_del", 0, "rt_on", 0)       # and re-arm a moment later
        self.conn("rt_off", 0, "scope", 0)
        self.conn("rt_on", 0, "scope", 0)
        self.conn("sel_plus", 0, sel, 0)

    def close(self, n_inputs, picker="which", src=None, trigger="src_in",
              title="output"):
        """Below every block: the selector the audio converges on, the
        retrigger chain, then the scope and the bus switch."""
        bottom = max(v["pos"][1] for v in self.objects.values() if v.get("pos"))
        self.band("sel", "selector~ %d 1" % n_inputs, 20, bottom + 60)
        self.retrigger(picker, "sel", 300, bottom + 60)
        self.output_block(src or "sel", trigger=trigger, title=title,
                          by=bottom + 280)

    # --------------------------------------------------------------- end --
    def spec(self):
        bottom = max(s["pos"][1] + 24 for s in self.objects.values()
                     if s.get("pos"))
        pbottom = max(s["presentation"][1] + s["presentation"][3]
                      for s in self.objects.values() if s.get("presentation"))
        nw = NOTE_H.get("_width", WIN_W - 60)
        nh = NOTE_H.get(self.key, 40 * len(self.notes_lines))
        self.add("notes", {
            # The v8ui form, as butter_comment.maxhelp writes it: it names the
            # script itself, so it does not depend on the package's init/
            # substitution being registered at the Max launch that opens this.
            # Only v8ui's own attributes go in attrs; the script's live in
            # embedstate (see butter_embedstate).
            "type": "v8ui",
            "pos": [20, bottom + 40], "size": [nw, nh],
            "presentation": [20, pbottom + 20, nw, nh],
            "inlets": 1, "outlets": 2, "outlettype": ["", ""],
            "attrs": {
                "filename": "butter_comment.js", "border": 0,
                "fontname": MONO, "fontsize": 10.0, "textcolor": DIM,
            },
            "box_extras": {"embedstate": butter_embedstate({
                "z_text": "<br>".join(self.notes_lines),
                "z_tablecolor": [0.45, 0.46, 0.5, 0.7],
                # almost the page colour, a shade darker: a code span should read as a
                # different kind of text, not as a highlight
                "z_codebg": [0.0, 0.0, 0.0, 0.18],
                "z_linespacing": 1.2, "z_headingscale": 0.75,
                "z_tablewrap": 0.3, "z_padding": 8,
            })},
        })
        self.add("page_panel", {
            "type": "panel", "pos": [20, bottom + nh + 80], "size": [40, 24],
            "presentation": [8, 8, WIN_W - 36, pbottom + nh + 40],
            "attrs": {"background": 1, "rounded": 8, "bgcolor": PAGE_BG},
        })
        return {
            "width": WIN_W, "height": bottom + nh + 140, "bglocked": 1,
            "objects": self.objects, "connections": self.connections,
            "patcher_extras": {"showontab": 1},
        }


# ======================================================= tab 1 · sources ===
SOURCE_NAMES = ["1 cycle~", "2 phasor~", "3 phase dist", "4 saw~", "5 tri~",
                "6 rect~", "7 train~", "8 click~", "9 wave~", "10 noise~",
                "11 pink~", "12 rand~", "13 ioscbank~", "14 meldosc~"]


def tab_sources():
    t = Page(
        "sources", "1 sources",
        "1 · Sources — every waveform generator, with the shaping each one carries",
        "Pick a source in the first block; it feeds [s~ SRC], which every waveshaping tab "
        "reads, and the scope at the end of this page.  One block per object: its controls "
        "stack down the left, what each one does is written beside it, and the object itself "
        "sits at the bottom of the block.  An [attrui] means the object really has that "
        "attribute.  Where a block has none, the object has no attributes at all and "
        "everything is a creation argument or an inlet — saw~, tri~, rect~, click~, pink~, "
        "rand~, kink~ and ioscbank~ are all in that group.",
        NOTES.SOURCES)

    t.block("which source",
            [C("pick", live_tab_spec(SOURCE_NAMES, "SOURCE_SELECT",
                                     lines=len(SOURCE_NAMES)),
               "every generator below runs at once; this picks the one that reaches "
               "[s~ SRC], the scope at the foot of this page, and every waveshaping tab",
               w=200, h=22 * len(SOURCE_NAMES))],
            [],
            desc="The blocks below are in this order, reading left to right along each row.")
    t.objects["pick"]["size"] = [200, 22 * len(SOURCE_NAMES)]
    t.objects["pick"]["presentation"][3] = 22 * len(SOURCE_NAMES)

    def gen(n, name, title, rows, objects, out, group_init=None):
        t.block("%d · %s" % (n, title), rows, objects, group_init=group_init)
        t.conn(out[0], out[1], "sel", n)

    gen(1, "cycle~",
        "cycle~ — sine, or any 512-sample wavetable",
        [A("c_freq", "frequency", "osc", "oscillator frequency in Hz; inlet 0 takes the "
                                         "same thing as a float or a signal"),
         A("c_phase", "phase", "osc", "where in the table the cycle starts, 0.-1.; inlet 1 "
                                      "takes this as a signal, which is phase modulation"),
         A("c_boff", "buffer_offset", "osc", "first sample of the buffer to read, when a "
                                             "buffer is supplying the waveform"),
         A("c_bsize", "buffer_sizeinsamps", "osc", "override the 512-sample window; -1 uses "
                                                   "the whole buffer", 70),
         M("c_tab", "set REFTABLE", "read the shared wavetable at the foot of this page"),
         M("c_cos", "set", "back to the built-in cosine")],
        [("osc", "cycle~ 220", 0, 0)], ("osc", 0))
    for c in ("c_freq", "c_phase", "c_boff", "c_bsize", "c_tab", "c_cos"):
        t.conn(c, 0, "osc", 0)

    gen(2, "phasor~",
        "phasor~ — the raw 0.-1. ramp",
        [A("p_freq", "frequency", "ph", "cycles per second; NOT antialiased, so this is a "
                                        "phase source, not a sawtooth to listen to"),
         A("p_off", "phaseoffset", "ph", "shifts where in the ramp the cycle begins, 0.-1."),
         A("p_jit", "jitter", "ph", "randomises the frequency each cycle; does nothing "
                                    "until @limit is set as well"),
         A("p_lim", "limit", "ph", "how far @jitter may stray from the set frequency"),
         A("p_lock", "lock", "ph", "hold the frequency against jitter and sync", 40),
         A("p_sync", "syncupdate", "ph", "apply a frequency change only at the start of the "
                                         "next cycle, not immediately", 40)],
        [("ph", "phasor~ 110", 0, 0)], ("ph", 0))
    for c in ("p_freq", "p_off", "p_jit", "p_lim", "p_lock", "p_sync"):
        t.conn(c, 0, "ph", 0)

    gen(3, "phase dist",
        "phase distortion — a ramp bent, then read as phase",
        [C("pd_freq", {"type": "flonum"}, "ramp frequency; kink~ has no attributes, so this "
                                          "and the slope below are plain inlets",
            init="loadmess 110."),
         C("pd_slope", {"type": "flonum"}, "kink~'s slope multiplier on inlet 1: where the "
                                           "ramp breaks, and how steeply",
            init="loadmess 2."),
         A("pd_curve", "curve", "pd_tw", "twist~ bends the ramp into a curve instead of "
                                         "breaking it; 0. is the straight ramp"),
         A("pd_shape", "shapemode", "pd_tw", "twist~: keep the curve's shape as the "
                                             "frequency changes", 40),
         A("pd_sync", "syncupdate", "pd_tw", "twist~: change the curve only at a cycle "
                                             "boundary", 40)],
        [("pd_ph", "phasor~ 110", 0, 0), ("pd_kink", "kink~", 0, 1),
         ("pd_tw", "twist~", 110, 1), ("pd_osc", "cycle~ 0", 200, 1)],
        ("pd_osc", 0))
    t.conn("pd_freq", 0, "pd_ph", 0)
    t.conn("pd_ph", 0, "pd_kink", 0)
    t.conn("pd_kink", 0, "pd_tw", 0)
    t.conn("pd_tw", 0, "pd_osc", 1)
    t.conn("pd_slope", 0, "pd_kink", 1)
    for c in ("pd_curve", "pd_shape", "pd_sync"):
        t.conn(c, 0, "pd_tw", 0)

    gen(4, "saw~", "saw~ — antialiased sawtooth",
        [C("s_freq", {"type": "flonum"}, "frequency on inlet 0.  saw~ has no attributes at "
                                         "all; inlet 1 takes a sync signal, so one "
                                         "oscillator can be slaved to another",
            init="loadmess 110.")],
        [("saw", "saw~ 110", 0, 0)], ("saw", 0))
    t.conn("s_freq", 0, "saw", 0)

    gen(5, "tri~", "tri~ — antialiased triangle",
        [C("t_freq", {"type": "flonum"}, "frequency on inlet 0", init="group"),
         C("t_duty", {"type": "flonum"}, "duty cycle on inlet 1: 0.5 is a triangle, 0. or "
                                         "1. a ramp, and the sweep between them is the "
                                         "shaping tri~ has.  No attributes",
            init="group")],
        [("tri", "tri~ 110 0.5", 0, 0)], ("tri", 0), group_init="loadmess 110. 0.5")
    t.conn("t_freq", 0, "tri", 0)
    t.conn("t_duty", 0, "tri", 1)

    gen(6, "rect~", "rect~ — antialiased pulse",
        [C("r_freq", {"type": "flonum"}, "frequency on inlet 0", init="group"),
         C("r_width", {"type": "flonum"}, "pulse width on inlet 1; sweeping it is "
                                          "pulse-width modulation.  No attributes",
            init="group")],
        [("rect", "rect~ 110 0.5", 0, 0)], ("rect", 0), group_init="loadmess 110. 0.5")
    t.conn("r_freq", 0, "rect", 0)
    t.conn("r_width", 0, "rect", 1)

    gen(7, "train~", "train~ — pulse train",
        [A("tr_int", "interval", "train", "time between pulses in milliseconds"),
         A("tr_w", "width", "train", "how much of each interval is the high part, 0.-1."),
         A("tr_ph", "phase", "train", "where in the interval the pulse sits, 0.-1."),
         A("tr_rm", "resetmode", "train", "defer an interval change to the next pulse "
                                          "instead of taking it at once", 40)],
        [("train", "train~ 250 0.5", 0, 0),
         ("train_pr", "print TRAIN_CLOCK", 160, 0)], ("train", 0))
    for c in ("tr_int", "tr_w", "tr_ph", "tr_rm"):
        t.conn(c, 0, "train", 0)

    gen(8, "click~", "click~ — a single impulse",
        [M("cl_fire", "bang", "one impulse, the shortest excitation there is; feed it a "
                              "filter or a resonator.  click~ has no attributes")],
        [("click", "click~", 0, 0)], ("click", 0))
    t.conn("cl_fire", 0, "click", 0)

    gen(9, "wave~", "wave~ — REFTABLE read as a wavetable",
        [C("w_freq", {"type": "flonum"}, "the phasor~ scans the table, so its frequency is "
                                         "the pitch", init="loadmess 110."),
         A("w_interp", "interp", "wave", "how the table is read between samples: None is "
                                         "the raw stepped table, the rest smooth it", 100),
         A("w_bias", "interp_bias", "wave", "Hermite only: pulls the curve toward one "
                                            "neighbour"),
         A("w_tens", "interp_tension", "wave", "Hermite only: how tightly the curve hugs "
                                               "the points")],
        [("w_ph", "phasor~ 110", 0, 0), ("wave", "wave~ REFTABLE", 0, 1)], ("wave", 0))
    t.conn("w_freq", 0, "w_ph", 0)
    t.conn("w_ph", 0, "wave", 0)
    for c in ("w_interp", "w_bias", "w_tens"):
        t.conn(c, 0, "wave", 0)

    gen(10, "noise~", "noise~ — white noise",
        [A("n_classic", "classic", "white", "use the older generator.  A new random value "
                                            "every sample, so noise~ has no frequency and "
                                            "no other attribute", 40)],
        [("white", "noise~", 0, 0)], ("white", 0))
    t.conn("n_classic", 0, "white", 0)

    gen(11, "pink~", "pink~ — 1/f noise", [],
        [("pink", "pink~", 0, 0)], ("pink", 0))

    gen(12, "rand~", "rand~ — band-limited noise",
        [C("rd_freq", {"type": "flonum"}, "a new random value at this rate, interpolated "
                                          "between.  No attributes.  At a few Hz it is an "
                                          "audio-rate LFO, not a noise source",
            init="loadmess 1000.")],
        [("band", "rand~ 1000", 0, 0)], ("band", 0))
    t.conn("rd_freq", 0, "band", 0)

    gen(13, "ioscbank~", "ioscbank~ — a bank of sine oscillators",
        [M("b_odd", "set 110. 0.4 330. 0.13 550. 0.08 770. 0.06",
           "frequency/amplitude pairs: odd harmonics only, which is a square wave's spectrum"),
         M("b_all", "set 110. 0.4 220. 0.2 330. 0.13 440. 0.1",
           "every harmonic, falling in level — a sawtooth's spectrum"),
         M("b_inh", "set 110. 0.3 271. 0.2 437. 0.15 683. 0.1",
           "partials that are not whole multiples: a bell rather than a note"),
         M("b_gl", "freqsmooth 4410", "glide to new values over 4410 samples, 100 ms at 44.1k"),
         M("b_ngl", "freqsmooth 1", "no glide: jump to the new values, which is what "
                                    "oscbank~ always does"),
         M("b_sz", "size 4", "how many of the 32 oscillators are live"),
         M("b_hush", "silence", "zero every amplitude.  ioscbank~ has no attributes: all of "
                                "this is messages")],
        [("b_lb", "loadbang", 0, 0), ("bank", "ioscbank~ 32", 0, 1)], ("bank", 0))
    for c in ("b_odd", "b_all", "b_inh", "b_gl", "b_ngl", "b_sz", "b_hush"):
        t.conn(c, 0, "bank", 0)
    t.conn("b_lb", 0, "b_odd", 0)

    gen(14, "meldosc~", "abl.dsp.meldosc~ — 24 engines in one box  [ableton-dsp, in Max]",
        [A("m_freq", "frequency", "mel", "oscillator frequency in Hz; also a signal inlet"),
         A("m_type", "type", "mel", "which of the 24 engines is running", 140),
         A("m_1", "macro1", "mel", "means something different in each engine: shape for "
                                   "Basic Shapes, density for Bubble, modulation for Fold Fm"),
         A("m_2", "macro2", "mel", "the second macro; in several engines this is the "
                                   "waveshaping or wavefolding amount")],
        [("mel", "abl.dsp.meldosc~ 110. 0.5 0.5", 0, 0)], ("mel", 0))
    for c in ("m_freq", "m_type", "m_1", "m_2"):
        t.conn(c, 0, "mel", 0)

    # the shared wavetable — no audio output of its own
    t.block(
        "· REFTABLE — the shared 512-sample buffer~ that cycle~ and wave~ both read",
        [M("rt_sin1", "fill sin 1", "one cycle of sine: the plain waveform"),
         M("rt_sin3", "fill sin 3", "three cycles in the same table, so reading it plays "
                                    "the third harmonic"),
         M("rt_cos4", "fill cos 1 4", "a rational count — one QUARTER of a cosine.  It "
                                      "rises from 0. to 1. and stops, so it is a soft-knee "
                                      "curve rather than a waveform"),
         M("rt_cos2", "fill cos 1 2", "half a cosine: a full sweep from 1. down to -1., a "
                                      "symmetrical S"),
         M("rt_snc2", "fill sinc 2 1", "sinc is sin(x)/x.  The first number is how many "
                                       "times it crosses zero on each side: 2 gives a broad "
                                       "bell with a single ripple, a soft tone"),
         M("rt_snc4", "fill sinc 4 1", "4 crossings: more ripples, a brighter and more "
                                       "nasal tone"),
         M("rt_snc8", "fill sinc 8 1", "8 crossings: a narrow spike with a long ringing "
                                       "tail, the brightest of the three"),
         M("rt_snc80", "fill sinc 8 0", "the same 8 crossings with the second flag at 0: "
                                        "the function does NOT start at zero, so the peak "
                                        "moves to the edge of the table and it reads as a "
                                        "decaying ring instead of a symmetrical pulse"),
         M("rt_han", "apply hanning", "apply reshapes what is already in the table rather "
                                      "than replacing it — this tapers both ends to zero"),
         M("rt_blk", "apply blackman", "a narrower taper than hanning; triangle, hamming, "
                                       "welch and kaiser <beta> are the others"),
         M("rt_half", "apply gain 0.5", "scale every sample; apply offset <f> adds a "
                                        "constant instead"),
         M("rt_flat", "fill 0.", "a bare float fills the whole table with that value")],
        [("rt_lb", "loadbang", 0, 0), ("rt_b", "b 2", 0, 1),
         ("rt_fill", "fill sin 1", 0, 2, "message"),
         ("rt_size", "sizeinsamps 512", 150, 2, "message"),
         ("buf", "buffer~ REFTABLE", 0, 3),
         ("wf", "waveform~ @buffername REFTABLE", 200, 3)],
        wide=True,
        desc="buffer~ has no fill attribute: fill and apply are messages.  Everything here "
             "rewrites the same table, so cycle~ (block 1) and wave~ (block 9) both change "
             "with it.")
    t.conn("rt_lb", 0, "rt_b", 0)
    t.conn("rt_b", 1, "rt_size", 0)
    t.conn("rt_b", 0, "rt_fill", 0)
    t.conn("rt_size", 0, "buf", 0)
    t.conn("rt_fill", 0, "buf", 0)
    for c in ("rt_sin1", "rt_sin3", "rt_cos4", "rt_cos2", "rt_snc2", "rt_snc4",
              "rt_snc8", "rt_snc80", "rt_han", "rt_blk", "rt_half", "rt_flat"):
        t.conn(c, 0, "buf", 0)

    t.close(len(SOURCE_NAMES), picker="pick", trigger="sel",
            title="output — the selected source")
    bottom = t.objects["sel"]["pos"][1]
    t.band("bus", "s~ SRC", 20, bottom + 120)
    t.band("bus_lbl", "every waveshaping tab reads this bus with [r~ SRC]",
           20, bottom + 160, kind="comment")
    t.conn("sel", 0, "bus", 0)
    return t


# ============================================== the waveshaping tabs =======
def shaper_page(key, tab_title, header, blurb, notes, entries, drive_init,
                extra=None):
    """A tab whose input is the tab-1 bus: one block per shaper object."""
    t = Page(key, tab_title, header, blurb, notes)
    t.input_band()
    t.block("drive — the only control a nonlinearity has",
            [C("gain", {"type": "flonum"},
               "gain into the shapers below.  A nonlinearity has no level of its own: how "
               "hard you push decides which part of its curve the signal visits",
               init=drive_init)],
            [("drive", "*~ 1.", 0, 0)],
            desc="The input is whatever tab 1 has selected, arriving on [r~ SRC] above.  A "
                 "sine shows the shaping most clearly; noise shows none of it.")
    t.conn("src_in", 0, "drive", 0)
    t.conn("gain", 0, "drive", 1)

    items = []
    for i, e in enumerate(entries):
        uid, text, title, rows, desc = e[0], e[1], e[2], e[3], e[4]
        gi = e[5] if len(e) > 5 else None
        items.append(text.split()[0])
        t.block(title, rows, [(uid, text, 0, 0)], desc=desc, group_init=gi)
        t.conn("drive", 0, uid, 0)
        t.conn(uid, 0, "sel", i + 1)
    if extra:
        extra(t)
    t.block("which shaper",
            [C("which", live_tab_spec(items, key.upper() + "_SELECT",
                                      lines=len(items)),
               "the one you hear and see; they all run at once, this picks the tap",
               w=200)],
            [])
    t.close(len(items))
    return t


def tab_clip():
    return shaper_page(
        "clip", "2 overdrive~ pong~",
        "2 · overdrive~ and pong~ — saturation, folding, wrapping and clipping",
        "pong~ is the one to reach for: @mode fold reflects the signal back off each bound, "
        "wrap jumps it to the other bound, and clip holds it there — and that third mode is "
        "exactly what clip~ does, so clip~ is not repeated on this page.  Folding is what "
        "makes pong~ a timbre generator rather than a limiter: every fold adds harmonics, so "
        "raising the drive past the range changes the colour instead of only the loudness.",
        NOTES.CLIP,
        [
            ("soft", "overdrive~ 4.", "overdrive~ — soft clipping",
             [C("od", {"type": "flonum"},
                "drive factor on inlet 1, 1. to 10.  overdrive~ has no attributes: this is "
                "its only control, and it rounds the corners rather than cutting them",
                init="loadmess 4.")],
             None),
            ("fold", "pong~ @mode fold @range -0.4 0.4", "pong~ — fold, wrap or clip",
             [A("pmode_ui", "mode", "fold", "fold reflects the signal off each bound, wrap "
                                            "jumps it to the other one, clip holds it there",
                70),
              A("prange_ui", "range", "fold", "the two bounds.  Written into the box on "
                                              "purpose: an attrui draws as many fields as "
                                              "the attribute's value has, so without it you "
                                              "would get one field and read it as a single "
                                              "number", 140)],
             None),
        ],
        "loadmess 3.")


MATH_SHAPERS = [
    ("tanh~", "the classic soft clipper: an S that flattens smoothly toward ±1 "
              "and never overshoots, which is why every saturator is built on it"),
    ("sinh~", "the opposite curve — it expands instead of compressing, so it "
              "gets loud fast and clips the output rather than itself"),
    ("cosh~", "symmetrical about zero, so it rectifies as well as expanding: "
              "even harmonics, and an octave up"),
    ("atanh~", "the inverse of tanh~: gentle in the middle, vertical at ±1, so "
               "it screams at full scale"),
    ("sinx~", "sine of the signal in radians; past ±π it folds back, which "
              "makes this a wavefolder with no parameters"),
    ("cosx~", "cosine in radians; even-symmetric, so it doubles the frequency "
              "as well as folding"),
    ("tanx~", "tangent: it goes to infinity near ±π/2, so keep the drive low — "
              "the clip~ after the selector is what keeps this usable"),
    ("cos~", "cosine over a 0.-1. input rather than radians: the wavetable "
             "form, and the function cycle~ reads"),
    ("asin~", "arc-sine: needs -1. to 1. in, and steepens toward the ends like "
              "a milder atanh~"),
    ("atan~", "arc-tangent: another S, wider and softer than tanh~, and it "
              "never quite flattens"),
    ("abs~", "full-wave rectifier: it folds the negative half up, doubling the "
             "frequency and adding a DC offset"),
    ("sqrt~", "compresses the top of the range; negative input gives 0, so it "
              "half-rectifies at the same time"),
    ("trunc~", "throws the fraction away — a one-bit quantiser, and the crudest "
               "lo-fi there is"),
    ("delta~", "each sample minus the one before: a differentiator, which is a "
               "6 dB per octave highpass"),
]


def _math_extra(t):
    t.block("rampsmooth~ — limit how fast a signal may change",
            [A("rs_up", "rampup", "smooth", "samples taken to reach a higher value"),
             A("rs_dn", "rampdown", "smooth", "samples taken to reach a lower one")],
            [("smooth", "rampsmooth~ 441 441", 0, 0)],
            desc="Not in the selector above: it shapes the rate of change rather than the "
                 "amplitude, so it belongs beside these rather than among them.")
    t.block("slide~ — the same idea, logarithmically",
            [A("sl_up", "slideup", "slide", "a factor, not a count: bigger is slower"),
             A("sl_dn", "slidedown", "slide", "the factor for falling values")],
            [("slide", "slide~ 20. 20.", 0, 0)],
            desc="slide~ approaches the target asymptotically where rampsmooth~ goes "
                 "straight there.  Its times are in SAMPLES, not milliseconds.")
    t.conn("drive", 0, "smooth", 0)
    t.conn("drive", 0, "slide", 0)


def tab_math():
    entries = []
    for name, note in MATH_SHAPERS:
        entries.append((
            "m_" + name.replace("~", ""), name,
            "%s" % name,
            [],
            note))
    t = shaper_page(
        "math", "3 signal maths",
        "3 · Signal maths — the one-in one-out objects used as transfer functions",
        "Every object here takes a signal and returns a number computed from it, sample by "
        "sample.  That is the whole definition of a waveshaper, which is why this page and "
        "tab 4's lookup~ are the same idea twice: these are curves Max already knows, "
        "lookup~ is a curve you draw.  Not one of them has an attribute — the drive above is "
        "the only control, and how hard you push decides which part of the curve the signal "
        "visits.  A clip~ -1. 1. sits after the selector because tanx~ and atanh~ will "
        "happily send several thousand at full drive.",
        NOTES.MATH,
        entries, "loadmess 1.", extra=_math_extra)
    return t


def tab_lookup():
    t = Page(
        "lookup", "4 lookup~",
        "4 · lookup~ — waveshaping in its general form: a transfer table",
        "The buffer~ holds the transfer curve.  The input's instantaneous amplitude, -1. to "
        "1., picks a point along the table, and the value found there is the output — so the "
        "shape of the curve IS the timbre.  Drive it to full scale: a quieter signal only "
        "ever reads the middle of the table.  The waveform~ shows the curve you are hearing, "
        "so changing it changes the sound and the picture together.",
        NOTES.LOOKUP)
    t.input_band()
    t.block("drive — how much of the curve the signal visits",
            [C("gain", {"type": "flonum"},
               "gain into lookup~.  The input range -1. to 1. maps across the whole table, "
               "so anything quieter reads only the middle of it",
               init="loadmess 1.")],
            [("drive", "*~ 1.", 0, 0)],
            desc="The input is whatever tab 1 has selected, arriving on [r~ SRC] above.")
    t.conn("src_in", 0, "drive", 0)
    t.conn("gain", 0, "drive", 1)

    t.block("lookup~ — the object",
            [A("lk_size", "size", "look", "how many samples of the buffer are the table"),
             A("lk_off", "offset", "look", "which sample the table starts at, for several "
                                           "curves in one buffer"),
             A("lk_chan", "chan", "look", "which channel of the buffer to read")],
            [("look", "lookup~ SHAPETABLE", 0, 0)])
    t.conn("drive", 0, "look", 0)

    t.block("SHAPETABLE — the curve itself",
            [M("c_sin", "fill sin 1", "a whole sine as the curve: it turns back on itself "
                                      "at the extremes, so this is a folder"),
             M("c_cos2", "fill cos 1 2", "half a cosine: a smooth S from 1. down to -1., "
                                         "the soft-saturation shape"),
             M("c_sinc", "fill sinc 4 1", "sin(x)/x: ripples in the curve become ripples in "
                                          "the spectrum — ragged and bright"),
             M("c_flat", "fill 0.", "an empty table outputs silence, whatever you feed it — "
                                    "worth hearing once")],
            [("lb", "loadbang", 0, 0), ("lb_b", "b 2", 0, 1),
             ("fill_init", "fill cos 1 2", 0, 2, "message"),
             ("size_msg", "sizeinsamps 512", 150, 2, "message"),
             ("buf", "buffer~ SHAPETABLE", 0, 3),
             ("wf", "waveform~ @buffername SHAPETABLE", 200, 3)],
            wide=True,
            desc="On load the buffer is sized first (b 2's right outlet fires first) and "
                 "then filled.  tab 1's REFTABLE block explains every fill and apply form.")
    t.conn("lb", 0, "lb_b", 0)
    t.conn("lb_b", 1, "size_msg", 0)
    t.conn("lb_b", 0, "fill_init", 0)
    t.conn("size_msg", 0, "buf", 0)
    t.conn("fill_init", 0, "buf", 0)
    for m in ("c_sin", "c_cos2", "c_sinc", "c_flat"):
        t.conn(m, 0, "buf", 0)
    bottom = max(v["pos"][1] for v in t.objects.values() if v.get("pos"))
    t.output_block("look", trigger="src_in", by=bottom + 200)
    t.rearm(("c_sin", "c_cos2", "c_sinc", "c_flat"), 300, bottom + 60)
    return t


def tab_lofi():
    return shaper_page(
        "lofi", "5 degrade~ downsamp~",
        "5 · degrade~ and downsamp~ — sample-rate and bit-depth reduction",
        "degrade~ does both jobs in one box.  downsamp~ does only the rate half, and takes "
        "it in Hz rather than as a ratio.  Both alias on purpose — the extra tones you hear "
        "are images of the signal folded back below the new Nyquist, and that is the sound.  "
        "Neither has a single attribute, so every control here is an inlet; each block below "
        "holds the controls for the object named in its title.",
        NOTES.LOFI,
        [
            ("deg", "degrade~", "degrade~ — rate and bit depth together",
             [C("ratio", {"type": "flonum"},
                "sample-rate RATIO on inlet 1: 1. is no change, 0.25 is a quarter of the "
                "rate.  Not a frequency", init="group"),
              C("bits", {"type": "number"},
                "bit depth on inlet 2.  Below about 8 the quantisation itself becomes the "
                "timbre", init="group")],
             None, "loadmess 0.25 6"),
            ("down", "downsamp~ 2000", "downsamp~ — rate only",
             [C("dsrate", {"type": "flonum"},
                "the new sample rate in HERTZ on inlet 1, not a ratio — the one difference "
                "from degrade~ that matters", init="loadmess 2000.")],
             None),
        ],
        "loadmess 1.")


def tab_pkg_shapers():
    t = Page(
        "pkgshape", "6 package waveshapers",
        "6 · abl.dsp.waveshaper~ · sn.drive~ · gen17 — waveshapers from packages",
        "Two objects that build a transfer curve from parameters instead of from a table, "
        "and one that computes a table for tab 4.  abl.dsp.waveshaper~ ships inside Max in "
        "the ableton-dsp package, so it needs no install; sn.drive~ needs s2n and gen17 "
        "needs PeRColate.  Each object's attributes are in its own block below.",
        NOTES.PKGSHAPE)
    t.input_band()
    t.block("drive — into both shapers",
            [C("gain", {"type": "flonum"},
               "gain ahead of the two objects, on top of their own drive attributes",
               init="loadmess 1.")],
            [("drive", "*~ 1.", 0, 0)],
            desc="The input is whatever tab 1 has selected, arriving on [r~ SRC] above.")
    t.conn("src_in", 0, "drive", 0)
    t.conn("gain", 0, "drive", 1)

    t.block("abl.dsp.waveshaper~  [ableton-dsp, ships with Max]",
            [A("ws_drive", "drive", "shaper", "input gain in dB before the curve, -36 to 36"),
             A("ws_shdrive", "shaper_drive", "shaper", "how much the five curve attributes "
                                                       "below affect the signal.  At 0. "
                                                       "they do nothing"),
             A("ws_mix", "mix", "shaper", "dry/wet.  At 0. the object is a wire"),
             A("ws_curve", "curve", "shaper", "adds mostly third-order harmonics"),
             A("ws_depth", "depth", "shaper", "superimposes a sine on the transfer curve, "
                                              "and sets its amplitude"),
             A("ws_period", "period", "shaper", "how many ripples that superimposed sine has"),
             A("ws_lin", "linearity", "shaper", "reshapes the straight part of the curve, "
                                                "working with curve and depth"),
             A("ws_damp", "damping", "shaper", "flattens the curve near zero — an "
                                               "ultra-fast noise gate built into the shape"),
             A("ws_clip", "post_clip", "shaper", "clipping applied after the curve: No "
                                                 "Clip, Soft Clip, Hard Clip", 90),
             A("ws_over", "oversample", "shaper", "run the curve at a higher rate to reduce "
                                                  "aliasing", 40),
             A("ws_dcb", "dcblock", "shaper", "remove the DC an asymmetric curve produces",
               40),
             A("ws_gain", "gain", "shaper", "output gain in dB after the curve, -70.6 to 0")],
            [("shaper", "abl.dsp.waveshaper~ @drive 12. @shaper_drive 1. @mix 1.", 0, 0)])
    t.conn("drive", 0, "shaper", 0)
    t.conn("drive", 0, "shaper", 1)          # stereo: inlet 1 is the right channel
    t.conn("shaper", 0, "sel", 1)

    t.block("sn.drive~  [s2n]",
            [A("sn_drive", "drive", "sn", "percentage of harmonic distortion, from 1. up.  "
                                          "The one control that matters"),
             A("sn_warm", "warmth", "sn", "±20 dB of low-frequency adjustment inside the "
                                          "object"),
             A("sn_in", "input", "sn", "±20 dB of input gain, in dB"),
             A("sn_out", "output", "sn", "±20 dB of output gain, in dB"),
             A("sn_mix", "mix", "sn", "percentage of wet signal against dry"),
             A("sn_eng", "engine", "sn", "1 selects the higher-quality mode", 40),
             A("sn_byp", "bypass", "sn", "1 passes the input through untouched", 40)],
            [("sn", "sn.drive~ @drive 40.", 0, 0)],
            desc="One signal inlet, and everything else an attribute.  Its right outlet "
                 "dumps the parameters as a list on request.")
    t.conn("drive", 0, "sn", 0)
    t.conn("sn", 0, "sel", 2)

    t.block("gen17  [PeRColate] — a Chebyshev table for tab 4's lookup~",
            [M("cheb_msg", "1. 0.5 0.3 0.2",
               "the amplitude you want for the fundamental and each harmonic above it"),
             M("cheb_bang", "bang",
               "solve, and send the index/value pairs to peek~.  A full-level sine through "
               "the resulting table then gains exactly those harmonics and no others")],
            [("cheb", "gen17 512", 0, 0), ("cheb_peek", "peek~ SHAPETABLE", 0, 1)],
            desc="gen17 is a table generator, not an audio object: it writes SHAPETABLE, "
                 "which lookup~ on tab 4 reads.  size and offset are messages, not "
                 "attributes.")
    t.conn("cheb_msg", 0, "cheb", 0)
    t.conn("cheb_bang", 0, "cheb", 0)
    t.conn("cheb", 0, "cheb_peek", 0)

    t.block("which shaper",
            [C("which", live_tab_spec(["abl.dsp.waveshaper~", "sn.drive~"],
                                      "PKGSHAPE_SELECT", lines=2),
               "the one you hear and see; both run at once, this picks the tap", w=200)],
            [])
    t.close(2)
    return t




def tab_catalog():
    return Page(
        "catalog", "7 overlaps & sources",
        "7 · Every object in this area, and the package each one comes from",
        "The tabs before this one show the object to reach for first in each family.  This "
        "is everything that overlaps with them, grouped by job, one per line, with its "
        "package named.  An object with no package named is built into Max.",
        NOTES.CATALOG)


# =============================================================== the root ===
def root_spec(tabs):
    o, c = {}, []
    o["title"] = {
        "type": "comment",
        "text": "Waveform generation & waveshaping — a reference patch",
        "pos": [20, 14], "size": [800, 26],
        "presentation": [26, 18, 700, 26],
        "attrs": {"fontname": MONO, "fontsize": 15.0, "fontface": 1,
                  "textcolor": ACCENT},
    }
    o["howto"] = {
        "type": "comment",
        "text": (
            "Tab 1 holds every generator.  Pick one there and it feeds [s~ SRC], which every "
            "waveshaping tab reads — so no other tab carries a source of its own, and "
            "changing the source changes what all of them are shaping.\n\n"
            "Any tab's \"to output\" toggle puts that tab onto the master bus below.  They "
            "sum, so two left on are heard together.  Click the speaker to start audio.\n\n"
            "Every page is built from blocks: one block per object, its controls stacked "
            "down the left with what each one does written beside it, and the object itself "
            "at the foot of the block.  An [attrui] means the object really has that "
            "attribute.\n\n"
            "Each tab shows its result on a live.scope~ in trigger mode over 800 samples, "
            "triggered by the unshaped source so the trace stays still.  Tab 7 lists every "
            "object in one place."
        ),
        "pos": [20, 50], "size": [560, 260],
        "presentation": [26, 56, 560, 260],
        "attrs": {"fontname": MONO, "fontsize": FS, "textcolor": TXT},
    }
    idx = ["GENERATION", "", "  1 sources", "", "WAVESHAPING", ""]
    for t in tabs[1:-1]:
        idx.append("  " + t.tab_title)
    idx += ["", "REFERENCE", "", "  " + tabs[-1].tab_title]
    o["index"] = {
        "type": "comment", "text": "\n".join(idx),
        "pos": [620, 50], "size": [340, 260],
        "presentation": [620, 56, 330, 260],
        "attrs": {"fontname": MONO, "fontsize": FS, "textcolor": DIM},
    }
    o["r_l"] = {"type": "newobj", "text": "r~ REF_L", "pos": [20, 340]}
    o["r_r"] = {"type": "newobj", "text": "r~ REF_R", "pos": [150, 340]}
    o["gain"] = {"type": "live.gain~", "pos": [20, 410],
                 "presentation": [30, 340, 24, 130],
                 "attrs": {"varname": "MASTER_GAIN"}}
    o["gain_lbl"] = comment("master", (60, 412), (62, 340, 90, 18), width=90,
                            color=TXT)
    o["dac"] = {"type": "ezdac~", "pos": [20, 560],
                "presentation": [30, 486, 45, 45]}
    o["dac_lbl"] = comment("click to start audio", (80, 572),
                           (84, 498, 200, 18), width=200, color=TXT)
    o["master_scope"] = {"type": "live.scope~", "pos": [280, 420],
                         "presentation": [300, 366, 320, 164],
                         "attrs": dict(SCOPE_ATTRS, mode=0)}
    o["scope_lbl"] = comment("what is on the master bus (history mode: the bus has no "
                             "single trigger)", (280, 370), (300, 324, 330, 38),
                             width=330, height=38, color=TXT)
    o["panel"] = {"type": "panel", "pos": [20, 660], "size": [120, 28],
                  "presentation": [10, 8, 960, 560],
                  "attrs": {"background": 1, "rounded": 8, "bgcolor": PAGE_BG}}
    c += [["r_l", 0, "gain", 0], ["r_r", 0, "gain", 1],
          ["gain", 0, "dac", 0], ["gain", 1, "dac", 1],
          ["r_l", 0, "master_scope", 0]]

    for i, t in enumerate(tabs):
        o["tab_" + t.key] = {
            "type": "newobj", "text": 'p "%s"' % t.tab_title,
            "pos": [620 + (i // 6) * 260, 400 + (i % 6) * 34],
            "inlets": 0, "outlets": 0, "outlettype": [],
            "attrs": {"comment": "no inlets or outlets — this subpatcher is a tab of the "
                                 "window; it reaches the master output through s~ REF_L / "
                                 "s~ REF_R"},
            "patcher": t.spec(),
        }
    return {"width": 1000, "height": 800, "bglocked": 1,
            "objects": o, "connections": c,
            "patcher_extras": {"showontab": 1, "showrootpatcherontab": 1}}


def build():
    return root_spec([tab_sources(), tab_clip(), tab_math(), tab_lookup(),
                      tab_lofi(), tab_pkg_shapers(), tab_catalog()])


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--out", required=True)
    args = ap.parse_args()
    with open(args.out, "w") as f:
        json.dump(build(), f, indent=1)
    print("wrote", args.out)
