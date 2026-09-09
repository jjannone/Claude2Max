// kslider-restrike.js — remembers which notes a polyphonic kslider is holding,
// and on "restrike" flushes the keyboard and plays the same notes again.
//
// inlet 0  : "<pitch> <velocity>" lists.
//            velocity > 0 stores the pitch; velocity 0 (note-off) removes it.
//            "restrike" — emit "flush", then one "chord" message carrying
//                         every stored pitch/velocity pair.
//            "clear"    — forget every stored note without emitting anything.
// outlet 0 : messages for a kslider — exactly two per restrike, in this
//            order: "flush", then "chord p1 v1 p2 v2 ...". Nothing else is
//            ever sent here.
// outlet 1 : the currently stored pitches as a list, or the symbol "(none)"
//            when nothing is stored.
//
// kslider's "chord" message (polyphonic mode) displays AND outputs the notes,
// so a kslider driven by outlet 0 emits the restruck notes again; if those
// come back to inlet 0 they are simply stored again.

inlets = 1;
outlets = 2;
autowatch = 1;

// Hover text for each inlet and outlet in Max. Describes what the port accepts or
// emits — never the objects it happens to be wired to in a particular patch.
setinletassist(0, "pitch velocity (list): velocity > 0 stores, 0 forgets; restrike; clear");
setoutletassist(0, "kslider messages: flush, then chord p1 v1 p2 v2 ...");
setoutletassist(1, "stored pitches (list), or (none)");

var HELD = new Map();          // pitch -> velocity of the note-on that lit it

function list(pitch, velocity) {
    if (velocity > 0) {
        HELD.set(pitch, velocity);
    } else {
        HELD.delete(pitch);
    }
    report();
}

function restrike() {
    // Snapshot first: the flush below makes the kslider emit note-offs, which
    // come straight back into list() and empty HELD before the chord goes out.
    var PAIRS = [];
    HELD.forEach(function (velocity, pitch) {
        if (velocity > 0) { PAIRS.push(pitch, velocity); }
    });
    outlet(0, "flush");
    if (PAIRS.length > 0) {
        outlet(0, "chord", ...PAIRS);
    }
    report();
}

function clear() {
    HELD.clear();
    report();
}

function report() {
    var PITCHES = Array.from(HELD.keys()).sort(function (a, b) { return a - b; });
    if (PITCHES.length === 0) {
        outlet(1, "(none)");
    } else {
        outlet(1, ...PITCHES);
    }
}
