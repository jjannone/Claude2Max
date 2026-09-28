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
      1326.0,
      1092.0
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
          "text": "VIDEO COLOR SHOOTOUT \u2014 colour and tone: brightness / contrast, hue, thresholds and colour maps. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 15, conventional order. The v8 maps item index \u2192 slot number (1 = DRY) and lights the pane title"
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
            324.0
          ],
          "num_lines_patching": 15,
          "num_lines_presentation": 15,
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
                "2 fx.brcosa",
                "3 fx.hue",
                "4 fx.threshold",
                "5 fx.rgb2luma",
                "6 Vizzie BRCOSR",
                "7 Vizzie HUSALIR",
                "8 Vizzie COLORIZR",
                "9 Vizzie 2TONR",
                "10 Vizzie POSTERIZR",
                "11 Vizzie SOLARIZR",
                "12 Vizzie TECHNICOLOR8R",
                "13 Vizzie MUTIL8R",
                "14 Vizzie MAPPR",
                "15 Vizzie PLANEMAPPR"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "VFX_SELECT",
              "parameter_mmax": 14,
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
            118.0,
            20.0
          ],
          "text": "2 \u00b7 fx.brcosa",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            400.0,
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
          "id": "obj-27",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            568.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            400.0,
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
          "id": "obj-28",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            568.0,
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
            568.0,
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
            528.0,
            20.0
          ],
          "text": "2 \u00b7 jit.fx.brcosa \u2014 brightness / contrast / saturation (1 = unchanged)"
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
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            724.0,
            321.0,
            22.0
          ],
          "text": "jit.fx.brcosa @contrast 1.6 @saturation 1.8",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            520.0,
            284.0,
            35.0
          ],
          "presentation_linecount": 2
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
            424.0,
            284.0,
            22.0
          ],
          "attr": "contrast",
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
            447.0,
            284.0,
            22.0
          ],
          "attr": "saturation",
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
            470.0,
            284.0,
            22.0
          ],
          "attr": "brightness",
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
            493.0,
            284.0,
            22.0
          ],
          "attr": "luma",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            86.0,
            399.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.brcosa",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            561.0,
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
          "id": "obj-38",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            769.0,
            69.0,
            22.0
          ],
          "text": "s VFX02"
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
            2520.0,
            112.0,
            93.0,
            20.0
          ],
          "text": "3 \u00b7 fx.hue",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            400.0,
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
          "id": "obj-41",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1178.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            400.0,
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
          "id": "obj-42",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1178.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1178.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            708.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "3 \u00b7 jit.fx.hue \u2014 hue rotation in degrees"
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            708.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN03"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            708.0,
            672.0,
            153.0,
            22.0
          ],
          "text": "jit.fx.hue @hue 90.",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            451.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            828.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            424.0,
            234.0,
            22.0
          ],
          "attr": "hue",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            138.0,
            373.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.hue",
          "presentation": 1,
          "presentation_rect": [
            326.0,
            479.0,
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
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            708.0,
            717.0,
            69.0,
            22.0
          ],
          "text": "s VFX03"
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
            144.0,
            20.0
          ],
          "text": "4 \u00b7 fx.threshold",
          "presentation": 1,
          "presentation_rect": [
            584.0,
            400.0,
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
          "id": "obj-52",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1791.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            584.0,
            400.0,
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
          "id": "obj-53",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1791.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
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
            1791.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1318.0,
            520.0,
            463.0,
            20.0
          ],
          "text": "4 \u00b7 jit.fx.threshold \u2014 smooth threshold around a colour value"
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1318.0,
            550.0,
            69.0,
            22.0
          ],
          "text": "r VIN04"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1318.0,
            672.0,
            132.0,
            22.0
          ],
          "text": "jit.fx.threshold",
          "presentation": 1,
          "presentation_rect": [
            584.0,
            474.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1438.0,
            590.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            584.0,
            424.0,
            234.0,
            22.0
          ],
          "attr": "amt",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1458.0,
            616.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            584.0,
            447.0,
            234.0,
            22.0
          ],
          "attr": "smoothness",
          "text_width": 110.0
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
            1318.0,
            717.0,
            69.0,
            22.0
          ],
          "text": "s VFX04"
        }
      },
      {
        "box": {
          "id": "obj-62",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            190.0,
            135.0,
            20.0
          ],
          "text": "5 \u00b7 fx.rgb2luma",
          "presentation": 1,
          "presentation_rect": [
            842.0,
            400.0,
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
          "id": "obj-63",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            560.0,
            869.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            842.0,
            400.0,
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
          "id": "obj-64",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            560.0,
            899.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            560.0,
            929.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            869.0,
            520.0,
            20.0
          ],
          "text": "5 \u00b7 jit.fx.rgb2luma \u2014 RGB to luminance (the scales weight each plane)"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            899.0,
            69.0,
            22.0
          ],
          "text": "r VIN05"
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1047.0,
            125.0,
            22.0
          ],
          "text": "jit.fx.rgb2luma",
          "presentation": 1,
          "presentation_rect": [
            842.0,
            497.0,
            234.0,
            22.0
          ]
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
            150.0,
            939.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            842.0,
            424.0,
            234.0,
            22.0
          ],
          "attr": "rscale",
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
            170.0,
            965.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            842.0,
            447.0,
            234.0,
            22.0
          ],
          "attr": "gscale",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            991.0,
            199.0,
            23.0
          ],
          "presentation": 1,
          "presentation_rect": [
            842.0,
            470.0,
            234.0,
            22.0
          ],
          "attr": "bscale",
          "text_width": 110.0
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            416.0,
            20.0
          ],
          "text": "newer GPU version of the CPU object jit.rgb2luma",
          "presentation": 1,
          "presentation_rect": [
            842.0,
            525.0,
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
          "id": "obj-73",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1092.0,
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
            242.0,
            152.0,
            20.0
          ],
          "text": "6 \u00b7 Vizzie BRCOSR",
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            400.0,
            208.0,
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
          "id": "obj-76",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1170.0,
            869.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            400.0,
            208.0,
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
          "id": "obj-77",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1170.0,
            899.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1170.0,
            929.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            700.0,
            869.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 BRCOSR \u2014 brightness / contrast / saturation"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            899.0,
            69.0,
            22.0
          ],
          "text": "r VIN06"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "bpatcher",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            979.0,
            208.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            424.0,
            208.0,
            130.0
          ],
          "name": "vz.brcosr.maxpat",
          "varname": "brcosr",
          "comment": "in 0: Video input | in 1: Set the value for the brightness dial. | in 2: Set the value for the contrast dial. | in 3: Set the value for the saturation dial. | in 4: Toggle low/high brightness | in 5: Toggle low/high contrast data range | in 6: Toggle low/high saturation data range | out 0: Video output",
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
          "id": "obj-82",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            700.0,
            1144.0,
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
            268.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            560.0,
            208.0,
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
          "id": "obj-85",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            294.0,
            161.0,
            20.0
          ],
          "text": "7 \u00b7 Vizzie HUSALIR",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            626.0,
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
          "varname": "TITLE_07"
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1780.0,
            869.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            626.0,
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
          "id": "obj-87",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1780.0,
            899.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            1780.0,
            929.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            869.0,
            460.0,
            20.0
          ],
          "text": "7 \u00b7 HUSALIR \u2014 hue / saturation / lightness gains"
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            899.0,
            69.0,
            22.0
          ],
          "text": "r VIN07"
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            979.0,
            188.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            650.0,
            188.0,
            130.0
          ],
          "name": "vz.husalir.maxpat",
          "varname": "husalir",
          "comment": "in 0: Video input | in 1: Set the gain on the hue of the image | in 2: Set the gain on the saturation of the image | in 3: Set the gain on the luminance of the image | out 0: Video output",
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
          "id": "obj-92",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            1144.0,
            69.0,
            22.0
          ],
          "text": "s VFX07"
        }
      },
      {
        "box": {
          "id": "obj-93",
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
            786.0,
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
          "id": "obj-95",
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
          "text": "8 \u00b7 Vizzie COLORIZR",
          "presentation": 1,
          "presentation_rect": [
            230.0,
            626.0,
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
          "varname": "TITLE_08"
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1244.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            626.0,
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
          "id": "obj-97",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1274.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-98",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            1304.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1244.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 COLORIZR \u2014 procedural colouring from one plane"
        }
      },
      {
        "box": {
          "id": "obj-100",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1274.0,
            69.0,
            22.0
          ],
          "text": "r VIN08"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1354.0,
            138.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            650.0,
            138.0,
            130.0
          ],
          "name": "vz.colorizr.maxpat",
          "varname": "freezr",
          "comment": "in 0: Video input | in 1: Choose a color plane as the colorization source | in 2: Choose a color palette used for colorization | in 3: Toggle inverting the swizzed color used for procedural coloring | out 0: Video output",
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
          "id": "obj-102",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1519.0,
            69.0,
            22.0
          ],
          "text": "s VFX08"
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
            372.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            230.0,
            786.0,
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
          "id": "obj-105",
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
          "text": "9 \u00b7 Vizzie 2TONR",
          "presentation": 1,
          "presentation_rect": [
            392.0,
            626.0,
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
          "varname": "TITLE_09"
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1244.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            392.0,
            626.0,
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
          "id": "obj-107",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1274.0,
            40.0,
            22.0
          ],
          "text": "8"
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1304.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1244.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 2TONR \u2014 duotone from two colours"
        }
      },
      {
        "box": {
          "id": "obj-110",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1274.0,
            69.0,
            22.0
          ],
          "text": "r VIN09"
        }
      },
      {
        "box": {
          "id": "obj-111",
          "maxclass": "bpatcher",
          "numinlets": 9,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1354.0,
            228.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            392.0,
            650.0,
            228.0,
            130.0
          ],
          "name": "vz.2tonr.maxpat",
          "varname": "2toner",
          "comment": "in 0: Video input | in 1: Set the Red part of color 1 | in 2: Set the Green part of color 1 | in 3: Set the Blue part of color 1 | in 4: Color 1 saturation | in 5: Set the Red part of color 2 | in 6: Set the Green part of color 2 | in 7: Set the Blue part of color 2 | in 8: Color 2 saturation | out 0: Video output",
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
          "id": "obj-112",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1519.0,
            69.0,
            22.0
          ],
          "text": "s VFX09"
        }
      },
      {
        "box": {
          "id": "obj-113",
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
            392.0,
            786.0,
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
          "id": "obj-115",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            450.0,
            186.0,
            20.0
          ],
          "text": "10 \u00b7 Vizzie POSTERIZR",
          "presentation": 1,
          "presentation_rect": [
            644.0,
            626.0,
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
          "varname": "TITLE_10"
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
            1720.0,
            1244.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            644.0,
            626.0,
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
          "id": "obj-117",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            1274.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1720.0,
            1304.0,
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
            1250.0,
            1244.0,
            460.0,
            20.0
          ],
          "text": "10 \u00b7 POSTERIZR \u2014 fewer colour levels (posterize)"
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
            1250.0,
            1274.0,
            69.0,
            22.0
          ],
          "text": "r VIN10"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "bpatcher",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1354.0,
            148.0,
            112.0
          ],
          "presentation": 1,
          "presentation_rect": [
            644.0,
            650.0,
            148.0,
            112.0
          ],
          "name": "vz.posterizr.maxpat",
          "varname": "posterizr",
          "comment": "in 0: Video input | in 1: Set the number of color levels to be used when displaying the output | out 0: Video output",
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
          "id": "obj-122",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1501.0,
            69.0,
            22.0
          ],
          "text": "s VFX10"
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
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            644.0,
            768.0,
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
          "id": "obj-125",
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
          "text": "11 \u00b7 Vizzie SOLARIZR",
          "presentation": 1,
          "presentation_rect": [
            816.0,
            626.0,
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
          "varname": "TITLE_11"
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1619.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            816.0,
            626.0,
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
          "id": "obj-127",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1649.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            500.0,
            1679.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-129",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1619.0,
            460.0,
            20.0
          ],
          "text": "11 \u00b7 SOLARIZR \u2014 solarize"
        }
      },
      {
        "box": {
          "id": "obj-130",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1649.0,
            69.0,
            22.0
          ],
          "text": "r VIN11"
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "bpatcher",
          "numinlets": 8,
          "numoutlets": 1,
          "outlettype": [
            "jit_gl_texture"
          ],
          "patching_rect": [
            30.0,
            1729.0,
            258.0,
            146.0
          ],
          "presentation": 1,
          "presentation_rect": [
            816.0,
            650.0,
            258.0,
            146.0
          ],
          "name": "vz.solarizr.maxpat",
          "varname": "solarizr",
          "comment": "in 0: Video input | in 1: Set the Red part of the RGB color for the solarization color | in 2: Set the Green part of the RGB color for the solarization color | in 3: Set the Blue part of the RGB color for the solarization color | in 4: Set the saturation of the RGB color for the solarization color | in 5: Set the value for the luminance control | in 6: Set the value for the tolerance control | in 7: Set the tint mode | out 0: Video output",
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
          "id": "obj-132",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1910.0,
            69.0,
            22.0
          ],
          "text": "s VFX11"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            816.0,
            802.0,
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
          "id": "obj-135",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
            220.0,
            20.0
          ],
          "text": "12 \u00b7 Vizzie TECHNICOLOR8R",
          "presentation": 1,
          "presentation_rect": [
            1098.0,
            626.0,
            173.0,
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
          "id": "obj-136",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1619.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1098.0,
            626.0,
            173.0,
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
          "id": "obj-137",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1649.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1679.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            1619.0,
            460.0,
            20.0
          ],
          "text": "12 \u00b7 TECHNICOLOR8R \u2014 Technicolor process simulation"
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1649.0,
            69.0,
            22.0
          ],
          "text": "r VIN12"
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1729.0,
            168.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1098.0,
            650.0,
            168.0,
            130.0
          ],
          "name": "vz.technicolor8r.maxpat",
          "varname": "technicolor8r",
          "comment": "in 0: Video input | in 1: Select one of the technicolor process simulations to be used | in 2: Set the amount of the technicolor process to be applied to the image | out 0: Video output",
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
          "id": "obj-142",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            1894.0,
            69.0,
            22.0
          ],
          "text": "s VFX12"
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
            2520.0,
            580.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            1098.0,
            786.0,
            173.0,
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
          "id": "obj-145",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
            169.0,
            20.0
          ],
          "text": "13 \u00b7 Vizzie MUTIL8R",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            865.0,
            368.0,
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
          "id": "obj-146",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            1619.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            865.0,
            368.0,
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
            1720.0,
            1649.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            1720.0,
            1679.0,
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
            1250.0,
            1619.0,
            460.0,
            20.0
          ],
          "text": "13 \u00b7 MUTIL8R \u2014 scale / fold / wrap each of R, G, B"
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
            1250.0,
            1649.0,
            69.0,
            22.0
          ],
          "text": "r VIN13"
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "bpatcher",
          "numinlets": 10,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1729.0,
            368.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            889.0,
            368.0,
            130.0
          ],
          "name": "vz.mutil8r.maxpat",
          "varname": "mutil8r",
          "comment": "in 0: Video input | in 1: Set the Red multiplier value | in 2: Select normal or inverted Red value ranges | in 3: Select folding or wrapping for out-of-range Red values | in 4: Set the Green multiplier value | in 5: Select normal or inverted Green value ranges | in 6: Select folding or wrapping for out-of-range Green values | in 7: Set the Blue multiplier value | in 8: Select normal or inverted Blue value ranges | in 9: Select folding or wrapping for out-of-range Blue values | out 0: Video output",
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
          "id": "obj-152",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1894.0,
            69.0,
            22.0
          ],
          "text": "s VFX13"
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
            2520.0,
            632.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1025.0,
            368.0,
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
          "id": "obj-155",
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
          "text": "14 \u00b7 Vizzie MAPPR",
          "presentation": 1,
          "presentation_rect": [
            410.0,
            865.0,
            388.0,
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
          "id": "obj-156",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2010.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            410.0,
            865.0,
            388.0,
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
          "id": "obj-157",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            2040.0,
            40.0,
            22.0
          ],
          "text": "13"
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            2070.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            2010.0,
            460.0,
            20.0
          ],
          "text": "14 \u00b7 MAPPR \u2014 a mapping function per colour plane"
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2040.0,
            69.0,
            22.0
          ],
          "text": "r VIN14"
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "bpatcher",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2120.0,
            388.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            410.0,
            889.0,
            388.0,
            130.0
          ],
          "name": "vz.mappr.maxpat",
          "varname": "mappr",
          "comment": "in 0: Video input | in 1: Set the Red color mapping function | in 2: Set the Green color mapping function | in 3: Set the Blue color mapping function. | in 4: Reset all R values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 5: Reset all G values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 6: Reset all B values to their default state (0. - .49 = off, .50 - 1.0 = reset) | out 0: Video output",
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
          "id": "obj-162",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2285.0,
            69.0,
            22.0
          ],
          "text": "s VFX14"
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
            684.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            410.0,
            1025.0,
            388.0,
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
          "id": "obj-165",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
            195.0,
            20.0
          ],
          "text": "15 \u00b7 Vizzie PLANEMAPPR",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            865.0,
            208.0,
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
          "id": "obj-166",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            2010.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            865.0,
            208.0,
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
          "id": "obj-167",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            2040.0,
            40.0,
            22.0
          ],
          "text": "14"
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
            1110.0,
            2070.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            2010.0,
            460.0,
            20.0
          ],
          "text": "15 \u00b7 PLANEMAPPR \u2014 remap the R, G, B, A planes"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2040.0,
            69.0,
            22.0
          ],
          "text": "r VIN15"
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "bpatcher",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2120.0,
            208.0,
            130.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            889.0,
            208.0,
            130.0
          ],
          "name": "vz.planemappr.maxpat",
          "varname": "planemappr",
          "comment": "in 0: Video input | in 1: Set the plane mapping for the Red plane | in 2: Set the plane mapping for the Green plane | in 3: Set the plane mapping for the Blue plane | in 4: Set the plane mapping for the Alpha plane | out 0: Video output",
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
          "id": "obj-172",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2285.0,
            69.0,
            22.0
          ],
          "text": "s VFX15"
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
            2520.0,
            736.0,
            441.0,
            20.0
          ],
          "text": "loads at the module's own settings \u2014 turn its dials",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            1025.0,
            208.0,
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
          "id": "obj-174",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2385.0,
            1200.0,
            34.0
          ],
          "text": "ROUTER \u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself"
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
            2435.0,
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
            1150.0,
            2435.0,
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
          "numinlets": 2,
          "numoutlets": 15,
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
            ""
          ],
          "patching_rect": [
            30.0,
            2475.0,
            1158.0,
            22.0
          ],
          "text": "gate 15"
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
            110.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN02"
        }
      },
      {
        "box": {
          "id": "obj-179",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN03"
        }
      },
      {
        "box": {
          "id": "obj-180",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            270.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN04"
        }
      },
      {
        "box": {
          "id": "obj-181",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            350.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN05"
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
            430.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN06"
        }
      },
      {
        "box": {
          "id": "obj-183",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            510.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN07"
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
            590.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN08"
        }
      },
      {
        "box": {
          "id": "obj-185",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            670.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN09"
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
            750.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN10"
        }
      },
      {
        "box": {
          "id": "obj-187",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            830.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN11"
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
            910.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN12"
        }
      },
      {
        "box": {
          "id": "obj-189",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            990.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN13"
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
            1070.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN14"
        }
      },
      {
        "box": {
          "id": "obj-191",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            2530.0,
            69.0,
            22.0
          ],
          "text": "s VIN15"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2605.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
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
            2605.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
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
            190.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX02"
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX03"
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
            350.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX04"
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
            430.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX05"
        }
      },
      {
        "box": {
          "id": "obj-198",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX06"
        }
      },
      {
        "box": {
          "id": "obj-199",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX07"
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            670.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX08"
        }
      },
      {
        "box": {
          "id": "obj-201",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX09"
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
            830.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX10"
        }
      },
      {
        "box": {
          "id": "obj-203",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX11"
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
            990.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX12"
        }
      },
      {
        "box": {
          "id": "obj-205",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1070.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX13"
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
            1150.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX14"
        }
      },
      {
        "box": {
          "id": "obj-207",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1230.0,
            2605.0,
            69.0,
            22.0
          ],
          "text": "r VFX15"
        }
      },
      {
        "box": {
          "id": "obj-208",
          "maxclass": "newobj",
          "numinlets": 16,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2660.0,
            1238.0,
            22.0
          ],
          "text": "switch 15"
        }
      },
      {
        "box": {
          "id": "obj-209",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2715.0,
            62.0,
            22.0
          ],
          "text": "s VWET"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2775.0,
            800.0,
            20.0
          ],
          "text": "MASTER \u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld"
        }
      },
      {
        "box": {
          "id": "obj-211",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2815.0,
            62.0,
            22.0
          ],
          "text": "r VSRC"
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            2815.0,
            62.0,
            22.0
          ],
          "text": "r VWET"
        }
      },
      {
        "box": {
          "id": "obj-213",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2815.0,
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
          "id": "obj-214",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2865.0,
            195.0,
            22.0
          ],
          "text": "jit.fx.tr.xfade @xfade 1."
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2915.0,
            216.0,
            22.0
          ],
          "text": "jit.gl.layer @blend_enable 0"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "jit.pworld",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            2965.0,
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
          "id": "obj-220",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
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
          "id": "obj-221",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
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
          "id": "obj-222",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            814.0,
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
          "id": "obj-223",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
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
          "id": "obj-224",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
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
          "id": "obj-225",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
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
          "id": "obj-226",
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
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            394.0,
            300.0,
            216.0
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
          "id": "obj-39",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            100.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            318.0,
            394.0,
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
          "id": "obj-50",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            170.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
            394.0,
            250.0,
            116.0
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
          "id": "obj-61",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            240.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            834.0,
            394.0,
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
          "id": "obj-74",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            310.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1092.0,
            394.0,
            224.0,
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
          "id": "obj-84",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            380.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            620.0,
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
          "id": "obj-94",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            450.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            222.0,
            620.0,
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
          "id": "obj-104",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            520.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            384.0,
            620.0,
            244.0,
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
          "id": "obj-114",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            590.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            636.0,
            620.0,
            164.0,
            210.0
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
          "id": "obj-124",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            660.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            808.0,
            620.0,
            274.0,
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
          "id": "obj-134",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            730.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1090.0,
            620.0,
            189.0,
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
          "id": "obj-144",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            800.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            859.0,
            384.0,
            196.0
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
          "id": "obj-154",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            870.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            402.0,
            859.0,
            404.0,
            196.0
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
          "id": "obj-164",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            940.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            814.0,
            859.0,
            224.0,
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
          "id": "obj-217",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1010.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            380.0,
            374.0
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
          "id": "obj-218",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1080.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            10.0,
            294.0,
            374.0
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
          "id": "obj-219",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            3275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            696.0,
            10.0,
            494.0,
            374.0
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
          "id": "obj-spec-embed",
          "maxclass": "text.codebox",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            3335.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1326,\n  \"height\": 1092,\n  \"bglocked\": 1,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"VIDEO COLOR SHOOTOUT \\u2014 colour and tone: brightness / contrast, hue, thresholds and colour maps. One source (movie or webcam) on s VSRC. A gate feeds only the chosen effect, a switch passes only its output, and the master dry/wet crossfade (jit.fx.tr.xfade) draws into the jit.pworld. Everything is a GL texture.\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 the movie player (loads chickens.mp4, Max's own demo clip) or the webcam; the switch passes one\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        620,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"pl_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        30,\n        120\n      ],\n      \"size\": [\n        360,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        360,\n        100\n      ],\n      \"attrs\": {\n        \"output_texture\": 1,\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"chickens.mp4\",\n              \"filename\": \"chickens.mp4\",\n              \"filekind\": \"moviefile\",\n              \"id\": \"u169008532\",\n              \"loop\": 1,\n              \"content_state\": {}\n            }\n          ]\n        }\n      },\n      \"box_extras\": {\n        \"output_texture\": 1\n      }\n    },\n    \"cam_tog\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        430,\n        90\n      ],\n      \"presentation\": [\n        20,\n        168,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"cam_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        430,\n        130\n      ],\n      \"size\": [\n        55,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1 0\",\n      \"pos\": [\n        520,\n        175\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"cam_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        520,\n        220\n      ],\n      \"size\": [\n        48,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_close\": {\n      \"type\": \"message\",\n      \"text\": \"close\",\n      \"pos\": [\n        580,\n        220\n      ],\n      \"size\": [\n        55,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"cam_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab @output_texture 1 @automatic 1\",\n      \"pos\": [\n        520,\n        265\n      ],\n      \"size\": [\n        293,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"cam_plus\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        430,\n        220\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"c_cam\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam toggle: 1 opens the camera and picks switch input 2; 0 closes it, back to the movie\",\n      \"pos\": [\n        660,\n        130\n      ],\n      \"size\": [\n        360,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"src_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        130,\n        255\n      ],\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"src_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 2\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VSRC\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 15, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY) and lights the pane title\",\n      \"pos\": [\n        1460,\n        90\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1140,\n        50\n      ],\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        300,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        400,\n        40,\n        280,\n        324\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 15,\n        \"num_lines_presentation\": 15,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 fx.brcosa\",\n              \"3 fx.hue\",\n              \"4 fx.threshold\",\n              \"5 fx.rgb2luma\",\n              \"6 Vizzie BRCOSR\",\n              \"7 Vizzie HUSALIR\",\n              \"8 Vizzie COLORIZR\",\n              \"9 Vizzie 2TONR\",\n              \"10 Vizzie POSTERIZR\",\n              \"11 Vizzie SOLARIZR\",\n              \"12 Vizzie TECHNICOLOR8R\",\n              \"13 Vizzie MUTIL8R\",\n              \"14 Vizzie MAPPR\",\n              \"15 Vizzie PLANEMAPPR\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"VFX_SELECT\",\n            \"parameter_mmax\": 14,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VFX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"VFX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 15,\n        \"num_lines_presentation\": 15,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1240,\n        50\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1330,\n        50\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      },\n      \"size\": [\n        272,\n        22\n      ]\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"size\": [\n        55,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_hl\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        1140,\n        300\n      ],\n      \"size\": [\n        132,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        394,\n        300,\n        216\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 fx.brcosa\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        400,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        568,\n        520\n      ],\n      \"presentation\": [\n        18,\n        400,\n        284,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        568,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        568,\n        580\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 jit.fx.brcosa \\u2014 brightness / contrast / saturation (1 = unchanged)\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        528,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN02\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.brcosa @contrast 1.6 @saturation 1.8\",\n      \"pos\": [\n        30,\n        724\n      ],\n      \"presentation\": [\n        18,\n        520,\n        284,\n        35\n      ],\n      \"size\": [\n        321,\n        22\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"contrast\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        424,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"saturation\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        447,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"brightness\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        470,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        210,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"luma\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        18,\n        493,\n        284,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.brcosa\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        399,\n        20\n      ],\n      \"presentation\": [\n        18,\n        561,\n        284,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX02\",\n      \"pos\": [\n        30,\n        769\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        318,\n        394,\n        250,\n        134\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 fx.hue\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        93,\n        20\n      ],\n      \"presentation\": [\n        326,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1178,\n        520\n      ],\n      \"presentation\": [\n        326,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1178,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1178,\n        580\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 jit.fx.hue \\u2014 hue rotation in degrees\",\n      \"pos\": [\n        708,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN03\",\n      \"pos\": [\n        708,\n        550\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.hue @hue 90.\",\n      \"pos\": [\n        708,\n        672\n      ],\n      \"presentation\": [\n        326,\n        451,\n        234,\n        22\n      ],\n      \"size\": [\n        153,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        828,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"hue\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        326,\n        424,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.hue\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        373,\n        20\n      ],\n      \"presentation\": [\n        326,\n        479,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX03\",\n      \"pos\": [\n        708,\n        717\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        576,\n        394,\n        250,\n        116\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 fx.threshold\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        584,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1791,\n        520\n      ],\n      \"presentation\": [\n        584,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1791,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1791,\n        580\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 jit.fx.threshold \\u2014 smooth threshold around a colour value\",\n      \"pos\": [\n        1318,\n        520\n      ],\n      \"size\": [\n        463,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN04\",\n      \"pos\": [\n        1318,\n        550\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.threshold\",\n      \"pos\": [\n        1318,\n        672\n      ],\n      \"presentation\": [\n        584,\n        474,\n        234,\n        22\n      ],\n      \"size\": [\n        132,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1438,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"amt\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        584,\n        424,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1458,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"smoothness\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        584,\n        447,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX04\",\n      \"pos\": [\n        1318,\n        717\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        834,\n        394,\n        250,\n        180\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 fx.rgb2luma\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        842,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        560,\n        869\n      ],\n      \"presentation\": [\n        842,\n        400,\n        234,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        560,\n        899\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        560,\n        929\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 jit.fx.rgb2luma \\u2014 RGB to luminance (the scales weight each plane)\",\n      \"pos\": [\n        30,\n        869\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN05\",\n      \"pos\": [\n        30,\n        899\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.rgb2luma\",\n      \"pos\": [\n        30,\n        1047\n      ],\n      \"presentation\": [\n        842,\n        497,\n        234,\n        22\n      ],\n      \"size\": [\n        125,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        150,\n        939\n      ],\n      \"attrs\": {\n        \"attr\": \"rscale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        842,\n        424,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        170,\n        965\n      ],\n      \"attrs\": {\n        \"attr\": \"gscale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        842,\n        447,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        190,\n        991\n      ],\n      \"attrs\": {\n        \"attr\": \"bscale\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        842,\n        470,\n        234,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"newer GPU version of the CPU object jit.rgb2luma\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        416,\n        20\n      ],\n      \"presentation\": [\n        842,\n        525,\n        234,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX05\",\n      \"pos\": [\n        30,\n        1092\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1092,\n        394,\n        224,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 Vizzie BRCOSR\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1100,\n        400,\n        208,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1170,\n        869\n      ],\n      \"presentation\": [\n        1100,\n        400,\n        208,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1170,\n        899\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1170,\n        929\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 BRCOSR \\u2014 brightness / contrast / saturation\",\n      \"pos\": [\n        700,\n        869\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN06\",\n      \"pos\": [\n        700,\n        899\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        700,\n        979\n      ],\n      \"size\": [\n        208,\n        130\n      ],\n      \"inlets\": 7,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        1100,\n        424,\n        208,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.brcosr.maxpat\",\n        \"varname\": \"brcosr\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the brightness dial. | in 2: Set the value for the contrast dial. | in 3: Set the value for the saturation dial. | in 4: Toggle low/high brightness | in 5: Toggle low/high contrast data range | in 6: Toggle low/high saturation data range | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.brcosr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the value for the brightness dial. | in 2: Set the value for the contrast dial. | in 3: Set the value for the saturation dial. | in 4: Toggle low/high brightness | in 5: Toggle low/high contrast data range | in 6: Toggle low/high saturation data range | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX06\",\n      \"pos\": [\n        700,\n        1144\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        1100,\n        560,\n        208,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        620,\n        204,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 Vizzie HUSALIR\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        626,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1780,\n        869\n      ],\n      \"presentation\": [\n        18,\n        626,\n        188,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1780,\n        899\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1780,\n        929\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 HUSALIR \\u2014 hue / saturation / lightness gains\",\n      \"pos\": [\n        1310,\n        869\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN07\",\n      \"pos\": [\n        1310,\n        899\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1310,\n        979\n      ],\n      \"size\": [\n        188,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        650,\n        188,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.husalir.maxpat\",\n        \"varname\": \"husalir\",\n        \"comment\": \"in 0: Video input | in 1: Set the gain on the hue of the image | in 2: Set the gain on the saturation of the image | in 3: Set the gain on the luminance of the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.husalir.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the gain on the hue of the image | in 2: Set the gain on the saturation of the image | in 3: Set the gain on the luminance of the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX07\",\n      \"pos\": [\n        1310,\n        1144\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        786,\n        188,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        222,\n        620,\n        154,\n        228\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 Vizzie COLORIZR\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        230,\n        626,\n        138,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1244\n      ],\n      \"presentation\": [\n        230,\n        626,\n        138,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        500,\n        1274\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1304\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 COLORIZR \\u2014 procedural colouring from one plane\",\n      \"pos\": [\n        30,\n        1244\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN08\",\n      \"pos\": [\n        30,\n        1274\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1354\n      ],\n      \"size\": [\n        138,\n        130\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        230,\n        650,\n        138,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.colorizr.maxpat\",\n        \"varname\": \"freezr\",\n        \"comment\": \"in 0: Video input | in 1: Choose a color plane as the colorization source | in 2: Choose a color palette used for colorization | in 3: Toggle inverting the swizzed color used for procedural coloring | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.colorizr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Choose a color plane as the colorization source | in 2: Choose a color palette used for colorization | in 3: Toggle inverting the swizzed color used for procedural coloring | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX08\",\n      \"pos\": [\n        30,\n        1519\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        230,\n        786,\n        138,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        384,\n        620,\n        244,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 Vizzie 2TONR\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        392,\n        626,\n        228,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1244\n      ],\n      \"presentation\": [\n        392,\n        626,\n        228,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1110,\n        1274\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1304\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 2TONR \\u2014 duotone from two colours\",\n      \"pos\": [\n        640,\n        1244\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN09\",\n      \"pos\": [\n        640,\n        1274\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        1354\n      ],\n      \"size\": [\n        228,\n        130\n      ],\n      \"inlets\": 9,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        392,\n        650,\n        228,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.2tonr.maxpat\",\n        \"varname\": \"2toner\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red part of color 1 | in 2: Set the Green part of color 1 | in 3: Set the Blue part of color 1 | in 4: Color 1 saturation | in 5: Set the Red part of color 2 | in 6: Set the Green part of color 2 | in 7: Set the Blue part of color 2 | in 8: Color 2 saturation | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.2tonr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red part of color 1 | in 2: Set the Green part of color 1 | in 3: Set the Blue part of color 1 | in 4: Color 1 saturation | in 5: Set the Red part of color 2 | in 6: Set the Green part of color 2 | in 7: Set the Blue part of color 2 | in 8: Color 2 saturation | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX09\",\n      \"pos\": [\n        640,\n        1519\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        392,\n        786,\n        228,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        636,\n        620,\n        164,\n        210\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 Vizzie POSTERIZR\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        644,\n        626,\n        148,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        1244\n      ],\n      \"presentation\": [\n        644,\n        626,\n        148,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1720,\n        1274\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        1304\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 POSTERIZR \\u2014 fewer colour levels (posterize)\",\n      \"pos\": [\n        1250,\n        1244\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN10\",\n      \"pos\": [\n        1250,\n        1274\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1354\n      ],\n      \"size\": [\n        148,\n        112\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        644,\n        650,\n        148,\n        112\n      ],\n      \"attrs\": {\n        \"name\": \"vz.posterizr.maxpat\",\n        \"varname\": \"posterizr\",\n        \"comment\": \"in 0: Video input | in 1: Set the number of color levels to be used when displaying the output | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.posterizr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the number of color levels to be used when displaying the output | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX10\",\n      \"pos\": [\n        1250,\n        1501\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        644,\n        768,\n        148,\n        52\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        808,\n        620,\n        274,\n        229\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 Vizzie SOLARIZR\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        816,\n        626,\n        258,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1619\n      ],\n      \"presentation\": [\n        816,\n        626,\n        258,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        500,\n        1649\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1679\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 SOLARIZR \\u2014 solarize\",\n      \"pos\": [\n        30,\n        1619\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN11\",\n      \"pos\": [\n        30,\n        1649\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1729\n      ],\n      \"size\": [\n        258,\n        146\n      ],\n      \"inlets\": 8,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"jit_gl_texture\"\n      ],\n      \"presentation\": [\n        816,\n        650,\n        258,\n        146\n      ],\n      \"attrs\": {\n        \"name\": \"vz.solarizr.maxpat\",\n        \"varname\": \"solarizr\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red part of the RGB color for the solarization color | in 2: Set the Green part of the RGB color for the solarization color | in 3: Set the Blue part of the RGB color for the solarization color | in 4: Set the saturation of the RGB color for the solarization color | in 5: Set the value for the luminance control | in 6: Set the value for the tolerance control | in 7: Set the tint mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.solarizr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red part of the RGB color for the solarization color | in 2: Set the Green part of the RGB color for the solarization color | in 3: Set the Blue part of the RGB color for the solarization color | in 4: Set the saturation of the RGB color for the solarization color | in 5: Set the value for the luminance control | in 6: Set the value for the tolerance control | in 7: Set the tint mode | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX11\",\n      \"pos\": [\n        30,\n        1910\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        816,\n        802,\n        258,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1090,\n        620,\n        189,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 Vizzie TECHNICOLOR8R\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        1098,\n        626,\n        173,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1619\n      ],\n      \"presentation\": [\n        1098,\n        626,\n        173,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1110,\n        1649\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1679\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 TECHNICOLOR8R \\u2014 Technicolor process simulation\",\n      \"pos\": [\n        640,\n        1619\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN12\",\n      \"pos\": [\n        640,\n        1649\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        1729\n      ],\n      \"size\": [\n        168,\n        130\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        1098,\n        650,\n        168,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.technicolor8r.maxpat\",\n        \"varname\": \"technicolor8r\",\n        \"comment\": \"in 0: Video input | in 1: Select one of the technicolor process simulations to be used | in 2: Set the amount of the technicolor process to be applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.technicolor8r.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Select one of the technicolor process simulations to be used | in 2: Set the amount of the technicolor process to be applied to the image | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX12\",\n      \"pos\": [\n        640,\n        1894\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        1098,\n        786,\n        173,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        859,\n        384,\n        196\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 Vizzie MUTIL8R\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        865,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        1619\n      ],\n      \"presentation\": [\n        18,\n        865,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1720,\n        1649\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        1679\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 MUTIL8R \\u2014 scale / fold / wrap each of R, G, B\",\n      \"pos\": [\n        1250,\n        1619\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN13\",\n      \"pos\": [\n        1250,\n        1649\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1729\n      ],\n      \"size\": [\n        368,\n        130\n      ],\n      \"inlets\": 10,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        889,\n        368,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.mutil8r.maxpat\",\n        \"varname\": \"mutil8r\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red multiplier value | in 2: Select normal or inverted Red value ranges | in 3: Select folding or wrapping for out-of-range Red values | in 4: Set the Green multiplier value | in 5: Select normal or inverted Green value ranges | in 6: Select folding or wrapping for out-of-range Green values | in 7: Set the Blue multiplier value | in 8: Select normal or inverted Blue value ranges | in 9: Select folding or wrapping for out-of-range Blue values | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.mutil8r.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red multiplier value | in 2: Select normal or inverted Red value ranges | in 3: Select folding or wrapping for out-of-range Red values | in 4: Set the Green multiplier value | in 5: Select normal or inverted Green value ranges | in 6: Select folding or wrapping for out-of-range Green values | in 7: Set the Blue multiplier value | in 8: Select normal or inverted Blue value ranges | in 9: Select folding or wrapping for out-of-range Blue values | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f13_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX13\",\n      \"pos\": [\n        1250,\n        1894\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1025,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        402,\n        859,\n        404,\n        196\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 Vizzie MAPPR\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        410,\n        865,\n        388,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2010\n      ],\n      \"presentation\": [\n        410,\n        865,\n        388,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        500,\n        2040\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2070\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 MAPPR \\u2014 a mapping function per colour plane\",\n      \"pos\": [\n        30,\n        2010\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN14\",\n      \"pos\": [\n        30,\n        2040\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        2120\n      ],\n      \"size\": [\n        388,\n        130\n      ],\n      \"inlets\": 7,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        410,\n        889,\n        388,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.mappr.maxpat\",\n        \"varname\": \"mappr\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red color mapping function | in 2: Set the Green color mapping function | in 3: Set the Blue color mapping function. | in 4: Reset all R values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 5: Reset all G values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 6: Reset all B values to their default state (0. - .49 = off, .50 - 1.0 = reset) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.mappr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the Red color mapping function | in 2: Set the Green color mapping function | in 3: Set the Blue color mapping function. | in 4: Reset all R values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 5: Reset all G values to their default state (0. - .49 = off, .50 - 1.0 = reset) | in 6: Reset all B values to their default state (0. - .49 = off, .50 - 1.0 = reset) | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f14_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX14\",\n      \"pos\": [\n        30,\n        2285\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        410,\n        1025,\n        388,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        814,\n        859,\n        224,\n        213\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 Vizzie PLANEMAPPR\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        822,\n        865,\n        208,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        2010\n      ],\n      \"presentation\": [\n        822,\n        865,\n        208,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1110,\n        2040\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        2070\n      ],\n      \"size\": [\n        76,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 PLANEMAPPR \\u2014 remap the R, G, B, A planes\",\n      \"pos\": [\n        640,\n        2010\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rin\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VIN15\",\n      \"pos\": [\n        640,\n        2040\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        640,\n        2120\n      ],\n      \"size\": [\n        208,\n        130\n      ],\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        822,\n        889,\n        208,\n        130\n      ],\n      \"attrs\": {\n        \"name\": \"vz.planemappr.maxpat\",\n        \"varname\": \"planemappr\",\n        \"comment\": \"in 0: Video input | in 1: Set the plane mapping for the Red plane | in 2: Set the plane mapping for the Green plane | in 3: Set the plane mapping for the Blue plane | in 4: Set the plane mapping for the Alpha plane | out 0: Video output\",\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"box_extras\": {\n        \"name\": \"vz.planemappr.maxpat\",\n        \"comment\": \"in 0: Video input | in 1: Set the plane mapping for the Red plane | in 2: Set the plane mapping for the Green plane | in 3: Set the plane mapping for the Blue plane | in 4: Set the plane mapping for the Alpha plane | out 0: Video output\",\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f15_sout\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VFX15\",\n      \"pos\": [\n        640,\n        2285\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"loads at the module's own settings \\u2014 turn its dials\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        441,\n        20\n      ],\n      \"presentation\": [\n        822,\n        1025,\n        208,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_route\": {\n      \"type\": \"comment\",\n      \"text\": \"ROUTER \\u2014 gate outlet n-1 feeds effect n (outlet 0 = DRY feeds nothing); switch inlet n passes effect n's output, and inlet 1 is the dry source itself\",\n      \"pos\": [\n        30,\n        2385\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2435\n      ],\n      \"size\": [\n        55,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"g_rsrc\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        1150,\n        2435\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 15\",\n      \"pos\": [\n        30,\n        2475\n      ],\n      \"size\": [\n        1158,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 15,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"g_s2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN02\",\n      \"pos\": [\n        110,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s3\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN03\",\n      \"pos\": [\n        190,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s4\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN04\",\n      \"pos\": [\n        270,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s5\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN05\",\n      \"pos\": [\n        350,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s6\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN06\",\n      \"pos\": [\n        430,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s7\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN07\",\n      \"pos\": [\n        510,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s8\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN08\",\n      \"pos\": [\n        590,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s9\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN09\",\n      \"pos\": [\n        670,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s10\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN10\",\n      \"pos\": [\n        750,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s11\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN11\",\n      \"pos\": [\n        830,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s12\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN12\",\n      \"pos\": [\n        910,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s13\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN13\",\n      \"pos\": [\n        990,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s14\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN14\",\n      \"pos\": [\n        1070,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"g_s15\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VIN15\",\n      \"pos\": [\n        1150,\n        2530\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"sw_rsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2605\n      ],\n      \"size\": [\n        55,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        110,\n        2605\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX02\",\n      \"pos\": [\n        190,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX03\",\n      \"pos\": [\n        270,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX04\",\n      \"pos\": [\n        350,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX05\",\n      \"pos\": [\n        430,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX06\",\n      \"pos\": [\n        510,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX07\",\n      \"pos\": [\n        590,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX08\",\n      \"pos\": [\n        670,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX09\",\n      \"pos\": [\n        750,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX10\",\n      \"pos\": [\n        830,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX11\",\n      \"pos\": [\n        910,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX12\",\n      \"pos\": [\n        990,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX13\",\n      \"pos\": [\n        1070,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX14\",\n      \"pos\": [\n        1150,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sw_r15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VFX15\",\n      \"pos\": [\n        1230,\n        2605\n      ],\n      \"size\": [\n        69,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wet_sw\": {\n      \"type\": \"newobj\",\n      \"text\": \"switch 15\",\n      \"pos\": [\n        30,\n        2660\n      ],\n      \"size\": [\n        1238,\n        22\n      ],\n      \"inlets\": 16,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_vwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s VWET\",\n      \"pos\": [\n        30,\n        2715\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 dry (in 0, hot: every source frame redraws) / wet (in 1) crossfade; xfade 0 = dry, 1 = the effect. jit.gl.layer draws it into the jit.pworld\",\n      \"pos\": [\n        30,\n        2775\n      ],\n      \"size\": [\n        800,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"m_rdry\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VSRC\",\n      \"pos\": [\n        30,\n        2815\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_rwet\": {\n      \"type\": \"newobj\",\n      \"text\": \"r VWET\",\n      \"pos\": [\n        110,\n        2815\n      ],\n      \"size\": [\n        62,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf_ui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        230,\n        2815\n      ],\n      \"attrs\": {\n        \"attr\": \"xfade\",\n        \"text_width\": 110.0\n      },\n      \"presentation\": [\n        700,\n        316,\n        300,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"m_xf\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.fx.tr.xfade @xfade 1.\",\n      \"pos\": [\n        30,\n        2865\n      ],\n      \"size\": [\n        195,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"m_layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer @blend_enable 0\",\n      \"pos\": [\n        30,\n        2915\n      ],\n      \"size\": [\n        216,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"pworld\": {\n      \"type\": \"jit.pworld\",\n      \"pos\": [\n        30,\n        2965\n      ],\n      \"size\": [\n        480,\n        270\n      ],\n      \"attrs\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        700,\n        40,\n        480,\n        270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"erase_color\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        380,\n        374\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        396,\n        10,\n        294,\n        374\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_out_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        3275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        696,\n        10,\n        494,\n        374\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop movies on the player; click a clip to play it\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        433,\n        20\n      ],\n      \"presentation\": [\n        20,\n        144,\n        360,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_cam_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"webcam (loads off) \\u2014 on replaces the movie\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        48,\n        170,\n        332,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT \\u2014 click one\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        406,\n        16,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_out_title\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT \\u2014 only the chosen effect runs\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        314,\n        20\n      ],\n      \"presentation\": [\n        706,\n        16,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_xf_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"xfade: 0 = dry source, 1 = the effect (loads 1)\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        407,\n        20\n      ],\n      \"presentation\": [\n        706,\n        342,\n        474,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"pl_lm\",\n      0,\n      \"playlist\",\n      0\n    ],\n    [\n      \"cam_tog\",\n      0,\n      \"cam_t\",\n      0\n    ],\n    [\n      \"cam_t\",\n      1,\n      \"cam_sel\",\n      0\n    ],\n    [\n      \"cam_t\",\n      0,\n      \"cam_plus\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      0,\n      \"cam_open\",\n      0\n    ],\n    [\n      \"cam_sel\",\n      1,\n      \"cam_close\",\n      0\n    ],\n    [\n      \"cam_open\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"cam_close\",\n      0,\n      \"cam_grab\",\n      0\n    ],\n    [\n      \"src_lm\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"cam_plus\",\n      0,\n      \"src_sw\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"src_sw\",\n      1\n    ],\n    [\n      \"cam_grab\",\n      0,\n      \"src_sw\",\n      2\n    ],\n    [\n      \"src_sw\",\n      0,\n      \"s_vsrc\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"lm_hl\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rin\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c1\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c2\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c3\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sout\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rin\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sout\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rin\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sout\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rin\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c2\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sout\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rin\",\n      0,\n      \"f06_bp\",\n      0\n    ],\n    [\n      \"f06_bp\",\n      0,\n      \"f06_sout\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rin\",\n      0,\n      \"f07_bp\",\n      0\n    ],\n    [\n      \"f07_bp\",\n      0,\n      \"f07_sout\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rin\",\n      0,\n      \"f08_bp\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      0,\n      \"f08_sout\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rin\",\n      0,\n      \"f09_bp\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      0,\n      \"f09_sout\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rin\",\n      0,\n      \"f10_bp\",\n      0\n    ],\n    [\n      \"f10_bp\",\n      0,\n      \"f10_sout\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rin\",\n      0,\n      \"f11_bp\",\n      0\n    ],\n    [\n      \"f11_bp\",\n      0,\n      \"f11_sout\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rin\",\n      0,\n      \"f12_bp\",\n      0\n    ],\n    [\n      \"f12_bp\",\n      0,\n      \"f12_sout\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rin\",\n      0,\n      \"f13_bp\",\n      0\n    ],\n    [\n      \"f13_bp\",\n      0,\n      \"f13_sout\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rin\",\n      0,\n      \"f14_bp\",\n      0\n    ],\n    [\n      \"f14_bp\",\n      0,\n      \"f14_sout\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rin\",\n      0,\n      \"f15_bp\",\n      0\n    ],\n    [\n      \"f15_bp\",\n      0,\n      \"f15_sout\",\n      0\n    ],\n    [\n      \"g_rsel\",\n      0,\n      \"gate\",\n      0\n    ],\n    [\n      \"g_rsrc\",\n      0,\n      \"gate\",\n      1\n    ],\n    [\n      \"gate\",\n      1,\n      \"g_s2\",\n      0\n    ],\n    [\n      \"gate\",\n      2,\n      \"g_s3\",\n      0\n    ],\n    [\n      \"gate\",\n      3,\n      \"g_s4\",\n      0\n    ],\n    [\n      \"gate\",\n      4,\n      \"g_s5\",\n      0\n    ],\n    [\n      \"gate\",\n      5,\n      \"g_s6\",\n      0\n    ],\n    [\n      \"gate\",\n      6,\n      \"g_s7\",\n      0\n    ],\n    [\n      \"gate\",\n      7,\n      \"g_s8\",\n      0\n    ],\n    [\n      \"gate\",\n      8,\n      \"g_s9\",\n      0\n    ],\n    [\n      \"gate\",\n      9,\n      \"g_s10\",\n      0\n    ],\n    [\n      \"gate\",\n      10,\n      \"g_s11\",\n      0\n    ],\n    [\n      \"gate\",\n      11,\n      \"g_s12\",\n      0\n    ],\n    [\n      \"gate\",\n      12,\n      \"g_s13\",\n      0\n    ],\n    [\n      \"gate\",\n      13,\n      \"g_s14\",\n      0\n    ],\n    [\n      \"gate\",\n      14,\n      \"g_s15\",\n      0\n    ],\n    [\n      \"sw_rsel\",\n      0,\n      \"wet_sw\",\n      0\n    ],\n    [\n      \"sw_rdry\",\n      0,\n      \"wet_sw\",\n      1\n    ],\n    [\n      \"sw_r2\",\n      0,\n      \"wet_sw\",\n      2\n    ],\n    [\n      \"sw_r3\",\n      0,\n      \"wet_sw\",\n      3\n    ],\n    [\n      \"sw_r4\",\n      0,\n      \"wet_sw\",\n      4\n    ],\n    [\n      \"sw_r5\",\n      0,\n      \"wet_sw\",\n      5\n    ],\n    [\n      \"sw_r6\",\n      0,\n      \"wet_sw\",\n      6\n    ],\n    [\n      \"sw_r7\",\n      0,\n      \"wet_sw\",\n      7\n    ],\n    [\n      \"sw_r8\",\n      0,\n      \"wet_sw\",\n      8\n    ],\n    [\n      \"sw_r9\",\n      0,\n      \"wet_sw\",\n      9\n    ],\n    [\n      \"sw_r10\",\n      0,\n      \"wet_sw\",\n      10\n    ],\n    [\n      \"sw_r11\",\n      0,\n      \"wet_sw\",\n      11\n    ],\n    [\n      \"sw_r12\",\n      0,\n      \"wet_sw\",\n      12\n    ],\n    [\n      \"sw_r13\",\n      0,\n      \"wet_sw\",\n      13\n    ],\n    [\n      \"sw_r14\",\n      0,\n      \"wet_sw\",\n      14\n    ],\n    [\n      \"sw_r15\",\n      0,\n      \"wet_sw\",\n      15\n    ],\n    [\n      \"wet_sw\",\n      0,\n      \"s_vwet\",\n      0\n    ],\n    [\n      \"m_rdry\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_xf_ui\",\n      0,\n      \"m_xf\",\n      0\n    ],\n    [\n      \"m_rwet\",\n      0,\n      \"m_xf\",\n      1\n    ],\n    [\n      \"m_xf\",\n      0,\n      \"m_layer\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-38",
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
            "obj-46",
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
            "obj-49",
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
            "obj-54",
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
            "obj-57",
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
            "obj-57",
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
            "obj-60",
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
            "obj-64",
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
            "obj-64",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-68",
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
            "obj-68",
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
            "obj-68",
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
            "obj-68",
            0
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
            "obj-73",
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
            "obj-77",
            0
          ],
          "source": [
            "obj-76",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-78",
            0
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
            "obj-87",
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
            "obj-87",
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
            "obj-92",
            0
          ],
          "source": [
            "obj-91",
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
            "obj-98",
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
            "obj-101",
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
            "obj-102",
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
            "obj-107",
            0
          ],
          "source": [
            "obj-106",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-108",
            0
          ],
          "source": [
            "obj-107",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-111",
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
            "obj-111",
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
            "obj-122",
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
            "obj-127",
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
            "obj-127",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-131",
            0
          ],
          "source": [
            "obj-130",
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
            "obj-138",
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
            "obj-158",
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
            "obj-167",
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
            "obj-168",
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
            "obj-177",
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
            "obj-177",
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
            "obj-178",
            0
          ],
          "source": [
            "obj-177",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-179",
            0
          ],
          "source": [
            "obj-177",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-180",
            0
          ],
          "source": [
            "obj-177",
            3
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
            "obj-177",
            4
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
            "obj-177",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-183",
            0
          ],
          "source": [
            "obj-177",
            6
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
            "obj-177",
            7
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
            "obj-177",
            8
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
            "obj-177",
            9
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
            "obj-177",
            10
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
            "obj-177",
            11
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
            "obj-177",
            12
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
            "obj-177",
            13
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
            "obj-177",
            14
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
            "obj-192",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-208",
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
            "obj-208",
            2
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
            "obj-208",
            3
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
            "obj-208",
            4
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
            "obj-208",
            5
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
            "obj-208",
            6
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
            "obj-208",
            7
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
            "obj-208",
            8
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
            "obj-208",
            9
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
            "obj-208",
            10
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
            "obj-208",
            11
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
            "obj-208",
            12
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
            "obj-208",
            13
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
            "obj-208",
            14
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
            15
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
            "obj-214",
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
            "obj-214",
            1
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
            "obj-215",
            0
          ],
          "source": [
            "obj-214",
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
