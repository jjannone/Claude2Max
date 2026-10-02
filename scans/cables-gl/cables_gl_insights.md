# cables.gl Insights

How cables.gl works, written for a reader who knows Max and not cables.
Every entry comes from a page fetched on 2026-10-02 and names it. Nothing
here is from memory of the tool. Where a Max object is named for comparison,
its refpage in the local Max install was read the same day.

cables.gl (by undev) is a node-patching tool for real-time graphics that runs
in a web browser. A desktop build, *cables standalone*, wraps the same editor
in Electron.

Short forms used below:

- `docs:` means `https://cables.gl/docs/` plus the path that follows.
- `op:` means `https://cables.gl/op/` plus the op's full name.
- `ops index` means `https://cables.gl/ops`, the page that lists every op
  with a one-line digest.

Companion files: `CABLES_GL_CRAWL_LOG.md` (what was read),
`cables_gl_crawl_state.json` (per-page status), and
`cables_gl_max_gap_candidates.json` (things Max may lack).

---

## 1. Core model

### Ops, ports and cables

- A patch is made of **ops** (operators) joined by **cables** between their
  **ports**. An op is the counterpart of a Max object box; a port is an
  inlet or outlet.
  Source: `docs:docs`, `docs:0_howtouse/ui_walkthrough/ui_walkthrough`.
- Every op has a short name and a full namespaced name: `MainLoop` is
  `Ops.Gl.MainLoop`. The add-op dialog (the Esc key) searches the full name.
  Source: `docs:5_writing_ops/guidelines/guidelines`.
- Ports are typed, and each type has a colour: Trigger (yellow), Number,
  String and Boolean values (green), Array (light purple), Object (dark
  purple). Textures, geometries, shaders, audio nodes and HTML elements all
  travel on Object ports. Source: `docs:5_writing_ops/dev_creating_ports/dev_creating_ports`.
- An Object port accepts any object by default. An op that wants only one
  kind must check the link itself with a `shouldLink` function.
  Source: `docs:5_writing_ops/object_ports/object_ports`.
- **Every input port is also a parameter.** Select an op and its ports show
  as sliders, checkboxes, dropdowns and text fields in a panel on the right.
  A value typed there is kept. When a cable to a number or string port is
  removed, the port goes back to the typed value. An array or object port
  goes to null. This is the largest day-to-day difference from Max, where an
  inlet has no visible stored value.
  Source: `docs:5_writing_ops/dev_ops/dev_ops`, `docs:0_howtouse/ui_walkthrough/ui_walkthrough`.
- A cable can be dragged straight onto a parameter name in another op's
  panel. Dropping a cable on the centre of an op offers the ports that fit.
  Source: `docs:0_howtouse/ui_walkthrough/ui_walkthrough`.

### Two kinds of flow: values and triggers

- **Value ports push on change.** When an output is set, each connected
  input's `onChange` runs. It runs only if the value really changed.
  Source: `docs:5_writing_ops/dev_callbacks/dev_callbacks`, `docs:5_writing_ops/dev_ops/dev_ops`.
- **Trigger ports are function calls.** Triggering an output calls each
  connected op's `onTriggered` at once. A trigger carries no data. The
  nearest Max idea is a `bang`, but in cables it is its own cable type.
  Source: `docs:5_writing_ops/dev_creating_ports/dev_ports_trigger/dev_ports_trigger`.
- **`MainLoop` is the clock.** It fires its trigger once per rendered frame,
  and everything drawn hangs off that one trigger. Its ports include an FPS
  limit, a pixel-density cap and a "reduce FPS when unfocussed" switch.
  Source: `op:Ops.Gl.MainLoop_v2`.
- **The trigger tree is the scene.** An op that changes drawing state (a
  transform, a material, a camera) applies it, triggers its children, and
  the state applies only to what sits under it. Two `Transform` ops in
  series make a parent and child transform. The docs call the ops under one
  trigger its "children". The Max counterpart is naming a context and
  grouping objects with `jit.gl.node`; in cables the cable layout is the
  grouping. Source: `docs:1_beginner/beginner2_transformations/beginner2_transformations`,
  `docs:7_lighting/lights/lights` (lights go before the materials they light).
- **Loops are trigger ops.** `Repeat` triggers everything under it N times
  and gives an index. Wiring the index into a transform draws N copies.
  Two `Repeat` ops in series make a grid.
  Source: `docs:1_beginner/beginner4_more_transformations/beginner4_more_transformations`, `op:Ops.Trigger.Repeat_v2`.
- **Order is set with an op.** `Sequence` exists to control the order of
  triggering, and has numbered trigger outputs. The op guidelines ask every
  op with a trigger input to also have a trigger output, so chains can run
  without many `Sequence` ops. The pages read say nothing about the position
  of a cable deciding order, which is how Max does it.
  Source: `op:Ops.Trigger.Sequence`, `docs:5_writing_ops/guidelines/guidelines`.
- The `Ops.Trigger` namespace (41 ops) is the control-flow toolkit: gates,
  routes, counters, delays, `Interval`, `TriggerOnce`, `NthTrigger`,
  `Threshold`. Source: ops index.

### Variables and named triggers

- `VarSet…` and `VarGet…` ops exist for numbers, strings, arrays, objects
  and textures. They pass values across a patch without a cable, as `s` and
  `r` or `value` do in Max. `TriggerSend` and `TriggerReceive` do the same
  for triggers. Source: `op:Ops.Vars.VarSetNumber_v2`, `op:Ops.Trigger.TriggerSend`, ops index.
- Variables are also the door to the outside. JavaScript on a host page can
  read, set and listen to them (section 11).
  Source: `docs:4_export_embed/dev_embed_vars/dev_embed_vars`.

### Subpatches and patched ops

- `SubPatch` bundles ops into one box. Ports are made by dragging a cable to
  a "create port" port. `PatchInput` and `PatchOutput` are the inside ends.
  Source: `op:Ops.Ui.SubPatch`.
- A **SubPatchOp** is a new named op built from existing ops, the
  counterpart of a Max abstraction. It is drawn with a border. It is made
  from a selection or from the "Patch a new op" menu item, and it lives in a
  namespace like any coded op.
  Source: `docs:5_writing_ops/patchingops/subpatchops`.
- Namespaces nest by permission. An op in `Ops.Patch` may contain ops from
  `Ops.User`, `Ops.Team`, `Ops.Extension` and core. Each level may contain
  only the levels after it in that list. Source: same page.
- "Blueprints" do not appear anywhere in the pages read. The current terms
  are SubPatch and SubPatchOp.

### Namespaces, sharing and versions

- Four namespaces carry permissions. `Ops.Patch.` belongs to one patch and
  is copied when the patch is cloned. `Ops.User.` follows its author.
  `Ops.Team.` is shared by a team. `Ops.Extension.` is read-only and open to
  everyone. Only patch ops and extension ops may be used in a published
  patch (team ops too, if the team is public).
  Source: `docs:5_1_permissions/3_ops/ops`.
- **An op's version is part of its name.** `Ops.Gl.Texture_v2` is the newer
  `Ops.Gl.Texture`. Old versions stay loadable, are hidden from the add-op
  dialog, and the editor offers an update button where one is used. Renaming
  an op updates every patch that uses it. A `.Deprecated.` namespace segment
  hides an op and shows a warning in old patches. A `.Dev.` segment limits
  an op to the development server.
  Source: `docs:5_writing_ops/dev_renaming/dev_renaming`.

---

## 2. Rendering

### Canvas and API

- Core rendering is WebGL. WebGL2 is used where the browser has it. The docs
  say Safari on macOS and every browser on iOS still use WebGL1, where
  mipmaps need power-of-two textures. The file browser can resize a texture
  to the next power of two. Source: `docs:faq/webgl_differences/webgl_differences`.
- WebGPU is an extension, `Ops.Extension.WebGpu`, with 23 ops: its own
  canvas, materials, a mesh instancer, render-to-texture, and compute
  shaders (section 3). Source: ops index, `op:Ops.Extension.WebGpu.WebGpuCanvas`.

### Meshes and geometry

- A mesh op draws when triggered and also gives a **geometry** object on an
  output. The guidelines ask every mesh op to have that output and a Render
  switch. Source: `docs:5_writing_ops/guidelines/guidelines`.
- Primitives are in `Ops.Graphics.Meshes` and `Ops.Gl.Meshes`: `Circle`,
  `Cube`, `Sphere`, `Torus`, `Cylinder`, `ParametricSurface` (x, y and z
  typed as JavaScript expressions of u and v), `HeightMap`, `SplineMesh`.
  Source: ops index, `op:Ops.Gl.Meshes.ParametricSurface`.
- `Ops.Graphics.Geometry` (26 ops) edits geometry on the CPU: merge,
  extrude, tesselate, recalculate normals, triangulate a 2D path, turn an
  SVG path into geometry, read and write `.obj` text. `FreezeMeshes` captures
  every mesh drawn under it into one geometry. Max's Jitter Geometry package
  (`jit.geom.*`, 26 refpages) covers similar ground. Source: ops index,
  `op:Ops.Graphics.Geometry.FreezeMeshes`.
- glTF is the model format. `GltfScene` loads `.glb` files only. The
  namespace has 24 ops, most of them for single nodes: transform or hide a node, swap its material,
  play skins and morph targets, read the camera, turn an animation into
  arrays, load Draco and KTX2 data. Uploaded `.fbx` files are converted to
  `.glb`. Source: `op:Ops.Gl.GLTF.GltfScene_v5`, `op:Ops.Gl.GLTF.GltfSkin`,
  `op:Ops.Gl.GLTF.GltfMorphTargets`, `docs:0_howtouse/files/files`.

### Instancing

- `MeshInstancer` draws one geometry many times on the GPU. Positions,
  scales, rotations, colours and texture coordinates come in as arrays. It
  has spherical and cylindrical billboarding. `MeshInstancerFromTexture`
  takes the same data as textures, with RGB read as XYZ.
  Source: `op:Ops.Gl.MeshInstancer_v4`, `op:Ops.Gl.Meshes.MeshInstancerFromTexture_v3`.
- The performance guide says to instance where a `Repeat` loop would draw.
  A loop repeats CPU work for every copy.
  Source: `docs:9_performance_optimization/02_usual_suspects/usual_suspects`.
- `SurfaceScatter` places instances on a mesh's vertices, triangle centres,
  triangle sides or random points. Source: `op:Ops.Gl.SurfaceScatter_v2`.

### Materials and lights

- A material is an op placed before the meshes it shades: `BasicMaterial`
  (unlit), `MatCapMaterial`, `LambertMaterial`, `PhongMaterial`,
  `PbrMaterial`. Source: ops index, `docs:7_lighting/lighting`.
- Lights are ops placed before the materials: `PointLight`,
  `DirectionalLight`, `SpotLight`, `AmbientLight`.
  Source: `docs:7_lighting/lights/lights`.
- Shadows use shadow maps. A light casts them. A `Shadow` op placed after
  any material makes the meshes under it cast or receive. The `Shadow` op
  picks one of four filters: Default (hard), PCF, Poisson, VSM. The docs
  give the trade-offs and the usual artifacts with a fix for each (bias,
  near and far planes, map size, normal offset). A point light writes its
  shadows to a cubemap. Source: `docs:7_lighting/shadows/shadows`, `op:Ops.Gl.ShaderEffects.Shadow_v3`.
- `PbrMaterial` has roughness and metalness, clear coat, thin-film
  iridescence, emission, height mapping, a lightmap input, vertex colours
  used as AO, roughness or metalness, and built-in tonemapping.
  `PbrEnvironmentLight` builds image-based lighting from an equirectangular
  map and can correct reflections for a box-shaped room.
  Source: `op:Ops.Gl.Pbr.PbrMaterial_v2`, `op:Ops.Gl.Pbr.PbrEnvironmentLight`.

### Shader effects: adding to a material instead of replacing it

- Ops in `Ops.Gl.ShaderEffects` (35 ops) go after a material and add code to
  whatever shader is active. Examples: `FresnelGlow`, `VertexDisplacementMap`,
  `Twist`, `Bend`, `SplineDeform`, `ColorArea`, `AreaDiscardPixel`,
  `TextureProjection`. Several can stack on one material.
  Source: ops index, `op:Ops.Gl.ShaderEffects.FresnelGlow`.
- How it works: every material's shader source has marked places where
  module code is inserted, one in the vertex stage and one in the fragment
  stage. Each effect's names get a unique prefix so effects cannot clash.
  A hand-written shader must declare a fixed set of variables (`pos`,
  `norm`, `col` and others) for effects to work on it.
  Source: `docs:5_writing_ops/shader/shader`.
- `ShaderInfo` shows the final source and uniforms of the shader active at
  that point in the tree, with the added modules.
  Source: `docs:9_performance_optimization/04_debugging_shaders/debugging_shaders`.

### Custom shaders

- `CustomShader` takes vertex and fragment GLSL. A uniform declared in the
  code becomes an input port on the op. It works as a material, or renders
  to a texture through `ShaderToTexture`.
  Source: `op:Ops.Gl.Shader.CustomShader_v2`, `docs:5_writing_ops/shader/shader`.
- cables has its own keywords, `IN`, `OUT` and `UNI`, so one source compiles
  under both WebGL versions. `ShaderDefine` sets a `#define` from the patch.
  Source: `docs:5_writing_ops/shader/shader`.
- The Shadertoy FAQ maps each Shadertoy uniform to the cables op that
  supplies it. Source: `docs:faq/shadertoy/shadertoy`.

### Textures, render-to-texture and post-processing

- `RenderToTexture` draws its children into a texture, with depth, MSAA and
  a choice of pixel format. `RenderToTextures` writes up to eight textures
  in one pass (WebGL2 only). `RenderToCubemap` draws a scene into a cubemap
  for live image-based lighting. Source: `op:Ops.Gl.RenderToTexture_v3`,
  `op:Ops.Gl.RenderToTextures_v3`, `op:Ops.Gl.CubeMap.RenderToCubemap_v3`.
- **`ImageCompose` is the 2D pipeline.** It makes a texture, and each child
  op draws into it or filters it in turn: `DrawImage`, `Blur`, `Vignette`,
  noise generators, colour ops. The children are layers. The namespace has
  about 110 ops with its Math and Noise parts.
  Source: `docs:2_intermediate/image_composition/image_composition`, `op:Ops.Gl.ImageCompose.ImageCompose_v4`, ops index.
- The post-processing recipe: render the scene to a texture, blur it in one
  `ImageCompose`, combine both in a second one with an add blend, add grain
  and chromatic aberration, and draw the result to the screen.
  Source: `docs:2_intermediate/post-processing_3d_scenes/post-processing_3d_scenes`.
- `RgbMathExpression` takes a typed GLSL expression per colour channel, with
  four number inputs and three texture inputs.
  Source: `op:Ops.Gl.ImageCompose.Math.RgbMathExpression`.
- Data moves both ways between textures and arrays: `ArrayToTexture`,
  `TextureToArray`, `GeometryToTexture`, `PointCloudFromTexture`.
  Source: ops index, `op:Ops.Gl.TextureToArray_v4`.

### Text

- `TextMesh` and `TextTexture` draw text in 3D or into a texture. The MSDF
  pair, `FontMSDF` and `TextMeshMSDF`, draws distance-field text that stays
  sharp at any size. It takes arrays that move, scale, rotate and colour
  each character. The file browser converts a `.ttf` to the SDF format.
  Source: `op:Ops.Gl.TextMeshMSDF_v2`, `op:Ops.Gl.FontMSDF_v2`, `docs:0_howtouse/files/files`.
- Extensions turn fonts into outlines: `Ops.Extension.OpenType` and
  `Ops.Extension.FontKit`. FontKit animates variable-font axes one glyph at
  a time. Source: `https://cables.gl/ops/Ops.Extension.FontKit`, `op:Ops.Extension.FontKit.GlyphAxisMorph`.

### Projection mapping

- One op is labelled for it: `QuadWarpTexture`, a textured quad with four
  movable corners. Nothing in the docs covers meshes, masks, edge blending
  or more than one projector. Max is ahead here: `jit.gl.cornerpin` and
  `jit.gl.meshwarp` both have refpages. Source: `op:Ops.Gl.Meshes.QuadWarpTexture`.

---

## 3. GPU compute

- The WebGPU extension has compute shaders. `CompCompute` takes shader
  source and workgroup counts. `ComputeStorageInput`, `ComputeStorageOutput`
  and `ComputeUniform` bind buffers and uniforms. `ArrayToGpuBuffer` and
  `GpuBufferToArray` move data in and out. None of these op pages carries
  written documentation yet, so only names and ports are known.
  Source: `op:Ops.Extension.WebGpu.CompCompute`, ops index.
- On the WebGL side, heavy per-element work is done with textures as data:
  the instancer-from-texture op, `VertexPositionFromTexture`, and the
  reaction-diffusion extension, which is a feedback texture.
  Source: ops index, `op:Ops.Extension.ReactionDiffusion.ReactionDiffusionSystem_v2`.

---

## 4. Timeline and animation

- **Any number port can be keyframed.** A menu beside the port turns
  animation on. With the timeline open, moving the time cursor and changing
  the value writes a key. The page says the timeline was recently rebuilt
  and mentions easing curves; it gives no detail on them. Source: `docs:2_1_timeline/animation`.
- Timeline keys: space plays and pauses, `j` and `k` jump between keys, the
  arrow keys step one frame, `h` fits all keys, and `g` shows the curves of
  the selected ops. Source: `docs:0_howtouse/keys/keys`.
- `Ops.TimeLine` (26 ops) reads and drives the timeline. `TimeLineTime` and
  `TimeLineFrame` report the position. `TimeLinePlay`, `TimeLineRewind`,
  `TimeLineSetTime`, `GotoFrame`, `TimeLineLoop` and `TimeLineOverwrite`
  control it. `TimelineConfig` sets the frame rate. `AutoPlay` starts it on
  load. Source: ops index, `op:Ops.TimeLine.TimelineConfig`.
- `Anim` and `TimelineValue` are keyframed values as ops. One curve can then
  feed many ports, and it can be read at any time value, not only "now".
  `TimelineValue` also gives all its keys as an array.
  Source: `op:Ops.TimeLine.Anim`, `op:Ops.TimeLine.TimelineValue`.
- `TimeLineBPM` draws a beat grid on the timeline for a given BPM, to line
  keys up with music. Source: `op:Ops.TimeLine.Viz.TimeLineBPM`.
- `Ops.Anim` (17 ops) is animation without the timeline: `Smooth`, `Spring`
  (damping and stiffness), `SimpleAnim`, `LFO`, `Bang` (a 1-to-0 decay), and
  `AnimNumber`, which eases toward whatever value arrives. `Math.Ease` and
  `Array.EaseArray` apply easing curves.
  Source: ops index, `op:Ops.Anim.Spring`.
- **Rendering out of real time.** `RenderAnim` steps a patch at a fixed
  frame rate for a set length and saves a PNG sequence (zipped if wanted) or
  a WebM file. `MediaRecorder` records the live canvas, with audio if
  wanted, using the browser's recorder. The page warns that those files have
  no duration and need re-encoding before editing.
  Source: `op:Ops.Gl.RenderAnim_v2`, `op:Ops.Gl.MediaRecorder_v2`.
- **Pre-rendering against stutter.** `PreRender` draws the patch at chosen
  timeline times while a loading bar shows, so shaders compile and assets
  upload before playback. `DemoPrerender` first records the moments where
  heavy events happened in a run, and pre-renders exactly those.
  Source: `op:Ops.TimeLine.PreRender`, `op:Ops.TimeLine.DemoPrerender`.
- Nothing in the docs describes a cue list, a scene manager or show-control
  protocols. The timeline is one line of time for the whole patch.

---

## 5. UI ops

- **Sidebar.** `Ops.Sidebar` (22 ops) builds a control panel over the
  canvas. A `Sidebar` op is the root, and controls chain from its output:
  `Slider`, `Toggle`, `Button`, `DropDown`, `NumberInput`, `TextInput`,
  `ColorPicker`, `XYPad`, `Group`, `SideBarSwitch` (tabs), `Presets`. The
  control ops have a link port and no position ports, so the panel is not
  laid out by hand. Source: `op:Ops.Sidebar.Sidebar`, `op:Ops.Sidebar.XYPad`, ops index.
- **HTML and CSS.** `Ops.Html` (94 ops) makes page elements from the patch
  and styles them: `Element`, `InputElement`, `IFrame`, `VideoElement`,
  `CSS`, a grid layout op, event listeners. `TransformElement` moves an
  element to follow the current 3D transform on screen, for labels that
  track objects. `TransformCSS3DElement` applies the WebGL matrix as a CSS 3D
  transform. Source: `docs:faq/html_css/html_css_getting_started`,
  `op:Ops.Html.CSS.TransformElement`, `op:Ops.Html.Elements.Element_v2`.
- `InteractiveRectangle` is a drawn rectangle that reports pointer hover,
  press and click. Source: `op:Ops.Gl.InteractiveRectangle_v2`.
- **Viz ops** draw on the patch itself, for the person editing: `VizGraph`,
  `VizNumber`, `VizTexture`, `VizArrayTable`, `VizLogger`, `VizObject`. They
  do the job of number boxes and `jit.pwindow` in a Max patch. Any op can
  draw this way by defining `renderVizLayer`, which gets a 2D canvas context.
  Source: `op:Ops.Ui.VizGraph`, `docs:5_writing_ops/dev_vizops/dev_vizops`.
- `Ops.Number.Preset` stores the values of ports wired to it. It can
  crossfade along the whole list of presets or blend two chosen ones.
  Source: `op:Ops.Number.Preset`.
- `Ui.Area` and `Ui.Comment` organise the patch: coloured named regions that
  move their ops with them, and comments.
  Source: `op:Ops.Ui.Area`.

---

## 6. Audio

- Audio ops wrap Web Audio nodes. An audio cable is an Object port holding
  an audio node. Source: `docs:5_writing_ops/webaudio/webaudio`.
- Playback: `AudioBuffer` holds a file. `AudioBufferPlayer` loops or plays
  long files. `SamplePlayer` plays one-shots. `Output` goes to the speakers.
  Two sources should meet in a `Mixer` (eight channels with volume and pan),
  not on one `Output` port. Source: `docs:8_audio/0_basic_setup/basic_setup`.
- Effects: `Gain`, `AudioPanner`, `BiquadFilter`, `ThreeBandEqualizer`,
  `CutFilter`, `Convolver` (reverb from an impulse response), `Delay`,
  `Waveshaper`. Source: `docs:8_audio/1_effects/effects`, ops index.
- Analysis for visuals: `AudioAnalyzer` gives FFT and waveform arrays and
  RMS. `FFTAreaAverage` averages a chosen frequency and level range.
  `AnalyzerTexture` writes a spectrogram texture.
  Source: `docs:8_audio/2_realtime_visualization/realtime_visualization`, `op:Ops.WebAudio.AudioAnalyzer_v2`.
- Whole-file analysis: `WaveformMesh` and `AudioBufferToSplineArray` turn a
  file's waveform into geometry or spline points.
  Source: `docs:8_audio/3_offline_visualization/offline_visualization`.
- Timing: `BpmTap` (tap tempo with beat triggers, sync and nudge),
  `ClockSequencer`, `ClockSequencerPattern` (an array as a step pattern).
  `MidiJson` reads a converted MIDI file at a time position, to sync visuals
  to a track. Source: `op:Ops.Audio.BpmTap`, `op:Ops.WebAudio.ClockSequencerPattern`, `op:Ops.Audio.MidiJson`.
- Browser limits stated in the docs: no sound until the user has interacted
  with the page (`PlayButton` exists for that); which audio formats loop
  depends on the browser (`BrowserSpecificFile` swaps files); the sound card
  gives two inputs and two outputs.
  Source: `docs:faq/audio_browsers/audio_browsers`, `docs:8_audio/0_basic_setup/basic_setup`, `docs:faq/technical/technical`.
- There is no signal-rate patching layer like MSP or `gen~`. The graph is
  Web Audio nodes, and the docs point op authors to tone.js for more.
  Source: `docs:5_writing_ops/webaudio/webaudio`.

---

## 7. Data

- **Arrays** are JavaScript arrays. `Ops.Array` and its sub-namespaces hold
  185 ops. Point data is a flat array read in threes ("Array3": x, y, z,
  x, y, z…). The same shape feeds instancers, splines and point clouds.
  Ops exist to pack, unpack, sort, smooth, interpolate, look up, iterate
  and do maths. Source: ops index.
- Array ops should copy, not alias, their input, and give null when nothing
  is connected. Source: `docs:5_writing_ops/guidelines/guidelines`.
- The performance guide warns that array work every frame gets costly, and
  that fixed data should be built once.
  Source: `docs:9_performance_optimization/03_arrays/arrays`.
- **Objects** are JavaScript objects, in effect JSON. `Ops.Json` (42 ops)
  gets and sets keys, merges, parses and serialises. `Ops.Data.JsonPath`
  reads by path. `Ops.Data.Compose` builds arrays, objects and strings step
  by step along a trigger chain. Max's `dict` family does the same job.
  Source: ops index.
- Tables: `CsvArray` parses CSV. Uploaded `.csv` files become JSON.
  `SpreadSheetArray` is an editable grid in the op that outputs a flat
  array, rows, or one object per row. Source: `docs:0_howtouse/files/files`, `op:Ops.Data.SpreadSheetArray`.
- **Strings** (63 ops) include a Handlebars template op, Markdown to HTML,
  number formatting by locale, and Base64. Source: ops index.
- `Math.MathExpression` and `Array.Math.ArrayMathExpression` evaluate a
  typed expression. Source: ops index.
- HTTP: `HttpRequest` sets method, headers and body, and returns JSON, text
  or Base64. `HttpFetchStream` reads a streaming response. `CorsProxy`
  routes a URL through a cables proxy, in the editor only.
  Source: `op:Ops.Json.HttpRequest_v4`, `op:Ops.Net.CorsProxy_v3`, `docs:4_export_embed/cors/cors`.

---

## 8. Input and output devices

- **MIDI** uses the browser's Web MIDI. `MidiInputDevice` picks a device and
  splits events by type: Note, CC, NRPN, Program Change, Clock. Its Learn
  button makes the matching op for the next message received. `MidiClock`
  gives triggers for note divisions from 1/1 to 1/16, with dotted and
  triplet forms, and the BPM. Output ops send notes, CC and NRPN.
  Source: `op:Ops.Devices.Midi.MidiInputDevice_v2`, `op:Ops.Devices.Midi.MidiClock`.
- **OSC cannot arrive in a browser directly.** The web route is a helper
  program, osc2ws, that forwards OSC to a WebSocket; `Ops.Extension.Osc2Ws`
  ops then filter by address and have a Learn trigger. Real OSC ports exist
  only in the standalone build (`Ops.Extension.Standalone.Net.Osc_v2`,
  `OscSend`). Max is ahead here. Source: `op:Ops.Extension.Osc2Ws.Osc2WsNumber`,
  `op:Ops.Extension.Standalone.Net.Osc_v2`, `docs:faq/midi_osc/midi_osc`.
- **WebSocket** client ops are core: `WebSocket` and `WebSocketSend`.
  Source: `op:Ops.Net.WebSocket.WebSocket_v2`.
- **Shared state across clients.** `Ops.Extension.SocketCluster` connects
  patches through a server, by channel and topic. Objects and triggers are
  sent and received. One client at a time may send unless that is switched
  off, and the page warns about feedback loops. The standalone build can
  run the server itself. Source: `op:Ops.Extension.SocketCluster.SocketClusterClient_v2`,
  `op:Ops.Extension.Standalone.Net.SocketClusterServer`.
- **Camera and video.** `WebcamTexture` picks a device and a requested size
  and needs HTTPS in many browsers. `VideoTexture` plays a file to a texture with speed and
  seek. For smooth scrubbing the FAQ advises H.264 with frequent keyframes.
  Animated GIFs are not supported. Source: `op:Ops.Gl.Textures.WebcamTexture_v4`,
  `op:Ops.Gl.Textures.VideoTexture_v4`, `docs:faq/features/video_scrub/video_scrub`, `docs:faq/features/gif/gif`.
- **No Syphon or Spout.** The FAQ says a browser cannot share textures and
  suggests screen-capture software. Source: `docs:faq/technical/technical`.
- **Gamepad, keyboard, mouse, touch.** `GamePads` and `GamePad`, key ops,
  `Mouse`, `TouchScreen`, `TouchGesture`, `Pinch`.
  Source: ops index, `op:Ops.Devices.GamePad.GamePad`.
- **Phone sensors.** `MotionSensor` gives orientation, acceleration with and
  without gravity, and rotation rate. Also `GeoLocation`, `DeviceVibrate`,
  `ShakeGesture`, `ScreenOrientation`, and `DeviceOrientationCamera`, which
  steers the camera with the gyroscope. They work because the patch runs on
  the phone. Source: `op:Ops.Devices.Mobile.MotionSensor_v2`, ops index.
- **VR and AR.** `Ops.Devices.WebXr.Vr` has `Vr` (a VR or AR session,
  rendered per eye), `VrController` and `VrHand` (hand bones and rays).
  Source: `op:Ops.Devices.WebXr.Vr.Vr`, `op:Ops.Devices.WebXr.Vr.VrHand`.
- **Tracking and machine learning** are extensions. Mediapipe gives face
  mesh, hands and body pose, with an optional mask of the person. Teachable
  Machines runs image, audio and pose classifiers from a model URL.
  Trackingjs tracks a colour. Source: `https://cables.gl/ops/Ops.Extension.Mediapipe`,
  `op:Ops.Extension.Mediapipe.MpPoseTracking_v2`, `op:Ops.Extension.TeachableMachines.ImageClassifier_v2`.
- **Speech.** `Say` is text to speech. `SpeechRecognition` is speech to
  text; its page says audio goes to Google's servers and that browser
  support varies. Source: `op:Ops.Extension.Voice.Say_v2`, `op:Ops.Extension.Voice.SpeechRecognition`.
- **Standalone only**: read and write files, watch a folder, run an HTTP
  server, capture a window or screen as a texture (`DesktopTexture`), call
  FFmpeg. Source: ops index, `op:Ops.Extension.Standalone.DesktopTexture`.
- **Physics.** `Ops.Extension.Rapier3d` (14 ops) has rigid bodies, joints
  with motors, a character controller, height fields, ray casts, an emitter
  and a soft body. Source: ops index, `op:Ops.Extension.Rapier3d.Joint`, `op:Ops.Extension.Rapier3d.SoftBody`.

---

## 9. Writing ops in JavaScript

- An op is one JavaScript file. Its top-level code runs when the op is
  added. Ports are made with `op.inFloat`, `op.inInt`, `op.inBool`,
  `op.inString`, `op.inTrigger`, `op.inArray`, `op.inObject`, and the
  matching `op.out…` calls. Source: `docs:5_writing_ops/dev_ops/dev_ops`.
- Reactions are callbacks on ports: `onChange` for values, `onTriggered` for
  triggers, `onLinkChanged` for cables. `op.onLoaded` runs after the whole
  patch has loaded and `op.onDelete` cleans up.
  Source: `docs:5_writing_ops/dev_callbacks/dev_callbacks`.
- The port call decides the control drawn in the panel: a slider, a
  checkbox, `inDropDown` for a menu, `inStringEditor` for a code editor,
  `inTriggerButton` for a button. `setPortGroup` groups ports under a
  heading. Source: `docs:5_writing_ops/dev_creating_ports/dev_creating_ports`, `docs:5_writing_ops/dev_gui_ui_attributes/dev_gui_ui_attributes`.
- A MultiPort grows as cables are added.
  Source: `docs:5_writing_ops/dev_creating_ports/dev_multi_ports/dev_multi_ports`.
- Arrays and objects are sent with `setRef`, so a change is seen even when
  the reference is the same. Source: `docs:5_writing_ops/dev_creating_ports/dev_ports_array/dev_ports_array`.
- `op.setUiError` shows a hint, warning or error on the op.
  Source: `docs:5_writing_ops/dev_callbacks/dev_callbacks`.
- **Attachments** are text files stored with an op: shader source, data, a
  Web Worker's code. One whose name starts `inc_` is run before the op's
  code. Source: `docs:5_writing_ops/dev_attachments/dev_attachments`.
- **Libraries.** An op can depend on an uploaded script, a script at a URL,
  another op's libraries, a cables core library, or an npm package (npm in
  standalone only). WebAssembly is loaded from a Base64 attachment.
  Source: `docs:5_writing_ops/dev_libraries/dev_libraries`, `docs:6_2_standalone/3_using_npm/using_npm`.
- Selecting an op and pressing `e` opens its source. Core ops are readable
  that way. Source: `docs:5_writing_ops/dev_callbacks/dev_callbacks`.
- Every op has a documentation page with a summary, port notes and a linked
  example patch. It is made when the op is made.
  Source: `docs:5_writing_ops/dev_ops/dev_ops`.

---

## 10. Standalone

- The standalone build is the editor, the core and all ops in Electron. The
  docs list its uses: offline work, installations and VJ sets, local files,
  npm packages and native features, an outside code editor.
  Source: `docs:6_2_standalone/0_general/general`.
- Ops load from folders on disk in a set order, and an op higher in the
  order replaces one of the same name lower down. Op files are watched, so
  saving in another editor reloads the op.
  Source: `docs:6_2_standalone/1_coding_ops/coding_ops`.
- Launch flags: `--fullscreen`, `--maximize-renderer`, `--patch=<path>`,
  `--screen=` (a display by index, by name, "external", or a pixel offset),
  and two flags that choose the GPU.
  Source: `docs:6_2_standalone/5_standalone_faq/standalone_faq`.
- Files are addressed as URLs in the `file:` form, and ops convert between
  URLs and paths. Source: same page.
- A set of ops can be shared as a folder or as an npm-style package.
  Source: `docs:6_2_standalone/2_sharing_ops/sharing_ops`.

---

## 11. Export and embedding

- A patch exports as files that no longer need the cables server: the core
  script, a bundle of only the ops the patch uses, the patch as JSON, an
  assets folder and a sample `index.html`.
  Source: `docs:4_export_embed/dev_embed_webservers/dev_embed_webservers`.
- Export targets in the dialog: a ZIP of HTML, GitHub Pages, Netlify, an
  executable (Electron, built on the cables servers), an iframe embed, a
  command-line tool, and a full "Patch" export that the standalone can open
  and cables.gl can import again. Options cover which assets to include, one
  script file or several, and minifying code and GLSL.
  Source: `docs:4_export_embed/dev_embed/dev_embed` and its seven child pages.
- The Mac executable is unsigned, and the docs list the steps to make it
  open. Source: `docs:4_export_embed/dev_embed/export_exe/export_exe`.
- **Embedding.** `CABLES.EMBED.addPatch` puts a patch into a container
  element, or `new CABLES.Patch` uses a canvas made by the page. Options set
  the canvas, the asset path, error and finished-loading callbacks, and
  starting variable values. `pause` and `resume` stop and start rendering.
  A transparent canvas is supported in an export, not in an iframe.
  Source: `docs:4_export_embed/embedding/embedding`, `docs:faq/embedding/transparent_canvas/transpcanvas`.
- **Driving a patch from the page.** Variables can be set, read and watched
  from the page's JavaScript. `Ops.Cables.Function` gives a trigger a name
  the page can call, with up to three parameters. `Ops.Cables.CallBack`
  calls a function the page has defined. `UrlQueryParams` reads the URL.
  Source: `docs:4_export_embed/dev_embed_vars/dev_embed_vars`,
  `docs:4_export_embed/dev_embed_functions/dev_embed_functions`, `op:Ops.Cables.Function_v2`.
- Repositories with React and Vue components, a Cordova skeleton for phone
  apps and an Electron player are linked from the FAQ.
  Source: `docs:faq/javascript_frameworks/javascript_frameworks` and its child pages.
- An HTTP API with a key lists a user's patches and starts an export.
  Source: `docs:9_1_communication/api/api`.
- An exported page that loads assets must be served by a web server, not
  opened from disk. Data from another server needs that server's CORS
  headers. Source: `docs:faq/embedding/running_locally/running_locally`, `docs:4_export_embed/cors/cors`.
- Licence: the docs say everything needed to run a patch is MIT licensed,
  no licence is bought, and the main features stay free. Storage, upload
  size and exports per day have limits tied to supporter levels.
  Source: `docs:faq/licence_payment/licence/licence`, `docs:faq/licence_payment/payment/payment`.

---

## 12. Collaboration

- **Multiplayer.** Several people can be in one patch. One is the Pilot,
  and only the Pilot's changes are seen by the rest. Participants see each
  other's cursors and selections, follow the Pilot's view, and can ask for
  the pilot seat. The request is granted after 20 seconds if not answered.
  There is a chat. Source: `docs:5_1_permissions/4_multiplayer/multiplayer`.
- A patch is private, unlisted (view only, or openable in the editor), or
  public. A public patch can be opened in the editor by anyone and changed
  without saving, and cloned by any user. Collaborators get read-only or
  full access. Source: `docs:5_1_permissions/1_patches/patches`.
- Teams share patches and an op namespace. Patchlists are shareable lists
  of patches. Source: `docs:5_1_permissions/2_teams/teams`, `docs:5_1_permissions/5_patchlists/patchlists`.

---

## 13. Backups and versions

- A backup is the same file as a "Patch" export: the patch, its assets and
  its custom ops. An automatic backup is made before each export, and on
  load when the patch was saved since the last backup and both are more than
  30 minutes old. The newest 20 are kept. A backup is restored
  as a new patch, never over the original. Backup space depends on the
  supporter level. Source: `docs:4_export_embed/patch_backups/patch_backups`.
- An import makes a copy named "imported:" and turns every non-core op into
  a patch op of the copy. Source: `docs:4_export_embed/import/import`.
- Op versions are in section 1.
- New work appears first on `dev.cables.gl`. A patch that uses an `Ops.Dev`
  op will not open on the main site until the next release.
  Source: `docs:faq/general/dev/dev`.

---

## 14. Performance and debugging

- `Performance`, placed right after `MainLoop`, shows frames per second, CPU
  and GPU time per frame, and counts of shader binds, uniforms, primitives,
  meshes, mesh uploads, render-to-texture passes and image-compose passes.
  Source: `docs:9_performance_optimization/01_tools/tools`.
- **Flow mode** (the `f` key) shows activity on every cable, to find
  branches that run more often than they need to. Source: same page.
- The Profiler (Tools menu) reports CPU use per op and per subpatch.
  Source: `docs:9_performance_optimization/01_tools/02_profiler/profiler_howto`.
- The search-by-halving method: unplug branches under `Performance` until
  the frame time recovers.
  Source: `docs:9_performance_optimization/01_tools/01_performance/performance`.
- Usual causes: trigger loops with high counts, and blurs on large textures
  (use a smaller `ImageCompose` or `FastBlur`).
  Source: `docs:9_performance_optimization/02_usual_suspects/usual_suspects`.
- `StepDebugTrigger` and `StepDebugNumber` feed a patch debugger opened from
  the command palette. Source: `op:Ops.Debug.StepDebugger.StepDebugTrigger`.

---

## 15. Files

- Files are dragged onto the editor window. Listed types: images and video
  (`.png`, `.jpg`, `.webp`, `.svg`, `.exr`, `.hdr`, `.mp4`, `.webm`, `.mov`
  and others), audio, fonts, 3D (`.glb`, `.fbx`, `.dae`) and `.mid`.
  Source: `docs:0_howtouse/files/files`.
- Some files are converted on upload: FBX to GLB, HDR to an RGBE PNG, CSV to
  JSON, MIDI to JSON, a point-cloud text file to JSON. Others are converted
  by hand in the file browser: GLB to Draco-compressed GLB, SVG to a point
  array, Collada line strips, TTF to an SDF font, and image resizing and
  recompression. Source: same page.

---

## 16. Where the docs show cables behind Max

Each of these is stated on a cables page. They matter when choosing between
the two tools.

- Audio is two channels in and out, and no signal-rate patching (section 6).
- No Syphon, Spout or other texture sharing (section 8).
- OSC needs a bridge in the browser (section 8).
- Video codecs are whatever the browser, or Electron, can play.
  Source: `docs:6_2_standalone/5_standalone_faq/standalone_faq`.
- A web page cannot be used as a texture, per the FAQ. An extension op,
  `HtmlToTexture`, exists and outputs an image data URL of an element, but
  its page has no description, so what it can do is not known.
  Source: `docs:faq/features/htmltexture/htmltexture`, `op:Ops.Extension.HtmlToTexture.HtmlToTexture`.
- Projection mapping is a single quad-warp op (section 2).
- No DMX, Art-Net, laser or lighting-fixture ops appear in the op index.
