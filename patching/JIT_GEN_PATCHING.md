# jit.gen / jit.gl.pix Patching Reference

Specialized companion to `MAX_PATCHING.md` and sibling to `GEN_PATCHING.md`.
Covers the per-cell / per-pixel flavors of the gen language family:

- **`jit.gen`** — runs the gen graph once per matrix cell on the CPU. The
  iteration variable is the cell coordinate; the output is a transformed
  matrix.
- **`jit.gl.pix`** — runs the gen graph once per output pixel on the GPU
  via shader compilation. Inputs are textures; the output is a texture.
  The same gen language; the compilation target differs.

For audio-rate / control-rate gen (`gen~` / `gen`), see
`GEN_PATCHING.md`. The two docs share the dataflow model but diverge on
iteration semantics, available operators, and timing primitives.

## What's the same as gen~

- The gen language itself: `+`, `-`, `*`, `/`, `clip`, `clamp`, `mix`,
  `abs`, `pow`, `tanh`, `floor`, `ceil`, `mod`, `wrap`, `expr`, `fixnan`,
  etc. all behave the same way.
- The graph / box / inlet / outlet model: `in N`, `out N`, `param NAME`,
  `history`, `codebox`.
- `param NAME @default V @min V @max V` exposes a parameter to the parent
  patcher; messages from outside set the param.
- `history NAME init_value` declares one-frame state with an initial
  value, same syntax as gen~.
- `fixnan` is the canonical NaN-guard after divisions / `pow` / `log` /
  `sqrt(<0)`.
- `codebox` holds inline genexpr code for state-heavy or expression-heavy
  logic, same way it works in gen~.

## What's different — iteration and timing

| Concept | `gen~` / `gen` | `jit.gen` / `jit.gl.pix` |
|---|---|---|
| Iteration unit | sample (gen~) or event (gen) | matrix cell or output pixel |
| Time identifier | `samplerate`, `1/samplerate` | none |
| Position identifier | (none — sample index implicit) | `norm` (0..1 swizzleable), `cell` (integer xy), `dim` (matrix size) |
| Inputs | scalar floats (gen~) | matrix cells / texture samples |
| Outputs | scalar floats | matrix cells / texture pixels |
| Feedback storage | `history` (per-sample) | `history` (per-frame, not per-cell) |
| Time-domain delay | `delay N` (samples) | not applicable |
| Hot reload | typically yes | yes; `jit.gl.pix` recompiles the shader |

The big shift: **there is no time inside `jit.gen` / `jit.gl.pix`** — each
invocation is independent in time. State that needs to evolve across
frames lives in `history`, exactly like `gen~`, but the unit of "one
step" is one rendered frame, not one sample.

## Position primitives

- **`norm`** — outputs a 2- or 3-vector of normalized coordinates `[0..1]`
  per axis. Swizzle with `swiz x` / `swiz y` for a single component, or
  `swiz xy` for the 2-vector. Use this when the math is resolution-
  independent (UV mapping, procedural patterns).
- **`cell`** — outputs an integer xy of the current cell coordinate.
  Useful when the math depends on absolute pixel position (per-cell
  randomness seeded by index, neighbor lookups by integer offset).
- **`dim`** — outputs the matrix's `[width, height]` (or `[w,h,d]` in 3D).
  `cell / dim` gives the same value as `norm`; the difference is whether
  you need integer pixel access alongside.

## Texture sampling primitives (jit.gl.pix only)

- **`sample <input> <texcoord>`** — bilinear texture lookup. `<input>` is
  one of `in 1`, `in 2`, ... declared at the top of the gen graph;
  `<texcoord>` is a 2-vector (`norm`, or any computed UV).
- **`sample <input> <texcoord> @rectangle 1`** — rectangle sampling
  (texel-exact addressing rather than normalized). Use when input is a
  matrix-as-texture and you want integer addressing.
- **Multi-input shaders** — declare `in 1`, `in 2`, ... in the gen graph;
  the parent `jit.gl.pix` exposes corresponding inlets that accept
  textures. Inlets bind by declaration order, mirroring the JXS
  `<param>`-order rule from `SPEC_REFERENCE.md` § Jitter Display.

## Canonical idioms

### Resolution-independent math: `norm` → process → `out 1`

```
norm → swiz xy → math → out 1
```

This is the gen-graph equivalent of "for each pixel, compute the output
from the normalized UV." Every classic procedural-graphics primitive
(circles, gradients, polar transforms, fractals, distance fields) can be
expressed this way without ever touching pixel coordinates.

### Per-cell state via `history`

```
in 1 → + → history feedback → out 1
                ↑
              <param damping>
```

`history` here stores one float per frame (not per cell — gen-graph
feedback in jit.gen / jit.gl.pix is per-output-frame, not per-cell). For
per-cell persistent state, use a feedback matrix at the patcher level:
`jit.matrix → jit.gen → jit.matrix → jit.gen` chain, where the second
matrix is the feedback target read by the next frame.

### Distance-field rendering (jit.gl.pix idiom)

```
norm → - 0.5 → length → < 0.4 → mix(bg, fg, _) → out 1
```

Compute distance from center, threshold, mix between background and
foreground. The same template generalizes to any signed-distance-field
primitive (circle, box, segment, polygon) — change the distance function,
keep the structure.

## Compilation, hot reload, and debugging

- **Edit-time compilation**: gen graphs compile when you save or change
  the patch. Errors surface in the Max console as `gen.compiler` messages
  with line numbers pointing into the genexpr text (or box label for
  graph-only patches).
- **Hot reload**: `jit.gl.pix` recompiles the GLSL shader when the gen
  graph changes; the recompilation is fast enough to be interactive.
- **Inspecting the generated code**: send the message `compile` to a gen
  box to dump the generated genexpr to the console; useful when graph
  structure produces unexpected expressions.
- **`@gen <expr>`** — inline gen expressions on a `jit.gl.pix` for short
  shaders without a separate `.gendsp` file. Good for prototypes; less
  good for anything more than ~5 lines.

## Cross-References

- **gen~ / gen (audio + control rate)** — see `GEN_PATCHING.md`. The
  shared language is detailed there; this doc handles the per-cell /
  per-pixel divergence.
- **MSP-side patterns** — see `MAX_PATCHING.md`. Anything outside the gen
  box (matrix routing, texture management, `jit.gl.layer` composition,
  shader pass chains) uses Jitter rules.
- **Custom JXS shader binding** — see `SPEC_REFERENCE.md` § Jitter Display
  for the texture-binding-by-`<param>`-order rule that applies when a
  `jit.gl.shader` consumes a hand-written JXS instead of a `jit.gl.pix`.
- **Refpage source of truth** — gen operators live in
  `/Applications/Max.app/Contents/Resources/C74/docs/refpages/gen-ref/<obj>.maxref.xml`,
  parsed by `RefpageCache._parse` in `spec2maxpat.py`. Same schema as MSP
  refpages.
