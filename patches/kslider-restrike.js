// kslider-restrike.js — remembers which notes a polyphonic kslider is holding,
// and on "restrike" flushes the keyboard and plays the same notes again.
//
// inlet 0  : "<pitch> <velocity>" lists from the kslider (via [join 2]).
//            velocity > 0 stores the pitch; velocity 0 (note-off) removes it.
//            "restrike" — flush the kslider, then re-send every stored pitch.
//            "clear"    — forget every stored note without touching the kslider.
// outlet 0 : to the kslider LEFT inlet — "flush", then each pitch as an int
// outlet 1 : to the kslider RIGHT inlet — the velocity to use for the next pitch
// outlet 2 : the currently stored pitches as a list (for the readout)
//
// Order matters inside restrike(): kslider wants its velocity on the right inlet
// BEFORE the pitch arrives on the left inlet, so outlet 1 fires before outlet 0.

inlets = 1;
outlets = 3;
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
    // come straight back into list() and empty HELD before we get to replay.
    var SNAPSHOT = Array.from(HELD.entries());
    outlet(0, "flush");
    SNAPSHOT.forEach(function (entry) {
        var pitch = entry[0], velocity = entry[1];
        outlet(1, velocity);   // right inlet: velocity for the next pitch
        outlet(0, pitch);      // left inlet: pitch → kslider lights it and outputs
    });
    report();
}

function clear() {
    HELD.clear();
    report();
}

function report() {
    var PITCHES = Array.from(HELD.keys()).sort(function (a, b) { return a - b; });
    if (PITCHES.length === 0) {
        outlet(2, "(none)");
    } else {
        outlet(2, PITCHES);
    }
}
