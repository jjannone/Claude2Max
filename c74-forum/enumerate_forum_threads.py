#!/usr/bin/env python3
"""
Enumerate threads in a Cycling '74 forum subforum / page.

Used by the Forum Knowledge Crawl task — see TASK_QUEUE.md and
FORUM_CRAWL_LOG.md. Avoids the WebFetch pagination quirk by hitting the
forum directly and parsing the embedded Next.js data.

Prioritization principle: a single-reply thread that includes a working
patch (MCT) or file attachment can be more valuable than a 20-reply
discussion with no artifacts. Use `--detect-content` to flag threads that
contain MCT blocks (`patcher` nodes) or uploaded files (`attachment`
nodes), then sort by artifact presence first, replies second.

Usage:
    # Cheap: just slug, title, replies for one or many pages
    python3 enumerate_forum_threads.py --category Javascript --page 1
    python3 enumerate_forum_threads.py --category Jitter --pages 1-3

    # Adds MCT and attachment columns (one HTTP per thread — slower)
    python3 enumerate_forum_threads.py --category Javascript --pages 1-3 --detect-content

    # Filter by artifact presence
    python3 enumerate_forum_threads.py --category MaxMSP --pages 1-3 --detect-content --has-content
    python3 enumerate_forum_threads.py --category Jitter  --pages 1-2 --detect-content --has-mct

Output (TSV to stdout):
    Without --detect-content:  replies, slug, title
    With    --detect-content:  replies, mct, attach, slug, title
"""
from __future__ import annotations

import argparse
import html
import json
import re
import sys
import urllib.parse
import urllib.request
from pathlib import Path

FORUM_URL = "https://cycling74.com/forums"
STATE_FILE_DEFAULT = str(Path(__file__).parent / "forum_crawl_state.json")

CATEGORIES = {
    "MaxMSP", "RNBO", "Jitter", "Max For Live",
    "Javascript", "Misc", "Gen", "Java",
}

ITEM_DELIM = 'class="components_forumItem__'
THREAD_RE = re.compile(
    r'href="(/forums/[a-z0-9][a-z0-9-]+)"[^>]*>([^<]+)</a>',
    re.IGNORECASE,
)
NUM_RE = re.compile(r">(\d{1,3})<")
NEXT_DATA_RE = re.compile(
    r'<script id="__NEXT_DATA__" type="application/json">(.+?)</script>',
    re.DOTALL,
)


def fetch(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": "Claude2Max-forum-crawl/1.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read().decode("utf-8", errors="replace")


def fetch_listing(category: str, page: int) -> str:
    qs = urllib.parse.urlencode({"category": category, "page": page})
    return fetch(f"{FORUM_URL}?{qs}")


def parse_listing(src: str) -> list[tuple[int, str, str]]:
    """Return [(replies, slug, title), ...] for one listing page."""
    out: list[tuple[int, str, str]] = []
    seen: set[str] = set()
    for blk in src.split(ITEM_DELIM)[1:]:
        m = THREAD_RE.search(blk)
        if not m:
            continue
        slug = m.group(1)
        title = html.unescape(m.group(2).strip())
        if not title or len(title) < 6 or slug in seen:
            continue
        seen.add(slug)
        nums = NUM_RE.findall(blk)
        replies = int(nums[0]) if nums else 0
        out.append((replies, slug, title))
    return out


def count_node_types(doc: dict, target: str) -> int:
    """Walk a ProseMirror doc; count nodes with type == target."""
    n = 0
    for child in doc.get("content", []) or []:
        if child.get("type") == target:
            n += 1
        if isinstance(child.get("content"), list):
            n += count_node_types(child, target)
    return n


def collect_nodes(doc: dict, target: str) -> list[dict]:
    """Walk a ProseMirror doc; return all nodes with type == target."""
    out: list[dict] = []
    for child in doc.get("content", []) or []:
        if child.get("type") == target:
            out.append(child)
        if isinstance(child.get("content"), list):
            out.extend(collect_nodes(child, target))
    return out


def thread_artifacts(slug: str) -> dict:
    """
    Fetch a thread and return:
      {
        'mct_ids': list[str],      # patcher_ids for each MCT block — fetchable
        'attachments': list[dict], # [{'url', 'name', 'size'}, ...]
        'created_at': str | None,           # OP timestamp (ISO 8601)
        'modified_at': str | None,          # last edit to OP (ISO 8601)
        'replies_last_modified_at': str | None,  # latest reply timestamp (ISO 8601)
      }

    The freshness signal for state tracking is `replies_last_modified_at`:
    if it's later than what state recorded, the thread has new activity.

    MCT text itself is NOT in the page HTML — it lives at /api/v1/patchers/<id>
    and is loaded client-side. Attachments are direct CDN URLs.
    """
    empty = {
        "mct_ids": [], "attachments": [],
        "created_at": None, "modified_at": None,
        "replies_last_modified_at": None,
    }
    src = fetch(f"https://cycling74.com{slug}")
    m = NEXT_DATA_RE.search(src)
    if not m:
        return empty
    try:
        data = json.loads(m.group(1))
    except json.JSONDecodeError:
        return empty
    post = data.get("props", {}).get("pageProps", {}).get("post") or {}
    docs: list[dict] = []
    if isinstance(post.get("content"), dict):
        docs.append(post["content"])
    for r in post.get("replies", []) or []:
        if isinstance(r.get("content"), dict):
            docs.append(r["content"])
    mct_ids: list[str] = []
    for d in docs:
        for n in collect_nodes(d, "patcher"):
            pid = (n.get("attrs") or {}).get("id")
            if pid:
                mct_ids.append(pid)
    attachments: list[dict] = []
    for d in docs:
        for n in collect_nodes(d, "attachment"):
            a = n.get("attrs") or {}
            url = a.get("url")
            if url:
                attachments.append({
                    "url": url,
                    "name": a.get("name") or url.rsplit("/", 1)[-1],
                    "size": a.get("size") or 0,
                })
    return {
        "mct_ids": mct_ids,
        "attachments": attachments,
        "created_at": post.get("created_at"),
        "modified_at": post.get("modified_at"),
        "replies_last_modified_at": post.get("replies_last_modified_at") or post.get("modified_at"),
    }


# ──────────── State tracking (which threads have been scraped) ────────────
#
# `forum_crawl_state.json` records every thread we've extracted insights from.
# State entries store the freshness signal at the time of scrape so future
# runs can distinguish:
#
#   NEW       — slug not in state file (covers both genuinely-new posts and
#               older posts we simply haven't scraped yet)
#   UPDATED   — slug in state, but `replies_last_modified_at` is later than
#               what we recorded (new replies / edits)
#   UNCHANGED — slug in state, same freshness signal — skip it

def state_load(path: str) -> dict:
    import os
    if not os.path.exists(path):
        return {}
    try:
        with open(path) as f:
            return json.load(f)
    except (json.JSONDecodeError, OSError):
        return {}


def state_save(path: str, state: dict) -> None:
    with open(path, "w") as f:
        json.dump(state, f, indent=2, sort_keys=True)


def state_status(state: dict, slug: str, current_last_reply: str | None) -> str:
    """Return 'new' | 'updated' | 'unchanged' for a slug given current freshness."""
    entry = state.get(slug)
    if not entry:
        return "new"
    recorded = entry.get("replies_last_modified_at")
    if not recorded or not current_last_reply:
        return "unchanged" if recorded else "updated"
    return "updated" if current_last_reply > recorded else "unchanged"


def state_mark_done(
    state: dict,
    slug: str,
    info: dict,
    *,
    title: str = "",
    category: str = "",
    decision: str = "scraped",
) -> None:
    """Record a slug as scraped, capturing freshness + artifact fingerprints."""
    import datetime as dt
    state[slug] = {
        "scraped_at": dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z"),
        "title": title,
        "category": category,
        "decision": decision,  # "scraped" | "skipped" | "no-insight"
        "modified_at": info.get("modified_at"),
        "replies_last_modified_at": info.get("replies_last_modified_at"),
        "mct_ids_seen": list(info.get("mct_ids", [])),
        "attach_urls_seen": [a["url"] for a in info.get("attachments", [])],
    }


def detect_content(slug: str) -> tuple[int, int]:
    """Backwards-compat: return (mct_count, attachment_count)."""
    info = thread_artifacts(slug)
    return len(info["mct_ids"]), len(info["attachments"])


def mct_fetch(patcher_id: str) -> str | None:
    """
    Fetch the MCT body for a forum patcher_id from /api/v1/patchers/<id>.
    Returns the patch field (JUCE-base64-zlib-compressed), without delimiters.
    Returns None on failure.
    """
    url = f"https://cycling74.com/api/v1/patchers/{urllib.parse.quote(patcher_id)}"
    try:
        body = fetch(url)
        data = json.loads(body)
        return data.get("patch")
    except Exception:
        return None


def mct_to_maxpat(patch_b64: str, dest_path: str) -> None:
    """
    Decode a forum-embedded MCT body (no delimiters) and write it as a
    standalone .maxpat file.

    The decoded payload is the **standard Max copy-paste JSON format** —
    `{boxes, lines, appversion, classnamespace}` at the top level. This is
    what Cmd-C in Max produces and what "Edit > Paste From Clipboard"
    consumes; it is not a forum-specific shape. A standalone `.maxpat` file
    expects an outer `{"patcher": {...}}` wrapper, so we add one before
    saving. If the payload already carries a top-level `patcher` (e.g.
    someone forum-embedded a full .maxpat), leave it alone.
    """
    import os
    from spec2maxpat import mct_decode

    wrapped = (
        "----------begin_max5_patcher----------\n"
        + patch_b64
        + "\n-----------end_max5_patcher-----------"
    )
    decoded_json = mct_decode(wrapped)
    decoded = json.loads(decoded_json)
    if "patcher" not in decoded:
        decoded = {"patcher": decoded}
    os.makedirs(os.path.dirname(dest_path), exist_ok=True)
    with open(dest_path, "w") as f:
        json.dump(decoded, f, indent=2)


def download_attachments(slug: str, dest_dir: str, *, info: dict | None = None) -> list[str]:
    """
    Download all attachments AND embedded MCT blocks for a thread into dest_dir.
    MCTs are saved as `mct-<id>.maxpat`. Returns saved paths.
    """
    import os
    os.makedirs(dest_dir, exist_ok=True)
    if info is None:
        info = thread_artifacts(slug)
    saved: list[str] = []

    # Attachments
    for a in info.get("attachments", []):
        name = os.path.basename(a["name"]).replace("/", "_")
        path = os.path.join(dest_dir, name)
        if os.path.exists(path):
            stem, ext = os.path.splitext(name)
            tag = a["url"].rsplit("/", 1)[-1].split(".")[0][:8]
            path = os.path.join(dest_dir, f"{stem}-{tag}{ext}")
        try:
            req = urllib.request.Request(
                a["url"],
                headers={"User-Agent": "Claude2Max-forum-crawl/1.0"},
            )
            with urllib.request.urlopen(req, timeout=60) as resp:
                with open(path, "wb") as f:
                    f.write(resp.read())
            saved.append(path)
        except Exception as e:
            print(f"warn: download failed for {a['url']}: {e}", file=sys.stderr)

    # MCT blocks — fetch each via /api/v1/patchers/<id> and decode to .maxpat
    for pid in info.get("mct_ids", []):
        patch_b64 = mct_fetch(pid)
        if not patch_b64:
            print(f"warn: mct_fetch failed for {pid}", file=sys.stderr)
            continue
        path = os.path.join(dest_dir, f"mct-{pid[:12]}.maxpat")
        try:
            mct_to_maxpat(patch_b64, path)
            saved.append(path)
        except Exception as e:
            print(f"warn: mct decode failed for {pid}: {e}", file=sys.stderr)

    return saved


def parse_pages_arg(s: str) -> list[int]:
    if "-" in s:
        a, b = s.split("-", 1)
        return list(range(int(a), int(b) + 1))
    return [int(p) for p in s.split(",")]


def main() -> int:
    p = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    p.add_argument("--category", required=True,
                   help="Subforum: " + ", ".join(sorted(CATEGORIES)))
    g = p.add_mutually_exclusive_group()
    g.add_argument("--page", type=int, default=None,
                   help="Page number (default 1 when enumerating).")
    g.add_argument("--pages", type=parse_pages_arg, help="Range like 1-5 or list 1,3,5")
    p.add_argument("--min-replies", type=int, default=0,
                   help="(Use sparingly — single-reply threads with MCT can be high value.)")
    p.add_argument("--detect-content", action="store_true",
                   help="Fetch each thread and tag MCT / attachment counts (slower)")
    p.add_argument("--has-content", action="store_true",
                   help="Only show threads with MCT or attachments (implies --detect-content)")
    p.add_argument("--has-mct", action="store_true",
                   help="Only show threads with MCT (implies --detect-content)")
    p.add_argument("--has-attach", action="store_true",
                   help="Only show threads with attachments (implies --detect-content)")
    p.add_argument("--sort", choices=("artifact", "replies", "source"),
                   default="artifact",
                   help="artifact (default with --detect-content): MCT/attach first, then replies; "
                        "replies: highest-reply first; source: page order")
    p.add_argument("--list-attachments", action="store_true",
                   help="Print attachment URL/name/size per thread (implies --detect-content)")
    p.add_argument("--download", metavar="DIR",
                   help="Download every thread's attachments AND decoded MCTs under "
                        "DIR/<slug>/. Marks each thread as scraped in the state file. "
                        "Implies --detect-content.")
    p.add_argument("--state", default=STATE_FILE_DEFAULT,
                   help=f"Path to state file (default: {STATE_FILE_DEFAULT}). Records "
                        "which threads have been scraped + freshness signal.")
    p.add_argument("--diff", action="store_true",
                   help="Only show NEW (never scraped) or UPDATED (new replies since last "
                        "scrape) threads. Implies --detect-content. Combine with --has-* "
                        "filters to triage just the artifact-bearing fresh ones.")
    p.add_argument("--mark-done", metavar="SLUG", action="append",
                   help="Mark a slug as scraped without downloading (idempotent; pass "
                        "multiple times for multiple slugs). Useful for Phase B/C threads "
                        "you crawled via WebFetch only.")
    args = p.parse_args()

    if (args.has_content or args.has_mct or args.has_attach
            or args.list_attachments or args.download or args.diff):
        args.detect_content = True

    state = state_load(args.state)

    # Pure --mark-done mode: no enumeration, just record slugs and exit.
    if args.mark_done and not (args.page is not None or args.pages or args.diff or args.download):
        for slug in args.mark_done:
            slug = slug if slug.startswith("/") else "/forums/" + slug
            try:
                info = thread_artifacts(slug)
            except Exception as e:
                print(f"warn: thread_artifacts failed for {slug}: {e}", file=sys.stderr)
                info = {"mct_ids": [], "attachments": [],
                        "modified_at": None, "replies_last_modified_at": None}
            state_mark_done(state, slug, info, decision="scraped")
            print(f"marked\t{slug}")
        state_save(args.state, state)
        return 0

    if args.category not in CATEGORIES:
        print(f"warn: '{args.category}' not in known categories — proceeding anyway",
              file=sys.stderr)

    pages = args.pages if args.pages else [args.page if args.page is not None else 1]
    rows: list[tuple[int, int, int, str, str]] = []  # (replies, mct, attach, slug, title)
    for pg in pages:
        try:
            src = fetch_listing(args.category, pg)
        except Exception as e:
            print(f"error fetching page {pg}: {e}", file=sys.stderr)
            continue
        for replies, slug, title in parse_listing(src):
            rows.append((replies, 0, 0, slug, title))

    rows = [r for r in rows if r[0] >= args.min_replies]

    artifacts_by_slug: dict[str, dict] = {}
    if args.detect_content:
        scanned: list[tuple[int, int, int, str, str]] = []
        for replies, _, _, slug, title in rows:
            try:
                info = thread_artifacts(slug)
            except Exception as e:
                print(f"warn: thread_artifacts failed for {slug}: {e}", file=sys.stderr)
                info = {"mct_ids": [], "attachments": []}
            artifacts_by_slug[slug] = info
            scanned.append((replies, len(info["mct_ids"]), len(info["attachments"]), slug, title))
        rows = scanned

        if args.has_mct:
            rows = [r for r in rows if r[1] > 0]
        elif args.has_attach:
            rows = [r for r in rows if r[2] > 0]
        elif args.has_content:
            rows = [r for r in rows if r[1] > 0 or r[2] > 0]

        if args.diff:
            rows = [
                r for r in rows
                if state_status(state, r[3], artifacts_by_slug.get(r[3], {}).get("replies_last_modified_at")) != "unchanged"
            ]

    if args.sort == "artifact" and args.detect_content:
        # has-mct first, then has-attach, then by replies desc
        rows.sort(key=lambda r: (r[1] == 0, r[2] == 0, -r[0], r[3]))
    elif args.sort == "replies":
        rows.sort(key=lambda r: (-r[0], r[3]))
    # source: leave in source order

    if args.list_attachments:
        print("# slug\tname\tsize\turl")
        for _, _, _, slug, _ in rows:
            for a in artifacts_by_slug.get(slug, {}).get("attachments", []):
                print(f"{slug}\t{a['name']}\t{a['size']}\t{a['url']}")
        return 0

    if args.download:
        import os
        for _, _, _, slug, title in rows:
            info = artifacts_by_slug.get(slug, {"mct_ids": [], "attachments": []})
            if not info["mct_ids"] and not info["attachments"]:
                continue
            dest = os.path.join(args.download, slug.lstrip("/").replace("/", "_"))
            try:
                saved = download_attachments(slug, dest, info=info)
                for path in saved:
                    print(f"saved\t{slug}\t{path}")
                state_mark_done(state, slug, info, title=title,
                                category=args.category, decision="downloaded")
            except Exception as e:
                print(f"error\t{slug}\t{e}", file=sys.stderr)
        state_save(args.state, state)
        return 0

    if args.detect_content:
        print("# status\treplies\tmct\tattach\tslug\ttitle")
        for replies, mct, attach, slug, title in rows:
            current_lr = artifacts_by_slug.get(slug, {}).get("replies_last_modified_at")
            status = state_status(state, slug, current_lr) if state else "new"
            print(f"{status}\t{replies}\t{mct}\t{attach}\t{slug}\t{title}")
    else:
        for replies, _, _, slug, title in rows:
            print(f"{replies}\t{slug}\t{title}")

    if args.mark_done:
        for slug in args.mark_done:
            slug = slug if slug.startswith("/") else "/forums/" + slug
            info = artifacts_by_slug.get(slug)
            if info is None:
                try:
                    info = thread_artifacts(slug)
                except Exception:
                    info = {"mct_ids": [], "attachments": [],
                            "modified_at": None, "replies_last_modified_at": None}
            state_mark_done(state, slug, info, decision="scraped")
            print(f"marked\t{slug}", file=sys.stderr)
        state_save(args.state, state)

    return 0


if __name__ == "__main__":
    sys.exit(main())
