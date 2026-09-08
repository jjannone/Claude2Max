// kslider-restrike.js — remembers which notes a polyphonic kslider is holding,
// and on "restrike" flushes the keyboard and plays the same notes again.
//
// inlet 0  : "<pitch> <velocity>" lists from the kslider (via [join 2]).
//            velocity > 0 stores the pitch; velocity 0 (note-off) removes it.
//            "restrike" — send "flush" to the kslider, then one "chord" message
//                         carrying every stored pitch/velocity pair.
//            "clear"    — forget every stored note without touching the kslider.
// outlet 0 : to the kslider LEFT inlet — exactly two messages per restrike,
//            in this order: "flush", then "chord p1 v1 p2 v2 ...".
//            Nothing else is ever sent here.
// outlet 1 : the currently stored pitches as a list (for the readout),
//            or the symbol "(none)" when nothing is stored.
//
// kslider's "chord" message (polyphonic mode) displays AND outputs the notes,
// so the restruck notes flow back through [join 2] into this object and are
// stored again, and on to midiformat → vst~ where they sound.

inlets = 1;
outlets = 2;
autowatch = 1;

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
