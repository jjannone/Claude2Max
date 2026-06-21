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
// Supported kinds:
//   dict          — synchronous via Dict.stringify()
//   buffer~       — synchronous via Buffer.peek()
//   jit.matrix    — synchronous via JitterMatrix.getcell() (capped)
//   coll          — async: trigger `write <file>`, read+parse the file
//   table         — async: trigger `write <file>`, read+parse the file
//
// coll/table have NO v8 wrapper class, and `messnamed` only delivers to
// [receive] objects — never to a bare `coll NAME` / `table NAME`. So the
// dumper reaches them by one of two documented-correct paths, tried in
// order (see reachNamedWrite):
//   (a) getnamed — this.patcher.getnamed(NAME).message("write", file).
//       Zero wiring, but the object must have its Scripting Name (@varname)
//       == NAME and live in the SAME patcher as [c2m.inspect].
//   (b) messnamed relay — messnamed("NAME_INSPECT", "write", file), which
//       requires a `[receive NAME_INSPECT] → [coll/table NAME]` wire. Works
//       across patcher boundaries.
// If neither path lands data in the file within @asyncdelay ms, the result
// is a structured error naming both setup options.
//
// Still unsupported (no reliable v8 reach): multislider, pattr, jit.cellblock.
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

var SUPPORTED_KINDS = ["dict", "buffer~", "jit.matrix", "coll", "table"];
var SENTINEL        = "__C2M_PENDING__";  // written before an async coll/table
                                          // write so a no-op write is detectable

declareattribute("cellcap",    null, "setcellcap");
declareattribute("samplecap",  null, "setsamplecap");
declareattribute("tmpdir",     null, "settmpdir");
declareattribute("asyncdelay", null, "setasyncdelay");

function setcellcap(v)    { cellcap    = +v; }
function setsamplecap(v)  { samplecap  = +v; }
function settmpdir(v)     { tmpdir     = String(v); }
function setasyncdelay(v) { asyncdelay = +v; }

// --- file I/O helper --------------------------------------------------------

// Max's File "write" mode overwrites from offset 0 but does NOT truncate, so a
// shorter write leaves a tail of the previous (longer) file's bytes — which
// corrupts the JSON every reader downstream sees. Truncate explicitly to the
// bytes just written via the File `eof` property (set to current `position`).
function writefile(path, str, openFailOutlet) {
    var f = new File(path, "write");
    if (!f.isopen) {
        post("c2m.inspect: cannot open for write: " + path + "\n");
        if (openFailOutlet) outlet(0, "error", "open_failed", path);
        return false;
    }
    f.writestring(str);
    f.eof = f.position;   // truncate any stale trailing bytes
    f.close();
    return true;
}

function writejson(path, obj) {
    return writefile(path, JSON.stringify(obj, null, 2), true);
}

function writetext(path, str) {
    return writefile(path, str, false);
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
        kinds_supported:   SUPPORTED_KINDS,
        kinds_unsupported: ["multislider", "pattr", "jit.cellblock"],
        caps:  { cellcap: cellcap, samplecap: samplecap },
        note:  "dict/buffer~/jit.matrix are read directly via v8 wrapper " +
               "classes. coll/table are reached via getnamed (same patcher, " +
               "object's @varname == name) or a [receive NAME_INSPECT] wire."
    });
    outlet(0, "scan", path);
}

function dump(tag, kind, name) {
    if (tag === undefined || kind === undefined || name === undefined) {
        outlet(0, "error", "dump_requires_tag_kind_name");
        return;
    }
    var outpath = tmpdir + "/c2m_inspect_" + tag + ".json";
    var k = String(kind);

    // coll/table have no v8 wrapper, so they're asynchronous: trigger a
    // `write <file>` on the named object, then read the file back after
    // @asyncdelay ms. These dumpers finalize() themselves — return early so
    // we don't double-finalize. Capture this.patcher HERE (dump is a Max
    // message handler, so `this` is the jsthis wrapper) for the getnamed path.
    if (k === "coll")  { dumpCollAsync(tag, name, outpath, this.patcher);  return; }
    if (k === "table") { dumpTableAsync(tag, name, outpath, this.patcher); return; }

    var result;
    try {
        switch (k) {
            case "dict":       result = dumpDict(name);   break;
            case "buffer~":    result = dumpBuffer(name); break;
            case "jit.matrix": result = dumpMatrix(name); break;
            default:
                result = { error: "unsupported kind: " + kind,
                           supported_now: SUPPORTED_KINDS };
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

// --- async dumpers (coll, table: trigger `write <file>`, read it back) -------

// Trigger a `write <file>` on the named coll/table and report which path
// reached it. Tries the scripting-name path first (getnamed in the same
// patcher — zero wiring), then the [receive NAME_INSPECT] relay (messnamed,
// which only ever reaches [receive] objects). Both names verified against
// bundled v8 examples (Maxobj.message) and the scripting userguide (getnamed).
function reachNamedWrite(pat, name, file) {
    var obj = null;
    try { obj = pat ? pat.getnamed(name) : null; } catch (e) { obj = null; }
    if (obj) {
        try { obj.message("write", file); return "getnamed:" + name; }
        catch (e2) { /* fall through to the messnamed relay */ }
    }
    messnamed(name + "_INSPECT", "write", file);
    return "messnamed:" + name + "_INSPECT";
}

// A no-op write leaves the pre-seeded SENTINEL untouched. Detect that so the
// "object not reached" case becomes a clear setup error instead of a stale read.
function notReached(content) {
    return content === null || content.indexOf(SENTINEL) === 0;
}

function collTableSetupError(kind, name, file, method) {
    return {
        error: kind + " '" + name + "' could not be reached " +
               "(no data written to " + file + " within " + asyncdelay + "ms)",
        attempted: method,
        setup_options: [
            "Set the " + kind + "'s Scripting Name (@varname) to '" + name +
            "' and keep [c2m.inspect] in the SAME patcher — no wiring needed.",
            "OR wire [receive " + name + "_INSPECT] -> [" + kind + " " + name +
            "] so messnamed can deliver the write command across patchers."
        ],
        note: "coll/table have no v8 wrapper class; v8 reaches them only via " +
              "getnamed (same patcher, by scripting name) or a [receive] relay."
    };
}

function dumpCollAsync(tag, name, outpath, pat) {
    var collFile = tmpdir + "/c2m_inspect_" + tag + ".coll";
    writetext(collFile, SENTINEL);
    var method = reachNamedWrite(pat, name, collFile);
    var t = new Task(function() {
        var content = readfile(collFile);
        var result;
        if (notReached(content)) {
            result = collTableSetupError("coll", name, collFile, method);
        } else {
            result = { reach_method: method, coll_file: collFile,
                       contents: parseCollText(content) };
        }
        finalize(outpath, tag, "coll", name, result);
    });
    t.schedule(asyncdelay);
}

function dumpTableAsync(tag, name, outpath, pat) {
    var tabFile = tmpdir + "/c2m_inspect_" + tag + ".txt";
    writetext(tabFile, SENTINEL);
    var method = reachNamedWrite(pat, name, tabFile);
    var t = new Task(function() {
        var content = readfile(tabFile);
        var result;
        if (notReached(content)) {
            result = collTableSetupError("table", name, tabFile, method);
        } else {
            result = { reach_method: method, table_file: tabFile,
                       contents: parseTableText(content) };
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
    // Verified against live `table write` output (Max 9): a single flat line
    //   table v0 v1 v2 ... v(size-1)
    // (the literal label "table", then every cell value incl. trailing zeros;
    // no flags/data wrapper). Strip any ; { } punctuation, drop the "table"
    // label, collect every numeric token.
    var toks = text.replace(/[;{}]/g, " ").split(/\s+/);
    var out = [];
    for (var i = 0; i < toks.length; i++) {
        var t = toks[i];
        if (t === "" || t === "table") continue;
        var n = Number(t);
        if (!isNaN(n)) out.push(n);
    }
    if (out.length === 0) return { error: "no numeric data in table file", raw: text };
    return out;
}
