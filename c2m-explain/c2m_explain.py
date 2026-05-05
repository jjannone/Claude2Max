#!/usr/bin/env python3
"""
c2m_explain.py — Generate a plain-English walkthrough of a Max patch.

Walks a .maxpat in stage order (signal/data flow), naming the objects in each
functional unit and describing what the unit does. Reuses Claude2Max's
existing infrastructure:

  - add_tutorial.generate_steps() for spatial+wave clustering
  - spec2maxpat.REFPAGE_CACHE for Cycling '74 refpage digests
  - packages/package_objects.json for installed-package objects

Usage:
    python3 c2m_explain.py <patch.maxpat>          # walkthrough (default)
    python3 c2m_explain.py <patch.maxpat> --summary

The script is read-only: it never mutates the .maxpat. If the patch has no
embedded spec, analysis runs directly against boxes + lines.
"""

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

# This script lives in c2m-explain/, but imports `add_tutorial` and
# `spec2maxpat` which live at the repo root. Make those importable
# regardless of cwd.
_REPO_ROOT = Path(__file__).resolve().parent.parent
if str(_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPO_ROOT))

import add_tutorial            # generate_steps, find_nearby_comment, describe_object
import spec2maxpat as s2m      # REFPAGE_CACHE (used indirectly via add_tutorial)


# Pattern matching the v8 tutorial controller emitted by add_tutorial.py
_TUTORIAL_V8_RE = re.compile(r"^v8\s+(\S+-tutorial\.js)\s*$")
# Pattern matching the STEPS array literal inside that JS file
_TUTORIAL_STEPS_RE = re.compile(r"var\s+STEPS\s*=\s*(\[.*?\]);", re.DOTALL)


def _extract_embedded_tutorial(maxpat_path, boxes):
    """If the patch has an embedded tutorial, return its STEPS list.

    The tutorial controller is a `v8 <name>-tutorial.js` box at the top of
    the patch; the JS file sits alongside the .maxpat. The controller writes
    `var STEPS = [{name, description}, ...]` near the top of the file.
    Returns the parsed list (overview at index 0), or None on any failure.
    """
    js_filename = None
    for w in boxes:
        b = w["box"]
        if b.get("maxclass") != "newobj":
            continue
        m = _TUTORIAL_V8_RE.match(b.get("text", "") or "")
        if m:
            js_filename = m.group(1)
            break
    if js_filename is None:
        return None
    js_path = maxpat_path.parent / js_filename
    if not js_path.exists():
        return None
    try:
        src = js_path.read_text()
        m = _TUTORIAL_STEPS_RE.search(src)
        if not m:
            return None
        steps = json.loads(m.group(1))
    except (OSError, json.JSONDecodeError):
        return None
    if not isinstance(steps, list):
        return None
    return steps


# Decoration-only objects: real objects in the patch but not part of signal/data
# flow worth describing. Filtered out of the per-stage object list (and absorbed
# into a footnote count on the parent stage if any are present).
DECORATION_CLASSES = {"panel", "fpic"}

# Re-exported from add_tutorial for backward compatibility within this module
# (callers used to use c2m_explain.package_lookup / c2m_explain.REFPAGE_ALIAS).
package_lookup = add_tutorial.package_lookup
REFPAGE_ALIAS  = add_tutorial.REFPAGE_ALIAS


# ---------------------------------------------------------------------------
# Box helpers
# ---------------------------------------------------------------------------

def obj_text(box):
    """Display string — the text exactly as it appears in Max."""
    if box.get("maxclass") == "newobj":
        return box.get("text", "newobj")
    text = box.get("text", "")
    # message / textbutton / etc: text IS the meaningful content
    # toggle / jit.fpsgui / jit.pwindow / etc: maxclass is the only label
    return text if text else box.get("maxclass", "?")


def obj_name(box):
    """Object name used for refpage/package lookup."""
    if box.get("maxclass") == "newobj":
        text = box.get("text", "")
        return text.split()[0] if text else "newobj"
    return box.get("maxclass", "")


def is_significant(box):
    """Same skip rules as add_tutorial.generate_steps."""
    if box.get("maxclass") in ("comment", "text.codebox"):
        return False
    bid = box.get("id", "")
    if bid.startswith("tut-") or bid == "obj-spec-embed":
        return False
    return True


# Wrapper around add_tutorial.describe_object that overrides the display text
# with c2m_explain's own obj_text formatting (bracketless for non-newobj).
def describe_object(box):
    """Return (display_text, description, source-tag) — see add_tutorial.describe_object."""
    _text, desc, source = add_tutorial.describe_object(box)
    return obj_text(box), desc, source


# ---------------------------------------------------------------------------
# Stage-level analysis
# ---------------------------------------------------------------------------

def _stage_index(steps):
    """Return {box_id: stage_index} for every assigned object."""
    out = {}
    for i, step in enumerate(steps):
        for oid in step["highlight_ids"]:
            out[oid] = i
    return out


def _stage_io(steps, lines, by_id, stage_of):
    """Return per-stage in/out edges as {stage_idx: (set(upstream), set(downstream))}."""
    in_stages  = defaultdict(set)
    out_stages = defaultdict(set)
    for w in lines:
        pl = w["patchline"]
        src, dst = pl["source"][0], pl["destination"][0]
        if src not in by_id or dst not in by_id:
            continue
        if src not in stage_of or dst not in stage_of:
            continue
        s_stage, d_stage = stage_of[src], stage_of[dst]
        if s_stage == d_stage:
            continue
        out_stages[s_stage].add(d_stage)
        in_stages[d_stage].add(s_stage)
    return in_stages, out_stages


def _clean_stage_label(objs):
    """Derive a stage label from its non-decoration object types.

    Mirrors the naming heuristic in `add_tutorial.build_step_description`
    (single type → bare name, two types → "A + B", more → "A +N").
    """
    types = list(dict.fromkeys(
        (b.get("text", "").split()[0] if b.get("maxclass") == "newobj"
         else b.get("maxclass", ""))
        for b in objs
    ))
    if not types:
        return ""
    if len(types) == 1:
        return types[0]
    if len(types) == 2:
        return " + ".join(types)
    return f"{types[0]} +{len(types) - 1}"


def _flow_sentence(stage_idx, step, in_stages_of, out_stages_of, stage_labels):
    """Produce a templated sentence describing this stage's role in the flow."""
    upstream   = sorted(in_stages_of.get(stage_idx, []))
    downstream = sorted(out_stages_of.get(stage_idx, []))

    def label(i):
        return f"Stage {i} ({stage_labels.get(i, '?')})"

    if not upstream and downstream:
        out_labels = ", ".join(label(i) for i in downstream)
        return f"This is a starting stage — its output flows into {out_labels}."
    if upstream and not downstream:
        in_labels = ", ".join(label(i) for i in upstream)
        return f"This is an end stage — it consumes data from {in_labels}."
    if upstream and downstream:
        in_labels  = ", ".join(label(i) for i in upstream)
        out_labels = ", ".join(label(i) for i in downstream)
        return (f"This stage receives input from {in_labels} "
                f"and sends results to {out_labels}.")
    return "This stage is self-contained (no connections to other stages)."


# ---------------------------------------------------------------------------
# Presentation-view controls
# ---------------------------------------------------------------------------

def _find_pres_label(target_box, all_boxes, dx_max=240.0, dy_range=(-30.0, 40.0)):
    """Find the nearest presented comment to the LEFT of (or just above) a box.

    Operates on `presentation_rect`, not `patching_rect`, because labels in
    presentation view sit next to controls in the *presentation* layout — the
    patching layout is unrelated. Returns the comment text or None.
    """
    rect = target_box.get("presentation_rect")
    if not rect or len(rect) < 2:
        return None
    bx, by = float(rect[0]), float(rect[1])
    best_text, best_dist = None, dx_max + 1.0
    for w in all_boxes:
        b = w["box"]
        if b.get("maxclass") != "comment":
            continue
        if b.get("id", "").startswith("tut-"):
            continue
        if b.get("presentation") != 1:
            continue
        cr = b.get("presentation_rect")
        if not cr or len(cr) < 2:
            continue
        cx, cy = float(cr[0]), float(cr[1])
        dx, dy = bx - cx, cy - by
        # Comment to the LEFT of (or just above) the control, on roughly the same row
        if 0 < dx <= dx_max and dy_range[0] <= dy <= dy_range[1]:
            if dx < best_dist:
                best_dist = dx
                best_text = b.get("text", "")
    return best_text


def _gather_presentation_controls(boxes):
    """Return list of (display_text, nearby_label) for presentation-view boxes."""
    out = []
    for w in boxes:
        b = w["box"]
        if b.get("presentation") != 1:
            continue
        if not is_significant(b):
            continue
        if b.get("maxclass") in ("panel", "fpic", "comment"):
            continue
        text  = obj_text(b)
        # Try presentation-layout label first (correct for presentation view),
        # then fall back to patching-layout label (works for patches that mirror
        # presentation in patching view).
        label = (_find_pres_label(b, boxes)
                 or add_tutorial.find_nearby_comment(b, boxes)
                 or "")
        out.append((text, label.strip()))
    return out


# ---------------------------------------------------------------------------
# Renderers
# ---------------------------------------------------------------------------

def render_walkthrough(boxes, lines, steps, patch_name, opens_in_pres,
                       tutorial=None):
    out = []
    sig_count = sum(1 for w in boxes if is_significant(w["box"]))
    n_stages  = max(0, len(steps) - 1)

    # Tutorial overlay applies only when the embedded tutorial's STEPS array
    # was generated against the same cluster set we just computed. A length
    # mismatch indicates the patch has drifted since the tutorial was baked
    # in (boxes added/removed) and we should fall back to auto-generated text
    # to avoid misattributing descriptions.
    use_tutorial = tutorial is not None and len(tutorial) == len(steps)

    out.append(f"# Walkthrough: {patch_name}")
    out.append("")
    overview_bits = [f"{sig_count} processing objects across {n_stages} functional stages"]
    if opens_in_pres:
        overview_bits.append("opens in presentation view")
    out.append("This patch has " + ", ".join(overview_bits) +
               ". The walkthrough follows signal/data flow stage by stage.")
    if use_tutorial:
        out.append("")
        out.append("*Stage names and prose below are taken from the patch's "
                   "embedded tutorial — the patch's author wrote them.*")
    out.append("")

    by_id      = {w["box"]["id"]: w["box"] for w in boxes}
    stage_of   = _stage_index(steps)
    in_stages, out_stages = _stage_io(steps, lines, by_id, stage_of)

    # Pre-compute clean stage labels (decoration filtered out) so flow
    # sentences can reference neighbours by their cleaned label. When a
    # tutorial overlay is in effect, prefer its hand-authored step name.
    stage_labels = {}
    for i, step in enumerate(steps):
        if i == 0:
            continue
        clean_objs = [by_id[oid] for oid in step["highlight_ids"]
                      if oid in by_id and by_id[oid].get("maxclass") not in DECORATION_CLASSES]
        if clean_objs:
            if use_tutorial:
                stage_labels[i] = tutorial[i].get("name") or _clean_stage_label(clean_objs)
            else:
                stage_labels[i] = _clean_stage_label(clean_objs)

    for i, step in enumerate(steps):
        if i == 0:
            continue   # skip the auto-generated overview entry
        all_objs = [by_id[oid] for oid in step["highlight_ids"] if oid in by_id]
        objs       = [b for b in all_objs if b.get("maxclass") not in DECORATION_CLASSES]
        decoration = [b for b in all_objs if b.get("maxclass")     in DECORATION_CLASSES]

        # Stages that contain only decoration are pure layout and not worth
        # explaining as functional units — skip them entirely.
        if not objs:
            continue

        out.append(f"## Stage {i}: {stage_labels[i]}")
        out.append("")
        if use_tutorial and tutorial[i].get("description"):
            out.append(tutorial[i]["description"])
            out.append("")
        out.append(_flow_sentence(i, step, in_stages, out_stages, stage_labels))
        out.append("")

        for box in objs:
            text, desc, source = describe_object(box)
            backticked = f"`{text}`"
            if desc:
                tag = ""
                if source and source.startswith("package:"):
                    tag = f" *[{source.split(':', 1)[1]} package]*"
                elif source is None:
                    tag = " *[no description found]*"
                out.append(f"- {backticked} — {desc}{tag}")
            else:
                out.append(f"- {backticked} *[no description found]*")

        if decoration:
            n = len(decoration)
            out.append(f"- *(plus {n} decoration object{'s' if n != 1 else ''}: "
                       f"{', '.join(sorted(set(b.get('maxclass', '?') for b in decoration)))})*")
        out.append("")

    pres = _gather_presentation_controls(boxes)
    if pres:
        out.append("## Things to tweak (presentation view)")
        out.append("")
        for text, label in pres:
            if label:
                out.append(f"- **{label}** → `{text}`")
            else:
                out.append(f"- `{text}`")
        out.append("")

    return "\n".join(out).rstrip() + "\n"


def render_summary(boxes, lines, steps, patch_name, opens_in_pres,
                   tutorial=None):
    out = []
    out.append(f"# {patch_name}")
    out.append("")

    by_id = {w["box"]["id"]: w["box"] for w in boxes}
    use_tutorial = tutorial is not None and len(tutorial) == len(steps)

    for i, step in enumerate(steps):
        if i == 0:
            continue
        all_objs = [by_id[oid] for oid in step["highlight_ids"] if oid in by_id]
        objs     = [b for b in all_objs if b.get("maxclass") not in DECORATION_CLASSES]
        if not objs:
            continue
        if use_tutorial:
            label = tutorial[i].get("name") or _clean_stage_label(objs)
        else:
            label = _clean_stage_label(objs)
        names_str = ", ".join(f"`{obj_text(b)}`" for b in objs)
        out.append(f"- **Stage {i} — {label}**: {names_str}")

    pres = _gather_presentation_controls(boxes)
    if pres:
        out.append("")
        labels = [label or text for text, label in pres]
        head   = ", ".join(labels[:8])
        suffix = "…" if len(labels) > 8 else ""
        out.append(f"**Presentation controls** ({len(labels)}): {head}{suffix}")

    return "\n".join(out).rstrip() + "\n"


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="Plain-English walkthrough of a Max patch (.maxpat)."
    )
    ap.add_argument("patch", help="Path to a .maxpat file")
    ap.add_argument("--summary", action="store_true",
                    help="Terse one-line-per-stage output")
    args = ap.parse_args()

    path = Path(args.patch)
    if not path.exists():
        print(f"ERROR: {path} not found", file=sys.stderr)
        sys.exit(1)
    if path.suffix != ".maxpat":
        print(f"WARNING: {path.name} doesn't look like a .maxpat", file=sys.stderr)

    try:
        maxpat = json.loads(path.read_text())
    except json.JSONDecodeError as e:
        print(f"ERROR: failed to parse {path} as JSON: {e}", file=sys.stderr)
        sys.exit(1)

    patcher = maxpat.get("patcher", {})
    boxes   = patcher.get("boxes", [])
    lines   = patcher.get("lines", [])
    opens_in_pres = bool(patcher.get("openinpresentation"))

    if not boxes:
        print(f"ERROR: {path} contains no boxes", file=sys.stderr)
        sys.exit(1)

    steps    = add_tutorial.generate_steps(boxes, lines)
    tutorial = _extract_embedded_tutorial(path, boxes)

    patch_name = path.stem
    if args.summary:
        sys.stdout.write(render_summary(boxes, lines, steps, patch_name,
                                        opens_in_pres, tutorial=tutorial))
    else:
        sys.stdout.write(render_walkthrough(boxes, lines, steps, patch_name,
                                            opens_in_pres, tutorial=tutorial))


if __name__ == "__main__":
    main()
