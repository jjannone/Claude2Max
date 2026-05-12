# Max Patch Anatomy

**Orientation for the Max landscape.** Most non-trivial Max patches are built from a small number of recurring functional categories. Knowing them up front makes it easier to plan a patch, decompose an existing one, and choose the right object for a job.

Not every patch contains every category. A simple synth might have only input → processing → output. A full instrument might touch all ten. The point is to recognize the *role* an object plays, not to memorize a checklist.

---

## 1. Input / source

Where data or signal originates.

- **Audio** — `adc~` (mic / line in), `sfplay~` / `groove~` (file playback), `cycle~` / `noise~` / `saw~` (synthesis), reads from `buffer~`
- **Control** — `midiin` / `notein` / `ctlin`, `key`, `mousestate`, `metro` (clock), `serial`, `udpreceive` (OSC), `live.*` host parameters in M4L
- **Files / data** — `coll`, `dict`, `text`, `jit.matrix` (loaded from disk)

---

## 2. UI / control surface

What the user touches. Usually lives in **presentation view**.

- **Continuous** — `slider`, `dial`, `live.dial`, `live.gain~`, `multislider`
- **Discrete** — `button`, `toggle`, `live.text`, `umenu`, `matrixctrl`
- **Display** — `number`, `flonum`, `comment`, `meter~`, `scope~`, `spectroscope~`, `live.meter~`, `multislider` (as a graph)

Every visible control needs a `comment` label nearby. See `patching/MAX_PATCHING.md` for presentation-view rules.

---

## 3. Domain processing

The work of the patch. Max is really a host for many **domain ecosystems**, each with its own object family, data types, and paradigm. Choosing an ecosystem is choosing a mental model.

### Built-in / ships with Max

| Domain | Namespace | Paradigm |
|--------|-----------|----------|
| Max core (control) | (no prefix) | message-rate scheduling, lists, logic |
| MSP | `*~` | audio signal-rate, 64-sample vectors |
| Jitter | `jit.*` | matrices / video at frame rate |
| OpenGL | `jit.gl.*` | 3D scene graph, GPU-driven |
| BEAP | abstractions | modular-synth audio (pedagogical) |
| Vizzie | abstractions | high-level video modules (pedagogical) |

### Computer-aided composition (symbolic music)

- **bach** — lllls (nested lists), score, notation
- **cage** — high-level CAC tools built on bach
- **dada** — interactive / graphical composition
- **MaxScore** — engraving-quality notation

### Audio analysis / ML

- **FluCoMa** (`fluid.*`) — corpus-based ML, slicing, descriptors
- **MuBu / PiPo / IMTr** — multimodal data, gesture, segmentation
- **ml.star** — classic ML primitives (kNN, classifiers)
- **zsa.descriptors** — real-time audio descriptors

### Specialized DSP

- **HISSTools** — convolution, impulse response measurement
- **FFTease** — phase vocoder family
- **CNMAT** — research DSP (resonators, OSC)
- **FrameLib** — frame-based DSP paradigm with its own scheduler model
- **karma~** — granular looping
- **HOA Library** — higher-order ambisonics
- **spat / spat5** — IRCAM spatialization

### Computer vision

- **cv.jit** — OpenCV bridge for Jitter matrices

### Modular video synthesis

- **vsynth** — analog-video-inspired modular synthesis

See `packages/package_concepts.md` for the paradigm of each ecosystem and `packages/package_objects.json` for the curated per-object reference. Use `/c2m-package-search` before composing any 3+ native-object chain — there is often a single package object that does the job.

---

## 4. State / memory

What persists across messages or sessions.

- `pv` (patcher-scope variable), `value`, `pattrstorage`, `preset`
- `coll` / `dict` for structured state
- `buffer~` for audio
- In M4L: `live.*` objects with `parameter_enable: 1` for host-saved state

---

## 5. Logic / scripting

Higher-level interpreted code that runs in Max's scheduler. Use when branching, iteration, data structures, or algorithms would be painful in pure patching.

- **`v8`** — ES2020 JS, the modern choice. State machines, parsers, generative algorithms, complex list manipulation.
- **`js` / `jsui`** — older SpiderMonkey runtime (ES5-ish). `jsui` draws custom UI to a canvas via `sketch`.
- **`node.script`** — full Node.js with npm modules, filesystem, network. Heaviest of the three.
- **`mxj`** — Java via JVM.
- **`expr` / `vexpr`** — inline math; good for one-liners before reaching for v8.

---

## 6. Compiled / low-level domains

Sub-languages the user authors that **compile to native CPU or GPU code**, escaping per-vector / per-frame scheduling. The distinguishing test: does the user *write code* in this object (not just configure it), and does that code *compile* rather than interpret?

- **`gen~`** — per-sample audio. See `patching/GEN_PATCHING.md`.
- **`gen`** — per-control-tick scalar.
- **`jit.gen`** — per-cell CPU matrix. See `patching/JIT_GEN_PATCHING.md`.
- **`jit.gl.pix`** — per-pixel GPU (compiles gen to GLSL).
- **`jit.gl.shader`** — direct GLSL `.jxs` (vertex / fragment / geometry).
- **`jit.gl.slab`** — applies a user-supplied `.jxs` shader to a texture.
- **`rnbo~`** — Max-subset patching language that compiles to C++ / JS / WASM; exportable as VST, Web Audio, RPi, etc.

Not in this category despite living in the same namespace: `jit.gl.material`, `jit.gl.pass`, `jit.gl.node` — these *consume* shaders but don't ask the user to write them. They belong with scene-graph / render-graph plumbing in §3.

---

## 7. Routing / glue

Plumbing that doesn't compute, just moves things.

- `send` / `receive` (`s` / `r`), `forward`, `send~` / `receive~`
- `trigger` (`t`) — load-bearing in Max for right-to-left ordering of message evaluation
- `gate`, `switch`, `route`, `sel`, `if`

---

## 8. External services / bridges

Anything that crosses the boundary out of Max.

- **Plugin hosts** — `vst~` / `amxd~` (load VSTs and M4L devices), `mc.vst~`
- **Video / GPU sharing** — `jit.gl.syphonclient` / `jit.gl.syphonserver` (Syphon package, macOS); Spout package on Windows; NDI integrations via packages (consult `packages/package_objects.json` for current object names)
- **Network** — `udpsend` / `udpreceive`, OSC via `o.*` (odot) or CNMAT-OSC, MQTT via packages
- **MIDI** — `midiin` / `midiout`, `notein` / `noteout`, `ctlin` / `ctlout`, `sysexin` (when targeting external hardware)
- **IPC / OS** — `shell` (package), `serial` for hardware, `hi` for HID devices
- **Web** — `maxurl` for HTTP, `jweb` for embedded browser
- **M4L → Live** — `live.path` / `live.object` / `live.observer` (the LOM access chain). See `patching/M4L_PATCHING.md`.

---

## 9. Output / sink

Where things end up.

- **Audio** — `dac~`, `sfrecord~`, `mc.*` outs, writes to `buffer~`
- **Control** — `midiout`, `udpsend`, `serial` out, `live.*` parameters in M4L
- **Visual** — `jit.window`, `jit.world`, `jit.pwindow`

---

## 10. Infrastructure

Hidden plumbing the user never sees but the patch can't run without.

- `loadbang` / `loadmess` — init defaults at patch load
- `inlet` / `outlet` — only inside subpatchers, abstractions, `poly~`
- `pcontrol`, `thispatcher` — meta-control of the patch itself
- M4L only: `live.thisdevice` (signals "device is ready"; required before any LOM access)

---

## Mental model

A useful default flow for designing a new patch:

```
input → state → processing → output
              ↑           ↓
              UI ←  logic / scripting
                    ↑
                routing / glue
```

- **UI** taps into state and surfaces it via presentation view.
- **Logic / scripting** sits alongside the dataflow, handling anything that's awkward as pure patching.
- **Compiled / low-level** lives inside processing nodes that need sample / cell / pixel access.
- **External services** sit at the edges, connecting to plugins, hardware, the network, or the host (Live).
- **Infrastructure** is invisible — but the patch breaks silently without it.

When stuck on "what object should I use?", first identify which category the need belongs to, then narrow down within that category. Reach for `/c2m-package-search` before assembling a long native chain — the right tool for a job is often a single object in a package you didn't know was installed.
