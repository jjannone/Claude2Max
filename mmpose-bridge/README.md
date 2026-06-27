# MMPose → OSC → Max bridge (contact-improv / multi-body)

A working scaffold that streams **multi-person 2D pose** from
[MMPose](https://github.com/open-mmlab/mmpose) into Max/MSP over OSC, with
**inter-body proximity / contact** computed on the Python side — the part you
actually want for contact-improv work, and the part MediaPipe-via-`jweb`
handles poorly when bodies overlap.

```
 webcam ─▶ MMPose (multi-person) ─▶ python-osc ─▶ UDP ─▶ [udpreceive 7400]
                                                            └▶ [route ...] ─▶ [v8 pose_monitor.js]
```

Two halves:

| File | Side | Role |
|---|---|---|
| `mmpose_osc_bridge.py` | Python | Inference, stable-id tracking, contact maths, OSC out |
| `../patches/mmpose-osc-bridge.maxpat` | Max | `udpreceive` + `route` + a live monitor (bodies & contacts) |
| `../patches/pose_monitor.js` | Max (v8) | Parses the stream into two `jit.cellblock` grids + count/touch outputs |

## Why native `udpreceive` + `route` (no CNMAT / OSC-route)

python-osc sends **flat** OSC messages, and Max's `udpreceive <port>` decodes
those natively into `address arg1 arg2 …`, so a plain `route` matches the
address — **no CNMAT Externals / `o.route` / `oscparse` needed.** (CNMAT is
only required for OSC *bundles*, which this bridge does not send.)

## Setup

```bash
cd mmpose-bridge
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt        # see notes for GPU torch
```

MMPose is the heavy part — if `pip install mmpose mmcv mmdet` gives you
trouble, follow the official installer:
<https://mmpose.readthedocs.io/en/latest/installation.html>. You can test the
**OSC wiring** before MMPose is installed (see *Smoke-test* below).

## Run

```bash
# webcam 0 → 127.0.0.1:7400 (the default in the Max patch)
python mmpose_osc_bridge.py

# a video file, with the rendered skeleton preview
python mmpose_osc_bridge.py --source clip.mp4 --show

# send to another machine on the LAN running Max
python mmpose_osc_bridge.py --osc-host 192.168.1.50 --osc-port 7400
```

Then open `../patches/mmpose-osc-bridge.maxpat` in Max. It opens in
presentation mode showing live body and contact tables. The patch listens on
**UDP 7400** — change the number in the `[udpreceive 7400]` object to match if
you pass a different `--osc-port`.

### Key options (`--help` for all)

| Flag | Default | Meaning |
|---|---|---|
| `--source` | `0` | Webcam index, or a video file / URL |
| `--osc-host` / `--osc-port` | `127.0.0.1` / `7400` | OSC destination; port must match `udpreceive` |
| `--model` | `rtmo` | `rtmo` = one-stage multi-person (fast). `human` = top-down RTMPose + detector (more accurate, heavier) |
| `--device` | auto | `cuda:0`, `cpu`, … |
| `--touch-thresh` | `0.06` | Normalised min-keypoint distance under which a pair is flagged `touch=1` |
| `--pair-gate` | `0.5` | Only emit `/pose/contact` for pairs whose centroids are within this |
| `--score-thresh` | `0.3` | Min keypoint confidence to use a joint |
| `--max-fps` | `30` | Throttle the send loop |

## OSC schema

Coordinates are **normalised 0..1** (`x / frame_width`, `y / frame_height`) so
the Max side is resolution-independent. The **body id is the first argument**
(not in the address), so Max routes by a fixed address and reads the id from
the args — this scales to N bodies without dynamic-address routing.

```
/pose/dims    <w> <h>
/pose/count   <n>                                  ← sent first each frame (frame delimiter)
/pose/body    <id> <cx> <cy> <bx> <by> <bw> <bh>   ← centroid + normalised bbox
/pose/kp      <id> <x0> <y0> <s0> … <x16> <y16> <s16>   ← 17 COCO keypoints (x,y,score)
/pose/contact <idA> <idB> <centroidDist> <minKpDist> <touch>
```

COCO-17 order: `nose, l_eye, r_eye, l_ear, r_ear, l_shoulder, r_shoulder,
l_elbow, r_elbow, l_wrist, r_wrist, l_hip, r_hip, l_knee, r_knee, l_ankle,
r_ankle`. `minKpDist` is `-1` when no confident keypoint pair exists.

### Body identity

MMPose does not track ids across frames, so the bridge runs a small
greedy nearest-centroid tracker (`--track-gate`) to keep each performer's id
stable. For crowds, swap in ByteTrack / a Kalman tracker.

## Extending the Max side

`pose_monitor.js` outlet 5 is a **keypoint passthrough** (`kp <id> x0 y0 s0 …`)
left unconnected in the scaffold — wire it into your own skeleton drawing
(`jit.gl.sketch`, `lcd`), contact-driven audio, etc. Everything upstream of
that outlet (routing, framing, contact display) is done for you.

## Smoke-test the OSC wiring without MMPose

`smoke_test.py` sends one synthetic frame through the exact OSC schema to a
local listener — use it to confirm Max receives and routes the stream before
the camera/model are in the loop:

```bash
pip install python-osc
python smoke_test.py            # prints every message a real frame would send
python smoke_test.py --to-max   # actually send to 127.0.0.1:7400 for the patch
```
