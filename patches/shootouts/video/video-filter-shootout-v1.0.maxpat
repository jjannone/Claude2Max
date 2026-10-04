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
      1366.0,
      1051.0
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
          "text": "VIDEO FILTER SHOOTOUT v1.0 \u2014 blur, sharpen, smoothing and edge detection. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 13, conventional order. The v8 maps item index \u2192 slot number (1 = DRY) and lights the pane title"
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
            281.0
          ],
          "num_lines_patching": 13,
          "num_lines_presentation": 13,
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
                "2 fx.cf.gaussian",
                "3 fx.cf.directional",
                "4 fx.cf.radial",
                "5 fx.cf.tiltshift",
                "6 fx.cf.sharpen",
                "7 fx.cf.bilateral",
                "8 fx.cf.kuwahara",
                "9 fx.sobel",
                "10 fx.brass",
                "11 Vizzie EMBOSSR",
                "12 Vizzie SKETCHR",
                "13 Vizzie TRACR"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "VFX_SELECT",
              "parameter_mmax": 12,
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
            161.0,
            20.0
          ],
          "text": "2 \u00b7 fx.cf.gaussian",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            386.0,
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
            546.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            386.0,
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
          "id": "obj-28",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            546.0,
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
            546.0,
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
            506.0,
            20.0
          ],
          "text": "2 \u00b7 jit.fx.cf.gaussian \u2014 gaussian blur (help file sweeps amt 0\u2013100)"
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
            672.0,
            209.0,
            22.0
          ],
          "text": "jit.fx.cf.gaussian @amt 20.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            437.0,
            234.0,
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
            410.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            717.0,
            69.0,
            22.0
          ],
          "text": "s VFX02"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            86.0,
            186.0,
            20.0
          ],
          "text": "3 \u00b7 fx.cf.directional",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            386.0,
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
          "varname": "TITLE_03"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1231.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            386.0,
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
          "id": "obj-38",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1231.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
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
            1231.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            686.0,
            520.0,
            535.0,
            20.0
          ],
          "text": "3 \u00b7 jit.fx.cf.directional \u2014 directional blur (help file sweeps amt 0\u20135)"
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            686.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN03"
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            686.0,
            672.0,
            300.0,
            22.0
          ],
          "text": "jit.fx.cf.directional @amt 2. @angle 45.",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            460.0,
            234.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            806.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            410.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            826.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            433.0,
            234.0,
            22.0
          ],
          "attr": "angle",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            686.0,
            717.0,
            69.0,
            22.0
          ],
          "text": "s VFX03"
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            144.0,
            20.0
          ],
          "text": "4 \u00b7 fx.cf.radial",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            386.0,
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
          "id": "obj-48",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1841.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            386.0,
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
          "id": "obj-49",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1841.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1841.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1371.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "4 \u00b7 jit.fx.cf.radial \u2014 radial or spin blur around a centre"
        }
      },
      {
        "box": {
          "id": "obj-52",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1371.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN04"
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1371.0,
            698.0,
            188.0,
            22.0
          ],
          "text": "jit.fx.cf.radial @amt 1.",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            483.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1491.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            410.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1511.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            433.0,
            234.0,
            22.0
          ],
          "attr": "center",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1531.0,
            642.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            456.0,
            234.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1371.0,
            743.0,
            69.0,
            22.0
          ],
          "text": "s VFX04"
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
            2520.0,
            138.0,
            169.0,
            20.0
          ],
          "text": "5 \u00b7 fx.cf.tiltshift",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            386.0,
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
          "varname": "TITLE_05"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            546.0,
            843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            386.0,
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
          "id": "obj-61",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            546.0,
            873.0,
            40.0,
            22.0
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            546.0,
            903.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            843.0,
            506.0,
            20.0
          ],
          "text": "5 \u00b7 jit.fx.cf.tiltshift \u2014 tilt-shift: sharp band, blurred around it"
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            873.0,
            69.0,
            22.0
          ],
          "text": "r VIN05"
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1073.0,
            153.0,
            22.0
          ],
          "text": "jit.fx.cf.tiltshift",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            529.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            913.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            410.0,
            234.0,
            22.0
          ],
          "attr": "blur_amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            939.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            433.0,
            234.0,
            22.0
          ],
          "attr": "slope",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            965.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            456.0,
            234.0,
            22.0
          ],
          "attr": "center",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            991.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            479.0,
            234.0,
            22.0
          ],
          "attr": "angle",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            1017.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            502.0,
            234.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1118.0,
            69.0,
            22.0
          ],
          "text": "s VFX05"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            152.0,
            20.0
          ],
          "text": "6 \u00b7 fx.cf.sharpen",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            386.0,
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
          "varname": "TITLE_06"
        }
      },
      {
        "box": {
          "id": "obj-74",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1156.0,
            843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            386.0,
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
          "id": "obj-75",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1156.0,
            873.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1156.0,
            903.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            686.0,
            843.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 jit.fx.cf.sharpen \u2014 sharpening (amt \u00d7 4 in the shader)"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            686.0,
            873.0,
            69.0,
            22.0
          ],
          "text": "r VIN06"
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            686.0,
            995.0,
            202.0,
            22.0
          ],
          "text": "jit.fx.cf.sharpen @amt 0.5",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            437.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            806.0,
            913.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            410.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            686.0,
            1040.0,
            69.0,
            22.0
          ],
          "text": "s VFX06"
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            190.0,
            169.0,
            20.0
          ],
          "text": "7 \u00b7 fx.cf.bilateral",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            581.0,
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
          "varname": "TITLE_07"
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1870.0,
            843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            581.0,
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
          "id": "obj-85",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1870.0,
            873.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1870.0,
            903.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1296.0,
            843.0,
            564.0,
            20.0
          ],
          "text": "7 \u00b7 jit.fx.cf.bilateral \u2014 edge-preserving bilateral smoothing (no settings)"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1296.0,
            873.0,
            69.0,
            22.0
          ],
          "text": "r VIN07"
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1296.0,
            995.0,
            153.0,
            22.0
          ],
          "text": "jit.fx.cf.bilateral",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            609.0,
            234.0,
            22.0
          ]
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
            1296.0,
            1040.0,
            69.0,
            22.0
          ],
          "text": "s VFX07"
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            161.0,
            20.0
          ],
          "text": "8 \u00b7 fx.cf.kuwahara",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            581.0,
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
          "varname": "TITLE_08"
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            553.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            581.0,
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
          "id": "obj-94",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            553.0,
            1248.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            553.0,
            1278.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1218.0,
            513.0,
            20.0
          ],
          "text": "8 \u00b7 jit.fx.cf.kuwahara \u2014 anisotropic Kuwahara: a painterly smoothing"
        }
      },
      {
        "box": {
          "id": "obj-97",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1248.0,
            69.0,
            22.0
          ],
          "text": "r VIN08"
        }
      },
      {
        "box": {
          "id": "obj-98",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1467.0,
            146.0,
            22.0
          ],
          "text": "jit.fx.cf.kuwahara",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            701.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-99",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_gl_texture",
            ""
          ],
          "patching_rect": [
            30.0,
            1288.0,
            272.0,
            22.0
          ],
          "text": "jit.gl.texture @adapt 0 @dim 640 360"
        }
      },
      {
        "box": {
          "id": "obj-100",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            1333.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            605.0,
            234.0,
            22.0
          ],
          "attr": "kernel_size",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            1359.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            628.0,
            234.0,
            22.0
          ],
          "attr": "sharpness",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-102",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            1385.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            651.0,
            234.0,
            22.0
          ],
          "attr": "hardness",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            1411.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            674.0,
            234.0,
            22.0
          ],
          "attr": "pre_blur",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            242.0,
            628.0,
            20.0
          ],
          "text": "input downsampled to 640 \u00d7 360 first (its cost grows with the frame size)",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            729.0,
            234.0,
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
          "id": "obj-105",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1512.0,
            69.0,
            22.0
          ],
          "text": "s VFX08"
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
            268.0,
            110.0,
            20.0
          ],
          "text": "9 \u00b7 fx.sobel",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            581.0,
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
            1163.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            581.0,
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
          "id": "obj-109",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1163.0,
            1248.0,
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
            1163.0,
            1278.0,
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
            693.0,
            1218.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 jit.fx.sobel \u2014 Sobel edge detection"
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
            693.0,
            1248.0,
            69.0,
            22.0
          ],
          "text": "r VIN09"
        }
      },
      {
        "box": {
          "id": "obj-113",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            693.0,
            1370.0,
            104.0,
            22.0
          ],
          "text": "jit.fx.sobel",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            632.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            813.0,
            1288.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            605.0,
            234.0,
            22.0
          ],
          "attr": "threshold",
          "text_width": 110.0
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
            294.0,
            390.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.sobel",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            660.0,
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
          "id": "obj-116",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            693.0,
            1415.0,
            69.0,
            22.0
          ],
          "text": "s VFX09"
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            320.0,
            118.0,
            20.0
          ],
          "text": "10 \u00b7 fx.brass",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            581.0,
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
          "varname": "TITLE_10"
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1773.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            581.0,
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
          "id": "obj-120",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1773.0,
            1248.0,
            40.0,
            22.0
          ],
          "text": "9"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1773.0,
            1278.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-122",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1303.0,
            1218.0,
            460.0,
            20.0
          ],
          "text": "10 \u00b7 jit.fx.brass \u2014 emboss (help file sweeps width 1\u20135)"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1303.0,
            1248.0,
            69.0,
            22.0
          ],
          "text": "r VIN10"
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1303.0,
            1370.0,
            174.0,
            22.0
          ],
          "text": "jit.fx.brass @width 2.",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            655.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-125",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1423.0,
            1288.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            605.0,
            284.0,
            22.0
          ],
          "attr": "width",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1443.0,
            1314.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            628.0,
            284.0,
            22.0
          ],
          "attr": "offset",
          "text_width": 110.0
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
            346.0,
            390.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.brass",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            683.0,
            284.0,
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
          "id": "obj-128",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1303.0,
            1415.0,
            69.0,
            22.0
          ],
          "text": "s VFX10"
        }
      },
      {
        "box": {
          "id": "obj-130",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            372.0,
            169.0,
            20.0
          ],
          "text": "11 \u00b7 Vizzie EMBOSSR",
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            581.0,
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
          "varname": "TITLE_11"
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1612.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            581.0,
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
          "id": "obj-132",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1642.0,
            40.0,
            22.0
          ],
          "text": "10"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            1672.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-134",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1612.0,
            460.0,
            20.0
          ],
          "text": "11 \u00b7 EMBOSSR \u2014 embossed-image look"
        }
      },
      {
        "box": {
          "id": "obj-135",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1642.0,
            69.0,
            22.0
          ],
          "text": "r VIN11"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "bpatcher",
          "numinlets": 8,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1722.0,
            248.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            605.0,
            248.0,
            130.0
          ],
          "name": "vz.embossr.maxpat",
          "varname": "embossr",
          "comment": "in 0: Video input | in 1: Output tint Red input | in 2: Output tint Green input | in 3: Output tint Blue input | in 4: Set Alpha value for the embossing mask | in 5: Set Red value for the embossing mask | in 6: Set Green value for the embossing mask | in 7: Set Blue value for the embossing mask | out 0: Video output",
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
          "id": "obj-137",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1887.0,
            69.0,
            22.0
          ],
          "text": "s VFX11"
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            398.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            741.0,
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
          "id": "obj-140",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            424.0,
            169.0,
            20.0
          ],
          "text": "12 \u00b7 Vizzie SKETCHR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            809.0,
            177.0,
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
          "id": "obj-141",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1612.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            809.0,
            177.0,
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
          "id": "obj-142",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1642.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1672.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-144",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1612.0,
            460.0,
            20.0
          ],
          "text": "12 \u00b7 SKETCHR \u2014 line drawing from edges"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1642.0,
            69.0,
            22.0
          ],
          "text": "r VIN12"
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1722.0,
            177.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            833.0,
            177.0,
            130.0
          ],
          "name": "vz.sketchr.maxpat",
          "varname": "sketchr",
          "comment": "in 0: Video input | in 1: Set the value for the contrast control | in 2: Set the edge detection threshold | in 3: Select the draw mode | out 0: Video output",
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
          "id": "obj-147",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1887.0,
            69.0,
            22.0
          ],
          "text": "s VFX12"
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            450.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            969.0,
            177.0,
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
          "id": "obj-150",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
            152.0,
            20.0
          ],
          "text": "13 \u00b7 Vizzie TRACR",
          "presentation": 1,
          "presentation_rect": [
            219.0,
            809.0,
            148.0,
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
          "id": "obj-151",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            1612.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            219.0,
            809.0,
            148.0,
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
          "id": "obj-152",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            1642.0,
            40.0,
            22.0
          ],
          "text": "12"
        }
      },
      {
        "box": {
          "id": "obj-153",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            1672.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-154",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1612.0,
            460.0,
            20.0
          ],
          "text": "13 \u00b7 TRACR \u2014 gradient edge detection"
        }
      },
      {
        "box": {
          "id": "obj-155",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1642.0,
            69.0,
            22.0
          ],
          "text": "r VIN13"
        }
      },
      {
        "box": {
          "id": "obj-156",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1722.0,
            148.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            219.0,
            833.0,
            148.0,
            130.0
          ],
          "name": "vz.tracr.maxpat",
          "varname": "vz.tracr",
          "comment": "in 0: Video input | in 1: Set the threshold below which values are set to 0 | in 2: Set the output mode | out 0: Video output",
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
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1887.0,
            69.0,
            22.0
          ],
          "text": "s VFX13"
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            502.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            219.0,
            969.0,
            148.0,
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
            30.0,
            1987.0,
            1200.0,
            34.0
          ],
          "text": "ROUTER \u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself"
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2037.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            2037.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-162",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 13,
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
            ""
          ],
          "patching_rect": [
            30.0,
            2077.0,
            998.0,
            22.0
          ],
          "text": "gate 13"
        }
      },
      {
        "box": {
          "id": "obj-163",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            110.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN02"
        }
      },
      {
        "box": {
          "id": "obj-164",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN03"
        }
      },
      {
        "box": {
          "id": "obj-165",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            270.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN04"
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
            350.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN05"
        }
      },
      {
        "box": {
          "id": "obj-167",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN06"
        }
      },
      {
        "box": {
          "id": "obj-168",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            510.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN07"
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN08"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            670.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN09"
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            750.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN10"
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
            830.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN11"
        }
      },
      {
        "box": {
          "id": "obj-173",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            910.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN12"
        }
      },
      {
        "box": {
          "id": "obj-174",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            990.0,
            2132.0,
            69.0,
            22.0
          ],
          "text": "s VIN13"
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2207.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            2207.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-177",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX02"
        }
      },
      {
        "box": {
          "id": "obj-178",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX03"
        }
      },
      {
        "box": {
          "id": "obj-179",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            350.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX04"
        }
      },
      {
        "box": {
          "id": "obj-180",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX05"
        }
      },
      {
        "box": {
          "id": "obj-181",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX06"
        }
      },
      {
        "box": {
          "id": "obj-182",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX07"
        }
      },
      {
        "box": {
          "id": "obj-183",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            670.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX08"
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
            750.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX09"
        }
      },
      {
        "box": {
          "id": "obj-185",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX10"
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
            910.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX11"
        }
      },
      {
        "box": {
          "id": "obj-187",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX12"
        }
      },
      {
        "box": {
          "id": "obj-188",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1070.0,
            2207.0,
            69.0,
            22.0
          ],
          "text": "r VFX13"
        }
      },
      {
        "box": {
          "id": "obj-189",
          "maxclass": "newobj",
          "numinlets": 14,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2262.0,
            1078.0,
            22.0
          ],
          "text": "switch 13"
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2317.0,
            62.0,
            22.0
          ],
          "text": "s VWET"
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
            30.0,
            2377.0,
            800.0,
            20.0
          ],
          "text": "MASTER \u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2417.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            2417.0,
            62.0,
            22.0
          ],
          "text": "r VWET"
        }
      },
      {
        "box": {
          "id": "obj-194",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2417.0,
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
          "id": "obj-195",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2467.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 1."
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
            2517.0,
            216.0,
            22.0
          ],
          "text": "jit.gl.layer @blend_enable 0"
        }
      },
      {
        "box": {
          "id": "obj-197",
          "maxclass": "jit.pworld",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            2567.0,
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
          "id": "obj-201",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
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
          "id": "obj-202",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
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
          "id": "obj-203",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            580.0,
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
          "id": "obj-204",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
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
          "id": "obj-205",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
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
          "id": "obj-206",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            658.0,
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
          "id": "obj-207",
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
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            380.0,
            250.0,
            93.0
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
          "id": "obj-35",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            100.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            268.0,
            380.0,
            250.0,
            129.0
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
          "id": "obj-46",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            170.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            526.0,
            380.0,
            250.0,
            139.0
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
          "id": "obj-58",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            240.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            784.0,
            380.0,
            250.0,
            185.0
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
          "id": "obj-72",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            310.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            380.0,
            250.0,
            93.0
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
          "id": "obj-82",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            380.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            575.0,
            250.0,
            70.0
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
          "id": "obj-91",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            450.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            268.0,
            575.0,
            250.0,
            218.0
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
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            526.0,
            575.0,
            250.0,
            134.0
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
          "id": "obj-117",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            784.0,
            575.0,
            300.0,
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
          "id": "obj-129",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1092.0,
            575.0,
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
          "id": "obj-139",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            730.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            803.0,
            193.0,
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
          "id": "obj-149",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            800.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            211.0,
            803.0,
            164.0,
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
          "id": "obj-198",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            870.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            380.0,
            360.0
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
          "id": "obj-199",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            940.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            10.0,
            294.0,
            360.0
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
            1010.0,
            2877.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            696.0,
            10.0,
            494.0,
            360.0
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
          "id": "obj-208",
          "text": "v1.0",
          "patching_rect": [
            2520.0,
            688.0,
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
            2937.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1366,\n  \"height\": 1051,\n  \"bglocked\": 1,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"VIDEO FILTER SHOOTOUT v1.0 \\u2014 blur, sharpen, smoothing and edge detection. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture.\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        620,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"pl_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        30,\n        120\n      ],\n      \"size\": [\n        360,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"chickens.mp4\",\n              \"filename\": \"chickens.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008532\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"cam_tog\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        430,\n        90\n      ],\n      \"presentation\": [\n        20,\n        168,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"cam_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        430,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"cam_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1 0\",\n      \"pos\": [\n        520,\n        175\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"cam_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        520,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        48,\n        22\n      ]\n    },\n    \"cam_close\": {\n      \"type\": \"message\",\n      \"text\": \"close\",\n      \"pos\": [\n        580,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"cam_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab @output_texture 1 @automatic 1\",\n      \"pos\": [\n        520,\n        265\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"size\": [\n        293,\n        22\n      ]\n    },\n    \"cam_plus\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        430,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"c_cam\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie\",\n      \"pos\": [\n        660,\n        130\n      ],\n      \"size\": [\n        360,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"src_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        130,\n        255\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"src_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 2\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"s_vsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRC\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 13, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY) and lights the pane title\",\n      \"pos\": [\n        1460,\n        90\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1140,\n        50\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        300,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        400,\n        40,\n        280,\n        281\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 13,\n        \"num_lines_presentation\": 13,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 fx.cf.gaussian\",\n              \"3 fx.cf.directional\",\n              \"4 fx.cf.radial\",\n              \"5 fx.cf.tiltshift\",\n              \"6 fx.cf.sharpen\",\n              \"7 fx.cf.bilateral\",\n              \"8 fx.cf.kuwahara\",\n              \"9 fx.sobel\",\n              \"10 fx.brass\",\n              \"11 Vizzie EMBOSSR\",\n              \"12 Vizzie SKETCHR\",\n              \"13 Vizzie TRACR\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"VFX_SELECT\",\n            \"parameter_mmax\": 12,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VFX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"VFX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 13,\n        \"num_lines_presentation\": 13,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1240,\n        50\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1330,\n        50\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      },\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"lm_hl\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        1140,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        132,\n        22\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        380,\n        250,\n        93\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 fx.cf.gaussian\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        546,\n        520\n      ],\n      \"presentation\": [\n        18,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        546,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        546,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 jit.fx.cf.gaussian \\u2014 gaussian blur (help file sweeps amt 0\\u2013100)\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        506,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN02\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.gaussian @amt 20.\",\n      \"pos\": [\n        30,\n        672\n      ],\n      \"presentation\": [\n        18,\n        437,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        209,\n        22\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        410,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX02\",\n      \"pos\": [\n        30,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        268,\n        380,\n        250,\n        129\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 fx.cf.directional\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        276,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1231,\n        520\n      ],\n      \"presentation\": [\n        276,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1231,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1231,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 jit.fx.cf.directional \\u2014 directional blur (help file sweeps amt 0\\u20135)\",\n      \"pos\": [\n        686,\n        520\n      ],\n      \"size\": [\n        535,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN03\",\n      \"pos\": [\n        686,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.directional @amt 2. @angle 45.\",\n      \"pos\": [\n        686,\n        672\n      ],\n      \"presentation\": [\n        276,\n        460,\n        234,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        300,\n        22\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        806,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        410,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        826,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"angle\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        433,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX03\",\n      \"pos\": [\n        686,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        526,\n        380,\n        250,\n        139\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 fx.cf.radial\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        534,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1841,\n        520\n      ],\n      \"presentation\": [\n        534,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1841,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1841,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 jit.fx.cf.radial \\u2014 radial or spin blur around a centre\",\n      \"pos\": [\n        1371,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN04\",\n      \"pos\": [\n        1371,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.radial @amt 1.\",\n      \"pos\": [\n        1371,\n        698\n      ],\n      \"presentation\": [\n        534,\n        483,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        188,\n        22\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1491,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        410,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1511,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"center\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        433,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1531,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        456,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX04\",\n      \"pos\": [\n        1371,\n        743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        784,\n        380,\n        250,\n        185\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 fx.cf.tiltshift\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        792,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        546,\n        843\n      ],\n      \"presentation\": [\n        792,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        546,\n        873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        546,\n        903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 jit.fx.cf.tiltshift \\u2014 tilt-shift: sharp band, blurred around it\",\n      \"pos\": [\n        30,\n        843\n      ],\n      \"size\": [\n        506,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN05\",\n      \"pos\": [\n        30,\n        873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.tiltshift\",\n      \"pos\": [\n        30,\n        1073\n      ],\n      \"presentation\": [\n        792,\n        529,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        153,\n        22\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        913\n      ],\n      \"attrs\": {\n        \"attr\": \"blur_amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        410,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        939\n      ],\n      \"attrs\": {\n        \"attr\": \"slope\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        433,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        965\n      ],\n      \"attrs\": {\n        \"attr\": \"center\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        456,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        991\n      ],\n      \"attrs\": {\n        \"attr\": \"angle\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        479,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        1017\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        502,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX05\",\n      \"pos\": [\n        30,\n        1118\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1042,\n        380,\n        250,\n        93\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 fx.cf.sharpen\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1050,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1156,\n        843\n      ],\n      \"presentation\": [\n        1050,\n        386,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1156,\n        873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1156,\n        903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 jit.fx.cf.sharpen \\u2014 sharpening (amt \\u00d7 4 in the shader)\",\n      \"pos\": [\n        686,\n        843\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN06\",\n      \"pos\": [\n        686,\n        873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.sharpen @amt 0.5\",\n      \"pos\": [\n        686,\n        995\n      ],\n      \"presentation\": [\n        1050,\n        437,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        202,\n        22\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        806,\n        913\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        410,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX06\",\n      \"pos\": [\n        686,\n        1040\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        575,\n        250,\n        70\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 fx.cf.bilateral\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1870,\n        843\n      ],\n      \"presentation\": [\n        18,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1870,\n        873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1870,\n        903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 jit.fx.cf.bilateral \\u2014 edge-preserving bilateral smoothing (no settings)\",\n      \"pos\": [\n        1296,\n        843\n      ],\n      \"size\": [\n        564,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN07\",\n      \"pos\": [\n        1296,\n        873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.bilateral\",\n      \"pos\": [\n        1296,\n        995\n      ],\n      \"presentation\": [\n        18,\n        609,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        153,\n        22\n      ]\n    },\n    \"f07_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX07\",\n      \"pos\": [\n        1296,\n        1040\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        268,\n        575,\n        250,\n        218\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 fx.cf.kuwahara\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        276,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        553,\n        1218\n      ],\n      \"presentation\": [\n        276,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        553,\n        1248\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        553,\n        1278\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 jit.fx.cf.kuwahara \\u2014 anisotropic Kuwahara: a painterly smoothing\",\n      \"pos\": [\n        30,\n        1218\n      ],\n      \"size\": [\n        513,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN08\",\n      \"pos\": [\n        30,\n        1248\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.cf.kuwahara\",\n      \"pos\": [\n        30,\n        1467\n      ],\n      \"presentation\": [\n        276,\n        701,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        146,\n        22\n      ]\n    },\n    \"f08_pre\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.texture @adapt 0 @dim 640 360\",\n      \"pos\": [\n        30,\n        1288\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f08_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1333\n      ],\n      \"attrs\": {\n        \"attr\": \"kernel_size\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        605,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        1359\n      ],\n      \"attrs\": {\n        \"attr\": \"sharpness\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        628,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        1385\n      ],\n      \"attrs\": {\n        \"attr\": \"hardness\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        651,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        1411\n      ],\n      \"attrs\": {\n        \"attr\": \"pre_blur\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        674,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"input downsampled to 640 \\u00d7 360 first (its cost grows with the frame size)\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        628,\n        20\n      ],\n      \"presentation\": [\n        276,\n        729,\n        234,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX08\",\n      \"pos\": [\n        30,\n        1512\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        526,\n        575,\n        250,\n        134\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 fx.sobel\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        534,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1163,\n        1218\n      ],\n      \"presentation\": [\n        534,\n        581,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1163,\n        1248\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1163,\n        1278\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 jit.fx.sobel \\u2014 Sobel edge detection\",\n      \"pos\": [\n        693,\n        1218\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN09\",\n      \"pos\": [\n        693,\n        1248\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.sobel\",\n      \"pos\": [\n        693,\n        1370\n      ],\n      \"presentation\": [\n        534,\n        632,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        104,\n        22\n      ]\n    },\n    \"f09_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        813,\n        1288\n      ],\n      \"attrs\": {\n        \"attr\": \"threshold\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        605,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.sobel\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        390,\n        20\n      ],\n      \"presentation\": [\n        534,\n        660,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX09\",\n      \"pos\": [\n        693,\n        1415\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        784,\n        575,\n        300,\n        157\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 fx.brass\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        792,\n        581,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1773,\n        1218\n      ],\n      \"presentation\": [\n        792,\n        581,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1773,\n        1248\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1773,\n        1278\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 jit.fx.brass \\u2014 emboss (help file sweeps width 1\\u20135)\",\n      \"pos\": [\n        1303,\n        1218\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN10\",\n      \"pos\": [\n        1303,\n        1248\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.brass @width 2.\",\n      \"pos\": [\n        1303,\n        1370\n      ],\n      \"presentation\": [\n        792,\n        655,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        174,\n        22\n      ]\n    },\n    \"f10_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1423,\n        1288\n      ],\n      \"attrs\": {\n        \"attr\": \"width\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        605,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1443,\n        1314\n      ],\n      \"attrs\": {\n        \"attr\": \"offset\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        628,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.brass\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        390,\n        20\n      ],\n      \"presentation\": [\n        792,\n        683,\n        284,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX10\",\n      \"pos\": [\n        1303,\n        1415\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1092,\n        575,\n        264,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 Vizzie EMBOSSR\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1100,\n        581,\n        248,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1612\n      ],\n      \"presentation\": [\n        1100,\n        581,\n        248,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        500,\n        1642\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1672\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 EMBOSSR \\u2014 embossed-image look\",\n      \"pos\": [\n        30,\n        1612\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN11\",\n      \"pos\": [\n        30,\n        1642\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1722\n      ],\n      \"size\": [\n        248,\n        130\n      ],\n      \"inlets\": 8,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        1100,\n        605,\n        248,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.embossr.maxpat\",\n        \"varname\": \"embossr\",\n        \"comment\": \"in 0: Video input | in 1: Output tint Red input | in 2: Output tint Green input | in 3: Output tint Blue input | in 4: Set Alpha value for the embossing mask | in 5: Set Red value for the embossing mask | in 6: Set Green value for the embossing mask | in 7: Set Blue value for the embossing mask | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.embossr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Output tint Red input | in 2: Output tint Green input | in 3: Output tint Blue input | in 4: Set Alpha value for the embossing mask | in 5: Set Red value for the embossing mask | in 6: Set Green value for the embossing mask | in 7: Set Blue value for the embossing mask | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX11\",\n      \"pos\": [\n        30,\n        1887\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        1100,\n        741,\n        248,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        803,\n        193,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 Vizzie SKETCHR\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        809,\n        177,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1612\n      ],\n      \"presentation\": [\n        18,\n        809,\n        177,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1110,\n        1642\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1672\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 SKETCHR \\u2014 line drawing from edges\",\n      \"pos\": [\n        640,\n        1612\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN12\",\n      \"pos\": [\n        640,\n        1642\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f12_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        1722\n      ],\n      \"size\": [\n        177,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        833,\n        177,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.sketchr.maxpat\",\n        \"varname\": \"sketchr\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the contrast control | in 2: Set the edge detection threshold | in 3: Select the draw mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.sketchr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the contrast control | in 2: Set the edge detection threshold | in 3: Select the draw mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX12\",\n      \"pos\": [\n        640,\n        1887\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        969,\n        177,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        211,\n        803,\n        164,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 Vizzie TRACR\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        219,\n        809,\n        148,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        1612\n      ],\n      \"presentation\": [\n        219,\n        809,\n        148,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1720,\n        1642\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        1672\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 TRACR \\u2014 gradient edge detection\",\n      \"pos\": [\n        1250,\n        1612\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN13\",\n      \"pos\": [\n        1250,\n        1642\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f13_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1722\n      ],\n      \"size\": [\n        148,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        219,\n        833,\n        148,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.tracr.maxpat\",\n        \"varname\": \"vz.tracr\",\n        \"comment\": \"in 0: Video input | in 1: Set the threshold below which values are set to 0 | in 2: Set the output mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.tracr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the threshold below which values are set to 0 | in 2: Set the output mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f13_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX13\",\n      \"pos\": [\n        1250,\n        1887\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        219,\n        969,\n        148,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_route\": {\n      \"type\": \"comment\",\n      \"text\": \"ROUTER \\u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself\",\n      \"pos\": [\n        30,\n        1987\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2037\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"g_rsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        990,\n        2037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 13\",\n      \"pos\": [\n        30,\n        2077\n      ],\n      \"size\": [\n        998,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 13,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"g_s2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN02\",\n      \"pos\": [\n        110,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s3\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN03\",\n      \"pos\": [\n        190,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s4\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN04\",\n      \"pos\": [\n        270,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s5\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN05\",\n      \"pos\": [\n        350,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s6\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN06\",\n      \"pos\": [\n        430,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s7\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN07\",\n      \"pos\": [\n        510,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s8\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN08\",\n      \"pos\": [\n        590,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s9\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN09\",\n      \"pos\": [\n        670,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s10\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN10\",\n      \"pos\": [\n        750,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s11\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN11\",\n      \"pos\": [\n        830,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s12\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN12\",\n      \"pos\": [\n        910,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s13\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN13\",\n      \"pos\": [\n        990,\n        2132\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2207\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"sw_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        110,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"sw_r2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX02\",\n      \"pos\": [\n        190,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX03\",\n      \"pos\": [\n        270,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX04\",\n      \"pos\": [\n        350,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX05\",\n      \"pos\": [\n        430,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX06\",\n      \"pos\": [\n        510,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX07\",\n      \"pos\": [\n        590,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX08\",\n      \"pos\": [\n        670,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX09\",\n      \"pos\": [\n        750,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX10\",\n      \"pos\": [\n        830,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX11\",\n      \"pos\": [\n        910,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX12\",\n      \"pos\": [\n        990,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX13\",\n      \"pos\": [\n        1070,\n        2207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"wet_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 13\",\n      \"pos\": [\n        30,\n        2262\n      ],\n      \"size\": [\n        1078,\n        22\n      ],\n      \"inlets\": 14,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VWET\",\n      \"pos\": [\n        30,\n        2317\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld\",\n      \"pos\": [\n        30,\n        2377\n      ],\n      \"size\": [\n        800,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"m_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        30,\n        2417\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"m_rwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VWET\",\n      \"pos\": [\n        110,\n        2417\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"m_xf_ui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        2417\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        700,\n        316,\n        300,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 1.\",\n      \"pos\": [\n        30,\n        2467\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        195,\n        22\n      ]\n    },\n    \"m_layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer @blend_enable 0\",\n      \"pos\": [\n        30,\n        2517\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        216,\n        22\n      ]\n    },\n    \"pworld\": {\n      \"type\": \"jit.pworld\",\n      \"pos\": [\n        30,\n        2567\n      ],\n      \"size\": [\n        480,\n        270\n      ],\n      \"attrs\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        700,\n        40,\n        480,\n        270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        380,\n        360\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        396,\n        10,\n        294,\n        360\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_out_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        2877\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        696,\n        10,\n        494,\n        360\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop movies on the player; click a clip to play it\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        433,\n        20\n      ],\n      \"presentation\": [\n        20,\n        144,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_cam_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam (loads off) \\u2014 on replaces the movie\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        48,\n        170,\n        332,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT \\u2014 click one\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        406,\n        16,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_out_title\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT \\u2014 only the chosen effect runs\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        314,\n        20\n      ],\n      \"presentation\": [\n        706,\n        16,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_xf_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"xfade: 0 = dry source, 1 = the effect (loads 1)\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        407,\n        20\n      ],\n      \"presentation\": [\n        706,\n        342,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"v1_0\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        2520,\n        688\n      ],\n      \"text\": \"v1.0\",\n      \"size\": [\n        44,\n        20\n      ],\n      \"presentation\": [\n        1200,\n        16,\n        44,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"fontname\": \"Monaco\",\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"pl_lm\",\n      0,\n      \"playlist\",\n      0\n    ],\n    [\n      \"cam_tog\",\n      0,\n      \"cam_t\",\n      0\n    ],\n    [\n      \"cam_t\",\n      1,\n      \"cam_sel\",\n      0\n    ],\n    [\n      \"cam_t\",\n      0,\n      \"cam_plus\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      0,\n      \"cam_open\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      1,\n      \"cam_close\",\n      0\n    ],\n    [\n      \"cam_open\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"cam_close\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"src_lm\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"cam_plus\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"src_sw\",\n      1\n    ],\n    [\n      \"cam_grab\",\n      0,\n      \"src_sw\",\n      2\n    ],\n    [\n      \"src_sw\",\n      0,\n      \"s_vsrc\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"lm_hl\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rin\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sout\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rin\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sout\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rin\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c2\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sout\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rin\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c2\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c3\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c4\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sout\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rin\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sout\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rin\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sout\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rin\",\n      0,\n      \"f08_pre\",\n      0\n    ],\n    [\n      \"f08_pre\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c0\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c1\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c2\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c3\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sout\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rin\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c0\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sout\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rin\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c0\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c1\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sout\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rin\",\n      0,\n      \"f11_bp\",\n      0\n    ],\n    [\n      \"f11_bp\",\n      0,\n      \"f11_sout\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rin\",\n      0,\n      \"f12_bp\",\n      0\n    ],\n    [\n      \"f12_bp\",\n      0,\n      \"f12_sout\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rin\",\n      0,\n      \"f13_bp\",\n      0\n    ],\n    [\n      \"f13_bp\",\n      0,\n      \"f13_sout\",\n      0\n    ],\n    [\n      \"g_rsel\",\n      0,\n      \"gate\",\n      0\n    ],\n    [\n      \"g_rsrc\",\n      0,\n      \"gate\",\n      1\n    ],\n    [\n      \"gate\",\n      1,\n      \"g_s2\",\n      0\n    ],\n    [\n      \"gate\",\n      2,\n      \"g_s3\",\n      0\n    ],\n    [\n      \"gate\",\n      3,\n      \"g_s4\",\n      0\n    ],\n    [\n      \"gate\",\n      4,\n      \"g_s5\",\n      0\n    ],\n    [\n      \"gate\",\n      5,\n      \"g_s6\",\n      0\n    ],\n    [\n      \"gate\",\n      6,\n      \"g_s7\",\n      0\n    ],\n    [\n      \"gate\",\n      7,\n      \"g_s8\",\n      0\n    ],\n    [\n      \"gate\",\n      8,\n      \"g_s9\",\n      0\n    ],\n    [\n      \"gate\",\n      9,\n      \"g_s10\",\n      0\n    ],\n    [\n      \"gate\",\n      10,\n      \"g_s11\",\n      0\n    ],\n    [\n      \"gate\",\n      11,\n      \"g_s12\",\n      0\n    ],\n    [\n      \"gate\",\n      12,\n      \"g_s13\",\n      0\n    ],\n    [\n      \"sw_rsel\",\n      0,\n      \"wet_sw\",\n      0\n    ],\n    [\n      \"sw_rdry\",\n      0,\n      \"wet_sw\",\n      1\n    ],\n    [\n      \"sw_r2\",\n      0,\n      \"wet_sw\",\n      2\n    ],\n    [\n      \"sw_r3\",\n      0,\n      \"wet_sw\",\n      3\n    ],\n    [\n      \"sw_r4\",\n      0,\n      \"wet_sw\",\n      4\n    ],\n    [\n      \"sw_r5\",\n      0,\n      \"wet_sw\",\n      5\n    ],\n    [\n      \"sw_r6\",\n      0,\n      \"wet_sw\",\n      6\n    ],\n    [\n      \"sw_r7\",\n      0,\n      \"wet_sw\",\n      7\n    ],\n    [\n      \"sw_r8\",\n      0,\n      \"wet_sw\",\n      8\n    ],\n    [\n      \"sw_r9\",\n      0,\n      \"wet_sw\",\n      9\n    ],\n    [\n      \"sw_r10\",\n      0,\n      \"wet_sw\",\n      10\n    ],\n    [\n      \"sw_r11\",\n      0,\n      \"wet_sw\",\n      11\n    ],\n    [\n      \"sw_r12\",\n      0,\n      \"wet_sw\",\n      12\n    ],\n    [\n      \"sw_r13\",\n      0,\n      \"wet_sw\",\n      13\n    ],\n    [\n      \"wet_sw\",\n      0,\n      \"s_vwet\",\n      0\n    ],\n    [\n      \"m_rdry\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_xf_ui\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_rwet\",\n      0,\n      \"m_xf\",\n      1\n    ],\n    [\n      \"m_xf\",\n      0,\n      \"m_layer\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-34",
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
            "obj-38",
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
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-42",
            0
          ],
          "source": [
            "obj-41",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-42",
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
            "obj-42",
            0
          ],
          "source": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-45",
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
            "obj-49",
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
            "obj-50",
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
            "obj-53",
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
            "obj-54",
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
            "obj-55",
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
            "obj-56",
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
            "obj-53",
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
            "obj-62",
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
            "obj-65",
            0
          ],
          "source": [
            "obj-64",
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
            "obj-66",
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
            "obj-67",
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
            "obj-68",
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
            "obj-69",
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
            "obj-70",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-71",
            0
          ],
          "source": [
            "obj-65",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-75",
            0
          ],
          "source": [
            "obj-74",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-76",
            0
          ],
          "source": [
            "obj-75",
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
            "obj-79",
            0
          ],
          "source": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-81",
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
            "obj-85",
            0
          ],
          "source": [
            "obj-84",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-86",
            0
          ],
          "source": [
            "obj-85",
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
            "obj-95",
            0
          ],
          "source": [
            "obj-94",
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
            "obj-97",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-98",
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
            "obj-98",
            0
          ],
          "source": [
            "obj-100",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-98",
            0
          ],
          "source": [
            "obj-101",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-98",
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
            "obj-98",
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
            "obj-105",
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
            "obj-113",
            0
          ],
          "source": [
            "obj-114",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-116",
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
            "obj-121",
            0
          ],
          "source": [
            "obj-120",
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
            "obj-124",
            0
          ],
          "source": [
            "obj-125",
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
            "obj-126",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-128",
            0
          ],
          "source": [
            "obj-124",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-132",
            0
          ],
          "source": [
            "obj-131",
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
            "obj-136",
            0
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
            "obj-137",
            0
          ],
          "source": [
            "obj-136",
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
            "obj-143",
            0
          ],
          "source": [
            "obj-142",
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
            "obj-147",
            0
          ],
          "source": [
            "obj-146",
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
            "obj-153",
            0
          ],
          "source": [
            "obj-152",
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
            "obj-157",
            0
          ],
          "source": [
            "obj-156",
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
            "obj-160",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-162",
            1
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
            "obj-163",
            0
          ],
          "source": [
            "obj-162",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-164",
            0
          ],
          "source": [
            "obj-162",
            2
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
            "obj-162",
            3
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
            "obj-162",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-167",
            0
          ],
          "source": [
            "obj-162",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-168",
            0
          ],
          "source": [
            "obj-162",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-169",
            0
          ],
          "source": [
            "obj-162",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-170",
            0
          ],
          "source": [
            "obj-162",
            8
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
            "obj-162",
            9
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
            "obj-162",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-173",
            0
          ],
          "source": [
            "obj-162",
            11
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-174",
            0
          ],
          "source": [
            "obj-162",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
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
            "obj-189",
            1
          ],
          "source": [
            "obj-176",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            2
          ],
          "source": [
            "obj-177",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            3
          ],
          "source": [
            "obj-178",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            4
          ],
          "source": [
            "obj-179",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            5
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
            "obj-189",
            6
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
            "obj-189",
            7
          ],
          "source": [
            "obj-182",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            8
          ],
          "source": [
            "obj-183",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-189",
            9
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
            "obj-189",
            10
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
            "obj-189",
            11
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
            "obj-189",
            12
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
            "obj-189",
            13
          ],
          "source": [
            "obj-188",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-190",
            0
          ],
          "source": [
            "obj-189",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-195",
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
            "obj-195",
            0
          ],
          "source": [
            "obj-194",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-195",
            1
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
            "obj-196",
            0
          ],
          "source": [
            "obj-195",
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
