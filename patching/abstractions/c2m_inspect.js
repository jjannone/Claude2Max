// c2m_inspect.js — Claude2Max data structure inspector.
//
// Receives messages (typically from `[udpreceive]` decoded OSC):
//   ping                              -> write tmpdir/c2m_inspect_pong.json
//   dump <tag> <kind> <name>          -> write tmpdir/c2m_inspect_<tag>.json
//                                        with contents of <name> as <kind>
//   scan                              -> write tmpdir/c2m_inspect_scan.json
//                                        with a list of supported kinds + the
//                                        current attribute caps (no patcher walk
//                                        in v1)
//
// Supported kinds (v1):
//   dict          — synchronous via Dict.stringify()
//   buffer~       — synchronous via Buffer.peek()
//   jit.matrix    — synchronous via JitterMatrix.getcell() (capped)
//
// Not supported in v1: coll, table, multislider, pattr, jit.cellblock.
//   These need either a v8 wrapper class (which Max doesn't provide) or
//   user-side wiring (e.g. `[receive <NAME>_INSPECT] → [coll <NAME>]`).
//   `messnamed` does not route to coll/table boxes — it only delivers to
//   `[receive]` objects bound to global symbols. Until a wired-mode is
//   built into the abstraction, the inspector returns an explanatory
//   error for these kinds.
//
// Attributes (set on the v8 box with @attr value, or as messages):
//   @cellcap <int>        max cells dumped per jit.matrix (default 10000, 0 = unlimited)
//   @samplecap <int>      max samples dumped per buffer~ channel (default 4096, 0 = unlimited)
//   @tmpdir <symbol>      directory for dump files (default /tmp)
//   @asyncdelay <int>     ms to wait for messnamed-write to finish (default 200)

inlets  = 1;
outlets = 1;

autowatch = 1;

// --- parameters (also exposed as attributes via declareattribute) -----------

var cellcap     = 10000;
var samplecap   = 4096;
var tmpdir      = "/tmp";
var asyncdelay  = 200;

declareattribute("cellcap",    null, "setcellcap");
declareattribute("samplecap",  null, "setsamplecap");
declareattribute("tmpdir",     null, "settmpdir");
declareattribute("asyncdelay", null, "setasyncdelay");

function setcellcap(v)    { cellcap    = +v; }
function setsamplecap(v)  { samplecap  = +v; }
function settmpdir(v)     { tmpdir     = String(v); }
function setasyncdelay(v) { asyncdelay = +v; }

// --- file I/O helper --------------------------------------------------------

function writejson(path, obj) {
    var json = JSON.stringify(obj, null, 2);
    var f = new File(path, "write");
    if (!f.isopen) {
        post("c2m.inspect: cannot open for write: " + path + "\n");
        outlet(0, "error", "open_failed", path);
        return false;
    }
    f.writestring(json);
    f.close();
    return true;
}

function readfile(path) {
    var f = new File(path, "read");
    if (!f.isopen) return null;
    var buf = "";
    var line;
    while ((line = f.readline(8192)) !== null && line !== "") {
        buf += line + "\n";
    }
    f.close();
    return buf;
}

// --- message entry points ---------------------------------------------------

function bang() { ping(); }

function ping() {
    var path = tmpdir + "/c2m_inspect_pong.json";
    writejson(path, {
        ok:        true,
        ts:        Date.now(),
        cellcap:   cellcap,
        samplecap: samplecap,
        tmpdir:    tmpdir,
        asyncdelay_ms: asyncdelay
    });
    outlet(0, "pong", path);
}

function scan() {
    var path = tmpdir + "/c2m_inspect_scan.json";
    writejson(path, {
        ok:    true,
        ts:    Date.now(),
        kinds_supported:   ["dict", "buffer~", "jit.matrix"],
        kinds_unsupported: ["coll", "table"],
        caps:  { cellcap: cellcap, samplecap: samplecap },
        note:  "v1 takes <name> via OSC arg; no patcher walk yet. " +
               "coll/table need v2 wired-mode."
    });
    outlet(0, "scan", path);
}

function dump(tag, kind, name) {
    if (tag === undefined || kind === undefined || name === undefined) {
        outlet(0, "error", "dump_requires_tag_kind_name");
        return;
    }
    var outpath = tmpdir + "/c2m_inspect_" + tag + ".json";
    var result;
    try {
        switch (String(kind)) {
            case "dict":       result = dumpDict(name);   break;
            case "buffer~":    result = dumpBuffer(name); break;
            case "jit.matrix": result = dumpMatrix(name); break;
            case "coll":
            case "table":
                result = {
                    error: kind + " is not supported in v1",
                    reason: "v8's messnamed() only routes to [receive] objects, " +
                            "not to coll/table boxes; v8 has no direct API wrapper " +
                            "for these types. Workaround: use a dict for the same data, " +
                            "or wait for v2 wired-mode (a [receive <NAME>_INSPECT] box).",
                    supported_now: ["dict", "buffer~", "jit.matrix"]
                };
                break;
            default:
                result = { error: "unsupported kind: " + kind,
                           supported_now: ["dict", "buffer~", "jit.matrix"] };
        }
    } catch (e) {
        result = { error: String(e) };
    }
    finalize(outpath, tag, kind, name, result);
}

function finalize(outpath, tag, kind, name, result) {
    result.tag  = String(tag);
    result.kind = String(kind);
    result.name = String(name);
    result.ts   = Date.now();
    if (writejson(outpath, result)) {
        outlet(0, "dumped", String(tag), outpath);
    }
}

// --- sync dumpers -----------------------------------------------------------

function dumpDict(name) {
    var d = new Dict(name);
    var s = d.stringify();
    var parsed;
    try { parsed = JSON.parse(s); }
    catch (e) { return { error: "dict stringify did not return JSON: " + e, raw: s }; }
    return { contents: parsed };
}

function dumpBuffer(bufname) {
    var b = new Buffer(bufname);
    var frames   = b.framecount();
    var channels = b.channelcount();
    var lenMs    = b.length();
    if (frames === 0 && channels === 0) {
        return { error: "buffer~ " + bufname + " not found or empty" };
    }
    var cap = samplecap > 0 ? Math.min(samplecap, frames) : frames;
    var channels_data = [];
    for (var ch = 0; ch < channels; ch++) {
        channels_data.push(b.peek(ch, 0, cap));
    }
    return {
        framecount:        frames,
        channelcount:      channels,
        length_ms:         lenMs,
        samples_returned:  cap,
        samples_truncated: cap < frames,
        channels:          channels_data
    };
}

function dumpMatrix(name) {
    var m = new JitterMatrix(name);
    var dim         = m.dim;
    var planecount  = m.planecount;
    var type        = m.type;
    if (!dim || dim.length === 0) {
        return { error: "jit.matrix " + name + " has no dim (not found?)" };
    }
    var dimArr = (dim.length !== undefined) ? Array.prototype.slice.call(dim) : [dim];

    var totalCells = 1;
    for (var i = 0; i < dimArr.length; i++) totalCells *= dimArr[i];

    var cap = cellcap > 0 ? Math.min(cellcap, totalCells) : totalCells;

    var cells = [];
    if (dimArr.length === 1) {
        for (var x = 0; x < dimArr[0] && cells.length < cap; x++) {
            cells.push({ pos: [x], value: m.getcell(x) });
        }
    } else if (dimArr.length === 2) {
        for (var y = 0; y < dimArr[1] && cells.length < cap; y++) {
            for (var x2 = 0; x2 < dimArr[0] && cells.length < cap; x2++) {
                cells.push({ pos: [x2, y], value: m.getcell(x2, y) });
            }
        }
    } else {
        return {
            dim: dimArr, planecount: planecount, type: type,
            total_cells: totalCells,
            error: "matrices with dim.length > 2 not yet supported in v1"
        };
    }

    return {
        dim:             dimArr,
        planecount:      planecount,
        type:            type,
        total_cells:     totalCells,
        cells_returned:  cells.length,
        cells_truncated: cells.length < totalCells,
        cells:           cells
    };
}

// --- async dumpers (coll, table use messnamed write + parse file) -----------

function dumpCollAsync(tag, name, outpath) {
    var collFile = tmpdir + "/c2m_inspect_" + tag + ".coll";
    messnamed(name, "write", collFile);
    var t = new Task(function() {
        var content = readfile(collFile);
        var result;
        if (content === null) {
            result = { error: "could not read " + collFile +
                              " (write may have failed or coll " + name + " not found)" };
        } else {
            result = { coll_file: collFile, contents: parseCollText(content) };
        }
        finalize(outpath, tag, "coll", name, result);
    });
    t.schedule(asyncdelay);
}

function dumpTableAsync(tag, name, outpath) {
    var tabFile = tmpdir + "/c2m_inspect_" + tag + ".txt";
    messnamed(name, "write", tabFile);
    var t = new Task(function() {
        var content = readfile(tabFile);
        var result;
        if (content === null) {
            result = { error: "could not read " + tabFile +
                              " (write may have failed or table " + name + " not found)" };
        } else {
            result = { table_file: tabFile, contents: parseTableText(content) };
        }
        finalize(outpath, tag, "table", name, result);
    });
    t.schedule(asyncdelay);
}

// --- text parsers for coll / table dump formats -----------------------------

function parseCollText(text) {
    // Each entry is "<key>, <values>;" where key may be int or symbol
    // and values are whitespace-separated.
    var entries = {};
    var raw = text.split(";");
    for (var i = 0; i < raw.length; i++) {
        var entry = raw[i].replace(/^\s+|\s+$/g, "");
        if (!entry) continue;
        var commaIdx = entry.indexOf(",");
        if (commaIdx < 0) continue;
        var key = entry.substring(0, commaIdx).replace(/^\s+|\s+$/g, "");
        var valStr = entry.substring(commaIdx + 1).replace(/^\s+|\s+$/g, "");
        var parts = valStr.split(/\s+/);
        var vals = [];
        for (var j = 0; j < parts.length; j++) {
            var p = parts[j];
            if (p === "") continue;
            var n = Number(p);
            vals.push(isNaN(n) ? p : n);
        }
        entries[key] = (vals.length === 1) ? vals[0] : vals;
    }
    return entries;
}

function parseTableText(text) {
    // Max's table write format:
    //   table {
    //     flags 0 0;
    //     data N v0 v1 v2 ... ;
    //   }
    var m = text.match(/data\s+\d+([^;]+);/);
    if (!m) return { error: "no data section in table file", raw: text };
    var parts = m[1].replace(/^\s+|\s+$/g, "").split(/\s+/);
    var out = [];
    for (var i = 0; i < parts.length; i++) {
        if (parts[i] === "") continue;
        var n = Number(parts[i]);
        if (!isNaN(n)) out.push(n);
    }
    return out;
}
