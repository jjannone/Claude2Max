#!/usr/bin/env python3
"""
add_tutorial.py — Add a navigable step-by-step tutorial to a .maxpat file.

Usage:
    python3 add_tutorial.py -i patch.maxpat [-o output.maxpat]

Analyzes the patch data-flow graph and groups objects into functional stages.
Adds a umenu + prev/next buttons + v8 controller at the bottom of the patch.
Writes a companion <patch-name>-tutorial.js alongside the .maxpat.
Each stage highlights its objects (blue bgcolor via thispatcher scripting)
and shows a hidden annotation comment describing what that stage does.
"""

import json
import os
import sys
import argparse
import re
from collections import defaultdict, deque

SPEC_MARKER_BEGIN = "--- CLAUDE2MAX SPEC ---"
SPEC_MARKER_END = "--- END SPEC ---"

OBJ_DESCRIPTIONS = {
    "jit.grab":        "Captures frames from a live camera or video source",
    "jit.world":       "Provides a hidden OpenGL rendering context for Jitter",
    "jit.matrix":      "Stores and processes a matrix of data (adapt 0 = fixed size)",
    "jit.pwindow":     "Displays a Jitter matrix as a video preview window",
    "jit.fpsgui":      "Shows the current processing frame rate",
    "jit.matrixinfo":  "Outputs metadata about an incoming matrix (dims, type, planes)",
    "jit.noise":       "Generates a matrix filled with noise",
    "jit.op":          "Applies a math operator element-wise to one or two matrices",
    "jit.xfade":       "Cross-fades between two Jitter matrices",
    "jit.scissors":    "Splits a matrix into sub-matrices",
    "jit.gl.render":   "Renders OpenGL geometry to a texture",
    "jit.gl.videoplane": "Renders a video texture onto a 3D plane",
    "jit.gl.texture":  "Stores a Jitter matrix as an OpenGL texture",
    "toggle":          "Sends 1 (on) or 0 (off) when clicked — starts/stops loops",
    "bang":            "Triggers an action when clicked",
    "button":          "Sends a bang when clicked",
    "metro":           "Generates repeated bangs at a set interval (ms)",
    "loadbang":        "Sends a bang when the patch loads",
    "loadmess":        "Sends a stored message when the patch loads (initializes defaults)",
    "route":           "Routes messages to separate outlets by first element",
    "select":          "Fires a bang from the matching outlet when input matches",
    "gate":            "Routes input to one of N outlets based on a control value",
    "switch":          "Selects which of N inlets to pass through",
    "vexpr":           "Evaluates a math expression on lists/vectors element-by-element",
    "expr":            "Evaluates a C-style math expression on scalar values",
    "pack":            "Packs individual values into a single output list",
    "unpack":          "Unpacks a list into individual outlet values",
    "trigger":         "Fires a series of typed outputs in right-to-left order",
    "t":               "Fires a series of typed outputs in right-to-left order",
    "flonum":          "Displays and edits a floating-point number",
    "number":          "Displays and edits an integer number",
    "number~":         "Converts between audio signal and number in real time",
    "slider":          "A horizontal or vertical slider control",
    "live.dial":       "A rotary dial knob (Max for Live)",
    "live.slider":     "A slider control (Max for Live)",
    "live.numbox":     "A number box display (Max for Live)",
    "live.gain~":      "A stereo volume fader (Max for Live)",
    "live.tab":        "A tabbed selector (Max for Live)",
    "cycle~":          "Generates a sinusoidal oscillator signal",
    "dac~":            "Sends audio to the default sound output",
    "adc~":            "Receives audio from the default sound input",
    "gain~":           "An audio volume fader",
    "ezdac~":          "A stereo audio output with built-in gain slider",
    "ezadc~":          "A stereo audio input with built-in gain slider",
    "playlist~":       "Plays audio files from a managed playlist",
    "groove~":         "Variable-speed looping sample playback",
    "buffer~":         "Stores audio samples in named memory",
    "sfplay~":         "Plays audio files from disk",
    "record~":         "Records audio into a buffer~",
    "v8":              "Runs JavaScript (V8) — replaces complex multi-object logic chains",
    "js":              "Runs JavaScript (SpiderMonkey engine)",
    "thispatcher":     "Sends scripting/control messages to the current patcher",
    "prepend":         "Prepends a fixed message selector before incoming data",
    "append":          "Appends a fixed value after incoming data",
    "change":          "Passes through values only when they differ from the last",
    "counter":         "Counts bangs up/down between min and max",
    "uzi":             "Fires a rapid series of numbered bangs",
    "delay":           "Delays a message by a specified number of milliseconds",
    "pipe":            "Delays messages in a time-ordered FIFO queue",
    "zl":              "A suite of list manipulation operations",
    "coll":            "Stores and retrieves data by index or symbol key",
    "dict":            "A key-value dictionary for structured data",
    "umenu":           "A drop-down menu — outputs index when item is selected",
    "matrixctrl":      "An interactive grid of on/off buttons",
    "makenote":        "Generates a MIDI note-on followed by a note-off",
    "noteout":         "Sends MIDI note messages to an output port",
    "ctlout":          "Sends MIDI control change messages",
    "midiparse":       "Parses raw MIDI bytes into individual message components",
    "midiformat":      "Assembles raw MIDI bytes from component values",
}


# ---------------------------------------------------------------------------
# Patch I/O
# ---------------------------------------------------------------------------

def load_maxpat(path):
    with open(path) as f:
        return json.load(f)


def extract_spec(maxpat):
    """Return embedded spec dict, or None."""
    for wrap in maxpat["patcher"]["boxes"]:
        box = wrap["box"]
        if box.get("id") == "obj-spec-embed":
            code = box.get("code", "")
            m = re.search(
                re.escape(SPEC_MARKER_BEGIN) + r"\s*(.*?)\s*" + re.escape(SPEC_MARKER_END),
                code, re.DOTALL,
            )
            if m:
                try:
                    return json.loads(m.group(1))
                except json.JSONDecodeError:
                    pass
    return None


# ---------------------------------------------------------------------------
# Graph utilities
# ---------------------------------------------------------------------------

def build_graph(boxes, lines):
    """Return (out_edges, in_edges) as id → [id] dicts."""
    box_ids = {w["box"]["id"] for w in boxes}
    out_edges = defaultdict(list)
    in_edges  = defaultdict(list)
    for wrap in lines:
        pl  = wrap["patchline"]
        src = pl["source"][0]
        dst = pl["destination"][0]
        if src in box_ids and dst in box_ids:
            out_edges[src].append(dst)
            in_edges[dst].append(src)
    return out_edges, in_edges


def topological_order(all_ids, out_edges, in_edges):
    """Kahn's algorithm; appends any remaining ids at end (handles cycles)."""
    in_deg = {oid: len(in_edges[oid]) for oid in all_ids}
    queue  = deque(oid for oid, d in in_deg.items() if d == 0)
    order  = []
    while queue:
        node = queue.popleft()
        order.append(node)
        for nxt in out_edges[node]:
            in_deg[nxt] -= 1
            if in_deg[nxt] == 0:
                queue.append(nxt)
    seen = set(order)
    for oid in all_ids:
        if oid not in seen:
            order.append(oid)
    return order


# ---------------------------------------------------------------------------
# Step generation
# ---------------------------------------------------------------------------

def obj_type(box):
    """Short type string: first token of text for newobj, maxclass otherwise."""
    mc = box.get("maxclass", "")
    if mc == "newobj":
        text = box.get("text", "")
        return text.split()[0] if text else "newobj"
    return mc


def find_nearby_comment(box, all_boxes, dx_max=220, dy_range=(-5, 35)):
    """Return text of the nearest comment to the right or just below a box."""
    bx = box["patching_rect"][0]
    by = box["patching_rect"][1]
    best_text, best_dist = None, dx_max + 1
    for wrap in all_boxes:
        b = wrap["box"]
        if b.get("maxclass") != "comment" or b.get("id", "").startswith("tut-"):
            continue
        cx = b["patching_rect"][0]
        cy = b["patching_rect"][1]
        dx = cx - bx
        dy = cy - by
        if 0 < dx <= dx_max and dy_range[0] <= dy <= dy_range[1]:
            if dx < best_dist:
                best_dist = dx
                best_text = b.get("text", "")
    return best_text


def generate_steps(boxes, lines):
    """
    Return list of {name, description, highlight_ids} dicts.

    Groups non-comment objects by their longest-path depth from any source
    (a "wave" in the data-flow graph), then generates one step per wave
    plus an Overview step at index 0.
    """
    out_edges, in_edges = build_graph(boxes, lines)

    SKIP_CLASSES = {"comment", "text.codebox"}
    SKIP_IDS     = {"obj-spec-embed"}

    sig = [
        w["box"]["id"]
        for w in boxes
        if w["box"].get("maxclass") not in SKIP_CLASSES
        and w["box"]["id"] not in SKIP_IDS
        and not w["box"]["id"].startswith("tut-")
    ]
    sig_set = set(sig)
    by_id = {w["box"]["id"]: w["box"] for w in boxes}

    sig_out = {oid: [n for n in out_edges[oid] if n in sig_set] for oid in sig}
    sig_in  = {oid: [n for n in in_edges[oid]  if n in sig_set] for oid in sig}

    topo = topological_order(sig, sig_out, sig_in)

    # Longest-path depth from any source
    wave = {oid: 0 for oid in sig}
    for oid in topo:
        for nxt in sig_out[oid]:
            if wave[oid] + 1 > wave[nxt]:
                wave[nxt] = wave[oid] + 1

    wave_groups = defaultdict(list)
    for oid in sig:
        wave_groups[wave[oid]].append(oid)

    steps = [{
        "name": "Overview",
        "description": (
            f"This patch has {len(sig)} processing objects across "
            f"{len(wave_groups)} data-flow stages. "
            "Use the umenu or the next button to step through each stage."
        ),
        "highlight_ids": [],
    }]

    for wk in sorted(wave_groups.keys()):
        group = wave_groups[wk]
        descs = []
        for oid in group:
            box   = by_id[oid]
            otype = obj_type(box)
            inline  = find_nearby_comment(box, boxes)
            from_db = OBJ_DESCRIPTIONS.get(otype)
            if inline:
                descs.append(f"{otype} ({inline})")
            elif from_db:
                descs.append(f"{otype}: {from_db}")
            else:
                descs.append(otype)

        types = list(dict.fromkeys(obj_type(by_id[oid]) for oid in group))
        if len(types) == 1:
            name = types[0]
        elif len(types) == 2:
            name = " + ".join(types)
        else:
            name = f"{types[0]} +{len(types) - 1}"

        steps.append({
            "name": name,
            "description": " | ".join(descs),
            "highlight_ids": group,
        })

    return steps


# ---------------------------------------------------------------------------
# JS file writer
# ---------------------------------------------------------------------------

def write_tutorial_js(steps, js_path, all_highlight_ids, annotation_ids, orig_bgcolors):
    """
    Write the v8 JS controller.

    Uses this.patcher.getnamed(id) to manipulate box properties directly —
    no thispatcher connection needed. MaxObj.hidden (0/1) is reliable in all
    Max versions; MaxObj.bgcolor ([r,g,b,a]) works in Max 8+ with v8/js.

    orig_bgcolors: dict of id -> [r,g,b,a] captured before any modification,
    used to restore exact original appearance on reset (step 0).
    """
    steps_json      = json.dumps(
        [{"name": s["name"], "description": s["description"],
          "highlight_ids": s["highlight_ids"]} for s in steps],
        indent=2,
    )
    all_ids_json    = json.dumps(all_highlight_ids)
    ann_ids_json    = json.dumps(annotation_ids)
    orig_colors_json = json.dumps(orig_bgcolors)

    code = f"""\
// Tutorial controller — generated by add_tutorial.py
// No outlet connections required; manipulates patcher objects directly.
//
// Inlet 0: int (step index from umenu), bang (init), "prev" / "next"

inlets  = 1;
outlets = 0;

var STEPS             = {steps_json};
var ALL_HIGHLIGHT_IDS = {all_ids_json};
var ANNOTATION_IDS    = {ann_ids_json};
var ORIG_BGCOLORS     = {orig_colors_json};

// Highlight: translucent blue fill
var HL = [0.15, 0.55, 0.95, 0.4];

var currentStep = -1;

// ---- inlet handlers ----

function bang() {{
    gotoStep(0);
}}

function msg_int(step) {{
    gotoStep(step);
}}

function prev() {{
    gotoStep(Math.max(0, currentStep - 1));
}}

function next() {{
    gotoStep(Math.min(STEPS.length - 1, currentStep + 1));
}}

// ---- core ----

function gotoStep(step) {{
    if (step < 0 || step >= STEPS.length) return;

    var p = this.patcher;

    // Restore all objects to their original bgcolor
    for (var i = 0; i < ALL_HIGHLIGHT_IDS.length; i++) {{
        var id  = ALL_HIGHLIGHT_IDS[i];
        var obj = p.getnamed(id);
        if (obj) obj.bgcolor = ORIG_BGCOLORS[id] || [0, 0, 0, 0];
    }}

    // Hide all annotation comments
    for (var i = 0; i < ANNOTATION_IDS.length; i++) {{
        var obj = p.getnamed(ANNOTATION_IDS[i]);
        if (obj) obj.hidden = 1;
    }}

    currentStep = step;
    var s = STEPS[step];

    // Highlight objects for this stage
    for (var i = 0; i < s.highlight_ids.length; i++) {{
        var obj = p.getnamed(s.highlight_ids[i]);
        if (obj) obj.bgcolor = HL;
    }}

    // Show this step's annotation comment
    var ann = p.getnamed(ANNOTATION_IDS[step]);
    if (ann) ann.hidden = 0;

    post("Tutorial step " + step + ": " + s.name + "\\n");
}}
"""

    with open(js_path, "w") as f:
        f.write(code)


# ---------------------------------------------------------------------------
# Patch modifier
# ---------------------------------------------------------------------------

def compute_ann_pos(group_ids, by_id, patch_width):
    """
    Return [x, y, w, h] for an annotation comment positioned near a group
    of highlighted objects.  Places the comment just below the group's
    bounding box, left-aligned with its leftmost object.
    For the Overview step (empty group), returns a position near the top.
    """
    ann_w = 600.0
    ann_h = 44.0

    if not group_ids:
        return [50.0, 15.0, float(patch_width) - 100.0, ann_h]

    rects = [by_id[oid]["patching_rect"] for oid in group_ids if oid in by_id]
    if not rects:
        return [15.0, 50.0, ann_w, ann_h]

    min_x = min(r[0] for r in rects)
    max_y = max(r[1] + r[3] for r in rects)

    ann_x = max(15.0, min_x)
    ann_y = max_y + 8.0
    actual_w = min(ann_w, float(patch_width) - ann_x - 15.0)
    return [ann_x, ann_y, actual_w, ann_h]


def strip_tutorial(maxpat):
    """Remove any existing tutorial objects/lines (idempotent re-runs)."""
    patcher = maxpat["patcher"]
    patcher["boxes"] = [
        w for w in patcher["boxes"]
        if not w["box"]["id"].startswith("tut-")
    ]
    tut_ids = set()  # none remain; remove any patchlines referencing tut-* ids
    patcher["lines"] = [
        w for w in patcher.get("lines", [])
        if not w["patchline"]["source"][0].startswith("tut-")
        and not w["patchline"]["destination"][0].startswith("tut-")
    ]


def add_tutorial_to_patch(maxpat, steps, annotation_ids, js_filename, content_bottom_y):
    """Append tutorial UI objects and wiring to the patcher (in-place).

    Uses this.patcher.getnamed() in the v8 JS — requires varname to be set
    on every box the JS needs to access (getnamed looks up by varname, not id).
    """
    patcher = maxpat["patcher"]

    # Stamp varname = id on every existing box so getnamed() can find them.
    # varname is the "scripting name" Max uses for patcher.getnamed() lookups.
    SKIP_VARNAME = {"obj-spec-embed"}
    for w in patcher["boxes"]:
        b = w["box"]
        if b["id"] not in SKIP_VARNAME and "varname" not in b:
            b["varname"] = b["id"]

    ui_y   = content_bottom_y + 35   # umenu / nav row
    ctrl_y = ui_y + 32               # v8 row

    # Expand patch height to accommodate tutorial controls
    rect      = list(patcher.get("rect", [100, 100, 950, 720]))
    patch_w   = int(rect[2])
    new_h     = ctrl_y + 32
    patcher["rect"] = [rect[0], rect[1], rect[2], max(rect[3], new_h)]

    # Build by_id for position lookups (after strip, before adding new boxes)
    by_id = {w["box"]["id"]: w["box"] for w in patcher["boxes"]}

    # umenu items: flat token array, items separated by ","
    items = []
    for i, step in enumerate(steps):
        items.extend(step["name"].split())
        if i < len(steps) - 1:
            items.append(",")

    new_boxes = [
        # "Tutorial:" label
        {"box": {
            "id": "tut-label", "maxclass": "comment",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [15.0, float(ui_y), 75.0, 22.0],
            "text": "Tutorial:", "fontface": 1,
        }},
        # umenu listing step names
        {"box": {
            "id": "tut-umenu", "maxclass": "umenu",
            "numinlets": 1, "numoutlets": 3, "outlettype": ["int", "", ""],
            "patching_rect": [95.0, float(ui_y), 320.0, 22.0],
            "items": items,
        }},
        # prev button
        {"box": {
            "id": "tut-prev", "maxclass": "message",
            "numinlets": 2, "numoutlets": 1, "outlettype": [""],
            "patching_rect": [425.0, float(ui_y), 30.0, 22.0],
            "text": "prev",
        }},
        # next button
        {"box": {
            "id": "tut-next", "maxclass": "message",
            "numinlets": 2, "numoutlets": 1, "outlettype": [""],
            "patching_rect": [465.0, float(ui_y), 30.0, 22.0],
            "text": "next",
        }},
        # loadbang — initializes tutorial to step 0 on patch open
        {"box": {
            "id": "tut-loadbang", "maxclass": "newobj",
            "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"],
            "patching_rect": [505.0, float(ui_y), 70.0, 22.0],
            "text": "loadbang",
        }},
        # v8 tutorial controller (no outlet — uses this.patcher API internally)
        {"box": {
            "id": "tut-v8", "maxclass": "newobj",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [15.0, float(ctrl_y), 200.0, 22.0],
            "text": f"v8 {js_filename}",
        }},
    ]

    # One hidden annotation comment per step, positioned near its highlighted group
    for i, (step, ann_id) in enumerate(zip(steps, annotation_ids)):
        text = f"Step {i} \u2014 {step['name']}: {step['description']}"
        ax, ay, aw, ah = compute_ann_pos(step["highlight_ids"], by_id, patch_w)
        new_boxes.append({"box": {
            "id": ann_id, "varname": ann_id, "maxclass": "comment",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [ax, ay, aw, ah],
            "text": text,
            "hidden": 1,
            "bgcolor": [0.94, 0.97, 0.75, 1.0],
            "textcolor": [0.0, 0.0, 0.0, 1.0],
            "fontsize": 11.0,
        }})

    new_lines = [
        {"patchline": {"source": ["tut-umenu",    0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-prev",     0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-next",     0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-loadbang", 0], "destination": ["tut-v8", 0]}},
    ]

    patcher["boxes"].extend(new_boxes)
    patcher["lines"].extend(new_lines)


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="Add a navigable step-by-step tutorial to a .maxpat file"
    )
    ap.add_argument("-i", "--input",  required=True, help="Input .maxpat")
    ap.add_argument("-o", "--output", help="Output .maxpat (default: overwrite input)")
    args = ap.parse_args()

    in_path  = os.path.abspath(args.input)
    out_path = os.path.abspath(args.output) if args.output else in_path

    maxpat  = load_maxpat(in_path)
    patcher = maxpat["patcher"]
    boxes   = patcher["boxes"]
    lines   = patcher.get("lines", [])

    steps          = generate_steps(boxes, lines)
    annotation_ids = [f"tut-ann-{i}" for i in range(len(steps))]

    SKIP_IDS     = {"obj-spec-embed"}
    SKIP_CLASSES = {"comment", "text.codebox"}
    all_highlight_ids = [
        w["box"]["id"]
        for w in boxes
        if w["box"].get("maxclass") not in SKIP_CLASSES
        and w["box"]["id"] not in SKIP_IDS
        and not w["box"]["id"].startswith("tut-")
    ]

    # Capture original bgcolors before any modification so the JS can restore them
    orig_bgcolors = {
        w["box"]["id"]: w["box"].get("bgcolor", [0, 0, 0, 0])
        for w in boxes
        if w["box"]["id"] in set(all_highlight_ids)
    }

    out_dir   = os.path.dirname(out_path)
    base_name = os.path.splitext(os.path.basename(in_path))[0]
    js_name   = f"{base_name}-tutorial.js"
    js_path   = os.path.join(out_dir, js_name)

    write_tutorial_js(steps, js_path, all_highlight_ids, annotation_ids, orig_bgcolors)

    # Strip any existing tutorial objects before re-adding
    strip_tutorial(maxpat)

    # Content bottom: max y+h, excluding hidden spec embed and existing tutorial objects
    SKIP_IDS = {"obj-spec-embed"}
    content_bottom_y = max(
        w["box"]["patching_rect"][1] + w["box"]["patching_rect"][3]
        for w in boxes
        if w["box"]["id"] not in SKIP_IDS
        and not w["box"]["id"].startswith("tut-")
    )

    add_tutorial_to_patch(maxpat, steps, annotation_ids, js_name, content_bottom_y)

    with open(out_path, "w") as f:
        json.dump(maxpat, f, indent=2)

    print(f"Tutorial added: {len(steps)} steps", file=sys.stderr)
    print(f"JS:    {js_path}", file=sys.stderr)
    print(f"Patch: {out_path}", file=sys.stderr)
    for i, s in enumerate(steps):
        ids_str = ", ".join(s["highlight_ids"]) if s["highlight_ids"] else "—"
        print(f"  {i:2d}: {s['name']:<30s} [{ids_str}]", file=sys.stderr)


if __name__ == "__main__":
    main()
