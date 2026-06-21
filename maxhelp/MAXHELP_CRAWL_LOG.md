# .maxhelp Corpus Crawl Log

Tracks progress of the `.maxhelp` corpus crawl — reading the help patches
Cycling '74 ships with Max (and every installed package) to extract canonical
usage: which attributes/messages each object *actually uses*, real wiring
idioms, default box sizes, and per-object gotchas. Each session reads this log
to see what's covered, picks the next chunk, extracts insights into
`maxhelp_insights.md`, and updates this log.

Mirrors the `c74-forum/` / `cookbook/` / `c74-projects/` crawl pattern. See
`TASK_QUEUE.md` ("`.maxhelp` Corpus Crawl") for the full rationale.

## Why a help patch is high-signal

A `.maxhelp` is Cycling '74's authoritative demonstration of how an object is
*meant to be used* — higher-signal than the refpage for **usage**. The refpage
*lists* an object's attributes and messages; the help patch *shows* the
canonical wiring, the defaults, and the combinations. Three payoffs:

1. **Strengthens the anti-guessing attribute gate.** The checker's valid set is
   `own refpage ∪ jbox`. Object-specific attrs that an object genuinely supports
   but its refpage under-documents are a residual gap. The set of attributes
   *actually set on each object across all help patches* is a data-driven,
   authoritative supplement: `own refpage ∪ jbox ∪ observed-in-help`.
2. **Feeds `packages/package_objects.json` `use_when`** with real usage patterns
   for package externals.
3. **Adds canonical idioms** to `patching/MAX_PATCHING.md`.

## Corpus

Four document families across three roots (counts confirmed 2026-06-21).
Patcher documents (`.maxhelp` / `.maxpat` / `.amxd`) feed the observed-attrs
tally; JavaScript (`.js` / `.mjs`) feeds the separate API census.

| tier | root |
|---|---|
| `core` | `/Applications/Max.app/Contents/Resources/C74/help` |
| `bundled-packages` | `/Applications/Max.app/Contents/Resources/C74/packages` |
| `user-packages` | `~/Documents/Max 9/Packages` |

Patcher counts: **5,266 `.maxhelp`** (973 + 1,131 + 3,162), **6,502 `.maxpat`**
(abstractions / bpatchers / examples; 42 + 782 + 5,678), **105 `.amxd`** (Max
for Live devices). JS counts: **8,690 `.js`** + **127 `.mjs`** — but only ~497
are real Max-JS (477 in-process `js`/`v8`/`jsui` + 20 Node-for-Max); the rest
are RNBO runtime exports, Node libraries, and web assets (correctly excluded
from the API tally).

`.maxhelp` / `.maxpat` are plain `.maxpat` JSON — box-walk (`json.load` → recurse
`patcher.boxes`, incl. nested `patcher`). `.amxd` prefixes the JSON with an
`ampf` binary header; the extractor finds the first `{` and `raw_decode`s one
object. JSON is parsed with `strict=False` because Max patchers legitimately
carry raw control characters in string values. No MCT decode; all local.

## Tooling — the canonical recipe

```bash
# Mechanical attr-tally over ALL patcher kinds (.maxhelp+.maxpat+.amxd, ~6s).
# Idempotent. Writes maxhelp_observed_attrs.json + maxhelp_crawl_state.json.
python3 maxhelp/extract_observed_attrs.py

# Help patches only (the original, smaller tally):
python3 maxhelp/extract_observed_attrs.py --kinds maxhelp

# Smoke test / ranked summary:
python3 maxhelp/extract_observed_attrs.py --limit 50 --summary --no-write
python3 maxhelp/extract_observed_attrs.py --summary

# Max JS API census over .js/.mjs (~2s). Writes maxhelp_js_api.json.
python3 maxhelp/extract_js_api.py --summary
```

**Reading a help patch for prose insight** (chunked work, not mechanical):

```bash
# Survey every box's text + maxclass in one help patch:
python3 -c "import json,sys; \
def w(p): \
 [ (print(b['box'].get('maxclass'),'|',b['box'].get('text','')), w(b['box']['patcher']) if 'patcher' in b['box'] else None) for b in p.get('boxes',[]) ]; \
w(json.load(open(sys.argv[1]))['patcher'])" \
  /Applications/Max.app/Contents/Resources/C74/help/max/<obj>.maxhelp
```

For non-obvious objects, open the help patch in Max — the comments and bpatcher
demos carry intent the JSON alone doesn't.

## State files

- `maxhelp_observed_attrs.json` — `object -> {boxes, attrs:{name:count}}` plus
  `maxclass_counts` and `_meta`. The highest-value deliverable: union into
  `spec2maxpat.build_resolver`'s valid-attr set. **Object name** = first text
  token for `newobj`, else the `maxclass` (matches how the resolver looks up).
- `maxhelp_crawl_state.json` — per-file `{tier, kind, status, boxes, objects}`.
  Status: `scanned` (attr-tallied), `analyzed` (prose-read this session),
  `skipped` (malformed/unreadable). The mechanical pass marks every file
  `scanned`; prose sessions promote files to `analyzed`.
- `maxhelp_js_api.json` — Max JS API census: `classification`,
  `constructors`, `defined_functions`, `called_identifiers`, `declarations`,
  `node_handlers`, each ranked by file count. Feeds `JITTER_JS_PATCHING.md` and
  the v8/js guidance. Regenerates from `extract_js_api.py`.

The patcher JSONs regenerate from `extract_observed_attrs.py`; the JS census
from `extract_js_api.py`. The prose `analyzed` promotion is hand-maintained as
sessions read files.

## Coverage

### Mechanical attr-tally — COMPLETE across all patcher kinds (2026-06-21)

Full patcher corpus in one pass (~6s): **11,866 scanned (5,264 `.maxhelp` +
6,498 `.maxpat` + 104 `.amxd`), 7 malformed-skipped, 797,407 boxes,
4,201 distinct objects.** (`strict=False` JSON parsing recovered 43 files that
carry raw control chars in strings; the residual 7 are genuinely empty/binary.)

Cross-check against the live resolver (`refpage ∪ jbox`): **498 objects with a
refpage carry ≥1 observed gap-attr** (1,155 distinct), and **3,180 objects have
no refpage at all** — for those the observed map is the only attribute ground
truth that exists. The 4 gate-flagged production attrs (`panel/locked_bgcolor`,
`number/tribordercolor`, `multislider/contrast`, `multislider/bgfillcolor`)
remain absent across ~13K boxes each — confirmed silent no-ops, now on a much
larger sample. See `maxhelp_insights.md` for categorized findings and the
resolver-integration cautions (operator-alias gap, RNBO/freeze artifacts,
positive-allowlist-only for no-refpage objects).

### Max JS API census — COMPLETE (2026-06-21)

`extract_js_api.py` over **8,811 `.js`/`.mjs`**: 477 in-process js/v8/jsui +
20 Node-for-Max classified as Max-relevant; 8,314 excluded as RNBO/lib/web
noise. Emits `maxhelp_js_api.json` — an empirical ranking of the constructors
(`JitterObject`, `Task`, `Dict`, `JitterMatrix`, `Buffer`, `JitterListener`,
`Global`, `File`, `Image`, `MGraphics`, …), lifecycle handlers (`bang`, `paint`,
`onclick`/`onresize`/`ondrag`, `msg_int`/`msg_float`, `list`, `anything`,
`loadbang`, `setvalueof`/`getvalueof`, `notifydeleted`, `jit_matrix`,
`jit_gl_texture`, `onidle`), globals (`outlet` 384, `inlet` 141, `post` 83,
`declareattribute` 55, `error`), and declarations (`outlets`/`inlets`/
`autowatch`/`inspector`). Names are extracted structurally and ranked by file
count — nothing hardcoded from memory.

### Prose-insight extraction — NOT STARTED

Chunk across sessions; ~50–100 files per session. Suggested order:
core `help/` → bundled `packages/` → user `Packages/`; or by object family.

## Resume point

**Next session:** begin prose-insight extraction on **core `help/max/`** —
the foundational Max objects (timing, list, routing, data). Read each help
patch's wiring and comments; write idioms + gotchas to `maxhelp_insights.md`;
promote files to `analyzed` in the state JSON as you go. Start with the
highest-traffic objects from the attr-tally summary (`metro`, `route`, `zl.*`,
`trigger`, `pack/unpack`, `gate/switch`) since their idioms recur everywhere.

**Also pending (integration, can be done independently):** wire
`maxhelp_observed_attrs.json` into `spec2maxpat.build_resolver` per the
cautions in `maxhelp_insights.md` § "Resolver-integration notes". This closes
payoff #1 and is the reason the mechanical pass ran first.

## Queue / candidate chunks

- core `help/max/` foundational objects (timing/list/routing) — **next**
- core `help/msp/` audio objects (filters, synthesis, buffer/groove idioms)
- core `help/jit/` Jitter (matrix wiring, GL pipeline demos)
- core `help/m4l/` `live.*` UI objects (parameter system, color attrs)
- bundled `packages/` — BEAP, vizzie, gen demos
- user `Packages/` — bach, FluCoMa, HISSTools, cv.jit, MuBu (feed package `use_when`)
