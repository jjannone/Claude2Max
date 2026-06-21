# .maxhelp Corpus Insights

Discoveries from reading Cycling '74's shipped help patches (and installed
package help). Topic-organized like `c74-forum/forum_insights.md`. Entries
broadly useful enough to migrate into the reference docs are marked
**[PROMOTION-CANDIDATE]** with a target file.

See `MAXHELP_CRAWL_LOG.md` for the crawl recipe and coverage. The mechanical
attr-tally (`maxhelp_observed_attrs.json`, all patcher kinds) and the JS API
census (`maxhelp_js_api.json`) are complete corpus-wide; prose extraction is
just beginning.

The attr-tally now spans **all patcher document kinds**, not just help patches:
`.maxhelp` (5,264) + `.maxpat` abstractions/bpatchers/examples (6,498) + `.amxd`
Max for Live devices (104) = **11,866 files / 797,407 boxes / 4,201 distinct
objects**. Broadening past `.maxhelp` raised refpage-gap coverage from 323→498
objects (829→1,155 attrs) and no-refpage objects from 2,527→3,180, and put the
four silent-no-op confirmations on a ~13K-box-per-class sample. The numbers
below reflect the full patcher corpus.

---

## Attribute ground truth — the observed-attrs map

The whole-corpus attr-tally (5,264 files, 306,478 boxes, 3,496 distinct
objects) produced `maxhelp_observed_attrs.json`: for each object, the set of
attributes Cycling '74's own patches actually set, with occurrence counts.
Cross-checked against the live resolver (`refpage ∪ jbox`), three categories
emerge.

### 1. Real refpage gaps the union should fill — [PROMOTION-CANDIDATE → spec2maxpat.build_resolver]

323 objects that *have* a refpage carry ≥1 observed attribute absent from
`refpage ∪ jbox` (829 distinct). The high-frequency, clearly-real ones:

- `comment` → `linecount` (26,026×), `frgb` (foreground rgb, 2,081×),
  `presentation_linecount`.
- `message` / `umenu` → the `bgfillcolor_*` family (`bgfillcolor_color`,
  `_color1`, `_color2`, `_type`, `_autogradient`, `_proportion`, `_angle`) —
  the modern gradient-fill attribute group, set together (~3,400× on message).
- `flonum` → `format` (6,840×). `number~` → `sig`, `mode` (1,561× each).
- `inlet` / `outlet` → `index` (5,363× / 4,969×) — the inlet/outlet ordinal.
- `bpatcher` → `viewvisibility` (6,103×), `extract`.
- `panel` → `proportion` (4,598×), `pt1`, `pt2`.
- `js` → `filename` (1,764×); `jsui` → `embedstate`.
- `live.dial` → `parameter_enable` (1,702×) — i.e. the parameter system flag is
  on essentially every live.* object in the corpus.
- `style`, `linecount` recur as gaps on many text objects (`prepend`, `route`,
  `loadmess`, `loadbang`, `print`, `t`) — both are real, broadly-inherited.

**Integration:** union `maxhelp_observed_attrs.json` into the valid set so it
becomes `own refpage ∪ jbox ∪ observed-in-help`. Apply a frequency floor
(observed on ≥3 boxes) to drop one-off noise. This cuts false positives without
weakening real-error detection. See cautions below.

### 2. The 4 gate-flagged production attrs are confirmed silent no-ops — [resolved]

DESIGN_DECISIONS.md § (h) flagged `panel/locked_bgcolor`,
`number/tribordercolor`, `multislider/contrast`, `multislider/bgfillcolor` as
suspected silent no-ops (absent from refpage AND jbox). The whole-corpus tally
confirms it independently: **none of the four appears on ANY box** across 5,175
`panel` / 6,316 `number` / 1,537 `multislider` boxes in the entire help corpus.
Three independent signals (refpage, jbox, every shipped patch) all agree these
are family-resemblance guesses a prior session introduced, not refpage gaps.
The observed map will NOT mask them — exactly the desired behavior.

### 3. Objects with no enumerable refpage — observed-attrs is the sole source

2,527 of 3,496 distinct objects return `(None, "no-refpage")` from
`resolver.attrs_for` today, so the checker validates none of their attributes.
Two sub-cases:

- **Operator / abbreviation aliases counted as no-refpage** — `t`, `*~`, `+`,
  `*`, `s`, `sel`, `r`, `-`, `/`, `&`, `>>` all rank near the top of the
  "no-refpage" list, but they DO have refpages via the alias map. The cause is a
  real resolver gap (see § Resolver-integration notes). Not genuinely missing.
- **Genuinely-no-refpage package externals** — `bach.print`, `rnbo~`, `imubu`
  (127 distinct attrs!), `o.display`, `fl.tomax~`, `bach.roll` (239 distinct
  attrs!). For these the help-patch observed set is the only attribute ground
  truth in the toolkit. High-vocabulary externals (`imubu`, `bach.roll`) are
  where this matters most — no other source enumerates their attributes.

**Caution:** for no-refpage objects the observed set is a *positive allowlist
only*. Help patches don't exercise every attribute, so "not observed" does NOT
prove "invalid" — never use the observed set to FLAG attrs on a no-refpage
object, only to confirm known-good ones.

---

## Resolver-integration notes (for the payoff-#1 session)

When wiring `maxhelp_observed_attrs.json` into `spec2maxpat.build_resolver`:

1. **[PROMOTION-CANDIDATE → spec2maxpat] `attrs_for()` doesn't alias-resolve.**
   `resolve_object()` applies the operator/abbreviation alias map
   (`+`→plus, `t`→trigger, …) but `attrs_for()` calls `self._rp.lookup(name)`
   on the raw name, so `attrs_for('t')`/`attrs_for('+')` return `None` and skip
   attribute validation for every operator box in a real patch. Mirror the
   alias resolution from `resolve_object()` into `attrs_for()` so operator
   attributes get checked. (Independent of the help corpus, but surfaced by it.)

2. **Filter export/freeze artifact keys before unioning.** The tally captures
   keys RNBO-export and the freeze feature inject, which are not user-facing
   object attributes: `rnbo_serial` (6,442×), `rnbo_classname`, `rnbo_uniqueid`,
   `rnbo_extra_attributes`, `rnboinfo`, `rnboattrcache`, `rnboversion`,
   `frozen_object_attributes`, `frozen_box_attributes`. Drop any key matching
   `^rnbo` or `^frozen` at integration time. Harmless if left in (a user would
   never typo them), but they pollute the "real attributes of this object" view.

3. **Apply a frequency floor.** Use observed-on-≥3-boxes to admit an attr into
   the union; one-off keys are more likely export/version cruft than real attrs.

4. **Object-name keying matches the resolver.** The map keys objects exactly as
   the resolver looks them up: first whitespace token of `text` for `newobj`,
   else the `maxclass`. So a union is a direct `valid |= observed.get(name, {})`.

---

---

## Max JavaScript API ground truth — the JS census

`extract_js_api.py` classified 8,811 `.js`/`.mjs` files and tallied the API
surface of the **477 in-process** `js`/`v8`/`jsui` files + **20 Node-for-Max**
files (8,314 were RNBO runtime / npm libs / web assets, correctly excluded).
Everything below was extracted structurally (regex over `new X(`, `function
name(`, declarations, calls) and ranked by how many independent files use it —
**no API name was written from memory**, so this is a clean empirical record of
the real vocabulary. Output: `maxhelp_js_api.json`.

### Constructors — the Max JS host classes that actually get used

By file count: `JitterObject` (45), `Task` (36), `Dict` (25), `JitterMatrix`
(24), `Buffer` (12), `JitterListener` (10), `Global` (10), `File` (8), `Image`
(7), `MGraphics` (6). (Generic JS — `Array`, `RegExp`, `Date`, `Error`, `Map` —
also rank, as expected.) This cross-validates `JITTER_JS_PATCHING.md`: the
Jitter trio (`JitterObject`/`JitterMatrix`/`JitterListener`) dominates the host
classes, and `Task`/`Dict`/`Buffer`/`Global` are the non-Jitter mainstays.

### Lifecycle handlers — the function names a Max JS object defines

`bang` (98), `paint` (44, jsui), `onclick`/`onresize`/`ondrag`/`ondblclick`
(jsui mouse + layout), `list` (30), `anything` (29), `msg_int`/`msg_float`
(29/19), `loadbang` (24), `notifydeleted` (20), `setvalueof`/`getvalueof` (14
each — the `pattr` integration pair), `jit_matrix`/`jit_gl_texture` (13/11 —
Jitter message handlers), `onidle` (9). These are the canonical entry points;
`draw`/`drawfx` (24 each) are the jsui paint helpers.

### Globals & declarations

Called globals: `outlet` (384), `inlet` (141), `post` (83), `declareattribute`
(55), `error` (53). Top-level declarations: `outlets` (137 files), `inlets`
(118), `autowatch` (52), `inspector` (4). Confirms the converter's requirement
that `js`/`v8` specs declare `inlets`/`outlets` explicitly — that's how every
real file does it.

### Node-for-Max is a separate, tiny surface

Only 20 files import `max-api`; their handlers register via
`Max.addHandler("name", …)`. Distinct from the in-process API (no `outlet()`
global; uses `Max.outlet`/`Max.post`). Kept in its own `node_handlers` bucket.

**[PROMOTION-CANDIDATE → patching/JITTER_JS_PATCHING.md + SPEC_REFERENCE.md v8
section]:** the ranked constructor/handler/declaration lists are a
documentation-ready "this is the real Max JS surface" reference. Fold the top
constructors and lifecycle handlers into the JS guidance so future `v8` work
mirrors observed convention rather than guessing.

---

## Wiring idioms & per-object gotchas

*(Prose extraction not started — populate from core `help/max/` next session.
Mark canonical idioms [PROMOTION-CANDIDATE → patching/MAX_PATCHING.md] and
package-usage notes [PROMOTION-CANDIDATE → packages/package_objects.json].)*

## Log

- 2026-06-21: Built `extract_observed_attrs.py`; ran the mechanical attr-tally
  over the whole corpus (5,264 files). Wrote `maxhelp_observed_attrs.json` +
  `maxhelp_crawl_state.json`. Cross-checked against the resolver and recorded
  the three attribute categories above + the four integration cautions.
- 2026-06-21 (same session, extension): broadened the attr-tally to **all
  patcher kinds** — added `.maxpat` abstractions/bpatchers/examples + `.amxd`
  M4L devices (amxd via `ampf`-header strip + `raw_decode`; JSON `strict=False`
  for control-char-bearing files). Corpus 5,264→11,866 files, 3,496→4,201
  objects; refpage-gap 323→498 objects, no-refpage 2,527→3,180; 4 no-ops still
  absent on the larger sample. Built `extract_js_api.py` + `maxhelp_js_api.json`
  — empirical Max JS API census (8,811 `.js`/`.mjs` → 477 in-process + 20 node).
  Prose-insight extraction still queued (start: core `help/max/`).
