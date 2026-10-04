# Max Versions — What Each Update Changed

What each Max update changed that matters for patching, read out of the
generated diff reports beside this file. The reports themselves
(`max_<old>_to_<new>_diff.md`) list every change; this file picks out what a
patch author should know and what the repo did about it.

## When Max is updated

1. Mount the previous version's `.dmg` (Cycling '74's installers are usually
   still in `~/Downloads`) and run
   `python3 scans/max-versions/diff_max_versions.py /Volumes/<old>/Max.app /Applications/Max.app`.
2. Rebuild the data the repo extracts from the install:
   `scans/maxhelp/extract_observed_attrs.py`, `extract_js_api.py`,
   `extract_port_counts.py`. Then run the test suites under
   `mcp_server/.venv/bin/python3 -m pytest tests mcp_server/tests`.
3. Read the report and update the rules, `scans/max-gaps/max_gaps.json`
   (anything "not in Max" that now is), and this file.
4. Eject the old image.

The help files of a release can be saved by a *later*, unreleased build. Max
9.2.0 ships six saved by 9.3.0. The report lists them, and the port-count
record ignores them (`counts_as_port_evidence` in `spec2maxpat.py`), because a
newer build's objects can differ: 9.3's `metro` has three outlets.

---

## 9.1.5 → 9.2.0 (read 2026-10-03)

Report: `max_9.1.5_to_9.2.0_diff.md`. Nothing below was run in Max; it comes
from the refpages, help files, registries and userguide.

### New objects

- **`jit.web`, `jit.web~`** render a Chromium page (WebGL and WebGPU included)
  to a `jit.gl.texture` or `jit.matrix`, with mouse and keyboard input and
  transparent backgrounds. `jit.web~` adds the page's stereo audio as two
  signal outlets. `jit.gl.web` / `jit.gl.web~` are the same objects with
  `output_texture` on (`init/jitter-objectmappings.txt`). This closed one gap in
  `max_gaps.json` (a web page rendered to a texture).
- **Ableton DSP**: `abl.device.reverb2~` (feedback-delay-network reverb with
  freeze), `abl.device.stereocompressor~`, `abl.dsp.djfilter~` (one bipolar
  control sweeps low-pass to high-pass).
- **Jitter Tools**: `jit.path.ui` (edit a 3D path in the render window),
  `jit.gl.tex2mat` (texture to matrix, a `v8` around `jit.gl.asyncread`),
  `jit.unpack.geomat` (splits a GL geometry matrix into position, texcoord,
  normal and colour), and a `jit.gl.movie~` mapping.
- **jit.mo**: `jit.message` outputs its argument every rendered frame.
- `dspstress~` has a stub refpage (`TEXT_HERE`); its inlet takes a CPU %.
  Treat it as undocumented.

### Changes to existing objects worth knowing

- **Every GL object gained `alpha_mode`**: blend alpha separately from colour
  (`link`, the default, then `max`, `add`, `replace`, `ignore`). Added to the
  layering pitfall in `patching/MAX_PATCHING.md`.
- **`jit.gl.meshwarp`** gained per-edge blending (`edgeblendleft` …,
  `edgeblendcurve<side>`), mask feathering and scaling, and a `checkerboard`
  test pattern. Seven `max_gaps.json` entries now cite it; edge blending stays
  "partly in Max" because nothing computes the overlap.
- **`udpreceive` / `udpsend`**: `port` (and `host` on `udpsend`) are now
  attributes; both gained `@active`. `udpreceive @usestring 1` and `udpsend`'s
  `string` message move string data without making symbols, and with
  `dict.serialize @stringmode 1` and `dict.deserialize`'s `string` message that
  gives a symbol-free dict path. Added to `patching/MAX_PATCHING.md`. C74's
  help now uses `@outputformat fullpacket` (its 9.1.5 help wrote
  `@outputmode`, which is not an attribute of `udpreceive`).
- **`buffer~`**: `trim` / `trim_samples` (strip silence, with padding),
  `crop_samples`, `replacechannel`, a `url` attribute.
- **`fftin~` / `fftout~`**: `updatewindow`; `fftout~` also `copyinput` /
  `copyoutput` (copy a frame to a `buffer~`).
- **`jit.fft`** now takes any size. Earlier versions silently truncated each
  dimension to a power of two.
- **`pattrstorage`**: `getstate` / `setstate` move the whole state as a dict.
- **`coll`**: `maxany` / `minany`. **`seq`**: `insert`. **`dict.pack`**:
  `clear`, `reset`. **`sfrecord~`**: `start` / `stop` are now documented.
- **`cycle~`**: `buffer_autoupdate` follows changes to its buffer.
- **`mousefilter @button`** filters right or middle clicks too.
- **`rslider @inputrangemode`**, **`textbutton @usegradient`**,
  **`function @mousemode`** gains `Reorder`, **`live.dial @appearance`** gains
  `Free`.
- **`jit.gl.mesh @usebvh`** (picking hits real triangles),
  **`jit.gl.model @concat_geometry`**, **`jit.gl.multiple`** `texcoord_matrix`
  (per-instance UVs for texture atlases), **`jit.gl.asyncread @adapt / @dim`**,
  **`jit.anim.node @scalemode`**, and `open` on `jit.gl.shader`, `jit.gl.slab`
  and `jit.gl.pass` opens the shader editor.
- **`thispatcher showparameterwindow`** shows or hides the Parameter window.
- **`jit.world`**: with `@visible 0`, window attributes do nothing; set the
  texture size with `@dim`.
- **Removed**: `jit.cellblock`'s `sccolor`, `sgcolor`, `stcolor` (no repo patch
  used them); `udpreceive`'s and `udpsend`'s `port` / `host` messages (now
  attributes).
- **`mc.tapin~` / `mc.tapout~`** are no longer aliases of `tapin~` /
  `tapout~` but MC wrappers of them (`obj-qlookup.json`, `init/audio-objectmappings.txt`).
- **jspainter**: hidden attributes for the focus border and the automation
  dots (`jspainterfocus`, `jspainterautomation`, `automationpoint`, …). See
  `scans/userguide/userguide_insights.md` > *Custom UI Objects*.

### Errors in C74's own 9.2 files

Recorded so nobody trusts them by accident.

- `jit.gl.tex2mat.maxref.xml` names its object `v8`, and
  `jit.unpack.geomat.maxref.xml` names its object `jit.unpackl.gl`. The
  converter's alias harvest (`RefpageCache.name_aliases`) reads only the standard
  refpage folders, not package `docs/`, so neither reaches the alias map.
- `jit.web~.maxref.xml` types all four outlets `signal`. The help file saves
  `signal`, `signal`, `jit_matrix` (or `jit_gl_texture`), `""`.
- `dspstress~.maxref.xml` is an unfilled template.

### What the repo changed

- Port counts: newer-than-installed patches no longer count as evidence;
  `r NAME` / `receive NAME` resolve to 0 inlets and a bare `r` to 1;
  `selector~` / `mc.selector~` get a control inlet plus one per input.
- Rebuilt `scans/maxhelp/maxhelp_observed_attrs.json`,
  `maxhelp_crawl_state.json`, `maxhelp_js_api.json`,
  `maxhelp_port_counts.json`.
- `scans/max-gaps/max_gaps.json`: one entry rejected, nine annotated.
- `patching/MAX_PATCHING.md`: `alpha_mode`, the `udpreceive` attributes, the
  symbol-free dict path.
