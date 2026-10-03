#!/usr/bin/env python3
"""
Enumerate the Gem documentation that ships with plugdata, plus the web pages
that carry the rest of Gem's documentation, and keep the crawl state file.

Gem (Graphics Environment for Multimedia) is the OpenGL and video library for
Pure Data. plugdata bundles it. Its Max counterpart is Jitter.

Local sources (under the plugdata folder, default ~/Documents/plugdata):

1. Documentation/14.gem/            the help patches (*-help.pd), their helper
                                    patches and shaders, and an examples/ tree
                                    that also holds the HTML manual, the FAQ,
                                    the release notes and a PDF primer.
2. Abstractions/Gem/                Gem objects that are Pd abstractions
                                    (gemhead, gemwin, gemmouse, ...).
3. Extra/Gem/                       empty in plugdata 0.9.3; listed if it ever
                                    holds files.

Web sources:

4. https://github.com/umlaeute/Gem  the upstream repository. Its file tree is
                                    read through the GitHub API. Listed from
                                    it: README.md, and every help patch,
                                    extra/ help patch and example file that is
                                    NOT in the local plugdata copy. (doc/ there
                                    is the same manual as local source 1, so it
                                    is not listed twice.)
5. https://github.com/plugdata-team/plugdata-gem   plugdata's fork (README).
6. plugdata release notes that mention Gem (GitHub API, releases list).
7. https://gem.iem.at/              Gem's home page. On 2026-10-02 it answered
                                    every request with a bot-check page, so it
                                    is listed as one entry and nothing is
                                    derived from it.

Usage:
    python3 scans/plugdata-gem/enumerate_plugdata_gem.py             # enumerate + merge
    python3 scans/plugdata-gem/enumerate_plugdata_gem.py --local-only  # no network
    python3 scans/plugdata-gem/enumerate_plugdata_gem.py --status    # counts only
    python3 scans/plugdata-gem/enumerate_plugdata_gem.py --plugdata /path/to/plugdata

The plugdata folder comes from --plugdata, else the PLUGDATA_DIR environment
variable, else ~/Documents/plugdata.

State file (plugdata_gem_crawl_state.json), a dict keyed by the path relative
to the plugdata folder (local files) or by URL (web pages):
    {"title", "path" or "url", "group",
     "status": "pending"|"extracted"|"skipped",
     "session": "YYYY-MM-DD" | null, "notes"}

Merging never touches "status", "session" or "notes" of an entry already in
the file. An entry that was in the file and is no longer found keeps its data
and gets "listed": false, so a disappearance is visible instead of silent.

Failure behaviour: if the plugdata folder or its Gem documentation folder is
missing, or a web listing cannot be fetched, the script prints the cause and
exits non-zero WITHOUT writing the state file. An empty or shrunken list is
never written in place of a failed read. With --local-only the web entries
already in the state file are left exactly as they are.

Stdlib only; runs on Python 3.9.
"""
from __future__ import annotations

import argparse
import html
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

HERE = Path(__file__).resolve().parent
STATE_FILE = HERE / "plugdata_gem_crawl_state.json"

DOC_SUBDIR = Path("Documentation") / "14.gem"
ABS_SUBDIR = Path("Abstractions") / "Gem"
EXTRA_SUBDIR = Path("Extra") / "Gem"

UA = "Mozilla/5.0 (Claude2Max doc scan; stdlib urllib)"
GEM_REPO = "umlaeute/Gem"
GEM_TREE_URL = f"https://api.github.com/repos/{GEM_REPO}/git/trees/HEAD?recursive=1"
GEM_BLOB_ROOT = f"https://github.com/{GEM_REPO}/blob/HEAD/"
GEM_SITE = "https://gem.iem.at/"
PLUGDATA_GEM_README = "https://github.com/plugdata-team/plugdata-gem/blob/HEAD/README.md"
PLUGDATA_RELEASES_API = "https://api.github.com/repos/plugdata-team/plugdata/releases?per_page=100"
PLUGDATA_DISCUSSIONS = [
    ("https://github.com/plugdata-team/plugdata/discussions/1454",
     "External (GEM) should there be Help and Reference files"),
]

MEDIA_EXT = {".jpg", ".jpeg", ".png", ".tif", ".tiff", ".gif", ".bmp", ".mov",
             ".avi", ".mp4", ".mpg", ".ttf", ".obj", ".mtl", ".tab", ".svg"}
SHADER_EXT = {".frag", ".vert", ".geom", ".fp", ".vp"}
TITLE_RE = re.compile(r"<title>(.*?)</title>", re.IGNORECASE | re.DOTALL)


class EnumError(Exception):
    pass


# --------------------------------------------------------------------------
# local files
# --------------------------------------------------------------------------

def local_group(rel: Path) -> str:
    """Group name for a file, from its path relative to the plugdata folder."""
    parts = rel.parts
    if parts[:2] == ABS_SUBDIR.parts:
        return "abstractions"
    if parts[:2] == EXTRA_SUBDIR.parts:
        return "extra"
    inside = parts[2:]  # below Documentation/14.gem
    if len(inside) == 1:
        return "help" if inside[0].endswith("-help.pd") else "help-support"
    if inside[0] == "examples":
        if len(inside) == 2:
            return "examples"
        sub = inside[1]
        if sub == "Documentation":
            if len(inside) > 3 and inside[2] == "manual":
                return "manual"
            return "docs"
        if sub == "data":
            return "example-data"
        return "examples/" + sub
    return "other"


def local_title(path: Path, rel: Path) -> str:
    name = path.name
    if name.endswith("-help.pd"):
        return name[: -len("-help.pd")]
    if path.suffix.lower() in (".html", ".htm"):
        try:
            m = TITLE_RE.search(path.read_text(errors="replace"))
        except OSError:
            m = None
        if m:
            title = re.sub(r"\s+", " ", html.unescape(m.group(1))).strip()
            if title:
                return title
    return name


def enumerate_local(root: Path) -> dict:
    """Map relative path -> entry for every file in the three Gem folders."""
    if not root.is_dir():
        raise EnumError(f"plugdata folder not found: {root}")
    doc_dir = root / DOC_SUBDIR
    if not doc_dir.is_dir():
        raise EnumError(f"Gem documentation folder not found: {doc_dir}")

    found = {}
    for sub in (DOC_SUBDIR, ABS_SUBDIR, EXTRA_SUBDIR):
        base = root / sub
        if not base.is_dir():
            # Only the documentation folder is required; say so about the rest.
            print(f"note: {base} is not present; nothing listed from it",
                  file=sys.stderr)
            continue
        for path in sorted(base.rglob("*")):
            if not path.is_file() or path.name.startswith(".DS_Store"):
                continue
            rel = path.relative_to(root)
            key = rel.as_posix()
            found[key] = {
                "title": local_title(path, rel),
                "path": key,
                "group": local_group(rel),
            }
    if not any(e["group"] == "help" for e in found.values()):
        raise EnumError(f"no *-help.pd files under {doc_dir}; refusing to "
                        "write a list without the help patches")
    return found


# --------------------------------------------------------------------------
# web pages
# --------------------------------------------------------------------------

def fetch(url: str, timeout: int = 30):
    """Return (final_url, text) or raise EnumError naming the cause."""
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            status = getattr(resp, "status", 200)
            final = resp.geturl()
            body = resp.read()
    except urllib.error.HTTPError as exc:
        raise EnumError(f"HTTP {exc.code} for {url}") from exc
    except (urllib.error.URLError, OSError) as exc:
        raise EnumError(f"{type(exc).__name__} for {url}: {exc}") from exc
    if status != 200:
        raise EnumError(f"HTTP {status} for {url}")
    if not body:
        raise EnumError(f"empty body for {url}")
    return final, body.decode("utf-8", errors="replace")


def fetch_json(url: str):
    _, text = fetch(url)
    try:
        return json.loads(text)
    except ValueError as exc:
        raise EnumError(f"not JSON at {url}: {exc}") from exc


def enumerate_web(local: dict) -> dict:
    """Map URL -> entry. Raises EnumError if a listing cannot be read."""
    found = {}

    # 4. upstream repository tree
    tree = fetch_json(GEM_TREE_URL)
    if not isinstance(tree, dict) or "tree" not in tree:
        raise EnumError(f"unexpected answer from {GEM_TREE_URL}: "
                        f"{str(tree)[:200]}")
    if tree.get("truncated"):
        raise EnumError("GitHub returned a truncated tree for " + GEM_REPO)
    blobs = [e["path"] for e in tree["tree"] if e.get("type") == "blob"]
    if not blobs:
        raise EnumError("GitHub tree for " + GEM_REPO + " lists no files")

    local_names = {Path(k).name for k in local}
    local_example_rel = {
        k.split("Documentation/14.gem/examples/", 1)[1]
        for k in local if "Documentation/14.gem/examples/" in k
    }

    found[GEM_BLOB_ROOT + "README.md"] = {
        "title": "Gem README", "url": GEM_BLOB_ROOT + "README.md",
        "group": "web-github"}
    for p in sorted(blobs):
        name = Path(p).name
        if p.startswith("help/") and name.endswith("-help.pd"):
            if name not in local_names:
                found[GEM_BLOB_ROOT + p] = {
                    "title": name[: -len("-help.pd")],
                    "url": GEM_BLOB_ROOT + p, "group": "web-github-help"}
        elif p.startswith("extra/") and name.endswith("-help.pd"):
            found[GEM_BLOB_ROOT + p] = {
                "title": name[: -len("-help.pd")],
                "url": GEM_BLOB_ROOT + p, "group": "web-github-extra"}
        elif p.startswith("examples/") and name.endswith(".pd"):
            rel = p[len("examples/"):]
            if rel not in local_example_rel:
                found[GEM_BLOB_ROOT + p] = {
                    "title": name, "url": GEM_BLOB_ROOT + p,
                    "group": "web-github-examples"}

    # 5. plugdata's fork
    found[PLUGDATA_GEM_README] = {
        "title": "plugdata-gem README", "url": PLUGDATA_GEM_README,
        "group": "web-plugdata"}

    # 6. plugdata release notes that mention Gem
    releases = fetch_json(PLUGDATA_RELEASES_API)
    if not isinstance(releases, list) or not releases:
        raise EnumError(f"unexpected answer from {PLUGDATA_RELEASES_API}")
    for rel in releases:
        body = rel.get("body") or ""
        if re.search(r"\bgem\b", body, re.IGNORECASE):
            url = rel.get("html_url")
            if url:
                found[url] = {
                    "title": "plugdata release " + (rel.get("tag_name") or "?"),
                    "url": url, "group": "web-plugdata"}
    for url, title in PLUGDATA_DISCUSSIONS:
        found[url] = {"title": title, "url": url, "group": "web-plugdata"}

    # 7. Gem's home page: one fixed entry, nothing derived from it.
    found[GEM_SITE] = {"title": "Gem home page", "url": GEM_SITE,
                       "group": "web-gem-site"}
    try:
        final, _ = fetch(GEM_SITE)
        if ".within.website" in final:
            print(f"note: {GEM_SITE} answered with a bot-check page "
                  f"({final}); it is listed but cannot be read from here",
                  file=sys.stderr)
    except EnumError as exc:
        print(f"note: {GEM_SITE} could not be fetched ({exc}); it is listed "
              "as a known URL only", file=sys.stderr)
    return found


# --------------------------------------------------------------------------
# state file
# --------------------------------------------------------------------------

def load_state() -> dict:
    if not STATE_FILE.exists():
        return {}
    with STATE_FILE.open() as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise EnumError(f"{STATE_FILE.name} is not a JSON object")
    return data


def default_status(entry: dict):
    """Files that are never documentation start out skipped, with the reason."""
    name = entry.get("path") or entry.get("url") or ""
    ext = Path(name).suffix.lower()
    if entry["group"] == "example-data":
        return "skipped", "media or data file used by the example patches"
    if ext in MEDIA_EXT and entry["group"] in ("manual", "docs"):
        return "skipped", "image used by the manual"
    if Path(name).name in ("Makefile.am", "astyle.rc", ".gitignore",
                           "COPYING.txt"):
        return "skipped", "build or licence file, not documentation"
    return "pending", ""


def merge(state: dict, found: dict, scope: str) -> tuple:
    """Merge `found` into `state`. `scope` is 'local', 'web' or 'all' and says
    which kind of existing entry may be marked unlisted."""
    added = 0
    for key, entry in found.items():
        if key in state:
            old = state[key]
            for field in ("title", "group"):
                old[field] = entry[field]
            for field in ("path", "url"):
                if field in entry:
                    old[field] = entry[field]
            old.pop("listed", None)
        else:
            status, note = default_status(entry)
            new = dict(entry)
            new.update({"status": status, "session": None, "notes": note})
            state[key] = new
            added += 1
    unlisted = 0
    for key, old in state.items():
        if key in found:
            continue
        is_web = "url" in old
        if scope == "all" or (scope == "web" and is_web) or \
                (scope == "local" and not is_web):
            if old.get("listed") is not False:
                unlisted += 1
            old["listed"] = False
    return added, unlisted


def print_status(state: dict) -> None:
    groups = {}
    for entry in state.values():
        g = groups.setdefault(entry.get("group", "?"),
                              {"pending": 0, "extracted": 0, "skipped": 0})
        g[entry.get("status", "pending")] = g.get(entry.get("status", "pending"), 0) + 1
    width = max((len(g) for g in groups), default=5)
    print(f"{'group'.ljust(width)}  listed  extracted  pending  skipped")
    tot = [0, 0, 0, 0]
    for name in sorted(groups):
        c = groups[name]
        n = c["pending"] + c["extracted"] + c["skipped"]
        print(f"{name.ljust(width)}  {n:6d}  {c['extracted']:9d}  "
              f"{c['pending']:7d}  {c['skipped']:7d}")
        tot = [tot[0] + n, tot[1] + c["extracted"], tot[2] + c["pending"],
               tot[3] + c["skipped"]]
    print(f"{'total'.ljust(width)}  {tot[0]:6d}  {tot[1]:9d}  {tot[2]:7d}  "
          f"{tot[3]:7d}")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[1])
    ap.add_argument("--plugdata", default=os.environ.get(
        "PLUGDATA_DIR", str(Path.home() / "Documents" / "plugdata")),
        help="plugdata folder (default: $PLUGDATA_DIR or ~/Documents/plugdata)")
    ap.add_argument("--local-only", action="store_true",
                    help="enumerate local files only; leave web entries alone")
    ap.add_argument("--status", action="store_true",
                    help="print counts from the state file and exit")
    args = ap.parse_args()

    try:
        state = load_state()
    except (EnumError, ValueError, OSError) as exc:
        print(f"error: cannot read {STATE_FILE.name}: {exc}", file=sys.stderr)
        return 1

    if args.status:
        if not state:
            print(f"{STATE_FILE.name} is missing or empty; run the "
                  "enumerator first", file=sys.stderr)
            return 1
        print_status(state)
        return 0

    root = Path(args.plugdata).expanduser()
    try:
        local = enumerate_local(root)
        web = {} if args.local_only else enumerate_web(local)
    except EnumError as exc:
        print(f"error: {exc}", file=sys.stderr)
        print("state file not written", file=sys.stderr)
        return 2

    found = dict(local)
    found.update(web)
    added, unlisted = merge(state, found,
                            "local" if args.local_only else "all")

    with STATE_FILE.open("w") as fh:
        json.dump(state, fh, indent=2, sort_keys=True, ensure_ascii=False)
        fh.write("\n")

    print(f"plugdata folder: {root}")
    print(f"local files: {len(local)}   web pages: "
          f"{len(web) if not args.local_only else 'not checked'}")
    print(f"new entries: {added}   no longer listed: {unlisted}")
    print_status(state)
    return 0


if __name__ == "__main__":
    sys.exit(main())
