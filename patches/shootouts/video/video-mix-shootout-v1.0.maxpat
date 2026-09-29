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
      1392.0,
      1405.0
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
          "text": "VIDEO MIX SHOOTOUT v1.0 \u2014 transitions, keys and other effects that combine clip A with clip B. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture. Clip B (sunflower.mp4) on s VSRCB is the second input of every two-input effect."
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
            430.0,
            400.0,
            340.0,
            20.0
          ],
          "text": "CLIP B \u2014 the second input of the two-input effects (loads sunflower.mp4)"
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
            430.0,
            425.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "jit.playlist",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "jit_gl_texture",
            "",
            "dictionary"
          ],
          "patching_rect": [
            430.0,
            455.0,
            300.0,
            60.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            222.0,
            360.0,
            100.0
          ],
          "output_texture": 1,
          "data": {
            "clips": [
              {
                "absolutepath": "sunflower.mp4",
                "filename": "sunflower.mp4",
                "filekind": "moviefile",
                "id": "u169008533",
                "loop": 1,
                "content_state": {}
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            540.0,
            69.0,
            22.0
          ],
          "text": "s VSRCB"
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
            2520.0,
            60.0,
            220.0,
            20.0
          ],
          "text": "CLIP B \u2014 the second input",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            198.0,
            360.0,
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
          "id": "obj-21",
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 20, conventional order. The v8 maps item index \u2192 slot number (1 = DRY) and lights the pane title"
        }
      },
      {
        "box": {
          "id": "obj-22",
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
          "id": "obj-23",
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
            432.0
          ],
          "num_lines_patching": 20,
          "num_lines_presentation": 20,
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
                "2 fx.tr.xfade",
                "3 fx.tr.dissolve",
                "4 fx.tr.gridwipe",
                "5 fx.tr.shrinkwipe",
                "6 fx.tr.vignettes",
                "7 fx.tr.huefade",
                "8 fx.tr.rotfade",
                "9 fx.tr.slide",
                "10 fx.tr.zoomfade",
                "11 fx.alphaglue",
                "12 fx.eclipse",
                "13 fx.repos",
                "14 fx.tp.warp",
                "15 fx.concat",
                "16 fx.multiplex",
                "17 Vizzie XFADR",
                "18 Vizzie MIXFADR",
                "19 Vizzie CHROMAKEYR",
                "20 Vizzie LUMAKEYR"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "VFX_SELECT",
              "parameter_mmax": 19,
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
          "id": "obj-24",
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
          "id": "obj-25",
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
          "id": "obj-26",
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
          "id": "obj-27",
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
          "id": "obj-28",
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
          "id": "obj-29",
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
          "id": "obj-31",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            86.0,
            135.0,
            20.0
          ],
          "text": "2 \u00b7 fx.tr.xfade",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            508.0,
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
          "id": "obj-32",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            508.0,
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
          "id": "obj-33",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            670.0,
            40.0,
            22.0
          ],
          "text": "1"
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
            500.0,
            700.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            640.0,
            460.0,
            20.0
          ],
          "text": "2 \u00b7 jit.fx.tr.xfade \u2014 crossfade (0 = A, 1 = B)"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            670.0,
            69.0,
            22.0
          ],
          "text": "r VIN02"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            832.0,
            202.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 0.5",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            559.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            710.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            532.0,
            234.0,
            22.0
          ],
          "attr": "xfade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            518.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.xfade; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            587.0,
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
          "id": "obj-40",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            877.0,
            69.0,
            22.0
          ],
          "text": "s VFX02"
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
            198.0,
            792.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            138.0,
            161.0,
            20.0
          ],
          "text": "3 \u00b7 fx.tr.dissolve",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            508.0,
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
          "id": "obj-44",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1142.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            508.0,
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
          "id": "obj-45",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1142.0,
            670.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1142.0,
            700.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            640.0,
            492.0,
            20.0
          ],
          "text": "3 \u00b7 jit.fx.tr.dissolve \u2014 random-pixel dissolve (amt 0 = A, 1 = B)"
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            670.0,
            69.0,
            22.0
          ],
          "text": "r VIN03"
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            640.0,
            858.0,
            209.0,
            22.0
          ],
          "text": "jit.fx.tr.dissolve @amt 0.5",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            605.0,
            234.0,
            22.0
          ]
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
            760.0,
            710.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            532.0,
            234.0,
            22.0
          ],
          "attr": "amt",
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
            780.0,
            736.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            555.0,
            234.0,
            22.0
          ],
          "attr": "fade",
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
            800.0,
            762.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            578.0,
            234.0,
            22.0
          ],
          "attr": "freq",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            633.0,
            234.0,
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
          "id": "obj-54",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            903.0,
            69.0,
            22.0
          ],
          "text": "s VFX03"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            815.0,
            818.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-57",
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
          "text": "4 \u00b7 fx.tr.gridwipe",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            508.0,
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
          "varname": "TITLE_04"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1752.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            508.0,
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
          "id": "obj-59",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1752.0,
            670.0,
            40.0,
            22.0
          ],
          "text": "3"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1752.0,
            700.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1282.0,
            640.0,
            460.0,
            20.0
          ],
          "text": "4 \u00b7 jit.fx.tr.gridwipe \u2014 wipe through a grid of cells"
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1282.0,
            670.0,
            69.0,
            22.0
          ],
          "text": "r VIN04"
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1282.0,
            910.0,
            244.0,
            22.0
          ],
          "text": "jit.fx.tr.gridwipe @wipe 0.5 0.5",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            651.0,
            264.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1402.0,
            710.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            532.0,
            264.0,
            22.0
          ],
          "attr": "wipe",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1422.0,
            736.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            555.0,
            264.0,
            22.0
          ],
          "attr": "scale",
          "text_width": 110.0
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
            1442.0,
            762.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            578.0,
            264.0,
            22.0
          ],
          "attr": "origin",
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
            1462.0,
            788.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            601.0,
            264.0,
            22.0
          ],
          "attr": "fade",
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
            1482.0,
            814.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            624.0,
            264.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            679.0,
            264.0,
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
          "id": "obj-70",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1282.0,
            955.0,
            69.0,
            22.0
          ],
          "text": "s VFX04"
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1492.0,
            870.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            242.0,
            178.0,
            20.0
          ],
          "text": "5 \u00b7 fx.tr.shrinkwipe",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            508.0,
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
          "varname": "TITLE_05"
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
            500.0,
            1055.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            508.0,
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
          "id": "obj-75",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1085.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            500.0,
            1115.0,
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
            30.0,
            1055.0,
            460.0,
            20.0
          ],
          "text": "5 \u00b7 jit.fx.tr.shrinkwipe \u2014 wipe by shrinking cells"
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
            30.0,
            1085.0,
            69.0,
            22.0
          ],
          "text": "r VIN05"
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1299.0,
            258.0,
            22.0
          ],
          "text": "jit.fx.tr.shrinkwipe @wipe 0.5 0.5",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            628.0,
            264.0,
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
            150.0,
            1125.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            532.0,
            264.0,
            22.0
          ],
          "attr": "wipe",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            1151.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            555.0,
            264.0,
            22.0
          ],
          "attr": "scale",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-82",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            1177.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            578.0,
            264.0,
            22.0
          ],
          "attr": "fade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            1203.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            601.0,
            264.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            268.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            656.0,
            264.0,
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
          "id": "obj-85",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1344.0,
            69.0,
            22.0
          ],
          "text": "s VFX05"
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            254.0,
            1259.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            294.0,
            169.0,
            20.0
          ],
          "text": "6 \u00b7 fx.tr.vignettes",
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            508.0,
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
          "varname": "TITLE_06"
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1055.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            508.0,
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
          "id": "obj-90",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1085.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1115.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            1055.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 jit.fx.tr.vignettes \u2014 wipe through vignettes"
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1085.0,
            69.0,
            22.0
          ],
          "text": "r VIN06"
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            640.0,
            1299.0,
            251.0,
            22.0
          ],
          "text": "jit.fx.tr.vignettes @wipe 0.5 0.5",
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            628.0,
            264.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            1125.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            532.0,
            264.0,
            22.0
          ],
          "attr": "wipe",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            1151.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            555.0,
            264.0,
            22.0
          ],
          "attr": "scale",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-97",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            1177.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            578.0,
            264.0,
            22.0
          ],
          "attr": "fade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-98",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            820.0,
            1203.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            601.0,
            264.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-99",
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
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            656.0,
            264.0,
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
          "id": "obj-100",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1344.0,
            69.0,
            22.0
          ],
          "text": "s VFX06"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            857.0,
            1259.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            346.0,
            152.0,
            20.0
          ],
          "text": "7 \u00b7 fx.tr.huefade",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            727.0,
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
          "id": "obj-104",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            1055.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            727.0,
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
          "id": "obj-105",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            1085.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            1115.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1250.0,
            1055.0,
            460.0,
            20.0
          ],
          "text": "7 \u00b7 jit.fx.tr.huefade \u2014 fade through hue"
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1085.0,
            69.0,
            22.0
          ],
          "text": "r VIN07"
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1247.0,
            202.0,
            22.0
          ],
          "text": "jit.fx.tr.huefade @amt 0.5",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            778.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-110",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1370.0,
            1125.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            751.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
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
            2520.0,
            372.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            806.0,
            234.0,
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
          "id": "obj-112",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1292.0,
            69.0,
            22.0
          ],
          "text": "s VFX07"
        }
      },
      {
        "box": {
          "id": "obj-113",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1418.0,
            1207.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            398.0,
            152.0,
            20.0
          ],
          "text": "8 \u00b7 fx.tr.rotfade",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            727.0,
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
          "id": "obj-116",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            524.0,
            1444.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            727.0,
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
          "id": "obj-117",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            524.0,
            1474.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            524.0,
            1504.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1444.0,
            484.0,
            20.0
          ],
          "text": "8 \u00b7 jit.fx.tr.rotfade \u2014 fade while rotating (help-file rotation)"
        }
      },
      {
        "box": {
          "id": "obj-120",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1474.0,
            69.0,
            22.0
          ],
          "text": "r VIN08"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1688.0,
            300.0,
            22.0
          ],
          "text": "jit.fx.tr.rotfade @amt 0.5 @rotation 180",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            847.0,
            234.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-122",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            1514.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            751.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            1540.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            774.0,
            234.0,
            22.0
          ],
          "attr": "rotation",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            1566.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            797.0,
            234.0,
            22.0
          ],
          "attr": "motionblur",
          "text_width": 110.0
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
            210.0,
            1592.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            820.0,
            234.0,
            22.0
          ],
          "attr": "bluramount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            424.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            888.0,
            234.0,
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
          "id": "obj-127",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1733.0,
            69.0,
            22.0
          ],
          "text": "s VFX08"
        }
      },
      {
        "box": {
          "id": "obj-128",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            296.0,
            1648.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            450.0,
            135.0,
            20.0
          ],
          "text": "9 \u00b7 fx.tr.slide",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            727.0,
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
          "id": "obj-131",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1134.0,
            1444.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            727.0,
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
          "id": "obj-132",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1134.0,
            1474.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            1134.0,
            1504.0,
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
            664.0,
            1444.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 jit.fx.tr.slide \u2014 slide B in over A"
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
            664.0,
            1474.0,
            69.0,
            22.0
          ],
          "text": "r VIN09"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            664.0,
            1688.0,
            188.0,
            22.0
          ],
          "text": "jit.fx.tr.slide @amt 0.5",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            847.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-137",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            784.0,
            1514.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            751.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            804.0,
            1540.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            774.0,
            234.0,
            22.0
          ],
          "attr": "slidedir",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            824.0,
            1566.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            797.0,
            234.0,
            22.0
          ],
          "attr": "motionblur",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            844.0,
            1592.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            820.0,
            234.0,
            22.0
          ],
          "attr": "bluramount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            875.0,
            234.0,
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
          "id": "obj-142",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            664.0,
            1733.0,
            69.0,
            22.0
          ],
          "text": "s VFX09"
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            818.0,
            1648.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            502.0,
            169.0,
            20.0
          ],
          "text": "10 \u00b7 fx.tr.zoomfade",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            727.0,
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
          "varname": "TITLE_10"
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1747.0,
            1444.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            727.0,
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
          "id": "obj-147",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1747.0,
            1474.0,
            40.0,
            22.0
          ],
          "text": "9"
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1747.0,
            1504.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1274.0,
            1444.0,
            463.0,
            20.0
          ],
          "text": "10 \u00b7 jit.fx.tr.zoomfade \u2014 fade while zooming (help-file zoom)"
        }
      },
      {
        "box": {
          "id": "obj-150",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1274.0,
            1474.0,
            69.0,
            22.0
          ],
          "text": "r VIN10"
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1274.0,
            1688.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.tr.zoomfade @amt 0.5 @zoom 2.",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            847.0,
            234.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1394.0,
            1514.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            751.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-153",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1414.0,
            1540.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            774.0,
            234.0,
            22.0
          ],
          "attr": "zoom",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-154",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1434.0,
            1566.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            797.0,
            234.0,
            22.0
          ],
          "attr": "motionblur",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-155",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1454.0,
            1592.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            820.0,
            234.0,
            22.0
          ],
          "attr": "bluramount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-156",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            888.0,
            234.0,
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
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1274.0,
            1733.0,
            69.0,
            22.0
          ],
          "text": "s VFX10"
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1512.0,
            1648.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
            152.0,
            20.0
          ],
          "text": "11 \u00b7 fx.alphaglue",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            727.0,
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
          "varname": "TITLE_11"
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            654.0,
            1833.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            727.0,
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
          "id": "obj-162",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            654.0,
            1863.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            654.0,
            1893.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-164",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1833.0,
            614.0,
            20.0
          ],
          "text": "11 \u00b7 jit.fx.alphaglue \u2014 B's brightness becomes A's alpha (shows over the dry clip)"
        }
      },
      {
        "box": {
          "id": "obj-165",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1863.0,
            69.0,
            22.0
          ],
          "text": "r VIN11"
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2077.0,
            230.0,
            22.0
          ],
          "text": "jit.fx.alphaglue @lum2alpha 1.",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            847.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-167",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            1903.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            751.0,
            234.0,
            22.0
          ],
          "attr": "lum2alpha",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-168",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            1929.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            774.0,
            234.0,
            22.0
          ],
          "attr": "fade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            1955.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            797.0,
            234.0,
            22.0
          ],
          "attr": "thresh",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            1981.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            820.0,
            234.0,
            22.0
          ],
          "attr": "plane",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            580.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            875.0,
            234.0,
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
          "id": "obj-172",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2122.0,
            69.0,
            22.0
          ],
          "text": "s VFX11"
        }
      },
      {
        "box": {
          "id": "obj-173",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            226.0,
            2037.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
            135.0,
            20.0
          ],
          "text": "12 \u00b7 fx.eclipse",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            936.0,
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
          "varname": "TITLE_12"
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1382.0,
            1833.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            936.0,
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
          "id": "obj-177",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1382.0,
            1863.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-178",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1382.0,
            1893.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            794.0,
            1833.0,
            578.0,
            20.0
          ],
          "text": "12 \u00b7 jit.fx.eclipse \u2014 a grid of A tinted by B (help file sweeps steps 10\u2013500)"
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
            794.0,
            1863.0,
            69.0,
            22.0
          ],
          "text": "r VIN12"
        }
      },
      {
        "box": {
          "id": "obj-181",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            794.0,
            2051.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.eclipse @steps 8 8",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1033.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-182",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            914.0,
            1903.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            960.0,
            234.0,
            22.0
          ],
          "attr": "steps",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-183",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            934.0,
            1929.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            983.0,
            234.0,
            22.0
          ],
          "attr": "enable_tint",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            954.0,
            1955.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1006.0,
            234.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-185",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
            535.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.eclipse; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1061.0,
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
          "id": "obj-186",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            794.0,
            2096.0,
            69.0,
            22.0
          ],
          "text": "s VFX12"
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
            955.0,
            2011.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            658.0,
            118.0,
            20.0
          ],
          "text": "13 \u00b7 fx.repos",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            936.0,
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
          "varname": "TITLE_13"
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2031.0,
            1833.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            936.0,
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
          "id": "obj-191",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2031.0,
            1863.0,
            40.0,
            22.0
          ],
          "text": "12"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2031.0,
            1893.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1522.0,
            1833.0,
            499.0,
            20.0
          ],
          "text": "13 \u00b7 jit.fx.repos \u2014 B's colours move A's pixels (relative offsets)"
        }
      },
      {
        "box": {
          "id": "obj-194",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1522.0,
            1863.0,
            69.0,
            22.0
          ],
          "text": "r VIN13"
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
            1522.0,
            2077.0,
            223.0,
            22.0
          ],
          "text": "jit.fx.repos @amt 0.1 @mode 1",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            1056.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-196",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1642.0,
            1903.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            960.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-197",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1662.0,
            1929.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            983.0,
            234.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-198",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1682.0,
            1955.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            1006.0,
            234.0,
            22.0
          ],
          "attr": "boundmode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-199",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1702.0,
            1981.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            276.0,
            1029.0,
            234.0,
            22.0
          ],
          "attr": "channel",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
            518.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.repos; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            276.0,
            1084.0,
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
          "id": "obj-201",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1522.0,
            2122.0,
            69.0,
            22.0
          ],
          "text": "s VFX13"
        }
      },
      {
        "box": {
          "id": "obj-202",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1711.0,
            2037.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            710.0,
            135.0,
            20.0
          ],
          "text": "14 \u00b7 fx.tp.warp",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            936.0,
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
          "varname": "TITLE_14"
        }
      },
      {
        "box": {
          "id": "obj-205",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2222.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            936.0,
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
          "id": "obj-206",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            2252.0,
            40.0,
            22.0
          ],
          "text": "13"
        }
      },
      {
        "box": {
          "id": "obj-207",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            2282.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-208",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2222.0,
            460.0,
            20.0
          ],
          "text": "14 \u00b7 jit.fx.tp.warp \u2014 time-warp slices of A, timed by B"
        }
      },
      {
        "box": {
          "id": "obj-209",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2252.0,
            69.0,
            22.0
          ],
          "text": "r VIN14"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2414.0,
            118.0,
            22.0
          ],
          "text": "jit.fx.tp.warp",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            987.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-211",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            2292.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            960.0,
            234.0,
            22.0
          ],
          "attr": "num_slices",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            736.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            534.0,
            1015.0,
            234.0,
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
          "id": "obj-213",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2459.0,
            69.0,
            22.0
          ],
          "text": "s VFX14"
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            114.0,
            2374.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
            127.0,
            20.0
          ],
          "text": "15 \u00b7 fx.concat",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            936.0,
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
          "varname": "TITLE_15"
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            2222.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            936.0,
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
          "id": "obj-218",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            2252.0,
            40.0,
            22.0
          ],
          "text": "14"
        }
      },
      {
        "box": {
          "id": "obj-219",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            2282.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-220",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2222.0,
            460.0,
            20.0
          ],
          "text": "15 \u00b7 jit.fx.concat \u2014 A and B side by side"
        }
      },
      {
        "box": {
          "id": "obj-221",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2252.0,
            69.0,
            22.0
          ],
          "text": "r VIN15"
        }
      },
      {
        "box": {
          "id": "obj-222",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2414.0,
            111.0,
            22.0
          ],
          "text": "jit.fx.concat",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            987.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            2292.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            792.0,
            960.0,
            234.0,
            22.0
          ],
          "attr": "concatdim",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-224",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
            526.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.concat; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            792.0,
            1015.0,
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
          "id": "obj-225",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2459.0,
            69.0,
            22.0
          ],
          "text": "s VFX15"
        }
      },
      {
        "box": {
          "id": "obj-226",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            717.0,
            2374.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            814.0,
            152.0,
            20.0
          ],
          "text": "16 \u00b7 fx.multiplex",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            936.0,
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
          "varname": "TITLE_16"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            2222.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            936.0,
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
          "id": "obj-230",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            2252.0,
            40.0,
            22.0
          ],
          "text": "15"
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
            1720.0,
            2282.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-232",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2222.0,
            460.0,
            20.0
          ],
          "text": "16 \u00b7 jit.fx.multiplex \u2014 A and B interleaved line by line"
        }
      },
      {
        "box": {
          "id": "obj-233",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2252.0,
            69.0,
            22.0
          ],
          "text": "r VIN16"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            2414.0,
            132.0,
            22.0
          ],
          "text": "jit.fx.multiplex",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            987.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-235",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1370.0,
            2292.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            960.0,
            234.0,
            22.0
          ],
          "attr": "multiplexdim",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            552.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.multiplex; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            1015.0,
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
          "id": "obj-237",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2459.0,
            69.0,
            22.0
          ],
          "text": "s VFX16"
        }
      },
      {
        "box": {
          "id": "obj-238",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1348.0,
            2374.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-240",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
            152.0,
            20.0
          ],
          "text": "17 \u00b7 Vizzie XFADR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1149.0,
            122.0,
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
          "id": "obj-241",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2559.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1149.0,
            122.0,
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
          "id": "obj-242",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            2589.0,
            40.0,
            22.0
          ],
          "text": "16"
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
            500.0,
            2619.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-244",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2559.0,
            460.0,
            20.0
          ],
          "text": "17 \u00b7 XFADR \u2014 crossfade A and B"
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
            30.0,
            2589.0,
            69.0,
            22.0
          ],
          "text": "r VIN17"
        }
      },
      {
        "box": {
          "id": "obj-246",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2669.0,
            118.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1173.0,
            118.0,
            130.0
          ],
          "name": "vz.xfadr.maxpat",
          "varname": "xfadr",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Crossfade ( (0. - 1.0) | out 0: Video output",
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
          "id": "obj-247",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2834.0,
            69.0,
            22.0
          ],
          "text": "s VFX17"
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
            70.0,
            2629.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-249",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1309.0,
            122.0,
            66.0
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
          "presentation_linecount": 4
        }
      },
      {
        "box": {
          "id": "obj-251",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
            169.0,
            20.0
          ],
          "text": "18 \u00b7 Vizzie MIXFADR",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            1149.0,
            168.0,
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
          "id": "obj-252",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            2559.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            164.0,
            1149.0,
            168.0,
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
          "id": "obj-253",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            2589.0,
            40.0,
            22.0
          ],
          "text": "17"
        }
      },
      {
        "box": {
          "id": "obj-254",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            2619.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-255",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2559.0,
            460.0,
            20.0
          ],
          "text": "18 \u00b7 MIXFADR \u2014 crossfade with an operator mode"
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
            640.0,
            2589.0,
            69.0,
            22.0
          ],
          "text": "r VIN18"
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2669.0,
            168.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            164.0,
            1173.0,
            168.0,
            130.0
          ],
          "name": "vz.mixfadr.maxpat",
          "varname": "mixfadr",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input | in 3: Crossfade | out 0: Video output",
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
          "id": "obj-258",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2834.0,
            69.0,
            22.0
          ],
          "text": "s VFX18"
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
            683.3333333333334,
            2629.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            164.0,
            1309.0,
            168.0,
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
          "id": "obj-262",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
            195.0,
            20.0
          ],
          "text": "19 \u00b7 Vizzie CHROMAKEYR",
          "presentation": 1,
          "presentation_rect": [
            356.0,
            1149.0,
            408.0,
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
          "id": "obj-263",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1728.0,
            2559.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            356.0,
            1149.0,
            408.0,
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
          "id": "obj-264",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1728.0,
            2589.0,
            40.0,
            22.0
          ],
          "text": "18"
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
            1728.0,
            2619.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1250.0,
            2559.0,
            468.0,
            20.0
          ],
          "text": "19 \u00b7 CHROMAKEYR \u2014 chroma key"
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
            1250.0,
            2589.0,
            69.0,
            22.0
          ],
          "text": "r VIN19"
        }
      },
      {
        "box": {
          "id": "obj-268",
          "maxclass": "bpatcher",
          "numinlets": 7,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            1250.0,
            2669.0,
            408.0,
            146.0
          ],
          "presentation": 1,
          "presentation_rect": [
            356.0,
            1173.0,
            408.0,
            146.0
          ],
          "name": "vz.chromakeyr.maxpat",
          "varname": "chromakeyr",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Red keying value | in 3: Green keying value | in 4: Blue keying value | in 5: Chromakeying tolerance  | in 6: Chromakeying fade | out 0: Video output | out 1: Red chromakey value ( (0. - 1.0) | out 2: Green chromakey value ( (0. - 1.0) | out 3: Blue chromakey value ( (0. - 1.0)",
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
          "id": "obj-269",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            2850.0,
            69.0,
            22.0
          ],
          "text": "s VFX19"
        }
      },
      {
        "box": {
          "id": "obj-270",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1311.6666666666667,
            2629.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            996.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            356.0,
            1325.0,
            408.0,
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
          "id": "obj-273",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1022.0,
            178.0,
            20.0
          ],
          "text": "20 \u00b7 Vizzie LUMAKEYR",
          "presentation": 1,
          "presentation_rect": [
            788.0,
            1149.0,
            450.0,
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
          "varname": "TITLE_20"
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            550.0,
            2950.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            788.0,
            1149.0,
            450.0,
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
          "id": "obj-275",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            550.0,
            2980.0,
            40.0,
            22.0
          ],
          "text": "19"
        }
      },
      {
        "box": {
          "id": "obj-276",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            550.0,
            3010.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            2950.0,
            510.0,
            20.0
          ],
          "text": "20 \u00b7 LUMAKEYR \u2014 luma key"
        }
      },
      {
        "box": {
          "id": "obj-278",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2980.0,
            69.0,
            22.0
          ],
          "text": "r VIN20"
        }
      },
      {
        "box": {
          "id": "obj-279",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3060.0,
            450.0,
            146.0
          ],
          "presentation": 1,
          "presentation_rect": [
            788.0,
            1173.0,
            450.0,
            146.0
          ],
          "name": "vz.lumakeyr.maxpat",
          "varname": "lumakeyr",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Luminance value | in 3: Chromakeying tolerance | in 4: Chromakeying fade | out 0: Video output",
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
          "id": "obj-280",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3241.0,
            69.0,
            22.0
          ],
          "text": "s VFX20"
        }
      },
      {
        "box": {
          "id": "obj-281",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            133.0,
            3020.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            1048.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            788.0,
            1325.0,
            450.0,
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
          "id": "obj-283",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3341.0,
            1200.0,
            34.0
          ],
          "text": "ROUTER \u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3391.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-285",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1550.0,
            3391.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-286",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 20,
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
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3431.0,
            1558.0,
            22.0
          ],
          "text": "gate 20"
        }
      },
      {
        "box": {
          "id": "obj-287",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            110.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN02"
        }
      },
      {
        "box": {
          "id": "obj-288",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN03"
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            270.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN04"
        }
      },
      {
        "box": {
          "id": "obj-290",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            350.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN05"
        }
      },
      {
        "box": {
          "id": "obj-291",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN06"
        }
      },
      {
        "box": {
          "id": "obj-292",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            510.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN07"
        }
      },
      {
        "box": {
          "id": "obj-293",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN08"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            670.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN09"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            750.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN10"
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            830.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN11"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            910.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN12"
        }
      },
      {
        "box": {
          "id": "obj-298",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            990.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN13"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1070.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN14"
        }
      },
      {
        "box": {
          "id": "obj-300",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN15"
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1230.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN16"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN17"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1390.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN18"
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1470.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN19"
        }
      },
      {
        "box": {
          "id": "obj-305",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1550.0,
            3486.0,
            69.0,
            22.0
          ],
          "text": "s VIN20"
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3561.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            3561.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-308",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX02"
        }
      },
      {
        "box": {
          "id": "obj-309",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX03"
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            350.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX04"
        }
      },
      {
        "box": {
          "id": "obj-311",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX05"
        }
      },
      {
        "box": {
          "id": "obj-312",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX06"
        }
      },
      {
        "box": {
          "id": "obj-313",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX07"
        }
      },
      {
        "box": {
          "id": "obj-314",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            670.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX08"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX09"
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX10"
        }
      },
      {
        "box": {
          "id": "obj-317",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX11"
        }
      },
      {
        "box": {
          "id": "obj-318",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX12"
        }
      },
      {
        "box": {
          "id": "obj-319",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1070.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX13"
        }
      },
      {
        "box": {
          "id": "obj-320",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX14"
        }
      },
      {
        "box": {
          "id": "obj-321",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1230.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX15"
        }
      },
      {
        "box": {
          "id": "obj-322",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX16"
        }
      },
      {
        "box": {
          "id": "obj-323",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1390.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX17"
        }
      },
      {
        "box": {
          "id": "obj-324",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1470.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX18"
        }
      },
      {
        "box": {
          "id": "obj-325",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1550.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX19"
        }
      },
      {
        "box": {
          "id": "obj-326",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1630.0,
            3561.0,
            69.0,
            22.0
          ],
          "text": "r VFX20"
        }
      },
      {
        "box": {
          "id": "obj-327",
          "maxclass": "newobj",
          "numinlets": 21,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3616.0,
            1638.0,
            22.0
          ],
          "text": "switch 20"
        }
      },
      {
        "box": {
          "id": "obj-328",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3671.0,
            62.0,
            22.0
          ],
          "text": "s VWET"
        }
      },
      {
        "box": {
          "id": "obj-329",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3731.0,
            800.0,
            20.0
          ],
          "text": "MASTER \u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld"
        }
      },
      {
        "box": {
          "id": "obj-330",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3771.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-331",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            3771.0,
            62.0,
            22.0
          ],
          "text": "r VWET"
        }
      },
      {
        "box": {
          "id": "obj-332",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            3771.0,
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
          "id": "obj-333",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3821.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 1."
        }
      },
      {
        "box": {
          "id": "obj-334",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3871.0,
            216.0,
            22.0
          ],
          "text": "jit.gl.layer @blend_enable 0"
        }
      },
      {
        "box": {
          "id": "obj-335",
          "maxclass": "jit.pworld",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            3921.0,
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
          "id": "obj-339",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1074.0,
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
          "id": "obj-340",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1100.0,
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
          "id": "obj-341",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1126.0,
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
          "id": "obj-342",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1152.0,
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
          "id": "obj-343",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1178.0,
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
          "id": "obj-344",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1204.0,
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
          "id": "obj-345",
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
          "id": "obj-30",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            502.0,
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
          "id": "obj-42",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            100.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            268.0,
            502.0,
            250.0,
            163.0
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
          "id": "obj-56",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            170.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            526.0,
            502.0,
            280.0,
            209.0
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
            240.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            814.0,
            502.0,
            280.0,
            186.0
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
          "id": "obj-87",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            310.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1102.0,
            502.0,
            280.0,
            186.0
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
          "id": "obj-102",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            380.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            721.0,
            250.0,
            117.0
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
          "id": "obj-114",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            450.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            268.0,
            721.0,
            250.0,
            199.0
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
            520.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            526.0,
            721.0,
            250.0,
            186.0
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
          "id": "obj-144",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            784.0,
            721.0,
            250.0,
            199.0
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
          "id": "obj-159",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            721.0,
            250.0,
            186.0
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
          "id": "obj-174",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            730.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            930.0,
            250.0,
            180.0
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
          "id": "obj-188",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            800.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            268.0,
            930.0,
            250.0,
            203.0
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
          "id": "obj-203",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            870.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            526.0,
            930.0,
            250.0,
            117.0
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
          "id": "obj-215",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            940.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            784.0,
            930.0,
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
          "id": "obj-227",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1010.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            930.0,
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
          "id": "obj-239",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1080.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1143.0,
            138.0,
            242.0
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
          "id": "obj-250",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            156.0,
            1143.0,
            184.0,
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
          "id": "obj-261",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1220.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            348.0,
            1143.0,
            424.0,
            229.0
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
          "id": "obj-272",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1290.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            780.0,
            1143.0,
            466.0,
            212.0
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
          "id": "obj-336",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1360.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            380.0,
            482.0
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
          "id": "obj-337",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1430.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            10.0,
            294.0,
            482.0
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
          "id": "obj-338",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1500.0,
            4231.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            696.0,
            10.0,
            494.0,
            482.0
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
          "id": "obj-346",
          "text": "v1.0",
          "patching_rect": [
            2520.0,
            1234.0,
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
            4291.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1392,\n  \"height\": 1405,\n  \"bglocked\": 1,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"VIDEO MIX SHOOTOUT v1.0 \\u2014 transitions, keys and other effects that combine clip A with clip B. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture. Clip B (sunflower.mp4) on s VSRCB is the second input of every two-input effect.\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        620,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"pl_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        30,\n        120\n      ],\n      \"size\": [\n        360,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"chickens.mp4\",\n              \"filename\": \"chickens.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008532\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"cam_tog\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        430,\n        90\n      ],\n      \"presentation\": [\n        20,\n        168,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"cam_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        430,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1 0\",\n      \"pos\": [\n        520,\n        175\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        520,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_close\": {\n      \"type\": \"message\",\n      \"text\": \"close\",\n      \"pos\": [\n        580,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab @output_texture 1 @automatic 1\",\n      \"pos\": [\n        520,\n        265\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"cam_plus\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        430,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"c_cam\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie\",\n      \"pos\": [\n        660,\n        130\n      ],\n      \"size\": [\n        360,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"src_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        130,\n        255\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"src_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 2\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRC\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_srcb\": {\n      \"type\": \"comment\",\n      \"text\": \"CLIP B \\u2014 the second input of the two-input effects (loads sunflower.mp4)\",\n      \"pos\": [\n        430,\n        400\n      ],\n      \"size\": [\n        340,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"plb_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        430,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"playlist_b\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        430,\n        455\n      ],\n      \"size\": [\n        300,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        222,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"sunflower.mp4\",\n              \"filename\": \"sunflower.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008533\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"s_vsrcb\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRCB\",\n      \"pos\": [\n        430,\n        540\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_srcb_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"CLIP B \\u2014 the second input\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        20,\n        198,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 20, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY) and lights the pane title\",\n      \"pos\": [\n        1460,\n        90\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1140,\n        50\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        300,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        400,\n        40,\n        280,\n        432\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 20,\n        \"num_lines_presentation\": 20,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 fx.tr.xfade\",\n              \"3 fx.tr.dissolve\",\n              \"4 fx.tr.gridwipe\",\n              \"5 fx.tr.shrinkwipe\",\n              \"6 fx.tr.vignettes\",\n              \"7 fx.tr.huefade\",\n              \"8 fx.tr.rotfade\",\n              \"9 fx.tr.slide\",\n              \"10 fx.tr.zoomfade\",\n              \"11 fx.alphaglue\",\n              \"12 fx.eclipse\",\n              \"13 fx.repos\",\n              \"14 fx.tp.warp\",\n              \"15 fx.concat\",\n              \"16 fx.multiplex\",\n              \"17 Vizzie XFADR\",\n              \"18 Vizzie MIXFADR\",\n              \"19 Vizzie CHROMAKEYR\",\n              \"20 Vizzie LUMAKEYR\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"VFX_SELECT\",\n            \"parameter_mmax\": 19,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VFX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"VFX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 20,\n        \"num_lines_presentation\": 20,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1240,\n        50\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1330,\n        50\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_hl\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        1140,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        502,\n        250,\n        134\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 fx.tr.xfade\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        508,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        640\n      ],\n      \"presentation\": [\n        18,\n        508,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        500,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 jit.fx.tr.xfade \\u2014 crossfade (0 = A, 1 = B)\",\n      \"pos\": [\n        30,\n        640\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN02\",\n      \"pos\": [\n        30,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 0.5\",\n      \"pos\": [\n        30,\n        832\n      ],\n      \"presentation\": [\n        18,\n        559,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        532,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.xfade; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        518,\n        20\n      ],\n      \"presentation\": [\n        18,\n        587,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX02\",\n      \"pos\": [\n        30,\n        877\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        198,\n        792\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        268,\n        502,\n        250,\n        163\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 fx.tr.dissolve\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        276,\n        508,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1142,\n        640\n      ],\n      \"presentation\": [\n        276,\n        508,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1142,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1142,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 jit.fx.tr.dissolve \\u2014 random-pixel dissolve (amt 0 = A, 1 = B)\",\n      \"pos\": [\n        640,\n        640\n      ],\n      \"size\": [\n        492,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN03\",\n      \"pos\": [\n        640,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.dissolve @amt 0.5\",\n      \"pos\": [\n        640,\n        858\n      ],\n      \"presentation\": [\n        276,\n        605,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        760,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        532,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        780,\n        736\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        555,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        800,\n        762\n      ],\n      \"attrs\": {\n        \"attr\": \"freq\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        578,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        276,\n        633,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX03\",\n      \"pos\": [\n        640,\n        903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        815,\n        818\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        526,\n        502,\n        280,\n        209\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 fx.tr.gridwipe\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        534,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1752,\n        640\n      ],\n      \"presentation\": [\n        534,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1752,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1752,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 jit.fx.tr.gridwipe \\u2014 wipe through a grid of cells\",\n      \"pos\": [\n        1282,\n        640\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN04\",\n      \"pos\": [\n        1282,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.gridwipe @wipe 0.5 0.5\",\n      \"pos\": [\n        1282,\n        910\n      ],\n      \"presentation\": [\n        534,\n        651,\n        264,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1402,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"wipe\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        532,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1422,\n        736\n      ],\n      \"attrs\": {\n        \"attr\": \"scale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        555,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1442,\n        762\n      ],\n      \"attrs\": {\n        \"attr\": \"origin\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        578,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1462,\n        788\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        601,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1482,\n        814\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        624,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        534,\n        679,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX04\",\n      \"pos\": [\n        1282,\n        955\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1492,\n        870\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        814,\n        502,\n        280,\n        186\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 fx.tr.shrinkwipe\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        822,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1055\n      ],\n      \"presentation\": [\n        822,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        500,\n        1085\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1115\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 jit.fx.tr.shrinkwipe \\u2014 wipe by shrinking cells\",\n      \"pos\": [\n        30,\n        1055\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN05\",\n      \"pos\": [\n        30,\n        1085\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.shrinkwipe @wipe 0.5 0.5\",\n      \"pos\": [\n        30,\n        1299\n      ],\n      \"presentation\": [\n        822,\n        628,\n        264,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1125\n      ],\n      \"attrs\": {\n        \"attr\": \"wipe\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        822,\n        532,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        1151\n      ],\n      \"attrs\": {\n        \"attr\": \"scale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        822,\n        555,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        1177\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        822,\n        578,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        1203\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        822,\n        601,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        822,\n        656,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX05\",\n      \"pos\": [\n        30,\n        1344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        254,\n        1259\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1102,\n        502,\n        280,\n        186\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 fx.tr.vignettes\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1110,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1055\n      ],\n      \"presentation\": [\n        1110,\n        508,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1110,\n        1085\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1115\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 jit.fx.tr.vignettes \\u2014 wipe through vignettes\",\n      \"pos\": [\n        640,\n        1055\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN06\",\n      \"pos\": [\n        640,\n        1085\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.vignettes @wipe 0.5 0.5\",\n      \"pos\": [\n        640,\n        1299\n      ],\n      \"presentation\": [\n        1110,\n        628,\n        264,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        760,\n        1125\n      ],\n      \"attrs\": {\n        \"attr\": \"wipe\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1110,\n        532,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        780,\n        1151\n      ],\n      \"attrs\": {\n        \"attr\": \"scale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1110,\n        555,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        800,\n        1177\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1110,\n        578,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        820,\n        1203\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1110,\n        601,\n        264,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        1110,\n        656,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX06\",\n      \"pos\": [\n        640,\n        1344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        857,\n        1259\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        721,\n        250,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 fx.tr.huefade\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        18,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        1055\n      ],\n      \"presentation\": [\n        18,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1720,\n        1085\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        1115\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 jit.fx.tr.huefade \\u2014 fade through hue\",\n      \"pos\": [\n        1250,\n        1055\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN07\",\n      \"pos\": [\n        1250,\n        1085\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.huefade @amt 0.5\",\n      \"pos\": [\n        1250,\n        1247\n      ],\n      \"presentation\": [\n        18,\n        778,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1370,\n        1125\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        751,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        806,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX07\",\n      \"pos\": [\n        1250,\n        1292\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1418,\n        1207\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        268,\n        721,\n        250,\n        199\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 fx.tr.rotfade\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        276,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        524,\n        1444\n      ],\n      \"presentation\": [\n        276,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        524,\n        1474\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        524,\n        1504\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 jit.fx.tr.rotfade \\u2014 fade while rotating (help-file rotation)\",\n      \"pos\": [\n        30,\n        1444\n      ],\n      \"size\": [\n        484,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN08\",\n      \"pos\": [\n        30,\n        1474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.rotfade @amt 0.5 @rotation 180\",\n      \"pos\": [\n        30,\n        1688\n      ],\n      \"presentation\": [\n        276,\n        847,\n        234,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1514\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        751,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        1540\n      ],\n      \"attrs\": {\n        \"attr\": \"rotation\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        774,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        1566\n      ],\n      \"attrs\": {\n        \"attr\": \"motionblur\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        797,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        1592\n      ],\n      \"attrs\": {\n        \"attr\": \"bluramount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        820,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        276,\n        888,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX08\",\n      \"pos\": [\n        30,\n        1733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        296,\n        1648\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        526,\n        721,\n        250,\n        186\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 fx.tr.slide\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        534,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1134,\n        1444\n      ],\n      \"presentation\": [\n        534,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1134,\n        1474\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1134,\n        1504\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 jit.fx.tr.slide \\u2014 slide B in over A\",\n      \"pos\": [\n        664,\n        1444\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN09\",\n      \"pos\": [\n        664,\n        1474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.slide @amt 0.5\",\n      \"pos\": [\n        664,\n        1688\n      ],\n      \"presentation\": [\n        534,\n        847,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        784,\n        1514\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        751,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        804,\n        1540\n      ],\n      \"attrs\": {\n        \"attr\": \"slidedir\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        774,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        824,\n        1566\n      ],\n      \"attrs\": {\n        \"attr\": \"motionblur\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        797,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        844,\n        1592\n      ],\n      \"attrs\": {\n        \"attr\": \"bluramount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        820,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        534,\n        875,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX09\",\n      \"pos\": [\n        664,\n        1733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        818,\n        1648\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        784,\n        721,\n        250,\n        199\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 fx.tr.zoomfade\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        792,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1747,\n        1444\n      ],\n      \"presentation\": [\n        792,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1747,\n        1474\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1747,\n        1504\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 jit.fx.tr.zoomfade \\u2014 fade while zooming (help-file zoom)\",\n      \"pos\": [\n        1274,\n        1444\n      ],\n      \"size\": [\n        463,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN10\",\n      \"pos\": [\n        1274,\n        1474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.zoomfade @amt 0.5 @zoom 2.\",\n      \"pos\": [\n        1274,\n        1688\n      ],\n      \"presentation\": [\n        792,\n        847,\n        234,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1394,\n        1514\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        751,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1414,\n        1540\n      ],\n      \"attrs\": {\n        \"attr\": \"zoom\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        774,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1434,\n        1566\n      ],\n      \"attrs\": {\n        \"attr\": \"motionblur\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        797,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1454,\n        1592\n      ],\n      \"attrs\": {\n        \"attr\": \"bluramount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        820,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        792,\n        888,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX10\",\n      \"pos\": [\n        1274,\n        1733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1512,\n        1648\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1042,\n        721,\n        250,\n        186\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 fx.alphaglue\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1050,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        654,\n        1833\n      ],\n      \"presentation\": [\n        1050,\n        727,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        654,\n        1863\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        654,\n        1893\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 jit.fx.alphaglue \\u2014 B's brightness becomes A's alpha (shows over the dry clip)\",\n      \"pos\": [\n        30,\n        1833\n      ],\n      \"size\": [\n        614,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN11\",\n      \"pos\": [\n        30,\n        1863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.alphaglue @lum2alpha 1.\",\n      \"pos\": [\n        30,\n        2077\n      ],\n      \"presentation\": [\n        1050,\n        847,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f11_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1903\n      ],\n      \"attrs\": {\n        \"attr\": \"lum2alpha\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        751,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        1929\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        774,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        1955\n      ],\n      \"attrs\": {\n        \"attr\": \"thresh\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        797,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        1981\n      ],\n      \"attrs\": {\n        \"attr\": \"plane\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        820,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        1050,\n        875,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX11\",\n      \"pos\": [\n        30,\n        2122\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        226,\n        2037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        930,\n        250,\n        180\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 fx.eclipse\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1382,\n        1833\n      ],\n      \"presentation\": [\n        18,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1382,\n        1863\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1382,\n        1893\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 jit.fx.eclipse \\u2014 a grid of A tinted by B (help file sweeps steps 10\\u2013500)\",\n      \"pos\": [\n        794,\n        1833\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN12\",\n      \"pos\": [\n        794,\n        1863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.eclipse @steps 8 8\",\n      \"pos\": [\n        794,\n        2051\n      ],\n      \"presentation\": [\n        18,\n        1033,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f12_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        914,\n        1903\n      ],\n      \"attrs\": {\n        \"attr\": \"steps\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        960,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        934,\n        1929\n      ],\n      \"attrs\": {\n        \"attr\": \"enable_tint\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        983,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        954,\n        1955\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1006,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.eclipse; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        535,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1061,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX12\",\n      \"pos\": [\n        794,\n        2096\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        955,\n        2011\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        268,\n        930,\n        250,\n        203\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 fx.repos\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        276,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2031,\n        1833\n      ],\n      \"presentation\": [\n        276,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        2031,\n        1863\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2031,\n        1893\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 jit.fx.repos \\u2014 B's colours move A's pixels (relative offsets)\",\n      \"pos\": [\n        1522,\n        1833\n      ],\n      \"size\": [\n        499,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN13\",\n      \"pos\": [\n        1522,\n        1863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.repos @amt 0.1 @mode 1\",\n      \"pos\": [\n        1522,\n        2077\n      ],\n      \"presentation\": [\n        276,\n        1056,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f13_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1642,\n        1903\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        960,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1662,\n        1929\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        983,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1682,\n        1955\n      ],\n      \"attrs\": {\n        \"attr\": \"boundmode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        1006,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1702,\n        1981\n      ],\n      \"attrs\": {\n        \"attr\": \"channel\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        276,\n        1029,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.repos; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        518,\n        20\n      ],\n      \"presentation\": [\n        276,\n        1084,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX13\",\n      \"pos\": [\n        1522,\n        2122\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1711,\n        2037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        526,\n        930,\n        250,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 fx.tp.warp\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        534,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2222\n      ],\n      \"presentation\": [\n        534,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        500,\n        2252\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2282\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 jit.fx.tp.warp \\u2014 time-warp slices of A, timed by B\",\n      \"pos\": [\n        30,\n        2222\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN14\",\n      \"pos\": [\n        30,\n        2252\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tp.warp\",\n      \"pos\": [\n        30,\n        2414\n      ],\n      \"presentation\": [\n        534,\n        987,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        2292\n      ],\n      \"attrs\": {\n        \"attr\": \"num_slices\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        534,\n        960,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        534,\n        1015,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX14\",\n      \"pos\": [\n        30,\n        2459\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        114,\n        2374\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        784,\n        930,\n        250,\n        134\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 fx.concat\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        792,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        2222\n      ],\n      \"presentation\": [\n        792,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1110,\n        2252\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        2282\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 jit.fx.concat \\u2014 A and B side by side\",\n      \"pos\": [\n        640,\n        2222\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN15\",\n      \"pos\": [\n        640,\n        2252\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.concat\",\n      \"pos\": [\n        640,\n        2414\n      ],\n      \"presentation\": [\n        792,\n        987,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        760,\n        2292\n      ],\n      \"attrs\": {\n        \"attr\": \"concatdim\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        792,\n        960,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.concat; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        526,\n        20\n      ],\n      \"presentation\": [\n        792,\n        1015,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX15\",\n      \"pos\": [\n        640,\n        2459\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        717,\n        2374\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1042,\n        930,\n        250,\n        134\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 fx.multiplex\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1050,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        2222\n      ],\n      \"presentation\": [\n        1050,\n        936,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        1720,\n        2252\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        2282\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 jit.fx.multiplex \\u2014 A and B interleaved line by line\",\n      \"pos\": [\n        1250,\n        2222\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN16\",\n      \"pos\": [\n        1250,\n        2252\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.multiplex\",\n      \"pos\": [\n        1250,\n        2414\n      ],\n      \"presentation\": [\n        1050,\n        987,\n        234,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1370,\n        2292\n      ],\n      \"attrs\": {\n        \"attr\": \"multiplexdim\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        1050,\n        960,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.multiplex; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        552,\n        20\n      ],\n      \"presentation\": [\n        1050,\n        1015,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX16\",\n      \"pos\": [\n        1250,\n        2459\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1348,\n        2374\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1143,\n        138,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 Vizzie XFADR\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1149,\n        122,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2559\n      ],\n      \"presentation\": [\n        18,\n        1149,\n        122,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        500,\n        2589\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2619\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 XFADR \\u2014 crossfade A and B\",\n      \"pos\": [\n        30,\n        2559\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN17\",\n      \"pos\": [\n        30,\n        2589\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        2669\n      ],\n      \"size\": [\n        118,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1173,\n        118,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.xfadr.maxpat\",\n        \"varname\": \"xfadr\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Crossfade ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.xfadr.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Crossfade ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f17_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX17\",\n      \"pos\": [\n        30,\n        2834\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        70,\n        2629\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1309,\n        122,\n        66\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 4\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        156,\n        1143,\n        184,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 Vizzie MIXFADR\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        164,\n        1149,\n        168,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        2559\n      ],\n      \"presentation\": [\n        164,\n        1149,\n        168,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        1110,\n        2589\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        2619\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 MIXFADR \\u2014 crossfade with an operator mode\",\n      \"pos\": [\n        640,\n        2559\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN18\",\n      \"pos\": [\n        640,\n        2589\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        2669\n      ],\n      \"size\": [\n        168,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        164,\n        1173,\n        168,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.mixfadr.maxpat\",\n        \"varname\": \"mixfadr\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input | in 3: Crossfade | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.mixfadr.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input | in 3: Crossfade | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f18_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX18\",\n      \"pos\": [\n        640,\n        2834\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        683,\n        2629\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        164,\n        1309,\n        168,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        348,\n        1143,\n        424,\n        229\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f19_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 Vizzie CHROMAKEYR\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        356,\n        1149,\n        408,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_19\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1728,\n        2559\n      ],\n      \"presentation\": [\n        356,\n        1149,\n        408,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f19_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"18\",\n      \"pos\": [\n        1728,\n        2589\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1728,\n        2619\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 CHROMAKEYR \\u2014 chroma key\",\n      \"pos\": [\n        1250,\n        2559\n      ],\n      \"size\": [\n        468,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN19\",\n      \"pos\": [\n        1250,\n        2589\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        2669\n      ],\n      \"size\": [\n        408,\n        146\n      ],\n      \"inlets\": 7,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        356,\n        1173,\n        408,\n        146\n      ],\n      \"attrs\": {\n        \"name\": \"vz.chromakeyr.maxpat\",\n        \"varname\": \"chromakeyr\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Red keying value | in 3: Green keying value | in 4: Blue keying value | in 5: Chromakeying tolerance  | in 6: Chromakeying fade | out 0: Video output | out 1: Red chromakey value ( (0. - 1.0) | out 2: Green chromakey value ( (0. - 1.0) | out 3: Blue chromakey value ( (0. - 1.0)\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.chromakeyr.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Red keying value | in 3: Green keying value | in 4: Blue keying value | in 5: Chromakeying tolerance  | in 6: Chromakeying fade | out 0: Video output | out 1: Red chromakey value ( (0. - 1.0) | out 2: Green chromakey value ( (0. - 1.0) | out 3: Blue chromakey value ( (0. - 1.0)\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f19_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX19\",\n      \"pos\": [\n        1250,\n        2850\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1311,\n        2629\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        356,\n        1325,\n        408,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        780,\n        1143,\n        466,\n        212\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f20_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 Vizzie LUMAKEYR\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        788,\n        1149,\n        450,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_20\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        550,\n        2950\n      ],\n      \"presentation\": [\n        788,\n        1149,\n        450,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f20_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"19\",\n      \"pos\": [\n        550,\n        2980\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f20_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        550,\n        3010\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 LUMAKEYR \\u2014 luma key\",\n      \"pos\": [\n        30,\n        2950\n      ],\n      \"size\": [\n        510,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN20\",\n      \"pos\": [\n        30,\n        2980\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f20_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        3060\n      ],\n      \"size\": [\n        450,\n        146\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        788,\n        1173,\n        450,\n        146\n      ],\n      \"attrs\": {\n        \"name\": \"vz.lumakeyr.maxpat\",\n        \"varname\": \"lumakeyr\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Luminance value | in 3: Chromakeying tolerance | in 4: Chromakeying fade | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.lumakeyr.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Luminance value | in 3: Chromakeying tolerance | in 4: Chromakeying fade | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f20_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX20\",\n      \"pos\": [\n        30,\n        3241\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        133,\n        3020\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f20_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        788,\n        1325,\n        450,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_route\": {\n      \"type\": \"comment\",\n      \"text\": \"ROUTER \\u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself\",\n      \"pos\": [\n        30,\n        3341\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3391\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"g_rsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        1550,\n        3391\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 20\",\n      \"pos\": [\n        30,\n        3431\n      ],\n      \"size\": [\n        1558,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 20,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"g_s2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN02\",\n      \"pos\": [\n        110,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s3\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN03\",\n      \"pos\": [\n        190,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s4\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN04\",\n      \"pos\": [\n        270,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s5\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN05\",\n      \"pos\": [\n        350,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s6\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN06\",\n      \"pos\": [\n        430,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s7\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN07\",\n      \"pos\": [\n        510,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s8\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN08\",\n      \"pos\": [\n        590,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s9\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN09\",\n      \"pos\": [\n        670,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s10\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN10\",\n      \"pos\": [\n        750,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s11\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN11\",\n      \"pos\": [\n        830,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s12\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN12\",\n      \"pos\": [\n        910,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s13\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN13\",\n      \"pos\": [\n        990,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s14\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN14\",\n      \"pos\": [\n        1070,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s15\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN15\",\n      \"pos\": [\n        1150,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s16\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN16\",\n      \"pos\": [\n        1230,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s17\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN17\",\n      \"pos\": [\n        1310,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s18\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN18\",\n      \"pos\": [\n        1390,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s19\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN19\",\n      \"pos\": [\n        1470,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s20\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN20\",\n      \"pos\": [\n        1550,\n        3486\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"sw_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3561\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        110,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX02\",\n      \"pos\": [\n        190,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX03\",\n      \"pos\": [\n        270,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX04\",\n      \"pos\": [\n        350,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX05\",\n      \"pos\": [\n        430,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX06\",\n      \"pos\": [\n        510,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX07\",\n      \"pos\": [\n        590,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX08\",\n      \"pos\": [\n        670,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX09\",\n      \"pos\": [\n        750,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX10\",\n      \"pos\": [\n        830,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX11\",\n      \"pos\": [\n        910,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX12\",\n      \"pos\": [\n        990,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX13\",\n      \"pos\": [\n        1070,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX14\",\n      \"pos\": [\n        1150,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX15\",\n      \"pos\": [\n        1230,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX16\",\n      \"pos\": [\n        1310,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX17\",\n      \"pos\": [\n        1390,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX18\",\n      \"pos\": [\n        1470,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r19\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX19\",\n      \"pos\": [\n        1550,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r20\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX20\",\n      \"pos\": [\n        1630,\n        3561\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wet_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 20\",\n      \"pos\": [\n        30,\n        3616\n      ],\n      \"size\": [\n        1638,\n        22\n      ],\n      \"inlets\": 21,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VWET\",\n      \"pos\": [\n        30,\n        3671\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld\",\n      \"pos\": [\n        30,\n        3731\n      ],\n      \"size\": [\n        800,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"m_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        30,\n        3771\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_rwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VWET\",\n      \"pos\": [\n        110,\n        3771\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf_ui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        3771\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        700,\n        316,\n        300,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 1.\",\n      \"pos\": [\n        30,\n        3821\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"m_layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer @blend_enable 0\",\n      \"pos\": [\n        30,\n        3871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"pworld\": {\n      \"type\": \"jit.pworld\",\n      \"pos\": [\n        30,\n        3921\n      ],\n      \"size\": [\n        480,\n        270\n      ],\n      \"attrs\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        700,\n        40,\n        480,\n        270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1360,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        380,\n        482\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1430,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        396,\n        10,\n        294,\n        482\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_out_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1500,\n        4231\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        696,\n        10,\n        494,\n        482\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop movies on the player; click a clip to play it\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        433,\n        20\n      ],\n      \"presentation\": [\n        20,\n        144,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_cam_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam (loads off) \\u2014 on replaces the movie\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        48,\n        170,\n        332,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT \\u2014 click one\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        406,\n        16,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_out_title\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT \\u2014 only the chosen effect runs\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        314,\n        20\n      ],\n      \"presentation\": [\n        706,\n        16,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_xf_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"xfade: 0 = dry source, 1 = the effect (loads 1)\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        407,\n        20\n      ],\n      \"presentation\": [\n        706,\n        342,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"v1_0\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        2520,\n        1234\n      ],\n      \"text\": \"v1.0\",\n      \"size\": [\n        44,\n        20\n      ],\n      \"presentation\": [\n        1200,\n        16,\n        44,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"pl_lm\",\n      0,\n      \"playlist\",\n      0\n    ],\n    [\n      \"cam_tog\",\n      0,\n      \"cam_t\",\n      0\n    ],\n    [\n      \"cam_t\",\n      1,\n      \"cam_sel\",\n      0\n    ],\n    [\n      \"cam_t\",\n      0,\n      \"cam_plus\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      0,\n      \"cam_open\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      1,\n      \"cam_close\",\n      0\n    ],\n    [\n      \"cam_open\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"cam_close\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"src_lm\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"cam_plus\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"src_sw\",\n      1\n    ],\n    [\n      \"cam_grab\",\n      0,\n      \"src_sw\",\n      2\n    ],\n    [\n      \"src_sw\",\n      0,\n      \"s_vsrc\",\n      0\n    ],\n    [\n      \"plb_lm\",\n      0,\n      \"playlist_b\",\n      0\n    ],\n    [\n      \"playlist_b\",\n      0,\n      \"s_vsrcb\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"lm_hl\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rin\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sout\",\n      0\n    ],\n    [\n      \"f02_rb1\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rin\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c2\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sout\",\n      0\n    ],\n    [\n      \"f03_rb1\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rin\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c2\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c3\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c4\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sout\",\n      0\n    ],\n    [\n      \"f04_rb1\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rin\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c2\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c3\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sout\",\n      0\n    ],\n    [\n      \"f05_rb1\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rin\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c1\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c2\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c3\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sout\",\n      0\n    ],\n    [\n      \"f06_rb1\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rin\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sout\",\n      0\n    ],\n    [\n      \"f07_rb1\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rin\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c0\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c1\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c2\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c3\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sout\",\n      0\n    ],\n    [\n      \"f08_rb1\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rin\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c0\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c1\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c2\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c3\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sout\",\n      0\n    ],\n    [\n      \"f09_rb1\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rin\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c0\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c1\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c2\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c3\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sout\",\n      0\n    ],\n    [\n      \"f10_rb1\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rin\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c0\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c1\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c2\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c3\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sout\",\n      0\n    ],\n    [\n      \"f11_rb1\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rin\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c0\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c1\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c2\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sout\",\n      0\n    ],\n    [\n      \"f12_rb1\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rin\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c0\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c1\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c2\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c3\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sout\",\n      0\n    ],\n    [\n      \"f13_rb1\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rin\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c0\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sout\",\n      0\n    ],\n    [\n      \"f14_rb1\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rin\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_c0\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sout\",\n      0\n    ],\n    [\n      \"f15_rb1\",\n      0,\n      \"f15_obj\",\n      1\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_rin\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c0\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      0,\n      \"f16_sout\",\n      0\n    ],\n    [\n      \"f16_rb1\",\n      0,\n      \"f16_obj\",\n      1\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_rin\",\n      0,\n      \"f17_bp\",\n      0\n    ],\n    [\n      \"f17_bp\",\n      0,\n      \"f17_sout\",\n      0\n    ],\n    [\n      \"f17_rb1\",\n      0,\n      \"f17_bp\",\n      1\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_rin\",\n      0,\n      \"f18_bp\",\n      0\n    ],\n    [\n      \"f18_bp\",\n      0,\n      \"f18_sout\",\n      0\n    ],\n    [\n      \"f18_rb1\",\n      0,\n      \"f18_bp\",\n      1\n    ],\n    [\n      \"f19_tbtn\",\n      0,\n      \"f19_tsel\",\n      0\n    ],\n    [\n      \"f19_tsel\",\n      0,\n      \"f19_tsend\",\n      0\n    ],\n    [\n      \"f19_rin\",\n      0,\n      \"f19_bp\",\n      0\n    ],\n    [\n      \"f19_bp\",\n      0,\n      \"f19_sout\",\n      0\n    ],\n    [\n      \"f19_rb1\",\n      0,\n      \"f19_bp\",\n      1\n    ],\n    [\n      \"f20_tbtn\",\n      0,\n      \"f20_tsel\",\n      0\n    ],\n    [\n      \"f20_tsel\",\n      0,\n      \"f20_tsend\",\n      0\n    ],\n    [\n      \"f20_rin\",\n      0,\n      \"f20_bp\",\n      0\n    ],\n    [\n      \"f20_bp\",\n      0,\n      \"f20_sout\",\n      0\n    ],\n    [\n      \"f20_rb1\",\n      0,\n      \"f20_bp\",\n      1\n    ],\n    [\n      \"g_rsel\",\n      0,\n      \"gate\",\n      0\n    ],\n    [\n      \"g_rsrc\",\n      0,\n      \"gate\",\n      1\n    ],\n    [\n      \"gate\",\n      1,\n      \"g_s2\",\n      0\n    ],\n    [\n      \"gate\",\n      2,\n      \"g_s3\",\n      0\n    ],\n    [\n      \"gate\",\n      3,\n      \"g_s4\",\n      0\n    ],\n    [\n      \"gate\",\n      4,\n      \"g_s5\",\n      0\n    ],\n    [\n      \"gate\",\n      5,\n      \"g_s6\",\n      0\n    ],\n    [\n      \"gate\",\n      6,\n      \"g_s7\",\n      0\n    ],\n    [\n      \"gate\",\n      7,\n      \"g_s8\",\n      0\n    ],\n    [\n      \"gate\",\n      8,\n      \"g_s9\",\n      0\n    ],\n    [\n      \"gate\",\n      9,\n      \"g_s10\",\n      0\n    ],\n    [\n      \"gate\",\n      10,\n      \"g_s11\",\n      0\n    ],\n    [\n      \"gate\",\n      11,\n      \"g_s12\",\n      0\n    ],\n    [\n      \"gate\",\n      12,\n      \"g_s13\",\n      0\n    ],\n    [\n      \"gate\",\n      13,\n      \"g_s14\",\n      0\n    ],\n    [\n      \"gate\",\n      14,\n      \"g_s15\",\n      0\n    ],\n    [\n      \"gate\",\n      15,\n      \"g_s16\",\n      0\n    ],\n    [\n      \"gate\",\n      16,\n      \"g_s17\",\n      0\n    ],\n    [\n      \"gate\",\n      17,\n      \"g_s18\",\n      0\n    ],\n    [\n      \"gate\",\n      18,\n      \"g_s19\",\n      0\n    ],\n    [\n      \"gate\",\n      19,\n      \"g_s20\",\n      0\n    ],\n    [\n      \"sw_rsel\",\n      0,\n      \"wet_sw\",\n      0\n    ],\n    [\n      \"sw_rdry\",\n      0,\n      \"wet_sw\",\n      1\n    ],\n    [\n      \"sw_r2\",\n      0,\n      \"wet_sw\",\n      2\n    ],\n    [\n      \"sw_r3\",\n      0,\n      \"wet_sw\",\n      3\n    ],\n    [\n      \"sw_r4\",\n      0,\n      \"wet_sw\",\n      4\n    ],\n    [\n      \"sw_r5\",\n      0,\n      \"wet_sw\",\n      5\n    ],\n    [\n      \"sw_r6\",\n      0,\n      \"wet_sw\",\n      6\n    ],\n    [\n      \"sw_r7\",\n      0,\n      \"wet_sw\",\n      7\n    ],\n    [\n      \"sw_r8\",\n      0,\n      \"wet_sw\",\n      8\n    ],\n    [\n      \"sw_r9\",\n      0,\n      \"wet_sw\",\n      9\n    ],\n    [\n      \"sw_r10\",\n      0,\n      \"wet_sw\",\n      10\n    ],\n    [\n      \"sw_r11\",\n      0,\n      \"wet_sw\",\n      11\n    ],\n    [\n      \"sw_r12\",\n      0,\n      \"wet_sw\",\n      12\n    ],\n    [\n      \"sw_r13\",\n      0,\n      \"wet_sw\",\n      13\n    ],\n    [\n      \"sw_r14\",\n      0,\n      \"wet_sw\",\n      14\n    ],\n    [\n      \"sw_r15\",\n      0,\n      \"wet_sw\",\n      15\n    ],\n    [\n      \"sw_r16\",\n      0,\n      \"wet_sw\",\n      16\n    ],\n    [\n      \"sw_r17\",\n      0,\n      \"wet_sw\",\n      17\n    ],\n    [\n      \"sw_r18\",\n      0,\n      \"wet_sw\",\n      18\n    ],\n    [\n      \"sw_r19\",\n      0,\n      \"wet_sw\",\n      19\n    ],\n    [\n      \"sw_r20\",\n      0,\n      \"wet_sw\",\n      20\n    ],\n    [\n      \"wet_sw\",\n      0,\n      \"s_vwet\",\n      0\n    ],\n    [\n      \"m_rdry\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_xf_ui\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_rwet\",\n      0,\n      \"m_xf\",\n      1\n    ],\n    [\n      \"m_xf\",\n      0,\n      \"m_layer\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-19",
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
            "obj-22",
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
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-26",
            0
          ],
          "source": [
            "obj-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-26",
            0
          ],
          "source": [
            "obj-23",
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
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-33",
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
            "obj-34",
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
            "obj-37",
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
            "obj-37",
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
            "obj-40",
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
            "obj-37",
            1
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
            "obj-45",
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
            "obj-46",
            0
          ],
          "source": [
            "obj-45",
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
            "obj-49",
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
            "obj-49",
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
            "obj-49",
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
            "obj-54",
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
            "obj-49",
            1
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
            "obj-59",
            0
          ],
          "source": [
            "obj-58",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            0
          ],
          "source": [
            "obj-59",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-63",
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
            "obj-63",
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
            "obj-63",
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
            "obj-63",
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
            "obj-63",
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
            "obj-63",
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
            "obj-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-63",
            1
          ],
          "source": [
            "obj-71",
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
            "obj-79",
            0
          ],
          "source": [
            "obj-81",
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
            "obj-82",
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
            "obj-83",
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
            "obj-79",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-79",
            1
          ],
          "source": [
            "obj-86",
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
            "obj-91",
            0
          ],
          "source": [
            "obj-90",
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
            "obj-94",
            0
          ],
          "source": [
            "obj-95",
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
            "obj-96",
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
            "obj-97",
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
            "obj-94",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-94",
            1
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
            "obj-105",
            0
          ],
          "source": [
            "obj-104",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-106",
            0
          ],
          "source": [
            "obj-105",
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
            "obj-109",
            0
          ],
          "source": [
            "obj-110",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-112",
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
            "obj-109",
            1
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
            "obj-117",
            0
          ],
          "source": [
            "obj-116",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-118",
            0
          ],
          "source": [
            "obj-117",
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
            "obj-121",
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
            "obj-121",
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
            "obj-121",
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
            "obj-121",
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
            "obj-127",
            0
          ],
          "source": [
            "obj-121",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-121",
            1
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
            "obj-136",
            0
          ],
          "source": [
            "obj-137",
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
            "obj-138",
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
            "obj-139",
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
            "obj-136",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            1
          ],
          "source": [
            "obj-143",
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
            "obj-148",
            0
          ],
          "source": [
            "obj-147",
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
            "obj-151",
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
            "obj-151",
            0
          ],
          "source": [
            "obj-153",
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
            "obj-154",
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
            "obj-151",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-151",
            1
          ],
          "source": [
            "obj-158",
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
            "obj-163",
            0
          ],
          "source": [
            "obj-162",
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
            "obj-166",
            0
          ],
          "source": [
            "obj-167",
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
            "obj-168",
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
            "obj-169",
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
            "obj-166",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-166",
            1
          ],
          "source": [
            "obj-173",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-177",
            0
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
            "obj-178",
            0
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
            "obj-181",
            0
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
            "obj-181",
            0
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
            "obj-181",
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
            "obj-186",
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
            "obj-181",
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
            "obj-191",
            0
          ],
          "source": [
            "obj-190",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-192",
            0
          ],
          "source": [
            "obj-191",
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
            "obj-195",
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
            "obj-195",
            0
          ],
          "source": [
            "obj-198",
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
            "obj-199",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-201",
            0
          ],
          "source": [
            "obj-195",
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
            "obj-202",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-206",
            0
          ],
          "source": [
            "obj-205",
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
            "obj-210",
            0
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
            "obj-210",
            0
          ],
          "source": [
            "obj-211",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-213",
            0
          ],
          "source": [
            "obj-210",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-210",
            1
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
            "obj-218",
            0
          ],
          "source": [
            "obj-217",
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
            "obj-222",
            0
          ],
          "source": [
            "obj-221",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-222",
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
            0
          ],
          "source": [
            "obj-222",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-222",
            1
          ],
          "source": [
            "obj-226",
            0
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
            "obj-229",
            0
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
            "obj-230",
            0
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
            "obj-233",
            0
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
            "obj-235",
            0
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
            "obj-234",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-234",
            1
          ],
          "source": [
            "obj-238",
            0
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
            "obj-241",
            0
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
            "obj-242",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-246",
            0
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
            "obj-247",
            0
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
            "obj-246",
            1
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
            "obj-253",
            0
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
            "obj-254",
            0
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
            "obj-257",
            0
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
            "obj-258",
            0
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
            "obj-257",
            1
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
            0
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
            "obj-268",
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
            "obj-269",
            0
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
            "obj-268",
            1
          ],
          "source": [
            "obj-270",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-275",
            0
          ],
          "source": [
            "obj-274",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-276",
            0
          ],
          "source": [
            "obj-275",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-279",
            0
          ],
          "source": [
            "obj-278",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-280",
            0
          ],
          "source": [
            "obj-279",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-279",
            1
          ],
          "source": [
            "obj-281",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-286",
            0
          ],
          "source": [
            "obj-284",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-286",
            1
          ],
          "source": [
            "obj-285",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-287",
            0
          ],
          "source": [
            "obj-286",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-288",
            0
          ],
          "source": [
            "obj-286",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-289",
            0
          ],
          "source": [
            "obj-286",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-290",
            0
          ],
          "source": [
            "obj-286",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-291",
            0
          ],
          "source": [
            "obj-286",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-292",
            0
          ],
          "source": [
            "obj-286",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-293",
            0
          ],
          "source": [
            "obj-286",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-294",
            0
          ],
          "source": [
            "obj-286",
            8
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-295",
            0
          ],
          "source": [
            "obj-286",
            9
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-296",
            0
          ],
          "source": [
            "obj-286",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-297",
            0
          ],
          "source": [
            "obj-286",
            11
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-298",
            0
          ],
          "source": [
            "obj-286",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-299",
            0
          ],
          "source": [
            "obj-286",
            13
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-300",
            0
          ],
          "source": [
            "obj-286",
            14
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-301",
            0
          ],
          "source": [
            "obj-286",
            15
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-302",
            0
          ],
          "source": [
            "obj-286",
            16
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-303",
            0
          ],
          "source": [
            "obj-286",
            17
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-304",
            0
          ],
          "source": [
            "obj-286",
            18
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-305",
            0
          ],
          "source": [
            "obj-286",
            19
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            0
          ],
          "source": [
            "obj-306",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            1
          ],
          "source": [
            "obj-307",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            2
          ],
          "source": [
            "obj-308",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            3
          ],
          "source": [
            "obj-309",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            4
          ],
          "source": [
            "obj-310",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            5
          ],
          "source": [
            "obj-311",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            6
          ],
          "source": [
            "obj-312",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            7
          ],
          "source": [
            "obj-313",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            8
          ],
          "source": [
            "obj-314",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            9
          ],
          "source": [
            "obj-315",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            10
          ],
          "source": [
            "obj-316",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            11
          ],
          "source": [
            "obj-317",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            12
          ],
          "source": [
            "obj-318",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            13
          ],
          "source": [
            "obj-319",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            14
          ],
          "source": [
            "obj-320",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            15
          ],
          "source": [
            "obj-321",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            16
          ],
          "source": [
            "obj-322",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            17
          ],
          "source": [
            "obj-323",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            18
          ],
          "source": [
            "obj-324",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            19
          ],
          "source": [
            "obj-325",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-327",
            20
          ],
          "source": [
            "obj-326",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-328",
            0
          ],
          "source": [
            "obj-327",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-333",
            0
          ],
          "source": [
            "obj-330",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-333",
            0
          ],
          "source": [
            "obj-332",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-333",
            1
          ],
          "source": [
            "obj-331",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-334",
            0
          ],
          "source": [
            "obj-333",
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
