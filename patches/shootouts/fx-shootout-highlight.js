// fx-shootout-highlight.js — turns the [live.tab] index into the slot
// number, lights the selected pane's title, dims every other title.
// Shared by every *-shootout patch. It needs no arguments: it finds the
// panes itself by probing for comments named TITLE_02, TITLE_03, … until
// one is missing. Optional box arguments override that:
//
//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]
//
// inlet 0  : int — the live.tab item index (row-major, 0-based).
// outlet 0 : int — the slot number (1 = DRY, 2..lastslot = the panes) → [s SEL].
//
// The numbers must read DOWN each column, then across (MAX_PATCHING.md >
// Number UI controls down each column). A tab fills row by row, so for a
// grid with more than one column the items are stored transposed and this
// script maps the index back:
//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1
// With one column (the default) the stored order is the shown order and the
// mapping is index + 1. ROWS / COLS must match what Max draws.
// Each pane's title comment carries the scripting name TITLE_<slot>, two
// digits (TITLE_02 … TITLE_nn); patcher.getnamed() reaches them and their
// colors are set by sending the attribute name as a message.

inlets = 1;
outlets = 1;
autowatch = 1;

setinletassist(0, "int: live.tab item index (row-major) — lights TITLE_<slot>");
setoutletassist(0, "int: slot number (1 = DRY, 2..lastslot = panes) → s SEL");

var FIRST_SLOT = 2;          // slot 1 is DRY and has no pane
var ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead
if (typeof jsarguments !== "undefined" && jsarguments.length > 1) {
    ARG_LAST = parseInt(jsarguments[1], 10) || 0;
    if (jsarguments.length > 3) {
        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;
        ARG_COLS = parseInt(jsarguments[3], 10) || 0;
    }
}

// amber on dark is the panel palette; the selected title inverts it
var ON_BG  = [1.0,  0.55, 0.0,  1.0];
var ON_TX  = [0.05, 0.05, 0.05, 1.0];
var OFF_BG = [0.13, 0.13, 0.15, 1.0];
var OFF_TX = [1.0,  0.55, 0.0,  1.0];

var reported = false;

function pad2(n) { return (n < 10 ? "0" : "") + n; }

function title(n) { return this.patcher.getnamed("TITLE_" + pad2(n)); }

function lastSlot() {
    if (ARG_LAST) return ARG_LAST;
    var n = FIRST_SLOT;
    while (title(n)) n++;
    return n - 1;
}

function paint(obj, bg, tx) {
    obj.message("bgcolor",   bg[0], bg[1], bg[2], bg[3]);
    obj.message("textcolor", tx[0], tx[1], tx[2], tx[3]);
}

function msg_int(index) {
    var last = lastSlot();
    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;
    var row = Math.floor(index / cols), col = index % cols;
    var slot = col * rows + row + 1;
    if (!reported) {
        post("fx-shootout-highlight: " + (last - FIRST_SLOT + 1) + " panes (TITLE_02 … TITLE_" + pad2(last) + "), "
             + rows + " rows × " + cols + " cols\n");
        reported = true;
    }
    for (var n = FIRST_SLOT; n <= last; n++) {
        var obj = title(n);
        if (!obj) {
            post("fx-shootout-highlight: no comment named TITLE_" + pad2(n) + "\n");
            continue;
        }
        if (n === slot) paint(obj, ON_BG, ON_TX);
        else            paint(obj, OFF_BG, OFF_TX);
    }
    outlet(0, slot);
}
