/*
 * pose_monitor.js — v8 monitor for the MMPose → OSC bridge.
 *
 * Receives the routed OSC stream from `[udpreceive 7400] → [route ...]` and
 * renders a live view of bodies + inter-body contact into two jit.cellblock
 * grids, plus count/indicator outputs. This is the SCAFFOLD's display layer —
 * extend it (skeleton drawing, contact-driven audio, etc.) downstream of the
 * passthrough outlet.
 *
 * The `route` object strips the OSC address, so each message type arrives on
 * its own inlet (the address is gone). We dispatch on the `inlet` global.
 *
 * Inlets (wire from route outlets, in this order):
 *   0  /pose/count    int n            — frame delimiter; also accepts `bang` (loadbang init)
 *   1  /pose/body     id cx cy bx by bw bh
 *   2  /pose/kp       id x0 y0 s0 ... (51 floats)
 *   3  /pose/contact  idA idB centroidDist minKpDist touch
 *   4  /pose/dims     w h
 *
 * Outlets:
 *   0  bodies cellblock messages  (set/clear/rows/cols)
 *   1  contacts cellblock messages
 *   2  body count (int)
 *   3  contact count (int)
 *   4  touch flag (int 0/1) — 1 when any pair is touching this frame
 *   5  keypoint passthrough — "kp <id> x0 y0 s0 ..." for downstream visualisation
 */

inlets = 5;
outlets = 6;

// Outlet indices.
var OUT_BODIES   = 0;
var OUT_CONTACTS = 1;
var OUT_COUNT    = 2;
var OUT_NCONTACT = 3;
var OUT_TOUCH    = 4;
var OUT_KP       = 5;

// Column headers.
var BODY_COLS    = ["id", "cx", "cy", "w", "h"];
var CONTACT_COLS = ["A", "B", "cDist", "minKP", "touch"];

// Per-frame state.
var BODY_ROW     = 1;   // next bodies row to fill (row 0 = header)
var CONTACT_ROW  = 1;   // next contacts row to fill
var N_CONTACTS   = 0;   // contacts seen this frame
var ANY_TOUCH    = 0;   // 1 if any pair touching this frame
var FRAME_W      = 0;   // source dims (informational)
var FRAME_H      = 0;

function r2(v) { return Math.round(v * 100) / 100; }  // round to 2 decimals for display

// jit.cellblock `set` is COLUMN-FIRST: set <col> <row> <value>.
function cell(outletIdx, col, row, value) {
    outlet(outletIdx, "set", col, row, value);
}

function header(outletIdx, cols) {
    outlet(outletIdx, "cols", cols.length);
    for (var c = 0; c < cols.length; c++) {
        cell(outletIdx, c, 0, cols[c]);
    }
}

// loadbang sends `bang` to inlet 0: lay down headers and zero the readouts.
function bang() {
    if (inlet !== 0) { return; }
    outlet(OUT_BODIES, "clear");
    outlet(OUT_BODIES, "rows", 1);
    header(OUT_BODIES, BODY_COLS);
    outlet(OUT_CONTACTS, "clear");
    outlet(OUT_CONTACTS, "rows", 1);
    header(OUT_CONTACTS, CONTACT_COLS);
    outlet(OUT_COUNT, 0);
    outlet(OUT_NCONTACT, 0);
    outlet(OUT_TOUCH, 0);
}

// `/pose/count` arrives as a bare int on inlet 0 — begins a new frame.
function msg_int(n) {
    if (inlet !== 0) { return; }
    startFrame(n);
}
function msg_float(f) {
    if (inlet === 0) { startFrame(Math.round(f)); }
}

function startFrame(n) {
    // Size the bodies grid to n rows (+ header) and re-lay the header.
    outlet(OUT_BODIES, "rows", n + 1);
    header(OUT_BODIES, BODY_COLS);
    BODY_ROW = 1;

    // Contacts grow as pairs arrive; reset to just the header for now.
    outlet(OUT_CONTACTS, "clear");
    outlet(OUT_CONTACTS, "rows", 1);
    header(OUT_CONTACTS, CONTACT_COLS);
    CONTACT_ROW = 1;
    N_CONTACTS  = 0;
    ANY_TOUCH   = 0;

    outlet(OUT_COUNT, n);
    outlet(OUT_NCONTACT, 0);
    outlet(OUT_TOUCH, 0);
}

// Dispatch list messages by inlet.
function list() {
    var a = arrayfromargs(arguments);
    if (inlet === 1)      { onBody(a); }
    else if (inlet === 2) { onKeypoints(a); }
    else if (inlet === 3) { onContact(a); }
    else if (inlet === 4) { onDims(a); }
}

// /pose/body  id cx cy bx by bw bh
function onBody(a) {
    var id = a[0];
    var cx = a[1], cy = a[2], bw = a[5], bh = a[6];
    var row = BODY_ROW++;
    cell(OUT_BODIES, 0, row, id);
    cell(OUT_BODIES, 1, row, r2(cx));
    cell(OUT_BODIES, 2, row, r2(cy));
    cell(OUT_BODIES, 3, row, r2(bw));
    cell(OUT_BODIES, 4, row, r2(bh));
}

// /pose/kp  id x0 y0 s0 ... — pass straight through for downstream use.
function onKeypoints(a) {
    outlet.apply(this, [OUT_KP, "kp"].concat(a));
}

// /pose/contact  idA idB centroidDist minKpDist touch
function onContact(a) {
    var idA = a[0], idB = a[1], cDist = a[2], minKp = a[3], touch = a[4];
    var row = CONTACT_ROW++;
    outlet(OUT_CONTACTS, "rows", row + 1);
    header(OUT_CONTACTS, CONTACT_COLS);
    cell(OUT_CONTACTS, 0, row, idA);
    cell(OUT_CONTACTS, 1, row, idB);
    cell(OUT_CONTACTS, 2, row, r2(cDist));
    cell(OUT_CONTACTS, 3, row, r2(minKp));
    cell(OUT_CONTACTS, 4, row, touch);

    N_CONTACTS++;
    if (touch >= 1) { ANY_TOUCH = 1; }
    outlet(OUT_NCONTACT, N_CONTACTS);
    outlet(OUT_TOUCH, ANY_TOUCH);
}

// /pose/dims  w h
function onDims(a) {
    FRAME_W = a[0];
    FRAME_H = a[1];
}
