# Jitter from JS / v8 — JitterMatrix API and patterns

This file is the canonical reference for manipulating Jitter matrices inside
a `[js]` or `[v8]` object. Read it before writing any JS that reads or
writes a `jit_matrix` message — the API has several silent-failure modes
that look like working code right up until the matrix stays black.

**`js` and `v8` share the JitterMatrix API.** The differences between the
two objects (ES6+ in v8, faster autowatch, isolated contexts) do not
affect anything in this document — every constructor, method, and
property below works identically in both. Pick `v8` for new work; reach
for `js` only when modifying an existing patch that uses it.

---

## Verification discipline applies here too

The "never write API names from memory" rule from
[CLAUDE.md](../CLAUDE.md) applies to JitterMatrix as much as to any
Max object. The JS API is not in the `.maxref.xml` refpages — it's in:

- **`/Applications/Max.app/Contents/Resources/Examples/jitter-examples/javascript/video/jittermatrixtester.js`** — the canonical reference example, exercising most of the API in one file. Read this when in doubt.
- **`/Applications/Max.app/Contents/Resources/Examples/jitter-examples/audio/jitaudio2nurbs.js`** — a working "consume one matrix, produce another" pattern, short and well-commented.
- **`grep -nE 'new JitterMatrix|\.setall|\.setcell|\.getcell|outlet.*jit_matrix' /Applications/Max.app/Contents/Resources/Examples/jitter-examples/**/*.js`** — a one-liner to find every canonical usage across the bundled examples.

When you can't remember a signature, grep the bundled examples first. Do
not write a signature from training-data memory — the constructor trap
below is exactly that kind of failure.

---

## Inlet / outlet declaration

```js
inlets  = 3;
outlets = 1;
autowatch = 1;
```

**Critical distinction — `js` and `v8` declare inlet/outlet counts
differently, and getting it wrong in `v8` is a silent failure.**

| Object | How inlet/outlet counts are set | Script globals (`inlets =`, `outlets =`) |
|---|---|---|
| `js`  | From the script's `inlets = N` / `outlets = N` globals AND the box's saved `numinlets` / `numoutlets`. Both must match. | Honored. |
| `v8`  | From the **box-text instantiation args**: `[v8 <filename> <outlets> <inlets>]` — first int is outlets, second is inlets. | **IGNORED.** |

Per the official v8 reference (https://docs.cycling74.com/reference/v8/),
v8 reads the inlet/outlet count from the box's text arguments, not from
the script. The default with no args is 1 outlet, 1 inlet. The box's
saved `numinlets` in the .maxpat JSON does NOT override what v8 derives
from the box text — when Max constructs the v8 from the patch, the box
text is parsed and the inlets get sized from those ints, not from the
JSON property. So a box like `[v8 bands.js]` always gets 1/1 even if
the JSON says `numinlets: 3`; the cords landing on inlets 1 and 2
silently collapse onto inlet 0, the `if (inlet === N)` branches in the
script are never taken, and the v8 produces no output forever with no
error. This was the IMMER v3 failure mode that took five debugging
rounds to find.

**For v8 with N inlets, M outlets — the box text MUST be:**

```
v8 <filename> M N
```

Note the order: **outlets first, inlets second.** For 1 outlet, 3 inlets
with `bands_to_matrix.js`:

```
v8 bands_to_matrix.js 1 3
```

In a Claude2Max spec, this is the `text` field, not an `attrs` override:

```json
"v8_band_composer": {
  "type": "newobj",
  "text": "v8 bands_to_matrix.js 1 3"
}
```

The script's `inlets = 3 / outlets = 1` globals can stay at the top of
the file as self-documentation but they have no runtime effect in v8.

(For `js` the older pattern still applies: declare `inlets = N` in the
script AND set `attrs.numinlets` in the spec; both must agree because
js sizes the inlets from the box JSON and reads the globals at
script-load time. The two engines are converging — Cycling '74 has
stated that v8 will eventually be the drop-in replacement for js — but
until then the inlet-declaration mechanism is the load-bearing
difference between them.)

Inside any handler function, the global **`inlet`** tells you which
inlet the message came in on:

```js
function jit_matrix(name) {
  if (inlet === 1) { /* matrix from inlet 1 */ }
  else if (inlet === 2) { /* matrix from inlet 2 */ }
}
```

This is the right way to distinguish multiple matrix sources — NOT by
checking `name`. The patch topology (one source per inlet, per the
`jit_matrix`-fan-in rule in [MAX_PATCHING.md](MAX_PATCHING.md)) is the
contract; `inlet` is how JS sees that contract.

Message dispatch by leading symbol is automatic: a `bandcount 5`
message calls `function bandcount(n)`; a `fade 0.4` calls
`function fade(a)`; a `jit_matrix foo` calls `function jit_matrix(name)`.
For symbol-tagged control messages (`bandcount`, `fade`) arriving from a
`route` outlet, you must `[prepend …]` between the route and the JS
inlet to re-attach the symbol — `route` strips the leading selector
before forwarding.

---

## Constructor — the most common silent-failure source

JitterMatrix has three real constructor forms. They look interchangeable
and are not.

### Form 1 — create an anonymous matrix

```js
var m = new JitterMatrix(planecount, type, dim_x, dim_y /*, dim_z, ... */);
```

Examples (verified against bundled examples):

```js
var outmatrix = new JitterMatrix(3, "float32", 66, 4);         // jitaudio2nurbs.js
var m         = new JitterMatrix(3, "float32", 10, 10, 11);    // jittermatrixtester.js (3D)
var rgb       = new JitterMatrix(3, "char", 1, 480);           // 1-column band texture
```

`type` is the literal string `"char"`, `"long"`, `"float32"`, or
`"float64"`. Dim values are passed as separate positional args, NOT as
an array. The matrix gets an auto-generated `.name` — globally unique,
suitable for `outlet(0, "jit_matrix", m.name)`.

### Form 2 — bind to an existing named matrix

```js
var src = new JitterMatrix(name);   // name is a string
```

Use this inside a `jit_matrix` handler to get a JS view of the matrix
that just arrived. The dim, planecount, and type are read from the
already-existing peer.

### Form 3 — empty, then configure

```js
var m = new JitterMatrix();
m.planecount = 4;
m.dim        = [100, 100];
// m.type defaults to "char"; assign if you want something else
```

Useful when planecount or dim depends on runtime state and can't be
known at construction time.

### The trap

```js
// WRONG — looks like Form 1 with a name added, but is not a real form.
var m = new JitterMatrix("immer_bands_mat", 3, "char", 1, 480);
```

JS interprets this as Form 2 (the first string is a binding name) and
**silently ignores everything after it.** No exception, no `post`
warning. The resulting `m` is bound to a (probably nonexistent) named
peer with default planecount/type/dim. Every subsequent `setall` /
`setcell2d` operates on that empty peer, so the matrix stays black AND
the `outlet(0, "jit_matrix", m.name)` emits the wrong shape — downstream
consumers fail with no diagnostic.

**The correct pattern: don't try to rename. Use the auto-generated name.**

```js
var m = new JitterMatrix(3, "char", 1, 480);
// m.name is auto-assigned to a globally-unique symbol (e.g. "u012345678").
// Use it as-is when outletting downstream — every consumer can resolve it.
outlet(0, "jit_matrix", m.name);
```

**A second silent-failure trap: assigning `.name` after construction REBINDS the JS handle, it does not rename the peer.** Per the Jitter JS reference, `.name` is read/write and the setter is documented as "bind to or create" a named matrix. Assigning `m.name = "my_name"` after construction makes the JS handle `m` point at a (newly-created, empty) peer with that name; the original peer's data is now unreachable through `m`. Every subsequent `setall` / `setcell2d` paints into the empty peer with no error, and `outlet(0, "jit_matrix", m.name)` emits the new (empty) peer's name to downstream consumers. They look it up, find an empty matrix, render nothing. Symptom: identical to the constructor-name trap — black output, no console error.

Bundled examples confirm the safe pattern: `jittermatrixtester.js` and `jitaudio2nurbs.js` never assign `.name` on a constructed matrix. They use Form 3 (`new JitterMatrix()` then set `planecount` / `type` / `dim`) or Form 1 (positional), and always reference the auto-name in `outlet` calls.

**If a downstream object references the matrix by a stable name** (e.g. `jit.gl.cornerpin @texturename foo`), the right way is to bind the JS handle to that existing named peer up-front via Form 2 (`new JitterMatrix("foo")`), not to construct anonymously and try to rename.

---

## Properties

After construction, every JitterMatrix exposes:

| Property | Type | Notes |
|---|---|---|
| `m.name` | symbol | Globally unique. Settable. |
| `m.planecount` | int | Settable; resizes the matrix. |
| `m.type` | symbol | `"char"`, `"long"`, `"float32"`, `"float64"`. |
| `m.dim` | array of ints | E.g. `[1, 480]` for a 2D matrix. Settable: `m.dim = [w, h]`. |

The `dim` property is an array, not a method. Index it: `m.dim[0]`
(x), `m.dim[1]` (y).

To copy the shape of an incoming matrix:

```js
m.setinfo(src.planecount, src.type, src.dim);
```

`setinfo` resizes in one call. Cheaper and less error-prone than
setting each property individually when re-shaping per frame.

---

## Reading cells

```js
// Multi-plane matrix (≥2 plane): returns an array of plane values.
var c = src.getcell2d(x, y);
// c[0], c[1], c[2] for a 3-plane matrix.

// 1-plane matrix: returns the scalar value directly.
var w = src.getcell2d(x, y);
// w is a number — use it directly, NOT w[0].
```

For 1D matrices, `getcell(i)` is sufficient. For 3D, `getcell3d(x, y, z)`.

**The return shape depends on planecount** — this is the silent failure
mode that costs the most time. Per the canonical 1-plane example
`/Applications/Max.app/Contents/Resources/Examples/jitter-examples/javascript/other/jstable.js`,
every `getcell(i)` on a 1-plane matrix is treated as a scalar throughout
(`outlet(0, p)`, `total += getcell(i)`, etc. — no indexing). For multi-plane
matrices the canonical pattern is an array (see `jittermatrixtester.js`).
**Verify the planecount of the source matrix and choose accordingly.**

Indexing a scalar with `[0]` returns `undefined` — and `undefined` silently
poisons any downstream arithmetic into `NaN`. The visible symptom is one
level removed from the bug: a `Math.max(EPS, undefined) = NaN`, `total +=
NaN = NaN`, `Math.round(NaN) = NaN`, `for (y = 0; y < NaN; y++)` never
enters its body, no `setcell2d` is called, the output matrix stays at
whatever was last written (often the initial `setall(0)`) — and downstream
consumers render black with no JS exception. The fix in the calling code
is either to know the planecount up-front, or to handle both shapes:

```js
var w = src.getcell2d(0, j);
widths[j] = (typeof w === "number") ? w : w[0];
```

Reading many cells in a loop is slow because every call crosses the JS
↔ Jitter boundary. For per-pixel work on a matrix larger than ~1k
cells, push the work into `jit.gen` / `jit.gl.pix` instead.

---

## Writing cells

Two equivalent forms:

```js
m.setcell2d(x, y, v0, v1, v2);             // modern, recommended
m.setcell(x, y, "val", v0, v1, v2);        // legacy, still supported
```

For 1D: `setcell(i, "val", v)` or `setcell2d(0, i, v)`.
For 3D: `setcell3d(x, y, z, v0, v1, v2)`.

`setall` fills every cell:

```js
m.setall(0);                       // every cell, every plane → 0
m.setall(v0, v1, v2);              // per-plane fill (3-plane example)
```

Both forms are documented; the single-value form is the safest cross-
version idiom for clearing to a uniform colour or zeroing the buffer.
For multi-plane fills with distinct per-plane values, the variadic
form works on current Max.

When you write to a matrix and want downstream consumers to see the
change, you must emit it. Writing to the matrix in place does not
re-trigger the GL chain — `outlet(0, "jit_matrix", m.name)` does.

---

## Emitting matrices downstream

```js
outlet(0, "jit_matrix", m.name);
```

This is the only way to push the matrix through the patch. The first
arg is the outlet index; the second and third together form the Max
message `jit_matrix <name>`.

Three things downstream:

1. The receiving object looks up the matrix by `name` and reads its
   contents. There's no copy — the JS-side matrix and the receiver are
   the same peer.
2. If the receiver is a `jit.gl.*` object with
   `<jittermethod name="jit_matrix" />` in its refpage, the matrix is
   auto-uploaded to GL on receipt. (See the "matrix vs texture
   ingestion" rule in [MAX_PATCHING.md](MAX_PATCHING.md).)
3. If the receiver is another `jit.matrix` box, you can chain through
   it for resampling — that's the canonical upscaler pattern: small
   matrix → `[jit.matrix N type W H @adapt 0 @interp 0]` → consumer.

---

## Canonical "consume a matrix, paint and emit another" template

```js
inlets    = 2;
outlets   = 1;
autowatch = 1;

// Output matrix — Form 1 (anonymous, auto-named). Do NOT assign
// `out.name = …` after construction; the setter rebinds the handle
// to a different peer rather than renaming this one.
var out = new JitterMatrix(3, "char", 1, 480);
out.setall(0);                         // start with a clean (black) frame

function jit_matrix(name) {
  try {
    var src = new JitterMatrix(name);  // Form 2 — bind to incoming
    // Read src via getcell2d / process / write to out via setcell2d.
    // … per-cell work here …
    outlet(0, "jit_matrix", out.name);
  } catch (e) {
    post("script error: " + e + "\n"); // visible failure in Max console
  }
}
```

Save as a `.js` file next to the patch; reference from the patch as
`[v8 myscript.js]` with `autowatch 1` (now the default in v8 9+) so
edits hot-reload.

---

## Common pitfalls — silent failure modes

- **Constructor-form-2-with-extra-args:** see the constructor trap above. Always the first thing to check when matrix writes appear to do nothing.
- **`setcell2d` with wrong arity** for the planecount (e.g. 3 plane values into a 4-plane matrix) silently zeroes the missing planes. Verify `m.planecount` before writing.
- **Forgetting to `outlet`** after modifying the matrix. In-place edits don't trigger downstream rendering — the explicit `outlet(N, "jit_matrix", m.name)` is required per frame / per change.
- **Emitting a non-existent name.** If you build the outlet's name string from a property that's empty (`undefined`, `""`, etc.), Max silently drops the message. `post(name)` before emitting if you're unsure.
- **Plane-dependent `getcell` / `getcell2d` return shape.** 1-plane matrices return a scalar; multi-plane matrices return an array. Indexing a scalar with `[0]` returns `undefined`, which silently propagates as `NaN` through any arithmetic and breaks the consumer loop with no error. See the "Reading cells" section above for the defensive `typeof w === "number" ? w : w[0]` pattern and the worked symptom chain (matrix stays at the initial `setall(0)`; downstream renders black; no JS exception).
- **`autowatch = 1` reloads the script but does not re-fire `loadbang` or run an `init()` you wrote.** If you depend on a setup step (creating the output matrix, seeding state), do it at the top of the file outside any function so it runs on every reload.
- **Peer leaks across reload.** v8 reload re-runs the top of the file, which creates a new `JitterMatrix` peer each time. The old peer is garbage-collected eventually. For matrices touched ≤30 Hz this is fine; for tight loops creating per-call matrices, call `m.freepeer()` to release explicitly.

---

## When NOT to use JS for matrix work

Reach for `jit.gen` / `jit.gl.pix` instead when:

- The work is per-cell on a matrix larger than ~1k cells. The JS ↔ Jitter boundary is the bottleneck; gen runs on the GPU.
- The work is fundamentally a shader (per-pixel sampling, distance fields, blending). See `patching/JIT_GEN_PATCHING.md`.
- You need 60+ Hz rendering with non-trivial per-pixel logic. JS plus `setcell2d` won't keep up; gen will.

Reach for `[jit.expr]` instead when:

- The operation is a closed-form expression on every cell (`norm[0] * 2 - 1`, `sin(cell[0] * 0.1)`, etc.). One box, no scripting, runs in C.

Reach for `jit.fill` / `jit.repos` / `jit.submatrix` etc. instead when:

- You're loading a Max list into a matrix, copying a region, or remapping coordinates. The native objects are faster and don't require a JS box.

JS / v8 is the right tool when the matrix is small (≤1k cells), the
logic is non-trivial (multiple cached state vars, branching, message
dispatch), and the cadence is event-driven rather than per-frame.
