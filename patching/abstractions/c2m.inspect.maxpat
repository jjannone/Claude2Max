{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100.0,
      100.0,
      700.0,
      600.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-title",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            50.0,
            15.0,
            400.0,
            24.0
          ],
          "text": "c2m.inspect",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            16.0,
            620.0,
            22.0
          ],
          "text": "c2m.inspect \u2014 OSC-driven data structure dumper (drop this into any patch)"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            400.0,
            50.0,
            30.0,
            30.0
          ],
          "comment": "in 0: ping | scan | dump <tag> <kind> <name> \u2014 direct message bypass for OSC"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            310.0,
            30.0,
            30.0
          ],
          "comment": "out 0: pong/scan/dumped/error <path> \u2014 status from v8"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            80.0,
            125.0,
            22.0
          ],
          "text": "udpreceive 7474"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            200.0,
            80.0,
            400.0,
            20.0
          ],
          "text": "OSC in on UDP 7474 \u2014 default mode decodes OSC \u2192 Max messages"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            40.0,
            130.0,
            349.0,
            22.0
          ],
          "text": "route /inspect/ping /inspect/dump /inspect/scan"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            400.0,
            130.0,
            300.0,
            20.0
          ],
          "text": "route by OSC address (native Max route on the decoded symbol)"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend ping",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend dump",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend scan",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            460.0,
            190.0,
            240.0,
            20.0
          ],
          "text": "prepend the JS function name to invoke"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            250.0,
            139.0,
            22.0
          ],
          "text": "v8 c2m_inspect.js @embed 1",
          "filename": "c2m_inspect.js",
          "textfile": {
            "filename": "c2m_inspect.js",
            "flags": 0,
            "autowatch": 1,
            "embed": 1,
            "text": "// c2m_inspect.js \u2014 Claude2Max data structure inspector.\n//\n// Receives messages (typically from `[udpreceive]` decoded OSC):\n//   ping                              -> write tmpdir/c2m_inspect_pong.json\n//   dump <tag> <kind> <name>          -> write tmpdir/c2m_inspect_<tag>.json\n//                                        with contents of <name> as <kind>\n//   scan                              -> write tmpdir/c2m_inspect_scan.json\n//                                        with a list of supported kinds + the\n//                                        current attribute caps (no patcher walk\n//                                        in v1)\n//\n// Supported kinds:\n//   dict          \u2014 synchronous via Dict.stringify()\n//   buffer~       \u2014 synchronous via Buffer.peek()\n//   jit.matrix    \u2014 synchronous via JitterMatrix.getcell() (capped)\n//   coll          \u2014 async: trigger `write <file>`, read+parse the file\n//   table         \u2014 async: trigger `write <file>`, read+parse the file\n//\n// coll/table have NO v8 wrapper class, and `messnamed` only delivers to\n// [receive] objects \u2014 never to a bare `coll NAME` / `table NAME`. So the\n// dumper reaches them by one of two documented-correct paths, tried in\n// order (see reachNamedWrite):\n//   (a) getnamed \u2014 this.patcher.getnamed(NAME).message(\"write\", file).\n//       Zero wiring, but the object must have its Scripting Name (@varname)\n//       == NAME and live in the SAME patcher as [c2m.inspect].\n//   (b) messnamed relay \u2014 messnamed(\"NAME_INSPECT\", \"write\", file), which\n//       requires a `[receive NAME_INSPECT] \u2192 [coll/table NAME]` wire. Works\n//       across patcher boundaries.\n// If neither path lands data in the file within @asyncdelay ms, the result\n// is a structured error naming both setup options.\n//\n// Still unsupported (no reliable v8 reach): multislider, pattr, jit.cellblock.\n//\n// Attributes (set on the v8 box with @attr value, or as messages):\n//   @cellcap <int>        max cells dumped per jit.matrix (default 10000, 0 = unlimited)\n//   @samplecap <int>      max samples dumped per buffer~ channel (default 4096, 0 = unlimited)\n//   @tmpdir <symbol>      directory for dump files (default /tmp)\n//   @asyncdelay <int>     ms to wait for messnamed-write to finish (default 200)\n\ninlets  = 1;\noutlets = 1;\n\nautowatch = 1;\n\n// --- parameters (also exposed as attributes via declareattribute) -----------\n\nvar cellcap     = 10000;\nvar samplecap   = 4096;\nvar tmpdir      = \"/tmp\";\nvar asyncdelay  = 200;\n\nvar SUPPORTED_KINDS = [\"dict\", \"buffer~\", \"jit.matrix\", \"coll\", \"table\"];\nvar SENTINEL        = \"__C2M_PENDING__\";  // written before an async coll/table\n                                          // write so a no-op write is detectable\n\ndeclareattribute(\"cellcap\",    null, \"setcellcap\");\ndeclareattribute(\"samplecap\",  null, \"setsamplecap\");\ndeclareattribute(\"tmpdir\",     null, \"settmpdir\");\ndeclareattribute(\"asyncdelay\", null, \"setasyncdelay\");\n\nfunction setcellcap(v)    { cellcap    = +v; }\nfunction setsamplecap(v)  { samplecap  = +v; }\nfunction settmpdir(v)     { tmpdir     = String(v); }\nfunction setasyncdelay(v) { asyncdelay = +v; }\n\n// --- file I/O helper --------------------------------------------------------\n\n// Max's File \"write\" mode overwrites from offset 0 but does NOT truncate, so a\n// shorter write leaves a tail of the previous (longer) file's bytes \u2014 which\n// corrupts the JSON every reader downstream sees. Truncate explicitly to the\n// bytes just written via the File `eof` property (set to current `position`).\nfunction writefile(path, str, openFailOutlet) {\n    var f = new File(path, \"write\");\n    if (!f.isopen) {\n        post(\"c2m.inspect: cannot open for write: \" + path + \"\\n\");\n        if (openFailOutlet) outlet(0, \"error\", \"open_failed\", path);\n        return false;\n    }\n    f.writestring(str);\n    f.eof = f.position;   // truncate any stale trailing bytes\n    f.close();\n    return true;\n}\n\nfunction writejson(path, obj) {\n    return writefile(path, JSON.stringify(obj, null, 2), true);\n}\n\nfunction writetext(path, str) {\n    return writefile(path, str, false);\n}\n\nfunction readfile(path) {\n    var f = new File(path, \"read\");\n    if (!f.isopen) return null;\n    var buf = \"\";\n    var line;\n    while ((line = f.readline(8192)) !== null && line !== \"\") {\n        buf += line + \"\\n\";\n    }\n    f.close();\n    return buf;\n}\n\n// --- message entry points ---------------------------------------------------\n\nfunction bang() { ping(); }\n\nfunction ping() {\n    var path = tmpdir + \"/c2m_inspect_pong.json\";\n    writejson(path, {\n        ok:        true,\n        ts:        Date.now(),\n        cellcap:   cellcap,\n        samplecap: samplecap,\n        tmpdir:    tmpdir,\n        asyncdelay_ms: asyncdelay\n    });\n    outlet(0, \"pong\", path);\n}\n\nfunction scan() {\n    var path = tmpdir + \"/c2m_inspect_scan.json\";\n    writejson(path, {\n        ok:    true,\n        ts:    Date.now(),\n        kinds_supported:   SUPPORTED_KINDS,\n        kinds_unsupported: [\"multislider\", \"pattr\", \"jit.cellblock\"],\n        caps:  { cellcap: cellcap, samplecap: samplecap },\n        note:  \"dict/buffer~/jit.matrix are read directly via v8 wrapper \" +\n               \"classes. coll/table are reached via getnamed (same patcher, \" +\n               \"object's @varname == name) or a [receive NAME_INSPECT] wire.\"\n    });\n    outlet(0, \"scan\", path);\n}\n\nfunction dump(tag, kind, name) {\n    if (tag === undefined || kind === undefined || name === undefined) {\n        outlet(0, \"error\", \"dump_requires_tag_kind_name\");\n        return;\n    }\n    var outpath = tmpdir + \"/c2m_inspect_\" + tag + \".json\";\n    var k = String(kind);\n\n    // coll/table have no v8 wrapper, so they're asynchronous: trigger a\n    // `write <file>` on the named object, then read the file back after\n    // @asyncdelay ms. These dumpers finalize() themselves \u2014 return early so\n    // we don't double-finalize. Capture this.patcher HERE (dump is a Max\n    // message handler, so `this` is the jsthis wrapper) for the getnamed path.\n    if (k === \"coll\")  { dumpCollAsync(tag, name, outpath, this.patcher);  return; }\n    if (k === \"table\") { dumpTableAsync(tag, name, outpath, this.patcher); return; }\n\n    var result;\n    try {\n        switch (k) {\n            case \"dict\":       result = dumpDict(name);   break;\n            case \"buffer~\":    result = dumpBuffer(name); break;\n            case \"jit.matrix\": result = dumpMatrix(name); break;\n            default:\n                result = { error: \"unsupported kind: \" + kind,\n                           supported_now: SUPPORTED_KINDS };\n        }\n    } catch (e) {\n        result = { error: String(e) };\n    }\n    finalize(outpath, tag, kind, name, result);\n}\n\nfunction finalize(outpath, tag, kind, name, result) {\n    result.tag  = String(tag);\n    result.kind = String(kind);\n    result.name = String(name);\n    result.ts   = Date.now();\n    if (writejson(outpath, result)) {\n        outlet(0, \"dumped\", String(tag), outpath);\n    }\n}\n\n// --- sync dumpers -----------------------------------------------------------\n\nfunction dumpDict(name) {\n    var d = new Dict(name);\n    var s = d.stringify();\n    var parsed;\n    try { parsed = JSON.parse(s); }\n    catch (e) { return { error: \"dict stringify did not return JSON: \" + e, raw: s }; }\n    return { contents: parsed };\n}\n\nfunction dumpBuffer(bufname) {\n    var b = new Buffer(bufname);\n    var frames   = b.framecount();\n    var channels = b.channelcount();\n    var lenMs    = b.length();\n    if (frames === 0 && channels === 0) {\n        return { error: \"buffer~ \" + bufname + \" not found or empty\" };\n    }\n    var cap = samplecap > 0 ? Math.min(samplecap, frames) : frames;\n    var channels_data = [];\n    for (var ch = 0; ch < channels; ch++) {\n        channels_data.push(b.peek(ch, 0, cap));\n    }\n    return {\n        framecount:        frames,\n        channelcount:      channels,\n        length_ms:         lenMs,\n        samples_returned:  cap,\n        samples_truncated: cap < frames,\n        channels:          channels_data\n    };\n}\n\nfunction dumpMatrix(name) {\n    var m = new JitterMatrix(name);\n    var dim         = m.dim;\n    var planecount  = m.planecount;\n    var type        = m.type;\n    if (!dim || dim.length === 0) {\n        return { error: \"jit.matrix \" + name + \" has no dim (not found?)\" };\n    }\n    var dimArr = (dim.length !== undefined) ? Array.prototype.slice.call(dim) : [dim];\n\n    var totalCells = 1;\n    for (var i = 0; i < dimArr.length; i++) totalCells *= dimArr[i];\n\n    var cap = cellcap > 0 ? Math.min(cellcap, totalCells) : totalCells;\n\n    var cells = [];\n    if (dimArr.length === 1) {\n        for (var x = 0; x < dimArr[0] && cells.length < cap; x++) {\n            cells.push({ pos: [x], value: m.getcell(x) });\n        }\n    } else if (dimArr.length === 2) {\n        for (var y = 0; y < dimArr[1] && cells.length < cap; y++) {\n            for (var x2 = 0; x2 < dimArr[0] && cells.length < cap; x2++) {\n                cells.push({ pos: [x2, y], value: m.getcell(x2, y) });\n            }\n        }\n    } else {\n        return {\n            dim: dimArr, planecount: planecount, type: type,\n            total_cells: totalCells,\n            error: \"matrices with dim.length > 2 not yet supported in v1\"\n        };\n    }\n\n    return {\n        dim:             dimArr,\n        planecount:      planecount,\n        type:            type,\n        total_cells:     totalCells,\n        cells_returned:  cells.length,\n        cells_truncated: cells.length < totalCells,\n        cells:           cells\n    };\n}\n\n// --- async dumpers (coll, table: trigger `write <file>`, read it back) -------\n\n// Trigger a `write <file>` on the named coll/table and report which path\n// reached it. Tries the scripting-name path first (getnamed in the same\n// patcher \u2014 zero wiring), then the [receive NAME_INSPECT] relay (messnamed,\n// which only ever reaches [receive] objects). Both names verified against\n// bundled v8 examples (Maxobj.message) and the scripting userguide (getnamed).\nfunction reachNamedWrite(pat, name, file) {\n    var obj = null;\n    try { obj = pat ? pat.getnamed(name) : null; } catch (e) { obj = null; }\n    if (obj) {\n        try { obj.message(\"write\", file); return \"getnamed:\" + name; }\n        catch (e2) { /* fall through to the messnamed relay */ }\n    }\n    messnamed(name + \"_INSPECT\", \"write\", file);\n    return \"messnamed:\" + name + \"_INSPECT\";\n}\n\n// A no-op write leaves the pre-seeded SENTINEL untouched. Detect that so the\n// \"object not reached\" case becomes a clear setup error instead of a stale read.\nfunction notReached(content) {\n    return content === null || content.indexOf(SENTINEL) === 0;\n}\n\nfunction collTableSetupError(kind, name, file, method) {\n    return {\n        error: kind + \" '\" + name + \"' could not be reached \" +\n               \"(no data written to \" + file + \" within \" + asyncdelay + \"ms)\",\n        attempted: method,\n        setup_options: [\n            \"Set the \" + kind + \"'s Scripting Name (@varname) to '\" + name +\n            \"' and keep [c2m.inspect] in the SAME patcher \u2014 no wiring needed.\",\n            \"OR wire [receive \" + name + \"_INSPECT] -> [\" + kind + \" \" + name +\n            \"] so messnamed can deliver the write command across patchers.\"\n        ],\n        note: \"coll/table have no v8 wrapper class; v8 reaches them only via \" +\n              \"getnamed (same patcher, by scripting name) or a [receive] relay.\"\n    };\n}\n\nfunction dumpCollAsync(tag, name, outpath, pat) {\n    var collFile = tmpdir + \"/c2m_inspect_\" + tag + \".coll\";\n    writetext(collFile, SENTINEL);\n    var method = reachNamedWrite(pat, name, collFile);\n    var t = new Task(function() {\n        var content = readfile(collFile);\n        var result;\n        if (notReached(content)) {\n            result = collTableSetupError(\"coll\", name, collFile, method);\n        } else {\n            result = { reach_method: method, coll_file: collFile,\n                       contents: parseCollText(content) };\n        }\n        finalize(outpath, tag, \"coll\", name, result);\n    });\n    t.schedule(asyncdelay);\n}\n\nfunction dumpTableAsync(tag, name, outpath, pat) {\n    var tabFile = tmpdir + \"/c2m_inspect_\" + tag + \".txt\";\n    writetext(tabFile, SENTINEL);\n    var method = reachNamedWrite(pat, name, tabFile);\n    var t = new Task(function() {\n        var content = readfile(tabFile);\n        var result;\n        if (notReached(content)) {\n            result = collTableSetupError(\"table\", name, tabFile, method);\n        } else {\n            result = { reach_method: method, table_file: tabFile,\n                       contents: parseTableText(content) };\n        }\n        finalize(outpath, tag, \"table\", name, result);\n    });\n    t.schedule(asyncdelay);\n}\n\n// --- text parsers for coll / table dump formats -----------------------------\n\nfunction parseCollText(text) {\n    // Each entry is \"<key>, <values>;\" where key may be int or symbol\n    // and values are whitespace-separated.\n    var entries = {};\n    var raw = text.split(\";\");\n    for (var i = 0; i < raw.length; i++) {\n        var entry = raw[i].replace(/^\\s+|\\s+$/g, \"\");\n        if (!entry) continue;\n        var commaIdx = entry.indexOf(\",\");\n        if (commaIdx < 0) continue;\n        var key = entry.substring(0, commaIdx).replace(/^\\s+|\\s+$/g, \"\");\n        var valStr = entry.substring(commaIdx + 1).replace(/^\\s+|\\s+$/g, \"\");\n        var parts = valStr.split(/\\s+/);\n        var vals = [];\n        for (var j = 0; j < parts.length; j++) {\n            var p = parts[j];\n            if (p === \"\") continue;\n            var n = Number(p);\n            vals.push(isNaN(n) ? p : n);\n        }\n        entries[key] = (vals.length === 1) ? vals[0] : vals;\n    }\n    return entries;\n}\n\nfunction parseTableText(text) {\n    // Verified against live `table write` output (Max 9): a single flat line\n    //   table v0 v1 v2 ... v(size-1)\n    // (the literal label \"table\", then every cell value incl. trailing zeros;\n    // no flags/data wrapper). Strip any ; { } punctuation, drop the \"table\"\n    // label, collect every numeric token.\n    var toks = text.replace(/[;{}]/g, \" \").split(/\\s+/);\n    var out = [];\n    for (var i = 0; i < toks.length; i++) {\n        var t = toks[i];\n        if (t === \"\" || t === \"table\") continue;\n        var n = Number(t);\n        if (!isNaN(n)) out.push(n);\n    }\n    if (out.length === 0) return { error: \"no numeric data in table file\", raw: text };\n    return out;\n}\n"
          }
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            220.0,
            250.0,
            280.0,
            20.0
          ],
          "text": "ping / dump <tag> <kind> <name> / scan"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            310.0,
            139.0,
            22.0
          ],
          "text": "print c2m.inspect"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            400.0,
            120.0,
            22.0
          ],
          "text": "c2m.inspect",
          "presentation": 1,
          "presentation_rect": [
            8.0,
            6.0,
            124.0,
            18.0
          ],
          "fontsize": 12.0
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            440.0,
            40.0,
            18.0
          ],
          "text": "ping",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            30.0,
            40.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            40.0,
            470.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            30.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            80.0,
            470.0,
            48.0,
            22.0
          ],
          "text": "ping",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            511.0,
            250.0,
            110.0,
            22.0
          ],
          "text": "loadmess embed 1"
        }
      },
      {
        "box": {
          "id": "obj-spec-embed",
          "maxclass": "text.codebox",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            534.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"c2m.inspect\",\n  \"width\": 700,\n  \"height\": 600,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"title_top\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect \\u2014 OSC-driven data structure dumper (drop this into any patch)\",\n      \"pos\": [\n        20,\n        16\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"io_inlet\": {\n      \"type\": \"inlet\",\n      \"pos\": [\n        400,\n        50\n      ],\n      \"attrs\": {\n        \"comment\": \"in 0: ping | scan | dump <tag> <kind> <name> \\u2014 direct message bypass for OSC\"\n      },\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: ping | scan | dump <tag> <kind> <name> \\u2014 direct message bypass for OSC\"\n      }\n    },\n    \"io_outlet\": {\n      \"type\": \"outlet\",\n      \"pos\": [\n        500,\n        310\n      ],\n      \"attrs\": {\n        \"comment\": \"out 0: pong/scan/dumped/error <path> \\u2014 status from v8\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"out 0: pong/scan/dumped/error <path> \\u2014 status from v8\"\n      }\n    },\n    \"udprecv\": {\n      \"type\": \"newobj\",\n      \"text\": \"udpreceive 7474\",\n      \"pos\": [\n        40,\n        80\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"udprecv_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"OSC in on UDP 7474 \\u2014 default mode decodes OSC \\u2192 Max messages\",\n      \"pos\": [\n        200,\n        80\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"router\": {\n      \"type\": \"newobj\",\n      \"text\": \"route /inspect/ping /inspect/dump /inspect/scan\",\n      \"pos\": [\n        40,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"router_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"route by OSC address (native Max route on the decoded symbol)\",\n      \"pos\": [\n        400,\n        130\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"prep_ping\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend ping\",\n      \"pos\": [\n        40,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prep_dump\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend dump\",\n      \"pos\": [\n        180,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prep_scan\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend scan\",\n      \"pos\": [\n        320,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prep_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"prepend the JS function name to invoke\",\n      \"pos\": [\n        460,\n        190\n      ],\n      \"size\": [\n        240,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"v8core\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 c2m_inspect.js @embed 1\",\n      \"pos\": [\n        40,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"c2m_inspect.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// c2m_inspect.js \\u2014 Claude2Max data structure inspector.\\n//\\n// Receives messages (typically from `[udpreceive]` decoded OSC):\\n//   ping                              -> write tmpdir/c2m_inspect_pong.json\\n//   dump <tag> <kind> <name>          -> write tmpdir/c2m_inspect_<tag>.json\\n//                                        with contents of <name> as <kind>\\n//   scan                              -> write tmpdir/c2m_inspect_scan.json\\n//                                        with a list of supported kinds + the\\n//                                        current attribute caps (no patcher walk\\n//                                        in v1)\\n//\\n// Supported kinds:\\n//   dict          \\u2014 synchronous via Dict.stringify()\\n//   buffer~       \\u2014 synchronous via Buffer.peek()\\n//   jit.matrix    \\u2014 synchronous via JitterMatrix.getcell() (capped)\\n//   coll          \\u2014 async: trigger `write <file>`, read+parse the file\\n//   table         \\u2014 async: trigger `write <file>`, read+parse the file\\n//\\n// coll/table have NO v8 wrapper class, and `messnamed` only delivers to\\n// [receive] objects \\u2014 never to a bare `coll NAME` / `table NAME`. So the\\n// dumper reaches them by one of two documented-correct paths, tried in\\n// order (see reachNamedWrite):\\n//   (a) getnamed \\u2014 this.patcher.getnamed(NAME).message(\\\"write\\\", file).\\n//       Zero wiring, but the object must have its Scripting Name (@varname)\\n//       == NAME and live in the SAME patcher as [c2m.inspect].\\n//   (b) messnamed relay \\u2014 messnamed(\\\"NAME_INSPECT\\\", \\\"write\\\", file), which\\n//       requires a `[receive NAME_INSPECT] \\u2192 [coll/table NAME]` wire. Works\\n//       across patcher boundaries.\\n// If neither path lands data in the file within @asyncdelay ms, the result\\n// is a structured error naming both setup options.\\n//\\n// Still unsupported (no reliable v8 reach): multislider, pattr, jit.cellblock.\\n//\\n// Attributes (set on the v8 box with @attr value, or as messages):\\n//   @cellcap <int>        max cells dumped per jit.matrix (default 10000, 0 = unlimited)\\n//   @samplecap <int>      max samples dumped per buffer~ channel (default 4096, 0 = unlimited)\\n//   @tmpdir <symbol>      directory for dump files (default /tmp)\\n//   @asyncdelay <int>     ms to wait for messnamed-write to finish (default 200)\\n\\ninlets  = 1;\\noutlets = 1;\\n\\nautowatch = 1;\\n\\n// --- parameters (also exposed as attributes via declareattribute) -----------\\n\\nvar cellcap     = 10000;\\nvar samplecap   = 4096;\\nvar tmpdir      = \\\"/tmp\\\";\\nvar asyncdelay  = 200;\\n\\nvar SUPPORTED_KINDS = [\\\"dict\\\", \\\"buffer~\\\", \\\"jit.matrix\\\", \\\"coll\\\", \\\"table\\\"];\\nvar SENTINEL        = \\\"__C2M_PENDING__\\\";  // written before an async coll/table\\n                                          // write so a no-op write is detectable\\n\\ndeclareattribute(\\\"cellcap\\\",    null, \\\"setcellcap\\\");\\ndeclareattribute(\\\"samplecap\\\",  null, \\\"setsamplecap\\\");\\ndeclareattribute(\\\"tmpdir\\\",     null, \\\"settmpdir\\\");\\ndeclareattribute(\\\"asyncdelay\\\", null, \\\"setasyncdelay\\\");\\n\\nfunction setcellcap(v)    { cellcap    = +v; }\\nfunction setsamplecap(v)  { samplecap  = +v; }\\nfunction settmpdir(v)     { tmpdir     = String(v); }\\nfunction setasyncdelay(v) { asyncdelay = +v; }\\n\\n// --- file I/O helper --------------------------------------------------------\\n\\n// Max's File \\\"write\\\" mode overwrites from offset 0 but does NOT truncate, so a\\n// shorter write leaves a tail of the previous (longer) file's bytes \\u2014 which\\n// corrupts the JSON every reader downstream sees. Truncate explicitly to the\\n// bytes just written via the File `eof` property (set to current `position`).\\nfunction writefile(path, str, openFailOutlet) {\\n    var f = new File(path, \\\"write\\\");\\n    if (!f.isopen) {\\n        post(\\\"c2m.inspect: cannot open for write: \\\" + path + \\\"\\\\n\\\");\\n        if (openFailOutlet) outlet(0, \\\"error\\\", \\\"open_failed\\\", path);\\n        return false;\\n    }\\n    f.writestring(str);\\n    f.eof = f.position;   // truncate any stale trailing bytes\\n    f.close();\\n    return true;\\n}\\n\\nfunction writejson(path, obj) {\\n    return writefile(path, JSON.stringify(obj, null, 2), true);\\n}\\n\\nfunction writetext(path, str) {\\n    return writefile(path, str, false);\\n}\\n\\nfunction readfile(path) {\\n    var f = new File(path, \\\"read\\\");\\n    if (!f.isopen) return null;\\n    var buf = \\\"\\\";\\n    var line;\\n    while ((line = f.readline(8192)) !== null && line !== \\\"\\\") {\\n        buf += line + \\\"\\\\n\\\";\\n    }\\n    f.close();\\n    return buf;\\n}\\n\\n// --- message entry points ---------------------------------------------------\\n\\nfunction bang() { ping(); }\\n\\nfunction ping() {\\n    var path = tmpdir + \\\"/c2m_inspect_pong.json\\\";\\n    writejson(path, {\\n        ok:        true,\\n        ts:        Date.now(),\\n        cellcap:   cellcap,\\n        samplecap: samplecap,\\n        tmpdir:    tmpdir,\\n        asyncdelay_ms: asyncdelay\\n    });\\n    outlet(0, \\\"pong\\\", path);\\n}\\n\\nfunction scan() {\\n    var path = tmpdir + \\\"/c2m_inspect_scan.json\\\";\\n    writejson(path, {\\n        ok:    true,\\n        ts:    Date.now(),\\n        kinds_supported:   SUPPORTED_KINDS,\\n        kinds_unsupported: [\\\"multislider\\\", \\\"pattr\\\", \\\"jit.cellblock\\\"],\\n        caps:  { cellcap: cellcap, samplecap: samplecap },\\n        note:  \\\"dict/buffer~/jit.matrix are read directly via v8 wrapper \\\" +\\n               \\\"classes. coll/table are reached via getnamed (same patcher, \\\" +\\n               \\\"object's @varname == name) or a [receive NAME_INSPECT] wire.\\\"\\n    });\\n    outlet(0, \\\"scan\\\", path);\\n}\\n\\nfunction dump(tag, kind, name) {\\n    if (tag === undefined || kind === undefined || name === undefined) {\\n        outlet(0, \\\"error\\\", \\\"dump_requires_tag_kind_name\\\");\\n        return;\\n    }\\n    var outpath = tmpdir + \\\"/c2m_inspect_\\\" + tag + \\\".json\\\";\\n    var k = String(kind);\\n\\n    // coll/table have no v8 wrapper, so they're asynchronous: trigger a\\n    // `write <file>` on the named object, then read the file back after\\n    // @asyncdelay ms. These dumpers finalize() themselves \\u2014 return early so\\n    // we don't double-finalize. Capture this.patcher HERE (dump is a Max\\n    // message handler, so `this` is the jsthis wrapper) for the getnamed path.\\n    if (k === \\\"coll\\\")  { dumpCollAsync(tag, name, outpath, this.patcher);  return; }\\n    if (k === \\\"table\\\") { dumpTableAsync(tag, name, outpath, this.patcher); return; }\\n\\n    var result;\\n    try {\\n        switch (k) {\\n            case \\\"dict\\\":       result = dumpDict(name);   break;\\n            case \\\"buffer~\\\":    result = dumpBuffer(name); break;\\n            case \\\"jit.matrix\\\": result = dumpMatrix(name); break;\\n            default:\\n                result = { error: \\\"unsupported kind: \\\" + kind,\\n                           supported_now: SUPPORTED_KINDS };\\n        }\\n    } catch (e) {\\n        result = { error: String(e) };\\n    }\\n    finalize(outpath, tag, kind, name, result);\\n}\\n\\nfunction finalize(outpath, tag, kind, name, result) {\\n    result.tag  = String(tag);\\n    result.kind = String(kind);\\n    result.name = String(name);\\n    result.ts   = Date.now();\\n    if (writejson(outpath, result)) {\\n        outlet(0, \\\"dumped\\\", String(tag), outpath);\\n    }\\n}\\n\\n// --- sync dumpers -----------------------------------------------------------\\n\\nfunction dumpDict(name) {\\n    var d = new Dict(name);\\n    var s = d.stringify();\\n    var parsed;\\n    try { parsed = JSON.parse(s); }\\n    catch (e) { return { error: \\\"dict stringify did not return JSON: \\\" + e, raw: s }; }\\n    return { contents: parsed };\\n}\\n\\nfunction dumpBuffer(bufname) {\\n    var b = new Buffer(bufname);\\n    var frames   = b.framecount();\\n    var channels = b.channelcount();\\n    var lenMs    = b.length();\\n    if (frames === 0 && channels === 0) {\\n        return { error: \\\"buffer~ \\\" + bufname + \\\" not found or empty\\\" };\\n    }\\n    var cap = samplecap > 0 ? Math.min(samplecap, frames) : frames;\\n    var channels_data = [];\\n    for (var ch = 0; ch < channels; ch++) {\\n        channels_data.push(b.peek(ch, 0, cap));\\n    }\\n    return {\\n        framecount:        frames,\\n        channelcount:      channels,\\n        length_ms:         lenMs,\\n        samples_returned:  cap,\\n        samples_truncated: cap < frames,\\n        channels:          channels_data\\n    };\\n}\\n\\nfunction dumpMatrix(name) {\\n    var m = new JitterMatrix(name);\\n    var dim         = m.dim;\\n    var planecount  = m.planecount;\\n    var type        = m.type;\\n    if (!dim || dim.length === 0) {\\n        return { error: \\\"jit.matrix \\\" + name + \\\" has no dim (not found?)\\\" };\\n    }\\n    var dimArr = (dim.length !== undefined) ? Array.prototype.slice.call(dim) : [dim];\\n\\n    var totalCells = 1;\\n    for (var i = 0; i < dimArr.length; i++) totalCells *= dimArr[i];\\n\\n    var cap = cellcap > 0 ? Math.min(cellcap, totalCells) : totalCells;\\n\\n    var cells = [];\\n    if (dimArr.length === 1) {\\n        for (var x = 0; x < dimArr[0] && cells.length < cap; x++) {\\n            cells.push({ pos: [x], value: m.getcell(x) });\\n        }\\n    } else if (dimArr.length === 2) {\\n        for (var y = 0; y < dimArr[1] && cells.length < cap; y++) {\\n            for (var x2 = 0; x2 < dimArr[0] && cells.length < cap; x2++) {\\n                cells.push({ pos: [x2, y], value: m.getcell(x2, y) });\\n            }\\n        }\\n    } else {\\n        return {\\n            dim: dimArr, planecount: planecount, type: type,\\n            total_cells: totalCells,\\n            error: \\\"matrices with dim.length > 2 not yet supported in v1\\\"\\n        };\\n    }\\n\\n    return {\\n        dim:             dimArr,\\n        planecount:      planecount,\\n        type:            type,\\n        total_cells:     totalCells,\\n        cells_returned:  cells.length,\\n        cells_truncated: cells.length < totalCells,\\n        cells:           cells\\n    };\\n}\\n\\n// --- async dumpers (coll, table: trigger `write <file>`, read it back) -------\\n\\n// Trigger a `write <file>` on the named coll/table and report which path\\n// reached it. Tries the scripting-name path first (getnamed in the same\\n// patcher \\u2014 zero wiring), then the [receive NAME_INSPECT] relay (messnamed,\\n// which only ever reaches [receive] objects). Both names verified against\\n// bundled v8 examples (Maxobj.message) and the scripting userguide (getnamed).\\nfunction reachNamedWrite(pat, name, file) {\\n    var obj = null;\\n    try { obj = pat ? pat.getnamed(name) : null; } catch (e) { obj = null; }\\n    if (obj) {\\n        try { obj.message(\\\"write\\\", file); return \\\"getnamed:\\\" + name; }\\n        catch (e2) { /* fall through to the messnamed relay */ }\\n    }\\n    messnamed(name + \\\"_INSPECT\\\", \\\"write\\\", file);\\n    return \\\"messnamed:\\\" + name + \\\"_INSPECT\\\";\\n}\\n\\n// A no-op write leaves the pre-seeded SENTINEL untouched. Detect that so the\\n// \\\"object not reached\\\" case becomes a clear setup error instead of a stale read.\\nfunction notReached(content) {\\n    return content === null || content.indexOf(SENTINEL) === 0;\\n}\\n\\nfunction collTableSetupError(kind, name, file, method) {\\n    return {\\n        error: kind + \\\" '\\\" + name + \\\"' could not be reached \\\" +\\n               \\\"(no data written to \\\" + file + \\\" within \\\" + asyncdelay + \\\"ms)\\\",\\n        attempted: method,\\n        setup_options: [\\n            \\\"Set the \\\" + kind + \\\"'s Scripting Name (@varname) to '\\\" + name +\\n            \\\"' and keep [c2m.inspect] in the SAME patcher \\u2014 no wiring needed.\\\",\\n            \\\"OR wire [receive \\\" + name + \\\"_INSPECT] -> [\\\" + kind + \\\" \\\" + name +\\n            \\\"] so messnamed can deliver the write command across patchers.\\\"\\n        ],\\n        note: \\\"coll/table have no v8 wrapper class; v8 reaches them only via \\\" +\\n              \\\"getnamed (same patcher, by scripting name) or a [receive] relay.\\\"\\n    };\\n}\\n\\nfunction dumpCollAsync(tag, name, outpath, pat) {\\n    var collFile = tmpdir + \\\"/c2m_inspect_\\\" + tag + \\\".coll\\\";\\n    writetext(collFile, SENTINEL);\\n    var method = reachNamedWrite(pat, name, collFile);\\n    var t = new Task(function() {\\n        var content = readfile(collFile);\\n        var result;\\n        if (notReached(content)) {\\n            result = collTableSetupError(\\\"coll\\\", name, collFile, method);\\n        } else {\\n            result = { reach_method: method, coll_file: collFile,\\n                       contents: parseCollText(content) };\\n        }\\n        finalize(outpath, tag, \\\"coll\\\", name, result);\\n    });\\n    t.schedule(asyncdelay);\\n}\\n\\nfunction dumpTableAsync(tag, name, outpath, pat) {\\n    var tabFile = tmpdir + \\\"/c2m_inspect_\\\" + tag + \\\".txt\\\";\\n    writetext(tabFile, SENTINEL);\\n    var method = reachNamedWrite(pat, name, tabFile);\\n    var t = new Task(function() {\\n        var content = readfile(tabFile);\\n        var result;\\n        if (notReached(content)) {\\n            result = collTableSetupError(\\\"table\\\", name, tabFile, method);\\n        } else {\\n            result = { reach_method: method, table_file: tabFile,\\n                       contents: parseTableText(content) };\\n        }\\n        finalize(outpath, tag, \\\"table\\\", name, result);\\n    });\\n    t.schedule(asyncdelay);\\n}\\n\\n// --- text parsers for coll / table dump formats -----------------------------\\n\\nfunction parseCollText(text) {\\n    // Each entry is \\\"<key>, <values>;\\\" where key may be int or symbol\\n    // and values are whitespace-separated.\\n    var entries = {};\\n    var raw = text.split(\\\";\\\");\\n    for (var i = 0; i < raw.length; i++) {\\n        var entry = raw[i].replace(/^\\\\s+|\\\\s+$/g, \\\"\\\");\\n        if (!entry) continue;\\n        var commaIdx = entry.indexOf(\\\",\\\");\\n        if (commaIdx < 0) continue;\\n        var key = entry.substring(0, commaIdx).replace(/^\\\\s+|\\\\s+$/g, \\\"\\\");\\n        var valStr = entry.substring(commaIdx + 1).replace(/^\\\\s+|\\\\s+$/g, \\\"\\\");\\n        var parts = valStr.split(/\\\\s+/);\\n        var vals = [];\\n        for (var j = 0; j < parts.length; j++) {\\n            var p = parts[j];\\n            if (p === \\\"\\\") continue;\\n            var n = Number(p);\\n            vals.push(isNaN(n) ? p : n);\\n        }\\n        entries[key] = (vals.length === 1) ? vals[0] : vals;\\n    }\\n    return entries;\\n}\\n\\nfunction parseTableText(text) {\\n    // Verified against live `table write` output (Max 9): a single flat line\\n    //   table v0 v1 v2 ... v(size-1)\\n    // (the literal label \\\"table\\\", then every cell value incl. trailing zeros;\\n    // no flags/data wrapper). Strip any ; { } punctuation, drop the \\\"table\\\"\\n    // label, collect every numeric token.\\n    var toks = text.replace(/[;{}]/g, \\\" \\\").split(/\\\\s+/);\\n    var out = [];\\n    for (var i = 0; i < toks.length; i++) {\\n        var t = toks[i];\\n        if (t === \\\"\\\" || t === \\\"table\\\") continue;\\n        var n = Number(t);\\n        if (!isNaN(n)) out.push(n);\\n    }\\n    if (out.length === 0) return { error: \\\"no numeric data in table file\\\", raw: text };\\n    return out;\\n}\\n\"\n        },\n        \"filename\": \"c2m_inspect.js\"\n      }\n    },\n    \"v8_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"ping / dump <tag> <kind> <name> / scan\",\n      \"pos\": [\n        220,\n        250\n      ],\n      \"size\": [\n        280,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"debug_print\": {\n      \"type\": \"newobj\",\n      \"text\": \"print c2m.inspect\",\n      \"pos\": [\n        40,\n        310\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"ui_title\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect\",\n      \"pos\": [\n        40,\n        400\n      ],\n      \"presentation\": [\n        8,\n        6,\n        124,\n        18\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"ping_btn_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"ping\",\n      \"pos\": [\n        40,\n        440\n      ],\n      \"size\": [\n        40,\n        18\n      ],\n      \"presentation\": [\n        40,\n        30,\n        40,\n        18\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"ping_btn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        40,\n        470\n      ],\n      \"presentation\": [\n        12,\n        30,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"ping_msg\": {\n      \"type\": \"message\",\n      \"text\": \"ping\",\n      \"pos\": [\n        80,\n        470\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        511,\n        250\n      ],\n      \"text\": \"loadmess embed 1\",\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"udprecv\",\n      0,\n      \"router\",\n      0\n    ],\n    [\n      \"router\",\n      0,\n      \"prep_ping\",\n      0\n    ],\n    [\n      \"router\",\n      1,\n      \"prep_dump\",\n      0\n    ],\n    [\n      \"router\",\n      2,\n      \"prep_scan\",\n      0\n    ],\n    [\n      \"prep_ping\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"prep_dump\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"prep_scan\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"v8core\",\n      0,\n      \"debug_print\",\n      0\n    ],\n    [\n      \"v8core\",\n      0,\n      \"io_outlet\",\n      0\n    ],\n    [\n      \"io_inlet\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"ping_btn\",\n      0,\n      \"ping_msg\",\n      0\n    ],\n    [\n      \"ping_msg\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"v8core\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-6",
            0
          ],
          "source": [
            "obj-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            0
          ],
          "source": [
            "obj-6",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-9",
            0
          ],
          "source": [
            "obj-6",
            1
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "obj-6",
            2
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-8",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-9",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-10",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            0
          ],
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-3",
            0
          ],
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "source": [
            "obj-17",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-18",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-12",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
