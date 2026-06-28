#!/usr/bin/env python3
"""
smoke_test.py — exercise the OSC schema without MMPose / a camera.

Builds one synthetic frame with two overlapping bodies (so a contact fires)
and sends the exact `/pose/...` messages a real frame would. Use it to confirm
the Max patch receives and routes the stream before wiring up the model.

    python smoke_test.py            # print + send to a local listener, verify echo
    python smoke_test.py --to-max   # send to 127.0.0.1:7400 for the open patch
"""
import argparse
import math
import socket
import threading
import time

try:
    from pythonosc.udp_client import SimpleUDPClient
    from pythonosc.dispatcher import Dispatcher
    from pythonosc.osc_server import BlockingOSCUDPServer
except ImportError:
    raise SystemExit("pip install python-osc")


def synthetic_frame():
    """Return the list of (address, args) a real two-body frame would send."""
    w, h = 1280, 720
    # Two bodies whose wrists nearly touch in the middle → one contact, touch=1.
    bodyA_c = (0.40, 0.50)
    bodyB_c = (0.55, 0.50)
    msgs = [
        ("/pose/dims", [w, h]),
        ("/pose/count", 2),
        ("/pose/body", [0, bodyA_c[0], bodyA_c[1], 0.30, 0.20, 0.20, 0.60]),
        ("/pose/body", [1, bodyB_c[0], bodyB_c[1], 0.45, 0.20, 0.20, 0.60]),
        # 17 keypoints each (x, y, score) — abbreviated but well-formed.
        ("/pose/kp", [0] + [v for i in range(17)
                            for v in (0.40 + 0.001 * i, 0.40 + 0.01 * i, 0.9)]),
        ("/pose/kp", [1] + [v for i in range(17)
                            for v in (0.55 - 0.001 * i, 0.40 + 0.01 * i, 0.9)]),
    ]
    # Contact: centroid distance + a tiny min-keypoint distance → touch=1.
    cdist = math.dist(bodyA_c, bodyB_c)
    msgs.append(("/pose/contact", [0, 1, round(cdist, 4), 0.03, 1]))
    return msgs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=7400)
    ap.add_argument("--to-max", action="store_true",
                    help="Send to the real port instead of a local loopback "
                         "listener (use when the Max patch is open).")
    args = ap.parse_args()

    msgs = synthetic_frame()
    print("Frame the bridge would send:")
    for addr, a in msgs:
        print(f"  {addr:15} {a}")

    if args.to_max:
        client = SimpleUDPClient(args.host, args.port)
        for addr, a in msgs:
            client.send_message(addr, a)
        print(f"\nSent {len(msgs)} messages → {args.host}:{args.port}")
        return

    # Loopback self-check: stand up a listener on a free port and confirm every
    # message round-trips with address + arg count intact.
    received = []
    dispatcher = Dispatcher()
    dispatcher.set_default_handler(
        lambda addr, *a: received.append((addr, list(a))))
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(("127.0.0.1", 0))
    port = sock.getsockname()[1]
    sock.close()
    server = BlockingOSCUDPServer(("127.0.0.1", port), dispatcher)
    t = threading.Thread(target=server.serve_forever, daemon=True)
    t.start()
    time.sleep(0.1)

    client = SimpleUDPClient("127.0.0.1", port)
    for addr, a in msgs:
        client.send_message(addr, a)
    time.sleep(0.3)
    server.shutdown()

    ok = len(received) == len(msgs)
    print(f"\nLoopback received {len(received)}/{len(msgs)} messages "
          f"— {'OK' if ok else 'MISMATCH'}")
    addrs = {a for a, _ in received}
    for expect in ("/pose/count", "/pose/body", "/pose/kp", "/pose/contact",
                   "/pose/dims"):
        print(f"  {'✓' if expect in addrs else '✗'} {expect}")
    raise SystemExit(0 if ok else 1)


if __name__ == "__main__":
    main()
