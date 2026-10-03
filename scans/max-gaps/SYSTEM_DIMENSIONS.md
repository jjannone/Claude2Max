# System-Level Dimensions

The fixed list of dimensions used to compare each tool's general approach with
Max's. Each tool's scan folder holds a `<tool>_system_model.json` written
against this list, and `max_system_model.json` in this folder holds Max's.
`system_differences.md` puts them side by side.

A dimension is about how the whole system works, not about one object.
Scans may add dimensions they find that are not listed; give each a new id
starting at 21 and say why it is system-level.

| id | Dimension | The question it answers |
|---|---|---|
| 1 | Evaluation | What makes computation happen: an event pushing downstream, an output pulling from upstream, a frame loop? What stops work nobody is using? |
| 2 | Ordering | Within one event, what decides the order things happen in: position, cord creation order, an explicit trigger, the graph's shape? |
| 3 | Time | What clocks exist (frame, sample, scheduler, timeline, wall clock)? What units does time come in? How do time-based parts relate to a global time? Can it run faster or slower than real time? |
| 4 | Data types | What kinds of data flow (messages, signals, matrices, textures, channels, tables, geometry, objects)? Do they carry names or metadata? How is one converted to another? |
| 5 | Rates and channels | Control rate, audio rate, frame rate: how are they separated or mixed? Can each part have its own rate? How are many channels handled? |
| 6 | State and saving | What is saved with the file? Do runtime values survive a save and reopen? Presets and snapshots? What happens at load? |
| 7 | Parameters | Is every setting a named parameter? Can a parameter be driven by an expression, a binding or an export? Ranges, units, defaults? How are parameters exposed to the outside (OSC, MIDI, a host)? |
| 8 | Encapsulation and reuse | Subpatches, components, abstractions: how are they made, given arguments and ports, replicated many times, versioned and shared? |
| 9 | Names and scope | How does one part refer to another: global names, paths, references, wireless links? What limits a name's reach? |
| 10 | Show structure | How is a whole work organised: one graph, scenes, cues, timelines? How are parts turned on and off? |
| 11 | Interface | Where do controls live (panels, a sidebar, a presentation view, generated from parameters)? How does a control bind to a value? Is there a separate performer view? |
| 12 | Editing while running | Does the work keep running while it is edited? Blind editing, safe changes, undo? |
| 13 | Scripting | Which languages are built in? Can a script build or change the graph, react to events, define new parts? |
| 14 | Errors and debugging | How do errors show up (console, on the node, as data)? Viewers on every node, probes, profiling? |
| 15 | Rendering | For visual tools: render tree or context, what decides draw order, render passes, how state like transforms and materials applies, CPU versus GPU. |
| 16 | Performance and concurrency | Threads, processes, GPU use; how the cost of each part is shown. |
| 17 | Several machines | Sync, sharing data and video, control over a network, at the level of the whole system. |
| 18 | Deployment | Runtime or player, export targets, running as a plug-in, licensing, running unattended. |
| 19 | Extending | SDKs, writing new parts in C/C++, JavaScript, Lua, Python, GLSL; how a new part looks to the user. |
| 20 | Media and files | How media and other files are found, organised, preloaded, relinked, collected with the project. |
