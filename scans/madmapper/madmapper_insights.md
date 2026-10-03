# MadMapper Insights

Notes on how MadMapper works, read out of its official documentation on
2026-10-02. Written for a reader who knows Max and has never opened MadMapper.

MadMapper is made by GarageCube (Geneva) and 1024 architecture (Paris). The
version documented is MadMapper 6 (6.1.x). The notes also cover the pieces the
manual presents as part of the same product: MadLight (the DMX and LED side),
MadLaser, MadProjectorControl and MadAI (paid extensions), and MiniMad (a
hardware player).

**Where these notes come from.** Every entry ends with the page it was read
from. Nothing here is from memory. Four sources were read:

- the manual at `https://docs.madmapper.com/madmapper/6/` (all 99 pages);
- product pages on `https://madmapper.com`;
- PDF guides linked from the tutorial pages on `https://madmapper.com`;
- the shader-format documents in the GitHub repository
  `madmappersoftware/MadMapper-Materials`.

`madmapper_crawl_state.json` says which pages were read and which were not.
Manual URLs below are written as `M:<path>`, short for
`https://docs.madmapper.com/madmapper/6/<path>`.

**Feature names are spelled as the documents spell them**, including their
inconsistencies (`MiniMad` and `miniMAD`, `Soft-Edge` and `Soft Edge`,
`Space Scanner` and `Spatial Scanner`).

**The manual contradicts itself in a few places.** They are collected at the
end, under *Things the documents disagree about*, so nobody trusts one page
over another without knowing.

---

## 1. The core model

### No patching: lists of objects, each with an inspector

MadMapper has no graph. The project is a set of lists, one per tab on the left:
Media, Video Surfaces, Laser Surfaces, DMX Fixtures, Output, Modules, and
Master Settings. Selecting an item in a list shows its settings in an inspector
underneath. Content reaches the wall by assignment, not by cords: a media item
is assigned to a surface, and a surface sits inside an output. Where Max would
use a cord for control data, MadMapper uses a "Control" (section 8).

Source: `M:2.-the-interface/interface-overview`,
`M:2.-the-interface/keyboard-shortcuts`

### Two views of every surface: Input View and Stage Preview

Each surface has two independent pieces of geometry. In the Input View you
place a rectangle over the source media to choose which part of it the surface
shows (the texture coordinates). In the Stage Preview you move and reshape the
surface as it will land on the projector. Cropping the source and warping the
result are therefore separate edits, done by dragging handles.

Source: `M:2.-the-interface/interface-overview`,
`M:4.-surfaces/assigning-content-to-surfaces`

### The surface list is a layer stack

The order of the surface list is the drawing order: the first surface is in
front. Surfaces can be grouped; a group has its own opacity and colour levels,
and each child's values are multiplied by the group's. The same multiplying
goes one level higher: the Master Settings levels scale everything.

Source: `M:4.-surfaces`, `M:4.-surfaces/surface-groups-and-masks`,
`M:9.-master-settings`

### Generators are drawn once; Materials are drawn per surface

Two kinds of generated picture look alike and behave differently. A Generator
is rendered once into a texture of a size you set, however many surfaces use
it. A Material is a shader rendered separately on each surface that uses it,
straight onto the output, so it has no fixed resolution and costs more. Dragging
a Material into the Generators list turns it into the render-once kind.

Source: `M:3.-media/media-bin`

### Outputs are objects too

An output is an item in the Output tab with a destination. There are Video
Outputs, Laser Outputs, DMX Outputs, and (since 6.1.0) Video Buffers and Laser
Buffers, which are outputs with no destination, used as intermediate render
targets. The number of video outputs is limited only by the graphics hardware.

Source: `M:6.-outputs`, `M:1.-introduction/what's-new/release-notes-v6`

### A project is a folder

Since version 6 a project is a `.madproject` folder holding the `.mad` project
files, an auto-saves folder and a resources folder. *Collect External
Resources...* copies every referenced media file into it. *Merge Project...*
imports another project's surfaces, fixtures, media, scenes, cues and controls
into the open one without replacing anything. *Export Project To* copies the
whole folder elsewhere. AutoSave writes recovery files at a set interval, shows
a 10-second countdown first so a performer can cancel it, and keeps a limited
number of backups of earlier manual saves.

Source: `M:2.-the-interface/madmapper-project-file-structure`,
`M:2.-the-interface/merging-projects`,
`M:12.-advanced/project-backup-and-recovery`

---

## 2. Mapping tools

### Surface types

Video surfaces are Quad, Line, Triangle, Circle, Mask and 3D Surface. A Quad is
four corners with optional perspective; a Mask has no texture and only hides
what is under it; a 3D Surface is an imported `.OBJ`. The manual suggests
slicing an awkward shape into triangles when quads would overlap.

Source: `M:4.-surfaces/surface-types`

### Perspective, then Mesh Warping, then Bézier

A Quad's four corners do a perspective transform when the *Perspective* box is
on. When four corners are not enough, *Mesh Warping* adds an internal grid.
Points can be generated as a regular subdivision or added one at a time
(Alt + click), and a whole row or column can be removed. Turning on *Bezier*
gives each warping point tangent handles; *Unlink Tangents* allows a sharp
corner; a *Precision* slider adds polygons so the curves render smoothly.
Points are nudged with the arrow keys (Shift for 10-pixel steps). The manual's
own advice is to use as few points as possible.

Source: `M:4.-surfaces/warping-and-geometry`,
`https://madmapper.com/files/05-Mesh%20Warping.pdf`

### Link Input and Output Mesh

By default a warp point moved on the output is mirrored on the input side, so
the picture is not stretched by the warp. Turning the link off (after enabling
*Show Input Mesh*) lets the input mesh and the output mesh be edited
separately.

Source: `M:4.-surfaces/warping-and-geometry`,
`M:4.-surfaces/surface-inspector`

### Masks

There are two kinds. A mask inside a surface cuts only that surface; a surface
can have any number of them, each can be inverted, and their order decides
whether one adds to or subtracts from the others. A Mask surface is a layer of
its own that cuts through everything under it in the stack. Masks are drawn
point by point or freehand (freehand strokes are converted to Bézier points),
or started from a square, triangle or circle. Each mask has *Feathering* with a
direction (Centered, Inside, Outside), and an attachment setting: Nothing (the
mask stays put), Quad (it follows the surface's warp) or Input (it also follows
the input geometry).

Source: `M:4.-surfaces/surface-groups-and-masks`,
`https://madmapper.com/files/04-Masking.pdf`

### Line surfaces

A Line surface (older name: madLine) is a set of paths drawn on the output,
freehand or point by point, with Bézier handles, thickness and join styles.
Media is mapped along the path. An `.SVG` file dropped into the project becomes
Line surfaces, and lines can be generated from the outlines of existing
surfaces or fixtures (added in 4.0.0). The manual's example is a pulse of light
running round an SVG outline in time with the global BPM.

Source: `M:4.-surfaces/freedraw-and-madline`,
`M:4.-surfaces/svg-import-and-animation`,
`M:15.-troubleshooting/madmapper-release-notes-history`

### Soft-Edge Blending

For two or more overlapping projectors. Overlap the quads by roughly 10 to 20
percent, align them with a calibration card, select them together, tick
*Soft Edge* and press *Auto Setup*: MadMapper works out the shared area and
applies the fade. *Width* and *Power* (a gamma curve) are then tuned per edge.
The built-in blend only handles straight top, bottom, left and right edges of
Quads. For overlaps at an angle the manual's method is a mask inside each
surface, shaped to the overlap, with Feathering. Stacking two projectors
completely to double brightness is also described.

Source: `M:6.-outputs/soft-edge-blending`

### 3D Surface: 3D Calibration and 3D Lighting

Import an `.OBJ` of the real object. With *Calibrate* on, pick known points on
the model and place each on the matching point of the real object as the
projector sees it. MadMapper reports an RMS error while points are added;
*Fix Position* locks the result. Once calibrated, virtual lights can be placed
(distance, longitude, latitude, colour, attenuation, spot cutoff, shadows), so
the projected image shades the real object. The manual says short-throw
projectors cannot be calibrated this way, and that calibrated 3D surfaces
cannot be moved as a group afterwards.

Source: `M:4.-surfaces/advanced-3d-and-scanning`, `M:15.-troubleshooting`

### The three scanners

All three are under Tools > Scanners and use a camera.

- **Space Scanner** projects black-and-white stripe patterns, photographs them,
  and produces an image of the scene as the projector sees it, pixel for pixel.
  It does not build a 3D model. The image becomes the background of the output
  so surfaces can be drawn on it at a desk. Canon and Sony cameras are driven
  directly; webcams, capture devices and NDI inputs also work.
- **LED Scanner** flashes every LED pixel in a DMX range one at a time, watches
  where each appears in the camera picture, and places the fixtures in the
  workspace to match.
- **Laser Scanner** (needs MadLaser) has the laser draw a moving 16 x 16 matrix
  of dots and produces a background image for the laser output in the same way.

For all three, the camera and the projector or laser must not move during the
scan.

Source: `M:12.-advanced/special-tools-and-auto-calibration`,
`https://madmapper.com/files/13-Space%20Scanner%20Guide-1.pdf`

### Video walls and splitting one output

*File > New Project > From Template > Video Wall Template* asks for the number
of screens across and down, their resolution, the bezel size and the screen
orientation, and builds the grid of quads (or fixtures) with the bezel gaps
accounted for. Separately, an output's Destination can split one large canvas
across several displays, and each output has Flip and a frame Delay for mixing
slow and fast projectors.

Source: `M:4.-surfaces/video-wall-setup`, `M:6.-outputs`

### Things drawn on the real output to help alignment

Each output has a built-in Test Pattern. A Video Cursor (cross or circle) shows
the mouse position on the projector, and there is a Laser Cursor that does the
same with a beam, so lines can be drawn directly on the real object. Show Info,
Highlight Selection and Highlight Background mark what is selected. Object
Isolation shows only the selected surfaces while editing. The Grid Generator at
50 percent opacity in Additive blend mode is the recommended warping aid.

Source: `M:6.-outputs`, `M:2.-the-interface/keyboard-shortcuts`,
`M:4.-surfaces/warping-and-geometry`, `M:9.-master-settings`

---

## 3. Outputs and routing

### What a Video Output can do

Besides showing on a display, each Video Output has buttons for Desktop Window,
Publish to Syphon / Spout, Publish to NDI and Publish Internal Loopback, plus
antialiasing (MSAA), a background image used only for preview, and
Save Video Snapshot. Video Buffers add a choice of pixel format: 8-bit, 16-bit
float or 32-bit float.

Source: `M:6.-outputs`

### Loopbacks make a pipeline out of layers

Publishing an output as an Internal Loopback makes it appear in the Media Bin
under Live Inputs. Other surfaces can then use it as their media. This is how
MadMapper chains stages without a graph: compose on a buffer, then map the
buffer onto the real outputs. The manual's example is one composition split
over four soft-edged projectors, so that changing the media never disturbs the
projector mapping. Laser outputs can be looped back the same way; the looped
media carries paths, not pixels.

Source: `M:6.-outputs/loopback-and-advanced-output-techniques`,
`https://madmapper.com/files/MadLaser%20Guide.pdf`

### Performance advice the manual gives

Consumer NVIDIA cards do not keep several outputs in step, which shows as
tearing across projectors. The manual's two answers are a Quadro card with a
sync board, or one large output cut up by a hardware splitter (Datapath Fx4,
Matrox QuadHead2Go). For many layers it says to use HAP on fast NVMe storage.
One 1080p60 NDI stream is given as about 125 to 150 Mbps.

Source: `M:12.-advanced/performance-optimization`

---

## 4. Lighting: DMX, Art-Net, sACN and LED pixel mapping

### How DMX leaves the program

DMX output is set in Preferences > Project > DMX: a USB DMX device, Art-Net or
sACN, the network interface, a maximum frame rate, unicast or broadcast, and
universe synchronisation, with a scanner that polls for Art-Net nodes. Named
USB devices are the garageCube controller, ShowJockey, Enttec DMX USB Pro and
Pro MK2, and DMX King eDMX2 Pro. The troubleshooting page says MadMapper
supports Art-Net 4 and limits itself to 16384 universes; the features page says
up to 4096 universes and up to 1000 fps.

Source: `M:5.-dmx-and-led-mapping/dmx-fundamentals`,
`M:2.-the-interface/madmapper-preferences`, `M:15.-troubleshooting`,
`https://madmapper.com/madmapper/features`

### A fixture is a surface that reads pixels

This is the central idea of MadLight. A DMX Fixture is placed in the output
like a video surface, and its colour channels are filled by sampling the
picture under it. Since version 6 fixtures sample the output composition
itself, so video surfaces, effects and masks all end up as light with no
loopback. Fixture shapes are DMX Fixture, DMX Line, DMX Circle and DMX Bézier.
Fixtures do not blend with each other: one placed over another replaces it.

Source: `M:5.-dmx-and-led-mapping/dmx-fundamentals`,
`M:5.-dmx-and-led-mapping/dmx-fixtures`,
`M:1.-introduction/what's-new/madmapper-v6`

### DMX Filtering and Response Curve

*DMX Filtering* sets how the picture is sampled for each LED: None (one pixel
at the centre), Box (the average of a square) or Anamorphic (separate width and
height, for strips). It exists to stop coarse LEDs flickering under detailed
video. *Response Curve* sets how a fixture's brightness responds to the value
sent.

Source: `M:5.-dmx-and-led-mapping/dmx-fixtures`

### Fixture definitions and the Fixture Editor

A fixture definition describes one device's channel layout and is stored as a
`.mmfl` file that can be imported and exported. It has a pixel grid
(1 x 1 for anything that is not a pixel device), a Pixel Type (RGB, RGBW or
Custom) and a list of channels. Channel types are R, G, B, W, L, C, M, Y,
Slider, Expression and Unused. A channel is 8 Bits or 16 Bits. For strips and
matrices, *Assignation* offers 16 wiring orders (rows, columns, serpentine and
their mirrors), and *LED Strip Mode* and *Matrix Mode* (6.1.0) let each fixture
set its own length or size while sharing one definition. *Skip channels
511–512* and an option to keep a pixel from straddling two universes deal with
universe boundaries.

Source: `M:14.-technical-notes/dmx-fixture-definitions`,
`M:5.-dmx-and-led-mapping/dmx-fixtures`

### Expression channels

A channel of type Expression is computed by a GLSL expression. It can read the
sampled colour (`R`, `G`, `B`, `L`, `W`, `C`, `M`, `Y`), the pixel's `INDEX`,
its position `posX` and `posY`, `time`, and any Slider channel by its label.

Source: `M:14.-technical-notes/dmx-fixture-definitions`

### Moving lights

There is no programmer with palettes. A moving head is a 1 x 1 Custom fixture
whose colour channels sample the video and whose pan, tilt, strobe and gobo
channels are of type Slider. Sliders show up in the Fixture Inspector, and from
there they can be keyframed in a timeline or driven by an Oscillator module.
A slider can be set not to dim with the fixture's luminosity, which pan and
tilt need.

Source: `M:5.-dmx-and-led-mapping/controlling-moving-lights`,
`M:15.-troubleshooting/madmapper-release-notes-history`

### Importing and exporting a fixture layout

Fixtures can be created in bulk from a CSV (names, groups, addresses) or from
an SVG drawing. For SVG, the element's `id` can carry the patch, for example
`MySuperLedStrip__UN__10__CH__12`, with further tokens for fixture type,
fixture definition, strip length, matrix size and thickness; the same values
can be XML attributes instead. SVG groups become fixture groups. Exporting
fixtures to SVG and importing them again rebuilds the same setup, and the
manual suggests using the exported SVG in After Effects to make video that fits
the lights.

Source: `M:14.-technical-notes/dmx:-import-export-from-svg`

### MadLight Recorder, MadLight Sequence, MadLight Player

The MadLight Recorder records DMX frame by frame, either what MadMapper is
sending or what arrives from another desk, into a MadLight Sequence. A sequence
can have an audio file, kept in sync or left to loop on its own. Sequences are
played back by the MadLight Player module or exported to a MiniMad. The same
format is what a timeline export writes for DMX: all universes together, only
the changes stored, zipped, and cut into chunks to stay under the FAT32 file
size limit. It is a private format.

Source: `M:5.-dmx-and-led-mapping/madlight-recorder`,
`M:6.-outputs/timeline-export`,
`M:15.-troubleshooting/madmapper-release-notes-history`

### DMX as a way in, and the small DMX tools

DMX can also be an input: a lighting desk can drive opacity, scenes or media
through Art-Net, sACN or a USB interface. The DMX Monitor shows live channel
values. The DMX Router module forwards Art-Net or sACN universes to USB DMX
devices. The DMX to OSC module forwards a universe as an array of floats.

Source: `M:11.-live-performance-and-control`, `M:8.-modules`,
`https://madmapper.com/files/09-Modules.pdf`

---

## 5. Lasers (MadLaser)

### The model: surfaces make paths, the output makes points

A laser draws by moving a beam, so everything is vectors. Laser surfaces hand
coloured polylines to the Laser Output they sit in. The output turns all of
them into one frame of points for the DAC, using each surface's Laser Render
settings and its own device settings. Content is either vector to begin with
(Laser Materials, ILDA files, SVG, laser loopbacks) or pixels that must be
traced.

Source: `https://madmapper.com/files/MadLaser%20Guide.pdf`,
`M:7.-laser-madlaser/getting-started-with-madlaser`

### Laser Output settings

- **PPS** (points per second): set to what the scanner's maker states. Above
  45 kpps rarely helps and heats the galvos.
- **Desired FPS**: below about 35 the picture visibly flickers. The manual
  gives `ILDA FPS = PPS / Point Count`.
- **Scan Area** (the PDF guide calls it Safety Area): keeps the beam off the
  edge of the scanner's range.
- **Blank Delay**: how long the beam is off while moving between paths.
- **Color Levels**, **Min Voltage** (so a diode is fully off in dark greys),
  **Response** curves, **Color Delay** (shifts each colour in time to match the
  mirrors), and **Distortion** Level X and Level Y.
- Expert mode adds a custom PPS up to 100,000 and an **ILDA Mode**:
  *Preserve Image Quality* lets the frame rate drop; *Preserve FPS* drops
  detail instead.

Source: `M:6.-outputs`, `M:2.-the-interface/madmapper-preferences/madlaser-preferences`,
`https://madmapper.com/files/MadLaser%20Guide.pdf`

### Laser surfaces

Laser Quad (holds vector media or traces pixel media), Laser Lines (hand-drawn
or imported paths), Laser Circle, Laser Text and Laser 3D (an `.OBJ` drawn as
wireframe, with Face Culling). Laser Text can use Stick Fonts, which are
single-stroke fonts, so the beam draws one line per letter instead of an
outline. A Quad or Text surface can be converted to Laser Lines to edit the
paths by hand.

Source: `M:7.-laser-madlaser/getting-started-with-madlaser`,
`M:7.-laser-madlaser/3d-object-rendering-for-laser`,
`https://madmapper.com/files/MadLaser%20Guide.pdf`

### Laser Render settings on each surface

*Max Speed* sets how fast the beam may travel; MadMapper shares the frame's
time between paths by their length so they look equally bright. *Optimize
Angles*, *Angle Min* and *Angle Delay* add points at corners so they stay
sharp. *End Repeat* holds the last point so the path is finished. *In Fade* and
*Out Fade* avoid bright dots at the ends. *Point Intensity* (Laser Quad) and
*Min Points* (Laser Lines) say how long to dwell on a single point, which is
how a static beam is made strong.

Source: `https://madmapper.com/files/MadLaser%20Guide.pdf`

### Real-Time Video Vectorization

A Laser Quad given a movie, image or camera traces it every frame on the GPU.
Two modes: *Find Paths* looks for bright lines on black and thins them to a
skeleton (Threshold, Use Color, Thickness, Denoizing, Max Res); *Find Contours*
runs a Canny edge detector (Threshold, Blur Size, Canny Size). Path Filtering
drops paths shorter or longer than a percentage of the image size; Path Limits
keeps only the longest (or shortest) N. A Display setting shows the stages
(Source Image, Processed Image, Output Polylines), and a Monitor reports
problems; above 2,000 paths the frame is given up. Any Surface 2D FX runs
before tracing. Expert mode allows input up to 16k, meant for exporting ILDA
slower than real time.

Source: `M:7.-laser-madlaser/real-time-video-vectorization`,
`https://madmapper.com/files/MadLaser%20Guide.pdf`

### Laser Materials: shaders that output paths

A Laser Material is a GLSL function, `laserMaterialFunc`, called once per
sample point (8192 by default, set by `POINT_COUNT`). For each point it returns
a 2D position, a colour, a shape number and optional user data. A change of
shape number starts a new path. The output is really a small texture: row 0
holds position and shape number, row 1 colour, row 2 user data, and the
previous frame's texture is available as `mm_LastFrameData`. The header's
`RENDER_SETTINGS` can fix render options such as `MAX_SPEED`, `SKIP_BLACK`,
`PRESERVE_ORDER` and `ANGLE_OPTIMIZATION`. A small library gives drawing calls
(`sl_moveTo`, `sl_lineTo`, `sl_cubicTo`, `sl_drawEllipse` and others).

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/LaserMaterialsDoc.md`,
`https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/Libraries/MadLaserMaterialShapeLibrary.md`

### Laser Dispatch, loopback, warping and soft edge

A laser output with no destination can be published as an internal loopback and
shown on a Laser Quad in a real output. That lets a whole composition be mesh
warped at once. With *Dispatch Count* the looped paths are shared out between
several lasers, so a frame too heavy for one scanner is split; since 5.5.0 the
dispatcher follows shapes from frame to frame to keep each on the same laser.
Laser Quads, Lines and Text take Mesh Warping; Laser Quads take Soft-Edge for
overlapping lasers (the 5.1.0 release note warns it does not work with all
content).

Source: `https://madmapper.com/files/MadLaser%20Guide.pdf`,
`M:7.-laser-madlaser/laser-warping-and-soft-edge`,
`M:15.-troubleshooting/madmapper-release-notes-history`

### Safety features

A laser emits nothing until armed with the Laser Output button, which shows a
warning once per session; lasers are un-armed after the computer wakes from
sleep. Output masks stop the beam entering an area; a mask with lower Opacity
dims the beam there instead, and masks can be inverted to mean "only here".
*Max non-moving Beam Intensity* limits the power of a beam that is not moving,
and is locked until *Unlock Security Features* is ticked. The manual says
software masks must not be the only protection and that physical blocks and an
emergency stop are required.

Source: `M:7.-laser-madlaser/laser-visualization-and-safety`,
`M:7.-laser-madlaser/getting-started-with-madlaser`,
`M:1.-introduction/what's-new/release-notes-v6`

### Hardware, files and previsualisation

DACs named: Etherdream, ShowNET, Helios USB, LaserCube, IDN, Moncha, and FB3 /
FB4 on Windows with a Pangolin Beyond licence. *Audio Laser (AVB / Dante)*
sends X, Y, R, G and B as five audio channels to a network audio card, at 48 or
96 kHz, for projectors that accept it. `.ild` files import as media; an output
can *Store Ilda Frame* or *Record Ilda Movie* (at a fixed frame rate, or as an
ILDA stream for playing from a laser's SD card). PONK ("Pathes Over NetworK")
sends and receives paths over the network. For previsualisation the laser data
can go to Capture, Depence, WYSIWYG or LA.preview, and a Beam Preview with fog
can itself be shown on video outputs.

Source: `M:13.-setup-and-installation/additional-hardware`,
`M:2.-the-interface/madmapper-preferences`, `M:7.-laser-madlaser/ilda-files`,
`M:7.-laser-madlaser/laser-visualization-and-safety`,
`https://madmapper.com/files/MadLaser%20AVB%20Support-1.pdf`,
`M:15.-troubleshooting/madmapper-release-notes-history`

---

## 6. Media and generators

### What the Media Bin holds

Categories: Generators, Materials, Laser Materials, Laser Generators, ISFs,
Quartz Composer, Images, Movies, Images Folders, Syphon/Spout/NDI, Live Input,
Loopbacks and Montages. A number on each thumbnail says how many surfaces use
it. The same movie can be imported twice and controlled separately.

Source: `M:3.-media/media-bin`,
`M:15.-troubleshooting/madmapper-release-notes-history`

### Formats and codecs

Playback uses FFmpeg and FreeImage. HAP is the recommended codec and is decoded
on the GPU; ProRes is hardware-decoded on macOS; H.264 and its relatives are
supported but costly, and the manual suggests a keyframe on every frame if they
must be scrubbed. NotchLC and DXV are stated as not supported. Images include
32-bit float EXR. SVG renders at any chosen size on video surfaces and as true
vectors on laser surfaces. Lottie JSON animations are supported.

Source: `M:3.-media/media-formats-and-video-codecs`

### Movies and image folders

A movie has transport controls, a playback mode (loop, once and hold,
ping-pong, random frames), speed, loop in and out points, and an option to tie
its audio level to the opacity of its surface. An Images Folder plays a folder
of numbered stills as a sequence, with its own FPS, a frame cache, and
*Auto Scan* to pick up files added while running.

Source: `M:3.-media/media-bin`

### Generators named in the documents

Grid Generator, Test Pattern, Text Generator, Solid Color, Chrono, Count Down,
Video Sampler, Audio Graph, GPU Particles, 3D Particles, Kinect Masker, Movie
Folder Player, and SVG Folder Player. Most are named only in the release notes,
with no description, so what each one does is not recorded here.

Source: `M:15.-troubleshooting/madmapper-release-notes-history`,
`M:4.-surfaces/warping-and-geometry`

### Live inputs

Cameras through AVFoundation (macOS) or DirectShow / Media Foundation
(Windows), Blackmagic capture cards, Canon cameras through Canon's EDSDK, Sony
cameras, Kinect ONE and Intel RealSense, plus Syphon, Spout and NDI sources.
An NDI source has *Keep running* and a low-bandwidth switch. MadMapper refuses
to reopen a camera driver that crashed it once, until told to.

Source: `M:2.-the-interface/madmapper-preferences`, `M:3.-media/media-bin`,
`M:11.-live-performance-and-control`, `M:15.-troubleshooting`

### Surface FX

Each surface has one FX slot (Color Controls by default). FX come in three
families matched to surface type: Surface 2D FX, Surface 3D FX and Surface Line
FX. Named examples include Chroma Key, Gaussian Blur, Shatter, Voronoize,
Emboss, Channels Shuffle, Curve RGBA and Curve Luma. MadMapper will not fade
between two different FX; the manual says to use two surfaces.

Source: `M:4.-surfaces/surface-inspector`, `M:15.-troubleshooting`,
`M:15.-troubleshooting/madmapper-release-notes-history`

---

## 7. Shaders: Materials, Surface FX and the code editor

### A Material is an ISF-style shader with a different entry point

A Material is a folder with a fragment shader (`.fs`), an optional vertex
shader (`.vs`) and a thumbnail. It uses the ISF JSON header, but instead of
`main` it defines `vec4 materialColorForPixel(vec2 texCoord)`. The reason given
is that the material is not drawn into a texture: its code is merged with
MadMapper's own shader for the surface type (quad, 3D, lines, fixture) and
drawn directly. Shaders compile as GLSL 150 core. Multi-pass ISF is not
supported for Materials.

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MaterialsDoc.md`,
`M:3.-media/writing-custom-glsl-materials`

### The header builds the interface

Each entry in the header's `INPUTS` becomes a control in the inspector:
`float` and `int` sliders, `bool` checkboxes, `color` pickers, `long` menus,
`point2D`, `event`, and MadMapper's own `floatRange` (a two-ended slider).
`FLAGS` change the control: `button`, `spinbox`, `no_alpha`, and
`generate_as_define`, which compiles a menu choice in as a `#define` instead of
passing it as a uniform. A slash in a `LABEL` (`"Noise/Speed"`) puts the
control in a named group. Names start with `mat_` in Materials and `fx_` in
Surface FX so the two do not clash when merged. Every such control is then
available to Controls, cues and timelines like any built-in parameter.

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MaterialsDoc.md`,
`https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MadMapperSurfaceFxDoc.md`

### GENERATORS: state the shader cannot keep for itself

A shader multiplying `TIME` by a speed slider jumps when the slider moves. The
header's `GENERATORS` list fixes this by having MadMapper compute a value each
frame and pass it in as a uniform. `time_base` accumulates speed times elapsed
time (with `reverse`, `speed_curve`, `strob`, `bpm_sync` and
`link_speed_to_global_bpm`). `animator` adds wave shapes on top of that. The
others filter an input: `damper`, `adsr` (attack, decay, release),
`linear_filter`, `ease_filter`, `multiplier` and `incrementer`. `pass_thru`
brings in any control channel, such as the BPM position. A generator's
parameter can be a number, an input, or another generator.

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MaterialsDoc.md`

### Audio into shaders

An input of type `audioFFT` (spectrum) or `audio` (waveform) arrives as a
texture one pixel high. `SIZE` sets the number of values (up to 512), and
`ATTACK`, `DECAY` and `RELEASE` smooth each spectrum band before the shader
sees it.

Source: `M:3.-media/writing-custom-glsl-materials`,
`https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MaterialsDoc.md`

### Render To Texture, last frame, textures

A Material can be switched to *Render To Texture* at a set size, which is
cheaper when one heavy shader covers many outputs, and is required by FX that
sample the media many times (an FX declares this with `REQUIRES_TEXTURE`).
With `REQUIRES_LAST_FRAME` the previous frame is available as `mm_LastFrame`
for feedback. `IMPORTED` textures can be 2D, cube or 3D, with filter and wrap
settings. `CLOCK_TIME` is wall-clock time, unaffected by the engine speed that
scales `TIME`.

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MaterialsDoc.md`,
`https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MadMapperSurfaceFxDoc.md`

### Surface FX in code

A Surface FX defines `vec4 fxColorForPixel(vec2 mm_FragNormCoord)` and reads
the media with `FX_NORM_PIXEL`, which works whether the media is a texture or a
Material. An optional vertex function `fxVsFunc` can move the surface's
geometry. The FX and the Material on a surface are compiled into one shader
program.

Source: `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/MadMapperSurfaceFxDoc.md`

### Bundled libraries

`MadCommon.glsl` (constants, colour conversion), `MadNoise.glsl` (value,
simplex, Worley, flow, billowed, ridged and curl noise, fBm and related sums,
each in 2D and 3D and with derivatives) and `MadSDF.glsl` (2D shapes as signed
distance fields, with fill, stroke, glow, boolean operators and repetition).
They are pulled in with `#include`.

Source: `M:14.-technical-notes/glsl-shader-functions-reference`

### The editor, the library and MadAI

The AI / Code Editor recompiles as the code changes and updates the controls
when the header changes. The Library panel installs Materials and FX that other
users published, and publishes yours, publicly or privately; since version 6
the library is downloaded so it works offline. MadAI turns a text prompt into a
Material, a Laser Material or a Surface 2D FX, including its sliders; it runs
on GarageCube's servers and costs one credit per prompt. The advice is to
prompt in small steps.

Source: `M:2.-the-interface/toolbar-and-workspace`,
`M:3.-media/online-material-library`, `M:12.-advanced/mad-ai-extension`,
`https://madmapper.com/extensions/FAQ`

---

## 8. Control: mapping inputs to parameters

### Controls and the Learn system

Almost every slider, button and menu can be given a Control. Right-click >
Add Control, or switch on Learn and touch the widget, then move the hardware.
The Control List groups Controls by source: Keyboard, MIDI, DMX, OSC, Audio,
Gamepad, MadMapper (internal modules) and Other. Each Control has a Source
Range and Target Range, a Filter (Average, Weighted Average, Pulse Detection,
Attack Release, Damper), a Curve drawn in a graph, and a Toggle option.
Feedback can be sent back to a controller. One parameter can have one Control
per source type; to combine several inputs on one parameter there is the
Controls Combiner module.

Source: `M:11.-live-performance-and-control`,
`M:9.-master-settings/audio-input-and-beat-detection`, `M:15.-troubleshooting`

### Audio as a control source

Audio channels offered to Controls: `amplitude`, `bass`, `medium`, `treble`,
`bpm`, `beatCount`, beat divisions such as `4_beats`, and `ltc_time`. The
Global BPM in Master Settings can come from Audio Beat Detection, Ableton Link,
MIDI Clock, or manual entry and tap.

Source: `M:9.-master-settings/audio-input-and-beat-detection`,
`M:11.-live-performance-and-control`

### The OSC address tree

Every parameter has a fixed OSC address as well as any Control mapped to it.
Addresses read like paths (`/surfaces/Quad-1/opacity`) and depend on the names
given to things in the project; right-click > Copy OSC Address gives the exact
one. Sending to a fixed address skips the Control's ranges and filters. `*` is
accepted as a wildcard. MadMapper answers OSCQuery, so another program can
browse the tree. The published list covers `/application`, `/master`,
`/media`, `/modules`, `/outputs` and `/timelines`.

Source: `M:11.-live-performance-and-control`,
`M:11.-live-performance-and-control/osc-commands-and-channels-list`

### Modules

Modules are small tools added in the Modules tab; several copies of one can
exist. Named in the documents: Audio Player, Calendar Scheduler, Control
Surface, Controls Combiner, Cue Scheduler, Device Activity, DMX to OSC, Idle
Timeline, DMX Router, Macro, MadLight Player, MiniMad Controller, MIDI Out, OSC
Out, Oscillator, Oscillator 2D, Oscillator Bank, Pollution, Weather,
RandomNoise, Startup Timeline, Timeline Scheduler, Timeline Automation, Firmata
and PJLink. A module's outputs appear as channels under Add Control >
MadMapper, which is how an Oscillator drives a surface's opacity.

Source: `M:8.-modules`, `https://madmapper.com/files/09-Modules.pdf`,
`M:9.-master-settings/scheduling-and-automation`

### Hardware-specific helpers

- **Control Surface** module: an AKAI APC mini mk2 / APC40 mk2 or a Novation
  Launchpad shows the scenes and cues grid on its pads, in the cues' colours.
- **Stream Deck** plugin: a key launches a scene or cue and shows its
  thumbnail; a Stream Deck+ dial drives any parameter by its OSC address.
- **Gamepad**: PlayStation and Xbox controllers and other HID devices.
- **Firmata** module: an Arduino running StandardFirmata, each pin set to
  Analog, Input, Output, PWM or Servo.
- Preferences also list Makey Makey forwarding.

Source: `https://madmapper.com/files/14-Controle%20Surface%20Module%20Guide-1.pdf`,
`https://madmapper.com/files/15-Stream%20Deck%20Plugin-1.pdf`,
`M:11.-live-performance-and-control`,
`M:12.-advanced/arduino-and-firmata-integration`,
`M:2.-the-interface/madmapper-preferences`

---

## 9. Scenes, Cues and Timelines

### Scenes and Cues

Both live in one grid. A Scene (first row) stores the whole project state, and
starting one hides any surface created after it was stored. A Cue stores only
the parameters you put in it, so the usual layout is one row per concern: a row
of cues for media, another for colours, another for the LEDs. Starting a cue
sends its stored values; with a fade time each parameter moves from where it is
to the stored value, and each parameter may have its own transition settings.
A cue started on a parameter cancels any earlier transition on that parameter.

Source: `M:10.-timelines/scenes-and-cues`,
`https://madmapper.com/files/06-Scenes%20and%20Cues.pdf`

### Edit mode: choosing what a cue stores by clicking it

In Edit mode every storable widget gets a red overlay. Clicking a widget adds
it to, or removes it from, the selected cues; an orange outline means the live
value differs from the stored one. Several cues can be selected and updated at
once. Dragging a surface or media onto a cue slot stores all of its parameters.

Source: `https://madmapper.com/files/06-Scenes%20and%20Cues.pdf`,
`M:10.-timelines/scenes-and-cues`

### The grid: banks, columns, exclusivity, quantized launch

Cues are organised in banks. A column button starts everything in that column.
Only one item per row plays at a time: starting another in the same row stops
the first, and its audio and montage fade out over the new item's fade time.
Launch can be quantized to the beat. Auto Play steps through columns at a set
interval, in loop or random order, and can move on when a movie reaches its
loop end. A Live mode disables editing so a touch only triggers.

Source: `M:11.-live-performance-and-control/osc-commands-and-channels-list`,
`M:10.-timelines/scenes-and-cues`,
`https://madmapper.com/files/06-Scenes%20and%20Cues.pdf`,
`https://madmapper.com/files/07-Cue%20Scheduler.pdf`

### Timelines: a cue that moves

In version 6 a scene or cue can be given a timeline with *Animate*. Each stored
parameter becomes a track. With Record on, changing any widget writes a
keyframe at the playhead, and touching a parameter that has no track yet adds
one. Keyframe interpolation is None, Linear, Bezier or Auto Curve, with
Simplify and Quantize. Colours fade in a perceptual colour space.

Source: `M:10.-timelines/creating-and-editing-timelines`,
`M:1.-introduction/what's-new/release-notes-v6`

### The Conductor and its track types

The Conductor is the master timeline. Track types: Timeline Player (places
scenes, cues and their timelines on the time axis), Montage, Audio, OSC and
MIDI. OSC tracks carry Float, Integer, String, Color, Bool or Events; MIDI
tracks carry Control Change, High Resolution CC (14 bits), Pitch Bend or Notes.
Playback mode is Default, Controlled Speed, Global BPM or External Sync. The
6.0.0 release note names the external sources as MIDI MTC, Audio LTC and ArtNet
TimeCode; the audio page lists Ableton Live, LTC, MTC and ArtNet. Expert Mode
allows timelines inside timelines and a separate external sync per timeline.

Source: `M:10.-timelines/timelines-overview-and-the-conductor`,
`M:10.-timelines/track-types-and-inspectors`,
`M:2.-the-interface/madmapper-preferences/expert-mode`,
`M:1.-introduction/what's-new/release-notes-v6`

### Montage tracks

A Montage track is a small video editor: clips are cut, moved, snapped and
reversed on the track, and two clips placed together get an adjustable
crossfade. The result appears in the Media Bin as one media item and is
assigned to surfaces, lasers or fixtures like any other. Empty stretches either
skip rendering or show black. A cut section can be made a Clip with its own
loop and speed.

Source: `M:10.-timelines/track-types-and-inspectors`, `M:10.-timelines/clips`

### Audio tracks

An audio file on a track shows as a waveform or a spectrum, has its BPM
detected, and gives beat positions to snap to. Its channels can be routed
through an Audio Routing matrix to chosen hardware outputs.

Source: `M:10.-timelines/track-types-and-inspectors`,
`M:1.-introduction/what's-new/madmapper-v6`

### Time Markers and Follow Actions

A marker has a default action when the playhead reaches it: Pause (wait for
Go), Continue, Loop, or Go to Marker. A Follow Action chains another step, such
as going to a marker and pausing, or starting a timeline. Markers show their
type by prefix (`P/`, `L/`, `G/`), can be given Controls, and can be reached by
name over OSC.

Source: `M:10.-timelines/time-markers-and-follow-actions`,
`M:11.-live-performance-and-control/osc-commands-and-channels-list`

### Exporting a timeline

From the Conductor, a whole timeline or its loop section renders to files in
one pass: a movie per Video Output (H264, HEVC, ProRes, Hap, HapAlpha, HapQ or
an image sequence, with or without audio), an ILDA movie per Laser Output, a
MadLight Sequence for DMX, and an audio file (WAV, MP3 or M4A). Export need not
run in real time.

Source: `M:6.-outputs/timeline-export`

### Scheduling

- **Cue Scheduler**: start a cue or column at a date and time, with "Each" for
  any field, or run an automation inside a daily time window (every N seconds,
  every N beats, or at a movie's loop end), in order or at random.
- **Calendar Scheduler**: import an `.ics` file from any calendar program. Each
  event whose name matches a scene or cue triggers it. Recurring events work
  and are loaded 365 days ahead. No internet connection is used.
- **Timeline Scheduler**: keep a timeline running between a start and end time
  on chosen dates or weekdays.
- **Startup Timeline**, **Idle Timeline** and **Device Activity**: start
  something when the project opens, when the grid has been idle, or when a
  controller has been untouched for a while.

If two schedulers fire at once on the same output, the one lower in the module
list wins.

Source: `M:9.-master-settings/scheduling-and-automation`, `M:8.-modules`,
`https://madmapper.com/files/07-Cue%20Scheduler.pdf`,
`https://madmapper.com/files/08-Calendar%20Scheduler.pdf`,
`M:15.-troubleshooting/madmapper-release-notes-history`

---

## 10. Audio

MadMapper plays audio from movies, timeline audio tracks and the Audio Player
module (which also has pitch, speed and a scratch option). It reads and sends
any number of channels but to one audio interface at a time. Routing is channel
N to channel N unless the routing matrix is opened. Master Settings has a
four-band Equalizer. To pass audio to other software the manual points to
BlackHole on macOS and JACK on Windows; multichannel output on Windows needs
the ASIO driver type.

Source: `M:14.-technical-notes/audio-routing`, `M:9.-master-settings`,
`https://madmapper.com/files/09-Modules.pdf`

---

## 11. Running unattended, and hardware

### Installation settings

*Silent Mode* suppresses all prompts. A project can open in fullscreen and arm
its lasers at startup. Expert Mode exposes `/application/exit`,
`/application/shutdown_computer` and `/application/restart_computer` as
controls. Licences can be authorised from the command line for mass
deployment.

Source: `M:2.-the-interface/madmapper-preferences`,
`M:2.-the-interface/madmapper-preferences/expert-mode`,
`M:13.-setup-and-installation/software-installation/mass-deploy-installation`

### MadProjectorControl

A PJLink module, one per projector: Power and Mute (shutter) buttons that
follow the projector's real state, plus name, model and lamp information.
Because the buttons are ordinary parameters they can be stored in cues and
driven by the schedulers, which is how a venue is switched on and off without
an operator.

Source: `M:12.-advanced/madprojectorcontrol`

### MiniMad

A Raspberry Pi 2 based player. A MiniMad runs either MiniMad Video (one
projector up to 1080p, one media at a time, Quad, Triangle, Circle and Mask
surfaces with mesh warping; no Lines, 3D or FX) or MiniMad Light (plays
recorded DMX sequences, with audio). MadMapper exports to its SD card or over
the network, transcoding movies on the way. Several units on one Ethernet
network start, pause and change media together with no setup; the guide warns
of up to one frame of offset between units, so it is not for soft-edge
blending. Each unit takes OSC on port 1111, and the MiniMad Controller module
controls units from MadMapper. Materials and Generators cannot run on it; they
must be recorded to video first.

Source: `M:6.-outputs/minimad`,
`https://download.madmapper.com/minimad/MiniMad_3_User_Guide.pdf`,
`https://madmapper.com/files/02-MiniMad%20Controller.pdf`

### How the manual sees Max

The manual treats Max/MSP, TouchDesigner and Processing as content sources and
MadMapper as the last stage: video comes in by Syphon, Spout or NDI, and data
by OSC.

Source: `M:11.-live-performance-and-control`

---

## 12. Shared concepts, different approaches

Added in session 2 (2026-10-02). Sections 1 to 11 describe MadMapper by itself.
This one looks only at things Max also has, and asks what a Max patcher should
take from how MadMapper does them. The Max side of each entry was read from the
refpage or userguide page named in it; the matching entry in
`madmapper_max_gap_candidates.json` (items 50 to 82) holds the full check and
the advice. Nothing here was run in Max.

### Stacking, levels and blending

**Draw order is the list.** The first surface in the list is in front, always.
Max's `layer` attribute defaults to 0 on every object, and Max's own page says
objects sharing a layer are drawn in no guaranteed order, and that layering only
works with depth testing off. So in Max the order has to be written down for
each plane, and higher numbers are in front, the reverse of MadMapper's list.

Source: `M:4.-surfaces`, `M:4.-surfaces/surface-groups-and-masks`. Max:
`jit.group-gl.maxref.xml`, userguide `jitter/depth_layer_blend`.

**Levels multiply down a chain.** Surface opacity times group opacity times the
Video master times the Master. The DMX, audio and laser masters hang off the
same Master. Max has a `color` on each object and nothing above it, so the
chain is a few `*` objects the patcher has to add.

Source: `M:9.-master-settings`, `M:4.-surfaces/surface-inspector`,
`https://madmapper.com/files/01-Introduction%20to%20the%20User%20Interface.pdf`.
Max: `jit.group-gl.maxref.xml`, `jit.gl.node` refpage.

**Blend mode is a name on the layer.** Max has the same named modes in its
`blend` attribute, next to the older numeric `blend_mode` pair, but blending is
off by default on everything except `jit.gl.layer`.

Source: `M:4.-surfaces/surface-inspector`. Max: `jit.group-gl.maxref.xml`.

### Cropping, warping and the mapping stage

**Crop first, warp second, as two edits.** MadMapper's Input View and Stage
Preview are the same idea as a crop object feeding a cornerpin. Max's crop is
`jit.fx.subtexture` (pixel `offset` and `dim`, no copy), which session 1 did
not find.

Source: `M:4.-surfaces/assigning-content-to-surfaces`,
`M:2.-the-interface/interface-overview`. Max: `jit.fx.subtexture` refpage.

**Max does have a warp grid: `jit.gl.meshwarp`.** It ships inside the Jitter
Tools package in the Max application, so it is missing from the main object
registry, and session 1's search missed it. It has a draggable mesh, curvature,
masks drawn in the window, undo, and `save` / `read` of its whole state as
JSON. MadMapper's version adds points placed anywhere, Bézier handles on each
point, a linked input mesh and feathering.

Source: `M:4.-surfaces/warping-and-geometry`. Max: `jit.gl.meshwarp` refpage in
`C74/packages/Jitter Tools/docs/`.

**Keyboard nudging.** Tab moves to the next handle; arrows move a point one
pixel, ten with Shift. `jit.gl.cornerpin` is mouse-only, so this is worth
patching onto it.

Source: `M:4.-surfaces/warping-and-geometry`,
`M:2.-the-interface/interface-overview`,
`https://madmapper.com/files/02-My%20First%20Video%20Mapping.pdf`. Max:
`jit.gl.cornerpin` refpage.

**Content and mapping are two stages, and the mapping is locked.** The manual's
own template composes onto a buffer, loops it back, and maps the loopback onto
the projectors, so cues change content and never touch geometry. Surfaces and
outputs have a lock. In Max: render to a texture, map it in a second stage, and
switch the cornerpin's `enable_mouse` and `drawcorners` off outside calibration.

Source: `M:6.-outputs/loopback-and-advanced-output-techniques`,
`M:4.-surfaces`. Max: `jit.world`, `jit.gl.cornerpin` refpages.

### Movies

**Playback mode is chosen by name**: loop, play once and hold, ping-pong,
random frames, plus speed and loop in and out. `jit.movie` has the parts
(`loop`, `looppoints`, `rate`, `frame`) but its refpage describes `loop` only as
a number with a default.

Source: `M:3.-media/media-bin`. Max: `jit.movie`, `jit.playlist` refpages.

**The codec advice is spelled out.** HAP for scrubbing, reverse and many
layers; H.264 only for forward playback, or exported with a keyframe on every
frame; add up the clips' data rates and test the drive. Max's userguide agrees
about HAP and says both its video engines play it natively, but stops there.

Source: `M:3.-media/media-formats-and-video-codecs`,
`M:12.-advanced/performance-optimization`. Max: userguide `jitter/video`,
`jitter/video_engine`.

**Movie sound.** MadMapper warns that hardware decoding on macOS sends a
movie's sound to the system output, past its own audio settings. Max has the
same shape of problem by default: `jit.movie` plays sound through the video
engine, not through the patch, and `jit.movie~` is the object that brings it
into MSP. MadMapper also has a switch that ties a movie's sound level to its
surface's opacity; in Max that is one fader sent to two places.

Source: `M:3.-media/media-formats-and-video-codecs`, `M:3.-media/media-bin`,
`M:15.-troubleshooting`. Max: userguide `jitter/video`, `jit.movie` refpage.

**Image folders.** A folder of numbered stills is one media item with its own
frame rate, a preload cache and auto scan. Max has `jit.gl.textureset` to hold
frames, but no folder player.

Source: `M:3.-media/media-bin`. Max: `jit.gl.textureset` refpage.

**Media changes crossfade, effects do not.** A cue that swaps media draws the
surface twice during the fade. In Max that is an A/B pair into
`jit.fx.tr.xfade`.

Source: `M:15.-troubleshooting`, `https://madmapper.com/madmapper/faq`. Max:
`jit.fx.tr.xfade` refpage.

**Two clips in step: one wide file, two crops.** The FAQ's answer to keeping
two videos synchronised is to put them side by side in one movie.

Source: `M:15.-troubleshooting`, `https://madmapper.com/madmapper/faq`.

**Idle sources stop.** An NDI source is processed only while a visible surface
uses it, unless *Keep running (uses more CPU)* is ticked. Max leaves that to
the patcher: `stop` the movie and `enable 0` its effects when the layer is at
zero.

Source: `M:11.-live-performance-and-control`. Max: `jit.movie`, `jit.fx.*`
refpages.

### Shaders

**Render once at a set size, or per surface.** A Generator is one texture
shared by all its surfaces; a Material is redrawn on each. In Max the same
choice is `jit.gl.slab` / `jit.gl.pix` (to a texture, whose size should be
stated with `@adapt 0 @dim`) against `jit.gl.shader` bound to the plane.

Source: `M:3.-media/media-bin`. Max: `jit.gl.slab`, `jit.gl.shader`,
`jit.gl.pix` refpages.

### Outputs and displays

**An output names its display; fullscreen is global.** Each output's
Destination is a real display, and one command sends all outputs fullscreen.
Max's `jit.world` has `fullscreen` and a window position, and `jit.displays`
reports each display's rectangle, but nothing ties the two together.

Source: `M:6.-outputs`, `M:2.-the-interface/keyboard-shortcuts`,
`https://madmapper.com/madmapper/faq`. Max: `jit.world`, `jit.window`,
`jit.displays` refpages.

**Frame delay per output** to match slow and fast projectors. Max:
`jit.fx.delay`, with `interp` off.

Source: `M:6.-outputs`. Max: `jit.fx.delay` refpage.

**Engine frame rate is a project setting.** In Max, `jit.world`'s `fps` is
ignored on a Mac until `displaylink` is turned off.

Source: `M:2.-the-interface/madmapper-preferences`. Max: `jit.world` refpage.

### Time, tempo and animation

**One speed, one freeze.** Master Speed scales every animation and the audio;
Freeze Engine stops everything; Freeze Video Output holds the picture while
playback continues. Max has no single control; a patch gets one only if every
animation reads the same time source.

Source: `M:9.-master-settings`,
`M:11.-live-performance-and-control/osc-commands-and-channels-list`. Max:
`jit.mo.time`, `transport` refpages.

**Tempo has a source menu.** Audio beat detection, Ableton Link, MIDI clock,
manual and tap, with Resync. Max's `transport` has a `clocksource` attribute
and a `getclocksources` message, and the Link package installs a clock source
extension next to `link.session`, `link.beat` and `link.phasor~`. Max has no
built-in beat detector or tap tempo object that this search found.

Source: `M:9.-master-settings/audio-input-and-beat-detection`. Max: `transport`
refpage, Link package refpages.

**LFOs are modules.** Oscillator, Oscillator 2D and Oscillator Bank (ten
values spread by one Offset). The Max match for visuals is `jit.mo.time` in
function mode and `jit.mo.func` for a spread of phases.

Source: `https://madmapper.com/files/09-Modules.pdf`. Max: `jit.mo.time`,
`jit.mo.func` refpages.

**Audio analysis comes pre-named**: `amplitude`, `bass`, `medium`, `treble`
and beat counts, from channels chosen once in the preferences. Max can analyse
far more, but the patcher has to build and name it.

Source: `M:9.-master-settings/audio-input-and-beat-detection`. Max: `peakamp~`,
`fffb~`, `snapshot~` refpages.

### Control

**Two ways in.** A value sent to a parameter's own OSC address is applied
as it is; a Control on the same parameter adds range, filter and curve. Max 9
is close: parameter-enabled objects get `/<patcher>/param/<name>` addresses
with `/raw` and `/normalized` under each. In both programs the address is made
from names the author chose, so a rename breaks remotes.

Source: `M:11.-live-performance-and-control/osc-commands-and-channels-list`.
Max: userguide `OSC`, `param.osc` refpage.

**Feedback to controllers.** MIDI inputs pair with a feedback device; OSC has a
feedback port. Max does the MIDI half when Map is enabled on an output port in
MIDI Setup, and the OSC half with `param.osc @auto 1`.

Source: `M:11.-live-performance-and-control`,
`M:2.-the-interface/madmapper-preferences`. Max: userguide `mapping`,
`param.osc` refpage.

**Combining sources is a module.** One Control per source type per parameter;
a Controls Combiner mixes several. Max lets any number of cords reach an inlet,
and the last message wins, which is rarely what was meant.

Source: `M:8.-modules`, `M:15.-troubleshooting`.

**Game controllers.** Named inputs in both. Max's `gamepad` object also sends
rumble and light colour back.

Source: `M:11.-live-performance-and-control`. Max: `gamepad` refpage.

### Presets

**An edited cue is visibly edited.** Changed controls are outlined until the
cue is updated. `pattrstorage` answers `getedited` with 1 or 0, which is enough
for one indicator light.

Source: `M:10.-timelines/scenes-and-cues`. Max: `pattrstorage` refpage.

**Presets and playing media.** Scenes restart media; the manual steers people
to Cues, and the FAQ's fix for restarting audio is to untick one stored value.
In Max, keep play and restart controls out of `pattrstorage` with `active` or
`subscribemode`.

Source: `M:10.-timelines/scenes-and-cues`, `M:15.-troubleshooting`. Max:
`pattrstorage` refpage.

### Files and the working environment

**A project is a folder with a collect command.** Max's equivalent is a
Project with Consolidate and Archive.

Source: `M:2.-the-interface/madmapper-project-file-structure`. Max: userguide
`projects`.

**Machine settings and project settings are separate tabs.** Audio device and
capture hardware belong to the computer; MIDI devices, OSC ports and frame rate
travel with the project.

Source: `M:2.-the-interface/madmapper-preferences`.

**Saving is treated as risky during a show.** AutoSave never overwrites the
project, counts down ten seconds, and can be paused. `pattrstorage` has
`backupmode` for rotating backups.

Source: `M:12.-advanced/project-backup-and-recovery`. Max: `pattrstorage`
refpage.

**Hover help.** A status line describes whatever is under the mouse. Max's
`hint` and `annotation` attributes do the same for a patch, if the author
fills them in.

Source: `M:2.-the-interface/interface-overview`. Max: userguide `objects`.

### Where Max is ahead

- **Effects.** A MadMapper surface has one FX slot, and the FAQ says it cannot
  fade between two effects. Max chains any number of shader stages and can
  crossfade two chains. Source: `M:4.-surfaces/surface-inspector`,
  `M:15.-troubleshooting`.
- **Control sources per parameter.** MadMapper allows one Control per source
  type on a parameter. Max has no limit. Source: `M:15.-troubleshooting`.
- **Audio.** MadMapper plays to one audio interface at a time, with a four-band
  equaliser and a routing matrix, and analyses amplitude, three bands and tempo.
  Max is a full audio environment. Source: `M:14.-technical-notes/audio-routing`,
  `M:9.-master-settings/audio-input-and-beat-detection`.
- **Logic.** MadMapper has no scripting; its outside interface is the OSC
  address tree. Source: `M:11.-live-performance-and-control`.
- **3D.** A 3D Surface is an imported model to calibrate and light. There is no
  general scene, camera or physics. Source: `M:4.-surfaces/advanced-3d-and-scanning`
  (session 1).
- **Fixtures do not blend.** One DMX fixture over another replaces it. Source:
  `https://madmapper.com/files/01-Introduction%20to%20the%20User%20Interface.pdf`.
- **Recording the output.** The FAQ's three ways to record a mapping all go
  outside the program (a Syphon or Spout recorder, an NDI recorder, a capture
  card); version 6 adds timeline export. Max records from inside with
  `jit.record` after `jit.gl.asyncread`. Source:
  `https://madmapper.com/madmapper/faq`; Max: userguide `jitter/video`.
- **Game controller output.** `gamepad` can drive rumble and LEDs. Source: Max
  `gamepad` refpage.
- **Opening at startup.** MadMapper's FAQ says the only way is to add the
  project to the system's startup items and tick fullscreen-on-open. Max can
  be built into a standalone application. Source:
  `https://madmapper.com/madmapper/faq`; Max: userguide
  `standalones_and_collectives`.

### Other things learned from the pages first read in session 2

- **Cameras that crash the program are remembered.** If opening a camera
  driver crashes MadMapper once, it will not try that camera again until a
  preference is cleared. Source: `https://madmapper.com/madmapper/faq`.
- **Multiple graphics cards (Windows).** All processing happens on the card
  attached to the main display. Source: `https://madmapper.com/madmapper/faq`.
- **Etherdream and ShowNET want a quiet network.** The laser FAQ says not to
  put Art-Net and an Etherdream DAC on the same network. Helios is 12-bit in X
  and Y, Etherdream 16-bit. Source: `https://madmapper.com/extensions/FAQ`.
- **PJLink limits.** Not every projector answers discovery, which can take 30
  seconds; cheap projectors report wrong status and keep the lamp on when
  muted. Source: `https://madmapper.com/extensions/FAQ`.
- **MiniMad export settings.** Fullscreen maximum quality mode plays a movie
  straight to the screen when the mapping is one unwarped fullscreen quad; Crop
  media exports only the part of each movie the projector uses; every frame can
  be exported as a keyframe; units only sync within the same Sync group.
  Source: `https://madmapper.com/files/03-My%20First%20MiniMad%20Video%20Export.pdf`.
- **MiniMad and power.** It restarts by itself after a power cut, but cutting
  power while it writes its card (after a media change with "start last played
  media", a luminosity or volume change, or an edit) can corrupt the card. It
  can be shut down by OSC, and scheduled with a mains timer. Source:
  `https://download.madmapper.com/minimad/minimad-userguide.pdf`,
  `https://madmapper.com/minimad/faq`.
- **MiniMad sync rule.** Units play in step when their movies have the same
  frame count and frame rate, whatever the files are called. Source:
  `https://download.madmapper.com/minimad/minimad-userguide.pdf`.
- **Firmata boards.** Arduino Uno, Mega and (Mac only) Teensy 3.2 or 4.0; an
  Uno cannot do PWM and Servo at once. Source:
  `https://madmapper.com/files/10-Arduino%20Firmata.pdf`.
- **MadSDF's domain functions.** Besides shapes and fills, the library has
  `repeat` and `repeatRadial` with a per-cell id, so one shape becomes a grid
  or ring at no extra cost. Source:
  `https://raw.githubusercontent.com/madmappersoftware/MadMapper-Materials/HEAD/Libraries/MadSDF.md`.

---

## Things the documents disagree about

Recorded so a later reader does not take one page as settled.

| Topic | One page says | Another says |
|---|---|---|
| OSC input port | default 8010 (`M:2.-the-interface/madmapper-preferences`) | "typically Port 8000" (`M:11.-live-performance-and-control/osc-commands-and-channels-list`) |
| Multi-pass ISF | not supported (`M:3.-media/media-bin`) | "Support render passes in ISFs" added in 6.0.0 (`M:1.-introduction/what's-new/release-notes-v6`) |
| Fixture file extension | `.mmfl` (`M:14.-technical-notes/dmx-fixture-definitions`) | `.mmf`, as an XML schema (`M:appendices`) |
| DXV codec | not supported (`M:3.-media/media-formats-and-video-codecs`) | "DXV3" listed (`M:appendices`) |
| Universe count | 16384 (`M:15.-troubleshooting`) | 4096 (`https://madmapper.com/madmapper/features`) |
| Minimum macOS | 11 (`M:13.-setup-and-installation/requirements`) | 10.13 (`M:faqs`) |
| What "Conductor" is | the master timeline (`M:10.-timelines/timelines-overview-and-the-conductor`) | a grid-based cueing system (`M:glossary-of-terms`) |
| MadProjectorControl | power and mute only (`M:12.-advanced/madprojectorcontrol`) | also "input switching" (`M:glossary-of-terms`) |
| Media Tab position | on the right by default (`M:2.-the-interface/interface-overview`) | on the left by default (`M:1.-introduction/what's-new/madmapper-v6`) |
| Where the Space Scanner image comes from | "does not create a 3D model" (`M:12.-advanced/special-tools-and-auto-calibration`) | "recognizes a 3D volume" (`M:1.-introduction/what-is-madmapper/madmapper-history`) |
| Recommended codec | HAP "highly recommended", H.264 costly (`M:3.-media/media-formats-and-video-codecs`) | H264 "the standard", HAP for very high resolutions (`https://madmapper.com/madmapper/faq`, `M:15.-troubleshooting`) |
| USB DMX devices supported | garageCube, ShowJockey, Enttec DMX USB Pro and Pro MK2, DMX King eDMX2 Pro (`M:2.-the-interface/madmapper-preferences`) | garageCube, Enttec Open USB DMX, Enttec DMX USB Pro MKII only (`https://madmapper.com/madmapper/faq`) |
| MiniMad size | 10 x 9 x 3 cm (`https://madmapper.com/minimad/product`) | 9 x 6 x 3 cm (`https://madmapper.com/minimad/faq`, `https://download.madmapper.com/minimad/minimad-userguide.pdf`) |
| MiniMad video limit | mapped video up to 1080p25, unmapped up to 1080p30 (`https://madmapper.com/minimad/product`) | HDMI output up to 1080p60 (`https://madmapper.com/minimad/faq`) |
| Which version the site describes | MadMapper 6 (`M:faqs`, `https://madmapper.com`) | MadMapper 5 throughout (`https://madmapper.com/madmapper/faq`, `https://madmapper.com/extensions/FAQ`) |

The appendices page lists seven appendices by title, with a line each and
nothing behind them. One manual page still carries an editor's note left in by
mistake (`M:3.-media/writing-custom-glsl-materials`), which suggests parts of
the manual were machine-drafted; treat exact numbers in it with care.
