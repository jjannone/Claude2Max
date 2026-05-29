#!/usr/bin/env python3
"""c2m_inspect_send.py — talk to c2m.inspect over OSC, read the dump back.

The companion to patching/abstractions/c2m.inspect.maxpat. Sends an OSC
message to a running Max patch on UDP 127.0.0.1:7474, waits for the
corresponding /tmp/c2m_inspect_*.json file to appear (or update), and
prints its contents.

Stdlib-only (no python-osc dependency) so it works under PEP-668-locked
Pythons.

Usage:
    python3 c2m_inspect_send.py ping
    python3 c2m_inspect_send.py scan
    python3 c2m_inspect_send.py dump <tag> <kind> <name>

Examples:
    python3 c2m_inspect_send.py dump mydict dict      MY_DICT
    python3 c2m_inspect_send.py dump beat   coll      BEAT_COLL
    python3 c2m_inspect_send.py dump scope  buffer~   AUDIO_BUF
    python3 c2m_inspect_send.py dump grid   jit.matrix CAM_MAT
    python3 c2m_inspect_send.py dump steps  table     STEP_TABLE

Exit codes:
    0  success — JSON printed to stdout
    1  timeout — no file appeared within --timeout seconds
    2  bad usage
"""

import argparse
import os
import socket
import struct
import sys
import time


HOST_DEFAULT      = "127.0.0.1"
PORT_DEFAULT      = 7474
TIMEOUT_DEFAULT_S = 3.0
POLL_INTERVAL_S   = 0.05
TMP_DEFAULT       = "/tmp"


# --- OSC encoding (stdlib only) ---------------------------------------------

def _osc_pad(s: bytes) -> bytes:
    """Pad to a 4-byte boundary with null bytes."""
    pad = (4 - (len(s) % 4)) % 4
    return s + b"\x00" * pad


def _osc_string(s: str) -> bytes:
    """OSC string: null-terminated, padded to 4-byte boundary."""
    return _osc_pad(s.encode("utf-8") + b"\x00")


def encode_osc_message(address: str, *args) -> bytes:
    """Encode an OSC message. Supports int, float, str, bytes args."""
    addr = _osc_string(address)
    typetag = ","
    payload = b""
    for a in args:
        if isinstance(a, bool):
            typetag += "T" if a else "F"
        elif isinstance(a, int):
            typetag += "i"
            payload += struct.pack(">i", a)
        elif isinstance(a, float):
            typetag += "f"
            payload += struct.pack(">f", a)
        elif isinstance(a, str):
            typetag += "s"
            payload += _osc_string(a)
        elif isinstance(a, (bytes, bytearray)):
            typetag += "b"
            payload += struct.pack(">i", len(a)) + _osc_pad(bytes(a))
        else:
            raise TypeError(f"unsupported OSC arg type: {type(a).__name__}")
    return addr + _osc_string(typetag) + payload


def send_osc(host: str, port: int, address: str, *args) -> None:
    pkt = encode_osc_message(address, *args)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        sock.sendto(pkt, (host, port))
    finally:
        sock.close()


# --- file-result polling ----------------------------------------------------

def _mtime_or_zero(path: str) -> float:
    try:
        return os.path.getmtime(path)
    except OSError:
        return 0.0


def wait_for_file_update(path: str, since_ts: float, timeout_s: float) -> bool:
    """Return True if `path` exists and its mtime is greater than since_ts."""
    deadline = time.time() + timeout_s
    while time.time() < deadline:
        mt = _mtime_or_zero(path)
        if mt > since_ts:
            return True
        time.sleep(POLL_INTERVAL_S)
    return False


def print_file(path: str) -> int:
    try:
        with open(path, "r", encoding="utf-8") as f:
            sys.stdout.write(f.read())
            if not sys.stdout.isatty():
                sys.stdout.flush()
        return 0
    except OSError as e:
        print(f"ERROR reading {path}: {e}", file=sys.stderr)
        return 1


# --- subcommands ------------------------------------------------------------

def cmd_ping(args) -> int:
    out = os.path.join(args.tmpdir, "c2m_inspect_pong.json")
    since = _mtime_or_zero(out)
    send_osc(args.host, args.port, "/inspect/ping")
    if wait_for_file_update(out, since, args.timeout):
        return print_file(out)
    print(
        f"ERROR: no response within {args.timeout}s. "
        f"Check that the patch containing c2m.inspect is open and "
        f"udpreceive is listening on {args.host}:{args.port}.",
        file=sys.stderr,
    )
    return 1


def cmd_scan(args) -> int:
    out = os.path.join(args.tmpdir, "c2m_inspect_scan.json")
    since = _mtime_or_zero(out)
    send_osc(args.host, args.port, "/inspect/scan")
    if wait_for_file_update(out, since, args.timeout):
        return print_file(out)
    print(f"ERROR: no scan within {args.timeout}s.", file=sys.stderr)
    return 1


def cmd_dump(args) -> int:
    out = os.path.join(args.tmpdir, f"c2m_inspect_{args.tag}.json")
    since = _mtime_or_zero(out)
    send_osc(args.host, args.port, "/inspect/dump", args.tag, args.kind, args.name)
    if wait_for_file_update(out, since, args.timeout):
        return print_file(out)
    print(
        f"ERROR: dump file {out} not updated within {args.timeout}s. "
        f"For coll/table the @asyncdelay on the v8 box (default 200ms) plus "
        f"file-write latency may exceed --timeout — try --timeout 5.",
        file=sys.stderr,
    )
    return 1


# --- arg parsing ------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        prog="c2m_inspect_send.py",
        description="Send OSC to c2m.inspect and print the dumped JSON.",
    )
    parser.add_argument("--host",    default=HOST_DEFAULT)
    parser.add_argument("--port",    default=PORT_DEFAULT, type=int)
    parser.add_argument("--timeout", default=TIMEOUT_DEFAULT_S, type=float,
                        help="seconds to wait for the result file (default 3.0)")
    parser.add_argument("--tmpdir",  default=TMP_DEFAULT,
                        help="directory the v8 writes dump files into (must match @tmpdir)")

    sub = parser.add_subparsers(dest="command", required=True)

    sub.add_parser("ping", help="write c2m_inspect_pong.json — connectivity test")
    sub.add_parser("scan", help="write c2m_inspect_scan.json — list capabilities")

    p_dump = sub.add_parser("dump", help="dump a named data structure")
    p_dump.add_argument("tag",  help="result file tag (becomes c2m_inspect_<tag>.json)")
    p_dump.add_argument("kind", choices=["coll", "dict", "table", "jit.matrix", "buffer~"])
    p_dump.add_argument("name", help="name of the Max object to dump")

    args = parser.parse_args()

    if args.command == "ping":
        return cmd_ping(args)
    if args.command == "scan":
        return cmd_scan(args)
    if args.command == "dump":
        return cmd_dump(args)
    return 2


if __name__ == "__main__":
    sys.exit(main())
