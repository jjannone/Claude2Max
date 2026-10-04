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
      1244.0,
      1863.0
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
          "text": "VIDEO BLEND SHOOTOUT v1.0 \u2014 blend modes and keyers: clip A (movie or webcam) over clip B. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture. Clip B (sunflower.mp4) on s VSRCB is the second input of every two-input effect."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 28, conventional order. The v8 maps item index \u2192 slot number (1 = DRY) and lights the pane title"
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
            604.0
          ],
          "num_lines_patching": 28,
          "num_lines_presentation": 28,
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
                "2 fx.co.normal",
                "3 fx.co.additive",
                "4 fx.co.subtractive",
                "5 fx.co.multiply",
                "6 fx.co.screen",
                "7 fx.co.overlay",
                "8 fx.co.softlight",
                "9 fx.co.hardlight",
                "10 fx.co.brightlight",
                "11 fx.co.darken",
                "12 fx.co.lighten",
                "13 fx.co.difference",
                "14 fx.co.exclude",
                "15 fx.co.negate",
                "16 fx.co.average",
                "17 fx.co.burn",
                "18 fx.co.dodge",
                "19 fx.co.reflect",
                "20 fx.co.glow",
                "21 fx.co.freeze",
                "22 fx.co.heat",
                "23 fx.co.inverse",
                "24 fx.co.stamp",
                "25 fx.co.chromakey",
                "26 fx.co.lumakey",
                "27 Vizzie MODEMIXR",
                "28 Vizzie OPER8R"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "VFX_SELECT",
              "parameter_mmax": 27,
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
            144.0,
            20.0
          ],
          "text": "2 \u00b7 fx.co.normal",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            680.0,
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
            640.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            680.0,
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
          "id": "obj-33",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
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
            640.0,
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
            600.0,
            20.0
          ],
          "text": "2 \u00b7 jit.fx.co.normal \u2014 normal (amount per plane: 0 = A only, 1 = the full blend)"
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
            272.0,
            22.0
          ],
          "text": "jit.fx.co.normal @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            731.0,
            284.0,
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
            704.0,
            284.0,
            22.0
          ],
          "attr": "amount",
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
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            759.0,
            284.0,
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
            268.0,
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
          "text": "3 \u00b7 fx.co.additive",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            680.0,
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
          "id": "obj-44",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1382.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            680.0,
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
          "id": "obj-45",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1382.0,
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
            1382.0,
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
            780.0,
            640.0,
            592.0,
            20.0
          ],
          "text": "3 \u00b7 jit.fx.co.additive \u2014 add (amount per plane: 0 = A only, 1 = the full blend)"
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
            780.0,
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
            780.0,
            832.0,
            286.0,
            22.0
          ],
          "text": "jit.fx.co.additive @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            731.0,
            284.0,
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
            900.0,
            710.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            704.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            2520.0,
            164.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            759.0,
            284.0,
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
          "id": "obj-52",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            877.0,
            69.0,
            22.0
          ],
          "text": "s VFX03"
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
            1032.0,
            792.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            190.0,
            186.0,
            20.0
          ],
          "text": "4 \u00b7 fx.co.subtractive",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            680.0,
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
            2182.0,
            640.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            680.0,
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
          "id": "obj-57",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2182.0,
            670.0,
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
            2182.0,
            700.0,
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
            1522.0,
            640.0,
            650.0,
            20.0
          ],
          "text": "4 \u00b7 jit.fx.co.subtractive \u2014 subtract (amount per plane: 0 = A only, 1 = the full blend)"
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
            1522.0,
            670.0,
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
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1522.0,
            832.0,
            307.0,
            22.0
          ],
          "text": "jit.fx.co.subtractive @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            731.0,
            284.0,
            35.0
          ],
          "presentation_linecount": 2
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
            1642.0,
            710.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            704.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            2520.0,
            216.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            772.0,
            284.0,
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
          "id": "obj-64",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1522.0,
            877.0,
            69.0,
            22.0
          ],
          "text": "s VFX04"
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
            1795.0,
            792.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            242.0,
            161.0,
            20.0
          ],
          "text": "5 \u00b7 fx.co.multiply",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            680.0,
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
            668.0,
            977.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            680.0,
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
          "id": "obj-69",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            668.0,
            1007.0,
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
            668.0,
            1037.0,
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
            977.0,
            628.0,
            20.0
          ],
          "text": "5 \u00b7 jit.fx.co.multiply \u2014 multiply (amount per plane: 0 = A only, 1 = the full blend)"
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
            1007.0,
            69.0,
            22.0
          ],
          "text": "r VIN05"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1169.0,
            286.0,
            22.0
          ],
          "text": "jit.fx.co.multiply @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            731.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-74",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            1047.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            704.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            268.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            759.0,
            284.0,
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
          "id": "obj-76",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1214.0,
            69.0,
            22.0
          ],
          "text": "s VFX05"
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            282.0,
            1129.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            294.0,
            144.0,
            20.0
          ],
          "text": "6 \u00b7 fx.co.screen",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            820.0,
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
          "varname": "TITLE_06"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1418.0,
            977.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            820.0,
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
          "id": "obj-81",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1418.0,
            1007.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-82",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1418.0,
            1037.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            808.0,
            977.0,
            600.0,
            20.0
          ],
          "text": "6 \u00b7 jit.fx.co.screen \u2014 screen (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            808.0,
            1007.0,
            69.0,
            22.0
          ],
          "text": "r VIN06"
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            808.0,
            1169.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.co.screen @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            871.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            928.0,
            1047.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            844.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            320.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            899.0,
            284.0,
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
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            808.0,
            1214.0,
            69.0,
            22.0
          ],
          "text": "s VFX06"
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1046.0,
            1129.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            2520.0,
            346.0,
            152.0,
            20.0
          ],
          "text": "7 \u00b7 fx.co.overlay",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            820.0,
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
          "varname": "TITLE_07"
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2182.0,
            977.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            820.0,
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
          "id": "obj-93",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2182.0,
            1007.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            2182.0,
            1037.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1558.0,
            977.0,
            614.0,
            20.0
          ],
          "text": "7 \u00b7 jit.fx.co.overlay \u2014 overlay (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1558.0,
            1007.0,
            69.0,
            22.0
          ],
          "text": "r VIN07"
        }
      },
      {
        "box": {
          "id": "obj-97",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1558.0,
            1169.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.overlay @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            871.0,
            284.0,
            22.0
          ]
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
            1678.0,
            1047.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            844.0,
            284.0,
            22.0
          ],
          "attr": "amount",
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
            372.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            899.0,
            284.0,
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
            1558.0,
            1214.0,
            69.0,
            22.0
          ],
          "text": "s VFX07"
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
            1803.0,
            1129.0,
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
            398.0,
            169.0,
            20.0
          ],
          "text": "8 \u00b7 fx.co.softlight",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            820.0,
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
          "varname": "TITLE_08"
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
            690.0,
            1314.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            820.0,
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
          "id": "obj-105",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            690.0,
            1344.0,
            40.0,
            22.0
          ],
          "text": "7"
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
            690.0,
            1374.0,
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
            30.0,
            1314.0,
            650.0,
            20.0
          ],
          "text": "8 \u00b7 jit.fx.co.softlight \u2014 soft light (amount per plane: 0 = A only, 1 = the full blend)"
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
            30.0,
            1344.0,
            69.0,
            22.0
          ],
          "text": "r VIN08"
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1506.0,
            293.0,
            22.0
          ],
          "text": "jit.fx.co.softlight @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            871.0,
            284.0,
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
            150.0,
            1384.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            844.0,
            284.0,
            22.0
          ],
          "attr": "amount",
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
            424.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            899.0,
            284.0,
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
            30.0,
            1551.0,
            69.0,
            22.0
          ],
          "text": "s VFX08"
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
            289.0,
            1466.0,
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
            450.0,
            169.0,
            20.0
          ],
          "text": "9 \u00b7 fx.co.hardlight",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            820.0,
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
          "varname": "TITLE_09"
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
            1490.0,
            1314.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            820.0,
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
          "id": "obj-117",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1490.0,
            1344.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            1490.0,
            1374.0,
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
            830.0,
            1314.0,
            650.0,
            20.0
          ],
          "text": "9 \u00b7 jit.fx.co.hardlight \u2014 hard light (amount per plane: 0 = A only, 1 = the full blend)"
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
            830.0,
            1344.0,
            69.0,
            22.0
          ],
          "text": "r VIN09"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            830.0,
            1506.0,
            293.0,
            22.0
          ],
          "text": "jit.fx.co.hardlight @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            871.0,
            284.0,
            22.0
          ]
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
            950.0,
            1384.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            844.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-123",
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
            942.0,
            899.0,
            284.0,
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
          "id": "obj-124",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            830.0,
            1551.0,
            69.0,
            22.0
          ],
          "text": "s VFX09"
        }
      },
      {
        "box": {
          "id": "obj-125",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1089.0,
            1466.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            195.0,
            20.0
          ],
          "text": "10 \u00b7 fx.co.brightlight",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            947.0,
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
          "id": "obj-128",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            726.0,
            1651.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            947.0,
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
          "id": "obj-129",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            726.0,
            1681.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            726.0,
            1711.0,
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
            1651.0,
            686.0,
            20.0
          ],
          "text": "10 \u00b7 jit.fx.co.brightlight \u2014 bright light (amount per plane: 0 = A only, 1 = the full blend)"
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
            1681.0,
            69.0,
            22.0
          ],
          "text": "r VIN10"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1843.0,
            307.0,
            22.0
          ],
          "text": "jit.fx.co.brightlight @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            998.0,
            284.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-134",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            1721.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            971.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-135",
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
            18.0,
            1039.0,
            284.0,
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
          "id": "obj-136",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1888.0,
            69.0,
            22.0
          ],
          "text": "s VFX10"
        }
      },
      {
        "box": {
          "id": "obj-137",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            303.0,
            1803.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            152.0,
            20.0
          ],
          "text": "11 \u00b7 fx.co.darken",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            947.0,
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
          "varname": "TITLE_11"
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
            1483.0,
            1651.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            947.0,
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
          "id": "obj-141",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1483.0,
            1681.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            1483.0,
            1711.0,
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
            866.0,
            1651.0,
            607.0,
            20.0
          ],
          "text": "11 \u00b7 jit.fx.co.darken \u2014 darken (amount per plane: 0 = A only, 1 = the full blend)"
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
            866.0,
            1681.0,
            69.0,
            22.0
          ],
          "text": "r VIN11"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            866.0,
            1843.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.co.darken @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            998.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            986.0,
            1721.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            971.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1026.0,
            284.0,
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
          "id": "obj-148",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            866.0,
            1888.0,
            69.0,
            22.0
          ],
          "text": "s VFX11"
        }
      },
      {
        "box": {
          "id": "obj-149",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1104.0,
            1803.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-151",
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
          "text": "12 \u00b7 fx.co.lighten",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            947.0,
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
          "varname": "TITLE_12"
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            661.0,
            1988.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            947.0,
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
          "id": "obj-153",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            661.0,
            2018.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-154",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            661.0,
            2048.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-155",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1988.0,
            621.0,
            20.0
          ],
          "text": "12 \u00b7 jit.fx.co.lighten \u2014 lighten (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-156",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2018.0,
            69.0,
            22.0
          ],
          "text": "r VIN12"
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2180.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.lighten @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            998.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            2058.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            971.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            632.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1026.0,
            284.0,
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
          "id": "obj-160",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2225.0,
            69.0,
            22.0
          ],
          "text": "s VFX12"
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
            275.0,
            2140.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            2520.0,
            658.0,
            186.0,
            20.0
          ],
          "text": "13 \u00b7 fx.co.difference",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            947.0,
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
          "varname": "TITLE_13"
        }
      },
      {
        "box": {
          "id": "obj-164",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1475.0,
            1988.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            947.0,
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
          "id": "obj-165",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1475.0,
            2018.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            1475.0,
            2048.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            801.0,
            1988.0,
            664.0,
            20.0
          ],
          "text": "13 \u00b7 jit.fx.co.difference \u2014 difference (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-168",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            801.0,
            2018.0,
            69.0,
            22.0
          ],
          "text": "r VIN13"
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            801.0,
            2180.0,
            300.0,
            22.0
          ],
          "text": "jit.fx.co.difference @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            998.0,
            284.0,
            35.0
          ],
          "presentation_linecount": 2
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
            921.0,
            2058.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            971.0,
            284.0,
            22.0
          ],
          "attr": "amount",
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
            684.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1039.0,
            284.0,
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
            801.0,
            2225.0,
            69.0,
            22.0
          ],
          "text": "s VFX13"
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
            1067.0,
            2140.0,
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
            710.0,
            161.0,
            20.0
          ],
          "text": "14 \u00b7 fx.co.exclude",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1087.0,
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
          "varname": "TITLE_14"
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
            676.0,
            2325.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1087.0,
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
          "id": "obj-177",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            676.0,
            2355.0,
            40.0,
            22.0
          ],
          "text": "13"
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
            676.0,
            2385.0,
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
            30.0,
            2325.0,
            636.0,
            20.0
          ],
          "text": "14 \u00b7 jit.fx.co.exclude \u2014 exclusion (amount per plane: 0 = A only, 1 = the full blend)"
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
            30.0,
            2355.0,
            69.0,
            22.0
          ],
          "text": "r VIN14"
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
            30.0,
            2517.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.exclude @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1138.0,
            284.0,
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
            150.0,
            2395.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1111.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            2520.0,
            736.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1166.0,
            284.0,
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
          "id": "obj-184",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2562.0,
            69.0,
            22.0
          ],
          "text": "s VFX14"
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
            275.0,
            2477.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-187",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
            152.0,
            20.0
          ],
          "text": "15 \u00b7 fx.co.negate",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1087.0,
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
          "varname": "TITLE_15"
        }
      },
      {
        "box": {
          "id": "obj-188",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1447.0,
            2325.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1087.0,
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
          "id": "obj-189",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1447.0,
            2355.0,
            40.0,
            22.0
          ],
          "text": "14"
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
            1447.0,
            2385.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            816.0,
            2325.0,
            621.0,
            20.0
          ],
          "text": "15 \u00b7 jit.fx.co.negate \u2014 negation (amount per plane: 0 = A only, 1 = the full blend)"
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
            816.0,
            2355.0,
            69.0,
            22.0
          ],
          "text": "r VIN15"
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            816.0,
            2517.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.co.negate @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1138.0,
            284.0,
            22.0
          ]
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
            936.0,
            2395.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1111.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            2520.0,
            788.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1166.0,
            284.0,
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
          "id": "obj-196",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            816.0,
            2562.0,
            69.0,
            22.0
          ],
          "text": "s VFX15"
        }
      },
      {
        "box": {
          "id": "obj-197",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1054.0,
            2477.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            814.0,
            161.0,
            20.0
          ],
          "text": "16 \u00b7 fx.co.average",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1087.0,
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
          "varname": "TITLE_16"
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            661.0,
            2662.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1087.0,
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
          "id": "obj-201",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            661.0,
            2692.0,
            40.0,
            22.0
          ],
          "text": "15"
        }
      },
      {
        "box": {
          "id": "obj-202",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            661.0,
            2722.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            2662.0,
            621.0,
            20.0
          ],
          "text": "16 \u00b7 jit.fx.co.average \u2014 average (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-204",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2692.0,
            69.0,
            22.0
          ],
          "text": "r VIN16"
        }
      },
      {
        "box": {
          "id": "obj-205",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2854.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.average @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1138.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-206",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            2732.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1111.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            840.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1166.0,
            284.0,
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
          "id": "obj-208",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2899.0,
            69.0,
            22.0
          ],
          "text": "s VFX16"
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
            275.0,
            2814.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            866.0,
            135.0,
            20.0
          ],
          "text": "17 \u00b7 fx.co.burn",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1087.0,
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
          "varname": "TITLE_17"
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1439.0,
            2662.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1087.0,
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
          "id": "obj-213",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1439.0,
            2692.0,
            40.0,
            22.0
          ],
          "text": "16"
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1439.0,
            2722.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            801.0,
            2662.0,
            628.0,
            20.0
          ],
          "text": "17 \u00b7 jit.fx.co.burn \u2014 colour burn (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            801.0,
            2692.0,
            69.0,
            22.0
          ],
          "text": "r VIN17"
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            801.0,
            2854.0,
            258.0,
            22.0
          ],
          "text": "jit.fx.co.burn @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1138.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-218",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            921.0,
            2732.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1111.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-219",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1166.0,
            284.0,
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
          "id": "obj-220",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            801.0,
            2899.0,
            69.0,
            22.0
          ],
          "text": "s VFX17"
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
            1025.0,
            2814.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
            144.0,
            20.0
          ],
          "text": "18 \u00b7 fx.co.dodge",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1214.0,
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
          "varname": "TITLE_18"
        }
      },
      {
        "box": {
          "id": "obj-224",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            683.0,
            2999.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1214.0,
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
          "id": "obj-225",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            683.0,
            3029.0,
            40.0,
            22.0
          ],
          "text": "17"
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
            683.0,
            3059.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2999.0,
            643.0,
            20.0
          ],
          "text": "18 \u00b7 jit.fx.co.dodge \u2014 colour dodge (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3029.0,
            69.0,
            22.0
          ],
          "text": "r VIN18"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3191.0,
            265.0,
            22.0
          ],
          "text": "jit.fx.co.dodge @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1265.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-230",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            3069.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1238.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1293.0,
            284.0,
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
          "id": "obj-232",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3236.0,
            69.0,
            22.0
          ],
          "text": "s VFX18"
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
            261.0,
            3151.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-235",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
            161.0,
            20.0
          ],
          "text": "19 \u00b7 fx.co.reflect",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1214.0,
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
          "varname": "TITLE_19"
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1454.0,
            2999.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1214.0,
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
          "id": "obj-237",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1454.0,
            3029.0,
            40.0,
            22.0
          ],
          "text": "18"
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
            1454.0,
            3059.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-239",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            823.0,
            2999.0,
            621.0,
            20.0
          ],
          "text": "19 \u00b7 jit.fx.co.reflect \u2014 reflect (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-240",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            823.0,
            3029.0,
            69.0,
            22.0
          ],
          "text": "r VIN19"
        }
      },
      {
        "box": {
          "id": "obj-241",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            823.0,
            3191.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.reflect @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1265.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-242",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            943.0,
            3069.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1238.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-243",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            996.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1293.0,
            284.0,
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
          "id": "obj-244",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            823.0,
            3236.0,
            69.0,
            22.0
          ],
          "text": "s VFX19"
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
            1068.0,
            3151.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-247",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1022.0,
            135.0,
            20.0
          ],
          "text": "20 \u00b7 fx.co.glow",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1214.0,
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
          "varname": "TITLE_20"
        }
      },
      {
        "box": {
          "id": "obj-248",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2182.0,
            2999.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1214.0,
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
          "id": "obj-249",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2182.0,
            3029.0,
            40.0,
            22.0
          ],
          "text": "19"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2182.0,
            3059.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1594.0,
            2999.0,
            578.0,
            20.0
          ],
          "text": "20 \u00b7 jit.fx.co.glow \u2014 glow (amount per plane: 0 = A only, 1 = the full blend)"
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
            1594.0,
            3029.0,
            69.0,
            22.0
          ],
          "text": "r VIN20"
        }
      },
      {
        "box": {
          "id": "obj-253",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1594.0,
            3191.0,
            258.0,
            22.0
          ],
          "text": "jit.fx.co.glow @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1265.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-254",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1714.0,
            3069.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1238.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            2520.0,
            1048.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1293.0,
            284.0,
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
          "id": "obj-256",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1594.0,
            3236.0,
            69.0,
            22.0
          ],
          "text": "s VFX20"
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
            1818.0,
            3151.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1074.0,
            152.0,
            20.0
          ],
          "text": "21 \u00b7 fx.co.freeze",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1214.0,
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
          "varname": "TITLE_21"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            647.0,
            3336.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1214.0,
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
          "id": "obj-261",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            647.0,
            3366.0,
            40.0,
            22.0
          ],
          "text": "20"
        }
      },
      {
        "box": {
          "id": "obj-262",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            647.0,
            3396.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-263",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3336.0,
            607.0,
            20.0
          ],
          "text": "21 \u00b7 jit.fx.co.freeze \u2014 freeze (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-264",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3366.0,
            69.0,
            22.0
          ],
          "text": "r VIN21"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3528.0,
            272.0,
            22.0
          ],
          "text": "jit.fx.co.freeze @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1265.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-266",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            3406.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1238.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-267",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1100.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1293.0,
            284.0,
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
          "id": "obj-268",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3573.0,
            69.0,
            22.0
          ],
          "text": "s VFX21"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            268.0,
            3488.0,
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
            1126.0,
            135.0,
            20.0
          ],
          "text": "22 \u00b7 fx.co.heat",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1341.0,
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
          "varname": "TITLE_22"
        }
      },
      {
        "box": {
          "id": "obj-272",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1375.0,
            3336.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1341.0,
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
          "id": "obj-273",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1375.0,
            3366.0,
            40.0,
            22.0
          ],
          "text": "21"
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1375.0,
            3396.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-275",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            787.0,
            3336.0,
            578.0,
            20.0
          ],
          "text": "22 \u00b7 jit.fx.co.heat \u2014 heat (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-276",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            787.0,
            3366.0,
            69.0,
            22.0
          ],
          "text": "r VIN22"
        }
      },
      {
        "box": {
          "id": "obj-277",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            787.0,
            3528.0,
            258.0,
            22.0
          ],
          "text": "jit.fx.co.heat @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1392.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-278",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            907.0,
            3406.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1365.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
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
            1152.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1420.0,
            284.0,
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
          "id": "obj-280",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            787.0,
            3573.0,
            69.0,
            22.0
          ],
          "text": "s VFX22"
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
            1011.0,
            3488.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            2520.0,
            1178.0,
            161.0,
            20.0
          ],
          "text": "23 \u00b7 fx.co.inverse",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1341.0,
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
          "varname": "TITLE_23"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2146.0,
            3336.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1341.0,
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
          "id": "obj-285",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2146.0,
            3366.0,
            40.0,
            22.0
          ],
          "text": "22"
        }
      },
      {
        "box": {
          "id": "obj-286",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2146.0,
            3396.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-287",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1515.0,
            3336.0,
            621.0,
            20.0
          ],
          "text": "23 \u00b7 jit.fx.co.inverse \u2014 inverse (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-288",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1515.0,
            3366.0,
            69.0,
            22.0
          ],
          "text": "r VIN23"
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1515.0,
            3528.0,
            279.0,
            22.0
          ],
          "text": "jit.fx.co.inverse @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1392.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-290",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1635.0,
            3406.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1365.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-291",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1204.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1420.0,
            284.0,
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
          "id": "obj-292",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1515.0,
            3573.0,
            69.0,
            22.0
          ],
          "text": "s VFX23"
        }
      },
      {
        "box": {
          "id": "obj-293",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1760.0,
            3488.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1230.0,
            144.0,
            20.0
          ],
          "text": "24 \u00b7 fx.co.stamp",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1341.0,
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
          "varname": "TITLE_24"
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            632.0,
            3673.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1341.0,
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
          "id": "obj-297",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            632.0,
            3703.0,
            40.0,
            22.0
          ],
          "text": "23"
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
            632.0,
            3733.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3673.0,
            592.0,
            20.0
          ],
          "text": "24 \u00b7 jit.fx.co.stamp \u2014 stamp (amount per plane: 0 = A only, 1 = the full blend)"
        }
      },
      {
        "box": {
          "id": "obj-300",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3703.0,
            69.0,
            22.0
          ],
          "text": "r VIN24"
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3865.0,
            265.0,
            22.0
          ],
          "text": "jit.fx.co.stamp @amount 1. 1. 1. 1.",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1392.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            3743.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1365.0,
            284.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1256.0,
            118.0,
            20.0
          ],
          "text": "in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1420.0,
            284.0,
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
          "id": "obj-304",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3910.0,
            69.0,
            22.0
          ],
          "text": "s VFX24"
        }
      },
      {
        "box": {
          "id": "obj-305",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            261.0,
            3825.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1282.0,
            178.0,
            20.0
          ],
          "text": "25 \u00b7 fx.co.chromakey",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1341.0,
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
          "varname": "TITLE_25"
        }
      },
      {
        "box": {
          "id": "obj-308",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1360.0,
            3673.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1341.0,
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
          "id": "obj-309",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1360.0,
            3703.0,
            40.0,
            22.0
          ],
          "text": "24"
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1360.0,
            3733.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-311",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            772.0,
            3673.0,
            578.0,
            20.0
          ],
          "text": "25 \u00b7 jit.fx.co.chromakey \u2014 chroma key: B shows where A is near the key colour"
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
            772.0,
            3703.0,
            69.0,
            22.0
          ],
          "text": "r VIN25"
        }
      },
      {
        "box": {
          "id": "obj-313",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            772.0,
            3969.0,
            153.0,
            22.0
          ],
          "text": "jit.fx.co.chromakey",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1507.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-314",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            892.0,
            3743.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1365.0,
            284.0,
            22.0
          ],
          "attr": "color",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            912.0,
            3769.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1388.0,
            284.0,
            22.0
          ],
          "attr": "tol",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            932.0,
            3795.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1411.0,
            284.0,
            22.0
          ],
          "attr": "fade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-317",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            952.0,
            3821.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1434.0,
            284.0,
            22.0
          ],
          "attr": "binary",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-318",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            972.0,
            3847.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1457.0,
            284.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-319",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            992.0,
            3873.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1480.0,
            284.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-320",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1308.0,
            552.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.chromakey; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            942.0,
            1535.0,
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
          "id": "obj-321",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            772.0,
            4014.0,
            69.0,
            22.0
          ],
          "text": "s VFX25"
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
            891.0,
            3929.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-324",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1334.0,
            161.0,
            20.0
          ],
          "text": "26 \u00b7 fx.co.lumakey",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1600.0,
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
          "varname": "TITLE_26"
        }
      },
      {
        "box": {
          "id": "obj-325",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2045.0,
            3673.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1600.0,
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
          "id": "obj-326",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2045.0,
            3703.0,
            40.0,
            22.0
          ],
          "text": "25"
        }
      },
      {
        "box": {
          "id": "obj-327",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2045.0,
            3733.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-328",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1500.0,
            3673.0,
            535.0,
            20.0
          ],
          "text": "26 \u00b7 jit.fx.co.lumakey \u2014 luma key: B shows where A is near a brightness"
        }
      },
      {
        "box": {
          "id": "obj-329",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1500.0,
            3703.0,
            69.0,
            22.0
          ],
          "text": "r VIN26"
        }
      },
      {
        "box": {
          "id": "obj-330",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1500.0,
            3969.0,
            139.0,
            22.0
          ],
          "text": "jit.fx.co.lumakey",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1766.0,
            284.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-331",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1620.0,
            3743.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1624.0,
            284.0,
            22.0
          ],
          "attr": "luma",
          "text_width": 110.0
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
            1640.0,
            3769.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1647.0,
            284.0,
            22.0
          ],
          "attr": "tol",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-333",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1660.0,
            3795.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1670.0,
            284.0,
            22.0
          ],
          "attr": "fade",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-334",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1680.0,
            3821.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1693.0,
            284.0,
            22.0
          ],
          "attr": "binary",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-335",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1700.0,
            3847.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1716.0,
            284.0,
            22.0
          ],
          "attr": "invert",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-336",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            3873.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1739.0,
            284.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-337",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1360.0,
            535.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.lumakey; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1794.0,
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
          "id": "obj-338",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1500.0,
            4014.0,
            69.0,
            22.0
          ],
          "text": "s VFX26"
        }
      },
      {
        "box": {
          "id": "obj-339",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1605.0,
            3929.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
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
            1386.0,
            178.0,
            20.0
          ],
          "text": "27 \u00b7 Vizzie MODEMIXR",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1600.0,
            178.0,
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
          "varname": "TITLE_27"
        }
      },
      {
        "box": {
          "id": "obj-342",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            4114.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1600.0,
            178.0,
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
          "id": "obj-343",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            4144.0,
            40.0,
            22.0
          ],
          "text": "26"
        }
      },
      {
        "box": {
          "id": "obj-344",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            4174.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            4114.0,
            460.0,
            20.0
          ],
          "text": "27 \u00b7 MODEMIXR \u2014 mix A and B by a blend mode"
        }
      },
      {
        "box": {
          "id": "obj-346",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4144.0,
            69.0,
            22.0
          ],
          "text": "r VIN27"
        }
      },
      {
        "box": {
          "id": "obj-347",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4224.0,
            178.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1624.0,
            178.0,
            130.0
          ],
          "name": "vz.modemixr.maxpat",
          "varname": "vz.modemixr",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Mixing mode menu option ( (0. - 1.0) | in 3: Amount of image mixing/crossfading to be applied to the two inputs ( (0. - 1.0) | out 0: Video output",
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
          "id": "obj-348",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4389.0,
            69.0,
            22.0
          ],
          "text": "s VFX27"
        }
      },
      {
        "box": {
          "id": "obj-349",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            76.66666666666666,
            4184.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-350",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1412.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            1760.0,
            178.0,
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
          "id": "obj-352",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1438.0,
            161.0,
            20.0
          ],
          "text": "28 \u00b7 Vizzie OPER8R",
          "presentation": 1,
          "presentation_rect": [
            528.0,
            1600.0,
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
          "varname": "TITLE_28"
        }
      },
      {
        "box": {
          "id": "obj-353",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            4114.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            528.0,
            1600.0,
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
          "id": "obj-354",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            4144.0,
            40.0,
            22.0
          ],
          "text": "27"
        }
      },
      {
        "box": {
          "id": "obj-355",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            4174.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-356",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            4114.0,
            460.0,
            20.0
          ],
          "text": "28 \u00b7 OPER8R \u2014 combine A and B with an operator"
        }
      },
      {
        "box": {
          "id": "obj-357",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            4144.0,
            69.0,
            22.0
          ],
          "text": "r VIN28"
        }
      },
      {
        "box": {
          "id": "obj-358",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            4224.0,
            118.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            528.0,
            1624.0,
            118.0,
            130.0
          ],
          "name": "vz.oper8r.maxpat",
          "varname": "oper8r",
          "comment": "in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input ( (0. - 1.0) | out 0: Video output",
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
          "id": "obj-359",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            4389.0,
            69.0,
            22.0
          ],
          "text": "s VFX28"
        }
      },
      {
        "box": {
          "id": "obj-360",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            4184.0,
            69.0,
            22.0
          ],
          "text": "r VSRCB"
        }
      },
      {
        "box": {
          "id": "obj-361",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1464.0,
            569.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials; in 1 = clip B",
          "presentation": 1,
          "presentation_rect": [
            528.0,
            1760.0,
            128.0,
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
          "id": "obj-362",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4489.0,
            1200.0,
            34.0
          ],
          "text": "ROUTER \u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself"
        }
      },
      {
        "box": {
          "id": "obj-363",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4539.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-364",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2190.0,
            4539.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-365",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 28,
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
            4579.0,
            2198.0,
            22.0
          ],
          "text": "gate 28"
        }
      },
      {
        "box": {
          "id": "obj-366",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            110.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN02"
        }
      },
      {
        "box": {
          "id": "obj-367",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN03"
        }
      },
      {
        "box": {
          "id": "obj-368",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            270.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN04"
        }
      },
      {
        "box": {
          "id": "obj-369",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            350.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN05"
        }
      },
      {
        "box": {
          "id": "obj-370",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN06"
        }
      },
      {
        "box": {
          "id": "obj-371",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            510.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN07"
        }
      },
      {
        "box": {
          "id": "obj-372",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN08"
        }
      },
      {
        "box": {
          "id": "obj-373",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            670.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN09"
        }
      },
      {
        "box": {
          "id": "obj-374",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            750.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN10"
        }
      },
      {
        "box": {
          "id": "obj-375",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            830.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN11"
        }
      },
      {
        "box": {
          "id": "obj-376",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            910.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN12"
        }
      },
      {
        "box": {
          "id": "obj-377",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            990.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN13"
        }
      },
      {
        "box": {
          "id": "obj-378",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1070.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN14"
        }
      },
      {
        "box": {
          "id": "obj-379",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN15"
        }
      },
      {
        "box": {
          "id": "obj-380",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1230.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN16"
        }
      },
      {
        "box": {
          "id": "obj-381",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN17"
        }
      },
      {
        "box": {
          "id": "obj-382",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1390.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN18"
        }
      },
      {
        "box": {
          "id": "obj-383",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1470.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN19"
        }
      },
      {
        "box": {
          "id": "obj-384",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1550.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN20"
        }
      },
      {
        "box": {
          "id": "obj-385",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1630.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN21"
        }
      },
      {
        "box": {
          "id": "obj-386",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1710.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN22"
        }
      },
      {
        "box": {
          "id": "obj-387",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1790.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN23"
        }
      },
      {
        "box": {
          "id": "obj-388",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1870.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN24"
        }
      },
      {
        "box": {
          "id": "obj-389",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1950.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN25"
        }
      },
      {
        "box": {
          "id": "obj-390",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2030.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN26"
        }
      },
      {
        "box": {
          "id": "obj-391",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2110.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN27"
        }
      },
      {
        "box": {
          "id": "obj-392",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2190.0,
            4634.0,
            69.0,
            22.0
          ],
          "text": "s VIN28"
        }
      },
      {
        "box": {
          "id": "obj-393",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4709.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-394",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            4709.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-395",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX02"
        }
      },
      {
        "box": {
          "id": "obj-396",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX03"
        }
      },
      {
        "box": {
          "id": "obj-397",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            350.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX04"
        }
      },
      {
        "box": {
          "id": "obj-398",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX05"
        }
      },
      {
        "box": {
          "id": "obj-399",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX06"
        }
      },
      {
        "box": {
          "id": "obj-400",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX07"
        }
      },
      {
        "box": {
          "id": "obj-401",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            670.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX08"
        }
      },
      {
        "box": {
          "id": "obj-402",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX09"
        }
      },
      {
        "box": {
          "id": "obj-403",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX10"
        }
      },
      {
        "box": {
          "id": "obj-404",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX11"
        }
      },
      {
        "box": {
          "id": "obj-405",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX12"
        }
      },
      {
        "box": {
          "id": "obj-406",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1070.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX13"
        }
      },
      {
        "box": {
          "id": "obj-407",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX14"
        }
      },
      {
        "box": {
          "id": "obj-408",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1230.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX15"
        }
      },
      {
        "box": {
          "id": "obj-409",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX16"
        }
      },
      {
        "box": {
          "id": "obj-410",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1390.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX17"
        }
      },
      {
        "box": {
          "id": "obj-411",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1470.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX18"
        }
      },
      {
        "box": {
          "id": "obj-412",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1550.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX19"
        }
      },
      {
        "box": {
          "id": "obj-413",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1630.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX20"
        }
      },
      {
        "box": {
          "id": "obj-414",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1710.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX21"
        }
      },
      {
        "box": {
          "id": "obj-415",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1790.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX22"
        }
      },
      {
        "box": {
          "id": "obj-416",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1870.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX23"
        }
      },
      {
        "box": {
          "id": "obj-417",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1950.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX24"
        }
      },
      {
        "box": {
          "id": "obj-418",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2030.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX25"
        }
      },
      {
        "box": {
          "id": "obj-419",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2110.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX26"
        }
      },
      {
        "box": {
          "id": "obj-420",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2190.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX27"
        }
      },
      {
        "box": {
          "id": "obj-421",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2270.0,
            4709.0,
            69.0,
            22.0
          ],
          "text": "r VFX28"
        }
      },
      {
        "box": {
          "id": "obj-422",
          "maxclass": "newobj",
          "numinlets": 29,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4764.0,
            2278.0,
            22.0
          ],
          "text": "switch 28"
        }
      },
      {
        "box": {
          "id": "obj-423",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4819.0,
            62.0,
            22.0
          ],
          "text": "s VWET"
        }
      },
      {
        "box": {
          "id": "obj-424",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4879.0,
            800.0,
            20.0
          ],
          "text": "MASTER \u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld"
        }
      },
      {
        "box": {
          "id": "obj-425",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4919.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-426",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            4919.0,
            62.0,
            22.0
          ],
          "text": "r VWET"
        }
      },
      {
        "box": {
          "id": "obj-427",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            4919.0,
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
          "id": "obj-428",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            4969.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 1."
        }
      },
      {
        "box": {
          "id": "obj-429",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            5019.0,
            216.0,
            22.0
          ],
          "text": "jit.gl.layer @blend_enable 0"
        }
      },
      {
        "box": {
          "id": "obj-430",
          "maxclass": "jit.pworld",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            5069.0,
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
          "id": "obj-434",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1490.0,
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
          "id": "obj-435",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1516.0,
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
          "id": "obj-436",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1542.0,
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
          "id": "obj-437",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1568.0,
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
          "id": "obj-438",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1594.0,
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
          "id": "obj-439",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1620.0,
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
          "id": "obj-440",
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
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            674.0,
            300.0,
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
          "id": "obj-42",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            100.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            674.0,
            300.0,
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
          "id": "obj-54",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            170.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            674.0,
            300.0,
            130.0
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
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            674.0,
            300.0,
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
          "id": "obj-78",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            310.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            814.0,
            300.0,
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
          "id": "obj-90",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            380.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            814.0,
            300.0,
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
          "id": "obj-102",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            450.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            814.0,
            300.0,
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
            520.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            814.0,
            300.0,
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
          "id": "obj-126",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            941.0,
            300.0,
            130.0
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
            660.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            941.0,
            300.0,
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
          "id": "obj-150",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            730.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            941.0,
            300.0,
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
          "id": "obj-162",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            800.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            941.0,
            300.0,
            130.0
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
            870.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1081.0,
            300.0,
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
          "id": "obj-186",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            940.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            1081.0,
            300.0,
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
          "id": "obj-198",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1010.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            1081.0,
            300.0,
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
          "id": "obj-210",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1080.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            1081.0,
            300.0,
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
          "id": "obj-222",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1208.0,
            300.0,
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
          "id": "obj-234",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1220.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            1208.0,
            300.0,
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
          "id": "obj-246",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1290.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            1208.0,
            300.0,
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
          "id": "obj-258",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1360.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            1208.0,
            300.0,
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
          "id": "obj-270",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1430.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1335.0,
            300.0,
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
          "id": "obj-282",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1500.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            1335.0,
            300.0,
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
          "id": "obj-294",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1570.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            1335.0,
            300.0,
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
          "id": "obj-306",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1640.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            934.0,
            1335.0,
            300.0,
            249.0
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
          "id": "obj-323",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1710.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1594.0,
            300.0,
            249.0
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
          "id": "obj-340",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1780.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            1594.0,
            194.0,
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
          "id": "obj-351",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1850.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            520.0,
            1594.0,
            144.0,
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
          "id": "obj-431",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1920.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            380.0,
            654.0
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
          "id": "obj-432",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1990.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            10.0,
            294.0,
            654.0
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
          "id": "obj-433",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2060.0,
            5379.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            696.0,
            10.0,
            494.0,
            654.0
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
          "id": "obj-441",
          "text": "v1.0",
          "patching_rect": [
            2520.0,
            1650.0,
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
            5439.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1244,\n  \"height\": 1863,\n  \"bglocked\": 1,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"VIDEO BLEND SHOOTOUT v1.0 \\u2014 blend modes and keyers: clip A (movie or webcam) over clip B. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture. Clip B (sunflower.mp4) on s VSRCB is the second input of every two-input effect.\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        620,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"pl_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        30,\n        120\n      ],\n      \"size\": [\n        360,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"chickens.mp4\",\n              \"filename\": \"chickens.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008532\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"cam_tog\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        430,\n        90\n      ],\n      \"presentation\": [\n        20,\n        168,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"cam_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        430,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"cam_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1 0\",\n      \"pos\": [\n        520,\n        175\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"cam_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        520,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        48,\n        22\n      ]\n    },\n    \"cam_close\": {\n      \"type\": \"message\",\n      \"text\": \"close\",\n      \"pos\": [\n        580,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"cam_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab @output_texture 1 @automatic 1\",\n      \"pos\": [\n        520,\n        265\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"size\": [\n        293,\n        22\n      ]\n    },\n    \"cam_plus\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        430,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"c_cam\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie\",\n      \"pos\": [\n        660,\n        130\n      ],\n      \"size\": [\n        360,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"src_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        130,\n        255\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"src_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 2\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"s_vsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRC\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"c_srcb\": {\n      \"type\": \"comment\",\n      \"text\": \"CLIP B \\u2014 the second input of the two-input effects (loads sunflower.mp4)\",\n      \"pos\": [\n        430,\n        400\n      ],\n      \"size\": [\n        340,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"plb_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        430,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"playlist_b\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        430,\n        455\n      ],\n      \"size\": [\n        300,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        222,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"sunflower.mp4\",\n              \"filename\": \"sunflower.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008533\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"s_vsrcb\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRCB\",\n      \"pos\": [\n        430,\n        540\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"p_srcb_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"CLIP B \\u2014 the second input\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        20,\n        198,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 28, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY) and lights the pane title\",\n      \"pos\": [\n        1460,\n        90\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1140,\n        50\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        90,\n        22\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        300,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        400,\n        40,\n        280,\n        604\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 28,\n        \"num_lines_presentation\": 28,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 fx.co.normal\",\n              \"3 fx.co.additive\",\n              \"4 fx.co.subtractive\",\n              \"5 fx.co.multiply\",\n              \"6 fx.co.screen\",\n              \"7 fx.co.overlay\",\n              \"8 fx.co.softlight\",\n              \"9 fx.co.hardlight\",\n              \"10 fx.co.brightlight\",\n              \"11 fx.co.darken\",\n              \"12 fx.co.lighten\",\n              \"13 fx.co.difference\",\n              \"14 fx.co.exclude\",\n              \"15 fx.co.negate\",\n              \"16 fx.co.average\",\n              \"17 fx.co.burn\",\n              \"18 fx.co.dodge\",\n              \"19 fx.co.reflect\",\n              \"20 fx.co.glow\",\n              \"21 fx.co.freeze\",\n              \"22 fx.co.heat\",\n              \"23 fx.co.inverse\",\n              \"24 fx.co.stamp\",\n              \"25 fx.co.chromakey\",\n              \"26 fx.co.lumakey\",\n              \"27 Vizzie MODEMIXR\",\n              \"28 Vizzie OPER8R\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"VFX_SELECT\",\n            \"parameter_mmax\": 27,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VFX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"VFX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 28,\n        \"num_lines_presentation\": 28,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1240,\n        50\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1330,\n        50\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      },\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"lm_hl\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        1140,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        132,\n        22\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        674,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 fx.co.normal\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        640,\n        640\n      ],\n      \"presentation\": [\n        18,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        640,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        640,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 jit.fx.co.normal \\u2014 normal (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        640\n      ],\n      \"size\": [\n        600,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN02\",\n      \"pos\": [\n        30,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.normal @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        832\n      ],\n      \"presentation\": [\n        18,\n        731,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        704,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        759,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX02\",\n      \"pos\": [\n        30,\n        877\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f02_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        268,\n        792\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        674,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 fx.co.additive\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        326,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1382,\n        640\n      ],\n      \"presentation\": [\n        326,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1382,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1382,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 jit.fx.co.additive \\u2014 add (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        780,\n        640\n      ],\n      \"size\": [\n        592,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN03\",\n      \"pos\": [\n        780,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.additive @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        780,\n        832\n      ],\n      \"presentation\": [\n        326,\n        731,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        286,\n        22\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        900,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        704,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        759,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX03\",\n      \"pos\": [\n        780,\n        877\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f03_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1032,\n        792\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        674,\n        300,\n        130\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 fx.co.subtractive\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        634,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2182,\n        640\n      ],\n      \"presentation\": [\n        634,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        2182,\n        670\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2182,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 jit.fx.co.subtractive \\u2014 subtract (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        1522,\n        640\n      ],\n      \"size\": [\n        650,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN04\",\n      \"pos\": [\n        1522,\n        670\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.subtractive @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        1522,\n        832\n      ],\n      \"presentation\": [\n        634,\n        731,\n        284,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        307,\n        22\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1642,\n        710\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        704,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        772,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX04\",\n      \"pos\": [\n        1522,\n        877\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f04_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1795,\n        792\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        674,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 fx.co.multiply\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        942,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        668,\n        977\n      ],\n      \"presentation\": [\n        942,\n        680,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        668,\n        1007\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        668,\n        1037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 jit.fx.co.multiply \\u2014 multiply (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        977\n      ],\n      \"size\": [\n        628,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN05\",\n      \"pos\": [\n        30,\n        1007\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.multiply @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        1169\n      ],\n      \"presentation\": [\n        942,\n        731,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        286,\n        22\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1047\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        704,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        942,\n        759,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX05\",\n      \"pos\": [\n        30,\n        1214\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f05_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        282,\n        1129\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        814,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 fx.co.screen\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1418,\n        977\n      ],\n      \"presentation\": [\n        18,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1418,\n        1007\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1418,\n        1037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 jit.fx.co.screen \\u2014 screen (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        808,\n        977\n      ],\n      \"size\": [\n        600,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN06\",\n      \"pos\": [\n        808,\n        1007\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.screen @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        808,\n        1169\n      ],\n      \"presentation\": [\n        18,\n        871,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        928,\n        1047\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        844,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        899,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX06\",\n      \"pos\": [\n        808,\n        1214\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f06_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1046,\n        1129\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        814,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 fx.co.overlay\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        326,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2182,\n        977\n      ],\n      \"presentation\": [\n        326,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        2182,\n        1007\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2182,\n        1037\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 jit.fx.co.overlay \\u2014 overlay (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        1558,\n        977\n      ],\n      \"size\": [\n        614,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN07\",\n      \"pos\": [\n        1558,\n        1007\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.overlay @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        1558,\n        1169\n      ],\n      \"presentation\": [\n        326,\n        871,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1678,\n        1047\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        844,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        899,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX07\",\n      \"pos\": [\n        1558,\n        1214\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f07_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1803,\n        1129\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        814,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 fx.co.softlight\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        634,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        690,\n        1314\n      ],\n      \"presentation\": [\n        634,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        690,\n        1344\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        690,\n        1374\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 jit.fx.co.softlight \\u2014 soft light (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        1314\n      ],\n      \"size\": [\n        650,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN08\",\n      \"pos\": [\n        30,\n        1344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.softlight @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        1506\n      ],\n      \"presentation\": [\n        634,\n        871,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        293,\n        22\n      ]\n    },\n    \"f08_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1384\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        844,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        899,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX08\",\n      \"pos\": [\n        30,\n        1551\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f08_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        289,\n        1466\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        814,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 fx.co.hardlight\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        942,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1490,\n        1314\n      ],\n      \"presentation\": [\n        942,\n        820,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1490,\n        1344\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1490,\n        1374\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 jit.fx.co.hardlight \\u2014 hard light (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        830,\n        1314\n      ],\n      \"size\": [\n        650,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN09\",\n      \"pos\": [\n        830,\n        1344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.hardlight @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        830,\n        1506\n      ],\n      \"presentation\": [\n        942,\n        871,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        293,\n        22\n      ]\n    },\n    \"f09_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        950,\n        1384\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        844,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        942,\n        899,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX09\",\n      \"pos\": [\n        830,\n        1551\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f09_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1089,\n        1466\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        941,\n        300,\n        130\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 fx.co.brightlight\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        18,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        726,\n        1651\n      ],\n      \"presentation\": [\n        18,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        726,\n        1681\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        726,\n        1711\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 jit.fx.co.brightlight \\u2014 bright light (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        1651\n      ],\n      \"size\": [\n        686,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN10\",\n      \"pos\": [\n        30,\n        1681\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.brightlight @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        1843\n      ],\n      \"presentation\": [\n        18,\n        998,\n        284,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        307,\n        22\n      ]\n    },\n    \"f10_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        1721\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        971,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1039,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX10\",\n      \"pos\": [\n        30,\n        1888\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f10_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        303,\n        1803\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        941,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 fx.co.darken\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        326,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1483,\n        1651\n      ],\n      \"presentation\": [\n        326,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        1483,\n        1681\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1483,\n        1711\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 jit.fx.co.darken \\u2014 darken (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        866,\n        1651\n      ],\n      \"size\": [\n        607,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN11\",\n      \"pos\": [\n        866,\n        1681\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.darken @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        866,\n        1843\n      ],\n      \"presentation\": [\n        326,\n        998,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f11_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        986,\n        1721\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        971,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1026,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX11\",\n      \"pos\": [\n        866,\n        1888\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f11_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1104,\n        1803\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        941,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 fx.co.lighten\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        634,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        661,\n        1988\n      ],\n      \"presentation\": [\n        634,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        661,\n        2018\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        661,\n        2048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 jit.fx.co.lighten \\u2014 lighten (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        1988\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN12\",\n      \"pos\": [\n        30,\n        2018\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.lighten @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        2180\n      ],\n      \"presentation\": [\n        634,\n        998,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f12_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        2058\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        971,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1026,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX12\",\n      \"pos\": [\n        30,\n        2225\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f12_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        275,\n        2140\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        941,\n        300,\n        130\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 fx.co.difference\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        942,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1475,\n        1988\n      ],\n      \"presentation\": [\n        942,\n        947,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1475,\n        2018\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1475,\n        2048\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 jit.fx.co.difference \\u2014 difference (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        801,\n        1988\n      ],\n      \"size\": [\n        664,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN13\",\n      \"pos\": [\n        801,\n        2018\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.difference @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        801,\n        2180\n      ],\n      \"presentation\": [\n        942,\n        998,\n        284,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        300,\n        22\n      ]\n    },\n    \"f13_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        921,\n        2058\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        971,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1039,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX13\",\n      \"pos\": [\n        801,\n        2225\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f13_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1067,\n        2140\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1081,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 fx.co.exclude\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        676,\n        2325\n      ],\n      \"presentation\": [\n        18,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        676,\n        2355\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        676,\n        2385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 jit.fx.co.exclude \\u2014 exclusion (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        2325\n      ],\n      \"size\": [\n        636,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN14\",\n      \"pos\": [\n        30,\n        2355\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.exclude @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        2517\n      ],\n      \"presentation\": [\n        18,\n        1138,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f14_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        2395\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1111,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1166,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX14\",\n      \"pos\": [\n        30,\n        2562\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f14_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        275,\n        2477\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        1081,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 fx.co.negate\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1447,\n        2325\n      ],\n      \"presentation\": [\n        326,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1447,\n        2355\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1447,\n        2385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 jit.fx.co.negate \\u2014 negation (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        816,\n        2325\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN15\",\n      \"pos\": [\n        816,\n        2355\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.negate @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        816,\n        2517\n      ],\n      \"presentation\": [\n        326,\n        1138,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f15_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        936,\n        2395\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        1111,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1166,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX15\",\n      \"pos\": [\n        816,\n        2562\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f15_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1054,\n        2477\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        1081,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 fx.co.average\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        661,\n        2662\n      ],\n      \"presentation\": [\n        634,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        661,\n        2692\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        661,\n        2722\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 jit.fx.co.average \\u2014 average (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        2662\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN16\",\n      \"pos\": [\n        30,\n        2692\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f16_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.average @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        2854\n      ],\n      \"presentation\": [\n        634,\n        1138,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f16_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        2732\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        1111,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1166,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX16\",\n      \"pos\": [\n        30,\n        2899\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f16_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        275,\n        2814\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        1081,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 fx.co.burn\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1439,\n        2662\n      ],\n      \"presentation\": [\n        942,\n        1087,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        1439,\n        2692\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1439,\n        2722\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 jit.fx.co.burn \\u2014 colour burn (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        801,\n        2662\n      ],\n      \"size\": [\n        628,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN17\",\n      \"pos\": [\n        801,\n        2692\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f17_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.burn @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        801,\n        2854\n      ],\n      \"presentation\": [\n        942,\n        1138,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        258,\n        22\n      ]\n    },\n    \"f17_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        921,\n        2732\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1111,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1166,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX17\",\n      \"pos\": [\n        801,\n        2899\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f17_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1025,\n        2814\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1208,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 fx.co.dodge\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        683,\n        2999\n      ],\n      \"presentation\": [\n        18,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        683,\n        3029\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        683,\n        3059\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 jit.fx.co.dodge \\u2014 colour dodge (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        2999\n      ],\n      \"size\": [\n        643,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN18\",\n      \"pos\": [\n        30,\n        3029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f18_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.dodge @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        3191\n      ],\n      \"presentation\": [\n        18,\n        1265,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        265,\n        22\n      ]\n    },\n    \"f18_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        3069\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1238,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1293,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX18\",\n      \"pos\": [\n        30,\n        3236\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f18_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        261,\n        3151\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f19_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        1208,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f19_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 fx.co.reflect\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_19\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1454,\n        2999\n      ],\n      \"presentation\": [\n        326,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f19_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"18\",\n      \"pos\": [\n        1454,\n        3029\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1454,\n        3059\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f19_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 jit.fx.co.reflect \\u2014 reflect (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        823,\n        2999\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN19\",\n      \"pos\": [\n        823,\n        3029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f19_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.reflect @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        823,\n        3191\n      ],\n      \"presentation\": [\n        326,\n        1265,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f19_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        943,\n        3069\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        1238,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f19_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1293,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f19_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX19\",\n      \"pos\": [\n        823,\n        3236\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f19_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1068,\n        3151\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f20_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        1208,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f20_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 fx.co.glow\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_20\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2182,\n        2999\n      ],\n      \"presentation\": [\n        634,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f20_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"19\",\n      \"pos\": [\n        2182,\n        3029\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f20_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2182,\n        3059\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f20_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 jit.fx.co.glow \\u2014 glow (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        1594,\n        2999\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN20\",\n      \"pos\": [\n        1594,\n        3029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f20_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.glow @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        1594,\n        3191\n      ],\n      \"presentation\": [\n        634,\n        1265,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        258,\n        22\n      ]\n    },\n    \"f20_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1714,\n        3069\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        1238,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f20_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1293,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f20_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX20\",\n      \"pos\": [\n        1594,\n        3236\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f20_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1818,\n        3151\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f21_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1360,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        1208,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f21_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"21 \\u00b7 fx.co.freeze\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_21\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f21_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        647,\n        3336\n      ],\n      \"presentation\": [\n        942,\n        1214,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f21_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"20\",\n      \"pos\": [\n        647,\n        3366\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f21_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        647,\n        3396\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f21_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"21 \\u00b7 jit.fx.co.freeze \\u2014 freeze (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        3336\n      ],\n      \"size\": [\n        607,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f21_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN21\",\n      \"pos\": [\n        30,\n        3366\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f21_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.freeze @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        3528\n      ],\n      \"presentation\": [\n        942,\n        1265,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"f21_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        3406\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1238,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f21_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1293,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f21_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX21\",\n      \"pos\": [\n        30,\n        3573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f21_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        268,\n        3488\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f22_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1430,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1335,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f22_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"22 \\u00b7 fx.co.heat\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_22\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f22_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1375,\n        3336\n      ],\n      \"presentation\": [\n        18,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f22_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"21\",\n      \"pos\": [\n        1375,\n        3366\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f22_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1375,\n        3396\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f22_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"22 \\u00b7 jit.fx.co.heat \\u2014 heat (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        787,\n        3336\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f22_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN22\",\n      \"pos\": [\n        787,\n        3366\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f22_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.heat @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        787,\n        3528\n      ],\n      \"presentation\": [\n        18,\n        1392,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        258,\n        22\n      ]\n    },\n    \"f22_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        907,\n        3406\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1365,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f22_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1420,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f22_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX22\",\n      \"pos\": [\n        787,\n        3573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f22_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1011,\n        3488\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f23_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1500,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        1335,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f23_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"23 \\u00b7 fx.co.inverse\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_23\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f23_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2146,\n        3336\n      ],\n      \"presentation\": [\n        326,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f23_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"22\",\n      \"pos\": [\n        2146,\n        3366\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f23_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2146,\n        3396\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f23_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"23 \\u00b7 jit.fx.co.inverse \\u2014 inverse (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        1515,\n        3336\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f23_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN23\",\n      \"pos\": [\n        1515,\n        3366\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f23_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.inverse @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        1515,\n        3528\n      ],\n      \"presentation\": [\n        326,\n        1392,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        279,\n        22\n      ]\n    },\n    \"f23_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1635,\n        3406\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        1365,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f23_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1420,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f23_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX23\",\n      \"pos\": [\n        1515,\n        3573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f23_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1760,\n        3488\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f24_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1570,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        626,\n        1335,\n        300,\n        117\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f24_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"24 \\u00b7 fx.co.stamp\",\n      \"pos\": [\n        2520,\n        1230\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_24\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f24_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        632,\n        3673\n      ],\n      \"presentation\": [\n        634,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f24_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"23\",\n      \"pos\": [\n        632,\n        3703\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f24_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        632,\n        3733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f24_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"24 \\u00b7 jit.fx.co.stamp \\u2014 stamp (amount per plane: 0 = A only, 1 = the full blend)\",\n      \"pos\": [\n        30,\n        3673\n      ],\n      \"size\": [\n        592,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f24_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN24\",\n      \"pos\": [\n        30,\n        3703\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f24_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.stamp @amount 1. 1. 1. 1.\",\n      \"pos\": [\n        30,\n        3865\n      ],\n      \"presentation\": [\n        634,\n        1392,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        265,\n        22\n      ]\n    },\n    \"f24_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        3743\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        634,\n        1365,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f24_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1256\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1420,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f24_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX24\",\n      \"pos\": [\n        30,\n        3910\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f24_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        261,\n        3825\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f25_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1640,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        934,\n        1335,\n        300,\n        249\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f25_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"25 \\u00b7 fx.co.chromakey\",\n      \"pos\": [\n        2520,\n        1282\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_25\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f25_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1360,\n        3673\n      ],\n      \"presentation\": [\n        942,\n        1341,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f25_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"24\",\n      \"pos\": [\n        1360,\n        3703\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1360,\n        3733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f25_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"25 \\u00b7 jit.fx.co.chromakey \\u2014 chroma key: B shows where A is near the key colour\",\n      \"pos\": [\n        772,\n        3673\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f25_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN25\",\n      \"pos\": [\n        772,\n        3703\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f25_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.chromakey\",\n      \"pos\": [\n        772,\n        3969\n      ],\n      \"presentation\": [\n        942,\n        1507,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        153,\n        22\n      ]\n    },\n    \"f25_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        892,\n        3743\n      ],\n      \"attrs\": {\n        \"attr\": \"color\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1365,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        912,\n        3769\n      ],\n      \"attrs\": {\n        \"attr\": \"tol\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1388,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        932,\n        3795\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1411,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        952,\n        3821\n      ],\n      \"attrs\": {\n        \"attr\": \"binary\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1434,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        972,\n        3847\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1457,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        992,\n        3873\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        942,\n        1480,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f25_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.chromakey; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1308\n      ],\n      \"size\": [\n        552,\n        20\n      ],\n      \"presentation\": [\n        942,\n        1535,\n        284,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f25_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX25\",\n      \"pos\": [\n        772,\n        4014\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f25_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        891,\n        3929\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f26_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1710,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1594,\n        300,\n        249\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f26_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"26 \\u00b7 fx.co.lumakey\",\n      \"pos\": [\n        2520,\n        1334\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1600,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_26\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f26_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2045,\n        3673\n      ],\n      \"presentation\": [\n        18,\n        1600,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f26_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"25\",\n      \"pos\": [\n        2045,\n        3703\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2045,\n        3733\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f26_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"26 \\u00b7 jit.fx.co.lumakey \\u2014 luma key: B shows where A is near a brightness\",\n      \"pos\": [\n        1500,\n        3673\n      ],\n      \"size\": [\n        535,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f26_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN26\",\n      \"pos\": [\n        1500,\n        3703\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f26_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.co.lumakey\",\n      \"pos\": [\n        1500,\n        3969\n      ],\n      \"presentation\": [\n        18,\n        1766,\n        284,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        139,\n        22\n      ]\n    },\n    \"f26_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1620,\n        3743\n      ],\n      \"attrs\": {\n        \"attr\": \"luma\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1624,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1640,\n        3769\n      ],\n      \"attrs\": {\n        \"attr\": \"tol\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1647,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1660,\n        3795\n      ],\n      \"attrs\": {\n        \"attr\": \"fade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1670,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1680,\n        3821\n      ],\n      \"attrs\": {\n        \"attr\": \"binary\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1693,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1700,\n        3847\n      ],\n      \"attrs\": {\n        \"attr\": \"invert\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1716,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1720,\n        3873\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        1739,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f26_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.lumakey; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1360\n      ],\n      \"size\": [\n        535,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1794,\n        284,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f26_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX26\",\n      \"pos\": [\n        1500,\n        4014\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f26_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        1605,\n        3929\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f27_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1780,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        1594,\n        194,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f27_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"27 \\u00b7 Vizzie MODEMIXR\",\n      \"pos\": [\n        2520,\n        1386\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1600,\n        178,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_27\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f27_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        4114\n      ],\n      \"presentation\": [\n        326,\n        1600,\n        178,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f27_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"26\",\n      \"pos\": [\n        500,\n        4144\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f27_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        4174\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f27_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"27 \\u00b7 MODEMIXR \\u2014 mix A and B by a blend mode\",\n      \"pos\": [\n        30,\n        4114\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f27_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN27\",\n      \"pos\": [\n        30,\n        4144\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f27_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        4224\n      ],\n      \"size\": [\n        178,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        326,\n        1624,\n        178,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.modemixr.maxpat\",\n        \"varname\": \"vz.modemixr\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Mixing mode menu option ( (0. - 1.0) | in 3: Amount of image mixing/crossfading to be applied to the two inputs ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.modemixr.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Mixing mode menu option ( (0. - 1.0) | in 3: Amount of image mixing/crossfading to be applied to the two inputs ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f27_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX27\",\n      \"pos\": [\n        30,\n        4389\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f27_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1412\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        326,\n        1760,\n        178,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f28_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1850,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        520,\n        1594,\n        144,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f28_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"28 \\u00b7 Vizzie OPER8R\",\n      \"pos\": [\n        2520,\n        1438\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        528,\n        1600,\n        128,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_28\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f28_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        4114\n      ],\n      \"presentation\": [\n        528,\n        1600,\n        128,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f28_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"27\",\n      \"pos\": [\n        1110,\n        4144\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f28_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        4174\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        76,\n        22\n      ]\n    },\n    \"f28_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"28 \\u00b7 OPER8R \\u2014 combine A and B with an operator\",\n      \"pos\": [\n        640,\n        4114\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f28_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN28\",\n      \"pos\": [\n        640,\n        4144\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f28_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        4224\n      ],\n      \"size\": [\n        118,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        528,\n        1624,\n        118,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.oper8r.maxpat\",\n        \"varname\": \"oper8r\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.oper8r.maxpat\",\n        \"comment\": \"in 0: Video input 1 | in 1: Video input 2 | in 2: Operator mode input ( (0. - 1.0) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f28_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX28\",\n      \"pos\": [\n        640,\n        4389\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f28_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        680,\n        4184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"f28_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials; in 1 = clip B\",\n      \"pos\": [\n        2520,\n        1464\n      ],\n      \"size\": [\n        569,\n        20\n      ],\n      \"presentation\": [\n        528,\n        1760,\n        128,\n        66\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 4\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_route\": {\n      \"type\": \"comment\",\n      \"text\": \"ROUTER \\u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself\",\n      \"pos\": [\n        30,\n        4489\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        4539\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"g_rsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        2190,\n        4539\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 28\",\n      \"pos\": [\n        30,\n        4579\n      ],\n      \"size\": [\n        2198,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 28,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"g_s2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN02\",\n      \"pos\": [\n        110,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s3\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN03\",\n      \"pos\": [\n        190,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s4\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN04\",\n      \"pos\": [\n        270,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s5\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN05\",\n      \"pos\": [\n        350,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s6\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN06\",\n      \"pos\": [\n        430,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s7\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN07\",\n      \"pos\": [\n        510,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s8\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN08\",\n      \"pos\": [\n        590,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s9\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN09\",\n      \"pos\": [\n        670,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s10\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN10\",\n      \"pos\": [\n        750,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s11\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN11\",\n      \"pos\": [\n        830,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s12\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN12\",\n      \"pos\": [\n        910,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s13\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN13\",\n      \"pos\": [\n        990,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s14\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN14\",\n      \"pos\": [\n        1070,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s15\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN15\",\n      \"pos\": [\n        1150,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s16\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN16\",\n      \"pos\": [\n        1230,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s17\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN17\",\n      \"pos\": [\n        1310,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s18\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN18\",\n      \"pos\": [\n        1390,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s19\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN19\",\n      \"pos\": [\n        1470,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s20\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN20\",\n      \"pos\": [\n        1550,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s21\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN21\",\n      \"pos\": [\n        1630,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s22\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN22\",\n      \"pos\": [\n        1710,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s23\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN23\",\n      \"pos\": [\n        1790,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s24\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN24\",\n      \"pos\": [\n        1870,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s25\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN25\",\n      \"pos\": [\n        1950,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s26\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN26\",\n      \"pos\": [\n        2030,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s27\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN27\",\n      \"pos\": [\n        2110,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"g_s28\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN28\",\n      \"pos\": [\n        2190,\n        4634\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        4709\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        55,\n        22\n      ]\n    },\n    \"sw_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        110,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"sw_r2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX02\",\n      \"pos\": [\n        190,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX03\",\n      \"pos\": [\n        270,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX04\",\n      \"pos\": [\n        350,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX05\",\n      \"pos\": [\n        430,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX06\",\n      \"pos\": [\n        510,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX07\",\n      \"pos\": [\n        590,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX08\",\n      \"pos\": [\n        670,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX09\",\n      \"pos\": [\n        750,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX10\",\n      \"pos\": [\n        830,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX11\",\n      \"pos\": [\n        910,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX12\",\n      \"pos\": [\n        990,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX13\",\n      \"pos\": [\n        1070,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX14\",\n      \"pos\": [\n        1150,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX15\",\n      \"pos\": [\n        1230,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX16\",\n      \"pos\": [\n        1310,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX17\",\n      \"pos\": [\n        1390,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX18\",\n      \"pos\": [\n        1470,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r19\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX19\",\n      \"pos\": [\n        1550,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r20\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX20\",\n      \"pos\": [\n        1630,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r21\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX21\",\n      \"pos\": [\n        1710,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r22\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX22\",\n      \"pos\": [\n        1790,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r23\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX23\",\n      \"pos\": [\n        1870,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r24\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX24\",\n      \"pos\": [\n        1950,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r25\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX25\",\n      \"pos\": [\n        2030,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r26\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX26\",\n      \"pos\": [\n        2110,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r27\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX27\",\n      \"pos\": [\n        2190,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"sw_r28\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX28\",\n      \"pos\": [\n        2270,\n        4709\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    },\n    \"wet_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 28\",\n      \"pos\": [\n        30,\n        4764\n      ],\n      \"size\": [\n        2278,\n        22\n      ],\n      \"inlets\": 29,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VWET\",\n      \"pos\": [\n        30,\n        4819\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld\",\n      \"pos\": [\n        30,\n        4879\n      ],\n      \"size\": [\n        800,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"m_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        30,\n        4919\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"m_rwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VWET\",\n      \"pos\": [\n        110,\n        4919\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        62,\n        22\n      ]\n    },\n    \"m_xf_ui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        4919\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        700,\n        316,\n        300,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 1.\",\n      \"pos\": [\n        30,\n        4969\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"size\": [\n        195,\n        22\n      ]\n    },\n    \"m_layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer @blend_enable 0\",\n      \"pos\": [\n        30,\n        5019\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        216,\n        22\n      ]\n    },\n    \"pworld\": {\n      \"type\": \"jit.pworld\",\n      \"pos\": [\n        30,\n        5069\n      ],\n      \"size\": [\n        480,\n        270\n      ],\n      \"attrs\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        700,\n        40,\n        480,\n        270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1920,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        380,\n        654\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1990,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        396,\n        10,\n        294,\n        654\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_out_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        2060,\n        5379\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        696,\n        10,\n        494,\n        654\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        1490\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop movies on the player; click a clip to play it\",\n      \"pos\": [\n        2520,\n        1516\n      ],\n      \"size\": [\n        433,\n        20\n      ],\n      \"presentation\": [\n        20,\n        144,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_cam_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam (loads off) \\u2014 on replaces the movie\",\n      \"pos\": [\n        2520,\n        1542\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        48,\n        170,\n        332,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT \\u2014 click one\",\n      \"pos\": [\n        2520,\n        1568\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        406,\n        16,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_out_title\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT \\u2014 only the chosen effect runs\",\n      \"pos\": [\n        2520,\n        1594\n      ],\n      \"size\": [\n        314,\n        20\n      ],\n      \"presentation\": [\n        706,\n        16,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_xf_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"xfade: 0 = dry source, 1 = the effect (loads 1)\",\n      \"pos\": [\n        2520,\n        1620\n      ],\n      \"size\": [\n        407,\n        20\n      ],\n      \"presentation\": [\n        706,\n        342,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"v1_0\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        2520,\n        1650\n      ],\n      \"text\": \"v1.0\",\n      \"size\": [\n        44,\n        20\n      ],\n      \"presentation\": [\n        1200,\n        16,\n        44,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f27_rb1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRCB\",\n      \"pos\": [\n        76,\n        4184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"size\": [\n        69,\n        22\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"pl_lm\",\n      0,\n      \"playlist\",\n      0\n    ],\n    [\n      \"cam_tog\",\n      0,\n      \"cam_t\",\n      0\n    ],\n    [\n      \"cam_t\",\n      1,\n      \"cam_sel\",\n      0\n    ],\n    [\n      \"cam_t\",\n      0,\n      \"cam_plus\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      0,\n      \"cam_open\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      1,\n      \"cam_close\",\n      0\n    ],\n    [\n      \"cam_open\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"cam_close\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"src_lm\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"cam_plus\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"src_sw\",\n      1\n    ],\n    [\n      \"cam_grab\",\n      0,\n      \"src_sw\",\n      2\n    ],\n    [\n      \"src_sw\",\n      0,\n      \"s_vsrc\",\n      0\n    ],\n    [\n      \"plb_lm\",\n      0,\n      \"playlist_b\",\n      0\n    ],\n    [\n      \"playlist_b\",\n      0,\n      \"s_vsrcb\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"lm_hl\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rin\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sout\",\n      0\n    ],\n    [\n      \"f02_rb1\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rin\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sout\",\n      0\n    ],\n    [\n      \"f03_rb1\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rin\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sout\",\n      0\n    ],\n    [\n      \"f04_rb1\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rin\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sout\",\n      0\n    ],\n    [\n      \"f05_rb1\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rin\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sout\",\n      0\n    ],\n    [\n      \"f06_rb1\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rin\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sout\",\n      0\n    ],\n    [\n      \"f07_rb1\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rin\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c0\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sout\",\n      0\n    ],\n    [\n      \"f08_rb1\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rin\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c0\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sout\",\n      0\n    ],\n    [\n      \"f09_rb1\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rin\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c0\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sout\",\n      0\n    ],\n    [\n      \"f10_rb1\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rin\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c0\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sout\",\n      0\n    ],\n    [\n      \"f11_rb1\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rin\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c0\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sout\",\n      0\n    ],\n    [\n      \"f12_rb1\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rin\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c0\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sout\",\n      0\n    ],\n    [\n      \"f13_rb1\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rin\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c0\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sout\",\n      0\n    ],\n    [\n      \"f14_rb1\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rin\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_c0\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sout\",\n      0\n    ],\n    [\n      \"f15_rb1\",\n      0,\n      \"f15_obj\",\n      1\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_rin\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c0\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      0,\n      \"f16_sout\",\n      0\n    ],\n    [\n      \"f16_rb1\",\n      0,\n      \"f16_obj\",\n      1\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_rin\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c0\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      0,\n      \"f17_sout\",\n      0\n    ],\n    [\n      \"f17_rb1\",\n      0,\n      \"f17_obj\",\n      1\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_rin\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c0\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      0,\n      \"f18_sout\",\n      0\n    ],\n    [\n      \"f18_rb1\",\n      0,\n      \"f18_obj\",\n      1\n    ],\n    [\n      \"f19_tbtn\",\n      0,\n      \"f19_tsel\",\n      0\n    ],\n    [\n      \"f19_tsel\",\n      0,\n      \"f19_tsend\",\n      0\n    ],\n    [\n      \"f19_rin\",\n      0,\n      \"f19_obj\",\n      0\n    ],\n    [\n      \"f19_c0\",\n      0,\n      \"f19_obj\",\n      0\n    ],\n    [\n      \"f19_obj\",\n      0,\n      \"f19_sout\",\n      0\n    ],\n    [\n      \"f19_rb1\",\n      0,\n      \"f19_obj\",\n      1\n    ],\n    [\n      \"f20_tbtn\",\n      0,\n      \"f20_tsel\",\n      0\n    ],\n    [\n      \"f20_tsel\",\n      0,\n      \"f20_tsend\",\n      0\n    ],\n    [\n      \"f20_rin\",\n      0,\n      \"f20_obj\",\n      0\n    ],\n    [\n      \"f20_c0\",\n      0,\n      \"f20_obj\",\n      0\n    ],\n    [\n      \"f20_obj\",\n      0,\n      \"f20_sout\",\n      0\n    ],\n    [\n      \"f20_rb1\",\n      0,\n      \"f20_obj\",\n      1\n    ],\n    [\n      \"f21_tbtn\",\n      0,\n      \"f21_tsel\",\n      0\n    ],\n    [\n      \"f21_tsel\",\n      0,\n      \"f21_tsend\",\n      0\n    ],\n    [\n      \"f21_rin\",\n      0,\n      \"f21_obj\",\n      0\n    ],\n    [\n      \"f21_c0\",\n      0,\n      \"f21_obj\",\n      0\n    ],\n    [\n      \"f21_obj\",\n      0,\n      \"f21_sout\",\n      0\n    ],\n    [\n      \"f21_rb1\",\n      0,\n      \"f21_obj\",\n      1\n    ],\n    [\n      \"f22_tbtn\",\n      0,\n      \"f22_tsel\",\n      0\n    ],\n    [\n      \"f22_tsel\",\n      0,\n      \"f22_tsend\",\n      0\n    ],\n    [\n      \"f22_rin\",\n      0,\n      \"f22_obj\",\n      0\n    ],\n    [\n      \"f22_c0\",\n      0,\n      \"f22_obj\",\n      0\n    ],\n    [\n      \"f22_obj\",\n      0,\n      \"f22_sout\",\n      0\n    ],\n    [\n      \"f22_rb1\",\n      0,\n      \"f22_obj\",\n      1\n    ],\n    [\n      \"f23_tbtn\",\n      0,\n      \"f23_tsel\",\n      0\n    ],\n    [\n      \"f23_tsel\",\n      0,\n      \"f23_tsend\",\n      0\n    ],\n    [\n      \"f23_rin\",\n      0,\n      \"f23_obj\",\n      0\n    ],\n    [\n      \"f23_c0\",\n      0,\n      \"f23_obj\",\n      0\n    ],\n    [\n      \"f23_obj\",\n      0,\n      \"f23_sout\",\n      0\n    ],\n    [\n      \"f23_rb1\",\n      0,\n      \"f23_obj\",\n      1\n    ],\n    [\n      \"f24_tbtn\",\n      0,\n      \"f24_tsel\",\n      0\n    ],\n    [\n      \"f24_tsel\",\n      0,\n      \"f24_tsend\",\n      0\n    ],\n    [\n      \"f24_rin\",\n      0,\n      \"f24_obj\",\n      0\n    ],\n    [\n      \"f24_c0\",\n      0,\n      \"f24_obj\",\n      0\n    ],\n    [\n      \"f24_obj\",\n      0,\n      \"f24_sout\",\n      0\n    ],\n    [\n      \"f24_rb1\",\n      0,\n      \"f24_obj\",\n      1\n    ],\n    [\n      \"f25_tbtn\",\n      0,\n      \"f25_tsel\",\n      0\n    ],\n    [\n      \"f25_tsel\",\n      0,\n      \"f25_tsend\",\n      0\n    ],\n    [\n      \"f25_rin\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c0\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c1\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c2\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c3\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c4\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_c5\",\n      0,\n      \"f25_obj\",\n      0\n    ],\n    [\n      \"f25_obj\",\n      0,\n      \"f25_sout\",\n      0\n    ],\n    [\n      \"f25_rb1\",\n      0,\n      \"f25_obj\",\n      1\n    ],\n    [\n      \"f26_tbtn\",\n      0,\n      \"f26_tsel\",\n      0\n    ],\n    [\n      \"f26_tsel\",\n      0,\n      \"f26_tsend\",\n      0\n    ],\n    [\n      \"f26_rin\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c0\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c1\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c2\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c3\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c4\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_c5\",\n      0,\n      \"f26_obj\",\n      0\n    ],\n    [\n      \"f26_obj\",\n      0,\n      \"f26_sout\",\n      0\n    ],\n    [\n      \"f26_rb1\",\n      0,\n      \"f26_obj\",\n      1\n    ],\n    [\n      \"f27_tbtn\",\n      0,\n      \"f27_tsel\",\n      0\n    ],\n    [\n      \"f27_tsel\",\n      0,\n      \"f27_tsend\",\n      0\n    ],\n    [\n      \"f27_rin\",\n      0,\n      \"f27_bp\",\n      0\n    ],\n    [\n      \"f27_bp\",\n      0,\n      \"f27_sout\",\n      0\n    ],\n    [\n      \"f27_rb1\",\n      0,\n      \"f27_bp\",\n      1\n    ],\n    [\n      \"f28_tbtn\",\n      0,\n      \"f28_tsel\",\n      0\n    ],\n    [\n      \"f28_tsel\",\n      0,\n      \"f28_tsend\",\n      0\n    ],\n    [\n      \"f28_rin\",\n      0,\n      \"f28_bp\",\n      0\n    ],\n    [\n      \"f28_bp\",\n      0,\n      \"f28_sout\",\n      0\n    ],\n    [\n      \"f28_rb1\",\n      0,\n      \"f28_bp\",\n      1\n    ],\n    [\n      \"g_rsel\",\n      0,\n      \"gate\",\n      0\n    ],\n    [\n      \"g_rsrc\",\n      0,\n      \"gate\",\n      1\n    ],\n    [\n      \"gate\",\n      1,\n      \"g_s2\",\n      0\n    ],\n    [\n      \"gate\",\n      2,\n      \"g_s3\",\n      0\n    ],\n    [\n      \"gate\",\n      3,\n      \"g_s4\",\n      0\n    ],\n    [\n      \"gate\",\n      4,\n      \"g_s5\",\n      0\n    ],\n    [\n      \"gate\",\n      5,\n      \"g_s6\",\n      0\n    ],\n    [\n      \"gate\",\n      6,\n      \"g_s7\",\n      0\n    ],\n    [\n      \"gate\",\n      7,\n      \"g_s8\",\n      0\n    ],\n    [\n      \"gate\",\n      8,\n      \"g_s9\",\n      0\n    ],\n    [\n      \"gate\",\n      9,\n      \"g_s10\",\n      0\n    ],\n    [\n      \"gate\",\n      10,\n      \"g_s11\",\n      0\n    ],\n    [\n      \"gate\",\n      11,\n      \"g_s12\",\n      0\n    ],\n    [\n      \"gate\",\n      12,\n      \"g_s13\",\n      0\n    ],\n    [\n      \"gate\",\n      13,\n      \"g_s14\",\n      0\n    ],\n    [\n      \"gate\",\n      14,\n      \"g_s15\",\n      0\n    ],\n    [\n      \"gate\",\n      15,\n      \"g_s16\",\n      0\n    ],\n    [\n      \"gate\",\n      16,\n      \"g_s17\",\n      0\n    ],\n    [\n      \"gate\",\n      17,\n      \"g_s18\",\n      0\n    ],\n    [\n      \"gate\",\n      18,\n      \"g_s19\",\n      0\n    ],\n    [\n      \"gate\",\n      19,\n      \"g_s20\",\n      0\n    ],\n    [\n      \"gate\",\n      20,\n      \"g_s21\",\n      0\n    ],\n    [\n      \"gate\",\n      21,\n      \"g_s22\",\n      0\n    ],\n    [\n      \"gate\",\n      22,\n      \"g_s23\",\n      0\n    ],\n    [\n      \"gate\",\n      23,\n      \"g_s24\",\n      0\n    ],\n    [\n      \"gate\",\n      24,\n      \"g_s25\",\n      0\n    ],\n    [\n      \"gate\",\n      25,\n      \"g_s26\",\n      0\n    ],\n    [\n      \"gate\",\n      26,\n      \"g_s27\",\n      0\n    ],\n    [\n      \"gate\",\n      27,\n      \"g_s28\",\n      0\n    ],\n    [\n      \"sw_rsel\",\n      0,\n      \"wet_sw\",\n      0\n    ],\n    [\n      \"sw_rdry\",\n      0,\n      \"wet_sw\",\n      1\n    ],\n    [\n      \"sw_r2\",\n      0,\n      \"wet_sw\",\n      2\n    ],\n    [\n      \"sw_r3\",\n      0,\n      \"wet_sw\",\n      3\n    ],\n    [\n      \"sw_r4\",\n      0,\n      \"wet_sw\",\n      4\n    ],\n    [\n      \"sw_r5\",\n      0,\n      \"wet_sw\",\n      5\n    ],\n    [\n      \"sw_r6\",\n      0,\n      \"wet_sw\",\n      6\n    ],\n    [\n      \"sw_r7\",\n      0,\n      \"wet_sw\",\n      7\n    ],\n    [\n      \"sw_r8\",\n      0,\n      \"wet_sw\",\n      8\n    ],\n    [\n      \"sw_r9\",\n      0,\n      \"wet_sw\",\n      9\n    ],\n    [\n      \"sw_r10\",\n      0,\n      \"wet_sw\",\n      10\n    ],\n    [\n      \"sw_r11\",\n      0,\n      \"wet_sw\",\n      11\n    ],\n    [\n      \"sw_r12\",\n      0,\n      \"wet_sw\",\n      12\n    ],\n    [\n      \"sw_r13\",\n      0,\n      \"wet_sw\",\n      13\n    ],\n    [\n      \"sw_r14\",\n      0,\n      \"wet_sw\",\n      14\n    ],\n    [\n      \"sw_r15\",\n      0,\n      \"wet_sw\",\n      15\n    ],\n    [\n      \"sw_r16\",\n      0,\n      \"wet_sw\",\n      16\n    ],\n    [\n      \"sw_r17\",\n      0,\n      \"wet_sw\",\n      17\n    ],\n    [\n      \"sw_r18\",\n      0,\n      \"wet_sw\",\n      18\n    ],\n    [\n      \"sw_r19\",\n      0,\n      \"wet_sw\",\n      19\n    ],\n    [\n      \"sw_r20\",\n      0,\n      \"wet_sw\",\n      20\n    ],\n    [\n      \"sw_r21\",\n      0,\n      \"wet_sw\",\n      21\n    ],\n    [\n      \"sw_r22\",\n      0,\n      \"wet_sw\",\n      22\n    ],\n    [\n      \"sw_r23\",\n      0,\n      \"wet_sw\",\n      23\n    ],\n    [\n      \"sw_r24\",\n      0,\n      \"wet_sw\",\n      24\n    ],\n    [\n      \"sw_r25\",\n      0,\n      \"wet_sw\",\n      25\n    ],\n    [\n      \"sw_r26\",\n      0,\n      \"wet_sw\",\n      26\n    ],\n    [\n      \"sw_r27\",\n      0,\n      \"wet_sw\",\n      27\n    ],\n    [\n      \"sw_r28\",\n      0,\n      \"wet_sw\",\n      28\n    ],\n    [\n      \"wet_sw\",\n      0,\n      \"s_vwet\",\n      0\n    ],\n    [\n      \"m_rdry\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_xf_ui\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_rwet\",\n      0,\n      \"m_xf\",\n      1\n    ],\n    [\n      \"m_xf\",\n      0,\n      \"m_layer\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-52",
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
            "obj-53",
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
            "obj-64",
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
            "obj-61",
            1
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
            "obj-73",
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
            "obj-73",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-73",
            1
          ],
          "source": [
            "obj-77",
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
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-82",
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
            "obj-85",
            0
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
            "obj-88",
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
            "obj-85",
            1
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
            "obj-97",
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
            "obj-97",
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
            "obj-97",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-97",
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
            "obj-124",
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
            "obj-125",
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
            "obj-133",
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
            "obj-133",
            1
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
            "obj-145",
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
            "obj-145",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-145",
            1
          ],
          "source": [
            "obj-149",
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
            "obj-154",
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
            "obj-157",
            0
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
            "obj-160",
            0
          ],
          "source": [
            "obj-157",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-157",
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
            "obj-169",
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
            "obj-169",
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
            "obj-169",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-169",
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
            "obj-184",
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
            "obj-185",
            0
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
            "obj-193",
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
            "obj-196",
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
            "obj-193",
            1
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
            "obj-201",
            0
          ],
          "source": [
            "obj-200",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-202",
            0
          ],
          "source": [
            "obj-201",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-205",
            0
          ],
          "source": [
            "obj-204",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-205",
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
            "obj-208",
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
            "obj-205",
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
            "obj-213",
            0
          ],
          "source": [
            "obj-212",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-214",
            0
          ],
          "source": [
            "obj-213",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-217",
            0
          ],
          "source": [
            "obj-216",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-217",
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
            "obj-217",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-217",
            1
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
            "obj-225",
            0
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
            0
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
            "obj-228",
            0
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
            "obj-230",
            0
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
            "obj-229",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-229",
            1
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
            "obj-237",
            0
          ],
          "source": [
            "obj-236",
            0
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
            "obj-237",
            0
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
            "obj-240",
            0
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
            "obj-242",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-244",
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
            "obj-241",
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
            "obj-249",
            0
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
            "obj-250",
            0
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
            "obj-253",
            0
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
            "obj-256",
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
            "obj-253",
            1
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
            "obj-261",
            0
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
            "obj-262",
            0
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
            "obj-265",
            0
          ],
          "source": [
            "obj-266",
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
            "obj-265",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-265",
            1
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
            "obj-273",
            0
          ],
          "source": [
            "obj-272",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-274",
            0
          ],
          "source": [
            "obj-273",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-277",
            0
          ],
          "source": [
            "obj-276",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-277",
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
            "obj-277",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-277",
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
            "obj-285",
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
            0
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
            "obj-289",
            0
          ],
          "source": [
            "obj-288",
            0
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
            "obj-290",
            0
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
            "obj-289",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-289",
            1
          ],
          "source": [
            "obj-293",
            0
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
            "obj-296",
            0
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
            "obj-297",
            0
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
            "obj-300",
            0
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
            "obj-302",
            0
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
            "obj-301",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-301",
            1
          ],
          "source": [
            "obj-305",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-309",
            0
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
            "obj-310",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-313",
            0
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
            "obj-321",
            0
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
            "obj-313",
            1
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
            "obj-326",
            0
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
            0
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
            "obj-330",
            0
          ],
          "source": [
            "obj-329",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-330",
            0
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
            "obj-330",
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
            "obj-330",
            0
          ],
          "source": [
            "obj-333",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-330",
            0
          ],
          "source": [
            "obj-334",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-330",
            0
          ],
          "source": [
            "obj-335",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-330",
            0
          ],
          "source": [
            "obj-336",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-338",
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
            "obj-330",
            1
          ],
          "source": [
            "obj-339",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-343",
            0
          ],
          "source": [
            "obj-342",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-344",
            0
          ],
          "source": [
            "obj-343",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-347",
            0
          ],
          "source": [
            "obj-346",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-348",
            0
          ],
          "source": [
            "obj-347",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-347",
            1
          ],
          "source": [
            "obj-349",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-354",
            0
          ],
          "source": [
            "obj-353",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-355",
            0
          ],
          "source": [
            "obj-354",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-358",
            0
          ],
          "source": [
            "obj-357",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-359",
            0
          ],
          "source": [
            "obj-358",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-358",
            1
          ],
          "source": [
            "obj-360",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-365",
            0
          ],
          "source": [
            "obj-363",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-365",
            1
          ],
          "source": [
            "obj-364",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-366",
            0
          ],
          "source": [
            "obj-365",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-367",
            0
          ],
          "source": [
            "obj-365",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-368",
            0
          ],
          "source": [
            "obj-365",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-369",
            0
          ],
          "source": [
            "obj-365",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-370",
            0
          ],
          "source": [
            "obj-365",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-371",
            0
          ],
          "source": [
            "obj-365",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-372",
            0
          ],
          "source": [
            "obj-365",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-373",
            0
          ],
          "source": [
            "obj-365",
            8
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-374",
            0
          ],
          "source": [
            "obj-365",
            9
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-375",
            0
          ],
          "source": [
            "obj-365",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-376",
            0
          ],
          "source": [
            "obj-365",
            11
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-377",
            0
          ],
          "source": [
            "obj-365",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-378",
            0
          ],
          "source": [
            "obj-365",
            13
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-379",
            0
          ],
          "source": [
            "obj-365",
            14
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-380",
            0
          ],
          "source": [
            "obj-365",
            15
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-381",
            0
          ],
          "source": [
            "obj-365",
            16
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-382",
            0
          ],
          "source": [
            "obj-365",
            17
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-383",
            0
          ],
          "source": [
            "obj-365",
            18
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-384",
            0
          ],
          "source": [
            "obj-365",
            19
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-385",
            0
          ],
          "source": [
            "obj-365",
            20
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-386",
            0
          ],
          "source": [
            "obj-365",
            21
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-387",
            0
          ],
          "source": [
            "obj-365",
            22
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-388",
            0
          ],
          "source": [
            "obj-365",
            23
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-389",
            0
          ],
          "source": [
            "obj-365",
            24
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-390",
            0
          ],
          "source": [
            "obj-365",
            25
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-391",
            0
          ],
          "source": [
            "obj-365",
            26
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-392",
            0
          ],
          "source": [
            "obj-365",
            27
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            0
          ],
          "source": [
            "obj-393",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            1
          ],
          "source": [
            "obj-394",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            2
          ],
          "source": [
            "obj-395",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            3
          ],
          "source": [
            "obj-396",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            4
          ],
          "source": [
            "obj-397",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            5
          ],
          "source": [
            "obj-398",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            6
          ],
          "source": [
            "obj-399",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            7
          ],
          "source": [
            "obj-400",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            8
          ],
          "source": [
            "obj-401",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            9
          ],
          "source": [
            "obj-402",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            10
          ],
          "source": [
            "obj-403",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            11
          ],
          "source": [
            "obj-404",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            12
          ],
          "source": [
            "obj-405",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            13
          ],
          "source": [
            "obj-406",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            14
          ],
          "source": [
            "obj-407",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            15
          ],
          "source": [
            "obj-408",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            16
          ],
          "source": [
            "obj-409",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            17
          ],
          "source": [
            "obj-410",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            18
          ],
          "source": [
            "obj-411",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            19
          ],
          "source": [
            "obj-412",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            20
          ],
          "source": [
            "obj-413",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            21
          ],
          "source": [
            "obj-414",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            22
          ],
          "source": [
            "obj-415",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            23
          ],
          "source": [
            "obj-416",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            24
          ],
          "source": [
            "obj-417",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            25
          ],
          "source": [
            "obj-418",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            26
          ],
          "source": [
            "obj-419",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            27
          ],
          "source": [
            "obj-420",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-422",
            28
          ],
          "source": [
            "obj-421",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-423",
            0
          ],
          "source": [
            "obj-422",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-428",
            0
          ],
          "source": [
            "obj-425",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-428",
            0
          ],
          "source": [
            "obj-427",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-428",
            1
          ],
          "source": [
            "obj-426",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-429",
            0
          ],
          "source": [
            "obj-428",
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
