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

*Extracted from core `help/max/` (2026-06-27). Each entry is confirmed from
the `.maxhelp` text; nothing written from memory. Mark promotion candidates
with target file.*

---

### Timing & clock

**`metro` — transport sync and musical time**

- `metro 4n @active 1` — ties the metro to the global transport and fires in
  quarter notes. All Max time-format strings (`4n`, `1.2.12`, `0:0:2.500`)
  work as the interval argument. Passing `@active 1` makes it start
  automatically when the transport starts without a separate `start` message.
- `metro @defer 1` — pushes metro bangs to the low-priority queue, avoiding
  audio-scheduler conflicts. `qmetro` is NOT a separate class; it is exactly
  `metro @defer 1` and the help patch says so. Always use `qmetro` in code
  documentation or comments where you'd say "low-priority metro" — never say
  "the qmetro class" as if it differs from metro.

**`clocker` — elapsed time output companion to metro**

- `clocker 1000` — driven by the same transport or by `bang`, outputs elapsed
  ms since last `reset`. The interval arg sets the meter denominator.
  `reset` resets the counter only (doesn't stop); `stop` stops output.
- Float arg form: `clocker 4n` — tempo-relative, same time-format as metro.
  Works alongside `bbus`-based timing.

**`delay` vs `pipe`**

- `delay` — delays a single bang by N ms; input in the right inlet sets the
  time. Accepts tempo-relative time strings when transport is running.
- `pipe` — delays full lists (and any message type). Separate right inlet for
  each list slot plus a time inlet. Key distinction: `pipe` can delay
  heterogeneous lists (`pak 0 0. s` → `pipe 500`); `delay` only delays bangs.
- **`pipe` + `coll` for arbitrary-data delay** (from help patch "DelayAnythingWithAnyLength"):
  send data to `coll` indexed by a counter; delay only the counter index
  through `pipe`; on the delayed bang, retrieve from `coll` by that index.
  This pattern handles variable-length lists or any data type that `pipe`
  can't accept natively.
- `pipe @quantize 4n` — quantizes pipe's output to the next beat boundary.

**`defer` / `deferlow`**

- `defer` — moves a message from the audio-rate scheduler to the main
  low-priority thread. This reverses output ordering: if you `trigger b b`
  and only the left outlet goes through `defer`, the deferred branch fires
  AFTER the un-deferred branch even though `trigger` fires left-to-right.
  Use `defer` anywhere a buffer or audio operation (like `waveform~`) must
  receive a message from an audio-thread callback.
- `deferlow` — very low priority; fires after ALL pending low-priority events
  (including `defer`). Use when order-of-operations with multiple deferred
  sources matters. The help patch shows: a `uzi 64 → t l l → deferlow` pair
  — both arms fire but `deferlow`'s arm always arrives after all 64 triggers'
  left-arm output.

---

### Fan-out & sequencing

**`trigger` — right-to-left fire order, constant injection**

- Outlets fire **right-to-left**: the rightmost argument outputs first.
  Reading `t b l` left-to-right, the LAST symbol fires first. This is the
  single most commonly misunderstood rule in Max. When you need "do A then B",
  A's outlet goes RIGHTMOST. Example: clear a menu then fill it: `t l b` —
  outlet 1 (`b`, rightmost, fires first) → clear; outlet 0 (`l`) → fill.
  **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md Common Pitfalls — already present; reinforce with the menu example]**
- Constant values in trigger arguments inject that constant into the output
  chain: `t b -0.125` outputs bang (right, first) then the constant `-0.125`
  (left, second). Used to inject offsets, seeds, or state-resets mid-chain
  without extra message boxes.
- `bangbang` / `bb` — trigger with all-bang outlets. `b 3` = three bang
  outlets. Cleaner than `t b b b` when only bangs are needed.

**`gate` vs `switch`**

- `gate N` — one inlet routes to one of N outlets. `gate N 2` sets outlet 2
  open at load (2-indexed from 1). Sending `0` closes all outlets. Passes
  ALL message types, not just bangs. Right-most-always idiom: the "outlet
  select" message arrives at the left inlet; data at the right.
- `switch N` — opposite of gate: selects ONE of N data inlets and routes it
  to the single outlet. Use switch when you have N sources and want to monitor
  or route one at a time; use gate when you have one source and want to
  distribute it conditionally.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md preferred-objects table]**:
  explicitly distinguish gate and switch — their names are confusing (gate =
  distributor, switch = selector) and beginners often reach for the wrong one.

---

### Routing

**`route` — type dispatch and `set`-message stripping**

- `route int float list` — dispatches by **message type**, not value. Useful
  for making an object handle ints, floats, and lists through different
  signal chains without explicit `zl.len`/`type-check` logic.
- `route set` — strips the `set` selector from a `set N` message and outputs
  just the bare int/float. Pattern: UI sends `set 42` to update a number box
  without triggering output; `route set` can intercept and re-emit the value.
- Multiple matches are possible when mixing type names and symbol names.
- `routepass` variant: unmatched messages pass through to ALL outlets
  (including match outlets), not just the rightmost "else" outlet. Use when
  you want both a specific branch AND pass-through.
- Shorthand: `sel` = `select`; these are different from `route`:
  `select`/`sel` matches on value (int or float or symbol); `route` matches
  on the leading selector symbol or message type.

**`select` — float fuzzy matching**

- `@fuzzy 0.001` attribute — essential when the input comes from a UI object
  (dial, slider) that outputs long floating-point values like `0.14999999`.
  Without `@fuzzy`, `select 0.15` misses those inputs. The help patch calls
  out this exact failure. Always add `@fuzzy 0.001` when using `select` with
  float values from UI sources.
- `@matchfloat` attribute also affects float-matching behavior.
- Right inlet sets the match value at runtime (same as `set` message).

---

### List construction & manipulation

**`pack` / `unpack` — inlet-type conversion rules**

- Each inlet's type is set by its **creation argument**, not by what arrives.
  An `int` inlet silently **truncates floats** to int. A `float` inlet
  promotes ints to float. A `symbol` inlet only passes symbols.
- `set` message updates the FIRST element without triggering output. Use this
  with `trigger` to update and then fire: `t i i → [set $1] → pack`.
- `nth $1` message — outputs only the Nth element from the assembled list.
  Useful for extracting a single slot without unpacking the whole list.
- Right inlets store values; ONLY the left inlet also causes output.
- **Conversion cheat-sheet** (from help patch): int inlet: float→truncated,
  symbol→blank; float inlet: int→promoted, symbol→blank; symbol inlet: int
  and float→blank, only symbols pass through.

**`iter` and `uzi`**

- `iter` — explodes a list into individual items fired synchronously.
  "Can be used to play chords from lists" — each item goes downstream in
  sequence within the same scheduler tick.
- `uzi N` — fires N bangs synchronously (like iter but for bangs). Second
  arg sets the base index of the counter outlet. `break` pauses mid-run;
  `resume` continues. Carry outlet fires when the last bang fires.

**`append` / `prepend`**

- `append` adds words at the END of the incoming message; `prepend` adds at
  the START. Both use `set` to change their word(s) at runtime.
- `prepend` is the canonical way to build selector-prefixed messages from
  UI output: `prepend setport` turns an int into `setport N`. This is the
  main plumbing pattern for driving `[node.script]` and similar objects.

**`sprintf`**

- `symout` as the first argument makes `sprintf` output a single symbol
  instead of a parsed list: `sprintf symout %s%i` joins a symbol and int
  into one concatenated symbol. Critical for file paths and OSC addresses
  where spaces would split the output into a list.
- Use `%ld` for integers (not `%d`) — Max's sprintf is C-style; `%d` may
  produce unexpected results on 64-bit.
- `%c` converts ASCII codes to characters: `76 79 86 69` → `LOVE`.
- For building file paths: chain `sprintf symout %s%s`, then `prepend open`
  to produce `open MyHD:/Folder/file.aiff`. Don't try to build the path in a
  message box with a `$1` — use sprintf to assemble it first.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md Common Pitfalls]**: When
  building selector-prefixed paths (e.g. `open <path>`), use `sprintf symout`
  to produce a single symbol, then `prepend open`. Using a message box
  `open $1` works only if the path is a single symbol with no spaces.

**`tosymbol` / `fromsymbol`**

- `tosymbol` — concatenates a list into a single symbol. Default separator is
  none (items glued together). `separator /` attr inserts `/` between items;
  `separator` with no args removes all spaces; `separator " "` restores
  space as separator. Use for building OSC address strings from multiple path
  segments.
- `fromsymbol` — splits a symbol at the separator character (default: space).
  `@separator /` splits paths: `/my_device/param/42` → list. Use to parse
  incoming OSC addresses or colon-separated identifiers like MAC addresses
  (`separator :`).

---

### Data storage

**`coll` — core patterns**

- `refer <name>` — redirects the coll to a differently-named coll. All
  subsequent read/write operations apply to the new name. Pattern: share
  data between multiple coll objects by giving them the same name, or switch
  between datasets by `refer`-ing.
- Symbol association: `assoc <symbol> <index>` binds a symbol to a numeric
  index; `symbol <sym>` then retrieves as if you sent the integer. `deassoc`
  removes the binding. `subsym <old> <new>` replaces one symbol alias with
  another. These are the only ways to use non-numeric keys in a coll.
- `swap 1 2` — exchanges data at two indices without temp storage.
- `renumber` — renumbers from 1 sequentially; `renumber N` starts from N.
  Use after gaps in the index space accumulate.
- `sort 1` — sorts entries by first element of their value list.
- File I/O: `read`/`readagain`/`write`/`writeagain`. Named colls (creation
  arg) that set `@savemode 1` are saved with the patcher. Colls backed by
  a file can be edited in Max's external text editor (Inspector → "Open in
  Text Editor" affordance).
- `open` opens the built-in coll editor window (like double-clicking).

**`dict` — nested access and embedding**

- `::` double-colon for nested key access: `get wheels::front::spokecount`.
  Arbitrary depth. No whitespace in key strings.
- `[N]` for array elements: `get drivetrain::cassette::cogs[2]`. Indexing
  starts at 0. Set with `set drivetrain::cassette::cogs[9] 25`.
- `gettype <key>` — returns the type of the value at a key (`integer`,
  `float`, `symbol`, `list`, `dictionary`).
- `getsize <key>` — returns the number of elements at a key (array length
  or 1 for scalars).
- `@embed 1` — dict content is saved with the patcher (not in a separate
  file). **[PROMOTION-CANDIDATE → SPEC_REFERENCE.md dict attrs]**: `@embed`
  is the primary way to ship initial data with a patch.
- Setting a nested dict from another named dict: `set wheels::bob dictionary nouns`
  — inserts the dict named "nouns" as a sub-dict under `wheels::bob`.
- Complex structures (arrays of dicts) are better accessed in `[v8]`/`[js]`
  than in a patcher: the help patch says "Accessing complex structures such as
  arrays of dictionaries is best done using the js object."
- `combine` — merges two dicts; `@triggers 0 2` controls which inlets trigger
  output. The argument convention is "outlet triggers on inlet N" — read the
  refpage before using, as the numbering is not obvious.

**`table` — traversal messages and second outlet**

- `prev` / `next` — retrieve the previous or next value without sending an
  explicit index. Companion to `goto N` which sets the current index.
- `goto 0` + repeated `next` bangs = sequential dump without using `dump`.
- `inv $1` — inverse lookup: returns the FIRST index whose value is greater
  than the argument. Use for threshold-crossing detection.
- `dump` — outputs all values as a sequence of ints (index not included).
  `length` outputs the table size; `sum` outputs the sum of all values.
- **Second outlet** — bangs whenever the user changes a value in the table's
  editor window. Wire this to a `print` or save-trigger so UI edits don't
  silently fail to propagate.
- Named tables share data (two `table myTable` objects see the same values).
  `refer` redirects at runtime.

**`value` / `pv` — scoped shared state**

- `value` / `v` — global (patch-wide) shared scalar storage. All `value foo`
  objects in the entire Max environment share the same value. Ints, floats,
  lists, and symbols. Creation arg initializes: `value foo 60 70 80` initializes
  to the list `60 70 80`. Bang recalls current value.
- `pv` — patcher-scoped: `pv public` crosses to parent/sibling patchers;
  `pv private` stays inside the current patcher. Same storage model as value,
  but scoped. Creation args initialize; `status` message reports all linked
  objects. Use `pv` over `value` whenever the scope should NOT be global.
- **[PROMOTION-CANDIDATE → preferred-objects table in CLAUDE.md]**: add `pv`
  as the preferred choice over `value` when sharing state within a subpatcher;
  use `value` only when truly global state is needed.

---

### Initialization

**`loadbang` and `loadmess`**

- `loadbang` — fires at patcher load. Double-clicking (or banging) also fires.
  Shift-Cmd (Mac) / Shift-Ctrl (PC) disables loadbang firing at load — useful
  for testing patches without triggering initialization.
- `loadmess <value>` — outputs a message at load. `loadmess 42` outputs the
  int 42; `loadmess 3.14 22` outputs the list; `loadmess cycling 74 9` outputs
  the symbol-headed list. Bang also triggers output (same as double-click).
  Use `loadmess` over `[loadbang] → [message <val>]` chains — one object.

**`change` — value filtering and direction**

- `change` — only passes a value when it DIFFERS from the previous one.
  Second outlet fires on nonzero→zero transition; third on zero→nonzero.
- `change 0.` (float arg) — enables float change detection.
- `change +` / `change -` — directional modes. `+` outputs 1 when increasing;
  `-` outputs -1 when decreasing. Wire to `sel 1` / `sel -1` for rise/fall
  edge detection.
- `set N` — stores N without output, setting the baseline for comparison.

**`onebang` — first-pass gate**

- Passes only the FIRST bang after a right-inlet reset. Subsequent bangs go to
  the right outlet until a reset arrives. Right outlet fires when a non-first
  bang arrives with no pending reset.
- `onebang 1` — auto-resets after each pass (effectively the same as `change`
  for bangs but with an explicit blocking output).
- Canonical use: "detect the first time middle C is played; ignore subsequent
  occurrences until reset" — the help patch shows exactly this.

---

### Output & debugging

**`print`**

- Label arg distinguishes outputs in the Max console: `print label` prefixes
  every line with `label:`. Essential for multi-print patches.
- `@popup 1` — opens a local floating window instead of the console. Use for
  debugging inside a presentation where the console isn't visible.
- `@time 1` — prepends the scheduler time to each line.
- `@deltatime 1` — prepends time elapsed since the last message. Use for
  timing profiling.
- `@floatprecision N` — sets the float precision for display.
- **[PROMOTION-CANDIDATE → patching/MAX_PATCHING.md]**: `@popup 1` is the
  debug idiom for patches where the console isn't accessible. Suggest it
  as the first debug step in any presentation-mode context.

---

### Send / receive scope

**`send` / `receive` and dynamic naming**

- `r` / `s` — shorthand aliases for receive/receive. Both are unambiguous.
- `receive` without a creation arg grows an **inlet** that accepts a `set <name>`
  message at runtime to change which sender it's listening to. Same for `send`.
  Pattern: `[umenu] → [prepend set] → [receive]` to dynamically switch
  which send/receive bus a receiver monitors.
- `send` / `receive` are patcher-global (visible to all patchers in the same
  Max environment); they do NOT scope to the containing subpatcher.

---

### Number box (`number`)

- `min N` / `max N` — set bounds; `min` / `max` (no args) removes them.
- `set N` — stores value without output (no bang from the right outlet).
- Tab outlet — fires when the user presses Tab while the number box is
  selected. Wire to `select` objects to chain tab focus across number boxes.
- Format inspector options: Decimal (int/float), Roland Octal — set in the
  Inspector, not via messages. The `@format` attribute controls this (also
  confirmed by the attr-tally: `format` appears 6,840× on `flonum` in the
  help corpus).

## Log

- 2026-06-27: Prose-insight extraction pass 1 — core `help/max/` foundational
  objects. Read and extracted from 20+ help patches: metro/qmetro/clocker,
  delay/pipe/defer/deferlow, trigger/bangbang/gate/switch, route/select,
  pack/unpack/iter/uzi/append/prepend/sprintf/tosymbol/fromsymbol,
  coll/dict/table/value/pv, loadbang/loadmess/change/onebang, print, number,
  send/receive. Wrote structured per-object notes with PROMOTION-CANDIDATE tags
  for entries that belong in MAX_PATCHING.md or CLAUDE.md. crawl_state not
  yet updated (pending commit).

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
