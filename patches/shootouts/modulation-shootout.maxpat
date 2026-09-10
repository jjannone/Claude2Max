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
      1444.0,
      900.0
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
          "text": "MODULATION SHOOTOUT \u2014 phaser, flanger, chorus, vibrato, tremolo and panning effects. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
            560.0,
            20.0
          ],
          "text": "SOURCE \u2014 file player, live input (muted on load) and test signals all sum on the bus"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "playlist~",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "",
            "dictionary"
          ],
          "patching_rect": [
            30.0,
            90.0,
            300.0,
            120.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            40.0,
            300.0,
            200.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "ezadc~",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            360.0,
            210.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            40.0,
            45.0,
            45.0
          ]
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
            460.0,
            210.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            92.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            360.0,
            300.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            430.0,
            300.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            360.0,
            260.0,
            300.0,
            20.0
          ],
          "text": "live-input mute: toggle \u00d7 signal, starts closed"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            700.0,
            90.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            130.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            700.0,
            130.0,
            62.0,
            22.0
          ],
          "text": "click~"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            170.0,
            69.0,
            22.0
          ],
          "text": "s~ TEST"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            860.0,
            90.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            170.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            860.0,
            130.0,
            97.0,
            22.0
          ],
          "text": "0.5, 0. 120"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            780.0,
            130.0,
            62.0,
            22.0
          ],
          "text": "noise~"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            860.0,
            170.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            780.0,
            210.0,
            40.0,
            22.0
          ],
          "text": "*~"
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
            780.0,
            250.0,
            69.0,
            22.0
          ],
          "text": "s~ TEST"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            300.0,
            69.0,
            22.0
          ],
          "text": "r~ TEST"
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
            30.0,
            385.0,
            76.0,
            22.0
          ],
          "text": "s~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            385.0,
            76.0,
            22.0
          ],
          "text": "s~ SRC_R"
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
            620.0,
            300.0,
            420.0,
            20.0
          ],
          "text": "mono downmix for the mono-input effects (signals sum at the *~ inlet)"
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
            620.0,
            330.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            330.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            620.0,
            385.0,
            62.0,
            22.0
          ],
          "text": "*~ 0.5"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            620.0,
            425.0,
            76.0,
            22.0
          ],
          "text": "s~ SRC_M"
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
            1120.0,
            36.0,
            460.0,
            47.0
          ],
          "text": "EFFECT SELECT \u2014 live.tab, one column of 20, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1600.0,
            36.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-28",
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
            340.0,
            150.0
          ],
          "presentation": 1,
          "presentation_rect": [
            630.0,
            40.0,
            340.0,
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
                "2 abl phaser~",
                "3 abl flanger~",
                "4 abl chorus~",
                "5 abl ensemble~",
                "6 abl vibrato~",
                "7 abl doubler~",
                "8 BEAP Chorus",
                "9 BEAP Flanger",
                "10 amxd Chorus x2",
                "11 amxd Flange-o-tron",
                "12 amxd Swirl",
                "13 amxd Vibrato Cauldron",
                "14 amxd Tremellow",
                "15 amxd Pitch & Vibrato",
                "16 amxd Audio Rate Pan",
                "17 amxd DopplerPan",
                "18 amxd Warpoon",
                "19 amxd Nebula",
                "20 amxd Pendulum"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 19,
              "parameter_modmode": 0,
              "parameter_shortname": "FX",
              "parameter_type": 2,
              "parameter_unitstyle": 9
            }
          },
          "varname": "FX_TAB"
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
            1500.0,
            8.0,
            76.0,
            22.0
          ],
          "text": "r TABSEL"
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
            1590.0,
            8.0,
            520.0,
            20.0
          ],
          "text": "r TABSEL: the transparent button over each pane title sends its tab index here"
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
            1140.0,
            330.0,
            293.0,
            22.0
          ],
          "text": "v8 fx-shootout-highlight.js 20 @embed 1",
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
          "id": "obj-32",
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
          "id": "obj-33",
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
          "id": "obj-34",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1640.0,
            66.0,
            560.0,
            20.0
          ],
          "text": "WET-ONLY \u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1640.0,
            100.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1640.0,
            140.0,
            83.0,
            22.0
          ],
          "text": "delay 500"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1640.0,
            180.0,
            83.0,
            22.0
          ],
          "text": "s WETONLY"
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
            1760.0,
            140.0,
            76.0,
            22.0
          ],
          "text": "wet-only",
          "presentation": 1,
          "presentation_rect": [
            980.0,
            200.0,
            90.0,
            22.0
          ],
          "fontname": "Monaco",
          "fontsize": 11.0,
          "bgcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "textcolor": [
            0.05,
            0.05,
            0.05,
            1.0
          ]
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
            1760.0,
            180.0,
            83.0,
            22.0
          ],
          "text": "s WETONLY"
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
            2000.0,
            230.0,
            500.0,
            20.0
          ],
          "text": "TRANSPORT \u2014 the global transport; followed by: Flange-o-tron, DopplerPan"
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
            2000.0,
            260.0,
            111.0,
            22.0
          ],
          "text": "loadmess 120."
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            2000.0,
            290.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1110.0,
            262.0,
            54.0,
            22.0
          ],
          "minimum": 20.0,
          "maximum": 300.0
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
            2000.0,
            320.0,
            76.0,
            22.0
          ],
          "text": "tempo $1"
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            2120.0,
            290.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            980.0,
            262.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 9,
          "outlettype": [
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
            2000.0,
            360.0,
            83.0,
            22.0
          ],
          "text": "transport"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            60.0,
            322.0,
            20.0
          ],
          "text": "TRANSPORT \u2014 Flange-o-tron, DopplerPan",
          "presentation": 1,
          "presentation_rect": [
            980.0,
            240.0,
            300.0,
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
          "id": "obj-47",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            86.0,
            110.0,
            20.0
          ],
          "text": "start / stop",
          "presentation": 1,
          "presentation_rect": [
            1010.0,
            264.0,
            90.0,
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
          "id": "obj-48",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            40.0,
            20.0
          ],
          "text": "bpm",
          "presentation": 1,
          "presentation_rect": [
            1170.0,
            264.0,
            50.0,
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
          "id": "obj-50",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            138.0,
            135.0,
            20.0
          ],
          "text": "2 \u00b7 abl phaser~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            508.0,
            160.0,
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
          "id": "obj-51",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            620.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            508.0,
            160.0,
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
          "id": "obj-52",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            620.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "1"
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
            620.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            520.0,
            580.0,
            20.0
          ],
          "text": "2 \u00b7 abl.dsp.phaser~ \u2014 Live's Phaser (ableton-dsp package)"
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
            30.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            828.0,
            181.0,
            22.0
          ],
          "text": "abl.dsp.phaser~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            726.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
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
            160.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
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
            180.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod_freq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "notches",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            220.0,
            668.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "center",
          "text_width": 82.0
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
            240.0,
            694.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "spread",
          "text_width": 82.0
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
            260.0,
            720.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            280.0,
            746.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            676.0,
            160.0,
            22.0
          ],
          "attr": "blend",
          "text_width": 82.0
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
            300.0,
            772.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            700.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
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
            120.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            490.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            490.0,
            580.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            2520.0,
            164.0,
            144.0,
            20.0
          ],
          "text": "3 \u00b7 abl flanger~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            508.0,
            160.0,
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
          "id": "obj-72",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1350.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            508.0,
            160.0,
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
          "id": "obj-73",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1350.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
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
            1350.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            760.0,
            520.0,
            580.0,
            20.0
          ],
          "text": "3 \u00b7 abl.dsp.flanger~ \u2014 Live's Flanger"
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            840.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            760.0,
            828.0,
            188.0,
            22.0
          ],
          "text": "abl.dsp.flanger~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            726.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            890.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
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
            910.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod_freq",
          "text_width": 82.0
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
            930.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "time",
          "text_width": 82.0
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
            950.0,
            668.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            970.0,
            694.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "envelope",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            720.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "env_amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            746.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            676.0,
            160.0,
            22.0
          ],
          "attr": "waveform",
          "text_width": 82.0
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
            1030.0,
            772.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            700.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-87",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
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
            850.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
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
            1220.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1220.0,
            580.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            190.0,
            135.0,
            20.0
          ],
          "text": "4 \u00b7 abl chorus~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            508.0,
            160.0,
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
          "id": "obj-93",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2040.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            508.0,
            160.0,
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
            2040.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
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
            2040.0,
            580.0,
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
            1490.0,
            520.0,
            540.0,
            20.0
          ],
          "text": "4 \u00b7 abl.dsp.chorus~ \u2014 Live's Chorus-Ensemble, chorus mode"
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
            1490.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1570.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-99",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1490.0,
            776.0,
            181.0,
            22.0
          ],
          "text": "abl.dsp.chorus~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            678.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
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
            1620.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "rate",
          "text_width": 82.0
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
            1640.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
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
            1660.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            1680.0,
            668.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "width",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1700.0,
            694.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "warmth",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-105",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            720.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1490.0,
            821.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1580.0,
            821.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            1910.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1910.0,
            580.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            216.0,
            152.0,
            20.0
          ],
          "text": "5 \u00b7 abl ensemble~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            508.0,
            160.0,
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
          "id": "obj-112",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            600.0,
            973.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            508.0,
            160.0,
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
          "id": "obj-113",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            600.0,
            1003.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            600.0,
            1033.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            973.0,
            560.0,
            20.0
          ],
          "text": "5 \u00b7 abl.dsp.ensemble~ \u2014 Live's Chorus-Ensemble, ensemble mode"
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-117",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            1255.0,
            195.0,
            22.0
          ],
          "text": "abl.dsp.ensemble~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            702.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            1043.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "rate",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-120",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            1069.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            1095.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            220.0,
            1121.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "shaping",
          "text_width": 82.0
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
            240.0,
            1147.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "width",
          "text_width": 82.0
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
            260.0,
            1173.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "warmth",
          "text_width": 82.0
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
            280.0,
            1199.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            676.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1300.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
        }
      },
      {
        "box": {
          "id": "obj-127",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            1300.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
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
            470.0,
            1003.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            470.0,
            1033.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            2520.0,
            242.0,
            144.0,
            20.0
          ],
          "text": "6 \u00b7 abl vibrato~",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            508.0,
            160.0,
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
          "id": "obj-132",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1290.0,
            973.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            508.0,
            160.0,
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
          "id": "obj-133",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            1003.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-134",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1290.0,
            1033.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            740.0,
            973.0,
            540.0,
            20.0
          ],
          "text": "6 \u00b7 abl.dsp.vibrato~ \u2014 Live's Chorus-Ensemble, vibrato mode"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            740.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            820.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            740.0,
            1229.0,
            188.0,
            22.0
          ],
          "text": "abl.dsp.vibrato~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            678.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
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
            870.0,
            1043.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "rate",
          "text_width": 82.0
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
            890.0,
            1069.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            1095.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "offset",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-142",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            1121.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-143",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            950.0,
            1147.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "width",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-144",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            970.0,
            1173.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            740.0,
            1274.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            1274.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
        }
      },
      {
        "box": {
          "id": "obj-147",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1160.0,
            1003.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1160.0,
            1033.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            268.0,
            144.0,
            20.0
          ],
          "text": "7 \u00b7 abl doubler~",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            508.0,
            160.0,
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
          "id": "obj-151",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1980.0,
            973.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            508.0,
            160.0,
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
            1980.0,
            1003.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            1980.0,
            1033.0,
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
            1430.0,
            973.0,
            540.0,
            20.0
          ],
          "text": "7 \u00b7 abl.dsp.doubler~ \u2014 Live's Doubler (short modulated delay)"
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
            1430.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1510.0,
            1003.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1430.0,
            1229.0,
            188.0,
            22.0
          ],
          "text": "abl.dsp.doubler~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            678.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
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
            1560.0,
            1043.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            532.0,
            160.0,
            22.0
          ],
          "attr": "mod",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-159",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1580.0,
            1069.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            556.0,
            160.0,
            22.0
          ],
          "attr": "mod_freq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1600.0,
            1095.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            580.0,
            160.0,
            22.0
          ],
          "attr": "time",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1620.0,
            1121.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            604.0,
            160.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-162",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1640.0,
            1147.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            628.0,
            160.0,
            22.0
          ],
          "attr": "lfo_blend",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-163",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1660.0,
            1173.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            652.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            1430.0,
            1274.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            1520.0,
            1274.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1850.0,
            1003.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1850.0,
            1033.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            294.0,
            135.0,
            20.0
          ],
          "text": "8 \u00b7 BEAP Chorus",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            508.0,
            187.0,
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
          "id": "obj-170",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            416.0,
            1400.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            508.0,
            187.0,
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
            416.0,
            1430.0,
            40.0,
            22.0
          ],
          "text": "7"
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
            416.0,
            1460.0,
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
            30.0,
            1400.0,
            376.0,
            20.0
          ],
          "text": "8 \u00b7 bp.Chorus \u2014 BEAP module, mono in / stereo out"
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
            30.0,
            1430.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "bpatcher",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1470.0,
            187.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            532.0,
            187.0,
            116.0
          ],
          "varname": "FX_CHORUS",
          "comment": "in 0: signal | out 0: signal | out 1: signal",
          "bgmode": 0,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 8,
              "minor": 0,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              126.0,
              282.0,
              803.0,
              544.0
            ],
            "bglocked": 1,
            "openinpresentation": 1,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 1,
            "gridsize": [
              15.0,
              15.0
            ],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 2,
            "toolbarvisible": 1,
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0,
            "boxanimatetime": 200,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "boxes": [
              {
                "box": {
                  "id": "obj-16",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    51.642456,
                    83.0,
                    118.0,
                    18.0
                  ],
                  "text": "## Chorus effect ## "
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-34",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "signal"
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 8,
                      "minor": 0,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "dsp.gen",
                    "rect": [
                      262.0,
                      79.0,
                      706.0,
                      488.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 1,
                    "gridsize": [
                      15.0,
                      15.0
                    ],
                    "gridsnaponopen": 1,
                    "objectsnaponopen": 1,
                    "statusbarvisible": 2,
                    "toolbarvisible": 1,
                    "lefttoolbarpinned": 0,
                    "toptoolbarpinned": 0,
                    "righttoolbarpinned": 0,
                    "bottomtoolbarpinned": 0,
                    "toolbars_unpinned_last_save": 0,
                    "tallnewobj": 0,
                    "boxanimatetime": 200,
                    "enablehscroll": 1,
                    "enablevscroll": 1,
                    "devicewidth": 0.0,
                    "description": "",
                    "digest": "",
                    "tags": "",
                    "style": "",
                    "subpatcher_template": "",
                    "boxes": [
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
                            419.0,
                            247.0,
                            79.0,
                            22.0
                          ],
                          "text": "constant 400"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            385.0,
                            291.0,
                            40.0,
                            22.0
                          ],
                          "text": "slide"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            167.0,
                            321.0,
                            29.0,
                            22.0
                          ],
                          "text": "* -1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-12",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            119.0,
                            42.0,
                            22.0
                          ],
                          "text": "* 1.31"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            352.0,
                            151.0,
                            80.0,
                            22.0
                          ],
                          "text": "param bw 20"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            180.5,
                            50.0,
                            78.0,
                            22.0
                          ],
                          "text": "param fb 0.5"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-16",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            167.0,
                            291.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            352.0,
                            203.0,
                            105.0,
                            22.0
                          ],
                          "text": "param center 127"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            80.0,
                            79.0,
                            22.0
                          ],
                          "text": "param rate 8"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            193.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            241.0,
                            32.5,
                            22.0
                          ],
                          "text": "+"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            151.0,
                            38.0,
                            22.0
                          ],
                          "text": "cycle"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            193.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            241.0,
                            32.5,
                            22.0
                          ],
                          "text": "+"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            151.0,
                            38.0,
                            22.0
                          ],
                          "text": "cycle"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            208.0,
                            398.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            208.0,
                            291.0,
                            86.0,
                            22.0
                          ],
                          "text": "delay 44100 2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            274.0,
                            398.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            58.0,
                            203.0,
                            30.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-2",
                            0
                          ],
                          "midpoints": [
                            67.5,
                            366.0,
                            283.5,
                            366.0
                          ],
                          "order": 0,
                          "source": [
                            "obj-1",
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
                          "midpoints": [
                            67.5,
                            250.5,
                            217.5,
                            250.5
                          ],
                          "order": 2,
                          "source": [
                            "obj-1",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-4",
                            0
                          ],
                          "midpoints": [
                            67.5,
                            378.0,
                            217.5,
                            378.0
                          ],
                          "order": 1,
                          "source": [
                            "obj-1",
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
                            "obj-10",
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
                          "order": 0,
                          "source": [
                            "obj-11",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-5",
                            0
                          ],
                          "order": 1,
                          "source": [
                            "obj-11",
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
                            "obj-13",
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
                            "obj-6",
                            1
                          ],
                          "order": 1,
                          "source": [
                            "obj-15",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-9",
                            1
                          ],
                          "order": 0,
                          "source": [
                            "obj-15",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-13",
                            0
                          ],
                          "source": [
                            "obj-16",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-16",
                            1
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
                            "obj-7",
                            1
                          ],
                          "order": 1,
                          "source": [
                            "obj-18",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-8",
                            1
                          ],
                          "order": 0,
                          "source": [
                            "obj-18",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-15",
                            2
                          ],
                          "order": 0,
                          "source": [
                            "obj-19",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-15",
                            1
                          ],
                          "order": 1,
                          "source": [
                            "obj-19",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-16",
                            0
                          ],
                          "order": 1,
                          "source": [
                            "obj-3",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-2",
                            0
                          ],
                          "source": [
                            "obj-3",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-4",
                            0
                          ],
                          "order": 0,
                          "source": [
                            "obj-3",
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
                            "obj-5",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-3",
                            1
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
                            "obj-6",
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
                            "obj-8",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-3",
                            2
                          ],
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ],
                    "bgcolor": [
                      0.9,
                      0.9,
                      0.9,
                      1.0
                    ],
                    "editing_bgcolor": [
                      0.9,
                      0.9,
                      0.9,
                      1.0
                    ]
                  },
                  "patching_rect": [
                    302.0,
                    225.791412,
                    150.0,
                    20.0
                  ],
                  "text": "gen~"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-33",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    452.0,
                    480.661774,
                    19.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    164.75,
                    97.0,
                    19.0,
                    17.0
                  ],
                  "text": "R",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "textjustification": 2
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-32",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    433.0,
                    279.907501,
                    32.5,
                    20.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-31",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    302.0,
                    279.907501,
                    32.5,
                    20.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    302.0,
                    135.377502,
                    42.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-26",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    412.236206,
                    434.661774,
                    204.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-27",
                  "index": 2,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    412.236206,
                    480.661774,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-20",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    141.236206,
                    379.661774,
                    32.5,
                    20.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    141.236206,
                    434.661774,
                    204.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.572549,
                    0.615686,
                    0.658824,
                    0.0
                  ],
                  "activebgoncolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.57
                  ],
                  "activetextoncolor": [
                    0.0,
                    0.019608,
                    0.078431,
                    1.0
                  ],
                  "bgcolor": [
                    0.101961,
                    0.101961,
                    0.101961,
                    0.78
                  ],
                  "bordercolor": [
                    0.0,
                    0.019608,
                    0.078431,
                    0.37
                  ],
                  "id": "obj-23",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    141.236206,
                    334.599274,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    130.0,
                    19.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_defer": 1,
                      "parameter_type": 2,
                      "parameter_longname": "bypass[1]",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "bypass"
                    }
                  },
                  "text": "bypass",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "texton": "bypass",
                  "varname": "bypass"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-24",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    141.236206,
                    480.661774,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-25",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    225.236206,
                    49.907501,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    543.0,
                    168.907501,
                    65.0,
                    20.0
                  ],
                  "text": "center $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    620.0,
                    168.907501,
                    43.0,
                    20.0
                  ],
                  "text": "bw $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-7",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    685.0,
                    168.907501,
                    50.0,
                    20.0
                  ],
                  "text": "rate $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    753.0,
                    168.907501,
                    37.0,
                    20.0
                  ],
                  "text": "fb $1"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-3",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    753.0,
                    98.377502,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    136.75,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_longname": "Regen[1]",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.8
                      ],
                      "parameter_shortname": "Regen"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Regen"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-2",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    685.0,
                    98.377502,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    91.5,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 4.0,
                      "parameter_longname": "Rate",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 10.0,
                      "parameter_initial": [
                        2
                      ],
                      "parameter_shortname": "Rate"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Rate"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-1",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    620.0,
                    98.377502,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    46.25,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_exponent": 4.0,
                      "parameter_longname": "Depth",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 20000.0,
                      "parameter_initial": [
                        150
                      ],
                      "parameter_shortname": "Depth",
                      "parameter_type": 0,
                      "parameter_unitstyle": 0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Width"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
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
                    51.642456,
                    139.0,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "Center": [
                      500.0
                    ],
                    "Rate": [
                      2.0
                    ],
                    "Regen": [
                      0.5
                    ],
                    "Width": [
                      20.000000000000004
                    ],
                    "bypass": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u356007917"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    178.099976,
                    480.661774,
                    19.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    97.0,
                    19.0,
                    17.0
                  ],
                  "text": "L",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-28",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    543.0,
                    98.377502,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    1.0,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_exponent": 2.0,
                      "parameter_longname": "Center",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 2000.0,
                      "parameter_initial": [
                        500
                      ],
                      "parameter_shortname": "Center",
                      "parameter_type": 0,
                      "parameter_unitstyle": 0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Center"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    262.5,
                    49.907501,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    0.0,
                    32.0,
                    17.0
                  ],
                  "text": "Input",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-13",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    51.642456,
                    49.907501,
                    48.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    19.0,
                    54.0,
                    17.0
                  ],
                  "text": "CHORUS",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.137255,
                    0.145098,
                    0.160784,
                    0.65
                  ],
                  "id": "obj-130",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    51.642456,
                    37.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    37.0,
                    425.0,
                    60.338157653808594
                  ],
                  "proportion": 0.39,
                  "rounded": 0
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.367404,
                    0.389405,
                    0.430238,
                    1.0
                  ],
                  "id": "obj-131",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    95.979645,
                    37.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    17.0,
                    425.0,
                    80.3381576538086
                  ],
                  "proportion": 0.39,
                  "rounded": 0
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-135",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    138.721741,
                    37.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    0.0,
                    425.0,
                    133.0
                  ],
                  "proportion": 0.39,
                  "rounded": 0
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
                    "obj-1",
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
                    "obj-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-22",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-20",
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
                  "order": 0,
                  "source": [
                    "obj-20",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-24",
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
                    "obj-20",
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
                    "obj-22",
                    2
                  ],
                  "midpoints": [
                    234.736206,
                    388.784637,
                    335.73620600000004,
                    388.784637
                  ],
                  "order": 1,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-26",
                    2
                  ],
                  "midpoints": [
                    234.736206,
                    388.784637,
                    606.736206,
                    388.784637
                  ],
                  "order": 0,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-30",
                    0
                  ],
                  "order": 2,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-27",
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
                    "obj-5",
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
                    "obj-9",
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
                    "obj-34",
                    0
                  ],
                  "source": [
                    "obj-30",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-22",
                    1
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
                    "obj-26",
                    1
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
                    "obj-31",
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
                    "obj-34",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-34",
                    0
                  ],
                  "midpoints": [
                    629.5,
                    201.907501,
                    311.5,
                    201.907501
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
                    "obj-34",
                    0
                  ],
                  "midpoints": [
                    552.5,
                    201.907501,
                    311.5,
                    201.907501
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
                    "obj-34",
                    0
                  ],
                  "midpoints": [
                    694.5,
                    201.907501,
                    311.5,
                    201.907501
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
                    "obj-34",
                    0
                  ],
                  "midpoints": [
                    762.5,
                    201.907501,
                    311.5,
                    201.907501
                  ],
                  "source": [
                    "obj-9",
                    0
                  ]
                }
              }
            ],
            "bgcolor": [
              1.0,
              1.0,
              1.0,
              0.0
            ]
          },
          "embed": 1
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
            30.0,
            1621.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
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
            157.0,
            1621.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
        }
      },
      {
        "box": {
          "id": "obj-178",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            320.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            654.0,
            187.0,
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
          "id": "obj-180",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            346.0,
            144.0,
            20.0
          ],
          "text": "9 \u00b7 BEAP Flanger",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            789.0,
            190.0,
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
          "id": "obj-181",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            950.0,
            1400.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            789.0,
            190.0,
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
          "id": "obj-182",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            950.0,
            1430.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            950.0,
            1460.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            556.0,
            1400.0,
            384.0,
            20.0
          ],
          "text": "9 \u00b7 bp.Flanger \u2014 BEAP module, mono in / stereo out"
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
            556.0,
            1430.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-186",
          "maxclass": "bpatcher",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            556.0,
            1470.0,
            190.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            813.0,
            190.0,
            116.0
          ],
          "varname": "FX_FLANGER",
          "comment": "in 0: signal | out 0: signal | out 1: signal",
          "bgmode": 0,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "offset": [
            0.0,
            0.0
          ],
          "viewvisibility": 1,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 8,
              "minor": 0,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              445.0,
              282.0,
              685.0,
              720.0
            ],
            "bglocked": 0,
            "openinpresentation": 1,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 1,
            "gridsize": [
              15.0,
              15.0
            ],
            "gridsnaponopen": 1,
            "objectsnaponopen": 1,
            "statusbarvisible": 1,
            "toolbarvisible": 1,
            "lefttoolbarpinned": 0,
            "toptoolbarpinned": 0,
            "righttoolbarpinned": 0,
            "bottomtoolbarpinned": 0,
            "toolbars_unpinned_last_save": 0,
            "tallnewobj": 0,
            "boxanimatetime": 200,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "boxes": [
              {
                "box": {
                  "id": "obj-12",
                  "linecount": 3,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    55.455986,
                    94.0,
                    220.0,
                    42.0
                  ],
                  "text": "## Combines a modulated time-delayed version of the input signal to produce a swept comb filter effect ##"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-33",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    475.236206,
                    659.754272,
                    19.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    168.75,
                    97.0,
                    19.0,
                    17.0
                  ],
                  "text": "R",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "textjustification": 2
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-32",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    640.0,
                    331.0,
                    32.5,
                    20.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-31",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    511.0,
                    331.0,
                    32.5,
                    20.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    505.0,
                    176.470001,
                    42.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-26",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    446.236206,
                    609.754272,
                    204.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-27",
                  "index": 2,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    446.236206,
                    655.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-20",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    175.236206,
                    554.754272,
                    32.5,
                    20.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    175.236206,
                    609.754272,
                    204.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.572549,
                    0.615686,
                    0.658824,
                    0.0
                  ],
                  "activebgoncolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.57
                  ],
                  "activetextoncolor": [
                    0.0,
                    0.019608,
                    0.078431,
                    1.0
                  ],
                  "bgcolor": [
                    0.101961,
                    0.101961,
                    0.101961,
                    0.78
                  ],
                  "bordercolor": [
                    0.0,
                    0.019608,
                    0.078431,
                    0.37
                  ],
                  "id": "obj-23",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    175.236206,
                    509.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    132.0,
                    19.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_defer": 1,
                      "parameter_type": 2,
                      "parameter_longname": "bypass",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "bypass"
                    }
                  },
                  "text": "bypass",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "texton": "bypass",
                  "varname": "bypass"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-24",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    175.236206,
                    655.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-25",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    469.236206,
                    134.883911,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    752.0,
                    220.0,
                    65.0,
                    20.0
                  ],
                  "text": "center $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    829.0,
                    220.0,
                    43.0,
                    20.0
                  ],
                  "text": "bw $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-7",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    894.0,
                    220.0,
                    50.0,
                    20.0
                  ],
                  "text": "rate $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    962.0,
                    220.0,
                    37.0,
                    20.0
                  ],
                  "text": "fb $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "signal"
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 8,
                      "minor": 0,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "dsp.gen",
                    "rect": [
                      34.0,
                      34.0,
                      498.0,
                      483.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 1,
                    "gridsize": [
                      15.0,
                      15.0
                    ],
                    "gridsnaponopen": 1,
                    "objectsnaponopen": 1,
                    "statusbarvisible": 2,
                    "toolbarvisible": 1,
                    "lefttoolbarpinned": 0,
                    "toptoolbarpinned": 0,
                    "righttoolbarpinned": 0,
                    "bottomtoolbarpinned": 0,
                    "toolbars_unpinned_last_save": 0,
                    "tallnewobj": 0,
                    "boxanimatetime": 200,
                    "enablehscroll": 1,
                    "enablevscroll": 1,
                    "devicewidth": 0.0,
                    "description": "",
                    "digest": "",
                    "tags": "",
                    "style": "",
                    "subpatcher_template": "",
                    "boxes": [
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            352.0,
                            190.0,
                            87.0,
                            22.0
                          ],
                          "text": "param bw 150"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            180.5,
                            89.0,
                            78.0,
                            22.0
                          ],
                          "text": "param fb 0.8"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-16",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            167.0,
                            330.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            352.0,
                            242.0,
                            105.0,
                            22.0
                          ],
                          "text": "param center 500"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            162.0,
                            42.0,
                            22.0
                          ],
                          "text": "* 1.31"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            124.0,
                            89.0,
                            22.0
                          ],
                          "text": "param rate 0.1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            232.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            280.0,
                            32.5,
                            22.0
                          ],
                          "text": "+"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            286.0,
                            190.0,
                            38.0,
                            22.0
                          ],
                          "text": "cycle"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            232.0,
                            32.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            280.0,
                            32.5,
                            22.0
                          ],
                          "text": "+"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            238.0,
                            190.0,
                            38.0,
                            22.0
                          ],
                          "text": "cycle"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            208.0,
                            398.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            208.0,
                            330.0,
                            79.0,
                            22.0
                          ],
                          "text": "delay 4410 2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            268.0,
                            398.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            58.0,
                            272.0,
                            30.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-2",
                            0
                          ],
                          "midpoints": [
                            67.5,
                            366.0,
                            277.5,
                            366.0
                          ],
                          "order": 0,
                          "source": [
                            "obj-1",
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
                          "midpoints": [
                            67.5,
                            306.5,
                            217.5,
                            306.5
                          ],
                          "order": 2,
                          "source": [
                            "obj-1",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-4",
                            0
                          ],
                          "midpoints": [
                            67.5,
                            378.0,
                            217.5,
                            378.0
                          ],
                          "order": 1,
                          "source": [
                            "obj-1",
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
                            "obj-10",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-13",
                            0
                          ],
                          "order": 0,
                          "source": [
                            "obj-11",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-5",
                            0
                          ],
                          "order": 1,
                          "source": [
                            "obj-11",
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
                            "obj-13",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-6",
                            1
                          ],
                          "order": 1,
                          "source": [
                            "obj-14",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-9",
                            1
                          ],
                          "order": 0,
                          "source": [
                            "obj-14",
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
                            "obj-16",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-16",
                            1
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
                            "obj-7",
                            1
                          ],
                          "order": 1,
                          "source": [
                            "obj-18",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-8",
                            1
                          ],
                          "order": 0,
                          "source": [
                            "obj-18",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-16",
                            0
                          ],
                          "order": 1,
                          "source": [
                            "obj-3",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-2",
                            0
                          ],
                          "source": [
                            "obj-3",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-4",
                            0
                          ],
                          "order": 0,
                          "source": [
                            "obj-3",
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
                            "obj-5",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-3",
                            1
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
                            "obj-6",
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
                            "obj-8",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-3",
                            2
                          ],
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ],
                    "bgcolor": [
                      0.9,
                      0.9,
                      0.9,
                      1.0
                    ],
                    "editing_bgcolor": [
                      0.9,
                      0.9,
                      0.9,
                      1.0
                    ]
                  },
                  "patching_rect": [
                    511.0,
                    269.0,
                    150.0,
                    20.0
                  ],
                  "text": "gen~"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-3",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    962.0,
                    149.470001,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    138.75,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_longname": "Regen",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.8
                      ],
                      "parameter_shortname": "Regen"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Regen"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-2",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    894.0,
                    149.470001,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    93.5,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 4.0,
                      "parameter_longname": "Rate",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 10.0,
                      "parameter_initial": [
                        0.4
                      ],
                      "parameter_shortname": "Rate"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Rate"
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-1",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    829.0,
                    149.470001,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    48.25,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 4.0,
                      "parameter_longname": "Width",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 20000.0,
                      "parameter_initial": [
                        150
                      ],
                      "parameter_shortname": "Width"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Width"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
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
                    55.455986,
                    176.470001,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "Center": [
                      500.0
                    ],
                    "Rate": [
                      0.0
                    ],
                    "Regen": [
                      0.700787
                    ],
                    "Width": [
                      150.00000000000006
                    ],
                    "bypass": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u097009929"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    215.736206,
                    659.754272,
                    19.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    97.0,
                    19.0,
                    17.0
                  ],
                  "text": "L",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "activedialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activefgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "activeneedlecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "id": "obj-28",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    752.0,
                    149.470001,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    3.0,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 2.0,
                      "parameter_longname": "Center",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 2000.0,
                      "parameter_initial": [
                        500
                      ],
                      "parameter_shortname": "Center"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Center"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    505.0,
                    138.883911,
                    32.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
                    32.0,
                    17.0
                  ],
                  "text": "Input",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-13",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    55.455986,
                    71.907471,
                    54.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    54.0,
                    17.0
                  ],
                  "text": "FLANGER",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.137255,
                    0.145098,
                    0.160784,
                    0.65
                  ],
                  "id": "obj-130",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    55.455986,
                    41.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    -0.5,
                    37.0,
                    425.0,
                    60.338157653808594
                  ],
                  "proportion": 0.39,
                  "rounded": 0
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.367404,
                    0.389405,
                    0.430238,
                    1.0
                  ],
                  "id": "obj-131",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    101.657448,
                    41.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    -0.5,
                    17.0,
                    425.0,
                    80.3381576538086
                  ],
                  "proportion": 0.39,
                  "rounded": 0
                }
              },
              {
                "box": {
                  "angle": 0.0,
                  "background": 1,
                  "bgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-135",
                  "maxclass": "panel",
                  "mode": 0,
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    147.858902,
                    41.711639,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    -0.5,
                    0.0,
                    425.0,
                    133.0
                  ],
                  "proportion": 0.39,
                  "rounded": 0
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
                    "obj-1",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-31",
                    0
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
                    "obj-32",
                    0
                  ],
                  "source": [
                    "obj-10",
                    1
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
                    "obj-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-22",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-20",
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
                  "order": 0,
                  "source": [
                    "obj-20",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-24",
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
                    "obj-20",
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
                    "obj-22",
                    2
                  ],
                  "order": 2,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-26",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-30",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-27",
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
                    "obj-5",
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
                    "obj-9",
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
                    "obj-10",
                    0
                  ],
                  "source": [
                    "obj-30",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-22",
                    1
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
                    "obj-26",
                    1
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
                    "obj-10",
                    0
                  ],
                  "midpoints": [
                    838.5,
                    253.0,
                    520.5,
                    253.0
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
                    "obj-10",
                    0
                  ],
                  "midpoints": [
                    761.5,
                    253.0,
                    520.5,
                    253.0
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
                    "obj-10",
                    0
                  ],
                  "midpoints": [
                    903.5,
                    253.0,
                    520.5,
                    253.0
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
                    "obj-10",
                    0
                  ],
                  "midpoints": [
                    971.5,
                    253.0,
                    520.5,
                    253.0
                  ],
                  "source": [
                    "obj-9",
                    0
                  ]
                }
              }
            ],
            "bgcolor": [
              1.0,
              1.0,
              1.0,
              0.0
            ]
          },
          "embed": 1
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
            556.0,
            1621.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
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
            686.0,
            1621.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
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
            372.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            935.0,
            190.0,
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
          "id": "obj-191",
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
          "text": "10 \u00b7 amxd Chorus x2",
          "presentation": 1,
          "presentation_rect": [
            232.0,
            789.0,
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
          "varname": "TITLE_10"
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
            1599.0,
            1400.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            232.0,
            789.0,
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
          "id": "obj-193",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1599.0,
            1430.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1599.0,
            1460.0,
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
            1090.0,
            1400.0,
            499.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Chorus x2.amxd \u2014 two-band chorus (Max for Live package)"
        }
      },
      {
        "box": {
          "id": "obj-196",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1090.0,
            1430.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            610.0,
            789.0,
            50.0,
            22.0
          ]
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
            1160.0,
            1430.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1240.0,
            1430.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-199",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            1090.0,
            1510.0,
            424.0,
            196.0
          ],
          "text": "amxd~ \"Chorus x2.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            232.0,
            815.0,
            424.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_10"
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
            1390.0,
            1430.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1390.0,
            1470.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            1090.0,
            1741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1230.0,
            1741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            424.0,
            203.0,
            20.0
          ],
          "text": "11 \u00b7 amxd Flange-o-tron",
          "presentation": 1,
          "presentation_rect": [
            684.0,
            789.0,
            347.0,
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
          "id": "obj-206",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            560.0,
            1841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            684.0,
            789.0,
            347.0,
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
          "id": "obj-207",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            560.0,
            1871.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            560.0,
            1901.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-209",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1841.0,
            520.0,
            20.0
          ],
          "text": "11 \u00b7 amxd~ Flange-o-tron.amxd \u2014 flanger driven by two step sequencers"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1041.0,
            789.0,
            50.0,
            22.0
          ]
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
            100.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-213",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1951.0,
            403.0,
            196.0
          ],
          "text": "amxd~ Flange-o-tron.amxd",
          "presentation": 1,
          "presentation_rect": [
            684.0,
            815.0,
            403.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_11"
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
            330.0,
            1871.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            330.0,
            1911.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            30.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
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
            450.0,
            135.0,
            20.0
          ],
          "text": "12 \u00b7 amxd Swirl",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1041.0,
            252.0,
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
          "id": "obj-220",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1170.0,
            1841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1041.0,
            252.0,
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
          "id": "obj-221",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1170.0,
            1871.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-222",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1170.0,
            1901.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            700.0,
            1841.0,
            460.0,
            20.0
          ],
          "text": "12 \u00b7 amxd~ Swirl.amxd \u2014 mono-to-stereo delay-time modulation"
        }
      },
      {
        "box": {
          "id": "obj-224",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            1871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            280.0,
            1041.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-225",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            770.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            850.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            700.0,
            1951.0,
            308.0,
            196.0
          ],
          "text": "amxd~ Swirl.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1067.0,
            308.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_12"
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
            1000.0,
            1871.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1000.0,
            1911.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
        }
      },
      {
        "box": {
          "id": "obj-230",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            700.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
        }
      },
      {
        "box": {
          "id": "obj-233",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
            229.0,
            20.0
          ],
          "text": "13 \u00b7 amxd Vibrato Cauldron",
          "presentation": 1,
          "presentation_rect": [
            354.0,
            1041.0,
            204.0,
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
          "id": "obj-234",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1884.0,
            1841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            354.0,
            1041.0,
            204.0,
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
          "id": "obj-235",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1884.0,
            1871.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            1884.0,
            1901.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-237",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            1841.0,
            564.0,
            20.0
          ],
          "text": "13 \u00b7 amxd~ Vibrato Cauldron.amxd \u2014 allpass pair modulated by smoothed noise"
        }
      },
      {
        "box": {
          "id": "obj-238",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            1871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            568.0,
            1041.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-239",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1380.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1460.0,
            1871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-241",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            1310.0,
            1951.0,
            250.0,
            196.0
          ],
          "text": "amxd~ \"Vibrato Cauldron.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            354.0,
            1067.0,
            250.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_13"
        }
      },
      {
        "box": {
          "id": "obj-242",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1610.0,
            1871.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-243",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1610.0,
            1911.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
        }
      },
      {
        "box": {
          "id": "obj-244",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
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
            1450.0,
            2182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            502.0,
            169.0,
            20.0
          ],
          "text": "14 \u00b7 amxd Tremellow",
          "presentation": 1,
          "presentation_rect": [
            642.0,
            1041.0,
            316.0,
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
          "id": "obj-248",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            2282.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            642.0,
            1041.0,
            316.0,
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
            500.0,
            2312.0,
            40.0,
            22.0
          ],
          "text": "13"
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
            500.0,
            2342.0,
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
            30.0,
            2282.0,
            460.0,
            20.0
          ],
          "text": "14 \u00b7 amxd~ Tremellow.amxd \u2014 stereo tremolo / panning"
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2312.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            968.0,
            1041.0,
            50.0,
            22.0
          ]
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
            100.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-255",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2392.0,
            372.0,
            196.0
          ],
          "text": "amxd~ Tremellow.amxd",
          "presentation": 1,
          "presentation_rect": [
            642.0,
            1067.0,
            372.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_14"
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
            330.0,
            2312.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            2352.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            30.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_L"
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
            170.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_R"
        }
      },
      {
        "box": {
          "id": "obj-261",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            220.0,
            20.0
          ],
          "text": "15 \u00b7 amxd Pitch & Vibrato",
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            1041.0,
            204.0,
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
          "id": "obj-262",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1185.0,
            2282.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            1041.0,
            204.0,
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
          "id": "obj-263",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1185.0,
            2312.0,
            40.0,
            22.0
          ],
          "text": "14"
        }
      },
      {
        "box": {
          "id": "obj-264",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1185.0,
            2342.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2282.0,
            535.0,
            20.0
          ],
          "text": "15 \u00b7 amxd~ Pitch & Vibrato.amxd \u2014 pitchshift~ with a double-LFO vibrato"
        }
      },
      {
        "box": {
          "id": "obj-266",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2312.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1256.0,
            1041.0,
            50.0,
            22.0
          ]
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
            710.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            790.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            640.0,
            2392.0,
            248.0,
            196.0
          ],
          "text": "amxd~ \"Pitch & Vibrato.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            1042.0,
            1067.0,
            248.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_15"
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
            940.0,
            2312.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            2352.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
        }
      },
      {
        "box": {
          "id": "obj-272",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_L"
        }
      },
      {
        "box": {
          "id": "obj-273",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_R"
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
            2520.0,
            554.0,
            212.0,
            20.0
          ],
          "text": "16 \u00b7 amxd Audio Rate Pan",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1293.0,
            440.0,
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
          "id": "obj-276",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1891.0,
            2282.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1293.0,
            440.0,
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
          "id": "obj-277",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1891.0,
            2312.0,
            40.0,
            22.0
          ],
          "text": "15"
        }
      },
      {
        "box": {
          "id": "obj-278",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1891.0,
            2342.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1325.0,
            2282.0,
            556.0,
            20.0
          ],
          "text": "16 \u00b7 amxd~ Audio Rate Pan.amxd \u2014 panning at audio rate with modulated rate"
        }
      },
      {
        "box": {
          "id": "obj-280",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1325.0,
            2312.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            468.0,
            1293.0,
            50.0,
            22.0
          ]
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
            1395.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-282",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1475.0,
            2312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-283",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            1325.0,
            2392.0,
            496.0,
            196.0
          ],
          "text": "amxd~ \"Audio Rate Pan.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1319.0,
            496.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_16"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1325.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_L"
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
            1465.0,
            2623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_R"
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
            2520.0,
            580.0,
            178.0,
            20.0
          ],
          "text": "17 \u00b7 amxd DopplerPan",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1293.0,
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
          "varname": "TITLE_17"
        }
      },
      {
        "box": {
          "id": "obj-288",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            575.0,
            2723.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1293.0,
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
          "id": "obj-289",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            575.0,
            2753.0,
            40.0,
            22.0
          ],
          "text": "16"
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
            575.0,
            2783.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            2723.0,
            535.0,
            20.0
          ],
          "text": "17 \u00b7 amxd~ Max DopplerPan.amxd \u2014 Doppler panner synced to the transport"
        }
      },
      {
        "box": {
          "id": "obj-292",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2753.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            816.0,
            1293.0,
            50.0,
            22.0
          ]
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
            100.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2833.0,
            320.0,
            196.0
          ],
          "text": "amxd~ \"Max DopplerPan.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1319.0,
            320.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_17"
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_L"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_R"
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
            2520.0,
            606.0,
            152.0,
            20.0
          ],
          "text": "18 \u00b7 amxd Warpoon",
          "presentation": 1,
          "presentation_rect": [
            890.0,
            1293.0,
            280.0,
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
          "id": "obj-300",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1238.0,
            2723.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            890.0,
            1293.0,
            280.0,
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
          "id": "obj-301",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1238.0,
            2753.0,
            40.0,
            22.0
          ],
          "text": "17"
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
            1238.0,
            2783.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            715.0,
            2723.0,
            513.0,
            20.0
          ],
          "text": "18 \u00b7 amxd~ Warpoon.amxd \u2014 ambient chorus, four modulated stereo taps"
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            715.0,
            2753.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1180.0,
            1293.0,
            50.0,
            22.0
          ]
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
            785.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            865.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            715.0,
            2833.0,
            336.0,
            196.0
          ],
          "text": "amxd~ Warpoon.amxd",
          "presentation": 1,
          "presentation_rect": [
            890.0,
            1319.0,
            336.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_18"
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
            1015.0,
            2753.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1015.0,
            2793.0,
            146.0,
            22.0
          ],
          "text": "wet_dry_level 100."
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
            715.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_L"
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
            855.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_R"
        }
      },
      {
        "box": {
          "id": "obj-313",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
            144.0,
            20.0
          ],
          "text": "19 \u00b7 amxd Nebula",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1545.0,
            240.0,
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
          "id": "obj-314",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1952.0,
            2723.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1545.0,
            240.0,
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
          "id": "obj-315",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1952.0,
            2753.0,
            40.0,
            22.0
          ],
          "text": "18"
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1952.0,
            2783.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-317",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1378.0,
            2723.0,
            564.0,
            20.0
          ],
          "text": "19 \u00b7 amxd~ Nebula.amxd \u2014 amplitude / phase-inversion swirl for stereo width"
        }
      },
      {
        "box": {
          "id": "obj-318",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1378.0,
            2753.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            268.0,
            1545.0,
            50.0,
            22.0
          ]
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
            1448.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1528.0,
            2753.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-321",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            1378.0,
            2833.0,
            296.0,
            196.0
          ],
          "text": "amxd~ Nebula.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1571.0,
            296.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_19"
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
            1378.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX19_L"
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
            1518.0,
            3064.0,
            83.0,
            22.0
          ],
          "text": "s~ FX19_R"
        }
      },
      {
        "box": {
          "id": "obj-325",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            658.0,
            161.0,
            20.0
          ],
          "text": "20 \u00b7 amxd Pendulum",
          "presentation": 1,
          "presentation_rect": [
            342.0,
            1545.0,
            204.0,
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
          "id": "obj-326",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            553.0,
            3164.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            342.0,
            1545.0,
            204.0,
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
          "id": "obj-327",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            553.0,
            3194.0,
            40.0,
            22.0
          ],
          "text": "19"
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
            553.0,
            3224.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            3164.0,
            513.0,
            20.0
          ],
          "text": "20 \u00b7 amxd~ Pendulum.amxd \u2014 four-tap delay swept by a ramp oscillator"
        }
      },
      {
        "box": {
          "id": "obj-330",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3194.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            556.0,
            1545.0,
            50.0,
            22.0
          ]
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
            100.0,
            3194.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-332",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            3194.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-333",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3274.0,
            250.0,
            196.0
          ],
          "text": "amxd~ Pendulum.amxd",
          "presentation": 1,
          "presentation_rect": [
            342.0,
            1571.0,
            250.0,
            196.0
          ],
          "viewvisibility": 1,
          "bgmode": 1,
          "border": 0,
          "clickthrough": 0,
          "enablehscroll": 0,
          "enablevscroll": 0,
          "lockeddragscroll": 0,
          "lockedsize": 0,
          "offset": [
            0.0,
            0.0
          ],
          "varname": "DEV_20"
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
            330.0,
            3194.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-335",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            3234.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
        }
      },
      {
        "box": {
          "id": "obj-336",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3505.0,
            83.0,
            22.0
          ],
          "text": "s~ FX20_L"
        }
      },
      {
        "box": {
          "id": "obj-337",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3505.0,
            83.0,
            22.0
          ],
          "text": "s~ FX20_R"
        }
      },
      {
        "box": {
          "id": "obj-338",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3605.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201320 are the effects"
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
            30.0,
            3665.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-340",
          "maxclass": "newobj",
          "numinlets": 21,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3715.0,
            209.0,
            22.0
          ],
          "text": "selector~ 20 1 @ramptime 30"
        }
      },
      {
        "box": {
          "id": "obj-341",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3765.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
        }
      },
      {
        "box": {
          "id": "obj-342",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
        }
      },
      {
        "box": {
          "id": "obj-343",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
        }
      },
      {
        "box": {
          "id": "obj-344",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
        }
      },
      {
        "box": {
          "id": "obj-345",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            390.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
        }
      },
      {
        "box": {
          "id": "obj-347",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            570.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
        }
      },
      {
        "box": {
          "id": "obj-348",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
        }
      },
      {
        "box": {
          "id": "obj-350",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
        }
      },
      {
        "box": {
          "id": "obj-351",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
        }
      },
      {
        "box": {
          "id": "obj-352",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1020.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
        }
      },
      {
        "box": {
          "id": "obj-353",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
        }
      },
      {
        "box": {
          "id": "obj-354",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1200.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_L"
        }
      },
      {
        "box": {
          "id": "obj-355",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_L"
        }
      },
      {
        "box": {
          "id": "obj-356",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1380.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_L"
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
            1470.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_L"
        }
      },
      {
        "box": {
          "id": "obj-358",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1560.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_L"
        }
      },
      {
        "box": {
          "id": "obj-359",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1650.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX19_L"
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
            1740.0,
            3665.0,
            83.0,
            22.0
          ],
          "text": "r~ FX20_L"
        }
      },
      {
        "box": {
          "id": "obj-361",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3795.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-362",
          "maxclass": "newobj",
          "numinlets": 21,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3845.0,
            209.0,
            22.0
          ],
          "text": "selector~ 20 1 @ramptime 30"
        }
      },
      {
        "box": {
          "id": "obj-363",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3895.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
        }
      },
      {
        "box": {
          "id": "obj-365",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
        }
      },
      {
        "box": {
          "id": "obj-366",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
        }
      },
      {
        "box": {
          "id": "obj-367",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            390.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
        }
      },
      {
        "box": {
          "id": "obj-368",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
        }
      },
      {
        "box": {
          "id": "obj-369",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            570.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
        }
      },
      {
        "box": {
          "id": "obj-370",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
        }
      },
      {
        "box": {
          "id": "obj-371",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
        }
      },
      {
        "box": {
          "id": "obj-372",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
        }
      },
      {
        "box": {
          "id": "obj-373",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
        }
      },
      {
        "box": {
          "id": "obj-374",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1020.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
        }
      },
      {
        "box": {
          "id": "obj-375",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
        }
      },
      {
        "box": {
          "id": "obj-376",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1200.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_R"
        }
      },
      {
        "box": {
          "id": "obj-377",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_R"
        }
      },
      {
        "box": {
          "id": "obj-378",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1380.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_R"
        }
      },
      {
        "box": {
          "id": "obj-379",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1470.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_R"
        }
      },
      {
        "box": {
          "id": "obj-380",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1560.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_R"
        }
      },
      {
        "box": {
          "id": "obj-381",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1650.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX19_R"
        }
      },
      {
        "box": {
          "id": "obj-382",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1740.0,
            3795.0,
            83.0,
            22.0
          ],
          "text": "r~ FX20_R"
        }
      },
      {
        "box": {
          "id": "obj-383",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3945.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
        }
      },
      {
        "box": {
          "id": "obj-384",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3975.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
        }
      },
      {
        "box": {
          "id": "obj-385",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            3975.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
        }
      },
      {
        "box": {
          "id": "obj-386",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            3975.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
        }
      },
      {
        "box": {
          "id": "obj-387",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            3975.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-388",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            410.0,
            3975.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-389",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            3975.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-390",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            4015.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-391",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            4015.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-392",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            4065.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-393",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            4065.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-394",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            4065.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-395",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            4065.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-396",
          "maxclass": "live.gain~",
          "numinlets": 2,
          "numoutlets": 5,
          "outlettype": [
            "signal",
            "signal",
            "",
            "float",
            "list"
          ],
          "patching_rect": [
            30.0,
            4125.0,
            50.0,
            47.0
          ],
          "presentation": 1,
          "presentation_rect": [
            980.0,
            130.0,
            250.0,
            47.0
          ],
          "orientation": 1
        }
      },
      {
        "box": {
          "id": "obj-397",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4205.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1235.0,
            130.0,
            45.0,
            45.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-398",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3945.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            3975.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-400",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            4015.0,
            200.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            980.0,
            62.0,
            240.0,
            36.0
          ],
          "floatoutput": 1,
          "size": 1.0,
          "knobcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "elementcolor": [
            0.3,
            0.3,
            0.32,
            1.0
          ],
          "bgcolor": [
            0.08,
            0.08,
            0.09,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-401",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            4055.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1226.0,
            69.0,
            54.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-402",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            4095.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            4135.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            4135.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
        }
      },
      {
        "box": {
          "id": "obj-405",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            4175.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-406",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            4175.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-407",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            4215.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
        }
      },
      {
        "box": {
          "id": "obj-408",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            930.0,
            4215.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-411",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
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
          "id": "obj-412",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
            450.0,
            20.0
          ],
          "text": "drop audio files on the player, click a clip to play",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            244.0,
            306.0,
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
          "id": "obj-413",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            736.0,
            178.0,
            20.0
          ],
          "text": "live in (DSP on/off)",
          "presentation": 1,
          "presentation_rect": [
            392.0,
            52.0,
            200.0,
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
          "id": "obj-414",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
            229.0,
            20.0
          ],
          "text": "live in OPEN \u2014 loads muted",
          "presentation": 1,
          "presentation_rect": [
            372.0,
            94.0,
            220.0,
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
          "id": "obj-415",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
            144.0,
            20.0
          ],
          "text": "impulse (click~)",
          "presentation": 1,
          "presentation_rect": [
            372.0,
            133.0,
            150.0,
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
          "id": "obj-416",
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
          "text": "noise burst 120 ms",
          "presentation": 1,
          "presentation_rect": [
            372.0,
            173.0,
            150.0,
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
          "id": "obj-417",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            577.0,
            20.0
          ],
          "text": "SHOOTOUT \u2014 click an effect; all run in parallel, crossfade in 30 ms",
          "presentation": 1,
          "presentation_rect": [
            630.0,
            16.0,
            640.0,
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
          "id": "obj-418",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
            331.0,
            20.0
          ],
          "text": "DRY / WET  \u25c4 dry \u00b7 wet \u25ba  (loads 0.25)",
          "presentation": 1,
          "presentation_rect": [
            980.0,
            40.0,
            300.0,
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
          "id": "obj-419",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            40.0,
            20.0
          ],
          "text": "wet",
          "presentation": 1,
          "presentation_rect": [
            1226.0,
            93.0,
            54.0,
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
          "id": "obj-420",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
            59.0,
            20.0
          ],
          "text": "master",
          "presentation": 1,
          "presentation_rect": [
            980.0,
            110.0,
            80.0,
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
          "id": "obj-421",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            50.0,
            20.0
          ],
          "text": "audio",
          "presentation": 1,
          "presentation_rect": [
            1235.0,
            178.0,
            50.0,
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
          "id": "obj-422",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
            246.0,
            20.0
          ],
          "text": "re-apply wet-only everywhere",
          "presentation": 1,
          "presentation_rect": [
            1075.0,
            203.0,
            205.0,
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
          "id": "obj-423",
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
          "id": "obj-49",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            502.0,
            176.0,
            271.0
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
          "id": "obj-70",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            502.0,
            176.0,
            271.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            378.0,
            502.0,
            176.0,
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
          "id": "obj-110",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            562.0,
            502.0,
            176.0,
            247.0
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
          "id": "obj-130",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            746.0,
            502.0,
            176.0,
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
          "id": "obj-149",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            930.0,
            502.0,
            176.0,
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
          "id": "obj-168",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1114.0,
            502.0,
            203.0,
            184.0
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
          "id": "obj-179",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            783.0,
            206.0,
            184.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            224.0,
            783.0,
            444.0,
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
          "id": "obj-204",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            676.0,
            783.0,
            423.0,
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
          "id": "obj-218",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1035.0,
            328.0,
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
          "id": "obj-232",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            346.0,
            1035.0,
            280.0,
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
          "id": "obj-246",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            634.0,
            1035.0,
            392.0,
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
          "id": "obj-260",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1034.0,
            1035.0,
            280.0,
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
          "id": "obj-274",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1287.0,
            516.0,
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
          "id": "obj-286",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1080.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            534.0,
            1287.0,
            340.0,
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
          "id": "obj-298",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            882.0,
            1287.0,
            356.0,
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
          "id": "obj-312",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1220.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1539.0,
            316.0,
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
          "id": "obj-324",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            334.0,
            1539.0,
            280.0,
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
          "id": "obj-409",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1360.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            600.0,
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
          "id": "obj-410",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1430.0,
            4275.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            10.0,
            670.0,
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
          "id": "obj-spec-embed",
          "maxclass": "text.codebox",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            4335.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"MODULATION SHOOTOUT \\u2014 phaser, flanger, chorus, vibrato, tremolo and panning effects. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ]\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ]\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ]\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 20, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ]\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        432\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 20,\n        \"num_lines_presentation\": 20,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 abl phaser~\",\n              \"3 abl flanger~\",\n              \"4 abl chorus~\",\n              \"5 abl ensemble~\",\n              \"6 abl vibrato~\",\n              \"7 abl doubler~\",\n              \"8 BEAP Chorus\",\n              \"9 BEAP Flanger\",\n              \"10 amxd Chorus x2\",\n              \"11 amxd Flange-o-tron\",\n              \"12 amxd Swirl\",\n              \"13 amxd Vibrato Cauldron\",\n              \"14 amxd Tremellow\",\n              \"15 amxd Pitch & Vibrato\",\n              \"16 amxd Audio Rate Pan\",\n              \"17 amxd DopplerPan\",\n              \"18 amxd Warpoon\",\n              \"19 amxd Nebula\",\n              \"20 amxd Pendulum\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 19,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ]\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 20 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        }\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ]\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ]\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ]\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      }\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ]\n    },\n    \"c_transport\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 the global transport; followed by: Flange-o-tron, DopplerPan\",\n      \"pos\": [\n        2000,\n        230\n      ],\n      \"size\": [\n        500,\n        20\n      ]\n    },\n    \"tr_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 120.\",\n      \"pos\": [\n        2000,\n        260\n      ]\n    },\n    \"tr_bpm\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        2000,\n        290\n      ],\n      \"attrs\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      },\n      \"presentation\": [\n        1110,\n        262,\n        54,\n        22\n      ]\n    },\n    \"tr_tempo\": {\n      \"type\": \"message\",\n      \"text\": \"tempo $1\",\n      \"pos\": [\n        2000,\n        320\n      ]\n    },\n    \"tr_run\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        2120,\n        290\n      ],\n      \"presentation\": [\n        980,\n        262,\n        22,\n        22\n      ]\n    },\n    \"tr_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"transport\",\n      \"pos\": [\n        2000,\n        360\n      ]\n    },\n    \"p_tr_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 Flange-o-tron, DopplerPan\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        322,\n        20\n      ],\n      \"presentation\": [\n        980,\n        240,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_tr_run\": {\n      \"type\": \"comment\",\n      \"text\": \"start / stop\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        1010,\n        264,\n        90,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_tr_bpm\": {\n      \"type\": \"comment\",\n      \"text\": \"bpm\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1170,\n        264,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        502,\n        176,\n        271.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 abl phaser~\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      }\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        620,\n        520\n      ],\n      \"presentation\": [\n        18,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        620,\n        550\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        620,\n        580\n      ]\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 abl.dsp.phaser~ \\u2014 Live's Phaser (ableton-dsp package)\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        580,\n        20\n      ]\n    },\n    \"f02_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        550\n      ]\n    },\n    \"f02_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        550\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.phaser~ @mix 1.\",\n      \"pos\": [\n        30,\n        828\n      ],\n      \"presentation\": [\n        18,\n        726,\n        160,\n        35.0\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f02_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"mod_freq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f02_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"notches\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f02_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"center\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f02_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"spread\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f02_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        720\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f02_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        746\n      ],\n      \"attrs\": {\n        \"attr\": \"blend\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        676,\n        160,\n        22\n      ]\n    },\n    \"f02_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        300,\n        772\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        700,\n        160,\n        22\n      ]\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        873\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        873\n      ]\n    },\n    \"f02_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        490,\n        550\n      ]\n    },\n    \"f02_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        490,\n        580\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        502,\n        176,\n        271.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 abl flanger~\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        202,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      }\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1350,\n        520\n      ],\n      \"presentation\": [\n        202,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1350,\n        550\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1350,\n        580\n      ]\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 abl.dsp.flanger~ \\u2014 Live's Flanger\",\n      \"pos\": [\n        760,\n        520\n      ],\n      \"size\": [\n        580,\n        20\n      ]\n    },\n    \"f03_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        760,\n        550\n      ]\n    },\n    \"f03_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        840,\n        550\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.flanger~ @mix 1.\",\n      \"pos\": [\n        760,\n        828\n      ],\n      \"presentation\": [\n        202,\n        726,\n        160,\n        35.0\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        890,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        910,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"mod_freq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f03_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        930,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"time\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f03_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        950,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f03_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        970,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"envelope\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f03_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        990,\n        720\n      ],\n      \"attrs\": {\n        \"attr\": \"env_amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f03_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1010,\n        746\n      ],\n      \"attrs\": {\n        \"attr\": \"waveform\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        676,\n        160,\n        22\n      ]\n    },\n    \"f03_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1030,\n        772\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        700,\n        160,\n        22\n      ]\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        760,\n        873\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        850,\n        873\n      ]\n    },\n    \"f03_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1220,\n        550\n      ]\n    },\n    \"f03_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1220,\n        580\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        378,\n        502,\n        176,\n        223.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 abl chorus~\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        386,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      }\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2040,\n        520\n      ],\n      \"presentation\": [\n        386,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        2040,\n        550\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2040,\n        580\n      ]\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 abl.dsp.chorus~ \\u2014 Live's Chorus-Ensemble, chorus mode\",\n      \"pos\": [\n        1490,\n        520\n      ],\n      \"size\": [\n        540,\n        20\n      ]\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1490,\n        550\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1570,\n        550\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.chorus~ @mix 1.\",\n      \"pos\": [\n        1490,\n        776\n      ],\n      \"presentation\": [\n        386,\n        678,\n        160,\n        35.0\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1620,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"rate\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1640,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f04_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1660,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f04_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1680,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"width\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f04_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1700,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"warmth\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f04_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1720,\n        720\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1490,\n        821\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1580,\n        821\n      ]\n    },\n    \"f04_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1910,\n        550\n      ]\n    },\n    \"f04_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1910,\n        580\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        562,\n        502,\n        176,\n        247.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 abl ensemble~\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        570,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      }\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        600,\n        973\n      ],\n      \"presentation\": [\n        570,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        600,\n        1003\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        600,\n        1033\n      ]\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 abl.dsp.ensemble~ \\u2014 Live's Chorus-Ensemble, ensemble mode\",\n      \"pos\": [\n        30,\n        973\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"f05_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1003\n      ]\n    },\n    \"f05_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1003\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.ensemble~ @mix 1.\",\n      \"pos\": [\n        30,\n        1255\n      ],\n      \"presentation\": [\n        570,\n        702,\n        160,\n        35.0\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        1043\n      ],\n      \"attrs\": {\n        \"attr\": \"rate\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f05_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        1069\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f05_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        1095\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f05_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        1121\n      ],\n      \"attrs\": {\n        \"attr\": \"shaping\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f05_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        1147\n      ],\n      \"attrs\": {\n        \"attr\": \"width\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f05_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        1173\n      ],\n      \"attrs\": {\n        \"attr\": \"warmth\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f05_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        1199\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        676,\n        160,\n        22\n      ]\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1300\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        120,\n        1300\n      ]\n    },\n    \"f05_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        470,\n        1003\n      ]\n    },\n    \"f05_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        470,\n        1033\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        746,\n        502,\n        176,\n        223.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 abl vibrato~\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        754,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      }\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1290,\n        973\n      ],\n      \"presentation\": [\n        754,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1290,\n        1003\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1290,\n        1033\n      ]\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 abl.dsp.vibrato~ \\u2014 Live's Chorus-Ensemble, vibrato mode\",\n      \"pos\": [\n        740,\n        973\n      ],\n      \"size\": [\n        540,\n        20\n      ]\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        740,\n        1003\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        820,\n        1003\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.vibrato~ @mix 1.\",\n      \"pos\": [\n        740,\n        1229\n      ],\n      \"presentation\": [\n        754,\n        678,\n        160,\n        35.0\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        870,\n        1043\n      ],\n      \"attrs\": {\n        \"attr\": \"rate\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f06_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        890,\n        1069\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f06_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        910,\n        1095\n      ],\n      \"attrs\": {\n        \"attr\": \"offset\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f06_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        930,\n        1121\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f06_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        950,\n        1147\n      ],\n      \"attrs\": {\n        \"attr\": \"width\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f06_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        970,\n        1173\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        740,\n        1274\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        830,\n        1274\n      ]\n    },\n    \"f06_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1160,\n        1003\n      ]\n    },\n    \"f06_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1160,\n        1033\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        930,\n        502,\n        176,\n        223.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl doubler~\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        938,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      }\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1980,\n        973\n      ],\n      \"presentation\": [\n        938,\n        508,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1980,\n        1003\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1980,\n        1033\n      ]\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl.dsp.doubler~ \\u2014 Live's Doubler (short modulated delay)\",\n      \"pos\": [\n        1430,\n        973\n      ],\n      \"size\": [\n        540,\n        20\n      ]\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1430,\n        1003\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1510,\n        1003\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.doubler~ @mix 1.\",\n      \"pos\": [\n        1430,\n        1229\n      ],\n      \"presentation\": [\n        938,\n        678,\n        160,\n        35.0\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1560,\n        1043\n      ],\n      \"attrs\": {\n        \"attr\": \"mod\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        532,\n        160,\n        22\n      ]\n    },\n    \"f07_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1580,\n        1069\n      ],\n      \"attrs\": {\n        \"attr\": \"mod_freq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        556,\n        160,\n        22\n      ]\n    },\n    \"f07_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1600,\n        1095\n      ],\n      \"attrs\": {\n        \"attr\": \"time\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        580,\n        160,\n        22\n      ]\n    },\n    \"f07_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1620,\n        1121\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        604,\n        160,\n        22\n      ]\n    },\n    \"f07_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1640,\n        1147\n      ],\n      \"attrs\": {\n        \"attr\": \"lfo_blend\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        628,\n        160,\n        22\n      ]\n    },\n    \"f07_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1660,\n        1173\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        652,\n        160,\n        22\n      ]\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1430,\n        1274\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1520,\n        1274\n      ]\n    },\n    \"f07_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1850,\n        1003\n      ]\n    },\n    \"f07_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1850,\n        1033\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1114,\n        502,\n        203,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 BEAP Chorus\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        508,\n        187,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      }\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        416,\n        1400\n      ],\n      \"presentation\": [\n        1122,\n        508,\n        187,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        416,\n        1430\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        416,\n        1460\n      ]\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 bp.Chorus \\u2014 BEAP module, mono in / stereo out\",\n      \"pos\": [\n        30,\n        1400\n      ],\n      \"size\": [\n        376,\n        20\n      ]\n    },\n    \"f08_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        1430\n      ]\n    },\n    \"f08_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1470\n      ],\n      \"size\": [\n        187,\n        116\n      ],\n      \"presentation\": [\n        1122,\n        532,\n        187,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_CHORUS\",\n        \"comment\": \"in 0: signal | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          126.0,\n          282.0,\n          803.0,\n          544.0\n        ],\n        \"bglocked\": 1,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 2,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-16\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                51.642456,\n                83.0,\n                118.0,\n                18.0\n              ],\n              \"text\": \"## Chorus effect ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-34\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"dsp.gen\",\n                \"rect\": [\n                  262.0,\n                  79.0,\n                  706.0,\n                  488.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-19\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        419.0,\n                        247.0,\n                        79.0,\n                        22.0\n                      ],\n                      \"text\": \"constant 400\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-15\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 3,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        385.0,\n                        291.0,\n                        40.0,\n                        22.0\n                      ],\n                      \"text\": \"slide\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-13\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        167.0,\n                        321.0,\n                        29.0,\n                        22.0\n                      ],\n                      \"text\": \"* -1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-12\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        119.0,\n                        42.0,\n                        22.0\n                      ],\n                      \"text\": \"* 1.31\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        352.0,\n                        151.0,\n                        80.0,\n                        22.0\n                      ],\n                      \"text\": \"param bw 20\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-17\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        180.5,\n                        50.0,\n                        78.0,\n                        22.0\n                      ],\n                      \"text\": \"param fb 0.5\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-16\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        167.0,\n                        291.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-14\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        352.0,\n                        203.0,\n                        105.0,\n                        22.0\n                      ],\n                      \"text\": \"param center 127\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-11\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        80.0,\n                        79.0,\n                        22.0\n                      ],\n                      \"text\": \"param rate 8\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-8\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        193.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-9\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        241.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"+\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-10\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        151.0,\n                        38.0,\n                        22.0\n                      ],\n                      \"text\": \"cycle\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-7\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        193.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-6\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        241.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"+\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        151.0,\n                        38.0,\n                        22.0\n                      ],\n                      \"text\": \"cycle\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        208.0,\n                        398.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 3,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        208.0,\n                        291.0,\n                        86.0,\n                        22.0\n                      ],\n                      \"text\": \"delay 44100 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-2\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        274.0,\n                        398.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-1\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        58.0,\n                        203.0,\n                        30.0,\n                        22.0\n                      ],\n                      \"text\": \"in 1\"\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-2\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        366.0,\n                        283.5,\n                        366.0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        250.5,\n                        217.5,\n                        250.5\n                      ],\n                      \"order\": 2,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        378.0,\n                        217.5,\n                        378.0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-8\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-10\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-12\",\n                        0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-11\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-11\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-10\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-12\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-13\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-14\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        1\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-15\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        1\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-15\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-13\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-16\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-17\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        1\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-8\",\n                        1\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        2\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-19\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        1\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-19\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-2\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        1\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-6\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-7\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-8\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        2\n                      ],\n                      \"source\": [\n                        \"obj-9\",\n                        0\n                      ]\n                    }\n                  }\n                ],\n                \"bgcolor\": [\n                  0.9,\n                  0.9,\n                  0.9,\n                  1.0\n                ],\n                \"editing_bgcolor\": [\n                  0.9,\n                  0.9,\n                  0.9,\n                  1.0\n                ]\n              },\n              \"patching_rect\": [\n                302.0,\n                225.791412,\n                150.0,\n                20.0\n              ],\n              \"text\": \"gen~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-33\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                452.0,\n                480.661774,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                164.75,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"R\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-32\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                433.0,\n                279.907501,\n                32.5,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-31\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                302.0,\n                279.907501,\n                32.5,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-30\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                302.0,\n                135.377502,\n                42.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-26\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                412.236206,\n                434.661774,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-27\",\n              \"index\": 2,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                412.236206,\n                480.661774,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-20\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                141.236206,\n                379.661774,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                141.236206,\n                434.661774,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-23\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                141.236206,\n                334.599274,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                130.0,\n                19.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_defer\": 1,\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"bypass[1]\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"bypass\"\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-24\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                141.236206,\n                480.661774,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-25\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                225.236206,\n                49.907501,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                543.0,\n                168.907501,\n                65.0,\n                20.0\n              ],\n              \"text\": \"center $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                620.0,\n                168.907501,\n                43.0,\n                20.0\n              ],\n              \"text\": \"bw $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-7\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                685.0,\n                168.907501,\n                50.0,\n                20.0\n              ],\n              \"text\": \"rate $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                753.0,\n                168.907501,\n                37.0,\n                20.0\n              ],\n              \"text\": \"fb $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-3\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                753.0,\n                98.377502,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                136.75,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_longname\": \"Regen[1]\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.8\n                  ],\n                  \"parameter_shortname\": \"Regen\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Regen\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-2\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                685.0,\n                98.377502,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                91.5,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_longname\": \"Rate\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 10.0,\n                  \"parameter_initial\": [\n                    2\n                  ],\n                  \"parameter_shortname\": \"Rate\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Rate\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-1\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                620.0,\n                98.377502,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                46.25,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_longname\": \"Depth\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_initial\": [\n                    150\n                  ],\n                  \"parameter_shortname\": \"Depth\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Width\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                51.642456,\n                139.0,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"Center\": [\n                  500.0\n                ],\n                \"Rate\": [\n                  2.0\n                ],\n                \"Regen\": [\n                  0.5\n                ],\n                \"Width\": [\n                  20.000000000000004\n                ],\n                \"bypass\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u356007917\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                178.099976,\n                480.661774,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"L\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-28\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                543.0,\n                98.377502,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                1.0,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_exponent\": 2.0,\n                  \"parameter_longname\": \"Center\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 2000.0,\n                  \"parameter_initial\": [\n                    500\n                  ],\n                  \"parameter_shortname\": \"Center\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Center\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                262.5,\n                49.907501,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                32.0,\n                17.0\n              ],\n              \"text\": \"Input\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                51.642456,\n                49.907501,\n                48.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                19.0,\n                54.0,\n                17.0\n              ],\n              \"text\": \"CHORUS\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                51.642456,\n                37.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                95.979645,\n                37.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                138.721741,\n                37.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-7\",\n                0\n              ],\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-24\",\n                0\n              ],\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-20\",\n                0\n              ],\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                2\n              ],\n              \"midpoints\": [\n                234.736206,\n                388.784637,\n                335.73620600000004,\n                388.784637\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                2\n              ],\n              \"midpoints\": [\n                234.736206,\n                388.784637,\n                606.736206,\n                388.784637\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-30\",\n                0\n              ],\n              \"order\": 2,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-27\",\n                0\n              ],\n              \"source\": [\n                \"obj-26\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                0\n              ],\n              \"source\": [\n                \"obj-28\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-9\",\n                0\n              ],\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"source\": [\n                \"obj-30\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                1\n              ],\n              \"source\": [\n                \"obj-31\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                1\n              ],\n              \"source\": [\n                \"obj-32\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-31\",\n                0\n              ],\n              \"source\": [\n                \"obj-34\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                0\n              ],\n              \"source\": [\n                \"obj-34\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"midpoints\": [\n                629.5,\n                201.907501,\n                311.5,\n                201.907501\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"midpoints\": [\n                552.5,\n                201.907501,\n                311.5,\n                201.907501\n              ],\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"midpoints\": [\n                694.5,\n                201.907501,\n                311.5,\n                201.907501\n              ],\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"midpoints\": [\n                762.5,\n                201.907501,\n                311.5,\n                201.907501\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1621\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        157,\n        1621\n      ]\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        654,\n        187,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        783.0,\n        206,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 BEAP Flanger\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        789.0,\n        190,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      }\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        950,\n        1400\n      ],\n      \"presentation\": [\n        18,\n        789.0,\n        190,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        950,\n        1430\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        950,\n        1460\n      ]\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 bp.Flanger \\u2014 BEAP module, mono in / stereo out\",\n      \"pos\": [\n        556,\n        1400\n      ],\n      \"size\": [\n        384,\n        20\n      ]\n    },\n    \"f09_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        556,\n        1430\n      ]\n    },\n    \"f09_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        556,\n        1470\n      ],\n      \"size\": [\n        190,\n        116\n      ],\n      \"presentation\": [\n        18,\n        813.0,\n        190,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_FLANGER\",\n        \"comment\": \"in 0: signal | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          445.0,\n          282.0,\n          685.0,\n          720.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-12\",\n              \"linecount\": 3,\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                55.455986,\n                94.0,\n                220.0,\n                42.0\n              ],\n              \"text\": \"## Combines a modulated time-delayed version of the input signal to produce a swept comb filter effect ##\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-33\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                475.236206,\n                659.754272,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                168.75,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"R\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-32\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                640.0,\n                331.0,\n                32.5,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-31\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                511.0,\n                331.0,\n                32.5,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-30\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                505.0,\n                176.470001,\n                42.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-26\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                446.236206,\n                609.754272,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-27\",\n              \"index\": 2,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                446.236206,\n                655.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-20\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                175.236206,\n                554.754272,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                175.236206,\n                609.754272,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-23\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                175.236206,\n                509.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                132.0,\n                19.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_defer\": 1,\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"bypass\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"bypass\"\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-24\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                175.236206,\n                655.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-25\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                469.236206,\n                134.883911,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                752.0,\n                220.0,\n                65.0,\n                20.0\n              ],\n              \"text\": \"center $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                829.0,\n                220.0,\n                43.0,\n                20.0\n              ],\n              \"text\": \"bw $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-7\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                894.0,\n                220.0,\n                50.0,\n                20.0\n              ],\n              \"text\": \"rate $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                962.0,\n                220.0,\n                37.0,\n                20.0\n              ],\n              \"text\": \"fb $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-10\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"dsp.gen\",\n                \"rect\": [\n                  34.0,\n                  34.0,\n                  498.0,\n                  483.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        352.0,\n                        190.0,\n                        87.0,\n                        22.0\n                      ],\n                      \"text\": \"param bw 150\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-17\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        180.5,\n                        89.0,\n                        78.0,\n                        22.0\n                      ],\n                      \"text\": \"param fb 0.8\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-16\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        167.0,\n                        330.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-14\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        352.0,\n                        242.0,\n                        105.0,\n                        22.0\n                      ],\n                      \"text\": \"param center 500\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-13\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        162.0,\n                        42.0,\n                        22.0\n                      ],\n                      \"text\": \"* 1.31\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-11\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        124.0,\n                        89.0,\n                        22.0\n                      ],\n                      \"text\": \"param rate 0.1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-8\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        232.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-9\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        280.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"+\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-10\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        286.0,\n                        190.0,\n                        38.0,\n                        22.0\n                      ],\n                      \"text\": \"cycle\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-7\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        232.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"*\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-6\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        280.0,\n                        32.5,\n                        22.0\n                      ],\n                      \"text\": \"+\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        238.0,\n                        190.0,\n                        38.0,\n                        22.0\n                      ],\n                      \"text\": \"cycle\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        208.0,\n                        398.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 3,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        208.0,\n                        330.0,\n                        79.0,\n                        22.0\n                      ],\n                      \"text\": \"delay 4410 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-2\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        268.0,\n                        398.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-1\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        58.0,\n                        272.0,\n                        30.0,\n                        22.0\n                      ],\n                      \"text\": \"in 1\"\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-2\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        366.0,\n                        277.5,\n                        366.0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        306.5,\n                        217.5,\n                        306.5\n                      ],\n                      \"order\": 2,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        67.5,\n                        378.0,\n                        217.5,\n                        378.0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-8\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-10\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-13\",\n                        0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-11\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-11\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-10\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-13\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        1\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-14\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        1\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-14\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-16\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-17\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        1\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-8\",\n                        1\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-2\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        1\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-6\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-7\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-8\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        2\n                      ],\n                      \"source\": [\n                        \"obj-9\",\n                        0\n                      ]\n                    }\n                  }\n                ],\n                \"bgcolor\": [\n                  0.9,\n                  0.9,\n                  0.9,\n                  1.0\n                ],\n                \"editing_bgcolor\": [\n                  0.9,\n                  0.9,\n                  0.9,\n                  1.0\n                ]\n              },\n              \"patching_rect\": [\n                511.0,\n                269.0,\n                150.0,\n                20.0\n              ],\n              \"text\": \"gen~\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-3\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                962.0,\n                149.470001,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                138.75,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_longname\": \"Regen\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.8\n                  ],\n                  \"parameter_shortname\": \"Regen\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Regen\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-2\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                894.0,\n                149.470001,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                93.5,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_longname\": \"Rate\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 10.0,\n                  \"parameter_initial\": [\n                    0.4\n                  ],\n                  \"parameter_shortname\": \"Rate\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Rate\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-1\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                829.0,\n                149.470001,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                48.25,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_longname\": \"Width\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_initial\": [\n                    150\n                  ],\n                  \"parameter_shortname\": \"Width\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Width\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                55.455986,\n                176.470001,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"Center\": [\n                  500.0\n                ],\n                \"Rate\": [\n                  0.0\n                ],\n                \"Regen\": [\n                  0.700787\n                ],\n                \"Width\": [\n                  150.00000000000006\n                ],\n                \"bypass\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u097009929\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                215.736206,\n                659.754272,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"L\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-28\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                752.0,\n                149.470001,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                3.0,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 2.0,\n                  \"parameter_longname\": \"Center\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 2000.0,\n                  \"parameter_initial\": [\n                    500\n                  ],\n                  \"parameter_shortname\": \"Center\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Center\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                505.0,\n                138.883911,\n                32.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                32.0,\n                17.0\n              ],\n              \"text\": \"Input\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                55.455986,\n                71.907471,\n                54.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                54.0,\n                17.0\n              ],\n              \"text\": \"FLANGER\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                55.455986,\n                41.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                101.657448,\n                41.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                147.858902,\n                41.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-31\",\n                0\n              ],\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                0\n              ],\n              \"source\": [\n                \"obj-10\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-7\",\n                0\n              ],\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-24\",\n                0\n              ],\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-20\",\n                0\n              ],\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                2\n              ],\n              \"order\": 2,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-30\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-27\",\n                0\n              ],\n              \"source\": [\n                \"obj-26\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                0\n              ],\n              \"source\": [\n                \"obj-28\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-9\",\n                0\n              ],\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"source\": [\n                \"obj-30\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                1\n              ],\n              \"source\": [\n                \"obj-31\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                1\n              ],\n              \"source\": [\n                \"obj-32\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"midpoints\": [\n                838.5,\n                253.0,\n                520.5,\n                253.0\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"midpoints\": [\n                761.5,\n                253.0,\n                520.5,\n                253.0\n              ],\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"midpoints\": [\n                903.5,\n                253.0,\n                520.5,\n                253.0\n              ],\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"midpoints\": [\n                971.5,\n                253.0,\n                520.5,\n                253.0\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        556,\n        1621\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        686,\n        1621\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        935.0,\n        190,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        224,\n        783.0,\n        444,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd Chorus x2\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        232,\n        789.0,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      }\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1599,\n        1400\n      ],\n      \"presentation\": [\n        232,\n        789.0,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1599,\n        1430\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1599,\n        1460\n      ]\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Chorus x2.amxd \\u2014 two-band chorus (Max for Live package)\",\n      \"pos\": [\n        1090,\n        1400\n      ],\n      \"size\": [\n        499,\n        20\n      ]\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1090,\n        1430\n      ],\n      \"presentation\": [\n        610,\n        789.0,\n        50,\n        22\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1160,\n        1430\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1240,\n        1430\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Chorus x2.amxd\\\"\",\n      \"pos\": [\n        1090,\n        1510\n      ],\n      \"size\": [\n        424,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        232,\n        815.0,\n        424,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\"\n      }\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1390,\n        1430\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1390,\n        1470\n      ]\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1090,\n        1741\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1230,\n        1741\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        676,\n        783.0,\n        423,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd Flange-o-tron\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        684,\n        789.0,\n        347,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      }\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        560,\n        1841\n      ],\n      \"presentation\": [\n        684,\n        789.0,\n        347,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        560,\n        1871\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        560,\n        1901\n      ]\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd~ Flange-o-tron.amxd \\u2014 flanger driven by two step sequencers\",\n      \"pos\": [\n        30,\n        1841\n      ],\n      \"size\": [\n        520,\n        20\n      ]\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1871\n      ],\n      \"presentation\": [\n        1041,\n        789.0,\n        50,\n        22\n      ]\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1871\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1871\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Flange-o-tron.amxd\",\n      \"pos\": [\n        30,\n        1951\n      ],\n      \"size\": [\n        403,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        684,\n        815.0,\n        403,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_11\"\n      }\n    },\n    \"f11_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        1871\n      ]\n    },\n    \"f11_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        330,\n        1911\n      ]\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        2182\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        170,\n        2182\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1035.0,\n        328,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd Swirl\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1041.0,\n        252,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      }\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1170,\n        1841\n      ],\n      \"presentation\": [\n        18,\n        1041.0,\n        252,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1170,\n        1871\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1170,\n        1901\n      ]\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd~ Swirl.amxd \\u2014 mono-to-stereo delay-time modulation\",\n      \"pos\": [\n        700,\n        1841\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        700,\n        1871\n      ],\n      \"presentation\": [\n        280,\n        1041.0,\n        50,\n        22\n      ]\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        770,\n        1871\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        850,\n        1871\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Swirl.amxd\",\n      \"pos\": [\n        700,\n        1951\n      ],\n      \"size\": [\n        308,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1067.0,\n        308,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_12\"\n      }\n    },\n    \"f12_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1000,\n        1871\n      ]\n    },\n    \"f12_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        1000,\n        1911\n      ]\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        700,\n        2182\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        840,\n        2182\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        346,\n        1035.0,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd Vibrato Cauldron\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        354,\n        1041.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      }\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1884,\n        1841\n      ],\n      \"presentation\": [\n        354,\n        1041.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1884,\n        1871\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1884,\n        1901\n      ]\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd~ Vibrato Cauldron.amxd \\u2014 allpass pair modulated by smoothed noise\",\n      \"pos\": [\n        1310,\n        1841\n      ],\n      \"size\": [\n        564,\n        20\n      ]\n    },\n    \"f13_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1310,\n        1871\n      ],\n      \"presentation\": [\n        568,\n        1041.0,\n        50,\n        22\n      ]\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1380,\n        1871\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1460,\n        1871\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Vibrato Cauldron.amxd\\\"\",\n      \"pos\": [\n        1310,\n        1951\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        354,\n        1067.0,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_13\"\n      }\n    },\n    \"f13_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1610,\n        1871\n      ]\n    },\n    \"f13_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        1610,\n        1911\n      ]\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        1310,\n        2182\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        1450,\n        2182\n      ]\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        634,\n        1035.0,\n        392,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 amxd Tremellow\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        642,\n        1041.0,\n        316,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      }\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        2282\n      ],\n      \"presentation\": [\n        642,\n        1041.0,\n        316,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        500,\n        2312\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        2342\n      ]\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 amxd~ Tremellow.amxd \\u2014 stereo tremolo / panning\",\n      \"pos\": [\n        30,\n        2282\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f14_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        2312\n      ],\n      \"presentation\": [\n        968,\n        1041.0,\n        50,\n        22\n      ]\n    },\n    \"f14_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        2312\n      ]\n    },\n    \"f14_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        2312\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Tremellow.amxd\",\n      \"pos\": [\n        30,\n        2392\n      ],\n      \"size\": [\n        372,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        642,\n        1067.0,\n        372,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_14\"\n      }\n    },\n    \"f14_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        2312\n      ]\n    },\n    \"f14_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        330,\n        2352\n      ]\n    },\n    \"f14_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_L\",\n      \"pos\": [\n        30,\n        2623\n      ]\n    },\n    \"f14_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_R\",\n      \"pos\": [\n        170,\n        2623\n      ]\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1034,\n        1035.0,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 amxd Pitch & Vibrato\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        1042,\n        1041.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      }\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1185,\n        2282\n      ],\n      \"presentation\": [\n        1042,\n        1041.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1185,\n        2312\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1185,\n        2342\n      ]\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 amxd~ Pitch & Vibrato.amxd \\u2014 pitchshift~ with a double-LFO vibrato\",\n      \"pos\": [\n        640,\n        2282\n      ],\n      \"size\": [\n        535,\n        20\n      ]\n    },\n    \"f15_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        640,\n        2312\n      ],\n      \"presentation\": [\n        1256,\n        1041.0,\n        50,\n        22\n      ]\n    },\n    \"f15_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        710,\n        2312\n      ]\n    },\n    \"f15_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        790,\n        2312\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Pitch & Vibrato.amxd\\\"\",\n      \"pos\": [\n        640,\n        2392\n      ],\n      \"size\": [\n        248,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        1042,\n        1067.0,\n        248,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_15\"\n      }\n    },\n    \"f15_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        940,\n        2312\n      ]\n    },\n    \"f15_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        940,\n        2352\n      ]\n    },\n    \"f15_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_L\",\n      \"pos\": [\n        640,\n        2623\n      ]\n    },\n    \"f15_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_R\",\n      \"pos\": [\n        780,\n        2623\n      ]\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1287.0,\n        516,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 amxd Audio Rate Pan\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1293.0,\n        440,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      }\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1891,\n        2282\n      ],\n      \"presentation\": [\n        18,\n        1293.0,\n        440,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        1891,\n        2312\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1891,\n        2342\n      ]\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 amxd~ Audio Rate Pan.amxd \\u2014 panning at audio rate with modulated rate\",\n      \"pos\": [\n        1325,\n        2282\n      ],\n      \"size\": [\n        556,\n        20\n      ]\n    },\n    \"f16_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1325,\n        2312\n      ],\n      \"presentation\": [\n        468,\n        1293.0,\n        50,\n        22\n      ]\n    },\n    \"f16_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1395,\n        2312\n      ]\n    },\n    \"f16_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1475,\n        2312\n      ]\n    },\n    \"f16_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Audio Rate Pan.amxd\\\"\",\n      \"pos\": [\n        1325,\n        2392\n      ],\n      \"size\": [\n        496,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1319.0,\n        496,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_16\"\n      }\n    },\n    \"f16_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_L\",\n      \"pos\": [\n        1325,\n        2623\n      ]\n    },\n    \"f16_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_R\",\n      \"pos\": [\n        1465,\n        2623\n      ]\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        534,\n        1287.0,\n        340,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 amxd DopplerPan\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        542,\n        1293.0,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      }\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        575,\n        2723\n      ],\n      \"presentation\": [\n        542,\n        1293.0,\n        264,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        575,\n        2753\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        575,\n        2783\n      ]\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 amxd~ Max DopplerPan.amxd \\u2014 Doppler panner synced to the transport\",\n      \"pos\": [\n        30,\n        2723\n      ],\n      \"size\": [\n        535,\n        20\n      ]\n    },\n    \"f17_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        2753\n      ],\n      \"presentation\": [\n        816,\n        1293.0,\n        50,\n        22\n      ]\n    },\n    \"f17_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        2753\n      ]\n    },\n    \"f17_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        2753\n      ]\n    },\n    \"f17_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max DopplerPan.amxd\\\"\",\n      \"pos\": [\n        30,\n        2833\n      ],\n      \"size\": [\n        320,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        542,\n        1319.0,\n        320,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_17\"\n      }\n    },\n    \"f17_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_L\",\n      \"pos\": [\n        30,\n        3064\n      ]\n    },\n    \"f17_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_R\",\n      \"pos\": [\n        170,\n        3064\n      ]\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        882,\n        1287.0,\n        356,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 amxd Warpoon\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        890,\n        1293.0,\n        280,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      }\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1238,\n        2723\n      ],\n      \"presentation\": [\n        890,\n        1293.0,\n        280,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        1238,\n        2753\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1238,\n        2783\n      ]\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 amxd~ Warpoon.amxd \\u2014 ambient chorus, four modulated stereo taps\",\n      \"pos\": [\n        715,\n        2723\n      ],\n      \"size\": [\n        513,\n        20\n      ]\n    },\n    \"f18_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        715,\n        2753\n      ],\n      \"presentation\": [\n        1180,\n        1293.0,\n        50,\n        22\n      ]\n    },\n    \"f18_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        785,\n        2753\n      ]\n    },\n    \"f18_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        865,\n        2753\n      ]\n    },\n    \"f18_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Warpoon.amxd\",\n      \"pos\": [\n        715,\n        2833\n      ],\n      \"size\": [\n        336,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        890,\n        1319.0,\n        336,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_18\"\n      }\n    },\n    \"f18_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1015,\n        2753\n      ]\n    },\n    \"f18_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry_level 100.\",\n      \"pos\": [\n        1015,\n        2793\n      ]\n    },\n    \"f18_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_L\",\n      \"pos\": [\n        715,\n        3064\n      ]\n    },\n    \"f18_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_R\",\n      \"pos\": [\n        855,\n        3064\n      ]\n    },\n    \"f19_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1539.0,\n        316,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f19_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 amxd Nebula\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1545.0,\n        240,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_19\"\n      }\n    },\n    \"f19_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1952,\n        2723\n      ],\n      \"presentation\": [\n        18,\n        1545.0,\n        240,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f19_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"18\",\n      \"pos\": [\n        1952,\n        2753\n      ]\n    },\n    \"f19_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1952,\n        2783\n      ]\n    },\n    \"f19_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"19 \\u00b7 amxd~ Nebula.amxd \\u2014 amplitude / phase-inversion swirl for stereo width\",\n      \"pos\": [\n        1378,\n        2723\n      ],\n      \"size\": [\n        564,\n        20\n      ]\n    },\n    \"f19_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1378,\n        2753\n      ],\n      \"presentation\": [\n        268,\n        1545.0,\n        50,\n        22\n      ]\n    },\n    \"f19_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1448,\n        2753\n      ]\n    },\n    \"f19_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1528,\n        2753\n      ]\n    },\n    \"f19_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Nebula.amxd\",\n      \"pos\": [\n        1378,\n        2833\n      ],\n      \"size\": [\n        296,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1571.0,\n        296,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_19\"\n      }\n    },\n    \"f19_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX19_L\",\n      \"pos\": [\n        1378,\n        3064\n      ]\n    },\n    \"f19_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX19_R\",\n      \"pos\": [\n        1518,\n        3064\n      ]\n    },\n    \"f20_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        334,\n        1539.0,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f20_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 amxd Pendulum\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        342,\n        1545.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_20\"\n      }\n    },\n    \"f20_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        553,\n        3164\n      ],\n      \"presentation\": [\n        342,\n        1545.0,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f20_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"19\",\n      \"pos\": [\n        553,\n        3194\n      ]\n    },\n    \"f20_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        553,\n        3224\n      ]\n    },\n    \"f20_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"20 \\u00b7 amxd~ Pendulum.amxd \\u2014 four-tap delay swept by a ramp oscillator\",\n      \"pos\": [\n        30,\n        3164\n      ],\n      \"size\": [\n        513,\n        20\n      ]\n    },\n    \"f20_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        3194\n      ],\n      \"presentation\": [\n        556,\n        1545.0,\n        50,\n        22\n      ]\n    },\n    \"f20_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        3194\n      ]\n    },\n    \"f20_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        3194\n      ]\n    },\n    \"f20_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Pendulum.amxd\",\n      \"pos\": [\n        30,\n        3274\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        342,\n        1571.0,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_20\"\n      }\n    },\n    \"f20_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        3194\n      ]\n    },\n    \"f20_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        330,\n        3234\n      ]\n    },\n    \"f20_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX20_L\",\n      \"pos\": [\n        30,\n        3505\n      ]\n    },\n    \"f20_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX20_R\",\n      \"pos\": [\n        170,\n        3505\n      ]\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201320 are the effects\",\n      \"pos\": [\n        30,\n        3605\n      ],\n      \"size\": [\n        1200,\n        34\n      ]\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3665\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 20 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3715\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3765\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        3665\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        3665\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        3665\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        3665\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        3665\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        3665\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        3665\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        3665\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        3665\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        3665\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        3665\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        3665\n      ]\n    },\n    \"mx_L_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_L\",\n      \"pos\": [\n        1200,\n        3665\n      ]\n    },\n    \"mx_L_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_L\",\n      \"pos\": [\n        1290,\n        3665\n      ]\n    },\n    \"mx_L_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_L\",\n      \"pos\": [\n        1380,\n        3665\n      ]\n    },\n    \"mx_L_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_L\",\n      \"pos\": [\n        1470,\n        3665\n      ]\n    },\n    \"mx_L_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_L\",\n      \"pos\": [\n        1560,\n        3665\n      ]\n    },\n    \"mx_L_19\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX19_L\",\n      \"pos\": [\n        1650,\n        3665\n      ]\n    },\n    \"mx_L_20\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX20_L\",\n      \"pos\": [\n        1740,\n        3665\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3795\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 20 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3845\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3895\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3795\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3795\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3795\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3795\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3795\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3795\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3795\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3795\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3795\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3795\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3795\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3795\n      ]\n    },\n    \"mx_R_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_R\",\n      \"pos\": [\n        1200,\n        3795\n      ]\n    },\n    \"mx_R_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_R\",\n      \"pos\": [\n        1290,\n        3795\n      ]\n    },\n    \"mx_R_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_R\",\n      \"pos\": [\n        1380,\n        3795\n      ]\n    },\n    \"mx_R_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_R\",\n      \"pos\": [\n        1470,\n        3795\n      ]\n    },\n    \"mx_R_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_R\",\n      \"pos\": [\n        1560,\n        3795\n      ]\n    },\n    \"mx_R_19\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX19_R\",\n      \"pos\": [\n        1650,\n        3795\n      ]\n    },\n    \"mx_R_20\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX20_R\",\n      \"pos\": [\n        1740,\n        3795\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3945\n      ],\n      \"size\": [\n        700,\n        20\n      ]\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        3975\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        3975\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        3975\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        3975\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        3975\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        3975\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        4015\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        4015\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        4065\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        4065\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        4065\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        4065\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        4125\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ]\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        4205\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ]\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3945\n      ],\n      \"size\": [\n        400,\n        20\n      ]\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        3975\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        4015\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ]\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        4055\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ]\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        4095\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        4135\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        4135\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        4175\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        4175\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        4215\n      ]\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        4215\n      ]\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1360,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        482\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1430,\n        4275\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        482\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37.0\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      }\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"tr_lm\",\n      0,\n      \"tr_bpm\",\n      0\n    ],\n    [\n      \"tr_bpm\",\n      0,\n      \"tr_tempo\",\n      0\n    ],\n    [\n      \"tr_tempo\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"tr_run\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rL\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rR\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c1\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c2\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c3\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c4\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c5\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c6\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c7\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      1,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f02_rwo\",\n      0,\n      \"f02_wet\",\n      0\n    ],\n    [\n      \"f02_wet\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rL\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rR\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c2\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c3\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c4\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c5\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c6\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c7\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      1,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f03_rwo\",\n      0,\n      \"f03_wet\",\n      0\n    ],\n    [\n      \"f03_wet\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c2\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c3\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c4\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c5\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f04_rwo\",\n      0,\n      \"f04_wet\",\n      0\n    ],\n    [\n      \"f04_wet\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rL\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rR\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c2\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c3\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c4\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c5\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c6\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      1,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f05_rwo\",\n      0,\n      \"f05_wet\",\n      0\n    ],\n    [\n      \"f05_wet\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c1\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c2\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c3\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c4\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c5\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f06_rwo\",\n      0,\n      \"f06_wet\",\n      0\n    ],\n    [\n      \"f06_wet\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c1\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c2\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c3\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c4\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c5\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f07_rwo\",\n      0,\n      \"f07_wet\",\n      0\n    ],\n    [\n      \"f07_wet\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rM\",\n      0,\n      \"f08_bp\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rM\",\n      0,\n      \"f09_bp\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      1,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_rwo\",\n      0,\n      \"f11_wet\",\n      0\n    ],\n    [\n      \"f11_wet\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_rwo\",\n      0,\n      \"f12_wet\",\n      0\n    ],\n    [\n      \"f12_wet\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_open\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_rwo\",\n      0,\n      \"f13_wet\",\n      0\n    ],\n    [\n      \"f13_wet\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_open\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rL\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rR\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f14_rwo\",\n      0,\n      \"f14_wet\",\n      0\n    ],\n    [\n      \"f14_wet\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sL\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      1,\n      \"f14_sR\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_open\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rL\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rR\",\n      0,\n      \"f15_obj\",\n      1\n    ],\n    [\n      \"f15_rwo\",\n      0,\n      \"f15_wet\",\n      0\n    ],\n    [\n      \"f15_wet\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sL\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      1,\n      \"f15_sR\",\n      0\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_open\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_rL\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_rR\",\n      0,\n      \"f16_obj\",\n      1\n    ],\n    [\n      \"f16_obj\",\n      0,\n      \"f16_sL\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      1,\n      \"f16_sR\",\n      0\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_open\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_rL\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_rR\",\n      0,\n      \"f17_obj\",\n      1\n    ],\n    [\n      \"f17_obj\",\n      0,\n      \"f17_sL\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      1,\n      \"f17_sR\",\n      0\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_open\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_rL\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_rR\",\n      0,\n      \"f18_obj\",\n      1\n    ],\n    [\n      \"f18_rwo\",\n      0,\n      \"f18_wet\",\n      0\n    ],\n    [\n      \"f18_wet\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      0,\n      \"f18_sL\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      1,\n      \"f18_sR\",\n      0\n    ],\n    [\n      \"f19_tbtn\",\n      0,\n      \"f19_tsel\",\n      0\n    ],\n    [\n      \"f19_tsel\",\n      0,\n      \"f19_tsend\",\n      0\n    ],\n    [\n      \"f19_open\",\n      0,\n      \"f19_obj\",\n      0\n    ],\n    [\n      \"f19_rL\",\n      0,\n      \"f19_obj\",\n      0\n    ],\n    [\n      \"f19_rR\",\n      0,\n      \"f19_obj\",\n      1\n    ],\n    [\n      \"f19_obj\",\n      0,\n      \"f19_sL\",\n      0\n    ],\n    [\n      \"f19_obj\",\n      1,\n      \"f19_sR\",\n      0\n    ],\n    [\n      \"f20_tbtn\",\n      0,\n      \"f20_tsel\",\n      0\n    ],\n    [\n      \"f20_tsel\",\n      0,\n      \"f20_tsend\",\n      0\n    ],\n    [\n      \"f20_open\",\n      0,\n      \"f20_obj\",\n      0\n    ],\n    [\n      \"f20_rL\",\n      0,\n      \"f20_obj\",\n      0\n    ],\n    [\n      \"f20_rR\",\n      0,\n      \"f20_obj\",\n      1\n    ],\n    [\n      \"f20_rwo\",\n      0,\n      \"f20_wet\",\n      0\n    ],\n    [\n      \"f20_wet\",\n      0,\n      \"f20_obj\",\n      0\n    ],\n    [\n      \"f20_obj\",\n      0,\n      \"f20_sL\",\n      0\n    ],\n    [\n      \"f20_obj\",\n      1,\n      \"f20_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"mx_L_14\",\n      0,\n      \"sel_L\",\n      14\n    ],\n    [\n      \"mx_L_15\",\n      0,\n      \"sel_L\",\n      15\n    ],\n    [\n      \"mx_L_16\",\n      0,\n      \"sel_L\",\n      16\n    ],\n    [\n      \"mx_L_17\",\n      0,\n      \"sel_L\",\n      17\n    ],\n    [\n      \"mx_L_18\",\n      0,\n      \"sel_L\",\n      18\n    ],\n    [\n      \"mx_L_19\",\n      0,\n      \"sel_L\",\n      19\n    ],\n    [\n      \"mx_L_20\",\n      0,\n      \"sel_L\",\n      20\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mx_R_14\",\n      0,\n      \"sel_R\",\n      14\n    ],\n    [\n      \"mx_R_15\",\n      0,\n      \"sel_R\",\n      15\n    ],\n    [\n      \"mx_R_16\",\n      0,\n      \"sel_R\",\n      16\n    ],\n    [\n      \"mx_R_17\",\n      0,\n      \"sel_R\",\n      17\n    ],\n    [\n      \"mx_R_18\",\n      0,\n      \"sel_R\",\n      18\n    ],\n    [\n      \"mx_R_19\",\n      0,\n      \"sel_R\",\n      19\n    ],\n    [\n      \"mx_R_20\",\n      0,\n      \"sel_R\",\n      20\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-7",
            0
          ],
          "source": [
            "obj-4",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-6",
            1
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
            1
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
            "obj-11",
            0
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
            "obj-13",
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
            "obj-15",
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
            "obj-16",
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
            "obj-16",
            1
          ],
          "source": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-17",
            0
          ],
          "source": [
            "obj-16",
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
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-20",
            0
          ],
          "source": [
            "obj-3",
            1
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
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-20",
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
            "obj-20",
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
            "obj-24",
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
            "obj-24",
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
            "obj-25",
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
            "obj-28",
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
            "obj-31",
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
            "obj-33",
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
            "obj-36",
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
            "obj-45",
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
            "obj-52",
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
            "obj-57",
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
            "obj-57",
            1
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
            "obj-57",
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
            "obj-57",
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
            "obj-57",
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
            "obj-57",
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
            "obj-57",
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
            "obj-57",
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
            "obj-66",
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
            "obj-67",
            0
          ],
          "source": [
            "obj-57",
            1
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
            "obj-57",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-78",
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
            "obj-87",
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
            "obj-88",
            0
          ],
          "source": [
            "obj-78",
            1
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
            "obj-78",
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
            "obj-99",
            1
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
            "obj-99",
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
            "obj-99",
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
            "obj-99",
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
            "obj-99",
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
            "obj-99",
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
            "obj-99",
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
            "obj-106",
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
            "obj-107",
            0
          ],
          "source": [
            "obj-99",
            1
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
            "obj-99",
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
            "obj-118",
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
            1
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
            "obj-118",
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
            "obj-118",
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
            "obj-118",
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
            "obj-118",
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
            "obj-118",
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
            "obj-118",
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
            "obj-118",
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
            "obj-126",
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
            "obj-127",
            0
          ],
          "source": [
            "obj-118",
            1
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
            "obj-118",
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
            "obj-134",
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
            "obj-138",
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
            "obj-138",
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
            "obj-138",
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
            "obj-138",
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
            "obj-138",
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
            "obj-138",
            0
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
            "obj-138",
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
            "obj-138",
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
            "obj-138",
            1
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
            "obj-138",
            0
          ],
          "source": [
            "obj-148",
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
            "obj-157",
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
            1
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
            "obj-157",
            0
          ],
          "source": [
            "obj-159",
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
            "obj-160",
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
            "obj-161",
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
            "obj-162",
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
            "obj-163",
            0
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
            "obj-157",
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
            "obj-157",
            1
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
            "obj-157",
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
            "obj-177",
            0
          ],
          "source": [
            "obj-175",
            1
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
            "obj-183",
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
            "obj-186",
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
            "obj-188",
            0
          ],
          "source": [
            "obj-186",
            1
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
            "obj-199",
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
            "obj-199",
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
            "obj-199",
            1
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
            "obj-199",
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
            "obj-202",
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
            "obj-203",
            0
          ],
          "source": [
            "obj-199",
            1
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
            "obj-208",
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
            "obj-213",
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
      },
      {
        "patchline": {
          "destination": [
            "obj-213",
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
            "obj-216",
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
            "obj-213",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-221",
            0
          ],
          "source": [
            "obj-220",
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
            "obj-227",
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
            "obj-227",
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
            "obj-227",
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
            "obj-227",
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
            "obj-230",
            0
          ],
          "source": [
            "obj-227",
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
            "obj-227",
            1
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
            "obj-234",
            0
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
            "obj-235",
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
            "obj-238",
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
            "obj-239",
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
            "obj-240",
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
            "obj-241",
            0
          ],
          "source": [
            "obj-243",
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
            "obj-245",
            0
          ],
          "source": [
            "obj-241",
            1
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
            "obj-255",
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
            "obj-255",
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
            "obj-255",
            1
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
            "obj-255",
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
            "obj-258",
            0
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
            "obj-259",
            0
          ],
          "source": [
            "obj-255",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-263",
            0
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
            "obj-269",
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
            "obj-269",
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
      },
      {
        "patchline": {
          "destination": [
            "obj-269",
            0
          ],
          "source": [
            "obj-271",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-272",
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
            "obj-273",
            0
          ],
          "source": [
            "obj-269",
            1
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
            "obj-278",
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
            "obj-283",
            0
          ],
          "source": [
            "obj-280",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-283",
            0
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
            "obj-283",
            1
          ],
          "source": [
            "obj-282",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-284",
            0
          ],
          "source": [
            "obj-283",
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
            "obj-283",
            1
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
            "obj-290",
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
            "obj-295",
            0
          ],
          "source": [
            "obj-292",
            0
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
            "obj-293",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-295",
            1
          ],
          "source": [
            "obj-294",
            0
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
            "obj-295",
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
            "obj-295",
            1
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
            "obj-302",
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
            "obj-307",
            0
          ],
          "source": [
            "obj-304",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-307",
            0
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
            "obj-307",
            1
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
            "obj-307",
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
            "obj-310",
            0
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
            "obj-311",
            0
          ],
          "source": [
            "obj-307",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-315",
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
            "obj-316",
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
            "obj-321",
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
            "obj-321",
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
            1
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
            "obj-322",
            0
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
            "obj-323",
            0
          ],
          "source": [
            "obj-321",
            1
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
            "obj-331",
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
            "obj-332",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-335",
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
            "obj-333",
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
            "obj-336",
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
            "obj-337",
            0
          ],
          "source": [
            "obj-333",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            0
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
            "obj-341",
            0
          ],
          "source": [
            "obj-340",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            2
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
            "obj-340",
            3
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
            "obj-340",
            4
          ],
          "source": [
            "obj-344",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            5
          ],
          "source": [
            "obj-345",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            6
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
            "obj-340",
            7
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
            "obj-340",
            8
          ],
          "source": [
            "obj-348",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            9
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
            "obj-340",
            10
          ],
          "source": [
            "obj-350",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            11
          ],
          "source": [
            "obj-351",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            12
          ],
          "source": [
            "obj-352",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            13
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
            "obj-340",
            14
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
            "obj-340",
            15
          ],
          "source": [
            "obj-355",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            16
          ],
          "source": [
            "obj-356",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            17
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
            "obj-340",
            18
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
            "obj-340",
            19
          ],
          "source": [
            "obj-359",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-340",
            20
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
            "obj-362",
            0
          ],
          "source": [
            "obj-361",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-363",
            0
          ],
          "source": [
            "obj-362",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            2
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
            "obj-362",
            3
          ],
          "source": [
            "obj-365",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            4
          ],
          "source": [
            "obj-366",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            5
          ],
          "source": [
            "obj-367",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            6
          ],
          "source": [
            "obj-368",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            7
          ],
          "source": [
            "obj-369",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            8
          ],
          "source": [
            "obj-370",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            9
          ],
          "source": [
            "obj-371",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            10
          ],
          "source": [
            "obj-372",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            11
          ],
          "source": [
            "obj-373",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            12
          ],
          "source": [
            "obj-374",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            13
          ],
          "source": [
            "obj-375",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            14
          ],
          "source": [
            "obj-376",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            15
          ],
          "source": [
            "obj-377",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            16
          ],
          "source": [
            "obj-378",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            17
          ],
          "source": [
            "obj-379",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            18
          ],
          "source": [
            "obj-380",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            19
          ],
          "source": [
            "obj-381",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-362",
            20
          ],
          "source": [
            "obj-382",
            0
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
            "obj-384",
            0
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
            "obj-385",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-393",
            0
          ],
          "source": [
            "obj-386",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-394",
            0
          ],
          "source": [
            "obj-387",
            0
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
            "obj-388",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-395",
            0
          ],
          "source": [
            "obj-389",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-392",
            1
          ],
          "source": [
            "obj-390",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-393",
            1
          ],
          "source": [
            "obj-390",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-394",
            1
          ],
          "source": [
            "obj-391",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-395",
            1
          ],
          "source": [
            "obj-391",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-396",
            0
          ],
          "source": [
            "obj-392",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-396",
            0
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
            "obj-396",
            1
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
            "obj-396",
            1
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
            "obj-397",
            0
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
            "obj-397",
            1
          ],
          "source": [
            "obj-396",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-400",
            0
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
            "obj-401",
            0
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
            "obj-402",
            0
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
            "obj-403",
            0
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
            "obj-404",
            0
          ],
          "source": [
            "obj-402",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-405",
            0
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
            "obj-406",
            0
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
            "obj-407",
            0
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
            "obj-408",
            0
          ],
          "source": [
            "obj-406",
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
