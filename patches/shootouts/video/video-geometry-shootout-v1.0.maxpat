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
      1370.0,
      1445.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            12.0,
            900.0,
            47.0
          ],
          "text": "VIDEO GEOMETRY SHOOTOUT v1.0 \u2014 rotate, zoom, mirror, warp, tile and scatter the image. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture."
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            66.0,
            620.0,
            20.0
          ],
          "text": "SOURCE \u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            90.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "jit.playlist",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "jit_gl_texture",
            "",
            "dictionary"
          ],
          "patching_rect": [
            30.0,
            120.0,
            360.0,
            60.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            40.0,
            360.0,
            100.0
          ],
          "output_texture": 1,
          "data": {
            "clips": [
              {
                "absolutepath": "chickens.mp4",
                "filename": "chickens.mp4",
                "filekind": "moviefile",
                "id": "u169008532",
                "loop": 1,
                "content_state": {}
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            430.0,
            90.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            168.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            430.0,
            130.0,
            55.0,
            22.0
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            520.0,
            175.0,
            69.0,
            22.0
          ],
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            220.0,
            48.0,
            22.0
          ],
          "text": "open"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            580.0,
            220.0,
            55.0,
            22.0
          ],
          "text": "close"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            520.0,
            265.0,
            293.0,
            22.0
          ],
          "text": "jit.grab @output_texture 1 @automatic 1"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            430.0,
            220.0,
            54.0,
            22.0
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            130.0,
            360.0,
            34.0
          ],
          "text": "webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            130.0,
            255.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            320.0,
            76.0,
            22.0
          ],
          "text": "switch 2"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            365.0,
            62.0,
            22.0
          ],
          "text": "s VSRC"
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
            1460.0,
            90.0,
            460.0,
            47.0
          ],
          "text": "EFFECT SELECT \u2014 live.tab, one column of 19, conventional order. The v8 maps item index \u2192 slot number (1 = DRY) and lights the pane title"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1140.0,
            50.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "live.tab",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "float"
          ],
          "patching_rect": [
            1140.0,
            90.0,
            300.0,
            150.0
          ],
          "presentation": 1,
          "presentation_rect": [
            400.0,
            40.0,
            280.0,
            410.0
          ],
          "num_lines_patching": 19,
          "num_lines_presentation": 19,
          "fontname": "Monaco",
          "fontsize": 11.0,
          "spacing_x": 4.0,
          "spacing_y": 4.0,
          "rounded": 4.0,
          "bgcolor": [
            0.3,
            0.3,
            0.32,
            1.0
          ],
          "bgoncolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "textoncolor": [
            0.05,
            0.05,
            0.05,
            1.0
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "bgcolor": {
              "expression": ""
            },
            "bgoncolor": {
              "expression": ""
            },
            "textcolor": {
              "expression": ""
            },
            "textoncolor": {
              "expression": ""
            },
            "valueof": {
              "parameter_enum": [
                "1 DRY",
                "2 fx.rota",
                "3 fx.camera",
                "4 fx.dimmap",
                "5 Vizzie KALEIDR",
                "6 Vizzie TESSEL8R",
                "7 Vizzie TWIRLR",
                "8 Vizzie REFLECTR",
                "9 Vizzie FOLDR",
                "10 Vizzie PINCHR",
                "11 Vizzie STRETCHR",
                "12 Vizzie ROTATR",
                "13 Vizzie ZOOMR",
                "14 Vizzie PANNR",
                "15 Vizzie TRANS4MR",
                "16 Vizzie FRACTALIZR",
                "17 Vizzie SCRAMBLR",
                "18 Vizzie PIXL8R",
                "19 Vizzie FOGGR"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "VFX_SELECT",
              "parameter_mmax": 18,
              "parameter_modmode": 0,
              "parameter_shortname": "VFX",
              "parameter_type": 2,
              "parameter_unitstyle": 9
            }
          },
          "varname": "VFX_TAB"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1240.0,
            50.0,
            76.0,
            22.0
          ],
          "text": "r TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1330.0,
            50.0,
            520.0,
            20.0
          ],
          "text": "r TABSEL: the transparent button over each pane title sends its tab index here"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1140.0,
            330.0,
            272.0,
            22.0
          ],
          "text": "v8 fx-shootout-highlight.js @embed 1",
          "filename": "fx-shootout-highlight.js",
          "textfile": {
            "filename": "fx-shootout-highlight.js",
            "flags": 0,
            "autowatch": 1,
            "embed": 1,
            "text": "// fx-shootout-highlight.js \u2014 turns the [live.tab] index into the slot\n// number, lights the selected pane's title, dims every other title.\n// Shared by every *-shootout patch. It needs no arguments: it finds the\n// panes itself by probing for comments named TITLE_02, TITLE_03, \u2026 until\n// one is missing. Optional box arguments override that:\n//\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\n//\n// inlet 0  : int \u2014 the live.tab item index (row-major, 0-based).\n// outlet 0 : int \u2014 the slot number (1 = DRY, 2..lastslot = the panes) \u2192 [s SEL].\n//\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\n// Number UI controls down each column). A tab fills row by row, so for a\n// grid with more than one column the items are stored transposed and this\n// script maps the index back:\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\n// With one column (the default) the stored order is the shown order and the\n// mapping is index + 1. ROWS / COLS must match what Max draws.\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\n// digits (TITLE_02 \u2026 TITLE_nn); patcher.getnamed() reaches them and their\n// colors are set by sending the attribute name as a message.\n\ninlets = 1;\noutlets = 1;\nautowatch = 1;\n\nsetinletassist(0, \"int: live.tab item index (row-major) \u2014 lights TITLE_<slot>\");\nsetoutletassist(0, \"int: slot number (1 = DRY, 2..lastslot = panes) \u2192 s SEL\");\n\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\nif (typeof jsarguments !== \"undefined\" && jsarguments.length > 1) {\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\n    if (jsarguments.length > 3) {\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\n    }\n}\n\n// amber on dark is the panel palette; the selected title inverts it\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\n\nvar reported = false;\n\nfunction pad2(n) { return (n < 10 ? \"0\" : \"\") + n; }\n\nfunction title(n) { return this.patcher.getnamed(\"TITLE_\" + pad2(n)); }\n\nfunction lastSlot() {\n    if (ARG_LAST) return ARG_LAST;\n    var n = FIRST_SLOT;\n    while (title(n)) n++;\n    return n - 1;\n}\n\nfunction paint(obj, bg, tx) {\n    obj.message(\"bgcolor\",   bg[0], bg[1], bg[2], bg[3]);\n    obj.message(\"textcolor\", tx[0], tx[1], tx[2], tx[3]);\n}\n\nfunction msg_int(index) {\n    var last = lastSlot();\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\n    var row = Math.floor(index / cols), col = index % cols;\n    var slot = col * rows + row + 1;\n    if (!reported) {\n        post(\"fx-shootout-highlight: \" + (last - FIRST_SLOT + 1) + \" panes (TITLE_02 \u2026 TITLE_\" + pad2(last) + \"), \"\n             + rows + \" rows \u00d7 \" + cols + \" cols\\n\");\n        reported = true;\n    }\n    for (var n = FIRST_SLOT; n <= last; n++) {\n        var obj = title(n);\n        if (!obj) {\n            post(\"fx-shootout-highlight: no comment named TITLE_\" + pad2(n) + \"\\n\");\n            continue;\n        }\n        if (n === slot) paint(obj, ON_BG, ON_TX);\n        else            paint(obj, OFF_BG, OFF_TX);\n    }\n    outlet(0, slot);\n}\n"
          }
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1450.0,
            330.0,
            520.0,
            20.0
          ],
          "text": "index \u2192 slot number (one column, so index + 1) \u2192 s SEL; also lights TITLE_nn"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1140.0,
            370.0,
            55.0,
            22.0
          ],
          "text": "s SEL"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1140.0,
            300.0,
            132.0,
            22.0
          ],
          "text": "loadmess embed 1"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            60.0,
            101.0,
            20.0
          ],
          "text": "2 \u00b7 fx.rota",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            486.0,
            264.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_02"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            486.0,
            264.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "1"
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "2 \u00b7 jit.fx.rota \u2014 rotate (radians) and scale about an anchor"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN02"
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            750.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.rota @theta 0.5 @zoom 1.3 1.3",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            629.0,
            264.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            510.0,
            264.0,
            22.0
          ],
          "attr": "theta",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            533.0,
            264.0,
            22.0
          ],
          "attr": "zoom",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            642.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            556.0,
            264.0,
            22.0
          ],
          "attr": "offset",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            668.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            579.0,
            264.0,
            22.0
          ],
          "attr": "anchor",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            694.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            602.0,
            264.0,
            22.0
          ],
          "attr": "boundmode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            86.0,
            382.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.rota",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            657.0,
            264.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            795.0,
            69.0,
            22.0
          ],
          "text": "s VFX02"
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            118.0,
            20.0
          ],
          "text": "3 \u00b7 fx.camera",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            486.0,
            284.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_03"
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1206.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            486.0,
            284.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1206.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1206.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            520.0,
            556.0,
            20.0
          ],
          "text": "3 \u00b7 jit.fx.camera \u2014 a virtual camera with motion blur (help-file settings)"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN03"
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            750.0,
            412.0,
            22.0
          ],
          "text": "jit.fx.camera @boundmode mirroredrepeat @blur_amount 1.5",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            629.0,
            284.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            510.0,
            284.0,
            22.0
          ],
          "attr": "zoom",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            533.0,
            284.0,
            22.0
          ],
          "attr": "tilt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            642.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            556.0,
            284.0,
            22.0
          ],
          "attr": "lookat",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            820.0,
            668.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            579.0,
            284.0,
            22.0
          ],
          "attr": "blur_amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-52",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840.0,
            694.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            602.0,
            284.0,
            22.0
          ],
          "attr": "boundmode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            795.0,
            69.0,
            22.0
          ],
          "text": "s VFX03"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            138.0,
            118.0,
            20.0
          ],
          "text": "4 \u00b7 fx.dimmap",
          "presentation": 1,
          "presentation_rect": [
            614.0,
            486.0,
            234.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_04"
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1920.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            614.0,
            486.0,
            234.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1920.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1920.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1346.0,
            520.0,
            564.0,
            20.0
          ],
          "text": "4 \u00b7 jit.fx.dimmap \u2014 swap or flip the image's dimensions (help-file setting)"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1346.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN04"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1346.0,
            672.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.dimmap @invert 1 0",
          "presentation": 1,
          "presentation_rect": [
            614.0,
            560.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1466.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            614.0,
            510.0,
            234.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1486.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            614.0,
            533.0,
            234.0,
            22.0
          ],
          "attr": "map",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            399.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.dimmap",
          "presentation": 1,
          "presentation_rect": [
            614.0,
            588.0,
            234.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1346.0,
            717.0,
            69.0,
            22.0
          ],
          "text": "s VFX04"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            190.0,
            161.0,
            20.0
          ],
          "text": "5 \u00b7 Vizzie KALEIDR",
          "presentation": 1,
          "presentation_rect": [
            872.0,
            486.0,
            188.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_05"
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            895.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            872.0,
            486.0,
            188.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            925.0,
            40.0,
            22.0
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            955.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            895.0,
            460.0,
            20.0
          ],
          "text": "5 \u00b7 KALEIDR \u2014 kaleidoscope folding"
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            925.0,
            69.0,
            22.0
          ],
          "text": "r VIN05"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1005.0,
            188.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            872.0,
            510.0,
            188.0,
            130.0
          ],
          "name": "vz.kaleidr.maxpat",
          "varname": "kaleidr",
          "comment": "in 0: Video input | in 1: Set the offset for the horizontal mirroring offset | in 2: Set the offset for the vertical mirroring effect | in 3: Select regular or inverted color outpu | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-74",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1170.0,
            69.0,
            22.0
          ],
          "text": "s VFX05"
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            872.0,
            646.0,
            188.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            242.0,
            169.0,
            20.0
          ],
          "text": "6 \u00b7 Vizzie TESSEL8R",
          "presentation": 1,
          "presentation_rect": [
            1084.0,
            486.0,
            268.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_06"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            895.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1084.0,
            486.0,
            268.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            925.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            955.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            895.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 TESSEL8R \u2014 tessellation, mandala-like"
        }
      },
      {
        "box": {
          "id": "obj-82",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            925.0,
            69.0,
            22.0
          ],
          "text": "r VIN06"
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "bpatcher",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1005.0,
            268.0,
            148.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1084.0,
            510.0,
            268.0,
            148.0
          ],
          "name": "vz.tessel8r.maxpat",
          "varname": "tessel8r",
          "comment": "in 0: Video input | in 1: Set the X (horizontal) origin point for tesselation | in 2: Set the Y (vertical) origin point for tesselation | in 3: Set the X (horizontal) offset point for tesselation | in 4: Set the Y (vertical) offset point for tesselation | in 5: Set the scaled output for the tesselated image | in 6: Set the number of iterations in the tesselation of the image | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1188.0,
            69.0,
            22.0
          ],
          "text": "s VFX06"
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            268.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            1084.0,
            664.0,
            268.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-87",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            294.0,
            152.0,
            20.0
          ],
          "text": "7 \u00b7 Vizzie TWIRLR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            727.0,
            214.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_07"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            895.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            727.0,
            214.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            925.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            955.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            895.0,
            460.0,
            20.0
          ],
          "text": "7 \u00b7 TWIRLR \u2014 twist around a centre"
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            925.0,
            69.0,
            22.0
          ],
          "text": "r VIN07"
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1005.0,
            214.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            751.0,
            214.0,
            130.0
          ],
          "name": "vz.twirlr.maxpat",
          "varname": "twirlr",
          "comment": "in 0: Video input | in 1: Set the X (horizontal) origin for the effect | in 2: Set the Y (vertical) origin for the effect. | in 3: Set the starting angle of rotation (-1. > 1.) for the twirled image. | in 4: Set the amount of counterclockwise/clockwise twirl for the effect | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1170.0,
            69.0,
            22.0
          ],
          "text": "s VFX07"
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            320.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            887.0,
            214.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-97",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            346.0,
            169.0,
            20.0
          ],
          "text": "8 \u00b7 Vizzie REFLECTR",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            727.0,
            337.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_08"
        }
      },
      {
        "box": {
          "id": "obj-98",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1288.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            256.0,
            727.0,
            337.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-99",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1318.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-100",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            1348.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1288.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 REFLECTR \u2014 funhouse-mirror warps"
        }
      },
      {
        "box": {
          "id": "obj-102",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1318.0,
            69.0,
            22.0
          ],
          "text": "r VIN08"
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "bpatcher",
          "numinlets": 14,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1398.0,
            337.0,
            160.0
          ],
          "presentation": 1,
          "presentation_rect": [
            256.0,
            751.0,
            337.0,
            160.0
          ],
          "name": "vz.reflectr.maxpat",
          "varname": "reflectr",
          "comment": "in 0: Video input | in 1: Set the X (horizontal) center for warping | in 2: Set the Y (vertical) center for warping | in 3: Bound mode select | in 4: Zoom control | in 5: Enable/disable sine-based image warping | in 6: Sine warp control | in 7: Enable/disable cosine-based image warping | in 8: Cosine warp control | in 9: Enable/disable tangent-based image warping | in 10: Tangent warp control | in 11: Toggle low/high sin warp range | in 12: Toggle low/high cos warp range | in 13: Toggle low/high tan warp range | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1593.0,
            69.0,
            22.0
          ],
          "text": "s VFX08"
        }
      },
      {
        "box": {
          "id": "obj-105",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            372.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            917.0,
            337.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            398.0,
            144.0,
            20.0
          ],
          "text": "9 \u00b7 Vizzie FOLDR",
          "presentation": 1,
          "presentation_rect": [
            617.0,
            727.0,
            138.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_09"
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1288.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            617.0,
            727.0,
            138.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1318.0,
            40.0,
            22.0
          ],
          "text": "8"
        }
      },
      {
        "box": {
          "id": "obj-110",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1348.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-111",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1288.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 FOLDR \u2014 fold along two axes"
        }
      },
      {
        "box": {
          "id": "obj-112",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1318.0,
            69.0,
            22.0
          ],
          "text": "r VIN09"
        }
      },
      {
        "box": {
          "id": "obj-113",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1398.0,
            138.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            617.0,
            751.0,
            138.0,
            130.0
          ],
          "name": "vz.foldr.maxpat",
          "varname": "delayr",
          "comment": "in 0: Video input | in 1: Set the X (horizontal) point at which the image will be vertically mirrored | in 2: Set the Y (vertical) point at which the image will be horizontally mirrored | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1563.0,
            69.0,
            22.0
          ],
          "text": "s VFX09"
        }
      },
      {
        "box": {
          "id": "obj-115",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            424.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            617.0,
            887.0,
            138.0,
            52.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-117",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            450.0,
            161.0,
            20.0
          ],
          "text": "10 \u00b7 Vizzie PINCHR",
          "presentation": 1,
          "presentation_rect": [
            779.0,
            727.0,
            188.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_10"
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            1288.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            779.0,
            727.0,
            188.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            1318.0,
            40.0,
            22.0
          ],
          "text": "9"
        }
      },
      {
        "box": {
          "id": "obj-120",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            1348.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1288.0,
            460.0,
            20.0
          ],
          "text": "10 \u00b7 PINCHR \u2014 pinch / warp"
        }
      },
      {
        "box": {
          "id": "obj-122",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1318.0,
            69.0,
            22.0
          ],
          "text": "r VIN10"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1398.0,
            188.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            779.0,
            751.0,
            188.0,
            130.0
          ],
          "name": "vz.pinchr.maxpat",
          "varname": "vz.pinchr",
          "comment": "in 0: Video input | in 1: Set the value for the horizontal origin | in 2: Set the value for the vertical origin | in 3: Set the amount of pinching applied to the image | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1563.0,
            69.0,
            22.0
          ],
          "text": "s VFX10"
        }
      },
      {
        "box": {
          "id": "obj-125",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            779.0,
            887.0,
            188.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-127",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            502.0,
            178.0,
            20.0
          ],
          "text": "11 \u00b7 Vizzie STRETCHR",
          "presentation": 1,
          "presentation_rect": [
            991.0,
            727.0,
            260.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_11"
        }
      },
      {
        "box": {
          "id": "obj-128",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            520.0,
            1693.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            991.0,
            727.0,
            260.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-129",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            1723.0,
            40.0,
            22.0
          ],
          "text": "10"
        }
      },
      {
        "box": {
          "id": "obj-130",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            520.0,
            1753.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1693.0,
            480.0,
            20.0
          ],
          "text": "11 \u00b7 STRETCHR \u2014 stretch from an origin"
        }
      },
      {
        "box": {
          "id": "obj-132",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1723.0,
            69.0,
            22.0
          ],
          "text": "r VIN11"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1803.0,
            260.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            991.0,
            751.0,
            260.0,
            130.0
          ],
          "name": "vz.stretchr.maxpat",
          "varname": "stretchr",
          "comment": "in 0: Video input | in 1: X (horizontal) origin | in 2: Y (vertical) origin | in 3: Set the amount of horizontal stretching applied to the image. | in 4: Set the amount of vertical stretching applied to the image | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-134",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            1723.0,
            188.0,
            22.0
          ],
          "text": "loadmess 0.5 0.5 0.3 0.3"
        }
      },
      {
        "box": {
          "id": "obj-135",
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
            120.0,
            1758.0,
            84.0,
            22.0
          ],
          "text": "unjoin 3"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1968.0,
            69.0,
            22.0
          ],
          "text": "s VFX11"
        }
      },
      {
        "box": {
          "id": "obj-137",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            594.0,
            20.0
          ],
          "text": "loads with inlet 1 \u2192 0.5, inlet 2 \u2192 0.5, inlet 3 \u2192 0.3, inlet 4 \u2192 0.3",
          "presentation": 1,
          "presentation_rect": [
            991.0,
            887.0,
            260.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
            161.0,
            20.0
          ],
          "text": "12 \u00b7 Vizzie ROTATR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            965.0,
            248.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_12"
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1130.0,
            1693.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            965.0,
            248.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1130.0,
            1723.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-142",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1130.0,
            1753.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            1693.0,
            460.0,
            20.0
          ],
          "text": "12 \u00b7 ROTATR \u2014 rotate and offset"
        }
      },
      {
        "box": {
          "id": "obj-144",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            1723.0,
            69.0,
            22.0
          ],
          "text": "r VIN12"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            1803.0,
            248.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            989.0,
            248.0,
            130.0
          ],
          "name": "vz.rotatr.maxpat",
          "varname": "rotatr",
          "comment": "in 0: Video input | in 1: Rotation control | in 2: X offset control | in 3: Y offset control | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            1968.0,
            69.0,
            22.0
          ],
          "text": "s VFX12"
        }
      },
      {
        "box": {
          "id": "obj-147",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            580.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1125.0,
            248.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-149",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
            152.0,
            20.0
          ],
          "text": "13 \u00b7 Vizzie ZOOMR",
          "presentation": 1,
          "presentation_rect": [
            290.0,
            965.0,
            158.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_13"
        }
      },
      {
        "box": {
          "id": "obj-150",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1740.0,
            1693.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            290.0,
            965.0,
            158.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1740.0,
            1723.0,
            40.0,
            22.0
          ],
          "text": "12"
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1740.0,
            1753.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-153",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1270.0,
            1693.0,
            460.0,
            20.0
          ],
          "text": "13 \u00b7 ZOOMR \u2014 zoom"
        }
      },
      {
        "box": {
          "id": "obj-154",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1270.0,
            1723.0,
            69.0,
            22.0
          ],
          "text": "r VIN13"
        }
      },
      {
        "box": {
          "id": "obj-155",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1270.0,
            1803.0,
            158.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            290.0,
            989.0,
            158.0,
            130.0
          ],
          "name": "vz.zoomr.maxpat",
          "varname": "zoomr",
          "comment": "in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-156",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1270.0,
            1968.0,
            69.0,
            22.0
          ],
          "text": "s VFX13"
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            290.0,
            1125.0,
            158.0,
            52.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-159",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            658.0,
            152.0,
            20.0
          ],
          "text": "14 \u00b7 Vizzie PANNR",
          "presentation": 1,
          "presentation_rect": [
            472.0,
            965.0,
            198.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_14"
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2068.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            472.0,
            965.0,
            198.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            2098.0,
            40.0,
            22.0
          ],
          "text": "13"
        }
      },
      {
        "box": {
          "id": "obj-162",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            2128.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-163",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2068.0,
            460.0,
            20.0
          ],
          "text": "14 \u00b7 PANNR \u2014 move the image"
        }
      },
      {
        "box": {
          "id": "obj-164",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2098.0,
            69.0,
            22.0
          ],
          "text": "r VIN14"
        }
      },
      {
        "box": {
          "id": "obj-165",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2178.0,
            198.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            472.0,
            989.0,
            198.0,
            130.0
          ],
          "name": "vz.pannr.maxpat",
          "varname": "pannr",
          "comment": "in 0: Video input | in 1: Set the X (horizontal) offset of the image | in 2: Set the Y (vertical) (vertical) offset of the image | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2343.0,
            69.0,
            22.0
          ],
          "text": "s VFX14"
        }
      },
      {
        "box": {
          "id": "obj-167",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            472.0,
            1125.0,
            198.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
            178.0,
            20.0
          ],
          "text": "15 \u00b7 Vizzie TRANS4MR",
          "presentation": 1,
          "presentation_rect": [
            694.0,
            965.0,
            270.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_15"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            2068.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            694.0,
            965.0,
            270.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            2098.0,
            40.0,
            22.0
          ],
          "text": "14"
        }
      },
      {
        "box": {
          "id": "obj-172",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            2128.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-173",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2068.0,
            460.0,
            20.0
          ],
          "text": "15 \u00b7 TRANS4MR \u2014 zoom / rotate / offset in one"
        }
      },
      {
        "box": {
          "id": "obj-174",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2098.0,
            69.0,
            22.0
          ],
          "text": "r VIN15"
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "bpatcher",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2178.0,
            270.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            694.0,
            989.0,
            270.0,
            130.0
          ],
          "name": "vz.trans4mr.maxpat",
          "varname": "trans4mr",
          "comment": "in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | in 4: Set the value for the rotation control | in 5: X offset | in 6: Y offset | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2343.0,
            69.0,
            22.0
          ],
          "text": "s VFX15"
        }
      },
      {
        "box": {
          "id": "obj-177",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            736.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            694.0,
            1125.0,
            270.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-179",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
            195.0,
            20.0
          ],
          "text": "16 \u00b7 Vizzie FRACTALIZR",
          "presentation": 1,
          "presentation_rect": [
            988.0,
            965.0,
            258.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_16"
        }
      },
      {
        "box": {
          "id": "obj-180",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1738.0,
            2068.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            988.0,
            965.0,
            258.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-181",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1738.0,
            2098.0,
            40.0,
            22.0
          ],
          "text": "15"
        }
      },
      {
        "box": {
          "id": "obj-182",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1738.0,
            2128.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-183",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2068.0,
            478.0,
            20.0
          ],
          "text": "16 \u00b7 FRACTALIZR \u2014 meta-image of repeated frames"
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2098.0,
            69.0,
            22.0
          ],
          "text": "r VIN16"
        }
      },
      {
        "box": {
          "id": "obj-185",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2178.0,
            258.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            988.0,
            989.0,
            258.0,
            130.0
          ],
          "name": "vz.fractalizr.maxpat",
          "varname": "fractalizr",
          "comment": "in 0: Video input | in 1: Change the number of columns in the meta-image | in 2: Change the number of rows in the meta-image | in 3: Set the type of tinting applied to frames in the meta-image (0. - .24: color tint color frames, .25 - .49: color tint mono frames, .5 - .74: mono tint color frames, .75 - 1.0: mono tint mono frames) | in 4: Enable/disable tinting the output | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-186",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1340.0,
            2098.0,
            132.0,
            22.0
          ],
          "text": "loadmess 0.3 0.3"
        }
      },
      {
        "box": {
          "id": "obj-187",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1340.0,
            2133.0,
            76.0,
            22.0
          ],
          "text": "unjoin 1"
        }
      },
      {
        "box": {
          "id": "obj-188",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2343.0,
            69.0,
            22.0
          ],
          "text": "s VFX16"
        }
      },
      {
        "box": {
          "id": "obj-189",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
            339.0,
            20.0
          ],
          "text": "loads with inlet 1 \u2192 0.3, inlet 2 \u2192 0.3",
          "presentation": 1,
          "presentation_rect": [
            988.0,
            1125.0,
            258.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-191",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            814.0,
            178.0,
            20.0
          ],
          "text": "17 \u00b7 Vizzie SCRAMBLR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1203.0,
            228.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_17"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2443.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1203.0,
            228.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            2473.0,
            40.0,
            22.0
          ],
          "text": "16"
        }
      },
      {
        "box": {
          "id": "obj-194",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            2503.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2443.0,
            460.0,
            20.0
          ],
          "text": "17 \u00b7 SCRAMBLR \u2014 subdivide and scramble"
        }
      },
      {
        "box": {
          "id": "obj-196",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2473.0,
            69.0,
            22.0
          ],
          "text": "r VIN17"
        }
      },
      {
        "box": {
          "id": "obj-197",
          "maxclass": "bpatcher",
          "numinlets": 6,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2553.0,
            228.0,
            140.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1227.0,
            228.0,
            140.0
          ],
          "name": "vz.scramblr.maxpat",
          "varname": "scramblr",
          "comment": "in 0: Video input | in 1: Number of columns in the output image | in 2: Number of rows in the output image | in 3: Probability that a cell will be updated with new data | in 4: Probability that a cell will be monochromatically tiled | in 5: Set the saturation for the color | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-198",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2728.0,
            69.0,
            22.0
          ],
          "text": "s VFX17"
        }
      },
      {
        "box": {
          "id": "obj-199",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1373.0,
            228.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-201",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
            161.0,
            20.0
          ],
          "text": "18 \u00b7 Vizzie PIXL8R",
          "presentation": 1,
          "presentation_rect": [
            270.0,
            1203.0,
            128.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_18"
        }
      },
      {
        "box": {
          "id": "obj-202",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            2443.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            270.0,
            1203.0,
            128.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-203",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            2473.0,
            40.0,
            22.0
          ],
          "text": "17"
        }
      },
      {
        "box": {
          "id": "obj-204",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            2503.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-205",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2443.0,
            460.0,
            20.0
          ],
          "text": "18 \u00b7 PIXL8R \u2014 pixelate"
        }
      },
      {
        "box": {
          "id": "obj-206",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2473.0,
            69.0,
            22.0
          ],
          "text": "r VIN18"
        }
      },
      {
        "box": {
          "id": "obj-207",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "jit_gl_texture"
          ],
          "patching_rect": [
            640.0,
            2553.0,
            128.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            270.0,
            1227.0,
            128.0,
            130.0
          ],
          "name": "vz.pixl8r.maxpat",
          "varname": "pixl8r",
          "comment": "in 0: Video input | in 1: Horizontal pixillation | in 2: Vertical pixillation | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-208",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            2473.0,
            132.0,
            22.0
          ],
          "text": "loadmess 0.5 0.5"
        }
      },
      {
        "box": {
          "id": "obj-209",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            730.0,
            2508.0,
            76.0,
            22.0
          ],
          "text": "unjoin 1"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2718.0,
            69.0,
            22.0
          ],
          "text": "s VFX18"
        }
      },
      {
        "box": {
          "id": "obj-211",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            339.0,
            20.0
          ],
          "text": "loads with inlet 1 \u2192 0.5, inlet 2 \u2192 0.5",
          "presentation": 1,
          "presentation_rect": [
            270.0,
            1363.0,
            128.0,
            52.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-213",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
            152.0,
            20.0
          ],
          "text": "19 \u00b7 Vizzie FOGGR",
          "presentation": 1,
          "presentation_rect": [
            422.0,
            1203.0,
            188.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1,
          "varname": "TITLE_19"
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            2443.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            422.0,
            1203.0,
            188.0,
            20.0
          ],
          "bgcolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "outlinecolor": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "blinkcolor": [
            1.0,
            0.55,
            0.0,
            0.35
          ]
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            2473.0,
            40.0,
            22.0
          ],
          "text": "18"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            2503.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2443.0,
            460.0,
            20.0
          ],
          "text": "19 \u00b7 FOGGR \u2014 scatter pixels into dust"
        }
      },
      {
        "box": {
          "id": "obj-218",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2473.0,
            69.0,
            22.0
          ],
          "text": "r VIN19"
        }
      },
      {
        "box": {
          "id": "obj-219",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2553.0,
            188.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            422.0,
            1227.0,
            188.0,
            130.0
          ],
          "name": "vz.foggr.maxpat",
          "varname": "foggr",
          "comment": "in 0: Video input | in 1: Change the probability that a pixel will be offset | in 2: Set the range of the horizontal pixel offset | in 3: Set the range of the vertical pixel offset | out 0: Video output",
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1
        }
      },
      {
        "box": {
          "id": "obj-220",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2718.0,
            69.0,
            22.0
          ],
          "text": "s VFX19"
        }
      },
      {
        "box": {
          "id": "obj-221",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            422.0,
            1363.0,
            188.0,
            37.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-222",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2828.0,
            1200.0,
            34.0
          ],
          "text": "ROUTER \u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself"
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2878.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-224",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1470.0,
            2878.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-225",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 19,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2918.0,
            1478.0,
            22.0
          ],
          "text": "gate 19"
        }
      },
      {
        "box": {
          "id": "obj-226",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            110.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN02"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN03"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            270.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN04"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            350.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN05"
        }
      },
      {
        "box": {
          "id": "obj-230",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN06"
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            510.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN07"
        }
      },
      {
        "box": {
          "id": "obj-232",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN08"
        }
      },
      {
        "box": {
          "id": "obj-233",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            670.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN09"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            750.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN10"
        }
      },
      {
        "box": {
          "id": "obj-235",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            830.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN11"
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            910.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN12"
        }
      },
      {
        "box": {
          "id": "obj-237",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            990.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN13"
        }
      },
      {
        "box": {
          "id": "obj-238",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1070.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN14"
        }
      },
      {
        "box": {
          "id": "obj-239",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN15"
        }
      },
      {
        "box": {
          "id": "obj-240",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1230.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN16"
        }
      },
      {
        "box": {
          "id": "obj-241",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN17"
        }
      },
      {
        "box": {
          "id": "obj-242",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1390.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN18"
        }
      },
      {
        "box": {
          "id": "obj-243",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1470.0,
            2973.0,
            69.0,
            22.0
          ],
          "text": "s VIN19"
        }
      },
      {
        "box": {
          "id": "obj-244",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3048.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-245",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            3048.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-246",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX02"
        }
      },
      {
        "box": {
          "id": "obj-247",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX03"
        }
      },
      {
        "box": {
          "id": "obj-248",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            350.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX04"
        }
      },
      {
        "box": {
          "id": "obj-249",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX05"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX06"
        }
      },
      {
        "box": {
          "id": "obj-251",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX07"
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            670.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX08"
        }
      },
      {
        "box": {
          "id": "obj-253",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX09"
        }
      },
      {
        "box": {
          "id": "obj-254",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX10"
        }
      },
      {
        "box": {
          "id": "obj-255",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX11"
        }
      },
      {
        "box": {
          "id": "obj-256",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX12"
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1070.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX13"
        }
      },
      {
        "box": {
          "id": "obj-258",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX14"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1230.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX15"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX16"
        }
      },
      {
        "box": {
          "id": "obj-261",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1390.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX17"
        }
      },
      {
        "box": {
          "id": "obj-262",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1470.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX18"
        }
      },
      {
        "box": {
          "id": "obj-263",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1550.0,
            3048.0,
            69.0,
            22.0
          ],
          "text": "r VFX19"
        }
      },
      {
        "box": {
          "id": "obj-264",
          "maxclass": "newobj",
          "numinlets": 20,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3103.0,
            1558.0,
            22.0
          ],
          "text": "switch 19"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3158.0,
            62.0,
            22.0
          ],
          "text": "s VWET"
        }
      },
      {
        "box": {
          "id": "obj-266",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3218.0,
            800.0,
            20.0
          ],
          "text": "MASTER \u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld"
        }
      },
      {
        "box": {
          "id": "obj-267",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3258.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-268",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            3258.0,
            62.0,
            22.0
          ],
          "text": "r VWET"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            3258.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            700.0,
            316.0,
            300.0,
            22.0
          ],
          "attr": "xfade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-270",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3308.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 1."
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3358.0,
            216.0,
            22.0
          ],
          "text": "jit.gl.layer @blend_enable 0"
        }
      },
      {
        "box": {
          "id": "obj-272",
          "maxclass": "jit.pworld",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            3408.0,
            480.0,
            270.0
          ],
          "presentation": 1,
          "presentation_rect": [
            700.0,
            40.0,
            480.0,
            270.0
          ],
          "erase_color": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-276",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
            59.0,
            20.0
          ],
          "text": "SOURCE",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            16.0,
            200.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-277",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            996.0,
            433.0,
            20.0
          ],
          "text": "drop movies on the player; click a clip to play it",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            144.0,
            360.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-278",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1022.0,
            365.0,
            20.0
          ],
          "text": "webcam (loads off) \u2014 on replaces the movie",
          "presentation": 1,
          "presentation_rect": [
            48.0,
            170.0,
            332.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-279",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1048.0,
            161.0,
            20.0
          ],
          "text": "EFFECT \u2014 click one",
          "presentation": 1,
          "presentation_rect": [
            406.0,
            16.0,
            274.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-280",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1074.0,
            314.0,
            20.0
          ],
          "text": "OUTPUT \u2014 only the chosen effect runs",
          "presentation": 1,
          "presentation_rect": [
            706.0,
            16.0,
            474.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-281",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1100.0,
            407.0,
            20.0
          ],
          "text": "xfade: 0 = dry source, 1 = the effect (loads 1)",
          "presentation": 1,
          "presentation_rect": [
            706.0,
            342.0,
            474.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-282",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            30.0,
            330.0,
            20.0
          ],
          "text": "presentation-only labels (they show in the panels)"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            480.0,
            280.0,
            226.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            100.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            298.0,
            480.0,
            300.0,
            198.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            170.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            606.0,
            480.0,
            250.0,
            157.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            240.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            864.0,
            480.0,
            204.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            310.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1076.0,
            480.0,
            284.0,
            231.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            380.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            721.0,
            230.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            450.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            248.0,
            721.0,
            353.0,
            226.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            520.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            609.0,
            721.0,
            154.0,
            228.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            771.0,
            721.0,
            204.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            983.0,
            721.0,
            276.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            730.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            959.0,
            264.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            800.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            282.0,
            959.0,
            174.0,
            228.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            870.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            464.0,
            959.0,
            214.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-168",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            940.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            686.0,
            959.0,
            286.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-178",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1010.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            980.0,
            959.0,
            274.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1080.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1197.0,
            244.0,
            223.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            262.0,
            1197.0,
            144.0,
            228.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1220.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            414.0,
            1197.0,
            204.0,
            213.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-273",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1290.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            380.0,
            460.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1360.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            10.0,
            294.0,
            460.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-275",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1430.0,
            3718.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            696.0,
            10.0,
            494.0,
            460.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "presentation": 1,
          "fontname": "Monaco",
          "fontsize": 11.0,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "id": "obj-283",
          "text": "v1.0",
          "patching_rect": [
            2520.0,
            1130.0,
            44,
            20.0
          ],
          "presentation_rect": [
            1200.0,
            16.0,
            44.0,
            20.0
          ]
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
            3778.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1370,\n  \"height\": 1445,\n  \"bglocked\": 1,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"VIDEO GEOMETRY SHOOTOUT v1.0 \\u2014 rotate, zoom, mirror, warp, tile and scatter the image. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture.\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        620,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"pl_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        30,\n        120\n      ],\n      \"size\": [\n        360,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"chickens.mp4\",\n              \"filename\": \"chickens.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008532\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"cam_tog\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        430,\n        90\n      ],\n      \"presentation\": [\n        20,\n        168,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"cam_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        430,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1 0\",\n      \"pos\": [\n        520,\n        175\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        520,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_close\": {\n      \"type\": \"message\",\n      \"text\": \"close\",\n      \"pos\": [\n        580,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab @output_texture 1 @automatic 1\",\n      \"pos\": [\n        520,\n        265\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"cam_plus\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        430,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"c_cam\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie\",\n      \"pos\": [\n        660,\n        130\n      ],\n      \"size\": [\n        360,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"src_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        130,\n        255\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"src_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 2\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRC\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 19, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY) and lights the pane title\",\n      \"pos\": [\n        1460,\n        90\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1140,\n        50\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        300,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        400,\n        40,\n        280,\n        410\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 19,\n        \"num_lines_presentation\": 19,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 fx.rota\",\n              \"3 fx.camera\",\n              \"4 fx.dimmap\",\n              \"5 Vizzie KALEIDR\",\n              \"6 Vizzie TESSEL8R\",\n              \"7 Vizzie TWIRLR\",\n              \"8 Vizzie REFLECTR\",\n              \"9 Vizzie FOLDR\",\n              \"10 Vizzie PINCHR\",\n              \"11 Vizzie STRETCHR\",\n              \"12 Vizzie ROTATR\",\n              \"13 Vizzie ZOOMR\",\n              \"14 Vizzie PANNR\",\n              \"15 Vizzie TRANS4MR\",\n              \"16 Vizzie FRACTALIZR\",\n              \"17 Vizzie SCRAMBLR\",\n              \"18 Vizzie PIXL8R\",\n              \"19 Vizzie FOGGR\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"VFX_SELECT\",\n            \"parameter_mmax\": 18,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VFX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"VFX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 19,\n        \"num_lines_presentation\": 19,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1240,\n        50\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1330,\n        50\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_hl\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        1140,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        480,\n        280,\n        226\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 fx.rota\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        101,\n        20\n      ],\n      \"presentation\": [\n        18,\n        486,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        520\n      ],\n      \"presentation\": [\n        18,\n        486,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        500,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 jit.fx.rota \\u2014 rotate (radians) and scale about an anchor\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN02\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.rota @theta 0.5 @zoom 1.3 1.3\",\n      \"pos\": [\n        30,\n        750\n      ],\n      \"presentation\": [\n        18,\n        629,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"theta\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        510,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"zoom\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        533,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"offset\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        556,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"anchor\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        579,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"boundmode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        602,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.rota\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        382,\n        20\n      ],\n      \"presentation\": [\n        18,\n        657,\n        264,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX02\",\n      \"pos\": [\n        30,\n        795\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        298,\n        480,\n        300,\n        198\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 fx.camera\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        306,\n        486,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1206,\n        520\n      ],\n      \"presentation\": [\n        306,\n        486,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1206,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1206,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 jit.fx.camera \\u2014 a virtual camera with motion blur (help-file settings)\",\n      \"pos\": [\n        640,\n        520\n      ],\n      \"size\": [\n        556,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN03\",\n      \"pos\": [\n        640,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.camera @boundmode mirroredrepeat @blur_amount 1.5\",\n      \"pos\": [\n        640,\n        750\n      ],\n      \"presentation\": [\n        306,\n        629,\n        284,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        760,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"zoom\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        306,\n        510,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        780,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"tilt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        306,\n        533,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        800,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"lookat\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        306,\n        556,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        820,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"blur_amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        306,\n        579,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        840,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"boundmode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        306,\n        602,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX03\",\n      \"pos\": [\n        640,\n        795\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        606,\n        480,\n        250,\n        157\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 fx.dimmap\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        614,\n        486,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1920,\n        520\n      ],\n      \"presentation\": [\n        614,\n        486,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1920,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1920,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 jit.fx.dimmap \\u2014 swap or flip the image's dimensions (help-file setting)\",\n      \"pos\": [\n        1346,\n        520\n      ],\n      \"size\": [\n        564,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN04\",\n      \"pos\": [\n        1346,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.dimmap @invert 1 0\",\n      \"pos\": [\n        1346,\n        672\n      ],\n      \"presentation\": [\n        614,\n        560,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1466,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        614,\n        510,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1486,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"map\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        614,\n        533,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.dimmap\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        399,\n        20\n      ],\n      \"presentation\": [\n        614,\n        588,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX04\",\n      \"pos\": [\n        1346,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        864,\n        480,\n        204,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 Vizzie KALEIDR\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        872,\n        486,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        895\n      ],\n      \"presentation\": [\n        872,\n        486,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        500,\n        925\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        955\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 KALEIDR \\u2014 kaleidoscope folding\",\n      \"pos\": [\n        30,\n        895\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN05\",\n      \"pos\": [\n        30,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1005\n      ],\n      \"size\": [\n        188,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        872,\n        510,\n        188,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.kaleidr.maxpat\",\n        \"varname\": \"kaleidr\",\n        \"comment\": \"in 0: Video input | in 1: Set the offset for the horizontal mirroring offset | in 2: Set the offset for the vertical mirroring effect | in 3: Select regular or inverted color outpu | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.kaleidr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the offset for the horizontal mirroring offset | in 2: Set the offset for the vertical mirroring effect | in 3: Select regular or inverted color outpu | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f05_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX05\",\n      \"pos\": [\n        30,\n        1170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        872,\n        646,\n        188,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1076,\n        480,\n        284,\n        231\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 Vizzie TESSEL8R\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1084,\n        486,\n        268,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        895\n      ],\n      \"presentation\": [\n        1084,\n        486,\n        268,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1110,\n        925\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        955\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 TESSEL8R \\u2014 tessellation, mandala-like\",\n      \"pos\": [\n        640,\n        895\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN06\",\n      \"pos\": [\n        640,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        1005\n      ],\n      \"size\": [\n        268,\n        148\n      ],\n      \"inlets\": 7,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        1084,\n        510,\n        268,\n        148\n      ],\n      \"attrs\": {\n        \"name\": \"vz.tessel8r.maxpat\",\n        \"varname\": \"tessel8r\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) origin point for tesselation | in 2: Set the Y (vertical) origin point for tesselation | in 3: Set the X (horizontal) offset point for tesselation | in 4: Set the Y (vertical) offset point for tesselation | in 5: Set the scaled output for the tesselated image | in 6: Set the number of iterations in the tesselation of the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.tessel8r.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) origin point for tesselation | in 2: Set the Y (vertical) origin point for tesselation | in 3: Set the X (horizontal) offset point for tesselation | in 4: Set the Y (vertical) offset point for tesselation | in 5: Set the scaled output for the tesselated image | in 6: Set the number of iterations in the tesselation of the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX06\",\n      \"pos\": [\n        640,\n        1188\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        1084,\n        664,\n        268,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        721,\n        230,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 Vizzie TWIRLR\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        18,\n        727,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        895\n      ],\n      \"presentation\": [\n        18,\n        727,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1720,\n        925\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        955\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 TWIRLR \\u2014 twist around a centre\",\n      \"pos\": [\n        1250,\n        895\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN07\",\n      \"pos\": [\n        1250,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1005\n      ],\n      \"size\": [\n        214,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        751,\n        214,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.twirlr.maxpat\",\n        \"varname\": \"twirlr\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) origin for the effect | in 2: Set the Y (vertical) origin for the effect. | in 3: Set the starting angle of rotation (-1. > 1.) for the twirled image. | in 4: Set the amount of counterclockwise/clockwise twirl for the effect | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.twirlr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) origin for the effect | in 2: Set the Y (vertical) origin for the effect. | in 3: Set the starting angle of rotation (-1. > 1.) for the twirled image. | in 4: Set the amount of counterclockwise/clockwise twirl for the effect | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX07\",\n      \"pos\": [\n        1250,\n        1170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        887,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        248,\n        721,\n        353,\n        226\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 Vizzie REFLECTR\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        256,\n        727,\n        337,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1288\n      ],\n      \"presentation\": [\n        256,\n        727,\n        337,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        500,\n        1318\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1348\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 REFLECTR \\u2014 funhouse-mirror warps\",\n      \"pos\": [\n        30,\n        1288\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN08\",\n      \"pos\": [\n        30,\n        1318\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1398\n      ],\n      \"size\": [\n        337,\n        160\n      ],\n      \"inlets\": 14,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        256,\n        751,\n        337,\n        160\n      ],\n      \"attrs\": {\n        \"name\": \"vz.reflectr.maxpat\",\n        \"varname\": \"reflectr\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) center for warping | in 2: Set the Y (vertical) center for warping | in 3: Bound mode select | in 4: Zoom control | in 5: Enable/disable sine-based image warping | in 6: Sine warp control | in 7: Enable/disable cosine-based image warping | in 8: Cosine warp control | in 9: Enable/disable tangent-based image warping | in 10: Tangent warp control | in 11: Toggle low/high sin warp range | in 12: Toggle low/high cos warp range | in 13: Toggle low/high tan warp range | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.reflectr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) center for warping | in 2: Set the Y (vertical) center for warping | in 3: Bound mode select | in 4: Zoom control | in 5: Enable/disable sine-based image warping | in 6: Sine warp control | in 7: Enable/disable cosine-based image warping | in 8: Cosine warp control | in 9: Enable/disable tangent-based image warping | in 10: Tangent warp control | in 11: Toggle low/high sin warp range | in 12: Toggle low/high cos warp range | in 13: Toggle low/high tan warp range | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX08\",\n      \"pos\": [\n        30,\n        1593\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        256,\n        917,\n        337,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        609,\n        721,\n        154,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 Vizzie FOLDR\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        617,\n        727,\n        138,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1288\n      ],\n      \"presentation\": [\n        617,\n        727,\n        138,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1110,\n        1318\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1348\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 FOLDR \\u2014 fold along two axes\",\n      \"pos\": [\n        640,\n        1288\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN09\",\n      \"pos\": [\n        640,\n        1318\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        1398\n      ],\n      \"size\": [\n        138,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        617,\n        751,\n        138,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.foldr.maxpat\",\n        \"varname\": \"delayr\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) point at which the image will be vertically mirrored | in 2: Set the Y (vertical) point at which the image will be horizontally mirrored | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.foldr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) point at which the image will be vertically mirrored | in 2: Set the Y (vertical) point at which the image will be horizontally mirrored | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX09\",\n      \"pos\": [\n        640,\n        1563\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        617,\n        887,\n        138,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        771,\n        721,\n        204,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 Vizzie PINCHR\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        779,\n        727,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        1288\n      ],\n      \"presentation\": [\n        779,\n        727,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1720,\n        1318\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        1348\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 PINCHR \\u2014 pinch / warp\",\n      \"pos\": [\n        1250,\n        1288\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN10\",\n      \"pos\": [\n        1250,\n        1318\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1398\n      ],\n      \"size\": [\n        188,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        779,\n        751,\n        188,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.pinchr.maxpat\",\n        \"varname\": \"vz.pinchr\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the horizontal origin | in 2: Set the value for the vertical origin | in 3: Set the amount of pinching applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.pinchr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the horizontal origin | in 2: Set the value for the vertical origin | in 3: Set the amount of pinching applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX10\",\n      \"pos\": [\n        1250,\n        1563\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        779,\n        887,\n        188,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        983,\n        721,\n        276,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 Vizzie STRETCHR\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        991,\n        727,\n        260,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        520,\n        1693\n      ],\n      \"presentation\": [\n        991,\n        727,\n        260,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        520,\n        1723\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        520,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 STRETCHR \\u2014 stretch from an origin\",\n      \"pos\": [\n        30,\n        1693\n      ],\n      \"size\": [\n        480,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN11\",\n      \"pos\": [\n        30,\n        1723\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1803\n      ],\n      \"size\": [\n        260,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        991,\n        751,\n        260,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.stretchr.maxpat\",\n        \"varname\": \"stretchr\",\n        \"comment\": \"in 0: Video input | in 1: X (horizontal) origin | in 2: Y (vertical) origin | in 3: Set the amount of horizontal stretching applied to the image. | in 4: Set the amount of vertical stretching applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.stretchr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: X (horizontal) origin | in 2: Y (vertical) origin | in 3: Set the amount of horizontal stretching applied to the image. | in 4: Set the amount of vertical stretching applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.5 0.5 0.3 0.3\",\n      \"pos\": [\n        120,\n        1723\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_uj\": {\n      \"type\": \"newobj\",\n      \"text\": \"unjoin 3\",\n      \"pos\": [\n        120,\n        1758\n      ],\n      \"inlets\": 1,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"f11_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX11\",\n      \"pos\": [\n        30,\n        1968\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads with inlet 1 \\u2192 0.5, inlet 2 \\u2192 0.5, inlet 3 \\u2192 0.3, inlet 4 \\u2192 0.3\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        594,\n        20\n      ],\n      \"presentation\": [\n        991,\n        887,\n        260,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        959,\n        264,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 Vizzie ROTATR\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        965,\n        248,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1130,\n        1693\n      ],\n      \"presentation\": [\n        18,\n        965,\n        248,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1130,\n        1723\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1130,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 ROTATR \\u2014 rotate and offset\",\n      \"pos\": [\n        660,\n        1693\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN12\",\n      \"pos\": [\n        660,\n        1723\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        660,\n        1803\n      ],\n      \"size\": [\n        248,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        989,\n        248,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.rotatr.maxpat\",\n        \"varname\": \"rotatr\",\n        \"comment\": \"in 0: Video input | in 1: Rotation control | in 2: X offset control | in 3: Y offset control | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.rotatr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Rotation control | in 2: X offset control | in 3: Y offset control | in 4: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX12\",\n      \"pos\": [\n        660,\n        1968\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1125,\n        248,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        282,\n        959,\n        174,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 Vizzie ZOOMR\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        290,\n        965,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1740,\n        1693\n      ],\n      \"presentation\": [\n        290,\n        965,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1740,\n        1723\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1740,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 ZOOMR \\u2014 zoom\",\n      \"pos\": [\n        1270,\n        1693\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN13\",\n      \"pos\": [\n        1270,\n        1723\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1270,\n        1803\n      ],\n      \"size\": [\n        158,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        290,\n        989,\n        158,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.zoomr.maxpat\",\n        \"varname\": \"zoomr\",\n        \"comment\": \"in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.zoomr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f13_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX13\",\n      \"pos\": [\n        1270,\n        1968\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        290,\n        1125,\n        158,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        464,\n        959,\n        214,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 Vizzie PANNR\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        472,\n        965,\n        198,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2068\n      ],\n      \"presentation\": [\n        472,\n        965,\n        198,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        500,\n        2098\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2128\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 PANNR \\u2014 move the image\",\n      \"pos\": [\n        30,\n        2068\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN14\",\n      \"pos\": [\n        30,\n        2098\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        2178\n      ],\n      \"size\": [\n        198,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        472,\n        989,\n        198,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.pannr.maxpat\",\n        \"varname\": \"pannr\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) offset of the image | in 2: Set the Y (vertical) (vertical) offset of the image | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.pannr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the X (horizontal) offset of the image | in 2: Set the Y (vertical) (vertical) offset of the image | in 3: Set the behavior to be applied at the border of an image during processing | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f14_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX14\",\n      \"pos\": [\n        30,\n        2343\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        472,\n        1125,\n        198,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        686,\n        959,\n        286,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 Vizzie TRANS4MR\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        694,\n        965,\n        270,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        2068\n      ],\n      \"presentation\": [\n        694,\n        965,\n        270,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1110,\n        2098\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        2128\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 TRANS4MR \\u2014 zoom / rotate / offset in one\",\n      \"pos\": [\n        640,\n        2068\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN15\",\n      \"pos\": [\n        640,\n        2098\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        2178\n      ],\n      \"size\": [\n        270,\n        130\n      ],\n      \"inlets\": 7,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        694,\n        989,\n        270,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.trans4mr.maxpat\",\n        \"varname\": \"trans4mr\",\n        \"comment\": \"in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | in 4: Set the value for the rotation control | in 5: X offset | in 6: Y offset | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.trans4mr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Zoom control | in 2: Toggle low/high zoom data range | in 3: Set the behavior to be applied at the border of an image during processing | in 4: Set the value for the rotation control | in 5: X offset | in 6: Y offset | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f15_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX15\",\n      \"pos\": [\n        640,\n        2343\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        694,\n        1125,\n        270,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        980,\n        959,\n        274,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 Vizzie FRACTALIZR\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        988,\n        965,\n        258,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1738,\n        2068\n      ],\n      \"presentation\": [\n        988,\n        965,\n        258,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        1738,\n        2098\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1738,\n        2128\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 FRACTALIZR \\u2014 meta-image of repeated frames\",\n      \"pos\": [\n        1250,\n        2068\n      ],\n      \"size\": [\n        478,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN16\",\n      \"pos\": [\n        1250,\n        2098\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        2178\n      ],\n      \"size\": [\n        258,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        988,\n        989,\n        258,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.fractalizr.maxpat\",\n        \"varname\": \"fractalizr\",\n        \"comment\": \"in 0: Video input | in 1: Change the number of columns in the meta-image | in 2: Change the number of rows in the meta-image | in 3: Set the type of tinting applied to frames in the meta-image (0. - .24: color tint color frames, .25 - .49: color tint mono frames, .5 - .74: mono tint color frames, .75 - 1.0: mono tint mono frames) | in 4: Enable/disable tinting the output | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.fractalizr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Change the number of columns in the meta-image | in 2: Change the number of rows in the meta-image | in 3: Set the type of tinting applied to frames in the meta-image (0. - .24: color tint color frames, .25 - .49: color tint mono frames, .5 - .74: mono tint color frames, .75 - 1.0: mono tint mono frames) | in 4: Enable/disable tinting the output | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f16_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.3 0.3\",\n      \"pos\": [\n        1340,\n        2098\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_uj\": {\n      \"type\": \"newobj\",\n      \"text\": \"unjoin 1\",\n      \"pos\": [\n        1340,\n        2133\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f16_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX16\",\n      \"pos\": [\n        1250,\n        2343\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads with inlet 1 \\u2192 0.3, inlet 2 \\u2192 0.3\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        339,\n        20\n      ],\n      \"presentation\": [\n        988,\n        1125,\n        258,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1197,\n        244,\n        223\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 Vizzie SCRAMBLR\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1203,\n        228,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2443\n      ],\n      \"presentation\": [\n        18,\n        1203,\n        228,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        500,\n        2473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2503\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 SCRAMBLR \\u2014 subdivide and scramble\",\n      \"pos\": [\n        30,\n        2443\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN17\",\n      \"pos\": [\n        30,\n        2473\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        2553\n      ],\n      \"size\": [\n        228,\n        140\n      ],\n      \"inlets\": 6,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1227,\n        228,\n        140\n      ],\n      \"attrs\": {\n        \"name\": \"vz.scramblr.maxpat\",\n        \"varname\": \"scramblr\",\n        \"comment\": \"in 0: Video input | in 1: Number of columns in the output image | in 2: Number of rows in the output image | in 3: Probability that a cell will be updated with new data | in 4: Probability that a cell will be monochromatically tiled | in 5: Set the saturation for the color | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.scramblr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Number of columns in the output image | in 2: Number of rows in the output image | in 3: Probability that a cell will be updated with new data | in 4: Probability that a cell will be monochromatically tiled | in 5: Set the saturation for the color | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f17_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX17\",\n      \"pos\": [\n        30,\n        2728\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1373,\n        228,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        262,\n        1197,\n        144,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 Vizzie PIXL8R\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        270,\n        1203,\n        128,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        2443\n      ],\n      \"presentation\": [\n        270,\n        1203,\n        128,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        1110,\n        2473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        2503\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 PIXL8R \\u2014 pixelate\",\n      \"pos\": [\n        640,\n        2443\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN18\",\n      \"pos\": [\n        640,\n        2473\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        2553\n      ],\n      \"size\": [\n        128,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"jit_gl_texture\"\n      ],\n      \"presentation\": [\n        270,\n        1227,\n        128,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.pixl8r.maxpat\",\n        \"varname\": \"pixl8r\",\n        \"comment\": \"in 0: Video input | in 1: Horizontal pixillation | in 2: Vertical pixillation | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.pixl8r.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Horizontal pixillation | in 2: Vertical pixillation | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f18_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.5 0.5\",\n      \"pos\": [\n        730,\n        2473\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_uj\": {\n      \"type\": \"newobj\",\n      \"text\": \"unjoin 1\",\n      \"pos\": [\n        730,\n        2508\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f18_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX18\",\n      \"pos\": [\n        640,\n        2718\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads with inlet 1 \\u2192 0.5, inlet 2 \\u2192 0.5\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        339,\n        20\n      ],\n      \"presentation\": [\n        270,\n        1363,\n        128,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        414,\n        1197,\n        204,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f19_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 Vizzie FOGGR\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        422,\n        1203,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_19\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        2443\n      ],\n      \"presentation\": [\n        422,\n        1203,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f19_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"18\",\n      \"pos\": [\n        1720,\n        2473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        2503\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 FOGGR \\u2014 scatter pixels into dust\",\n      \"pos\": [\n        1250,\n        2443\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN19\",\n      \"pos\": [\n        1250,\n        2473\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        2553\n      ],\n      \"size\": [\n        188,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        422,\n        1227,\n        188,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.foggr.maxpat\",\n        \"varname\": \"foggr\",\n        \"comment\": \"in 0: Video input | in 1: Change the probability that a pixel will be offset | in 2: Set the range of the horizontal pixel offset | in 3: Set the range of the vertical pixel offset | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.foggr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Change the probability that a pixel will be offset | in 2: Set the range of the horizontal pixel offset | in 3: Set the range of the vertical pixel offset | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f19_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX19\",\n      \"pos\": [\n        1250,\n        2718\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        422,\n        1363,\n        188,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_route\": {\n      \"type\": \"comment\",\n      \"text\": \"ROUTER \\u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself\",\n      \"pos\": [\n        30,\n        2828\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2878\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"g_rsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        1470,\n        2878\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 19\",\n      \"pos\": [\n        30,\n        2918\n      ],\n      \"size\": [\n        1478,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 19,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"g_s2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN02\",\n      \"pos\": [\n        110,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s3\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN03\",\n      \"pos\": [\n        190,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s4\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN04\",\n      \"pos\": [\n        270,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s5\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN05\",\n      \"pos\": [\n        350,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s6\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN06\",\n      \"pos\": [\n        430,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s7\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN07\",\n      \"pos\": [\n        510,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s8\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN08\",\n      \"pos\": [\n        590,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s9\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN09\",\n      \"pos\": [\n        670,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s10\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN10\",\n      \"pos\": [\n        750,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s11\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN11\",\n      \"pos\": [\n        830,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s12\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN12\",\n      \"pos\": [\n        910,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s13\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN13\",\n      \"pos\": [\n        990,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s14\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN14\",\n      \"pos\": [\n        1070,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s15\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN15\",\n      \"pos\": [\n        1150,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s16\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN16\",\n      \"pos\": [\n        1230,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s17\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN17\",\n      \"pos\": [\n        1310,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s18\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN18\",\n      \"pos\": [\n        1390,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s19\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN19\",\n      \"pos\": [\n        1470,\n        2973\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"sw_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3048\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        110,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX02\",\n      \"pos\": [\n        190,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX03\",\n      \"pos\": [\n        270,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX04\",\n      \"pos\": [\n        350,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX05\",\n      \"pos\": [\n        430,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX06\",\n      \"pos\": [\n        510,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX07\",\n      \"pos\": [\n        590,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX08\",\n      \"pos\": [\n        670,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX09\",\n      \"pos\": [\n        750,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX10\",\n      \"pos\": [\n        830,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX11\",\n      \"pos\": [\n        910,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX12\",\n      \"pos\": [\n        990,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX13\",\n      \"pos\": [\n        1070,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX14\",\n      \"pos\": [\n        1150,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX15\",\n      \"pos\": [\n        1230,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX16\",\n      \"pos\": [\n        1310,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX17\",\n      \"pos\": [\n        1390,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX18\",\n      \"pos\": [\n        1470,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r19\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX19\",\n      \"pos\": [\n        1550,\n        3048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wet_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 19\",\n      \"pos\": [\n        30,\n        3103\n      ],\n      \"size\": [\n        1558,\n        22\n      ],\n      \"inlets\": 20,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VWET\",\n      \"pos\": [\n        30,\n        3158\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld\",\n      \"pos\": [\n        30,\n        3218\n      ],\n      \"size\": [\n        800,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"m_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        30,\n        3258\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_rwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VWET\",\n      \"pos\": [\n        110,\n        3258\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf_ui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        3258\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        700,\n        316,\n        300,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 1.\",\n      \"pos\": [\n        30,\n        3308\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"m_layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer @blend_enable 0\",\n      \"pos\": [\n        30,\n        3358\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"pworld\": {\n      \"type\": \"jit.pworld\",\n      \"pos\": [\n        30,\n        3408\n      ],\n      \"size\": [\n        480,\n        270\n      ],\n      \"attrs\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        700,\n        40,\n        480,\n        270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        380,\n        460\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1360,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        396,\n        10,\n        294,\n        460\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_out_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1430,\n        3718\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        696,\n        10,\n        494,\n        460\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop movies on the player; click a clip to play it\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        433,\n        20\n      ],\n      \"presentation\": [\n        20,\n        144,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_cam_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam (loads off) \\u2014 on replaces the movie\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        48,\n        170,\n        332,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT \\u2014 click one\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        406,\n        16,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_out_title\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT \\u2014 only the chosen effect runs\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        314,\n        20\n      ],\n      \"presentation\": [\n        706,\n        16,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_xf_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"xfade: 0 = dry source, 1 = the effect (loads 1)\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        407,\n        20\n      ],\n      \"presentation\": [\n        706,\n        342,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"v1_0\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        2520,\n        1130\n      ],\n      \"text\": \"v1.0\",\n      \"size\": [\n        44,\n        20\n      ],\n      \"presentation\": [\n        1200,\n        16,\n        44,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"pl_lm\",\n      0,\n      \"playlist\",\n      0\n    ],\n    [\n      \"cam_tog\",\n      0,\n      \"cam_t\",\n      0\n    ],\n    [\n      \"cam_t\",\n      1,\n      \"cam_sel\",\n      0\n    ],\n    [\n      \"cam_t\",\n      0,\n      \"cam_plus\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      0,\n      \"cam_open\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      1,\n      \"cam_close\",\n      0\n    ],\n    [\n      \"cam_open\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"cam_close\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"src_lm\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"cam_plus\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"src_sw\",\n      1\n    ],\n    [\n      \"cam_grab\",\n      0,\n      \"src_sw\",\n      2\n    ],\n    [\n      \"src_sw\",\n      0,\n      \"s_vsrc\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"lm_hl\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rin\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c1\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c2\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c3\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c4\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sout\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rin\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c2\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c3\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c4\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sout\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rin\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sout\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rin\",\n      0,\n      \"f05_bp\",\n      0\n    ],\n    [\n      \"f05_bp\",\n      0,\n      \"f05_sout\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rin\",\n      0,\n      \"f06_bp\",\n      0\n    ],\n    [\n      \"f06_bp\",\n      0,\n      \"f06_sout\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rin\",\n      0,\n      \"f07_bp\",\n      0\n    ],\n    [\n      \"f07_bp\",\n      0,\n      \"f07_sout\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rin\",\n      0,\n      \"f08_bp\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      0,\n      \"f08_sout\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rin\",\n      0,\n      \"f09_bp\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      0,\n      \"f09_sout\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rin\",\n      0,\n      \"f10_bp\",\n      0\n    ],\n    [\n      \"f10_bp\",\n      0,\n      \"f10_sout\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rin\",\n      0,\n      \"f11_bp\",\n      0\n    ],\n    [\n      \"f11_lm\",\n      0,\n      \"f11_uj\",\n      0\n    ],\n    [\n      \"f11_uj\",\n      0,\n      \"f11_bp\",\n      1\n    ],\n    [\n      \"f11_uj\",\n      1,\n      \"f11_bp\",\n      2\n    ],\n    [\n      \"f11_uj\",\n      2,\n      \"f11_bp\",\n      3\n    ],\n    [\n      \"f11_uj\",\n      3,\n      \"f11_bp\",\n      4\n    ],\n    [\n      \"f11_bp\",\n      0,\n      \"f11_sout\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rin\",\n      0,\n      \"f12_bp\",\n      0\n    ],\n    [\n      \"f12_bp\",\n      0,\n      \"f12_sout\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rin\",\n      0,\n      \"f13_bp\",\n      0\n    ],\n    [\n      \"f13_bp\",\n      0,\n      \"f13_sout\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rin\",\n      0,\n      \"f14_bp\",\n      0\n    ],\n    [\n      \"f14_bp\",\n      0,\n      \"f14_sout\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rin\",\n      0,\n      \"f15_bp\",\n      0\n    ],\n    [\n      \"f15_bp\",\n      0,\n      \"f15_sout\",\n      0\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_rin\",\n      0,\n      \"f16_bp\",\n      0\n    ],\n    [\n      \"f16_lm\",\n      0,\n      \"f16_uj\",\n      0\n    ],\n    [\n      \"f16_uj\",\n      0,\n      \"f16_bp\",\n      1\n    ],\n    [\n      \"f16_uj\",\n      1,\n      \"f16_bp\",\n      2\n    ],\n    [\n      \"f16_bp\",\n      0,\n      \"f16_sout\",\n      0\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_rin\",\n      0,\n      \"f17_bp\",\n      0\n    ],\n    [\n      \"f17_bp\",\n      0,\n      \"f17_sout\",\n      0\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_rin\",\n      0,\n      \"f18_bp\",\n      0\n    ],\n    [\n      \"f18_lm\",\n      0,\n      \"f18_uj\",\n      0\n    ],\n    [\n      \"f18_uj\",\n      0,\n      \"f18_bp\",\n      1\n    ],\n    [\n      \"f18_uj\",\n      1,\n      \"f18_bp\",\n      2\n    ],\n    [\n      \"f18_bp\",\n      0,\n      \"f18_sout\",\n      0\n    ],\n    [\n      \"f19_tbtn\",\n      0,\n      \"f19_tsel\",\n      0\n    ],\n    [\n      \"f19_tsel\",\n      0,\n      \"f19_tsend\",\n      0\n    ],\n    [\n      \"f19_rin\",\n      0,\n      \"f19_bp\",\n      0\n    ],\n    [\n      \"f19_bp\",\n      0,\n      \"f19_sout\",\n      0\n    ],\n    [\n      \"g_rsel\",\n      0,\n      \"gate\",\n      0\n    ],\n    [\n      \"g_rsrc\",\n      0,\n      \"gate\",\n      1\n    ],\n    [\n      \"gate\",\n      1,\n      \"g_s2\",\n      0\n    ],\n    [\n      \"gate\",\n      2,\n      \"g_s3\",\n      0\n    ],\n    [\n      \"gate\",\n      3,\n      \"g_s4\",\n      0\n    ],\n    [\n      \"gate\",\n      4,\n      \"g_s5\",\n      0\n    ],\n    [\n      \"gate\",\n      5,\n      \"g_s6\",\n      0\n    ],\n    [\n      \"gate\",\n      6,\n      \"g_s7\",\n      0\n    ],\n    [\n      \"gate\",\n      7,\n      \"g_s8\",\n      0\n    ],\n    [\n      \"gate\",\n      8,\n      \"g_s9\",\n      0\n    ],\n    [\n      \"gate\",\n      9,\n      \"g_s10\",\n      0\n    ],\n    [\n      \"gate\",\n      10,\n      \"g_s11\",\n      0\n    ],\n    [\n      \"gate\",\n      11,\n      \"g_s12\",\n      0\n    ],\n    [\n      \"gate\",\n      12,\n      \"g_s13\",\n      0\n    ],\n    [\n      \"gate\",\n      13,\n      \"g_s14\",\n      0\n    ],\n    [\n      \"gate\",\n      14,\n      \"g_s15\",\n      0\n    ],\n    [\n      \"gate\",\n      15,\n      \"g_s16\",\n      0\n    ],\n    [\n      \"gate\",\n      16,\n      \"g_s17\",\n      0\n    ],\n    [\n      \"gate\",\n      17,\n      \"g_s18\",\n      0\n    ],\n    [\n      \"gate\",\n      18,\n      \"g_s19\",\n      0\n    ],\n    [\n      \"sw_rsel\",\n      0,\n      \"wet_sw\",\n      0\n    ],\n    [\n      \"sw_rdry\",\n      0,\n      \"wet_sw\",\n      1\n    ],\n    [\n      \"sw_r2\",\n      0,\n      \"wet_sw\",\n      2\n    ],\n    [\n      \"sw_r3\",\n      0,\n      \"wet_sw\",\n      3\n    ],\n    [\n      \"sw_r4\",\n      0,\n      \"wet_sw\",\n      4\n    ],\n    [\n      \"sw_r5\",\n      0,\n      \"wet_sw\",\n      5\n    ],\n    [\n      \"sw_r6\",\n      0,\n      \"wet_sw\",\n      6\n    ],\n    [\n      \"sw_r7\",\n      0,\n      \"wet_sw\",\n      7\n    ],\n    [\n      \"sw_r8\",\n      0,\n      \"wet_sw\",\n      8\n    ],\n    [\n      \"sw_r9\",\n      0,\n      \"wet_sw\",\n      9\n    ],\n    [\n      \"sw_r10\",\n      0,\n      \"wet_sw\",\n      10\n    ],\n    [\n      \"sw_r11\",\n      0,\n      \"wet_sw\",\n      11\n    ],\n    [\n      \"sw_r12\",\n      0,\n      \"wet_sw\",\n      12\n    ],\n    [\n      \"sw_r13\",\n      0,\n      \"wet_sw\",\n      13\n    ],\n    [\n      \"sw_r14\",\n      0,\n      \"wet_sw\",\n      14\n    ],\n    [\n      \"sw_r15\",\n      0,\n      \"wet_sw\",\n      15\n    ],\n    [\n      \"sw_r16\",\n      0,\n      \"wet_sw\",\n      16\n    ],\n    [\n      \"sw_r17\",\n      0,\n      \"wet_sw\",\n      17\n    ],\n    [\n      \"sw_r18\",\n      0,\n      \"wet_sw\",\n      18\n    ],\n    [\n      \"sw_r19\",\n      0,\n      \"wet_sw\",\n      19\n    ],\n    [\n      \"wet_sw\",\n      0,\n      \"s_vwet\",\n      0\n    ],\n    [\n      \"m_rdry\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_xf_ui\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_rwet\",\n      0,\n      \"m_xf\",\n      1\n    ],\n    [\n      \"m_xf\",\n      0,\n      \"m_layer\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-4",
            0
          ],
          "source": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-6",
            0
          ],
          "source": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-7",
            0
          ],
          "source": [
            "obj-6",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-11",
            0
          ],
          "source": [
            "obj-6",
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
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-9",
            0
          ],
          "source": [
            "obj-7",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            0
          ],
          "source": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            0
          ],
          "source": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            1
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
            "obj-14",
            2
          ],
          "source": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            0
          ],
          "source": [
            "obj-14",
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
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            0
          ],
          "source": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            0
          ],
          "source": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            0
          ],
          "source": [
            "obj-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-28",
            0
          ],
          "source": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-29",
            0
          ],
          "source": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-31",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-34",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-35",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-36",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-32",
            0
          ],
          "source": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-39",
            0
          ],
          "source": [
            "obj-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-43",
            0
          ],
          "source": [
            "obj-42",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-44",
            0
          ],
          "source": [
            "obj-43",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-46",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-50",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-51",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-52",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-53",
            0
          ],
          "source": [
            "obj-47",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-57",
            0
          ],
          "source": [
            "obj-56",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-58",
            0
          ],
          "source": [
            "obj-57",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-61",
            0
          ],
          "source": [
            "obj-60",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-61",
            0
          ],
          "source": [
            "obj-62",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-61",
            0
          ],
          "source": [
            "obj-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-65",
            0
          ],
          "source": [
            "obj-61",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-69",
            0
          ],
          "source": [
            "obj-68",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-70",
            0
          ],
          "source": [
            "obj-69",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-73",
            0
          ],
          "source": [
            "obj-72",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-74",
            0
          ],
          "source": [
            "obj-73",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-79",
            0
          ],
          "source": [
            "obj-78",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-80",
            0
          ],
          "source": [
            "obj-79",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-83",
            0
          ],
          "source": [
            "obj-82",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-84",
            0
          ],
          "source": [
            "obj-83",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-89",
            0
          ],
          "source": [
            "obj-88",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-90",
            0
          ],
          "source": [
            "obj-89",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-93",
            0
          ],
          "source": [
            "obj-92",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-94",
            0
          ],
          "source": [
            "obj-93",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-99",
            0
          ],
          "source": [
            "obj-98",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-100",
            0
          ],
          "source": [
            "obj-99",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-103",
            0
          ],
          "source": [
            "obj-102",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-104",
            0
          ],
          "source": [
            "obj-103",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-109",
            0
          ],
          "source": [
            "obj-108",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-110",
            0
          ],
          "source": [
            "obj-109",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-113",
            0
          ],
          "source": [
            "obj-112",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-114",
            0
          ],
          "source": [
            "obj-113",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-119",
            0
          ],
          "source": [
            "obj-118",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-120",
            0
          ],
          "source": [
            "obj-119",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-123",
            0
          ],
          "source": [
            "obj-122",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-124",
            0
          ],
          "source": [
            "obj-123",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-129",
            0
          ],
          "source": [
            "obj-128",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-130",
            0
          ],
          "source": [
            "obj-129",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            0
          ],
          "source": [
            "obj-132",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-135",
            0
          ],
          "source": [
            "obj-134",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            1
          ],
          "source": [
            "obj-135",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            2
          ],
          "source": [
            "obj-135",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            3
          ],
          "source": [
            "obj-135",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            4
          ],
          "source": [
            "obj-135",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            0
          ],
          "source": [
            "obj-133",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-141",
            0
          ],
          "source": [
            "obj-140",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-142",
            0
          ],
          "source": [
            "obj-141",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-145",
            0
          ],
          "source": [
            "obj-144",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-146",
            0
          ],
          "source": [
            "obj-145",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-151",
            0
          ],
          "source": [
            "obj-150",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-152",
            0
          ],
          "source": [
            "obj-151",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-155",
            0
          ],
          "source": [
            "obj-154",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-156",
            0
          ],
          "source": [
            "obj-155",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-161",
            0
          ],
          "source": [
            "obj-160",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-162",
            0
          ],
          "source": [
            "obj-161",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-165",
            0
          ],
          "source": [
            "obj-164",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-166",
            0
          ],
          "source": [
            "obj-165",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-171",
            0
          ],
          "source": [
            "obj-170",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-172",
            0
          ],
          "source": [
            "obj-171",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-175",
            0
          ],
          "source": [
            "obj-174",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-176",
            0
          ],
          "source": [
            "obj-175",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-181",
            0
          ],
          "source": [
            "obj-180",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-182",
            0
          ],
          "source": [
            "obj-181",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-185",
            0
          ],
          "source": [
            "obj-184",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-187",
            0
          ],
          "source": [
            "obj-186",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-185",
            1
          ],
          "source": [
            "obj-187",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-185",
            2
          ],
          "source": [
            "obj-187",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-188",
            0
          ],
          "source": [
            "obj-185",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-193",
            0
          ],
          "source": [
            "obj-192",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-194",
            0
          ],
          "source": [
            "obj-193",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-197",
            0
          ],
          "source": [
            "obj-196",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-198",
            0
          ],
          "source": [
            "obj-197",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-203",
            0
          ],
          "source": [
            "obj-202",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-204",
            0
          ],
          "source": [
            "obj-203",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-207",
            0
          ],
          "source": [
            "obj-206",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-209",
            0
          ],
          "source": [
            "obj-208",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-207",
            1
          ],
          "source": [
            "obj-209",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-207",
            2
          ],
          "source": [
            "obj-209",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-210",
            0
          ],
          "source": [
            "obj-207",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-215",
            0
          ],
          "source": [
            "obj-214",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-216",
            0
          ],
          "source": [
            "obj-215",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-219",
            0
          ],
          "source": [
            "obj-218",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-220",
            0
          ],
          "source": [
            "obj-219",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-225",
            0
          ],
          "source": [
            "obj-223",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-225",
            1
          ],
          "source": [
            "obj-224",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-226",
            0
          ],
          "source": [
            "obj-225",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-227",
            0
          ],
          "source": [
            "obj-225",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-228",
            0
          ],
          "source": [
            "obj-225",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-229",
            0
          ],
          "source": [
            "obj-225",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-230",
            0
          ],
          "source": [
            "obj-225",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-231",
            0
          ],
          "source": [
            "obj-225",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-232",
            0
          ],
          "source": [
            "obj-225",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-233",
            0
          ],
          "source": [
            "obj-225",
            8
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-234",
            0
          ],
          "source": [
            "obj-225",
            9
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-235",
            0
          ],
          "source": [
            "obj-225",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-236",
            0
          ],
          "source": [
            "obj-225",
            11
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-237",
            0
          ],
          "source": [
            "obj-225",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-238",
            0
          ],
          "source": [
            "obj-225",
            13
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-239",
            0
          ],
          "source": [
            "obj-225",
            14
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-240",
            0
          ],
          "source": [
            "obj-225",
            15
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-241",
            0
          ],
          "source": [
            "obj-225",
            16
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-242",
            0
          ],
          "source": [
            "obj-225",
            17
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-243",
            0
          ],
          "source": [
            "obj-225",
            18
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            0
          ],
          "source": [
            "obj-244",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            1
          ],
          "source": [
            "obj-245",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            2
          ],
          "source": [
            "obj-246",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            3
          ],
          "source": [
            "obj-247",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            4
          ],
          "source": [
            "obj-248",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            5
          ],
          "source": [
            "obj-249",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            6
          ],
          "source": [
            "obj-250",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            7
          ],
          "source": [
            "obj-251",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            8
          ],
          "source": [
            "obj-252",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            9
          ],
          "source": [
            "obj-253",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            10
          ],
          "source": [
            "obj-254",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            11
          ],
          "source": [
            "obj-255",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            12
          ],
          "source": [
            "obj-256",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            13
          ],
          "source": [
            "obj-257",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            14
          ],
          "source": [
            "obj-258",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            15
          ],
          "source": [
            "obj-259",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            16
          ],
          "source": [
            "obj-260",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            17
          ],
          "source": [
            "obj-261",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            18
          ],
          "source": [
            "obj-262",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-264",
            19
          ],
          "source": [
            "obj-263",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-265",
            0
          ],
          "source": [
            "obj-264",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-270",
            0
          ],
          "source": [
            "obj-267",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-270",
            0
          ],
          "source": [
            "obj-269",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-270",
            1
          ],
          "source": [
            "obj-268",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-271",
            0
          ],
          "source": [
            "obj-270",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1,
    "bglocked": 1
  }
}
