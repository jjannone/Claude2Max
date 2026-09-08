// patchgen.js — Claude2Max in-Max patch generator.
//
// Builds a Max patch from a Claude2Max JSON spec WITHOUT the Python converter
// and without any server: load this file in a [v8 patchgen.js] box, send it
// `read <path-to-spec.json>` (an [opendialog] gives you the path) and a new
// patcher window opens with the patch built in it. Save that window as a
// normal .maxpat.
//
// Why this can be small where spec2maxpat.py is large: the Python converter
// must know every object's inlet/outlet counts to write a file Max accepts.
// Here Max creates real objects, so it supplies all of that itself. This
// script only places boxes, sets text, connects, sets attributes and
// presentation rects, and stores the spec in the patch for round-tripping.
//
// Inlet 0 messages:
//   read <path>          build from a JSON spec file (absolute path, or a
//                        name Max can find on its search path)
//   dictionary <name>    build from a [dict] that imported the JSON
//                        ([dict] → this inlet delivers `dictionary <name>`)
//   bang                 rebuild the last spec again (new window)
// Outlet 0:
//   done <objects> <connections>   |   error <text…>
//
// Attributes (set with @attr on the box, or attrui):
//   @embedspec 0/1   store the spec inside the generated patch (default 1),
//                    so spec2maxpat.py sync/extract can round-trip it later
//   @titlecomment 0/1  add the spec's "name" as a title comment (default 1)
//
// Every Patcher / Maxobj / File / Dict name used here was checked against
// docs.cycling74.com/apiref/js/{Patcher,Maxobj,Wind,File} and Cycling '74's
// shipped scripts on 2026-09-08 — none is written from memory:
//   new Patcher(l,t,r,b)  newdefault(x,y,class,args…)  connect(a,o,b,i)
//   remove(obj)  setattr  getattr  Maxobj.rect [l,t,r,b]  hidden  varname
//   setboxattr / getboxattrnames  subpatcher()  message("set", …)
//   wind.visible / wind.bringtofront()  File(path).readstring(eof)
//   new Dict(name).stringify()
//
// Spec fields this generator reads: name, width, height, objects
// ({type, text, pos, size, attrs, presentation, presentation_rect, patcher}),
// connections ([src, outlet, dst, inlet]). Accepted but ignored (Max supplies
// them): inlets, outlets, outlettype. Not supported: the `layout` grid hints
// and dict-form `presentation` ({col,row}) — give every object a `pos` and a
// 4-element presentation rect instead. A top-level "_comment" key is ignored.

inlets = 1;
outlets = 1;

setinletassist(0, "read <path> | dictionary <name> | bang (rebuild last)");
setoutletassist(0, "done <objects> <connections> | error <text>");

autowatch = 1;

var embedspec = 1;
var titlecomment = 1;

declareattribute("embedspec", {
    type: "long", default: 1, min: 0, max: 1, style: "onoff",
    label: "Embedspec (store the spec in the patch)", setter: "set_embedspec"
});
declareattribute("titlecomment", {
    type: "long", default: 1, min: 0, max: 1, style: "onoff",
    label: "Titlecomment (name as a title comment)", setter: "set_titlecomment"
});
function set_embedspec(v)    { embedspec = v ? 1 : 0; }
function set_titlecomment(v) { titlecomment = v ? 1 : 0; }

// Layout constants — the same grid spec2maxpat.py uses.
var X_MARGIN = 50, Y_MARGIN = 50, X_SPACING = 170, Y_SPACING = 55;
var WINDOW_X = 100, WINDOW_Y = 100;

var SPEC_BEGIN = "--- CLAUDE2MAX SPEC ---";
var SPEC_END   = "--- END SPEC ---";

var lastSpec = null;

// ── entry points ────────────────────────────────────────────────────────────

function read(path) {
    if (path === undefined) { fail("read needs a path"); return; }
    var text = readFile(String(path));
    if (text === null) { fail("could not open " + path); return; }
    var spec = parseSpec(text);
    if (spec) build(spec);
}

function dictionary(name) {
    if (name === undefined) { fail("dictionary needs a dict name"); return; }
    var d = new Dict(String(name));
    var spec = parseSpec(d.stringify());
    if (spec) build(spec);
}

function bang() {
    if (!lastSpec) { fail("nothing to rebuild — send read <path> first"); return; }
    build(lastSpec);
}

function anything() {
    fail("unknown message '" + messagename + "' — use read <path>, dictionary <name>, or bang");
}

// ── helpers ─────────────────────────────────────────────────────────────────

function fail(msg) {
    post("patchgen: " + msg + "\n");
    outlet(0, "error", msg);
}

function readFile(path) {
    var f = new File(path);
    if (!f.isopen) return null;
    var text = f.readstring(f.eof);
    f.close();
    return text;
}

function parseSpec(text) {
    var spec;
    try {
        spec = JSON.parse(text);
    } catch (e) {
        fail("spec is not valid JSON: " + e.message);
        return null;
    }
    if (!spec || typeof spec !== "object" || !spec.objects || typeof spec.objects !== "object") {
        fail("spec needs an \"objects\" object (and usually \"connections\")");
        return null;
    }
    if (!Array.isArray(spec.connections)) spec.connections = [];
    return spec;
}

function num(v, dflt) {
    var n = Number(v);
    return isFinite(n) ? n : dflt;
}

// "metro 500" → ["metro", 500]; "@title \"My Window\"" keeps the quoted
// phrase as one symbol. Numeric tokens become numbers (ints stay ints).
function tokenize(text) {
    var out = [], cur = "", inQuote = false;
    for (var i = 0; i < text.length; i++) {
        var c = text[i];
        if (c === '"') { inQuote = !inQuote; continue; }
        if (!inQuote && /\s/.test(c)) { if (cur.length) { out.push(atom(cur)); cur = ""; } continue; }
        cur += c;
    }
    if (cur.length) out.push(atom(cur));
    return out;
}

function atom(tok) {
    if (/^-?\d+$/.test(tok)) return parseInt(tok, 10);
    if (/^-?(\d+\.\d*|\.\d+|\d+)([eE][-+]?\d+)?$/.test(tok)) return parseFloat(tok);
    return tok;
}

// ── layout for objects that give no pos (longest-path layering, as in
//    spec2maxpat.auto_layout, without its row grouping) ─────────────────────

function autoLayout(objects, connections) {
    var ids = Object.keys(objects);
    var succ = {}, indeg = {}, layer = {};
    ids.forEach(function (id) { succ[id] = []; indeg[id] = 0; });
    connections.forEach(function (c) {
        if (!Array.isArray(c) || c.length < 4) return;
        if (!(c[0] in succ) || !(c[2] in succ)) return;
        succ[c[0]].push(c[2]);
        indeg[c[2]] += 1;
    });
    var queue = [];
    ids.forEach(function (id) { if (indeg[id] === 0) { queue.push(id); layer[id] = 0; } });
    var remaining = {};
    ids.forEach(function (id) { remaining[id] = indeg[id]; });
    while (queue.length) {
        var n = queue.shift();
        succ[n].forEach(function (s) {
            var l = layer[n] + 1;
            if (!(s in layer) || layer[s] < l) layer[s] = l;
            remaining[s] -= 1;
            if (remaining[s] === 0) queue.push(s);
        });
    }
    ids.forEach(function (id) { if (!(id in layer)) layer[id] = 0; });
    var rows = {}, pos = {};
    ids.forEach(function (id) {
        var o = objects[id];
        if (Array.isArray(o.pos) && o.pos.length >= 2) { pos[id] = [num(o.pos[0], 0), num(o.pos[1], 0)]; return; }
        var l = layer[id];
        rows[l] = (rows[l] || 0);
        pos[id] = [X_MARGIN + l * X_SPACING, Y_MARGIN + rows[l] * Y_SPACING];
        rows[l] += 1;
    });
    return pos;
}

// ── building ────────────────────────────────────────────────────────────────

function build(spec) {
    lastSpec = spec;
    var W = num(spec.width, 800), H = num(spec.height, 600);
    var p = new Patcher(WINDOW_X, WINDOW_Y, WINDOW_X + W, WINDOW_Y + H);
    if (spec.name) p.name = String(spec.name);
    var counts = { objects: 0, connections: 0 };
    try {
        buildScope(p, spec, true, counts);
    } catch (e) {
        fail("build failed: " + e.message);
        return;
    }
    p.wind.visible = true;
    p.wind.bringtofront();
    post("patchgen: built " + counts.objects + " objects, " + counts.connections + " connections\n");
    outlet(0, "done", counts.objects, counts.connections);
}

function buildScope(p, spec, isTop, counts) {
    var objects = spec.objects || {};
    var connections = spec.connections || [];
    var pos = autoLayout(objects, connections);
    var made = {};
    var anyPresentation = false;
    var maxBottom = 0;

    Object.keys(objects).forEach(function (id) {
        var o = objects[id];
        if (!o || typeof o !== "object") return;
        var m = createObject(p, id, o, pos[id][0], pos[id][1]);
        if (!m) return;
        made[id] = m;
        counts.objects += 1;
        if (hasPresentation(o)) anyPresentation = true;
        var r = m.rect;
        if (r && r[3] > maxBottom) maxBottom = r[3];
    });

    connections.forEach(function (c) {
        if (!Array.isArray(c) || c.length < 4) { post("patchgen: skipped malformed connection " + JSON.stringify(c) + "\n"); return; }
        var a = made[c[0]], b = made[c[2]];
        if (!a || !b) { post("patchgen: connection refers to unknown object: " + JSON.stringify(c) + "\n"); return; }
        p.connect(a, num(c[1], 0), b, num(c[3], 0));
        counts.connections += 1;
    });

    if (isTop && titlecomment && spec.name) {
        var t = p.newdefault(X_MARGIN, 15, "comment");
        t.message("set", String(spec.name));
        t.rect = [X_MARGIN, 15, X_MARGIN + 400, 39];
        t.setboxattr("fontsize", 16);
        t.setboxattr("fontface", 1);
    }
    if (anyPresentation) p.setattr("openinpresentation", 1);
    if (isTop && embedspec) embedSpec(p, spec, maxBottom + 40);
}

function hasPresentation(o) {
    return (Array.isArray(o.presentation) && o.presentation.length >= 2)
        || (Array.isArray(o.presentation_rect) && o.presentation_rect.length >= 4);
}

function createObject(p, id, o, x, y) {
    var type = String(o.type || "newobj");
    var text = o.text === undefined ? "" : String(o.text);
    var m = null;
    if (type === "newobj") {
        var toks = tokenize(text);
        if (!toks.length) { post("patchgen: '" + id + "' is a newobj with no text — skipped\n"); return null; }
        m = p.newdefault.apply(p, [x, y].concat(toks));
    } else if (type === "message") {
        m = p.newdefault(x, y, "message");
        if (text.length) m.message.apply(m, ["set"].concat(tokenize(text)));
    } else if (type === "comment") {
        m = p.newdefault(x, y, "comment");
        if (text.length) m.message("set", text);
    } else {
        m = p.newdefault(x, y, type);
        if (text.length && (type === "live.text" || type === "textedit")) m.message("set", text);
    }
    if (!m) { post("patchgen: Max could not create '" + id + "' (" + type + " " + text + ")\n"); return null; }

    m.varname = id;

    if (Array.isArray(o.size) && o.size.length >= 2) {
        m.rect = [x, y, x + num(o.size[0], 40), y + num(o.size[1], 22)];
    }

    if (o.attrs && typeof o.attrs === "object") applyAttrs(m, id, o.attrs);

    var prect = null;
    if (Array.isArray(o.presentation_rect) && o.presentation_rect.length >= 4) {
        prect = o.presentation_rect.slice(0, 4).map(function (v) { return num(v, 0); });
    } else if (Array.isArray(o.presentation) && o.presentation.length >= 4) {
        prect = o.presentation.slice(0, 4).map(function (v) { return num(v, 0); });
    } else if (Array.isArray(o.presentation) && o.presentation.length >= 2) {
        var r = m.rect;
        prect = [num(o.presentation[0], 0), num(o.presentation[1], 0), r[2] - r[0], r[3] - r[1]];
    }
    if (prect) {
        m.setboxattr("presentation", 1);
        m.setboxattr("presentation_rect", prect);
    }

    if (o.patcher && typeof o.patcher === "object") {
        var sub = m.subpatcher();
        if (sub) buildScope(sub, o.patcher, false, { objects: 0, connections: 0 });
        else post("patchgen: '" + id + "' has a patcher field but is not a subpatcher box\n");
    }
    return m;
}

function applyAttrs(m, id, attrs) {
    var boxAttrs = {};
    try { m.getboxattrnames().forEach(function (n) { boxAttrs[n] = true; }); } catch (e) {}
    Object.keys(attrs).forEach(function (k) {
        var v = attrs[k];
        try {
            if (k === "hidden") { m.hidden = !!v; return; }
            if (k === "varname") { m.varname = String(v); return; }
            if (boxAttrs[k]) m.setboxattr(k, v);
            else m.setattr(k, v);
        } catch (e) {
            post("patchgen: could not set @" + k + " on '" + id + "': " + e.message + "\n");
        }
    });
}

// Store the spec in the patch so spec2maxpat.py sync / extract can read it
// back. Preferred home is a hidden text.codebox (what the converter writes);
// its `code` attribute is set and read back to prove it took. If it did not,
// the fallback is a hidden comment — extract_spec reads the marker from
// either `code` or `text`.
function embedSpec(p, spec, y) {
    var text = SPEC_BEGIN + "\n" + JSON.stringify(spec, null, 2) + "\n" + SPEC_END;
    var box = null;
    try {
        box = p.newdefault(X_MARGIN, y, "text.codebox");
        box.setattr("code", text);
        var back = String(box.getattr("code"));
        if (back.indexOf(SPEC_BEGIN) < 0) { p.remove(box); box = null; }
    } catch (e) {
        if (box) { try { p.remove(box); } catch (e2) {} }
        box = null;
    }
    if (!box) {
        box = p.newdefault(X_MARGIN, y, "comment");
        box.message("set", text);
        box.rect = [X_MARGIN, y, X_MARGIN + 500, y + 300];
    }
    box.varname = "obj-spec-embed";
    box.hidden = 1;
}
