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

These are global assignments at the top of the file. v8 and js both
honour them; the box's `numinlets` / `numoutlets` in the .maxpat must
match (the spec wrapper / converter handles this if you declare it in
the spec, but if you hand-edit, bump both).

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

**The correct pattern: do not rename. Use the auto-generated name.**

```js
var m = new JitterMatrix(3, "char", 1, 480);   // Form 1 — anonymous
// m.name is auto-assigned a globally-unique symbol (e.g. "u012345678"),
// and every downstream consumer can resolve it.
outlet(0, "jit_matrix", m.name);
```

**Assigning `.name` after construction rebinds the handle; it does not
rename the peer.** This is the same trap one step later, and until
2026-09-15 this file recommended it. `.name` is read/write, and the
setter binds to — or creates — a matrix with that name, so
`m.name = "my_name"` leaves `m` pointing at a *different*, newly-created,
empty peer. The original peer's data is now unreachable through `m`.
Every later `setall` / `setcell2d` paints the empty peer with no error,
and `outlet(0, "jit_matrix", m.name)` hands downstream consumers the
empty one. They resolve it, find nothing, and render black. The symptom
is identical to the constructor trap above: no exception, no console
line.

Cycling '74's own shipped scripts never rename a constructed matrix:
they use Form 1 or Form 3 and pass the auto-name to `outlet`. (Checked
across the scripts in Max's `Examples/` tree, 2026-09-15. The rebinding
mechanism is inferred from that corpus and from the documented "bind to
or create" behaviour of the name setter, not from a doc page in the
local install — treat the mechanism as reasoned, the practice as
settled.)

**If a downstream object needs a stable name** (`jit.gl.cornerpin
@texturename foo`), bind to it up front with Form 2 —
`new JitterMatrix("foo")` — rather than constructing anonymously and
trying to rename.

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
var c = src.getcell2d(x, y);   // returns an array of plane values
// c[0], c[1], c[2] for a 3-plane matrix.
```

For 1D matrices, `getcell(i)` is sufficient. For 3D, `getcell3d(x, y, z)`.

**The return shape depends on planecount, and this is the costliest
silent failure in the API.** A multi-plane matrix returns an array of
plane values. A **1-plane matrix returns the scalar directly** — use it
as a number, not `c[0]`. (This file said "always an array" until
2026-09-15. Cycling '74's own 1-plane example,
`Examples/jitter-examples/javascript/other/jstable.js`, treats every
`getcell(i)` as a scalar throughout — `total += thetab.getcell(i)`,
`outlet(0, p)`, `thetab.getcell(i) >= v` — and the multi-plane
`jittermatrixtester.js` is the array case.)

Indexing a scalar with `[0]` gives `undefined`, and `undefined` poisons
the arithmetic downstream into `NaN`. The visible symptom is one step
removed from the bug: `Math.max(EPS, undefined)` is `NaN`, `total += NaN`
is `NaN`, `for (y = 0; y < NaN; y++)` never enters its body, no
`setcell2d` runs, the output matrix keeps whatever the initial
`setall(0)` left — and the render is black, with no JS exception.

Know the source's planecount, or handle both shapes:

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

// Output matrix — Form 1 (anonymous), then named for downstream lookup.
var out = new JitterMatrix(3, "char", 1, 480);
out.name = "my_output_matrix";
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
- **Type mismatch on `getcell2d` return.** For a 1-plane matrix, `getcell2d(0, i)` returns `[v]` — a one-element array, not `v`. Indexing `[0]` is required.
- **`autowatch = 1` reloads the script but does not re-fire `loadbang` or run an `init()` you wrote.** If you depend on a setup step (creating the output matrix, seeding state), do it at the top of the file outside any function so it runs on every reload.
- **Peer leaks across reload.** v8 reload re-runs the top of the file, which creates a new `JitterMatrix` peer each time. The old peer is garbage-collected eventually. For matrices touched ≤30 Hz this is fine; for tight loops creating per-call matrices, call `m.freepeer()` to release explicitly.

---

## When NOT to use JS for matrix work

**If it ends up on screen, write a shader first.** Prefer a GLSL fragment
shader through `[jit.gl.slab @file my_shader.jxs]` over a `[v8]` / `[js]`
painting the matrix cell by cell. This is the strongest of the rules in
this section; the rest are about choosing a Jitter-native object over JS
for matrix work that is not display.

- The work happens on the GPU, where the pixels are going anyway — no JS ↔ Jitter crossing per pixel, no `setcell2d` cost.
- A shader's `<param>` declarations become message-settable uniforms (`[param <name> $1]`), so the operator changes values live without touching the script. It compiles once at load and is a pure function of its uniforms after that.
- Output resolution is set on the slab (`@dim 1920 1080`), independent of the input texture. A 1×N control matrix samples correctly into full HD; texcoord interpolation does the upscale.
- The silent-failure surface is far smaller. A shader either compiles or prints a named, line-numbered error to the console. Against that, every trap in this file — the constructor name, the `.name` rebind, the 1-plane scalar return, the v8 inlet count — produces a black frame and says nothing.

The evidence is IMMER v3's bands renderer: the `[v8]` version painting a
1×480 char matrix took five rounds of debugging across several sessions,
one trap per round, and never produced output reliably. The same logic as
a `.jxs` fragment shader landed in one go.

So for work that reaches the screen, the first question is not "how do I
write this in JS?" but "can this be a shader?" For per-pixel image and
video work the answer is almost always yes.

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
