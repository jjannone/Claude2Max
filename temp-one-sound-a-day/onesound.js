// onesound.js — v8 clock/timer logic for one-sound-a-day
//
// Inlets:
//   0 — bang (from metro 1000): tick the clock
//
// Outlets:
//   0 — "HH:MM:SS" current time string  → time display
//   1 — "M/D/YYYY" current date string  → date display
//   2 — "HH:MM:SS" target time string   → target display
//   3 — bang on new calendar day
//   4 — bang when target time is reached
//   5 — int (1 = active, 0 = not) for blink toggle

inlets = 1;
outlets = 6;

var targetSeconds = -1;
var lastDay = -1;
var active = false;
var mode = 0; // 0 = keep same target each day, 1 = random new target each day

function bang() {
    var now = new Date();
    var h = now.getHours();
    var m = now.getMinutes();
    var s = now.getSeconds();
    var day = now.getDate();
    var nowSec = h * 3600 + m * 60 + s;

    // Detect day rollover
    if (lastDay !== -1 && day !== lastDay) {
        outlet(3, "bang");
        if (mode === 1) {
            generateRandom(nowSec);
        }
        // In mode 0, keep targetSeconds as-is but re-arm active
        if (targetSeconds >= 0) {
            active = true;
        }
    }
    lastDay = day;

    outlet(0, pad(h) + ":" + pad(m) + ":" + pad(s));
    outlet(1, (now.getMonth() + 1) + "/" + day + "/" + now.getFullYear());

    if (active && targetSeconds >= 0 && nowSec >= targetSeconds) {
        active = false;
        outlet(5, 0);
        outlet(4, "bang");
    } else {
        outlet(5, active ? 1 : 0);
    }
}

// Called by "random" message — pick a new random target time later today
function random() {
    var now = new Date();
    var nowSec = now.getHours() * 3600 + now.getMinutes() * 60 + now.getSeconds();
    generateRandom(nowSec);
}

// Called by "parsetarget HH:MM:SS" — set explicit target time
function parsetarget(str) {
    var parts = str.split(":");
    if (parts.length !== 3) {
        post("parsetarget: expected HH:MM:SS, got: " + str + "\n");
        return;
    }
    var h = parseInt(parts[0], 10);
    var m = parseInt(parts[1], 10);
    var sv = parseInt(parts[2], 10);
    if (isNaN(h) || isNaN(m) || isNaN(sv)) {
        post("parsetarget: non-numeric component in: " + str + "\n");
        return;
    }
    var now = new Date();
    var nowSec = now.getHours() * 3600 + now.getMinutes() * 60 + now.getSeconds();
    var ts = h * 3600 + m * 60 + sv;
    if (ts <= nowSec) {
        post("parsetarget: target time is in the past — ignored\n");
        return;
    }
    targetSeconds = ts;
    active = true;
    outlet(2, pad(h) + ":" + pad(m) + ":" + pad(sv));
    outlet(5, 1);
}

// Called by "setmode N" — 0 = keep same target, 1 = random new target each day
function setmode(val) {
    mode = val;
}

function generateRandom(nowSec) {
    var h, m, s, ts, attempts = 0;
    do {
        h = Math.floor(Math.random() * 24);
        m = Math.floor(Math.random() * 60);
        s = Math.floor(Math.random() * 60);
        ts = h * 3600 + m * 60 + s;
        attempts++;
    } while (ts <= nowSec && attempts < 1000);

    if (attempts >= 1000) {
        post("generateRandom: couldn't find future time — using midnight\n");
        h = 23; m = 59; s = 59;
        ts = h * 3600 + m * 60 + s;
    }

    targetSeconds = ts;
    active = true;
    outlet(2, pad(h) + ":" + pad(m) + ":" + pad(s));
    outlet(5, 1);
}

function pad(n) {
    return (n < 10 ? "0" : "") + n;
}
