// reverb-shootout-highlight.js — turns the [live.tab] index into the slot
// number, lights the selected pane's title, dims every other title.
//
// inlet 0  : int — the live.tab item index (row-major, 0-based).
// outlet 0 : int — the slot number (1 = DRY, 2..12 = the panes) → [s SEL].
//
// The numbers must read DOWN each column, then across (MAX_PATCHING.md >
// Number UI controls down each column). A tab fills row by row, so for a
// grid with more than one column the items are stored transposed and this
// script maps the index back:
//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1
// With one column (the current layout) the stored order is the shown order
// and the mapping is index + 1. ROWS / COLS must match what Max draws.
// Each pane's title comment carries the scripting name TITLE_<slot>, two
// digits (TITLE_02 … TITLE_12); patcher.getnamed() reaches them and their
// colors are set by sending the attribute name as a message.

inlets = 1;
outlets = 1;
autowatch = 1;

setinletassist(0, "int: live.tab item index (row-major) — lights TITLE_<slot>");
setoutletassist(0, "int: slot number (1 = DRY, 2..12 = panes) → s SEL");

var ROWS = 12, COLS = 1;  // must match the grid Max DRAWS (live.tab @num_lines_presentation, item count); 1 column = identity
var FIRST_SLOT = 2;       // slot 1 is DRY and has no pane
var LAST_SLOT  = 12;

// amber on dark is the panel palette; the selected title inverts it
var ON_BG  = [1.0,  0.55, 0.0,  1.0];
var ON_TX  = [0.05, 0.05, 0.05, 1.0];
var OFF_BG = [0.13, 0.13, 0.15, 1.0];
var OFF_TX = [1.0,  0.55, 0.0,  1.0];

function pad2(n) { return (n < 10 ? "0" : "") + n; }

function paint(obj, bg, tx) {
    obj.message("bgcolor",   bg[0], bg[1], bg[2], bg[3]);
    obj.message("textcolor", tx[0], tx[1], tx[2], tx[3]);
}

function msg_int(index) {
    var row = Math.floor(index / COLS), col = index % COLS;
    var slot = col * ROWS + row + 1;
    for (var n = FIRST_SLOT; n <= LAST_SLOT; n++) {
        var obj = this.patcher.getnamed("TITLE_" + pad2(n));
        if (!obj) {
            post("reverb-shootout-highlight: no comment named TITLE_" + pad2(n) + "\n");
            continue;
        }
        if (n === slot) paint(obj, ON_BG, ON_TX);
        else            paint(obj, OFF_BG, OFF_TX);
    }
    outlet(0, slot);
}
