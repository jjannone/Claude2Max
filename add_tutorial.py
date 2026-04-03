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
from textwrap import dedent

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


def spatial_clusters(ids, by_id, max_gap=100.0, max_x_gap=250.0):
    """Split a list of object ids into spatially close clusters.

    Uses simple agglomerative clustering: each object joins the nearest
    existing cluster if within max_gap vertically AND max_x_gap horizontally
    (measured center-to-center of cluster bounding box).  Otherwise starts
    a new cluster.  Objects are processed top-to-bottom.
    """
    if not ids:
        return []
    sorted_ids = sorted(ids, key=lambda oid: by_id[oid]["patching_rect"][1])

    clusters = [[sorted_ids[0]]]
    def cluster_center(cl):
        xs = [by_id[o]["patching_rect"][0] + by_id[o]["patching_rect"][2] / 2.0 for o in cl]
        ys = [by_id[o]["patching_rect"][1] + by_id[o]["patching_rect"][3] / 2.0 for o in cl]
        return sum(xs) / len(xs), sum(ys) / len(ys)

    for oid in sorted_ids[1:]:
        ox = by_id[oid]["patching_rect"][0] + by_id[oid]["patching_rect"][2] / 2.0
        oy = by_id[oid]["patching_rect"][1] + by_id[oid]["patching_rect"][3] / 2.0
        best_cl = None
        best_dist = float("inf")
        for ci, cl in enumerate(clusters):
            cx, cy = cluster_center(cl)
            dy = abs(oy - cy)
            dx = abs(ox - cx)
            if dy <= max_gap and dx <= max_x_gap:
                dist = (dx**2 + dy**2) ** 0.5
                if dist < best_dist:
                    best_dist = dist
                    best_cl = ci
        if best_cl is not None:
            clusters[best_cl].append(oid)
        else:
            clusters.append([oid])
    return clusters


def should_merge(step_a, step_b, by_id, out_edges, max_dist=180.0):
    """Return True if two small, connected, spatially close steps should merge."""
    combined = len(step_a) + len(step_b)
    if combined > 4:
        return False
    # Also check that merged bounding box doesn't get too large
    all_ids = step_a + step_b
    bounds = group_bounds(all_ids, {oid: by_id[oid] for oid in all_ids if oid in by_id})
    if bounds:
        span_x = bounds[2] - bounds[0]
        span_y = bounds[3] - bounds[1]
        if span_x > 400.0 or span_y > 250.0:
            return False
    # Must have at least one direct connection between them
    b_set = set(step_b)
    a_set = set(step_a)
    connected = False
    for oid in step_a:
        for nid in out_edges.get(oid, []):
            if nid in b_set:
                connected = True
                break
        if connected:
            break
    if not connected:
        # Also check reverse direction (b → a)
        for oid in step_b:
            for nid in out_edges.get(oid, []):
                if nid in a_set:
                    connected = True
                    break
            if connected:
                break
    if not connected:
        return False
    # Check spatial proximity: Euclidean distance between closest pair
    def box_center(oid):
        r = by_id[oid]["patching_rect"]
        return r[0] + r[2] / 2.0, r[1] + r[3] / 2.0
    min_dist = min(
        ((box_center(a)[0] - box_center(b)[0])**2 +
         (box_center(a)[1] - box_center(b)[1])**2) ** 0.5
        for a in step_a for b in step_b
    )
    return min_dist <= max_dist


def build_step_description(group, by_id, boxes):
    """Build name and description for a group of object ids."""
    parts = []
    seen_inline = set()
    for oid in group:
        box     = by_id[oid]
        otype   = obj_type(box)
        inline  = find_nearby_comment(box, boxes)
        from_db = OBJ_DESCRIPTIONS.get(otype)
        if inline and inline not in seen_inline:
            seen_inline.add(inline)
            parts.append(f"{otype}: {inline}")
        elif from_db:
            parts.append(f"{otype} — {from_db}")
        else:
            parts.append(otype)

    description = ". ".join(parts)
    if description and not description.endswith("."):
        description += "."

    types = list(dict.fromkeys(obj_type(by_id[oid]) for oid in group))
    if len(types) == 1:
        name = types[0]
    elif len(types) == 2:
        name = " + ".join(types)
    else:
        name = f"{types[0]} +{len(types) - 1}"

    return name, description


# ---------------------------------------------------------------------------
# AI-enhanced descriptions (Claude API)
# ---------------------------------------------------------------------------

def build_patch_summary(steps, by_id, boxes, lines):
    """Build a compact text summary of the patch for the AI prompt."""
    parts = []

    # List all significant objects
    parts.append("## Objects")
    for w in boxes:
        b = w["box"]
        if (b.get("maxclass") in ("comment", "text.codebox")
                or b["id"].startswith("tut-") or b["id"] == "obj-spec-embed"):
            continue
        mc = b.get("maxclass", "")
        text = b.get("text", "")
        r = b.get("patching_rect", [0, 0, 0, 0])
        label = text if mc == "newobj" else (f"[{mc}] {text}" if text else f"[{mc}]")
        parts.append(f"  {b['id']}: {label}  (pos {r[0]:.0f},{r[1]:.0f})")

    # List connections
    parts.append("\n## Connections (source:outlet -> dest:inlet)")
    for w in lines:
        pl = w["patchline"]
        src, dst = pl["source"], pl["destination"]
        if src[0].startswith("tut-") or dst[0].startswith("tut-"):
            continue
        parts.append(f"  {src[0]}:{src[1]} -> {dst[0]}:{dst[1]}")

    # List nearby comments (patch author's own labels)
    parts.append("\n## Inline comments (author labels near objects)")
    for w in boxes:
        b = w["box"]
        if b.get("maxclass") != "comment" or b["id"].startswith("tut-"):
            continue
        r = b.get("patching_rect", [0, 0, 0, 0])
        parts.append(f"  \"{b.get('text', '')}\"  (pos {r[0]:.0f},{r[1]:.0f})")

    # List step groupings
    parts.append("\n## Tutorial step groupings (step 0 = overview)")
    for i, step in enumerate(steps):
        ids = step["highlight_ids"]
        obj_labels = []
        for oid in ids:
            if oid in by_id:
                b = by_id[oid]
                mc = b.get("maxclass", "")
                text = b.get("text", "")
                obj_labels.append(text if mc == "newobj" else f"[{mc}] {text}".strip())
        parts.append(f"  Step {i}: {', '.join(obj_labels) if obj_labels else '(overview)'}")

    return "\n".join(parts)


AI_PROMPT = dedent("""\
You are writing tutorial annotations for a Max/MSP patch. The audience is students
who are new to Max. Each step highlights a group of connected objects.

Given the patch summary below, return a JSON array with one object per step (including
step 0 = overview). Each object has:
- "name": short label for the umenu (max 4 words, no punctuation)
- "description": 1-3 sentences explaining what this group DOES in the context of the
  whole patch. Don't just list object names — explain the purpose, the data flow, and
  why it matters. Use plain language a student would understand.
- "placement": where to put the annotation relative to the highlighted objects.
  One of "right", "left", "above", "below". Pick the side with the most open space
  based on the object positions. Default to "right" unless objects are far right.

PATCH SUMMARY:
{summary}

Return ONLY valid JSON — no markdown fences, no commentary.
""")


def ai_enhance_steps(steps, by_id, boxes, lines):
    """Call Claude API to generate better step names, descriptions, and placement hints.

    Returns the steps list with updated name/description fields and a new
    'ai_placement' field, or the original steps if the API call fails.
    """
    try:
        import anthropic
    except ImportError:
        print("WARNING: anthropic package not installed, using static descriptions",
              file=sys.stderr)
        return steps

    api_key = os.environ.get("ANTHROPIC_API_KEY")
    if not api_key:
        print("WARNING: ANTHROPIC_API_KEY not set, using static descriptions",
              file=sys.stderr)
        return steps

    summary = build_patch_summary(steps, by_id, boxes, lines)
    prompt = AI_PROMPT.format(summary=summary)

    try:
        client = anthropic.Anthropic(api_key=api_key)
        response = client.messages.create(
            model="claude-haiku-4-5-20251001",
            max_tokens=2048,
            messages=[{"role": "user", "content": prompt}],
        )
        text = response.content[0].text.strip()
        # Strip markdown fences if present
        if text.startswith("```"):
            text = re.sub(r"^```\w*\n?", "", text)
            text = re.sub(r"\n?```$", "", text)
        ai_steps = json.loads(text)
    except Exception as e:
        print(f"WARNING: AI enhancement failed ({e}), using static descriptions",
              file=sys.stderr)
        return steps

    if not isinstance(ai_steps, list) or len(ai_steps) != len(steps):
        print(f"WARNING: AI returned {len(ai_steps) if isinstance(ai_steps, list) else 'non-list'} "
              f"steps, expected {len(steps)}. Using static descriptions.", file=sys.stderr)
        return steps

    PLACEMENT_MAP = {"right": 0, "above": 1, "left": 2, "below": 3}
    for i, ai in enumerate(ai_steps):
        if isinstance(ai, dict):
            if "name" in ai:
                steps[i]["name"] = ai["name"]
            if "description" in ai:
                steps[i]["description"] = ai["description"]
            placement = ai.get("placement", "right")
            steps[i]["ai_placement"] = PLACEMENT_MAP.get(placement, 0)

    return steps


def generate_steps(boxes, lines):
    """
    Return list of {name, description, highlight_ids} dicts.

    Groups non-comment objects by longest-path wave depth, then:
      1. Splits waves whose objects are spatially distant into separate steps
      2. Merges small consecutive steps that are connected and spatially close
    Produces an Overview step at index 0.
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

    # Phase 1: split spatially distant objects within each wave
    raw_steps = []
    for wk in sorted(wave_groups.keys()):
        clusters = spatial_clusters(wave_groups[wk], by_id)
        raw_steps.extend(clusters)

    # Phase 2: merge small, connected, spatially close steps (any pair, not just consecutive)
    # Run multiple passes until stable
    merged = list(raw_steps)
    changed = True
    while changed:
        changed = False
        i = 0
        while i < len(merged):
            j = i + 1
            while j < len(merged):
                if should_merge(merged[i], merged[j], by_id, sig_out):
                    merged[i] = merged[i] + merged[j]
                    merged.pop(j)
                    changed = True
                else:
                    j += 1
            i += 1

    # Coverage check
    covered = set()
    for step in merged:
        covered.update(step)
    missing = sig_set - covered
    if missing:
        print(f"WARNING: {len(missing)} objects not in any step: {missing}",
              file=sys.stderr)

    # Build final steps with overview
    steps = [{
        "name": "Overview",
        "description": (
            f"This patch has {len(sig)} processing objects across "
            f"{len(merged)} stages. "
            "Use the menu or prev/next to step through each stage."
        ),
        "highlight_ids": [],
    }]

    for group in merged:
        name, description = build_step_description(group, by_id, boxes)
        steps.append({
            "name": name,
            "description": description,
            "highlight_ids": group,
        })

    return steps


# ---------------------------------------------------------------------------
# JS file writer
# ---------------------------------------------------------------------------

def write_tutorial_js(steps, js_path, annotation_ids, panel_ids):
    """
    Write the v8 JS controller.

    Highlighting is done via a panel object (not per-object bgcolor changes).
    show/hide is via MaxObj.hidden on objects found by varname via getnamed().
    """
    steps_json   = json.dumps(
        [{"name": s["name"], "description": s["description"]} for s in steps],
        indent=2,
    )
    ann_ids_json   = json.dumps(annotation_ids)
    panel_ids_json = json.dumps(panel_ids)

    code = f"""\
// Tutorial controller — generated by add_tutorial.py
// No outlet connections required; manipulates patcher objects directly.
//
// Inlet 0: int (step index from umenu), bang (init), "prev" / "next"

inlets  = 1;
outlets = 0;

var STEPS         = {steps_json};
var ANNOTATION_IDS = {ann_ids_json};
var PANEL_IDS      = {panel_ids_json};

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

    // Hide all panels and annotation comments
    for (var i = 0; i < PANEL_IDS.length; i++) {{
        var obj = p.getnamed(PANEL_IDS[i]);
        if (obj) obj.hidden = 1;
    }}
    for (var i = 0; i < ANNOTATION_IDS.length; i++) {{
        var obj = p.getnamed(ANNOTATION_IDS[i]);
        if (obj) obj.hidden = 1;
    }}

    currentStep = step;

    // Show this step's panel and annotation
    var panel = p.getnamed(PANEL_IDS[step]);
    if (panel) panel.hidden = 0;

    var ann = p.getnamed(ANNOTATION_IDS[step]);
    if (ann) ann.hidden = 0;

    post("Tutorial step " + step + ": " + STEPS[step].name + "\\n");
}}
"""

    with open(js_path, "w") as f:
        f.write(code)


# ---------------------------------------------------------------------------
# Patch modifier
# ---------------------------------------------------------------------------

def group_bounds(group_ids, by_id):
    """Return (min_x, min_y, max_x, max_y) of a set of boxes, or None."""
    rects = [by_id[oid]["patching_rect"] for oid in group_ids if oid in by_id]
    if not rects:
        return None
    return (
        min(r[0] for r in rects),
        min(r[1] for r in rects),
        max(r[0] + r[2] for r in rects),
        max(r[1] + r[3] for r in rects),
    )


def compute_panel_rect(group_ids, by_id, padding=12):
    """Return [x, y, w, h] panel rect bounding the group + padding, or None."""
    bounds = group_bounds(group_ids, by_id)
    if not bounds:
        return None
    min_x, min_y, max_x, max_y = bounds
    return [min_x - padding, min_y - padding,
            max_x - min_x + 2 * padding, max_y - min_y + 2 * padding]


def compute_bubbleside(ann_x, ann_y, group_cx, group_cy):
    """Return bubbleside int: arrow on the side of the comment nearest the group.

    Max @bubbleside values: 0=top, 1=left, 2=bottom, 3=right.
    The arrow appears on that side, pointing outward toward the group.
    """
    dx = group_cx - ann_x
    dy = group_cy - ann_y
    if abs(dx) >= abs(dy):
        return 1 if dx < 0 else 3   # group left → arrow left(1); group right → arrow right(3)
    else:
        return 0 if dy < 0 else 2   # group above → arrow top(0); group below → arrow bottom(2)


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


def add_tutorial_to_patch(maxpat, steps, annotation_ids, panel_ids, js_filename):
    """Append tutorial UI objects and wiring to the patcher (in-place).

    Layout:
      - Tutorial nav bar (label + umenu + prev/next + v8) at top-right of patch
      - One panel per step: background highlight behind the described objects
      - One annotation comment per step: to the right (or above) with bubble arrow
    """
    patcher = maxpat["patcher"]

    # Stamp varname = id on every existing box so getnamed() can find them.
    SKIP_VARNAME = {"obj-spec-embed"}
    for w in patcher["boxes"]:
        b = w["box"]
        if b["id"] not in SKIP_VARNAME and "varname" not in b:
            b["varname"] = b["id"]

    rect    = list(patcher.get("rect", [100, 100, 950, 720]))
    patch_w = int(rect[2])

    # Build by_id for position lookups (after strip, before adding new boxes)
    by_id = {w["box"]["id"]: w["box"] for w in patcher["boxes"]}

    # --- Nav bar: top-right corner ---
    nav_x = float(patch_w) - 390.0   # right-aligned, 390px wide block
    nav_y = 5.0

    # umenu items: flat token array, items separated by ","
    items = []
    for i, step in enumerate(steps):
        items.extend(step["name"].split())
        if i < len(steps) - 1:
            items.append(",")

    new_boxes = [
        {"box": {
            "id": "tut-label", "maxclass": "comment",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [nav_x, nav_y, 65.0, 22.0],
            "text": "Tutorial:", "fontface": 1,
        }},
        {"box": {
            "id": "tut-umenu", "maxclass": "umenu",
            "numinlets": 1, "numoutlets": 3, "outlettype": ["int", "", ""],
            "patching_rect": [nav_x + 68.0, nav_y, 200.0, 22.0],
            "items": items,
        }},
        {"box": {
            "id": "tut-prev", "maxclass": "message",
            "numinlets": 2, "numoutlets": 1, "outlettype": [""],
            "patching_rect": [nav_x + 274.0, nav_y, 30.0, 22.0],
            "text": "prev",
        }},
        {"box": {
            "id": "tut-next", "maxclass": "message",
            "numinlets": 2, "numoutlets": 1, "outlettype": [""],
            "patching_rect": [nav_x + 310.0, nav_y, 30.0, 22.0],
            "text": "next",
        }},
        {"box": {
            "id": "tut-loadbang", "maxclass": "newobj",
            "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"],
            "patching_rect": [nav_x + 346.0, nav_y, 44.0, 22.0],
            "text": "loadbang",
        }},
        {"box": {
            "id": "tut-v8", "maxclass": "newobj",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [nav_x, nav_y + 27.0, 240.0, 22.0],
            "text": f"v8 {js_filename}",
        }},
    ]

    # Panels: one per step, hidden, background layer, locked
    panel_boxes = []
    for i, (step, panel_id) in enumerate(zip(steps, panel_ids)):
        prect = compute_panel_rect(step["highlight_ids"], by_id)
        if prect is None:
            prect = [0.0, 0.0, 0.0, 0.0]   # invisible placeholder for overview
        panel_boxes.append({"box": {
            "id": panel_id, "varname": panel_id, "maxclass": "panel",
            "numinlets": 1, "numoutlets": 0, "outlettype": [],
            "patching_rect": [float(v) for v in prect],
            "bgcolor": [0.15, 0.55, 0.95, 0.15],
            "bordercolor": [0.1, 0.4, 0.85, 0.75],
            "border": 2,
            "rounded": 8,
            "background": 1,
            "locked_bgcolor": 1,
            "hidden": 1,
        }})

    # --- Compute annotation placement ---
    # Place each annotation adjacent to its panel, with the bubble arrow
    # pointing toward the highlighted group.  Overview goes below the nav bar.
    #
    # Max @bubbleside values: 0=top, 1=left, 2=bottom, 3=right
    # The arrow appears on that side of the comment, pointing outward.
    # So for a comment to the RIGHT of a group, arrow on LEFT → bubbleside=1.
    BUBBLE_TOP    = 0
    BUBBLE_LEFT   = 1
    BUBBLE_BOTTOM = 2
    BUBBLE_RIGHT  = 3

    ann_w    = 220.0
    ann_gap  = 15.0   # gap between panel edge and annotation

    # Estimate comment height helper
    def est_comment_height(text, width=ann_w, fontsize=11.0):
        chars_per_line = max(1, int(width / (fontsize * 0.55)))
        lines = max(2, sum(
            max(1, (len(line) + chars_per_line - 1) // chars_per_line)
            for line in text.splitlines()
        ))
        return float(lines * 18 + 14)

    # Find the rightmost extent of all patch objects (not comments/tutorial/embed)
    SKIP_FOR_BOUNDS = {"comment", "text.codebox"}
    rightmost_x = 0.0
    for w in patcher["boxes"]:
        b = w["box"]
        if (b.get("maxclass") in SKIP_FOR_BOUNDS
                or b["id"].startswith("tut-")
                or b["id"] == "obj-spec-embed"):
            continue
        r = b.get("patching_rect", [0, 0, 0, 0])
        rightmost_x = max(rightmost_x, r[0] + r[2])

    ann_boxes = []
    for i, (step, ann_id, panel_id) in enumerate(zip(steps, annotation_ids, panel_ids)):
        full_text = f"{step['name']}\n{step['description']}"
        ann_h = est_comment_height(full_text)

        if not step["highlight_ids"]:
            # Overview: place below nav bar
            ax = nav_x
            ay = nav_y + 55.0
            bubbleside = BUBBLE_TOP
        else:
            bounds = group_bounds(step["highlight_ids"], by_id)
            if bounds:
                panel_left  = bounds[0] - 12
                panel_right = bounds[2] + 12
                panel_top   = bounds[1] - 12
                panel_bot   = bounds[3] + 12
                group_cx    = (bounds[0] + bounds[2]) / 2.0
                group_cy    = (bounds[1] + bounds[3]) / 2.0

                # AI placement hint (from --steps-json or --ai)
                # 0=right, 1=above, 2=left, 3=below
                ai_side = step.get("ai_placement")

                if ai_side == 1:  # above
                    ax = max(5.0, group_cx - ann_w / 2.0)
                    ay = panel_top - ann_gap - ann_h
                    bubbleside = BUBBLE_BOTTOM  # arrow on bottom, pointing down to group
                elif ai_side == 2:  # left
                    ax = panel_left - ann_gap - ann_w
                    ay = max(5.0, group_cy - ann_h / 2.0)
                    bubbleside = BUBBLE_RIGHT  # arrow on right, pointing right to group
                elif ai_side == 3:  # below
                    ax = max(5.0, group_cx - ann_w / 2.0)
                    ay = panel_bot + ann_gap
                    bubbleside = BUBBLE_TOP  # arrow on top, pointing up to group
                else:  # right (default, ai_side == 0 or None)
                    ax = panel_right + ann_gap
                    ay = max(5.0, group_cy - ann_h / 2.0)
                    bubbleside = BUBBLE_LEFT  # arrow on left, pointing left to group

                # Safety: push back on-screen if annotation went off-edge
                if ax < 5.0:
                    ax = panel_right + ann_gap
                    bubbleside = BUBBLE_LEFT
                if ay < 5.0:
                    ay = panel_bot + ann_gap
                    bubbleside = BUBBLE_TOP
            else:
                ax = rightmost_x + 30.0
                ay = 40.0
                bubbleside = BUBBLE_LEFT

        ann_boxes.append({"box": {
            "id": ann_id, "varname": ann_id, "maxclass": "comment",
            "numinlets": 1, "numoutlets": 0,
            "patching_rect": [ax, ay, ann_w, ann_h],
            "text": full_text,
            "hidden": 1,
            "bubble": 1,
            "bubbleside": bubbleside,
            "bubble_bgcolor": [1.0, 0.98, 0.72, 1.0],
            "textcolor": [0.0, 0.0, 0.0, 1.0],
            "fontsize": 11.0,
        }})

    # Ensure patch is wide enough for annotations
    max_ann_right = max((b["box"]["patching_rect"][0] + b["box"]["patching_rect"][2]
                         for b in ann_boxes), default=0.0)
    new_patch_w = max(float(patch_w), max_ann_right + 30.0)
    rect[2] = new_patch_w
    patcher["rect"] = rect

    new_lines = [
        {"patchline": {"source": ["tut-umenu",    0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-prev",     0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-next",     0], "destination": ["tut-v8", 0]}},
        {"patchline": {"source": ["tut-loadbang", 0], "destination": ["tut-v8", 0]}},
    ]

    # Z-order in Max: FIRST in array = on top (painted in front).
    # Annotations first (on top), then original boxes + nav, then panels last (behind).
    patcher["boxes"] = ann_boxes + patcher["boxes"] + new_boxes + panel_boxes
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
    ap.add_argument("--ai", action="store_true",
                    help="Use Claude API (requires ANTHROPIC_API_KEY) to generate descriptions")
    ap.add_argument("--analyze", action="store_true",
                    help="Output step groupings as JSON to stdout (no patch modification)")
    ap.add_argument("--steps-json",
                    help="JSON file with enhanced step descriptions (from Claude Code or --analyze)")
    args = ap.parse_args()

    in_path  = os.path.abspath(args.input)
    out_path = os.path.abspath(args.output) if args.output else in_path

    maxpat  = load_maxpat(in_path)

    # Strip any existing tutorial objects FIRST so they don't affect step generation
    strip_tutorial(maxpat)

    patcher = maxpat["patcher"]
    boxes   = patcher["boxes"]
    lines   = patcher.get("lines", [])

    steps  = generate_steps(boxes, lines)
    by_id  = {w["box"]["id"]: w["box"] for w in boxes}

    # --analyze: output step data + patch summary for Claude Code to enhance
    if args.analyze:
        analysis = {
            "patch_summary": build_patch_summary(steps, by_id, boxes, lines),
            "steps": [
                {
                    "step": i,
                    "name": s["name"],
                    "description": s["description"],
                    "highlight_ids": s["highlight_ids"],
                    "objects": [
                        {
                            "id": oid,
                            "type": obj_type(by_id[oid]),
                            "text": by_id[oid].get("text", ""),
                            "pos": by_id[oid].get("patching_rect", [])[:2],
                        }
                        for oid in s["highlight_ids"] if oid in by_id
                    ],
                }
                for i, s in enumerate(steps)
            ],
        }
        json.dump(analysis, sys.stdout, indent=2)
        print(file=sys.stdout)
        return

    # --steps-json: load enhanced descriptions from file
    if args.steps_json:
        steps_path = os.path.abspath(args.steps_json)
        with open(steps_path) as f:
            enhanced = json.load(f)
        if isinstance(enhanced, list) and len(enhanced) == len(steps):
            PLACEMENT_MAP = {"right": 0, "above": 1, "left": 2, "below": 3}
            for i, ai in enumerate(enhanced):
                if isinstance(ai, dict):
                    if "name" in ai:
                        steps[i]["name"] = ai["name"]
                    if "description" in ai:
                        steps[i]["description"] = ai["description"]
                    placement = ai.get("placement", "right")
                    steps[i]["ai_placement"] = PLACEMENT_MAP.get(placement, 0)
            print(f"Loaded {len(enhanced)} enhanced step descriptions", file=sys.stderr)
        else:
            print(f"WARNING: steps JSON has {len(enhanced) if isinstance(enhanced, list) else 'invalid'} "
                  f"entries, expected {len(steps)}. Using static descriptions.", file=sys.stderr)

    # --ai: call Claude API for descriptions
    elif args.ai:
        steps = ai_enhance_steps(steps, by_id, boxes, lines)

    annotation_ids = [f"tut-ann-{i}"   for i in range(len(steps))]
    panel_ids      = [f"tut-panel-{i}" for i in range(len(steps))]

    out_dir   = os.path.dirname(out_path)
    base_name = os.path.splitext(os.path.basename(in_path))[0]
    js_name   = f"{base_name}-tutorial.js"
    js_path   = os.path.join(out_dir, js_name)

    write_tutorial_js(steps, js_path, annotation_ids, panel_ids)

    add_tutorial_to_patch(maxpat, steps, annotation_ids, panel_ids, js_name)

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
