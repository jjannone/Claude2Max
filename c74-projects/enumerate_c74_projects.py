#!/usr/bin/env python3
"""
Enumerate the Cycling '74 community projects gallery.

Used by the C74 Projects Crawl task — see TASK_QUEUE.md and
C74_PROJECTS_CRAWL_LOG.md.

Why this is different from the forum crawl:
  - The gallery's __NEXT_DATA__ exposes a clean `postData.results` JSON list
    with rich per-project metadata (no HTML scraping needed).
  - Unlike forum threads, projects rarely embed MCT (`patcher`) nodes inline.
    The patch usually lives at an external URL: GitHub, MaxForLive.com,
    vstopia, the author's site, etc. Many projects are commercial — no
    extractable insights, but the metadata still has indexing value.

Usage:
    # List one page (10 projects)
    python3 enumerate_c74_projects.py --page 1

    # List a range, sorted by topic
    python3 enumerate_c74_projects.py --pages 1-5 --sort topic

    # Per-project detail scan (one extra HTTP per project — slower)
    python3 enumerate_c74_projects.py --page 1 --detect-content

    # Filter to only projects with inline MCT or attachments
    python3 enumerate_c74_projects.py --pages 1-5 --has-content

    # Download artifacts for projects on a page
    python3 enumerate_c74_projects.py --page 1 --download /tmp/c74-projects

Output (TSV to stdout):
    Without --detect-content:  topic, slug, title, website_url
    With    --detect-content:  status, topic, mct, attach, slug, title, website_url
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import urllib.parse
import urllib.request
from pathlib import Path

GALLERY_URL = "https://cycling74.com/projects"
PROJECT_BASE = "https://cycling74.com/projects/"
STATE_FILE_DEFAULT = str(Path(__file__).parent / "c74_projects_crawl_state.json")

NEXT_DATA_RE = re.compile(
    r'<script id="__NEXT_DATA__" type="application/json">(.+?)</script>',
    re.DOTALL,
)


def fetch(url: str) -> str:
    req = urllib.request.Request(
        url, headers={"User-Agent": "Claude2Max-c74-projects-crawl/1.0"}
    )
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read().decode("utf-8", errors="replace")


def fetch_listing_page(page: int) -> dict:
    """Return the postData dict for a listing page: {page, perPage, total, results}."""
    qs = urllib.parse.urlencode({"page": page})
    src = fetch(f"{GALLERY_URL}?{qs}")
    m = NEXT_DATA_RE.search(src)
    if not m:
        return {"page": page, "perPage": 10, "total": 0, "results": []}
    data = json.loads(m.group(1))
    return data.get("props", {}).get("pageProps", {}).get("postData", {}) or {}


def fetch_project(slug: str) -> dict:
    """Fetch a single project page; return the post dict or {}.

    Slugs containing non-ASCII (em-dash, accented chars) need percent-encoding
    before they hit urllib — the HTTP library cannot encode the URL line as
    ASCII otherwise. `safe='/-'` preserves the path separator and ASCII dashes
    while encoding everything else.
    """
    safe_slug = urllib.parse.quote(slug, safe="/-")
    src = fetch(f"{PROJECT_BASE}{safe_slug}")
    m = NEXT_DATA_RE.search(src)
    if not m:
        return {}
    data = json.loads(m.group(1))
    return data.get("props", {}).get("pageProps", {}).get("post") or {}


def collect_nodes(doc: dict, target: str) -> list[dict]:
    """Walk a ProseMirror doc; return all nodes with type == target."""
    out: list[dict] = []
    if not isinstance(doc, dict):
        return out
    for child in doc.get("content", []) or []:
        if not isinstance(child, dict):
            continue
        if child.get("type") == target:
            out.append(child)
        if isinstance(child.get("content"), list):
            out.extend(collect_nodes(child, target))
    return out


def project_artifacts(post: dict) -> dict:
    """
    Inspect a project's `content` ProseMirror doc for inline patches/files.

    Returns:
      {
        'mct_ids':     [str, ...],   # patcher node ids (rare in projects)
        'attachments': [{'url','name','size'}, ...],  # uploaded files
        'youtube_ids': [str, ...],   # video preview links (informational)
      }

    Note: most project patches live at external URLs (GitHub, MaxForLive.com,
    vendor sites) referenced via post.meta.website_url / creator_url, NOT as
    inline patcher/attachment nodes. The forum-style inline pattern is the
    exception, not the rule.
    """
    doc = post.get("content") or {}
    mct_ids: list[str] = []
    attachments: list[dict] = []
    youtube_ids: list[str] = []
    for n in collect_nodes(doc, "patcher"):
        pid = (n.get("attrs") or {}).get("id")
        if pid:
            mct_ids.append(pid)
    for n in collect_nodes(doc, "attachment"):
        a = n.get("attrs") or {}
        url = a.get("url")
        if url:
            attachments.append({
                "url": url,
                "name": a.get("name") or url.rsplit("/", 1)[-1],
                "size": a.get("size") or 0,
            })
    for n in collect_nodes(doc, "youtube"):
        yid = (n.get("attrs") or {}).get("id") or (n.get("attrs") or {}).get("videoId")
        if yid:
            youtube_ids.append(yid)
    return {
        "mct_ids": mct_ids,
        "attachments": attachments,
        "youtube_ids": youtube_ids,
    }


# ──────────── State tracking ────────────


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


def state_status(state: dict, slug: str, current_modified: str | None) -> str:
    """Return 'new' | 'updated' | 'unchanged' for a slug given current freshness."""
    entry = state.get(slug)
    if not entry:
        return "new"
    recorded = entry.get("modified_at")
    if not recorded or not current_modified:
        return "unchanged" if recorded else "updated"
    return "updated" if current_modified > recorded else "unchanged"


def state_mark(
    state: dict,
    slug: str,
    *,
    title: str = "",
    topic: str = "",
    decision: str = "enumerated",
    post: dict | None = None,
    artifacts: dict | None = None,
) -> None:
    """Record a project's status. Decision values: enumerated | downloaded | analyzed | skipped."""
    import datetime as dt
    p = post or {}
    a = artifacts or {}
    state[slug] = {
        "marked_at": dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z"),
        "title": title or p.get("title", ""),
        "topic": topic or p.get("forum_topic", ""),
        "decision": decision,
        "modified_at": p.get("modified_at"),
        "tags": p.get("tags") or [],
        "project_keywords": (p.get("meta") or {}).get("project_keywords") or [],
        "website_url": (p.get("meta") or {}).get("website_url") or "",
        "creator_url": (p.get("meta") or {}).get("creator_url") or "",
        "mct_ids_seen": list(a.get("mct_ids", [])),
        "attach_urls_seen": [att["url"] for att in a.get("attachments", [])],
    }


def download_artifacts(slug: str, post: dict, dest_dir: str) -> list[str]:
    """Download inline patcher MCTs + attachment files for a project."""
    import os
    os.makedirs(dest_dir, exist_ok=True)
    info = project_artifacts(post)
    saved: list[str] = []

    for a in info["attachments"]:
        name = os.path.basename(a["name"]).replace("/", "_")
        path = os.path.join(dest_dir, name)
        if os.path.exists(path):
            stem, ext = os.path.splitext(name)
            tag = a["url"].rsplit("/", 1)[-1].split(".")[0][:8]
            path = os.path.join(dest_dir, f"{stem}-{tag}{ext}")
        try:
            req = urllib.request.Request(
                a["url"],
                headers={"User-Agent": "Claude2Max-c74-projects-crawl/1.0"},
            )
            with urllib.request.urlopen(req, timeout=60) as resp:
                with open(path, "wb") as f:
                    f.write(resp.read())
            saved.append(path)
        except Exception as e:
            print(f"warn: download failed for {a['url']}: {e}", file=sys.stderr)

    for pid in info["mct_ids"]:
        url = f"https://cycling74.com/api/v1/patchers/{urllib.parse.quote(pid)}"
        try:
            body = fetch(url)
            data = json.loads(body)
            patch_b64 = data.get("patch")
            if not patch_b64:
                continue
            from spec2maxpat import mct_decode
            wrapped = (
                "----------begin_max5_patcher----------\n"
                + patch_b64
                + "\n-----------end_max5_patcher-----------"
            )
            decoded = json.loads(mct_decode(wrapped))
            if "patcher" not in decoded:
                decoded = {"patcher": decoded}
            path = os.path.join(dest_dir, f"mct-{pid[:12]}.maxpat")
            with open(path, "w") as f:
                json.dump(decoded, f, indent=2)
            saved.append(path)
        except Exception as e:
            print(f"warn: mct fetch/decode failed for {pid}: {e}", file=sys.stderr)

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
    g = p.add_mutually_exclusive_group()
    g.add_argument("--page", type=int, default=None,
                   help="Page number (default 1).")
    g.add_argument("--pages", type=parse_pages_arg, help="Range like 1-5 or list 1,3,5")
    p.add_argument("--detect-content", action="store_true",
                   help="Fetch each project page and tag MCT / attachment counts (slower)")
    p.add_argument("--has-content", action="store_true",
                   help="Only show projects with inline MCT or attachments (implies --detect-content)")
    p.add_argument("--has-mct", action="store_true",
                   help="Only show projects with inline MCT (implies --detect-content)")
    p.add_argument("--has-attach", action="store_true",
                   help="Only show projects with attachments (implies --detect-content)")
    p.add_argument("--topic", default=None,
                   help="Filter by forum_topic (Misc, MaxMSP, Jitter, Max For Live, RNBO, ...)")
    p.add_argument("--sort", choices=("artifact", "topic", "source", "date"),
                   default="source",
                   help="artifact: MCT/attach first; topic: by forum_topic; date: newest first; source: page order")
    p.add_argument("--download", metavar="DIR",
                   help="Download every project's inline artifacts under DIR/<slug>/. "
                        "Marks each as 'downloaded' in the state file. Implies --detect-content.")
    p.add_argument("--state", default=STATE_FILE_DEFAULT,
                   help=f"Path to state file (default: {STATE_FILE_DEFAULT}).")
    p.add_argument("--diff", action="store_true",
                   help="Only show NEW or UPDATED projects (vs state file). Implies --detect-content.")
    p.add_argument("--total", action="store_true",
                   help="Print just the total project count and per-page count.")
    args = p.parse_args()

    if args.total:
        pd = fetch_listing_page(1)
        print(f"total\t{pd.get('total', 0)}")
        print(f"perPage\t{pd.get('perPage', 10)}")
        return 0

    if args.has_content or args.has_mct or args.has_attach or args.download or args.diff:
        args.detect_content = True

    state = state_load(args.state)

    pages = args.pages if args.pages else [args.page if args.page is not None else 1]
    rows: list[dict] = []
    for pg in pages:
        try:
            pd = fetch_listing_page(pg)
        except Exception as e:
            print(f"error fetching page {pg}: {e}", file=sys.stderr)
            continue
        for r in pd.get("results", []):
            rows.append(r)

    if args.topic:
        rows = [r for r in rows if r.get("forum_topic", "") == args.topic]

    artifacts_by_slug: dict[str, dict] = {}
    posts_by_slug: dict[str, dict] = {}
    if args.detect_content:
        scanned: list[dict] = []
        for r in rows:
            slug = r["name"]
            try:
                post = fetch_project(slug)
            except Exception as e:
                print(f"warn: fetch_project failed for {slug}: {e}", file=sys.stderr)
                post = r  # fall back to listing data
            posts_by_slug[slug] = post
            artifacts_by_slug[slug] = project_artifacts(post)
            scanned.append(r)
        rows = scanned

        if args.has_mct:
            rows = [r for r in rows if artifacts_by_slug.get(r["name"], {}).get("mct_ids")]
        elif args.has_attach:
            rows = [r for r in rows if artifacts_by_slug.get(r["name"], {}).get("attachments")]
        elif args.has_content:
            rows = [
                r for r in rows
                if artifacts_by_slug.get(r["name"], {}).get("mct_ids")
                or artifacts_by_slug.get(r["name"], {}).get("attachments")
            ]

        if args.diff:
            rows = [
                r for r in rows
                if state_status(state, r["name"], r.get("modified_at")) != "unchanged"
            ]

    if args.sort == "artifact" and args.detect_content:
        rows.sort(key=lambda r: (
            not artifacts_by_slug.get(r["name"], {}).get("mct_ids"),
            not artifacts_by_slug.get(r["name"], {}).get("attachments"),
            r["name"],
        ))
    elif args.sort == "topic":
        rows.sort(key=lambda r: (r.get("forum_topic", ""), r["name"]))
    elif args.sort == "date":
        rows.sort(key=lambda r: r.get("modified_at", ""), reverse=True)
    # source: leave in source order

    if args.download:
        import os
        for r in rows:
            slug = r["name"]
            post = posts_by_slug.get(slug) or fetch_project(slug)
            info = artifacts_by_slug.get(slug) or project_artifacts(post)
            if not info["mct_ids"] and not info["attachments"]:
                state_mark(state, slug, post=post, artifacts=info, decision="enumerated")
                continue
            dest = os.path.join(args.download, slug)
            try:
                saved = download_artifacts(slug, post, dest)
                for path in saved:
                    print(f"saved\t{slug}\t{path}")
                state_mark(state, slug, post=post, artifacts=info, decision="downloaded")
            except Exception as e:
                print(f"error\t{slug}\t{e}", file=sys.stderr)
        state_save(args.state, state)
        return 0

    if args.detect_content:
        print("# status\ttopic\tmct\tattach\tslug\ttitle\twebsite_url")
        for r in rows:
            slug = r["name"]
            info = artifacts_by_slug.get(slug, {})
            status = state_status(state, slug, r.get("modified_at")) if state else "new"
            topic = r.get("forum_topic", "")
            title = r.get("title", "")
            wurl = (r.get("meta") or {}).get("website_url", "") or ""
            print(f"{status}\t{topic}\t{len(info.get('mct_ids', []))}\t{len(info.get('attachments', []))}\t{slug}\t{title}\t{wurl}")
    else:
        print("# topic\tslug\ttitle\twebsite_url")
        for r in rows:
            slug = r["name"]
            topic = r.get("forum_topic", "")
            title = r.get("title", "")
            wurl = (r.get("meta") or {}).get("website_url", "") or ""
            print(f"{topic}\t{slug}\t{title}\t{wurl}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
