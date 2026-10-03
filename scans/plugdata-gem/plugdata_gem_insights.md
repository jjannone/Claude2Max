# Gem Insights (as bundled in plugdata)

Notes on how Gem works, read out of its own help patches, examples and manual
on 2026-10-02. Written for a reader who knows Jitter and has never opened Gem.

Gem is the Graphics Environment for Multimedia: the OpenGL and video library
for Pure Data. It was written by Mark Danks and is now maintained by
IOhannes m zmölnig. plugdata 0.9.3 bundles it. Its Max counterpart is Jitter,
and the oldest line of its release notes says where it came from: version 0.50
"made the port from Max over to Pd". (`R:gem.release_notes.txt`,
`M:Intro.html`, `M:GemFaq.html` 1.1)

**Where these notes come from.** Every entry names the file it was read from.
Nothing here is from memory. Three sources were read:

- the local plugdata copy: 238 help patches, 172 example patches, 18
  abstractions, the HTML manual, the FAQ, the release notes;
- the upstream repository `https://github.com/umlaeute/Gem`: the README and
  nine help patches that the plugdata copy does not include;
- plugdata's release notes for 0.9.0 and 0.9.2.

`plugdata_gem_crawl_state.json` says which files were read and which were not.
Gem's home page `https://gem.iem.at/` could not be read at all (it answers with
a bot-check page), and the 19-page `GemPrimer.pdf` could not be decoded on this
machine. So the concept-level material below rests on the manual, the FAQ and
the patches, not on the primer.

**Short forms used for sources.** All paths are relative to
`~/Documents/plugdata/`.

| Short form | Means |
|---|---|
| `H:name` | `Documentation/14.gem/name-help.pd` |
| `E:folder/file` | `Documentation/14.gem/examples/folder/file` |
| `M:page.html` | `Documentation/14.gem/examples/Documentation/manual/page.html` |
| `R:file` | `Documentation/14.gem/examples/Documentation/file` |
| `A:name` | `Abstractions/Gem/name.pd` |
| `U:path` | `https://github.com/umlaeute/Gem/blob/HEAD/path` |

**Object names are spelled as the help files spell them**, in square brackets
the way Pd writes an object box: `[gemhead]`, `[pix_texture]`.

**How the patches were read.** A `.pd` file is text. The scan's extractor pulls
out the comments, the object boxes and the message boxes. It does not follow
the cords. So these notes report what each object is documented to do and
which objects appear together in a patch, and are careful about claiming
exactly how they are wired.

---

## 1. The render model

### A picture is a chain of objects, and the chain is the patch cord

In Jitter, a shape is one object with attributes: position, rotation, colour,
texture, layer. In Gem a shape is the bottom of a chain. The chain starts at a
`[gemhead]`, runs down through objects that each change one piece of drawing
state, and ends at a "geo" that draws with whatever state has built up:

`[gemhead]` → `[color 1 0 0]` → `[rotateXYZ]` → `[square]`

The manual states it plainly: `[color]` sets the colour "for all objects after
it in the chain", and the manipulators "transform any object which appears
after it". A chain with no `[gemhead]` at the top draws nothing.
(`M:BasicObj.html`, `H:gemhead`, `E:01.basic/01.redSquare.pd`)

What travels down the cord is a special message with the selector `gem_state`.
Only `[gemhead]` makes it; the help says not to try to build one yourself. It
is sent once per frame, so printing it floods the console. (`H:Gem`)

**For a Jitter patcher:** the transform, the colour and the texture of a Gem
shape are not on the shape. They are whatever boxes sit above it on the cord.
To find out why a shape is red, read upward. The upside is that the whole
drawing recipe is visible in the patch, in order, with nothing in an
Inspector.

### State changes pile up; order on the cord is order of application

`[translateXYZ]` then `[rotateXYZ]` is not the same as the reverse, because
each one multiplies the current transformation matrix. `[accumrotate]` adds
each incoming value to the rotation it already holds, and takes `reset`.
(`H:translateXYZ`, `H:rotateXYZ`, `H:accumrotate`)

The state objects fall into families:

| Family | Objects | What they change |
|---|---|---|
| Transform | `[translate]` `[translateXYZ]` `[rotate]` `[rotateXYZ]` `[accumrotate]` `[scale]` `[scaleXYZ]` `[shearXY]` `[shearXZ]` `[shearYX]` `[shearYZ]` `[shearZX]` `[shearZY]` | the model matrix |
| Colour | `[color]` `[colorRGB]` | draw colour, RGB or RGBA |
| Material | `[ambient]` `[diffuse]` `[specular]` `[emission]` (each with an `RGB` twin) `[shininess]` | lit-surface colours; need lighting on |
| Blend and depth | `[alpha]` `[depth]` `[polygon_smooth]` | blending, depth test, edge smoothing |
| Projection | `[ortho]` | perspective off for what follows |
| Texture | `[pix_texture]` `[pix_coordinate]` `[pix_multitexture]` | which image is the texture, and its coordinates |
| Shader | `[glsl_program]` `[vertex_program]` `[fragment_program]` | which shader draws what follows |

Each has a vector form and a three-inlet form: `[translate]` takes an amount
and an axis, `[translateXYZ]` takes three numbers on three inlets.
(`M:BasicObj.html`, the help file of each object)

### Branches share state unless a `[separator]` isolates them

When one chain splits to two geos, a transform in one branch leaks into the
other, depending on which is drawn first. `[separator]` saves the matrices
when the frame reaches it and restores them when everything below it has been
drawn, so branches stop affecting each other. It can be told which matrices to
save: model, colour, texture, projection. The help warns that colour is not
restored by it: a `[color]` in one branch carries into branches drawn later.
For image chains the matching object is `[pix_separator]`, another name for
`[pix_buf]`. (`H:separator`, `H:pix_buf`, `E:02.advanced/01.Separator.pd`)

**Jitter equivalent:** there is no leak to guard against, because each
`jit.gl.*` object owns its own position, rotation and scale. Shared transforms
are built on purpose, with `jit.anim.node` parents or a `jit.gl.node` group.

### Render order is a number on the `[gemhead]`

Every `[gemhead]` has a priority, default 50, given as an argument or with
`set <n>`. Lower numbers are drawn first. Negative numbers are drawn after all
positive ones, and they are not moved by changes of viewpoint, which makes them
the way to draw a logo or a help text on top of a moving scene. Among negative
numbers, -3 is drawn before -10. (`H:gemhead`, `E:02.advanced/03.View_OSD.pd`)

Order matters in three places the help files name:

- **Transparency.** A see-through object must be drawn after what shows
  through it, so its `[gemhead]` gets a high number. In a scene where objects
  pass in front of and behind each other, the patch changes the number while
  it runs with `set`. (`H:alpha`, `E:02.advanced/14.RenderOrder.pd`)
- **Lights.** A light has to be set before the things it lights are drawn, so
  its `[gemhead]` gets a low number such as 1. (`H:light`, `H:world_light`)
- **Framebuffers.** A chain that renders into a texture must run before the
  chain that uses the texture. (`H:gemframebuffer`)

**Jitter equivalent:** the `layer` attribute, which the common OB3D refpage
describes as drawing "low to high" and adds that objects in one layer have no
guaranteed order. The difference is that Jitter also depth-tests by default,
which overrides layers, so order in Jitter is `layer` plus `depth_enable`.

### Depth and blending are objects in the chain too

`[alpha]` turns on blending for what follows; its second inlet picks the
OpenGL blend function by number. `[depth]` is easy to misread: by default it
turns the depth test **off** for the objects below it. (`H:alpha`, `H:depth`)

### The window: `[gemwin]`

`[gemwin]` creates and destroys the window and starts and stops rendering:
`create`, `destroy`, `1`, `0`. Defaults read from the help: 500 × 500 pixels,
20 frames a second, camera at `0 0 4` looking down the z axis, clipping planes
`-1 1 -1 1 1 20`. The FAQ gives the consequence: about -4 to 4 is visible in x
and y at the origin. (`H:gemwin`, `M:GemFaq.html` 6.2)

Some settings only take effect before the window is made (size, position,
border, full-scene anti-aliasing with `FSAA`, single or double buffering), so
the idiom is `destroy`, set, `create`. Others are live: `color` (background),
`view`, `perspec`, `lighting`, `fog`, `fogmode`, `fogcolor`, `stereo`,
`cursor`, `title`. (`H:gemwin`)

Things `[gemwin]` holds that Jitter keeps elsewhere:

- **The camera.** `view x y z`, with optional azimuth and elevation, or a full
  eye / target / up form with nine numbers. `perspec` sets the frustum.
- **The lighting switch.** `lighting 1` is global. The manual warns that it
  stays on after the window is destroyed, so a later patch can open black until
  lighting is turned off or lights are added. (`M:Lighting.html`,
  `M:GemFaq.html` 3.1)
- **Fog and stereo.** `stereo 1` is two side-by-side views, `2` is red/green,
  `3` needs hardware glasses; `stereoSep` and `stereoFoc` tune it.
  (`H:gemwin`, `E:02.advanced/05.Stereo.pd`)
- **Single-buffer mode.** `buffer 1` stops the window clearing itself, which
  gives a painting effect, and then a chain draws only when its `[gemhead]`
  is banged. (`H:gemwin`, `H:depth`, `E:04.video/01.VideoPaint.pd`)
- **Profiling.** `profile 1` prints milliseconds per frame; `profile 2` also
  turns off image caching to show the cost of the pix objects.
  (`M:GemFaq.html` 2.7)

In the plugdata copy `[gemwin]` and `[gemhead]` are Pd abstractions, not
compiled objects. `[gemhead]` is built on `[gemreceive __gem_render 50]`: a
receive with a priority number. That is the whole render-order mechanism.
`[gemwin]` wraps a `[gemdefaultwindow]` and a `[gemmanager]`.
(`A:gemhead`, `A:gemwin`, `H:gemreceive`, `H:gemmanager`)

### A frame is an ordinary Pd message, so ordinary Pd objects work on it

Since release 0.888 the chain is not compiled into a fixed tree. The release
notes list what that allows: turn part of a scene off with `[spigot]`, draw a
sub-tree several times with `[t a a]`, add objects while it runs.
(`R:gem.release_notes.txt` 0.888)

The examples build on it:

- `[gemlist]` stores the current state and sends it again on a bang, so an
  `[until]` loop draws one geo many times, each pass adding a little more
  transform. `[gemrepeat 100]` does the same in one object.
  (`H:gemlist`, `E:02.advanced/19.pointer.pd`,
  `E:02.advanced/20.double-gemhead_vs_repeat.pd`)
- A subpatch that sends the frame back into itself, with a depth counter,
  draws spirals and trees. A six-patch tutorial walks from copy-and-paste
  through iteration to recursion. (`E:13.recursion/01`–`06`)
- `[t a b]` gives a bang before or after part of a chain is drawn. The older
  `[render_trigger]` did this and its help now says to use `[trigger]`.
  (`H:render_trigger`, `E:02.advanced/08.Snapshot2.pd`)
- `[gemlist_info]` and `[gemlist_matrix]` read the transform that has built up
  at that point on the cord, as position, rotation, scale and shear, or as 16
  numbers. (`H:gemlist_info`, `H:gemlist_matrix`)

### Multiple windows

A second argument to `[gemwin]` names a context: `[gemwin 20 a]` and
`[gemwin 20 b]` are two windows. A chain is sent to one of them with the
message `context b` to its `[gemhead]`, and can be switched while running.
Sharing a texture between the two windows depends on the operating system,
the driver and the window backend; on Linux only one backend supports it.
(`H:gemwin`, `H:gemhead`, `E:14.multiple_windows/01`–`03`)

The window itself comes from a backend object, one per toolkit:
`[gemglfw3window]`, `[gemsdl2window]`, `[gemmacoswindow]`, `[gemcocoawindow]`,
`[gemglxwindow]`, `[gemw32window]` and older ones. They share the standard
messages and each adds a few. `[gemsdl2window]` documents window opacity,
keeping the mouse inside the window, relative mouse movement, and file
drag-and-drop reported as a `drop` event. `[gemglfw3window]` can ask for a
specific OpenGL profile or OpenGL ES. (`H:gemsdl2window`, `H:gemglfw3window`,
`H:gemmacoswindow`)

### Init messages in the object box

Any Gem object can be given messages in its box after a semicolon:
`[rectangle 4 3; draw line; width 3]`. They are sent to the object when it is
made, before it is connected, so they can set its state but cannot reach
anything downstream. `[gemargs]` lets an abstraction read its own box the same
way. (`H:Gem`, `H:gemargs`)

---

## 2. The object families, and how each maps to Jitter

### Geos: the things that draw

`[square]` `[rectangle]` `[circle]` `[triangle]` `[cube]` `[cuboid]` `[sphere]`
`[cone]` `[cylinder]` `[disk]` `[torus]` `[tube]` `[teapot]` `[trapezoid]`
`[polygon]` `[curve]` `[primTri]` `[colorSquare]` `[pqtorusknots]`
`[mesh_square]` `[mesh_line]`. Most take a size, some a segment count, and
nearly all take `draw line | fill | point`. `[rectangle]` spans from minus to
plus its width, so it is twice the number given. (`H:rectangle`,
`M:BasicObj.html`, the help file of each)

Geos with behaviour built in:

- `[newWave]` is a grid on a mass-spring system: it takes forces at grid
  points, spring and damping constants, and noise. `[ripple]` and `[rubber]`
  are grids you grab at a point and let go. (`H:newWave`, `H:ripple`,
  `H:rubber`)
- `[curve3d]` is a Bézier surface and `[surface3d]` a bicubic one that passes
  through its control points; both take a grid of control points set one at a
  time with `set`. (`H:curve3d`, `H:surface3d`)
- `[sphere3d]` lets each vertex of a sphere be moved. (`H:sphere3d`)
- `[imageVert]` turns an image into polygons whose height is the pixel
  brightness. (`H:imageVert`)
- `[scopeXYZ~]` draws three audio signals as one line in 3D. (`H:scopeXYZ~`)
- `[model]` loads Wavefront OBJ files, and more through an ASSIMP backend;
  `rescale` must be sent before `open`; `group` draws one part.
  `[multimodel]` loads a numbered set. (`H:model`, `H:multimodel`)
- `[gemvertexbuffer]` draws a vertex buffer whose positions, colours, normals,
  texture coordinates and custom shader attributes are read from Pd tables.
  Since `[tabwrite~]` fills tables at audio rate, a signal can drive geometry
  directly. (`H:gemvertexbuffer`, `E:10.glsl/16.vertexbuffer_attributes.pd`)

**Jitter:** `jit.gl.gridshape`, `jit.gl.plato`, `jit.gl.nurbs`, `jit.gl.model`,
`jit.gl.mesh`. Jitter has fewer named shapes and one general object,
`jit.gl.mesh`, fed by matrices. Gem has no general matrix type, so its
equivalent of "geometry from data" is tables into `[gemvertexbuffer]`.

### Lights and materials

`[world_light]` is a light at infinite distance (direction only),
`[light]` a point light, `[spot_light]` a spot with attenuation and cone
angle. They are placed with `[rotate]` and `[translate]` above them in their
own chain. `debug 1` draws a marker where the light is. Gem allows at most
eight lights. Lighting is per vertex, so a big flat square lit by a close
point light looks wrong unless it has more vertices. (`H:light`,
`H:world_light`, `H:spot_light`, `M:Lighting.html`)

**Jitter:** `jit.gl.light` (its refpage lists directional, point and spot, and
shadows), `jit.gl.material`, `jit.gl.pbr`. Jitter is well ahead here.

### pix: images and video, on the CPU

A pix chain is also a `[gemhead]` chain. A source object puts an image into
the frame message, pix objects change it, and `[pix_texture]` hands it to the
graphics card as the texture for the geo below. Anything after `[pix_texture]`
has no effect on the picture. (`M:Images.html`, `M:Texture.html`,
`H:pix_texture`)

Three things a Jitter patcher should know first:

1. **pix processing is on the CPU and is cached.** The manual says Gem "only
   reprocesses images when the source image changes or one of the parameters
   for a pix object changes". A still image through ten effects costs nothing
   after the first frame. `[pix_buf]` stores a result so that an expensive
   branch above it is not redone. The help files for `[pix_gain]` and
   `[pix_color]` tell the reader to use `[color]` on the geo instead when the
   effect is the same, because that runs on the graphics card.
   (`M:Pixes.html`, `H:pix_buf`, `H:pix_gain`, `H:pix_color`)
2. **Two-image objects overwrite the left image.** `[pix_add]` and its
   relatives take a second chain in the right inlet and write the result into
   the left image; `[pix_buf]` keeps an untouched copy when one is needed.
   Both images must be the same size. (`E:04.pix/12.blending.pd`,
   `H:pix_add`)
3. **The colour space is not guaranteed.** A pix is RGBA, YUV or grey.
   `[pix_film]` may give YUV on macOS and RGB on Linux for the same file, and
   objects that take a colour as a parameter, such as `[pix_chroma_key]`,
   then behave differently. The help says to convert explicitly with
   `[pix_rgba]`, `[pix_yuv]` or `[pix_grey]`. Pixels are 8-bit;
   `[pix_sig2pix~]` and `[pix_snap]` can make float images, but their help
   says almost no other pix object can handle them. (`H:pix_film`,
   `H:pix_chroma_key`, `H:pix_convert`, `H:pix_sig2pix~`)

The pix objects by job:

| Job | Objects | Nearest Jitter |
|---|---|---|
| Sources | `[pix_image]` `[pix_multiimage]` `[pix_imageInPlace]` `[pix_film]` `[pix_movie]` `[pix_video]` `[pix_noise]` `[pix_test]` `[pix_set]` | `jit.matrix` (`importmovie`), `jit.movie`, `jit.grab`, `jit.noise` |
| To the screen | `[pix_texture]` `[pix_coordinate]` `[pix_multitexture]` `[pix_draw]` (slow) | `jit.gl.texture`, the `texture` attribute |
| Colour and levels | `[pix_gain]` `[pix_offset]` `[pix_contrast]` `[pix_levels]` `[pix_normalize]` `[pix_invert]` `[pix_curve]` `[pix_colormatrix]` `[pix_threshold]` `[pix_duotone]` `[pix_posterize]` `[pix_colorreduce]` `[pix_bitmask]` | `jit.op`, `jit.charmap`, `jit.traffic`, `jit.fx.*` |
| Colour space | `[pix_rgba]` `[pix_yuv]` `[pix_grey]` `[pix_convert]` `[pix_2grey]` `[pix_rgb2hsv]` `[pix_hsv2rgb]` | `jit.colorspace`, `colormode` |
| Two-image mixing | `[pix_add]` `[pix_subtract]` `[pix_multiply]` `[pix_diff]` `[pix_mix]` `[pix_compare]` `[pix_composite]` `[pix_mask]` `[pix_takealpha]` `[pix_chroma_key]` | `jit.op`, `jit.xfade`, `jit.alphablend`, `jit.chromakey`, `jit.fx.co.*` |
| Alpha | `[pix_alpha]` `[pix_coloralpha]` `[pix_a_2grey]` | `jit.pack` / `jit.op` |
| Geometry of the image | `[pix_crop]` `[pix_resize]` `[pix_flip]` `[pix_roll]` `[pix_roi]` `[pix_zoom]` `[pix_scanline]` `[pix_deinterlace]` | `jit.matrix` source and destination dims, `jit.submatrix` |
| Spatial filter | `[pix_convolve]` | `jit.convolve`, `jit.fx.cf.*` |
| Time | `[pix_delay]` `[pix_motionblur]` `[pix_tIIR]` `[pix_biquad]` `[pix_rtx]` | `jit.fx.tp.delay`, `jit.slide`, `jit.fx.tp.filter`, `jit.fx.tp.warp` |
| Looks | `[pix_aging]` `[pix_halftone]` `[pix_dot]` `[pix_kaleidoscope]` `[pix_metaimage]` `[pix_refraction]` `[pix_backlight]` `[pix_lumaoffset]` `[pix_puzzle]` `[pix_rds]` | `jit.roy`, `jit.eclipse`, `jit.rubix`, Vizzie `vz.kaleidr` |
| Analysis | `[pix_blob]` `[pix_multiblob]` `[pix_blobtracker]` `[pix_movement]` `[pix_movement2]` `[pix_background]` `[pix_colorclassify]` `[pix_equal]` `[pix_threshold_bernsen]` `[pix_histo]` `[pix_mean_color]` `[pix_data]` `[pix_dump]` `[pix_info]` | `jit.findbounds`, `jit.3m`, `jit.histogram`, `jit.matrix getcell`, `jit.spill`; cv.jit package |
| Storage | `[pix_buf]` `[pix_buffer]` `[pix_buffer_read]` `[pix_buffer_write]` `[pix_buffer_filmopen]` | `jit.matrix`, `jit.matrixset`, `jit.gl.textureset` |
| Screen capture | `[pix_snap]` `[pix_snap2tex]` `[pix_write]` `[pix_writer]` `[pix_record]` | `jit.world @output_matrix`, `jit.gl.asyncread`, `jit.matrix exportimage`, `jit.record` |
| Audio | `[pix_sig2pix~]` `[pix_pix2sig~]` | `jit.poke~`, `jit.peek~`, `jit.catch~`, `jit.release~` |
| Other processes | `[pix_share_read]` `[pix_share_write]` | Syphon package (textures, macOS) |
| Plugin hosts | `[pix_freeframe]` `[pix_frei0r]` | `jit.freeframe` |

Notes on particular ones:

- `[pix_film]` shows the frame whose number arrives at its right inlet. It
  plays by itself only after `auto 1`, and in auto mode it does not loop: the
  third outlet bangs at the end and the patch sends frame 0. `[pix_movie]` is
  `[pix_film]` and `[pix_texture]` in one: faster, but no pix processing.
  (`H:pix_film`, `H:pix_movie`, `E:04.pix/05.film.pd`)
- Reading films, cameras, images and models, and writing movies, all go
  through plugins. A source object takes `backend <name>` to pick one, and
  lists its properties with `enumProps`; `setProps` queues several changes and
  `applyProps` applies them at once. The README names capture backends for
  V4L2, DeckLink, NDI, VLC, VNC and several industrial camera SDKs. Which
  plugins the plugdata build includes was not found in any file read.
  (`H:pix_video`, `H:pix_film`, `H:pix_record`, `H:model`, `U:README.md`)
- `[pix_tIIR]` is a filter along time with as many feedback and feed-forward
  taps as its arguments ask for, one inlet per coefficient. `[pix_biquad]` is
  the two-pole case and takes the same six coefficients as Pd's `[biquad~]`.
  (`H:pix_tIIR`, `H:pix_biquad`, `E:04.pix/22.biquad.pd`)
- `[pix_rtx]` swaps the time axis and the x axis of a video. It keeps
  width × width × height × 4 bytes in memory. (`H:pix_rtx`)
- `[pix_multiblob]` finds up to N blobs by brightness and reports a row per
  blob: weighted centre, size, bounding box, and the angle of its main axis.
  `[pix_blobtracker]` is an abstraction on top that keeps blob numbers
  steady between frames; it needs the iemmatrix library. (`H:pix_multiblob`,
  `H:pix_blobtracker`, `A:pix_blobtracker`)
- `[pix_imageInPlace]` sends a numbered set of images straight to texture
  memory on `download`, so switching between them is instant, at the price of
  no pix processing. (`H:pix_imageInPlace`, `M:Texture.html`)
- `[pix_freeframe]` and `[pix_frei0r]` load a plugin by name and grow one
  inlet per plugin parameter. (`H:pix_freeframe`, `H:pix_frei0r`)
- `[pix_share_write]` and `[pix_share_read]` pass images through shared
  memory to another Pd on the same machine. (`H:pix_share_write`)

### Textures

`[pix_texture]` is the explicit moment an image becomes a texture. Its
messages are the texture's settings: `quality` (nearest or linear), `repeat`,
`rectangle`, `env` (how the texture combines with the current colour),
`texunit` for shaders. It prefers rectangle textures, which cannot repeat and
which use pixel coordinates; send `rectangle 0` when a geo or a shader expects
0-to-1 coordinates. (`H:pix_texture`, `H:pix_coordinate`,
`M:GemFaq.html` 4.1)

One `[pix_image]` → `[pix_texture]` can feed several geos, each with its own
transform. (`E:07.texture/09.sharedTextures.pd`, `M:Texture.html`)

**Jitter:** `jit.gl.texture` has the same rectangle default and the same
consequence: its refpage says a rectangle texture must be sampled with
`sampler2DRect`. In Jitter most objects make the texture for you when a matrix
arrives; in Gem you always place `[pix_texture]` yourself.

### Framebuffers: rendering into a texture

`[gemframebuffer]` sits in a chain; everything below it is drawn into a
texture instead of the window. A second chain then uses that texture. Messages
set its size (`dimen`), pixel type (`type BYTE | INT | FLOAT`), format
(`format RGB | RGBA | RGB32 | RGBA32F | YUV`), background `color`, its own
`perspec`, and the texture unit. Its viewpoint is the origin, not `0 0 4` as
in the window, so the examples put a `[translateXYZ 0 0 -4]` under it.
Several `[gemhead]`s can draw into one framebuffer.
(`H:gemframebuffer`, `E:07.texture/10.framebuffer.pd`,
`E:07.texture/11.multiples_gemhead_in_a_framebuffer.pd`,
`E:07.texture/12.floatingpoint_framebuffer.pd`)

`[gemcubeframebuffer]` renders a scene into the six faces of a cube map; its
help then maps the cube map onto a sphere or unwraps it to a flat panorama
with two shaders that ship beside the help file. (`H:gemcubeframebuffer`)

`[pix_snap2tex]` copies the window into a texture, which is how the feedback
and motion-blur examples work. `[pix_snap]` copies it back to a CPU pix.
(`H:pix_snap2tex`, `H:pix_snap`, `E:07.texture/07.feedback.pd`,
`E:07.texture/08.MotionBlur.pd`)

**Jitter:** `jit.gl.node @capture 1`, `jit.gl.camera @capture 1`,
`jit.world @output_texture 1`, then a texture cord.

### Shaders

`[glsl_vertex]`, `[glsl_fragment]` and `[glsl_geometry]` each load and compile
one plain GLSL file and send out a module number. `[glsl_program]` takes
`link <numbers>` and becomes a state object in the chain. It finds the
shader's uniform variables by itself; a uniform called `bla` is set by sending
the message `bla 0.5`. A uniform array can be filled from a Pd table by
sending the table's name. Uniform values survive a re-link unless
`keepuniforms 0`. (`H:glsl_program`, `H:glsl_fragment`,
`E:02.advanced/18.gl_shading_language.pd`)

Upstream Gem also has `[glsl]`, one object that takes a base name and looks
for `.vert`, `.frag` and `.geom` files; its help lists compute and
tessellation file endings in brackets. That object's help is not in the
plugdata copy. (`U:help/glsl-help.pd`)

A shader replaces the fixed pipeline, so lighting has to be computed in the
shader. (`E:10.glsl/17.light.pd`)

The glsl examples are a course in themselves: texture effects, vertex
distortion, a game of life by feedback, mixing textures of different sizes,
multi-pass rendering through framebuffers, reading a texture in the vertex
shader, a cloth simulation computed entirely in shaders, geometry shaders,
panorama stitching, a separable blur built from fourteen small passes, and an
oscillator bank whose amplitudes are computed on the graphics card and read
back as audio. (`E:10.glsl/01`–`18`)

The older `[vertex_program]` and `[fragment_program]` load ARB assembly
shaders; their parameters are set with an OpenGL wrapper object.
(`H:vertex_program`, `H:fragment_program`)

**Jitter:** `jit.gl.shader` and `jit.gl.slab` load a JXS file, an XML wrapper
that declares each parameter and binds it to a program; values are set with
`param <name> <value>`. `jit.gl.pix` builds the shader from a Gen patcher, and
`jit.gl.pass` chains post-processing passes. Gem is plainer to start with
(drop in a `.frag` file); Jitter has far more ready-made.

### OpenGL wrapper objects: `GEMgl*`

There is a Gem object for nearly every OpenGL 1.2 call, named `GEM` plus the
function name: `[GEMglBegin]`, `[GEMglVertex3f]`, `[GEMglPushMatrix]`,
`[GEMglStencilFunc]`, `[GEMglNewList]`. `[GLdefine]` turns a constant name
such as `GL_LINES` into its number. The manual counts more than 250. They sit
in a chain like any other object. They have no individual help; the upstream
help points to the OpenGL reference. (`M:ListObjects.html`, `H:GLdefine`,
`H:GEMglBegin`, `U:help/GEMgl-help.pd`)

The examples show what they are for: drawing a polygon vertex by vertex,
compiling a display list, masking with the stencil buffer, clearing only the
depth buffer mid-frame, and resetting the transform with
`[GEMglLoadIdentity]`. (`E:09.openGL/01`–`05`)

**Jitter:** `jit.gl.sketch` takes a subset of OpenGL calls as messages
(`glbegin`, `glvertex`, `glpushmatrix` and others), and `jit.gl.lua` scripts
OpenGL in Lua. Neither is one box per call in the render path.

### Particles: `part_*`

A particle system is again a chain: `[part_head]` starts it (argument: the
most particles alive at once, default 1000), creation objects set the
properties of new particles, `[part_source]` emits a number per frame,
behaviour objects act on them, and a renderer ends the chain.
(`H:part_head`, `R:gem.release_notes.txt` 0.79, `E:06.particle/01`–`09`)

| Stage | Objects |
|---|---|
| New-particle properties | `[part_color]` `[part_size]` `[part_velocity]` `[part_vertex]` |
| Emit | `[part_source]` |
| Behaviour | `[part_gravity]` `[part_damp]` `[part_orbitpoint]` `[part_follow]` `[part_targetcolor]` `[part_targetsize]` |
| Remove | `[part_killold]` `[part_killslow]` `[part_sink]` |
| Draw or read | `[part_draw]` `[part_render]` `[part_info]` `[part_information]` `[part_move]` |

`[part_source]`, `[part_velocity]` and `[part_sink]` share one vocabulary of
shapes, called domains: point, line, triangle, plane, box, sphere, cylinder,
cone, blob, disc, rectangle, each with up to nine numbers. So "emit from a
disc, with velocities inside a cone, and die on reaching a plane" is three
boxes. (`H:part_source`, `H:part_velocity`, `H:part_sink`)

`[part_draw]` draws points or lines. `[part_render]` draws whatever chain is
under it once per particle, so a particle can be a cube or a model.
`[part_information]` sends each particle's position, colour, velocity, size
and age out as messages, once per particle per frame. (`H:part_render`,
`H:part_information`, `H:part_move`)

Without a kill object the source stops emitting once the maximum is reached.
(`H:part_head`)

**Jitter:** `jit.p.shiva`, `jit.p.vishnu` and `jit.p.bounds` keep particles in
a matrix, drawn with `jit.gl.mesh` or `jit.gl.multiple`. The Compute package
installed on this machine adds `jit.gp.world`, `jit.gp.emitter`,
`jit.gp.force`, `jit.gp.obstacle` and `jit.gp.render` on the graphics card.

### Text

`[text2d]` (flat, not transformed in 3D), `[text3d]`, `[textextruded]` (with
`depth`), `[textoutline]`. Each loads a TrueType file with `font`, takes
`text`, `justify`, and `string` followed by Unicode code points. Changing the
font size rebuilds the glyphs; the help says scaling is much faster.
(`H:text2d`, `H:text3d`, `H:textextruded`, `H:textoutline`)

**Jitter:** `jit.gl.text`, whose `mode` attribute chooses 2D, 3D or outline
and whose `depth` extrudes.

### Input from the window

`[gemmouse]` gives x, y and three buttons, in pixels or scaled by its
arguments. `[gemkeyboard]` gives a key code and `[gemkeyname]` a name and an
up/down state; both help files warn that the values differ between window
backends. `[gemtablet]` and `[gemorb]` are now stand-ins that print an error
and point to `[hid]`. (`H:gemmouse`, `H:gemkeyboard`, `H:gemkeyname`,
`A:gemorb`, `A:gemtablet`)

### Utilities

`[linear_path]` and `[spline_path]` read a table as a path: a number from 0
to 1 in, an interpolated point of any dimension out. `[camera]` turns
messages such as `forward`, `left`, `lookX` into a `view` message.
`[hsv2rgb]`, `[rgb2hsv]`, `[rgb2yuv]`, `[yuv2rgb]` convert colour lists.
`[gemreceive]` is a `[receive]` with a priority number: among receivers of
one name, lower numbers get the message first. (`H:linear_path`,
`H:spline_path`, `H:camera`, `H:hsv2rgb`, `H:gemreceive`)

---

## 3. Gem inside plugdata

- plugdata 0.9.0 shipped with Gem turned off as "not stable enough yet".
  0.9.2 brought it back as "experimental Gem support". The local copy is
  0.9.3. (`https://github.com/plugdata-team/plugdata/releases/tag/v0.9.0`,
  `.../v0.9.2`)
- Object names need the prefix `Gem/` unless "Gem" is added to the Libraries
  list under settings → paths. Every help patch carries `[declare -lib Gem]`,
  which is the Pd way to load the library for that patch. (same release note;
  every `H:` file)
- plugdata builds Gem from its own fork, `plugdata-team/plugdata-gem`, which
  GitHub reports as a fork of `umlaeute/Gem`.
- The plugdata copy differs from upstream. It lacks four upstream help files
  (`GEMgl`, `glsl`, `modelfiler`, `_textbbox`), the `extra/` tracking objects
  (`pix_artoolkit`, `pix_fiducialtrack`, `pix_hit`, `pix_mano`, `pix_drum`)
  and upstream's `15.openGL3.2` examples; it has a `15.GLSL4` example folder
  in their place. One of those local examples uses `[modelfiler]`, so the
  object may be present without its help. (enumerator output;
  `E:15.GLSL4/04.model.pd`)
- `Extra/Gem/` is an empty folder in this install.
- Nothing read says which window backend plugdata uses, whether the Gem
  window can live inside a plugin host, or which film, camera and image
  plugins are built in. Those are open questions.

---

## 4. Pitfalls a Jitter patcher will hit in Gem

1. **Nothing draws:** no `[gemhead]`, or rendering was created but not started
   (`create` then `1`). (`M:BasicObj.html`)
2. **Everything is dark:** lighting is on with no light, or it was left on by
   an earlier patch. (`M:GemFaq.html` 3.1, `M:Lighting.html`)
3. **A branch moves when another branch is changed:** missing `[separator]`.
   (`H:separator`)
4. **Transparency looks wrong:** the transparent chain's `[gemhead]` number is
   not higher than the things behind it, or there is no `[alpha]`.
   (`H:alpha`, `H:color`)
5. **`[depth]` did the opposite:** it turns the depth test off by default.
   (`H:depth`)
6. **An effect after `[pix_texture]` does nothing.** (`H:pix_texture`)
7. **A pix object says it cannot handle the image:** wrong colour space; put
   `[pix_rgba]` first. With the wrong colour space some objects silently pass
   the image through, which looks like a speed-up. (`E:04.pix/05.film.pd`)
8. **A texture is black or shows one pixel on a shader or a custom
   coordinate:** rectangle texture; send `rectangle 0`. (`M:GemFaq.html` 4.1)
9. **A framebuffer scene is missing:** its camera is at the origin; add
   `[translateXYZ 0 0 -4]`. (`H:gemframebuffer`)
10. **Objects vanish beyond 20 units:** the default far clipping plane; change
    `perspec`. (`H:gemwin`)
11. **Window settings ignored:** they were sent after `create`. (`H:gemwin`)
12. **Audio clicks while rendering:** the FAQ's answer is two Pd processes
    talking over the network. (`M:GemFaq.html` 5.1)
13. **Number boxes slow the patch:** the FAQ says to remove them from a
    finished patch. (`M:GemFaq.html` 5.4)

---

## 5. Where Jitter is ahead

Said plainly, so the comparison is fair. Each Jitter fact was read from the
object's refpage or the Max userguide on 2026-10-02 (Max 9.1.5).

- **Data type.** `jit.matrix` is a typed grid of any size and plane count
  (char, long, float32, float64). Gem's pix is an 8-bit image; float pixes
  exist but, by Gem's own help, almost no pix object handles them.
- **GPU image processing as a library.** `jit.fx.*`, `jit.gl.slab`,
  `jit.gl.pix` and `jit.gl.pass` give dozens of ready GPU effects and a
  post-processing system. Gem's pix effects are all CPU; its GPU effects are
  shader files you load yourself.
- **Shader authoring without GLSL.** `jit.gl.pix` and `jit.gen` build shaders
  from a patcher. Gem has nothing like it.
- **Lighting and materials.** `jit.gl.light` with shadows, `jit.gl.material`,
  `jit.gl.pbr`, `jit.gl.environment`, `jit.gl.skybox`. Gem has OpenGL's eight
  per-vertex lights and colour-only materials.
- **Models.** `jit.gl.model` reads many formats and plays skinned animation.
- **Instancing from data.** `jit.gl.multiple` and `jit.gl.mesh` draw
  thousands of copies from matrices. Gem's loops re-send the frame message
  once per copy.
- **Geometry export.** Every OB3D takes `export_geometry` (glTF, PLY, STL).
  Gem's OBJ export is an example built by hand from `[gemlist_info]`.
  (`E:11.obj-exporter/`)
- **Physics, picking, handles, animation.** `jit.phys.*`, `jit.gl.picker`,
  `jit.gl.handle`, `jit.anim.drive`, `jit.anim.path`.
- **Mapping tools.** `jit.gl.cornerpin`, `jit.gl.meshwarp`. Gem has two
  example abstractions with shaders.
- **One object to start.** `jit.world` is window, renderer, node and physics
  world together. Gem needs `[gemwin]`, the `create` and `1` messages, and a
  `[gemhead]` per chain.
- **Playlists and audio in movies.** `jit.playlist`, `jit.movie~`.
- **Settings are attributes.** They show in the Inspector and in `attrui`, and
  can be read back. Gem's object state is set by message and mostly cannot be
  queried.

## 6. What Gem does that is worth taking back to Jitter

The full list, with what was checked on the Max side, is in
`plugdata_gem_max_gap_candidates.json`. The ideas, in one line each:

- Make draw order a visible number on every renderable, and decide depth
  testing per object, not by default.
- Keep a transform chain readable: when several objects share a transform,
  show the shared `jit.anim.node` in the patch and wire it.
- Treat "is this pixel work on the CPU or the GPU?" as a question the patch
  answers on its face, as Gem's `pix_` prefix does.
- Do not reprocess a frame that has not changed.
- Set a movie's colour mode yourself; do not accept the platform's.
- For particles, think in emitter shapes, velocity shapes and sink shapes.
- A plain `.frag` file with self-announcing uniforms is the easiest way to
  try a shader; in Max that means writing the short JXS wrapper once and
  keeping it as a template.
