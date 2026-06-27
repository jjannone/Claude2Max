#!/usr/bin/env python3
"""
mmpose_osc_bridge.py — MMPose (multi-person 2D pose) → python-osc → Max

A working scaffold for contact-improv / multi-body work. It runs MMPose's
multi-person 2D estimator on a webcam (or video file), tracks each body with a
stable id across frames, computes inter-body proximity / contact, and streams
everything to Max as flat OSC messages over UDP.

On the Max side, a single `[udpreceive 7400]` + `[route ...]` ingests the
stream — no CNMAT / OSC-route dependency, because python-osc sends *flat* OSC
messages and Max's `udpreceive` decodes those natively. See ../patches/
mmpose-osc-bridge.maxpat for the receiving patch.

---------------------------------------------------------------------------
OSC SCHEMA (must stay in sync with the Max patch's `route` selectors)
---------------------------------------------------------------------------
Coordinates are NORMALISED to 0..1 (x / frame_width, y / frame_height) so the
Max patch is resolution-independent. The body id is carried as the FIRST
ARGUMENT (not in the address) so Max can `route` by a fixed address and read
the id from the args — this scales to N bodies without dynamic-address routing.

  /pose/dims    <w> <h>
        Source frame size in pixels. Sent once at startup and whenever it
        changes. Multiply normalised coords by these to recover pixels.

  /pose/count   <n>
        Number of bodies detected this frame. Sent FIRST each frame — the Max
        patch uses it as the frame delimiter (resets its per-frame display).

  /pose/body    <id> <cx> <cy> <bx> <by> <bw> <bh>
        Per body: stable id (int), normalised centroid (cx,cy), and normalised
        bounding box (top-left bx,by + size bw,bh).

  /pose/kp      <id> <x0> <y0> <s0> <x1> <y1> <s1> ... <x16> <y16> <s16>
        Per body: id followed by 17 COCO keypoints, each (x, y, score).
        Order: 0 nose, 1 l_eye, 2 r_eye, 3 l_ear, 4 r_ear, 5 l_shoulder,
        6 r_shoulder, 7 l_elbow, 8 r_elbow, 9 l_wrist, 10 r_wrist, 11 l_hip,
        12 r_hip, 13 l_knee, 14 r_knee, 15 l_ankle, 16 r_ankle.

  /pose/contact <idA> <idB> <centroidDist> <minKpDist> <touch>
        Per close pair of bodies (centroidDist below --pair-gate): the two ids,
        the normalised distance between centroids, the smallest normalised
        distance between any confident keypoint of A and any of B, and a 0/1
        touch flag (1 when minKpDist < --touch-thresh).
---------------------------------------------------------------------------

Quick start:
    pip install -r requirements.txt
    python mmpose_osc_bridge.py                 # webcam 0 → 127.0.0.1:7400
    python mmpose_osc_bridge.py --source clip.mp4 --show
    python mmpose_osc_bridge.py --osc-host 192.168.1.50 --osc-port 7400

The "core" of the bridge is small (open camera → infer → send OSC); the bulk
of this file is the stable-id tracker, the contact maths, defensive extraction
across MMPose result-format variations, and CLI plumbing.
"""

import argparse
import math
import sys
import time

# COCO-17 keypoint names, in index order (for reference / labelling).
COCO_KEYPOINTS = [
    "nose", "left_eye", "right_eye", "left_ear", "right_ear",
    "left_shoulder", "right_shoulder", "left_elbow", "right_elbow",
    "left_wrist", "right_wrist", "left_hip", "right_hip",
    "left_knee", "right_knee", "left_ankle", "right_ankle",
]


# ---------------------------------------------------------------------------
# Stable-id tracker — MMPose does not track identity across frames, so we do a
# simple greedy nearest-centroid association. Good enough for a handful of
# performers in a contact-improv space; swap in a Kalman/ByteTrack tracker for
# crowds.
# ---------------------------------------------------------------------------
class CentroidTracker:
    def __init__(self, gate=0.25, max_missing=8):
        # gate: max normalised centroid travel to count as "the same body".
        # max_missing: frames a body may go undetected before its id is freed.
        self.gate = gate
        self.max_missing = max_missing
        self._next_id = 0
        self._tracks = {}  # id -> {"centroid": (cx, cy), "missing": int}

    def update(self, centroids):
        """centroids: list of (cx, cy). Returns list of ids, parallel to it."""
        assigned = [None] * len(centroids)
        used_tracks = set()

        # Greedy: for each detection, take the nearest unused track within gate.
        # Sort candidate (detection, track) pairs by distance, assign closest first.
        candidates = []
        for di, (cx, cy) in enumerate(centroids):
            for tid, tr in self._tracks.items():
                d = math.dist((cx, cy), tr["centroid"])
                if d <= self.gate:
                    candidates.append((d, di, tid))
        candidates.sort(key=lambda c: c[0])
        for d, di, tid in candidates:
            if assigned[di] is None and tid not in used_tracks:
                assigned[di] = tid
                used_tracks.add(tid)

        # New ids for unassigned detections.
        for di, (cx, cy) in enumerate(centroids):
            if assigned[di] is None:
                assigned[di] = self._next_id
                self._next_id += 1

        # Refresh assigned tracks; age + reap the rest.
        for di, tid in enumerate(assigned):
            self._tracks[tid] = {"centroid": centroids[di], "missing": 0}
        for tid in list(self._tracks):
            if tid not in assigned:
                self._tracks[tid]["missing"] += 1
                if self._tracks[tid]["missing"] > self.max_missing:
                    del self._tracks[tid]

        return assigned


# ---------------------------------------------------------------------------
# Defensive extraction — MMPose result objects vary by version (InstanceData,
# plain dicts, numpy vs lists). Pull out keypoints / scores / bbox tolerantly.
# ---------------------------------------------------------------------------
def _to_list(x):
    """Coerce numpy arrays / tensors / nested sequences to plain Python lists."""
    if x is None:
        return None
    if hasattr(x, "tolist"):
        return x.tolist()
    return list(x)


def extract_instances(result):
    """
    Normalise one MMPoseInferencer result into a list of per-person dicts:
        {"keypoints": [[x, y], ...17], "scores": [s, ...17], "bbox": [x1,y1,x2,y2]}
    Tolerates the common result shapes returned across MMPose 1.x versions.
    """
    preds = result.get("predictions", result) if isinstance(result, dict) else result
    # predictions is usually [ [inst, inst, ...] ] (outer = batch of 1).
    if preds and isinstance(preds, (list, tuple)) and preds and isinstance(preds[0], (list, tuple)):
        preds = preds[0]

    people = []
    for inst in preds or []:
        get = inst.get if isinstance(inst, dict) else (lambda k, d=None: getattr(inst, k, d))
        kpts = _to_list(get("keypoints"))
        scores = _to_list(get("keypoint_scores"))
        bbox = _to_list(get("bbox"))
        if kpts is None:
            continue
        # Some formats nest a single instance one level deeper.
        if kpts and isinstance(kpts[0], (list, tuple)) and kpts[0] and isinstance(kpts[0][0], (list, tuple)):
            kpts = kpts[0]
            scores = scores[0] if scores else None
        if scores is None:
            scores = [1.0] * len(kpts)
        # bbox may arrive as [[x1,y1,x2,y2]] — unwrap.
        if bbox and isinstance(bbox[0], (list, tuple)):
            bbox = bbox[0]
        people.append({"keypoints": kpts, "scores": scores, "bbox": bbox})
    return people


def body_centroid(kpts, scores, score_thresh):
    """Mean of confident keypoints; falls back to all keypoints if none pass."""
    pts = [(x, y) for (x, y), s in zip(kpts, scores) if s >= score_thresh]
    if not pts:
        pts = [(x, y) for (x, y) in kpts]
    if not pts:
        return None
    cx = sum(p[0] for p in pts) / len(pts)
    cy = sum(p[1] for p in pts) / len(pts)
    return cx, cy


def min_keypoint_distance(a, b, score_thresh):
    """Smallest distance between any confident keypoint of A and any of B."""
    best = float("inf")
    for (ax, ay), as_ in zip(a["keypoints"], a["scores"]):
        if as_ < score_thresh:
            continue
        for (bx, by), bs in zip(b["keypoints"], b["scores"]):
            if bs < score_thresh:
                continue
            d = math.dist((ax, ay), (bx, by))
            if d < best:
                best = d
    return best


# ---------------------------------------------------------------------------
# Main loop
# ---------------------------------------------------------------------------
def main():
    ap = argparse.ArgumentParser(
        description="MMPose multi-person 2D pose → OSC bridge for Max.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    ap.add_argument("--source", default="0",
                    help="Webcam index (e.g. 0) or path/URL to a video file.")
    ap.add_argument("--osc-host", default="127.0.0.1",
                    help="OSC destination host (Max machine).")
    ap.add_argument("--osc-port", type=int, default=7400,
                    help="OSC destination port — must match [udpreceive N] in Max.")
    ap.add_argument("--model", default="rtmo",
                    help="MMPose pose2d alias (rtmo = one-stage multi-person; "
                         "'human' = top-down RTMPose + detector).")
    ap.add_argument("--device", default=None,
                    help="Torch device, e.g. cuda:0 or cpu. Default: auto.")
    ap.add_argument("--score-thresh", type=float, default=0.3,
                    help="Min keypoint confidence to treat a joint as valid.")
    ap.add_argument("--touch-thresh", type=float, default=0.06,
                    help="Normalised min-keypoint distance below which a pair "
                         "is flagged as touching (touch=1).")
    ap.add_argument("--pair-gate", type=float, default=0.5,
                    help="Only emit /pose/contact for body pairs whose centroids "
                         "are within this normalised distance.")
    ap.add_argument("--max-fps", type=float, default=30.0,
                    help="Throttle the send loop to at most this many fps.")
    ap.add_argument("--track-gate", type=float, default=0.25,
                    help="Max normalised centroid travel for the id tracker to "
                         "consider two detections the same body.")
    ap.add_argument("--show", action="store_true",
                    help="Open a preview window with the rendered skeletons.")
    args = ap.parse_args()

    # Imports are deferred so --help works without the heavy deps installed.
    try:
        from pythonosc.udp_client import SimpleUDPClient
    except ImportError:
        sys.exit("Missing dependency: pip install python-osc")
    try:
        import cv2
    except ImportError:
        sys.exit("Missing dependency: pip install opencv-python")
    try:
        from mmpose.apis import MMPoseInferencer
    except ImportError:
        sys.exit("Missing dependency: install MMPose — see requirements.txt "
                 "(pip install mmpose mmdet mmengine 'mmcv>=2.0').")

    osc = SimpleUDPClient(args.osc_host, args.osc_port)
    tracker = CentroidTracker(gate=args.track_gate)

    inferencer_kwargs = {"pose2d": args.model}
    if args.device:
        inferencer_kwargs["device"] = args.device
    print(f"[bridge] loading MMPose model '{args.model}' "
          f"(first run downloads weights)…", flush=True)
    inferencer = MMPoseInferencer(**inferencer_kwargs)

    # Open the source (int index → webcam, else file/URL path).
    src = int(args.source) if args.source.isdigit() else args.source
    cap = cv2.VideoCapture(src)
    if not cap.isOpened():
        sys.exit(f"[bridge] could not open source: {args.source}")

    print(f"[bridge] streaming OSC → {args.osc_host}:{args.osc_port}  "
          f"(set [udpreceive {args.osc_port}] in Max). Ctrl-C to stop.",
          flush=True)

    last_dims = None
    min_period = 1.0 / args.max_fps if args.max_fps > 0 else 0.0
    next_frame_time = 0.0

    try:
        while True:
            now = time.monotonic()
            if now < next_frame_time:
                time.sleep(next_frame_time - now)
            next_frame_time = time.monotonic() + min_period

            ok, frame = cap.read()
            if not ok:
                print("[bridge] source ended.", flush=True)
                break
            h, w = frame.shape[:2]
            if (w, h) != last_dims:
                osc.send_message("/pose/dims", [int(w), int(h)])
                last_dims = (w, h)

            # --- inference -------------------------------------------------
            result = next(inferencer(frame, show=False))
            people = extract_instances(result)

            # Normalise keypoints + compute centroids in 0..1 space.
            for p in people:
                p["keypoints"] = [[x / w, y / h] for (x, y) in p["keypoints"]]
                if p.get("bbox"):
                    x1, y1, x2, y2 = p["bbox"][:4]
                    p["nbbox"] = [x1 / w, y1 / h, (x2 - x1) / w, (y2 - y1) / h]
                else:
                    p["nbbox"] = None
                p["centroid"] = body_centroid(p["keypoints"], p["scores"],
                                              args.score_thresh)
            people = [p for p in people if p["centroid"] is not None]

            ids = tracker.update([p["centroid"] for p in people])

            # --- send OSC --------------------------------------------------
            osc.send_message("/pose/count", len(people))

            for pid, p in zip(ids, people):
                cx, cy = p["centroid"]
                bx, by, bw, bh = p["nbbox"] or (cx, cy, 0.0, 0.0)
                osc.send_message("/pose/body",
                                 [int(pid), round(cx, 4), round(cy, 4),
                                  round(bx, 4), round(by, 4),
                                  round(bw, 4), round(bh, 4)])
                kp_args = [int(pid)]
                for (x, y), s in zip(p["keypoints"], p["scores"]):
                    kp_args += [round(x, 4), round(y, 4), round(float(s), 3)]
                osc.send_message("/pose/kp", kp_args)

            # Pairwise contact between bodies.
            for i in range(len(people)):
                for j in range(i + 1, len(people)):
                    cdist = math.dist(people[i]["centroid"], people[j]["centroid"])
                    if cdist > args.pair_gate:
                        continue
                    mkd = min_keypoint_distance(people[i], people[j],
                                                args.score_thresh)
                    touch = 1 if mkd < args.touch_thresh else 0
                    mkd_out = -1.0 if math.isinf(mkd) else round(mkd, 4)
                    osc.send_message("/pose/contact",
                                     [int(ids[i]), int(ids[j]),
                                      round(cdist, 4), mkd_out, touch])

            # --- optional preview -----------------------------------------
            if args.show:
                vis = next(inferencer(frame, return_vis=True, show=False)) \
                    .get("visualization", [frame])[0]
                cv2.imshow("mmpose-osc-bridge", vis)
                if cv2.waitKey(1) & 0xFF == 27:  # Esc
                    break
    except KeyboardInterrupt:
        print("\n[bridge] stopped.", flush=True)
    finally:
        cap.release()
        if args.show:
            cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
