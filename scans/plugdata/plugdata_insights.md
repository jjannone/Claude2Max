# plugdata / Pure Data Insights

Notes on how Pure Data (Pd) vanilla works, and what plugdata adds to it, read on
2026-10-02 out of the plugdata 0.9.3 install on this machine and plugdata's web
documentation. Written for a reader who knows Max and has never patched in Pd.

Pd and Max are siblings: Miller Puckette wrote both. Most object names are the
same, so the useful notes are the places where the two differ.

**Where these notes come from.** Every entry ends with the file or page it was
read from. Nothing here is from memory. `plugdata_crawl_state.json` says which
files were read and which were not.

- `L:<path>` means a file under `~/Documents/plugdata/`. For instance
  `L:Documentation/5.reference/clone-help.pd`.
- `Manual 2.x` means a section of Pd's HTML manual,
  `L:Documentation/1.manual/resources/chapter2.htm` and so on (the manual says it
  is "Updated for Pd version 0.55-2").
- `book:` means the plugdata documentation book at `https://plugdata.org/docs/book/`.
- `hvcc:` means the Heavy compiler docs at `https://wasted-audio.github.io/hvcc/latest/`.

**Not covered here.** ELSE, cyclone and Gem ship inside plugdata and have their
own scans. `~/Documents/plugdata/Externals/` is empty on this machine, so no
other packages are installed.

**Object names are spelled as the documents spell them.** Pd writes objects in
square brackets, `[clone]`, and so do these notes.

**Max facts in this file** were checked against Max 9's refpages, object
registry and userguide on this machine. Each comparison in
`plugdata_max_gap_candidates.json` says what was read.

---

## 1. The model

### Two kinds of object, two kinds of cord

Control objects act now and then, when a message arrives. Tilde objects (`[osc~]`)
compute audio all the time while DSP is on. Cords are control or signal
depending on the outlet they leave; signal cords are drawn thicker. A control
cord may go into a signal inlet, where numbers are turned into a signal. A
signal cord may not go into a control inlet. This is the same split as Max and
MSP.

Source: Manual 2.1.2

### A message is a selector plus atoms, and all numbers are floats

A message is a first word (the selector) followed by atoms. The special
selectors are `float`, `symbol`, `list`, `bang` and `pointer`. A message that
starts with a number gets `float` or `list` without anyone writing it. A list
that starts with a symbol must be written `list a b c`, or the first word is
taken as the selector.

Pd has **one number type**. There is no int. `1` and `1.` are the same number,
and `[/ 4]` gives `1.25` for 5. Numbers show at most 6 significant digits, but
hold more. Without an int type, whole numbers are exact only up to 2^24 in the
normal build (2^53 in the double-precision build, "Pd64").

A float is a one-item list, a symbol is a one-item list, and a bang is an
empty list. The `[list]` objects rely on this.

Source: Manual 2.4.1; `L:Documentation/2.control.examples/04.messages.pd`;
`L:Documentation/5.reference/list-help.pd`

### Hot left inlet, cold other inlets, right-to-left outlets

As in Max: the left inlet makes the object act, the others only store. Objects
with several outlets send from right to left. A list sent to the left inlet is
spread over the inlets. The one named exception to "left is hot" is `[timer]`.
Cold inlets keep their value, except in `[line]`, `[line~]` and `[vline~]`,
where the ramp time is used once and then cleared.

Source: Manual 2.4.3; `L:Documentation/5.reference/line-help.pd`

### Depth first, and one cord order that differs from Max

A message runs its whole tree of consequences before the next one starts, depth
first, as in Max. A loop with no delay in it overflows the stack and Pd reports
it; a loop through `[delay]` is legal, even with a delay of 0.

**The difference:** when one outlet feeds several inlets, Pd sends in the order
the cords were made. Max sends right to left by position. In Pd the order
cannot be seen in the patch at all, so `[trigger]` (short `[t]`) is the only
safe way to fix an order. The manual says so twice, and the tutorial shows a
"good" and a "bad" adder that look identical.

Source: Manual 2.4.2, 2.4.3, 2.11.1;
`L:Documentation/2.control.examples/03.connections.pd`, `08.depthfirst.pd`

### `[trigger]`

Arguments are `float`, `bang`, `symbol`, `list`, `anything`, `pointer`, or their
first letters. `a` passes any message unchanged. With no arguments it is
`[t b b]`. Unlike Max's `trigger`, the help file shows no constants as
arguments.

Source: `L:Documentation/5.reference/trigger-help.pd`

### Message boxes

Commas separate messages sent one after another. A semicolon makes the next
word a destination name, as in Max: `; pd dsp 1` sends `dsp 1` to the receiver
`pd`. `$1`, `$2` take values from the incoming message. `$0` is **not**
expanded in a message box. Messages `set`, `add`, `add2`, `addcomma`,
`addsemi`, `adddollar`, `adddollsym` rewrite the box's own text.

The backslash escapes space, comma, semicolon, dollar and itself. Pd has no
quote marks for symbols with spaces; `hello\ world` is one symbol.

Source: Manual 2.4.4, 2.4.5; `L:Documentation/5.reference/message-help.pd`

### Logical time and determinism

Time is kept as a 64-bit float in milliseconds. Audio is computed in blocks of
64 samples. Control messages run between blocks, never inside one, so every
change made in one cascade lands on the same block. Events scheduled with
`[delay]` and its relatives happen in their scheduled order whether or not Pd
is keeping up with real time. `[timer]` measures this logical time, so timing a
`[delay]` gives exactly the delay; `[realtime]` and `[cputime]` measure the
clock on the wall.

Source: Manual 2.6; `L:Documentation/5.reference/timer-help.pd`,
`realtime-help.pd`, `cputime-help.pd`

### Nothing is saved but what you see

A patch file stores the boxes, their text and the cords. Values sent into an
object after it was made are lost on reload. The exceptions: a subpatch's
contents, arrays with "Save contents" on, `[text define -k]`, `[array define
-k]`, `[scalar define -k]`, and what `[savestate]` hands back. The manual says
it is "probably bad style" to type a creation argument you will override later.

There is no preset system. The manual says this is on purpose: restore values
with explicit sends, a message box, or a text file.

Source: Manual 2.1.4, 2.7.2, 2.11.1

---

## 2. Names: Pd object → Max object

Pairs confirmed on both sides (the Pd name in a help file, the Max name in the
Max 9 registry).

| Pd | Max | Note |
|---|---|---|
| `[pd name]` | `p name` | one-off subpatch |
| `[inlet~]` `[outlet~]` | `inlet` `outlet` | Pd has separate signal versions; Max's carry both |
| `[spigot]` | `gate` | Pd: data left, control right. Max `gate`: control left |
| `[moses]` | `split` | `[moses 5]`: below 5 goes left. Max `split` tests a range instead |
| `[until]` | `uzi` | `[until]` with a bang loops until its right inlet is banged |
| `[makefilename]` | `sprintf` | one `%` field per `[makefilename]`; chain them for more |
| `[list ...]` | `zl ...` | see section 6 |
| `[tabread]` `[tabwrite]` | `table` / `peek~` | |
| `[tabread4~]` | `index~` / `play~` | Pd's index is in samples, 1 to size-2, with 4-point interpolation |
| `[tabosc4~]` | `cycle~` with a `buffer~` | |
| `[tabwrite~]` | `record~` | a bang records one pass |
| `[readsf~]` `[writesf~]` | `sfplay~` `sfrecord~` | Pd: wave, aiff, caf, next only |
| `[soundfiler]` | `buffer~` `read` / `write` | |
| `[delwrite~]` `[delread~]` `[delread4~]` | `tapin~` `tapout~` | Pd links by name, Max by cord |
| `[osc~]` | `cycle~` | |
| `[lop~]` | `onepole~` | one-pole lowpass |
| `[samphold~]` | `sah~` | different trigger rule, section 9 |
| `[threshold~]` | `thresh~` + `edge~` | |
| `[env~]` | `average~` / `peakamp~` | output is dB with 100 = full scale |
| `[snake~ in]` `[snake~ out]` | `mc.pack~` `mc.unpack~` | |
| `[clone]` | `poly~` / `mc.poly~` | section 4 |
| `[switch~]` | `mute~`, `poly~` muting | section 9 |
| `[openpanel]` `[savepanel]` | `opendialog` `savedialog` | |
| `[netsend]` `[netreceive]` | `udpsend` `udpreceive` | Pd also does TCP |
| `[midirealtimein]` | `rtin` | |
| `[polytouchin]` | `polyin` | |
| `[value]` / `[v]` | `value` / `v` | Pd's holds one number only |
| `[declare]` | (none) | section 12 |
| `[pdcontrol]` | `patcherargs`, `thispatcher` | section 7 |
| `[namecanvas]`, messages to `pd-name` | `thispatcher` | section 7 |
| `[loadbang]` | `loadbang` | |
| `[key]` `[keyup]` `[keyname]` | `key` `keyup` | |
| `[bag]` `[poly]` `[makenote]` `[stripnote]` `[change]` `[pipe]` `[route]` `[select]` `[pack]` `[unpack]` `[swap]` `[random]` `[metro]` `[delay]` `[line]` `[timer]` `[qlist]` `[print]` `[expr]` | same names | details differ, see below |

Pd objects with **no Max object of that name** in the registry: `expr~`,
`fexpr~`, `bang~`, `throw~`, `catch~`, `sigmund~`, `bonk~`, `fiddle~`, `pd~`,
`netsend`, `netreceive`, `oscformat`, `oscparse`, `block~`, `switch~`, `clone`,
`snake~`, `struct`, `file`.

Small traps when reading a Pd patch:

- **dB means something else.** `[dbtorms]` maps 100 dB to amplitude 1 and 0 dB
  to 0. `[env~]` reports on the same scale. Subtract 100 to get dBFS.
  (`L:Documentation/5.reference/acoustics-help.pd`, `env~-help.pd`)
- **`[random 5]`** gives 0 to 4; seeds are per object.
  (`random-help.pd`)
- **`[bendin]` gives 0 to 16383 but `[bendout]` takes -8192 to 8191**; the help
  file calls it a known bug that will not change. `[pgmin]` / `[pgmout]` count
  from 1. `[noteout]` has no release velocity. (`midi-help.pd`)
- **MIDI port is folded into the channel number.** Channels 1–16 are port 1,
  17–32 port 2, and so on. (`midi-help.pd`; Manual 3.3.2)
- **`[route]` with a `list` or `float` argument** routes by message type. To
  route a symbol-first list by its first word, strip the selector with `[list
  trim]` first. (`route-help.pd`)
- **`[select]` and `[route]`** take numbers or symbols as arguments, never a
  mix. (`select-help.pd`, `route-help.pd`)

Source for the Pd names: `L:Documentation/5.reference/help-intro.pd` (the list
of all vanilla objects) and the help files named. Manual 2.11.1 lists the
Pd/Max differences from Pd's side.

---

## 3. Subpatches, abstractions and arguments

### `[pd]` and abstractions

`[pd name]` is a one-off subpatch saved inside its parent. An abstraction is a
`.pd` file used by typing its name. Both get inlets and outlets from `[inlet]`,
`[outlet]`, `[inlet~]`, `[outlet~]` inside, in left-to-right order.

Opening an abstraction from a patch opens the real, editable file. Saving it
changes the file, but other loaded copies do not update until the patch is
reopened. (Manual 2.8.1 says changes affect "all invocations of it as they are
created"; the tutorial says you must cause Pd to reload the other copies.)
Saving from inside a subpatch saves the parent.

Source: Manual 2.8, 2.11.1;
`L:Documentation/2.control.examples/12.PART2.subpatch.pd`

### `$1`…, `$0`, and where they work

In an **object box**, `$1`, `$2` are the abstraction's creation arguments, and
`$0` is a number unique to each patch. `$0` works in every patch, not only in
abstractions. `$1-x` joins text:
this is how local names are made (`[s $0-freq]`, `[array define $0-buf]`).

In a **message box**, `$1` means something else (the incoming message) and
`$0` does not expand. To get a creation argument or `$0` into a message, pass
it through `[float $1]`, `[symbol $1]` or `[f $0]` first. The help files repeat
this in a "Dealing with $0" subpatch on almost every object that takes a name.

For a variable number of arguments, `[pdcontrol]` answers the `args` message
with all of them as one list; `args 1` gives the parent's.

In expr, `$0-x` is read as "ID minus x". Put the `$0` after a letter (`x$0`)
or use `var("$0-y")`.

Source: Manual 2.7.5, 2.8.1;
`L:Documentation/2.control.examples/13.locality.pd`, `14.dollarsigns.pd`,
`dollarsign2.pd`; `L:Documentation/5.reference/pdcontrol-help.pd`,
`expr-help.pd`

### Graph-on-parent

A subpatch or abstraction with "graph on parent" ticked shows its own GUI
objects on its box in the parent. The setting is saved in the abstraction, so
the abstraction decides what its face looks like. Only controls show. This is
Pd's `bpatcher`, and the manual says it "is quite different from the one in
MAX".

Source: Manual 2.8.2, 2.11.1; `L:Documentation/2.control.examples/gop-abs.pd`

### `[savestate]`: an abstraction that saves its state in the parent

Inside an abstraction, `[savestate]` bangs its right outlet when the **parent**
is saved. The abstraction answers with one or more lists. They are written into
the parent's file, and come back out the left outlet when the parent is opened.
Each copy saves its own. Copies inside `[clone]` are not handled.

Source: `L:Documentation/5.reference/savestate-help.pd`, `savestate-ex1.pd`,
`savestate-ex2.pd`, `savestate-ex3.pd`

### `[inlet~]` details

An `[inlet~]` takes a float to set its value when no signal is connected. With
the `fwd` argument it gets a second outlet for other messages sent to the same
inlet. When the subpatch runs at another sample rate, the argument picks how
to resample: `hold` (default), `pad` (zeros) or `lin`.

Source: `L:Documentation/5.reference/inlet-outlet-help.pd`

---

## 4. `[clone]` versus `poly~`

`[clone abstraction N]` makes N copies of an ordinary abstraction. No special
in/out objects are needed inside.

- `$1` inside each copy is its number (from 0; `-s 1` starts at 1; `-x` turns
  this off). Further arguments arrive as `$2` on.
- A list that starts with a number goes to that copy. `next`, `this`, `all`
  and `set` address copies without a number. Control outlets put the copy
  number in front of what they send.
- A signal inlet feeds every copy the same signal. Signal outlets are summed.
  `-di` hands each copy one channel of a multichannel input, `-do` keeps the
  outputs apart as one multichannel signal, `-d` does both.
- `resize N` changes the number of copies (not while performing). `vis n 1`
  opens a copy.
- It does no voice allocation. `[poly voices steal]` does that as a separate
  object: note in, voice number out. The tutorial wires `[poly] → [pack] →
  [clone -s 1 voice 8]`.
- There is no muting. Put a `[switch~]` in the abstraction if a silent voice
  should cost nothing.

Max's `poly~` puts allocation (`note`, `midinote`, `@steal`), muting
(`thispoly~`), threads (`@parallel`) and resampling (`up`, `down`) in one
object, and needs `in`, `in~`, `out`, `out~` inside.

Source: `L:Documentation/5.reference/clone-help.pd`, `clone-abs-a.pd`,
`poly-help.pd`; `L:Documentation/3.audio.examples/D11.sampler.poly.pd`;
`L:Documentation/7.stuff/synth/1.poly.synth.pd`

---

## 5. Data: arrays, text, and data structures

### Arrays

An array is a named list of floats. It is one thing for both worlds: control
objects and signal objects read and write the same array. It can sit in a
graph, where it is drawn and can be redrawn with the mouse.

Messages to the array's name: `resize`, `const`, `normalize`, `sinesum`,
`cosinesum`, `read`, `write`, a list (index then values), and for looks
`bounds`, `xticks`, `yticks`, `xlabel`, `ylabel`, `style`, `color`, `width`,
`vis`, `edit`.

`[array define]` makes one without a graph (`-k` keeps the contents in the
patch). The family: `[array size]`, `[array sum]`, `[array get]`,
`[array set]`, `[array min]`, `[array max]`, `[array quantile]`,
`[array random]`. The last two treat the array as a histogram, so `[array
random]` draws an index with odds set by the stored values.

Source: Manual 2.9; `L:Documentation/2.control.examples/15.array.pd`,
`16.more.arrays.pd`; `L:Documentation/5.reference/array-object-help.pd`,
`canvas-help.pd`

### `[text]`

A "text" is a stored list of messages, separated by semicolons and commas,
exactly what a message box or a patch file can hold. Manual 5 calls it "sort of
like Max's coll but simpler".

- `[text define -k name]`: holds it; click to edit; `read` / `write` files;
  `sort`; second outlet says `updated` when it changes.
- `[text get]`, `[text set]`, `[text insert]`, `[text delete]`, `[text size]`:
  by line number and, if wanted, by item number within the line.
- `[text tolist]`, `[text fromlist]`: the whole text as one list.
- `[text search]`: finds the line that best matches a key. Fields can be
  matched exactly, or with `>`, `>=`, `<`, `<=`, `near`. `range` limits the
  lines searched.
- `[text sequence]`: plays the text. `step` sends one line; `bang` runs to the
  next wait; `auto` treats leading numbers as delays. `-g` sends each line to
  the receiver named by its first word. `args` fills `$1`, `$2` in the text.
  `tempo` sets the time unit.

`[qlist]` and `[textfile]` are the older objects; the help files point to
`[text]` as the replacement.

Source: `L:Documentation/5.reference/text-object-help.pd`, `qlist-help.pd`,
`textfile-help.pd`; `L:Documentation/2.control.examples/23.sequencing.pd`

### Data structures

Max has nothing like this. A **template** is a subpatch holding one `[struct
name float x float y ...]` and any number of drawing objects. Field types are
`float`, `symbol`, `text` and `array` (an array's elements follow another
template, so structures nest). A **scalar** is one piece of data made from a
template. Scalars live in a window, as a list.

Drawing objects in the template say how every scalar of that kind looks:
`[drawpolygon]`, `[filledpolygon]`, `[drawcurve]`, `[filledcurve]`, `[plot]`
(for an array field), `[drawnumber]`, `[drawsymbol]`, `[drawtext]`. An argument
can be a number or a field name. Where a field name sets a coordinate, dragging
that point with the mouse changes the field. So the drawing is also the
editor. `-v field` makes visibility depend on a field; `a(0:100)(10:110)`
rescales a field for drawing.

Access is by **pointer**, a third atom type. `[pointer]` walks the list
(`traverse pd-windowname`, `next`). `[get]` and `[set]` read and write fields.
`[element]` gives a pointer to one array element. `[getsize]`, `[setsize]`,
`[append]` change sizes and add scalars. `[struct]`'s outlet reports `click`,
`change`, `select`, `deselect` and `displace` with a pointer to the scalar
touched. A window of scalars reads and writes a text file (`read`, `write`),
and can `sort` by x.

Colours are three digits, 0–8 each for red, green, blue (`900` is red).

The tutorial builds a drawn score that plays (`09.sequencer.pd`), an FFT peak
plot, a sinusoid tracker whose partials can be dragged, and a two-dimensional
scope. The manual lists the limits itself: dense data is hard to select, and
the traversal patches "are not always simple".

Source: Manual 2.10; all of `L:Documentation/4.data.structures/`;
`L:Documentation/5.reference/struct-help.pd`, `pointer-help.pd`,
`get-help.pd`, `set-help.pd`, `element-help.pd`, `append-help.pd`,
`draw-shapes-help.pd`, `drawtext-help.pd`, `plot-help.pd`

---

## 6. Lists, expressions, values, files

### `[list]`

`[list append]`, `[list prepend]`, `[list split n]`, `[list trim]`,
`[list length]`, `[list store]`, `[list fromsymbol]`, `[list tosymbol]`.
`[list store]` holds a list and takes `get`, `set`, `insert`, `delete`,
`append`, `prepend`, `send`. `fromsymbol` / `tosymbol` turn a symbol into
character codes and back, which is how string work is done. Anything fed to a
`[list]` object becomes a list; `[list trim]` takes the `list` word back off.

Source: `L:Documentation/5.reference/list-help.pd`

### `[expr]`, `[expr~]`, `[fexpr~]`

One family, one syntax.

- `[expr]`: control. Inlets are `$f1`, `$i1`, `$s1`. Several expressions
  separated by semicolons give several outlets, evaluated right to left.
  Whole numbers typed in the box are ints, so `8 / 3` is 2; write `8.` or
  `float(8)`.
- `[expr~]`: signal, a block at a time. `$v1` is a signal inlet; the first
  inlet must be one.
- `[fexpr~]`: signal, one sample at a time, with memory. `$x1[-1]` is the
  previous input sample, `$y1[-1]` the previous output. So a filter or any
  difference equation is one line: `[fexpr~ $x1[0] + $y1[-1]]`. A fractional
  index interpolates. It is expensive; `stop` and `start` switch it.
- All three read `[value]` variables by name and can assign to them (`i = i +
  1`). They read arrays as `name[index]`; `[expr]` can also write them.
- Functions include `if(cond, a, b)`, `random(lo, hi)`, table `size`, `sum`,
  `avg`, `mtof`, `ftom`, `dbtorms`, and (in `[expr]` only) strings: `strcat`,
  `strlen`, `strcmp`, `tolower`, `symbol()`.

Source: `L:Documentation/5.reference/expr-help.pd`

### `[value]`, `[send]`, `[receive]`

`[value name]` is one number shared by every `[value]` of that name, and
visible to expr. It takes floats sent to its name by `[send]`.

`[send]` with no argument gets an inlet for the destination name. `[float]`,
`[int]`, `[value]`, `[list store]` and `[pointer]` take a `send name` message
that delivers their content to a receiver. A `[send]` can deliver to anything
with a name: a `[receive]`, a `[value]`, an array, a GUI object, a window
(`pd-name`), or Pd itself (`pd`).

Source: `L:Documentation/5.reference/value-help.pd`, `send-receive-help.pd`,
`float-help.pd`; Manual 2.11.1

### Files

`[file]` is a family for the file system: `[file handle]` (open, read and
write bytes, seek), `[file define]` (share a handle), `[file stat]`,
`[file isfile]`, `[file isdirectory]`, `[file size]`, `[file glob]`,
`[file which]` (find on Pd's path), `[file mkdir]`, `[file delete]`,
`[file copy]`, `[file move]`, `[file split]`, `[file join]`,
`[file splitext]`, `[file splitname]`, `[file patchpath]`,
`[file normalize]`, `[file isabsolute]`, `[file cwd]`. Errors come out a
second outlet as a bang.

Paths use forward slashes on every system. `~` expands to the home folder in
objects that read files. Pd writes next to the patch by default.

Source: `L:Documentation/5.reference/file-help.pd`; Manual 2.1.4, 3.4

---

## 7. Talking to Pd and to windows

`; pd dsp 1` turns audio on. Other messages to `pd`: `open file dir`,
`menunew`, `quit`, `verifyquit`, `perf`, `compatibility 0.52`,
`fast-forward ms`, `set-tracing`. Pd sends a bang to `pd-dsp-started` and
`pd-dsp-stopped`.

`compatibility` is worth knowing: when an object's behaviour is fixed in a new
version, the old behaviour stays available by setting the version number, and
the help file of each such object says so (`[cos~]`, `[bob~]`, `[line]`,
`[sigmund~]`, `[inlet~]`).

`fast-forward` runs the scheduler as fast as the machine can for the given
time: offline rendering from inside a patch.

Every window takes messages at the name `pd-<subpatch>` or `pd-<file>.pd`:
`vis`, `clear`, `loadbang`, `obj x y name args`, `msg`, `floatatom`, `text`,
`connect a out b in`, `disconnect`, `menusave`, `dirty`, `read`, `write`,
`scalar`. Objects are numbered in order of creation. `[namecanvas]` gives a
window an extra name, and `[pdcontrol]` reaches its own window with
`sendcanvas`. This is how patches build patches in Pd.

`[trace]` prints every message a chosen message causes, then the chain that led
to it; clicking a line selects the object.

Source: `L:Documentation/5.reference/pd-messages.pd`, `namecanvas-help.pd`,
`pdcontrol-help.pd`, `trace-help.pd`;
`L:Documentation/3.audio.examples/B16.long-varispeed.pd`

---

## 8. Time objects

`[delay]`, `[metro]`, `[timer]`, `[pipe]`, `[line]`. `[delay]`, `[metro]`,
`[timer]` and `[text sequence]` take a `tempo` message or two more arguments: a
number and a unit, `msec`, `sec`, `min` or `samp`, or the same with `per` in
front. `[metro 1 120 permin]` ticks once a beat at 120. Times need not be whole
numbers. Banging a running `[delay]` reschedules it.

`[line]` outputs every 20 ms by default (the "grain").

Source: `L:Documentation/5.reference/delay-help.pd`, `metro-help.pd`,
`timer-help.pd`, `line-help.pd`, `pipe-help.pd`;
`L:Documentation/2.control.examples/07.time.pd`

---

## 9. Audio: blocks, switching, feedback

### `[block~]` and `[switch~]`

One per window. `[block~ 1024 4 2]` sets that window, and everything inside
it, to blocks of 1024, overlapped by 4, at twice the sample rate. `[inlet~]`
and `[outlet~]` do the conversion to and from the parent; an `[outlet~]` in an
overlapped window overlap-adds. Sizes must be powers of two if the window has
signal inlets or outlets.

`[switch~]` is the same object with an on/off inlet. Off, the window and its
subwindows compute nothing. A bang to a switched-off `[switch~]` computes
exactly one block, which is how a table is filled or a window function made
without running audio there.

What this covers that Max splits across several objects:

- **Turning voices off**: `[switch~]` in each voice. Ramp to zero first, or a
  `[line~]` is frozen mid-ramp. A cheaper output than `[outlet~]` from a
  switched window is `[throw~]` out to a `[catch~]`.
- **FFT**: there is no `pfft~`. Put `[rfft~]` and `[rifft~]` in a subpatch with
  `[block~ 512 4]`, multiply by a Hann window on the way in and out, and divide
  by 3N/2. The FFT size is the block size.
- **One-sample feedback**: `[block~ 1]` in a subpatch makes `[delread~]` into
  `[delwrite~]`, or `[s~]` into `[r~]`, a one-sample loop.
- **Oversampling**: `[block~ 1024 1 16]` runs the window at 16 times the rate;
  you add your own lowpass before the `[outlet~]`.

`[dac~]` and `[adc~]` do not work in a reblocked window. `[send~]` /
`[receive~]` and `[throw~]` / `[catch~]` must be in windows with the same block
size.

Source: Manual 2.5.4; `L:Documentation/5.reference/block~-help.pd`;
`L:Documentation/3.audio.examples/G04.control.blocksize.pd`,
`I01.Fourier.analysis.pd`, `I03.resynthesis.pd`, `I07.phase.vocoder.pd`,
`J07.oversampling.pd`

### Signal connections without cords

- `[send~ name]` → any number of `[receive~ name]`. Only **one** `[send~]` per
  name; two is an error. A `[receive~]` can `set` which sender it hears.
- `[throw~ name]` → one `[catch~ name]`. Any number of throwers; the catcher
  **sums** them. This is the mix bus.
- `[delwrite~ name ms]` → any number of `[delread~ name]` / `[delread4~ name]`.

If the reader is sorted before the writer, the signal arrives one block late
(1.45 ms at the defaults). For a delay line that sets the shortest delay. Pd
gives a rule for the order: sorting follows the cords between subpatches. Put
the writer in one subpatch and the reader in another, and run a dummy signal
cord from the first to the second.

Source: Manual 2.5.5; `L:Documentation/5.reference/send-receive-tilde-help.pd`,
`throw~-catch~-help.pd`, `delay-tilde-objects-help.pd`;
`L:Documentation/3.audio.examples/G05.execution.order.pd`

### Multichannel signals

Since Pd 0.54 any signal cord can carry several channels. `[snake~ in n]`
bundles, `[snake~ out n]` splits. Objects with no memory (`[+~]`, `[*~]`,
`[cos~]`, `[clip~]`, the FFT objects, the table readers and writers) work on
every channel with no change of name. With unequal channel counts the shorter
input wraps. Filters and oscillators are not multichannel; the manual says to
wrap them in `[clone]`. `[adc~ -m 3 5]` gives a three-channel signal from
inputs 5–7. A multichannel cord looks the same as a mono one.

Source: Manual 2.5.6, 2.11.1; `L:Documentation/5.reference/snake-tilde-help.pd`,
`adc~_dac~-help.pd`, `binops-tilde-help.pd`

### Control to signal and back

- `[line~]` starts and ends ramps on block boundaries. `[vline~]` places
  breakpoints between samples and takes a third number, a start delay, so one
  message box can schedule a whole envelope: `1 10, 0 300 150`.
- A `[line]` driving a `[*~]` gives zipper noise at its 20 ms grain; use
  `[line~]`.
- `[snapshot~]` gives the last sample of the last block. `[bang~]` bangs once
  per block. `[samphold~]` samples when its control input **decreases**, so a
  `[phasor~]` triggers it on each wrap. `[threshold~]` is a Schmitt trigger
  with two levels and two debounce times, and outputs bangs.
- `[tabwrite~]` records into an array on a bang; `[tabsend~]` /
  `[tabreceive~]` copy one block to and from an array every block.

Source: `L:Documentation/5.reference/line~-help.pd`, `vline~-help.pd`,
`snapshot~-help.pd`, `bang~-help.pd`, `samphold~-help.pd`,
`threshold~-help.pd`, `tabwrite~-help.pd`, `tabsend-receive~-help.pd`;
`L:Documentation/3.audio.examples/C03.zipper.noise.pd`,
`C04.control.to.signal.pd`

### Analysis objects that ship with Pd

- `[sigmund~]`: pitch, envelope, and sinusoidal peaks or continuous tracks, as
  outlets chosen by arguments (`pitch env notes peaks tracks`). `-t` analyses
  an array instead of live sound.
- `[bonk~]`: attack detector over 11 bands; can learn templates and report
  which instrument was hit.
- `[slop~]`: a lowpass whose speed differs for rising, steady and falling
  input. The help builds a slew limiter, a peak meter and a
  compressor/limiter from it.
- `[bob~]`: a Moog ladder filter model with settable oversampling.
- `[rev1~]`, `[rev2~]`, `[rev3~]`, `[hilbert~]`, `[complex-mod~]` (frequency
  shifter), `[loop~]`.

Source: `L:Documentation/5.reference/sigmund~-help.pd`, `bonk~-help.pd`,
`bob~-help.pd` (part), `slop~-help.pd` (part);
`L:Documentation/8.topics/slop-tilde.htm` (part)

### `[pd~]`

Starts a second Pd as a subprocess, with its own patch, and passes audio and
messages back and forth. This is Pd's way onto another CPU core. The
subprocess answers through `[stdout]`. DSP must be running in the parent. A
Max version of `[pd~]` exists, which runs Pd inside Max.

Source: `L:Documentation/5.reference/pd~-help.pd`, `stdout-help.pd`;
Manual 2.11.2

---

## 10. Network and MIDI

`[netsend]` and `[netreceive]` do TCP (default) and UDP (`-u`), and a TCP
`[netreceive]` can answer the sender. By default they carry **FUDI**: Pd
messages as plain text ending in a semicolon, so `echo "freq 440;" | nc
localhost 3000` works. `-b` switches to raw bytes. IPv6 and multicast are
supported. Pd ships `pdsend` and `pdreceive` command-line programs.

OSC is done in two steps: `[oscformat]` turns a list into bytes, `[netsend -u
-b]` sends them; `[netreceive -u -b]` and `[oscparse]` on the way in. No
bundles with time tags, no TCP OSC. The help file itself says FUDI "is simpler
and better but less widely used".

MIDI objects match Max's names (`[notein]`, `[ctlin]`, `[bendin]`,
`[pgmin]`, `[touchin]`, `[polytouchin]`, `[midiin]`, `[sysexin]`,
`[midirealtimein]` and the `out` versions). MPE has no object; the help file
routes by channel into a `[clone]`.

Source: `L:Documentation/5.reference/netsend-receive-help.pd`,
`osc-format-parse-help.pd`, `fudi-format-parse-help.pd`, `midi-help.pd`;
`L:Documentation/8.topics/fudi.htm`

---

## 11. GUI objects

Three "atom" boxes: number, symbol, list. Then the IEM set, typed as objects:
`[bng]`, `[tgl]`, `[nbx]`, `[hsl]`, `[vsl]`, `[hradio]`, `[vradio]`, `[vu]`,
`[cnv]`. That is all vanilla has.

Every one has a **send name and a receive name** in its properties. With them
set, the object talks to `[send]` / `[receive]` and its inlet and outlet are
hidden. Every property can also be set by message (`size`, `color`, `label`,
`pos`, `delta`, `send`, `receive`) and can hold `$0` or `$1`. `[cnv]` is a
coloured rectangle with a label; it answers `get_pos` with its position.

Colours by message are hex symbols (`#ff0000`).

Source: `L:Documentation/5.reference/all_guis.pd`, `gui-boxes-help.pd`,
`bng-help.pd`, `cnv-help.pd`; Manual 2.11.1

---

## 12. Externals and search paths

An external is a compiled binary or an abstraction. A library is a folder of
them, or one binary holding many objects.

- **`[declare -path folder]`** in a patch adds a search folder for that patch
  only. **`[declare -lib name]`** loads a one-binary library. The manual calls
  `[declare]` the best practice, because the patch then says what it needs.
- **`[else/knob]`**: a folder name and a slash in front of the object name
  picks the library, for when two libraries share an object name.
- A library loaded later can replace a built-in object; the old one stays
  reachable as `name_aliased`.
- **deken** is the package manager, under Help → Find externals.
- Search order: already-loaded objects, `[declare]` paths, the patch's folder,
  the user's paths, then Pd's `extra` folder.

Source: Manual chapter 4; `L:Documentation/5.reference/declare-help.pd`

C externals: `L:Documentation/6.externs/0.README.txt` points to example
sources and a makefile (the `.c` files were not read).

---

## 13. pdlua: objects written in Lua

plugdata ships pdlua enabled. A file `foo.pd_lua` on the path becomes the
object `[foo]`. No wrapper box is typed.

```
local foo = pd.Class:new():register("foo")
function foo:initialize(sel, atoms)  self.inlets = 1  self.outlets = 1  return true  end
function foo:in_1_float(f)  self:outlet(1, "float", {f * 2})  end
```

- Methods are named by inlet and selector: `in_1_bang`, `in_2_stop`,
  `in_n_symbol`, or `in_1(sel, atoms)` for anything.
- `pd.Clock` for timing, `pd.Receive` for named receivers, `pd.send`,
  `pd.Table` for arrays, `pd.post`, `self:error`.
- **Signals**: set `self.inlets = {SIGNAL, DATA}`; write `dsp(samplerate,
  blocksize, nchannels)` and `perform(in1, ...)`, which gets a Lua table of
  samples per signal inlet and returns one per signal outlet.
  `signal_setmultiout` makes an outlet multichannel.
- **Graphics**: defining `paint(g)` makes the object a GUI. `g` has
  `set_color`, `fill_rect`, `stroke_ellipse`, `draw_line`, `draw_text`,
  `fill_all`, paths (`Path`, `line_to`, `cubic_to`, `stroke_path`,
  `fill_path`), `translate`, `scale`, and `draw_svg` (used in the shipped
  `hello-gui` example). `paint_layer_2(g)` and up are separate layers;
  `repaint(n)` redraws one. Mouse callbacks: `mouse_down`, `mouse_up`,
  `mouse_move`, `mouse_drag`. `set_size` sets the box size.
- **State**: `set_args` writes the object's creation arguments, so they are
  saved with the patch; `get_args` reads them.
- **Live reload**: the message `; pdluax reload` reloads every Lua object's
  code in every open patch and keeps each object's state; `reload foo` does one
  class. `prereload` and `postreload` methods run around it. With `[netreceive]`
  wired to that receiver, a text editor can trigger the reload on save.
  Reloading DSP code clicks; the tutorial shows a crossfade between two objects
  as the workaround.
- `[pdlua]` runs a plain `.lua` file on `load file`. `[pdluax name]` loads a
  `.pd_luax` file afresh for each new box (the older live-coding way).

Source: `L:Documentation/13.pdlua/pdlua-help.pd`, `pdluax-help.pd`,
`pdlua/hello-gui.pd_lua`, `pdlua/examples/sig-example/lua_sig.pd_lua`,
`pdlua/examples/multichannel/test~.pd_lua`;
`https://agraef.github.io/pd-lua/tutorial/pd-lua-intro.html` (sections
"Signals and graphics" to the end); `L:Extra/pdlua/README` (part)

---

## 14. heavylib and the Heavy compiler

### What Heavy is

hvcc ("Heavy") reads a `.pd` patch and writes C/C++ that behaves like it. It
uses no Pd code. plugdata bundles it: the Compile… window exports

- **C++ Code**,
- **Electro-Smith Daisy** (source, binary, or flash to the board; boards pod,
  petal, patch, patch_init, field, or a custom board file),
- **DPF Audio Plugin** (VST2, VST3, LV2, CLAP, JACK; effect or instrument),
- **Pd External**.

hvcc itself has more generators: Unity, Wwise, FMOD, JavaScript (Web Audio),
OWL. The export path must not contain spaces.

Source: book:CompilingPatches.html; hvcc: index, getting-started/,
generators/, generators/daisy/, generators/dpf/, generators/pdext/

### Compiled Mode

A toggle in plugdata's main menu. While on, objects Heavy cannot compile are
outlined and reported in the console, and autocomplete offers only objects it
can.

Source: book:CompilingPatches.html

### What compiles

About 100 control objects and 65 signal objects from vanilla, plus a few from
cyclone and ELSE. **Not** supported, among others: `clone`, `array`, `text`,
`file`, `list fromsymbol`, every data-structure object, `netsend`,
`netreceive`, `oscformat`, `soundfiler`, `readsf~`, `value`, `fexpr~`, the FFT
objects, `sigmund~`, `bonk~`, `switch~`, `vline~`, `slop~`, `tabsend~`,
`tabreceive~`. `block~` is accepted and ignored. No multichannel cords.

Behaviour differs in places, and the docs list them: `[osc~]`'s left inlet
needs a signal, so `[sig~]` first; arithmetic objects do not answer a bang on
the left inlet; `[select]` / `[route]` right inlets do nothing; `[snapshot~]`
answers on the next audio cycle; `[delay]` / `[metro]` take no tempo units.
The advice is to keep as much as possible in the signal domain.

Source: hvcc: reference/objects/supported/, reference/objects/unsupported/,
getting-started/patching/

### Parameters by annotation

A receive object is made a plugin parameter by writing after its name:
`[r gain @hv_param 0 1 0.5]` is "gain", from 0 to 1, default 0.5. A fourth word
gives a type (`bool`, `int`, `trig`, `dB`, `Hz`, `log`). `[s name @hv_param]`
is an output parameter. `[r name @hv_event]` is a button. `[table name 100
@hv_table]` exposes a table. `[r __hv_dpf_bpm]` gives host tempo in a DPF
plugin. Extra settings go in a `metadata.json`.

Source: hvcc: getting-started/patching/, generators/dpf/;
`L:Documentation/11.heavylib/hv.filter~-help.pd`

### heavylib

A library of abstractions built only from objects Heavy compiles, so they
survive export: `[hv.osc~ saw|sine|square]` (band-limited), `[hv.lfo ...]`,
`[hv.filter~ lowpass|highpass|bandpass1|bandpass2|notch|allpass]`,
`[hv.filter.gain~ peak|lowshelf|highshelf]`, `[hv.lop~]`, `[hv.hip~]`,
`[hv.compressor~]`, `[hv.reverb~]`, `[hv.flanger~]`, `[hv.comb~]`,
`[hv.freqshift~]`, `[hv.pinknoise~]`, `[hv.vline~]`, signal comparisons
(`[hv.gt~]`, `[hv.eq~]` …), `[hv.multiplex~]`, `[hv.tanh~]`, `[hv.drunk]`,
`[hv.dispatch]`. They exist partly to stand in for vanilla objects Heavy
lacks.

Source: `L:Abstractions/heavylib/README.md`; all of
`L:Documentation/11.heavylib/`

---

## 15. plugdata as a plugin

### What it is

plugdata is Pd with a new interface, built on Pd's own source "with minimal
modifications". It reads and writes ordinary `.pd` files. It runs as a
standalone app and as a plugin: VST3, AU, CLAP, LV2. Three plugin flavours are
named in the DAW setup pages: **plugdata** (instrument), **plugdata-fx**
(effect) and **plugdata-midi** (Logic MIDI FX). The whole patch editor is in
the plugin window, so a patch is built and changed inside the DAW session.
There is also an iOS app.

`[adc~]` and `[dac~]` are the plugin's audio in and out. MIDI objects receive
the track's MIDI. Sending MIDI out needs per-DAW routing, which the book walks
through for Live, Bitwig, Reaper, Ardour, FL Studio, Studio One and Logic.

**Limit:** externals other than the built-in ELSE, cyclone, Gem, heavylib and
pdlua can be used in the standalone only, not in the plugin. The README
describes compiling your own into plugdata as the way round it.

Source: `https://plugdata.org/`; book: index, DAWIntegration, FAQ;
`https://raw.githubusercontent.com/plugdata-team/plugdata/develop/README.md`

### The four DAW objects

All four are abstractions built on reserved send/receive names.

- **`[param name]`**: one automation parameter. The parameter is created in
  plugdata's sidebar, or by a `create default min max` message. `range lo hi`
  and `mode n` (1 float, 2 integer, 3 logarithmic, 4 exponential) shape it. A
  float in sets the DAW's value; the outlet gives the DAW's value. `[param
  name 1]` also tells the DAW when a GUI object is being touched, so automation
  write works. GUI objects can bind straight to it by the names
  `name-gui-s` / `name-gui-r`.
- **`[playhead]`**: outlets for playing, recording, loop start/end, edit time,
  frame rate, bpm, last bar, time signature, and position (ppq, samples,
  seconds). Plugin only.
- **`[daw_storage tag]`**: saves a float, symbol or list in the DAW session
  under a tag and gives it back on load. The help shows an array (via `[array
  get]` / `[array set]`) and a `[text]` (via `[text tolist]` /
  `[text fromlist]`) being stored this way.
- **`[plugin_latency]`**: a number in reports the plugin's latency to the DAW.
  Its help file is empty.

Source: `L:Abstractions/param.pd`, `playhead.pd`, `daw_storage.pd`,
`plugin_latency.pd`; `L:Documentation/5.reference/param-help.pd`,
`playhead-help.pd`, `daw_storage-help.pd`, `plugin_latency-help.pd`;
`https://raw.githubusercontent.com/wiki/plugdata-team/plugdata/Basic-operation.md`

### Editor, themes, presets, packages: thinly documented

The web pages say little about the editor. The home page names "built-in
documentation and tooltips", "theming options", "clear visual feedback" and a
"safety limiter" to protect hearing, without detail. The object reference at
`reference.html` lists 1,653 objects (ELSE 573, Gem 529, vanilla 294, cyclone
223, heavylib 29, plugdata 3, pdlua 2). `L:Extra/Presets/` holds six ready
patches (AlmondOrgan, Bulgroz, Castafiore, LIRA-8, MiniMock, Pong); they were
listed, not read. The two wiki pages about the interface hold a screenshot
each and no text. Pd's own package manager, deken, is described in Manual
4.3.2; whether and how plugdata exposes it was not found in what was read.

Source: `https://plugdata.org/`; `https://plugdata.org/assets/reference-data.json`
(names and descriptions only); wiki GUI-overview, UI-Overview

### Pd's own editing aids

Worth knowing because Max has no match for some: **Triggerize** (Ctrl+T) on an
object with a fanned-out outlet inserts a `[t a a]` with the cords in their
existing order; on a cord it inserts a pass-through object. **Ctrl+K**
connects, disconnects, inserts or bypasses selected boxes. **Paste Replace**
swaps a group of boxes for the copied one and keeps the cords. Shift while
dragging a cord fans out to every selected box.

Source: Manual 2.3

---

## 16. What Pd's own manual says about Max

Manual 2.11.1 lists differences from Pd's side. Checked against Max 9 here:

| The manual says | Max 9 on this machine |
|---|---|
| Max sends a fanned-out outlet right to left; Pd in cord-creation order | Matches `patching/MAX_PATCHING.md` in this repo |
| In Max you set the name on `receive`; in Pd on `send` | `receive` has a `set` message; `send` has none; `forward` has `send` |
| Max needs `mc.` versions for multichannel; Pd's objects just accept it | `mc.pack~`, `mc.unpack~`, `mc.poly~` and the rest are in the registry |
| Pd has no `pfft~` | `pfft~`, `fftin~`, `fftout~` exist in Max |
| "you can't draw in `buffer~` with the mouse" | **Out of date.** `waveform~`'s refpage describes a draw mode with a pencil tool that changes the `buffer~` samples |
| Max abstractions open read-only | not checked |
| `#0` only works inside abstractions in Max | The Max userguide's abstractions page describes `#0` as unique per abstraction instance |
| Max has `pv` for per-patcher values; Pd needs different names | `pv` is in the registry; its refpage says it is shared within one patcher and its subpatches |
| Pd has no `preset` / `pattrstorage`, on purpose | Both exist in Max |
| Max is multi-core; Pd uses `[pd~]` | `poly~` has `parallel` and `threadcount` |

Pd can still open and save the pre-Max-5 `.pat` and `.mxt` text formats. It
cannot read `.maxpat`.

Source: Manual 2.11.1; Max refpages `receive`, `send`, `forward`, `waveform~`,
`pv`, `poly~`; Max userguide `abstractions`
