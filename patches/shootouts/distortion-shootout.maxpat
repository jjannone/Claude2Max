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
          "text": "DISTORTION SHOOTOUT \u2014 MSP and Ableton distortion, saturation, waveshaping and lo-fi objects. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 18, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
            389.0
          ],
          "num_lines_patching": 18,
          "num_lines_presentation": 18,
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
                "2 overdrive~",
                "3 degrade~",
                "4 *~ clip~",
                "5 *~ tanh~",
                "6 *~ pong~",
                "7 round~",
                "8 downsamp~",
                "9 deltaclip~",
                "10 abl distortion~",
                "11 abl overdrive~",
                "12 abl fuzz~",
                "13 abl saturator~",
                "14 abl waveshaper~",
                "15 abl expshaper~",
                "16 abl redux~",
                "17 abl roar~",
                "18 abl drumbuss~"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 17,
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
          "text": "v8 fx-shootout-highlight.js 18 @embed 1",
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
          "id": "obj-41",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            60.0,
            127.0,
            20.0
          ],
          "text": "2 \u00b7 overdrive~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            465.0,
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
          "id": "obj-42",
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
            465.0,
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
          "id": "obj-43",
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
          "id": "obj-44",
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
          "id": "obj-45",
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
          "text": "2 \u00b7 overdrive~ \u2014 soft-clipping distortion, drive 1\u201310"
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
            30.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            672.0,
            90.0,
            22.0
          ],
          "text": "overdrive~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            515.0,
            160.0,
            22.0
          ]
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
            160.0,
            590.0,
            104.0,
            22.0
          ],
          "text": "loadmess 4.0"
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            160.0,
            620.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 1.0,
          "maximum": 10.0
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
            86.0,
            110.0,
            20.0
          ],
          "text": "drive (1\u201310)",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            491.0,
            104.0,
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
          "id": "obj-51",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            543.0,
            160.0,
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
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
            120.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
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
            110.0,
            20.0
          ],
          "text": "3 \u00b7 degrade~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            465.0,
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
          "id": "obj-56",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            465.0,
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
          "id": "obj-57",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
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
            1110.0,
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
            640.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "3 \u00b7 degrade~ \u2014 sample-rate and bit-depth reduction"
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
            640.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            640.0,
            672.0,
            76.0,
            22.0
          ],
          "text": "degrade~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            556.0,
            160.0,
            22.0
          ]
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
            770.0,
            590.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            770.0,
            620.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 0.01,
          "maximum": 1.0
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
            144.0,
            20.0
          ],
          "text": "rate ratio (0\u20131)",
          "presentation": 1,
          "presentation_rect": [
            258.0,
            491.0,
            104.0,
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            590.0,
            90.0,
            22.0
          ],
          "text": "loadmess 8"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            910.0,
            620.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            530.0,
            50.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 24
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
            42.0,
            20.0
          ],
          "text": "bits",
          "presentation": 1,
          "presentation_rect": [
            258.0,
            532.0,
            104.0,
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
          "id": "obj-68",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            584.0,
            160.0,
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
          "id": "obj-69",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
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
            242.0,
            127.0,
            20.0
          ],
          "text": "4 \u00b7 *~ \u2192 clip~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            465.0,
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
          "id": "obj-73",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1720.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            465.0,
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
          "id": "obj-74",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1720.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1720.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "4 \u00b7 *~ 6 \u2192 clip~ -1. 1. \u2014 hard clipping after a gain stage"
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
            1250.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            1250.0,
            720.0,
            104.0,
            22.0
          ],
          "text": "clip~ -1. 1.",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            515.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            1250.0,
            660.0,
            40.0,
            22.0
          ],
          "text": "*~"
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
            1530.0,
            590.0,
            104.0,
            22.0
          ],
          "text": "loadmess 6.0"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1530.0,
            620.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 1.0,
          "maximum": 40.0
        }
      },
      {
        "box": {
          "id": "obj-82",
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
          "text": "drive (gain)",
          "presentation": 1,
          "presentation_rect": [
            442.0,
            491.0,
            104.0,
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
          "id": "obj-83",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            294.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            543.0,
            160.0,
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
          "id": "obj-84",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            765.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
        }
      },
      {
        "box": {
          "id": "obj-85",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1340.0,
            765.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            127.0,
            20.0
          ],
          "text": "5 \u00b7 *~ \u2192 tanh~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            465.0,
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
          "id": "obj-88",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            465.0,
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
          "id": "obj-89",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            500.0,
            925.0,
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
            30.0,
            865.0,
            460.0,
            20.0
          ],
          "text": "5 \u00b7 *~ 8 \u2192 tanh~ \u2014 smooth saturation after a gain stage"
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
            30.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
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
            30.0,
            1065.0,
            55.0,
            22.0
          ],
          "text": "tanh~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            515.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            1005.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            935.0,
            104.0,
            22.0
          ],
          "text": "loadmess 8.0"
        }
      },
      {
        "box": {
          "id": "obj-96",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            310.0,
            965.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 1.0,
          "maximum": 40.0
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
            110.0,
            20.0
          ],
          "text": "drive (gain)",
          "presentation": 1,
          "presentation_rect": [
            626.0,
            491.0,
            104.0,
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
          "id": "obj-98",
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
            570.0,
            543.0,
            160.0,
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
          "id": "obj-99",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1110.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
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
            120.0,
            1110.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
        }
      },
      {
        "box": {
          "id": "obj-102",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            398.0,
            127.0,
            20.0
          ],
          "text": "6 \u00b7 *~ \u2192 pong~",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            465.0,
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
          "id": "obj-103",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1260.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            465.0,
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
          "id": "obj-104",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1260.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "5"
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
            1260.0,
            925.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            865.0,
            610.0,
            20.0
          ],
          "text": "6 \u00b7 *~ 3 \u2192 pong~ 0 -0.3 0.3 \u2014 wavefolding (mode fold / wrap / clip)"
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
            640.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            640.0,
            1065.0,
            132.0,
            22.0
          ],
          "text": "pong~ 0 -0.3 0.3",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            539.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            640.0,
            1005.0,
            40.0,
            22.0
          ],
          "text": "*~"
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
            1070.0,
            935.0,
            104.0,
            22.0
          ],
          "text": "loadmess 3.0"
        }
      },
      {
        "box": {
          "id": "obj-111",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1070.0,
            965.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 1.0,
          "maximum": 20.0
        }
      },
      {
        "box": {
          "id": "obj-112",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            424.0,
            110.0,
            20.0
          ],
          "text": "drive (gain)",
          "presentation": 1,
          "presentation_rect": [
            810.0,
            491.0,
            104.0,
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
          "id": "obj-113",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            920.0,
            935.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            513.0,
            160.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            450.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            567.0,
            160.0,
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
          "id": "obj-115",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1110.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
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
            730.0,
            1110.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            476.0,
            93.0,
            20.0
          ],
          "text": "7 \u00b7 round~",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            465.0,
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
          "id": "obj-119",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1923.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            465.0,
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
          "id": "obj-120",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1923.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            1923.0,
            925.0,
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
            1400.0,
            865.0,
            513.0,
            20.0
          ],
          "text": "7 \u00b7 round~ \u2014 quantises the signal to a step (bit-crush by amplitude)"
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
            1400.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            1400.0,
            1017.0,
            62.0,
            22.0
          ],
          "text": "round~",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            515.0,
            160.0,
            22.0
          ]
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
            1530.0,
            935.0,
            104.0,
            22.0
          ],
          "text": "loadmess 0.1"
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1530.0,
            965.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 0.001,
          "maximum": 1.0
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
            42.0,
            20.0
          ],
          "text": "step",
          "presentation": 1,
          "presentation_rect": [
            994.0,
            491.0,
            104.0,
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
          "id": "obj-128",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            543.0,
            160.0,
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
          "id": "obj-129",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1400.0,
            1062.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            1490.0,
            1062.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
        }
      },
      {
        "box": {
          "id": "obj-132",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
            118.0,
            20.0
          ],
          "text": "8 \u00b7 downsamp~",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            465.0,
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
          "varname": "TITLE_08"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1210.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            465.0,
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
          "id": "obj-134",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1240.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-135",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            1270.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1210.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 downsamp~ \u2014 sample-and-hold every N samples"
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
            30.0,
            1240.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            1362.0,
            83.0,
            22.0
          ],
          "text": "downsamp~",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            515.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            1280.0,
            97.0,
            22.0
          ],
          "text": "loadmess 32"
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            160.0,
            1310.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 512
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
            580.0,
            127.0,
            20.0
          ],
          "text": "hold (samples)",
          "presentation": 1,
          "presentation_rect": [
            1178.0,
            491.0,
            104.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            543.0,
            160.0,
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
          "id": "obj-143",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1407.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
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
            120.0,
            1407.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
        }
      },
      {
        "box": {
          "id": "obj-146",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
            127.0,
            20.0
          ],
          "text": "9 \u00b7 deltaclip~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            630.0,
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
          "varname": "TITLE_09"
        }
      },
      {
        "box": {
          "id": "obj-147",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1210.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            630.0,
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
          "id": "obj-148",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1240.0,
            40.0,
            22.0
          ],
          "text": "8"
        }
      },
      {
        "box": {
          "id": "obj-149",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1110.0,
            1270.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            1210.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 deltaclip~ \u2014 slew-rate limiting as distortion"
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1240.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            640.0,
            1362.0,
            90.0,
            22.0
          ],
          "text": "deltaclip~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            704.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-153",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            770.0,
            1280.0,
            118.0,
            22.0
          ],
          "text": "loadmess -0.02"
        }
      },
      {
        "box": {
          "id": "obj-154",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            770.0,
            1310.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            654.0,
            50.0,
            22.0
          ],
          "minimum": -1.0,
          "maximum": 0.0
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
            84.0,
            20.0
          ],
          "text": "min slope",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            656.0,
            104.0,
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
          "id": "obj-156",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            1280.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.02"
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            910.0,
            1310.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            678.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            684.0,
            84.0,
            20.0
          ],
          "text": "max slope",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            680.0,
            104.0,
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
          "id": "obj-159",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            732.0,
            160.0,
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1407.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
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
            730.0,
            1407.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
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
            736.0,
            178.0,
            20.0
          ],
          "text": "10 \u00b7 abl distortion~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            630.0,
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
          "varname": "TITLE_10"
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
            1820.0,
            1210.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            630.0,
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
          "id": "obj-165",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1820.0,
            1240.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1820.0,
            1270.0,
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
            1250.0,
            1210.0,
            560.0,
            20.0
          ],
          "text": "10 \u00b7 abl.dsp.distortion~ \u2014 Live's Pedal, distortion mode"
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
            1250.0,
            1240.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1330.0,
            1240.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1250.0,
            1492.0,
            209.0,
            22.0
          ],
          "text": "abl.dsp.distortion~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            824.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1380.0,
            1280.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-172",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1400.0,
            1306.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "bass",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-173",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1420.0,
            1332.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "mid",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-174",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1440.0,
            1358.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            726.0,
            160.0,
            22.0
          ],
          "attr": "midfreq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1460.0,
            1384.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            750.0,
            160.0,
            22.0
          ],
          "attr": "treble",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1480.0,
            1410.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            774.0,
            160.0,
            22.0
          ],
          "attr": "sub",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-177",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1500.0,
            1436.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            798.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            1250.0,
            1537.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1340.0,
            1537.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            1690.0,
            1240.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1690.0,
            1270.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            762.0,
            169.0,
            20.0
          ],
          "text": "11 \u00b7 abl overdrive~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            630.0,
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
          "varname": "TITLE_11"
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            600.0,
            1637.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            630.0,
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
          "id": "obj-185",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            600.0,
            1667.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            600.0,
            1697.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1637.0,
            560.0,
            20.0
          ],
          "text": "11 \u00b7 abl.dsp.overdrive~ \u2014 Live's Pedal, overdrive mode"
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
            30.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-189",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            1919.0,
            202.0,
            22.0
          ],
          "text": "abl.dsp.overdrive~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            824.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-191",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            1707.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            1733.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "bass",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            1759.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "mid",
          "text_width": 82.0
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
            220.0,
            1785.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            726.0,
            160.0,
            22.0
          ],
          "attr": "midfreq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            1811.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            750.0,
            160.0,
            22.0
          ],
          "attr": "treble",
          "text_width": 82.0
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
            260.0,
            1837.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            774.0,
            160.0,
            22.0
          ],
          "attr": "sub",
          "text_width": 82.0
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
            280.0,
            1863.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            798.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            30.0,
            1964.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
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
            120.0,
            1964.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
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
            470.0,
            1667.0,
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
            470.0,
            1697.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            788.0,
            127.0,
            20.0
          ],
          "text": "12 \u00b7 abl fuzz~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            630.0,
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
          "varname": "TITLE_12"
        }
      },
      {
        "box": {
          "id": "obj-204",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1310.0,
            1637.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            630.0,
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
          "id": "obj-205",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1310.0,
            1667.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-206",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1310.0,
            1697.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            740.0,
            1637.0,
            560.0,
            20.0
          ],
          "text": "12 \u00b7 abl.dsp.fuzz~ \u2014 Live's Pedal, fuzz mode"
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
            740.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            820.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            740.0,
            1919.0,
            167.0,
            22.0
          ],
          "text": "abl.dsp.fuzz~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            824.0,
            160.0,
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
            870.0,
            1707.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            890.0,
            1733.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "bass",
          "text_width": 82.0
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
            910.0,
            1759.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "mid",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            1785.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            726.0,
            160.0,
            22.0
          ],
          "attr": "midfreq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            950.0,
            1811.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            750.0,
            160.0,
            22.0
          ],
          "attr": "treble",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            970.0,
            1837.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            774.0,
            160.0,
            22.0
          ],
          "attr": "sub",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            1863.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            798.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            740.0,
            1964.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
        }
      },
      {
        "box": {
          "id": "obj-219",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            830.0,
            1964.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
        }
      },
      {
        "box": {
          "id": "obj-220",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1180.0,
            1667.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1180.0,
            1697.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            814.0,
            169.0,
            20.0
          ],
          "text": "13 \u00b7 abl saturator~",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            630.0,
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
          "varname": "TITLE_13"
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
            2000.0,
            1637.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            630.0,
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
          "id": "obj-225",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2000.0,
            1667.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            2000.0,
            1697.0,
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
            1450.0,
            1637.0,
            540.0,
            20.0
          ],
          "text": "13 \u00b7 abl.dsp.saturator~ \u2014 Live's Saturator"
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
            1450.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1530.0,
            1667.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-230",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1450.0,
            1893.0,
            272.0,
            22.0
          ],
          "text": "abl.dsp.saturator~ @mix 1. @drive 12",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            800.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1580.0,
            1707.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "drive",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-232",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1600.0,
            1733.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "curve",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-233",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1620.0,
            1759.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1640.0,
            1785.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            726.0,
            160.0,
            22.0
          ],
          "attr": "post_clip",
          "text_width": 82.0
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
            1660.0,
            1811.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            750.0,
            160.0,
            22.0
          ],
          "attr": "oversample",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1680.0,
            1837.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            774.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-237",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1450.0,
            1938.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
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
            1540.0,
            1938.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            1870.0,
            1667.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-240",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1870.0,
            1697.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
        }
      },
      {
        "box": {
          "id": "obj-242",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            178.0,
            20.0
          ],
          "text": "14 \u00b7 abl waveshaper~",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            630.0,
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
          "varname": "TITLE_14"
        }
      },
      {
        "box": {
          "id": "obj-243",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            640.0,
            2064.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            630.0,
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
          "id": "obj-244",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2094.0,
            40.0,
            22.0
          ],
          "text": "13"
        }
      },
      {
        "box": {
          "id": "obj-245",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            2124.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-246",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2064.0,
            600.0,
            20.0
          ],
          "text": "14 \u00b7 abl.dsp.waveshaper~ \u2014 Live's Saturator waveshaper"
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
            30.0,
            2094.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            2094.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-249",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            2398.0,
            279.0,
            22.0
          ],
          "text": "abl.dsp.waveshaper~ @mix 1. @drive 12",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            872.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            2134.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "drive",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-251",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            2160.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "shaper_drive",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            2186.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "curve",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-253",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            220.0,
            2212.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            726.0,
            160.0,
            22.0
          ],
          "attr": "depth",
          "text_width": 82.0
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
            240.0,
            2238.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            750.0,
            160.0,
            22.0
          ],
          "attr": "period",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-255",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            260.0,
            2264.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            774.0,
            160.0,
            22.0
          ],
          "attr": "linearity",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-256",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            280.0,
            2290.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            798.0,
            160.0,
            22.0
          ],
          "attr": "damping",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            2316.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            822.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-258",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            2342.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            846.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            30.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_L"
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
            120.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_R"
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
            510.0,
            2094.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-262",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            2124.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
        }
      },
      {
        "box": {
          "id": "obj-264",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
            169.0,
            20.0
          ],
          "text": "15 \u00b7 abl expshaper~",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            630.0,
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
          "varname": "TITLE_15"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1253.0,
            2064.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            630.0,
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
          "id": "obj-266",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1253.0,
            2094.0,
            40.0,
            22.0
          ],
          "text": "14"
        }
      },
      {
        "box": {
          "id": "obj-267",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1253.0,
            2124.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-268",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            2064.0,
            463.0,
            20.0
          ],
          "text": "15 \u00b7 abl.dsp.expshaper~ \u2014 exponential shaper (help file: 0.4)"
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
            780.0,
            2094.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-270",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            780.0,
            2216.0,
            174.0,
            22.0
          ],
          "text": "abl.dsp.expshaper~ 0.4",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            680.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            2134.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            654.0,
            160.0,
            22.0
          ],
          "attr": "amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-272",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            721.0,
            160.0,
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
          "id": "obj-273",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2261.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_L"
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            2261.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_R"
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
            918.0,
            135.0,
            20.0
          ],
          "text": "16 \u00b7 abl redux~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            935.0,
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
          "varname": "TITLE_16"
        }
      },
      {
        "box": {
          "id": "obj-277",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1963.0,
            2064.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            935.0,
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
          "id": "obj-278",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1963.0,
            2094.0,
            40.0,
            22.0
          ],
          "text": "15"
        }
      },
      {
        "box": {
          "id": "obj-279",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1963.0,
            2124.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1393.0,
            2064.0,
            560.0,
            20.0
          ],
          "text": "16 \u00b7 abl.device.redux~ \u2014 Live's Redux (downsample + bit reduction)"
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
            1393.0,
            2094.0,
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
            1473.0,
            2094.0,
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
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1393.0,
            2346.0,
            195.0,
            22.0
          ],
          "text": "abl.device.redux~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1129.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1523.0,
            2134.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            959.0,
            160.0,
            22.0
          ],
          "attr": "bitdepth",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-285",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1543.0,
            2160.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            983.0,
            160.0,
            22.0
          ],
          "attr": "rate",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-286",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1563.0,
            2186.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1007.0,
            160.0,
            22.0
          ],
          "attr": "shape",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-287",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1583.0,
            2212.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1031.0,
            160.0,
            22.0
          ],
          "attr": "jitter",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-288",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1603.0,
            2238.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1055.0,
            160.0,
            22.0
          ],
          "attr": "prefilter",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1623.0,
            2264.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1079.0,
            160.0,
            22.0
          ],
          "attr": "post_filter",
          "text_width": 82.0
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
            1643.0,
            2290.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1103.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-291",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1393.0,
            2391.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_L"
        }
      },
      {
        "box": {
          "id": "obj-292",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1483.0,
            2391.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_R"
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
            1833.0,
            2094.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1833.0,
            2124.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            127.0,
            20.0
          ],
          "text": "17 \u00b7 abl roar~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            935.0,
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
          "varname": "TITLE_17"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            640.0,
            2543.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            935.0,
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
          "id": "obj-298",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            2573.0,
            40.0,
            22.0
          ],
          "text": "16"
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
            640.0,
            2603.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-300",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2543.0,
            600.0,
            20.0
          ],
          "text": "17 \u00b7 abl.device.roar~ \u2014 Live's Roar three-stage saturator"
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2573.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            2573.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            30.0,
            2877.0,
            188.0,
            22.0
          ],
          "text": "abl.device.roar~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1177.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            2613.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            959.0,
            160.0,
            22.0
          ],
          "attr": "shaper_amount_1",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-305",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            2639.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            983.0,
            160.0,
            22.0
          ],
          "attr": "shaper_type_1",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            2665.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1007.0,
            160.0,
            22.0
          ],
          "attr": "routing",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            220.0,
            2691.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1031.0,
            160.0,
            22.0
          ],
          "attr": "filter_frequency_1",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-308",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            2717.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1055.0,
            160.0,
            22.0
          ],
          "attr": "tone_amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-309",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            260.0,
            2743.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1079.0,
            160.0,
            22.0
          ],
          "attr": "feedback_amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            280.0,
            2769.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1103.0,
            160.0,
            22.0
          ],
          "attr": "compressor_amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-311",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            2795.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1127.0,
            160.0,
            22.0
          ],
          "attr": "blend",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-312",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            2821.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            1151.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            30.0,
            2922.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_L"
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
            120.0,
            2922.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_R"
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
            510.0,
            2573.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            510.0,
            2603.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
        }
      },
      {
        "box": {
          "id": "obj-318",
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
          "text": "18 \u00b7 abl drumbuss~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            935.0,
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
          "varname": "TITLE_18"
        }
      },
      {
        "box": {
          "id": "obj-319",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1390.0,
            2543.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            935.0,
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
          "id": "obj-320",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1390.0,
            2573.0,
            40.0,
            22.0
          ],
          "text": "17"
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
            1390.0,
            2603.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-322",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            2543.0,
            600.0,
            20.0
          ],
          "text": "18 \u00b7 abl.device.drumbuss~ \u2014 Live's Drum Buss"
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
            780.0,
            2573.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            860.0,
            2573.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-325",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            780.0,
            2877.0,
            216.0,
            22.0
          ],
          "text": "abl.device.drumbuss~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1177.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-326",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            2613.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            959.0,
            160.0,
            22.0
          ],
          "attr": "drive",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-327",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            2639.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            983.0,
            160.0,
            22.0
          ],
          "attr": "distortion",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-328",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            950.0,
            2665.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1007.0,
            160.0,
            22.0
          ],
          "attr": "crunch",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-329",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            970.0,
            2691.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1031.0,
            160.0,
            22.0
          ],
          "attr": "boom",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-330",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            990.0,
            2717.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1055.0,
            160.0,
            22.0
          ],
          "attr": "boomfreq",
          "text_width": 82.0
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
            1010.0,
            2743.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1079.0,
            160.0,
            22.0
          ],
          "attr": "transients",
          "text_width": 82.0
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
            1030.0,
            2769.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1103.0,
            160.0,
            22.0
          ],
          "attr": "damping",
          "text_width": 82.0
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
            1050.0,
            2795.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1127.0,
            160.0,
            22.0
          ],
          "attr": "compressor",
          "text_width": 82.0
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
            1070.0,
            2821.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            1151.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-335",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2922.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_L"
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
            870.0,
            2922.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_R"
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
            1260.0,
            2573.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-338",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1260.0,
            2603.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            30.0,
            3022.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201318 are the effects"
        }
      },
      {
        "box": {
          "id": "obj-340",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3082.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-341",
          "maxclass": "newobj",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3132.0,
            209.0,
            22.0
          ],
          "text": "selector~ 18 1 @ramptime 30"
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
            30.0,
            3182.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            1110.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
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
            1200.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_L"
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
            1290.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_L"
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
            1380.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_L"
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
            1470.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_L"
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
            1560.0,
            3082.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_L"
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
            30.0,
            3212.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-361",
          "maxclass": "newobj",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3262.0,
            209.0,
            22.0
          ],
          "text": "selector~ 18 1 @ramptime 30"
        }
      },
      {
        "box": {
          "id": "obj-362",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3312.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            1020.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            1110.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
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
            1200.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_R"
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
            1290.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_R"
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
            1380.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_R"
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
            1470.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_R"
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
            1560.0,
            3212.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_R"
        }
      },
      {
        "box": {
          "id": "obj-380",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3362.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            3392.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            3392.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
        }
      },
      {
        "box": {
          "id": "obj-383",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            3392.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            3392.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            410.0,
            3392.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
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
            500.0,
            3392.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-387",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            3432.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-388",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            3432.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-389",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3482.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-390",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            3482.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-391",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            3482.0,
            40.0,
            22.0
          ],
          "text": "*~"
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
            500.0,
            3482.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-393",
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
            3542.0,
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
          "id": "obj-394",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3622.0,
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
          "id": "obj-395",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3362.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            3392.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-397",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            3432.0,
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
          "id": "obj-398",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            3472.0,
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
          "id": "obj-399",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            3512.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            3552.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            3552.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
        }
      },
      {
        "box": {
          "id": "obj-402",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            3592.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-403",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            3592.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-404",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3632.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
        }
      },
      {
        "box": {
          "id": "obj-405",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            930.0,
            3632.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-408",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            996.0,
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
          "id": "obj-409",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1022.0,
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
          "id": "obj-410",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1048.0,
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
          "id": "obj-411",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1074.0,
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
          "id": "obj-412",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1100.0,
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
          "id": "obj-413",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1126.0,
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
          "id": "obj-414",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1152.0,
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
          "id": "obj-415",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1178.0,
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
          "id": "obj-416",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1204.0,
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
          "id": "obj-417",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1230.0,
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
          "id": "obj-418",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1256.0,
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
          "id": "obj-419",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1282.0,
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
          "id": "obj-420",
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
          "id": "obj-40",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            459.0,
            176.0,
            114.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            459.0,
            176.0,
            155.0
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
          "id": "obj-71",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            378.0,
            459.0,
            176.0,
            114.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            562.0,
            459.0,
            176.0,
            114.0
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
          "id": "obj-101",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            746.0,
            459.0,
            176.0,
            138.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            930.0,
            459.0,
            176.0,
            114.0
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
          "id": "obj-131",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1114.0,
            459.0,
            176.0,
            114.0
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
          "id": "obj-145",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            624.0,
            176.0,
            138.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            624.0,
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
          "id": "obj-182",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            378.0,
            624.0,
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
          "id": "obj-202",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            562.0,
            624.0,
            176.0,
            234.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            746.0,
            624.0,
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
          "id": "obj-241",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            930.0,
            624.0,
            176.0,
            295.0
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
          "id": "obj-263",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1114.0,
            624.0,
            176.0,
            127.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            929.0,
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
          "id": "obj-295",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1080.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            929.0,
            176.0,
            295.0
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
          "id": "obj-317",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            378.0,
            929.0,
            176.0,
            295.0
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
          "id": "obj-406",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1220.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            600.0,
            439.0
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
          "id": "obj-407",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            3692.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            10.0,
            670.0,
            439.0
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
          "id": "obj-421",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2005.0,
            330.0,
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
            3752.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"DISTORTION SHOOTOUT \\u2014 MSP and Ableton distortion, saturation, waveshaping and lo-fi objects. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 18, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        389\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 18,\n        \"num_lines_presentation\": 18,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 overdrive~\",\n              \"3 degrade~\",\n              \"4 *~ clip~\",\n              \"5 *~ tanh~\",\n              \"6 *~ pong~\",\n              \"7 round~\",\n              \"8 downsamp~\",\n              \"9 deltaclip~\",\n              \"10 abl distortion~\",\n              \"11 abl overdrive~\",\n              \"12 abl fuzz~\",\n              \"13 abl saturator~\",\n              \"14 abl waveshaper~\",\n              \"15 abl expshaper~\",\n              \"16 abl redux~\",\n              \"17 abl roar~\",\n              \"18 abl drumbuss~\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 17,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 18,\n        \"num_lines_presentation\": 18,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 18 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 overdrive~\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        18,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        520\n      ],\n      \"presentation\": [\n        18,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        500,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 overdrive~ \\u2014 soft-clipping distortion, drive 1\\u201310\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"overdrive~\",\n      \"pos\": [\n        30,\n        672\n      ],\n      \"presentation\": [\n        18,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 4.0\",\n      \"pos\": [\n        160,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        160,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": 1.0,\n        \"maximum\": 10.0\n      },\n      \"presentation\": [\n        18,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1.0,\n        \"maximum\": 10.0\n      }\n    },\n    \"f02_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drive (1\\u201310)\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        74,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        459,\n        176,\n        155\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 degrade~\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        202,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        520\n      ],\n      \"presentation\": [\n        202,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1110,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 degrade~ \\u2014 sample-rate and bit-depth reduction\",\n      \"pos\": [\n        640,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        640,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"degrade~\",\n      \"pos\": [\n        640,\n        672\n      ],\n      \"presentation\": [\n        202,\n        556,\n        160,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f03_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        770,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        770,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": 0.01,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        202,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.01,\n        \"maximum\": 1.0\n      }\n    },\n    \"f03_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"rate ratio (0\\u20131)\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        258,\n        491,\n        104,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_c1_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 8\",\n      \"pos\": [\n        910,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"number\",\n      \"pos\": [\n        910,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 24\n      },\n      \"presentation\": [\n        202,\n        530,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1,\n        \"maximum\": 24\n      }\n    },\n    \"f03_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bits\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        42,\n        20\n      ],\n      \"presentation\": [\n        258,\n        532,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        202,\n        584,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        640,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        730,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        378,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 *~ \\u2192 clip~\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        386,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1720,\n        520\n      ],\n      \"presentation\": [\n        386,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1720,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1720,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 *~ 6 \\u2192 clip~ -1. 1. \\u2014 hard clipping after a gain stage\",\n      \"pos\": [\n        1250,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        1250,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"clip~ -1. 1.\",\n      \"pos\": [\n        1250,\n        720\n      ],\n      \"presentation\": [\n        386,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f04_pre\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        1250,\n        660\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f04_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 6.0\",\n      \"pos\": [\n        1530,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1530,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": 1.0,\n        \"maximum\": 40.0\n      },\n      \"presentation\": [\n        386,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1.0,\n        \"maximum\": 40.0\n      }\n    },\n    \"f04_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drive (gain)\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        442,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        386,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1250,\n        765\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1340,\n        765\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        562,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 *~ \\u2192 tanh~\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        570,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        865\n      ],\n      \"presentation\": [\n        570,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        500,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 *~ 8 \\u2192 tanh~ \\u2014 smooth saturation after a gain stage\",\n      \"pos\": [\n        30,\n        865\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"tanh~\",\n      \"pos\": [\n        30,\n        1065\n      ],\n      \"presentation\": [\n        570,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pre\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        1005\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f05_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 8.0\",\n      \"pos\": [\n        310,\n        935\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        310,\n        965\n      ],\n      \"attrs\": {\n        \"minimum\": 1.0,\n        \"maximum\": 40.0\n      },\n      \"presentation\": [\n        570,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1.0,\n        \"maximum\": 40.0\n      }\n    },\n    \"f05_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drive (gain)\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        626,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        570,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1110\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        120,\n        1110\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        746,\n        459,\n        176,\n        138\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 *~ \\u2192 pong~\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        754,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1260,\n        865\n      ],\n      \"presentation\": [\n        754,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1260,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1260,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 *~ 3 \\u2192 pong~ 0 -0.3 0.3 \\u2014 wavefolding (mode fold / wrap / clip)\",\n      \"pos\": [\n        640,\n        865\n      ],\n      \"size\": [\n        610,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        640,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"pong~ 0 -0.3 0.3\",\n      \"pos\": [\n        640,\n        1065\n      ],\n      \"presentation\": [\n        754,\n        539,\n        160,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f06_pre\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        640,\n        1005\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f06_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 3.0\",\n      \"pos\": [\n        1070,\n        935\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1070,\n        965\n      ],\n      \"attrs\": {\n        \"minimum\": 1.0,\n        \"maximum\": 20.0\n      },\n      \"presentation\": [\n        754,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1.0,\n        \"maximum\": 20.0\n      }\n    },\n    \"f06_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drive (gain)\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        810,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        920,\n        935\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        513,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mode\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f06_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        754,\n        567,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        640,\n        1110\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        730,\n        1110\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        930,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 round~\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        93,\n        20\n      ],\n      \"presentation\": [\n        938,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1923,\n        865\n      ],\n      \"presentation\": [\n        938,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1923,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1923,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 round~ \\u2014 quantises the signal to a step (bit-crush by amplitude)\",\n      \"pos\": [\n        1400,\n        865\n      ],\n      \"size\": [\n        513,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        1400,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"round~\",\n      \"pos\": [\n        1400,\n        1017\n      ],\n      \"presentation\": [\n        938,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f07_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.1\",\n      \"pos\": [\n        1530,\n        935\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1530,\n        965\n      ],\n      \"attrs\": {\n        \"minimum\": 0.001,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        938,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.001,\n        \"maximum\": 1.0\n      }\n    },\n    \"f07_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"step\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        42,\n        20\n      ],\n      \"presentation\": [\n        994,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        938,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1400,\n        1062\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1490,\n        1062\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1114,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 downsamp~\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1210\n      ],\n      \"presentation\": [\n        1122,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        500,\n        1240\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 downsamp~ \\u2014 sample-and-hold every N samples\",\n      \"pos\": [\n        30,\n        1210\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        1240\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"downsamp~\",\n      \"pos\": [\n        30,\n        1362\n      ],\n      \"presentation\": [\n        1122,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f08_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 32\",\n      \"pos\": [\n        160,\n        1280\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_c0\": {\n      \"type\": \"number\",\n      \"pos\": [\n        160,\n        1310\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 512\n      },\n      \"presentation\": [\n        1122,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 1,\n        \"maximum\": 512\n      }\n    },\n    \"f08_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"hold (samples)\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        1178,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1407\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        120,\n        1407\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        624,\n        176,\n        138\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 deltaclip~\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        18,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1210\n      ],\n      \"presentation\": [\n        18,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1110,\n        1240\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 deltaclip~ \\u2014 slew-rate limiting as distortion\",\n      \"pos\": [\n        640,\n        1210\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        640,\n        1240\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"deltaclip~\",\n      \"pos\": [\n        640,\n        1362\n      ],\n      \"presentation\": [\n        18,\n        704,\n        160,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f09_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess -0.02\",\n      \"pos\": [\n        770,\n        1280\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        770,\n        1310\n      ],\n      \"attrs\": {\n        \"minimum\": -1.0,\n        \"maximum\": 0.0\n      },\n      \"presentation\": [\n        18,\n        654,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": -1.0,\n        \"maximum\": 0.0\n      }\n    },\n    \"f09_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"min slope\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        84,\n        20\n      ],\n      \"presentation\": [\n        74,\n        656,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_c1_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.02\",\n      \"pos\": [\n        910,\n        1280\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_c1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        910,\n        1310\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        18,\n        678,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f09_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"max slope\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        84,\n        20\n      ],\n      \"presentation\": [\n        74,\n        680,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        732,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        640,\n        1407\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        730,\n        1407\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        624,\n        176,\n        247\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 abl distortion~\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        202,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1820,\n        1210\n      ],\n      \"presentation\": [\n        202,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1820,\n        1240\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1820,\n        1270\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 abl.dsp.distortion~ \\u2014 Live's Pedal, distortion mode\",\n      \"pos\": [\n        1250,\n        1210\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1250,\n        1240\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1330,\n        1240\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.distortion~ @mix 1.\",\n      \"pos\": [\n        1250,\n        1492\n      ],\n      \"presentation\": [\n        202,\n        824,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 6,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f10_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1380,\n        1280\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1400,\n        1306\n      ],\n      \"attrs\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        678,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1420,\n        1332\n      ],\n      \"attrs\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        702,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1440,\n        1358\n      ],\n      \"attrs\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        726,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1460,\n        1384\n      ],\n      \"attrs\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        750,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1480,\n        1410\n      ],\n      \"attrs\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        774,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1500,\n        1436\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        798,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1250,\n        1537\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1340,\n        1537\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1690,\n        1240\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1690,\n        1270\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        378,\n        624,\n        176,\n        247\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 abl overdrive~\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        386,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        600,\n        1637\n      ],\n      \"presentation\": [\n        386,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        600,\n        1667\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        600,\n        1697\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 abl.dsp.overdrive~ \\u2014 Live's Pedal, overdrive mode\",\n      \"pos\": [\n        30,\n        1637\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.overdrive~ @mix 1.\",\n      \"pos\": [\n        30,\n        1919\n      ],\n      \"presentation\": [\n        386,\n        824,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 6,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f11_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        1707\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        1733\n      ],\n      \"attrs\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        678,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        1759\n      ],\n      \"attrs\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        702,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        1785\n      ],\n      \"attrs\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        726,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        1811\n      ],\n      \"attrs\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        750,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        1837\n      ],\n      \"attrs\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        774,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        1863\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        798,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        1964\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        120,\n        1964\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        470,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        470,\n        1697\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        562,\n        624,\n        176,\n        234\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 abl fuzz~\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        570,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1310,\n        1637\n      ],\n      \"presentation\": [\n        570,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1310,\n        1667\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1310,\n        1697\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 abl.dsp.fuzz~ \\u2014 Live's Pedal, fuzz mode\",\n      \"pos\": [\n        740,\n        1637\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        740,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        820,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.fuzz~ @mix 1.\",\n      \"pos\": [\n        740,\n        1919\n      ],\n      \"presentation\": [\n        570,\n        824,\n        160,\n        22\n      ],\n      \"inlets\": 6,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f12_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        870,\n        1707\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        890,\n        1733\n      ],\n      \"attrs\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        678,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"bass\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        910,\n        1759\n      ],\n      \"attrs\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        702,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mid\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        930,\n        1785\n      ],\n      \"attrs\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        726,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"midfreq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        950,\n        1811\n      ],\n      \"attrs\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        750,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"treble\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        970,\n        1837\n      ],\n      \"attrs\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        774,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"sub\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        990,\n        1863\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        570,\n        798,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        740,\n        1964\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        830,\n        1964\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1180,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1180,\n        1697\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        746,\n        624,\n        176,\n        223\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 abl saturator~\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        754,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2000,\n        1637\n      ],\n      \"presentation\": [\n        754,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        2000,\n        1667\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2000,\n        1697\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 abl.dsp.saturator~ \\u2014 Live's Saturator\",\n      \"pos\": [\n        1450,\n        1637\n      ],\n      \"size\": [\n        540,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1450,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1530,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.saturator~ @mix 1. @drive 12\",\n      \"pos\": [\n        1450,\n        1893\n      ],\n      \"presentation\": [\n        754,\n        800,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 4,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f13_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1580,\n        1707\n      ],\n      \"attrs\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1600,\n        1733\n      ],\n      \"attrs\": {\n        \"attr\": \"curve\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        678,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"curve\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1620,\n        1759\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        702,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1640,\n        1785\n      ],\n      \"attrs\": {\n        \"attr\": \"post_clip\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        726,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"post_clip\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1660,\n        1811\n      ],\n      \"attrs\": {\n        \"attr\": \"oversample\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        750,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"oversample\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1680,\n        1837\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        774,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        1450,\n        1938\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        1540,\n        1938\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1870,\n        1667\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1870,\n        1697\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        930,\n        624,\n        176,\n        295\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 abl waveshaper~\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        938,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        640,\n        2064\n      ],\n      \"presentation\": [\n        938,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        640,\n        2094\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        640,\n        2124\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 abl.dsp.waveshaper~ \\u2014 Live's Saturator waveshaper\",\n      \"pos\": [\n        30,\n        2064\n      ],\n      \"size\": [\n        600,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.waveshaper~ @mix 1. @drive 12\",\n      \"pos\": [\n        30,\n        2398\n      ],\n      \"presentation\": [\n        938,\n        872,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 4,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f14_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        2134\n      ],\n      \"attrs\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        2160\n      ],\n      \"attrs\": {\n        \"attr\": \"shaper_drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        678,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shaper_drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        2186\n      ],\n      \"attrs\": {\n        \"attr\": \"curve\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        702,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"curve\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        2212\n      ],\n      \"attrs\": {\n        \"attr\": \"depth\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        726,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"depth\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        2238\n      ],\n      \"attrs\": {\n        \"attr\": \"period\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        750,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"period\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        2264\n      ],\n      \"attrs\": {\n        \"attr\": \"linearity\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        774,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"linearity\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        2290\n      ],\n      \"attrs\": {\n        \"attr\": \"damping\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        798,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"damping\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        300,\n        2316\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        822,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_c8\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        320,\n        2342\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        846,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f14_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_L\",\n      \"pos\": [\n        30,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_R\",\n      \"pos\": [\n        120,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        510,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        510,\n        2124\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1114,\n        624,\n        176,\n        127\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 abl expshaper~\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1253,\n        2064\n      ],\n      \"presentation\": [\n        1122,\n        630,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1253,\n        2094\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1253,\n        2124\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 abl.dsp.expshaper~ \\u2014 exponential shaper (help file: 0.4)\",\n      \"pos\": [\n        780,\n        2064\n      ],\n      \"size\": [\n        463,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        780,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.expshaper~ 0.4\",\n      \"pos\": [\n        780,\n        2216\n      ],\n      \"presentation\": [\n        1122,\n        680,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f15_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        910,\n        2134\n      ],\n      \"attrs\": {\n        \"attr\": \"amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        654,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"amount\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        721,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_L\",\n      \"pos\": [\n        780,\n        2261\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_R\",\n      \"pos\": [\n        870,\n        2261\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        929,\n        176,\n        247\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 abl redux~\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1963,\n        2064\n      ],\n      \"presentation\": [\n        18,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        1963,\n        2094\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1963,\n        2124\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 abl.device.redux~ \\u2014 Live's Redux (downsample + bit reduction)\",\n      \"pos\": [\n        1393,\n        2064\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1393,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1473,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.redux~ @mix 1.\",\n      \"pos\": [\n        1393,\n        2346\n      ],\n      \"presentation\": [\n        18,\n        1129,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 5,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f16_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1523,\n        2134\n      ],\n      \"attrs\": {\n        \"attr\": \"bitdepth\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        959,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"bitdepth\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1543,\n        2160\n      ],\n      \"attrs\": {\n        \"attr\": \"rate\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        983,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"rate\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1563,\n        2186\n      ],\n      \"attrs\": {\n        \"attr\": \"shape\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        1007,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shape\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1583,\n        2212\n      ],\n      \"attrs\": {\n        \"attr\": \"jitter\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        1031,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"jitter\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1603,\n        2238\n      ],\n      \"attrs\": {\n        \"attr\": \"prefilter\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        1055,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"prefilter\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1623,\n        2264\n      ],\n      \"attrs\": {\n        \"attr\": \"post_filter\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        1079,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"post_filter\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1643,\n        2290\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        1103,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f16_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_L\",\n      \"pos\": [\n        1393,\n        2391\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_R\",\n      \"pos\": [\n        1483,\n        2391\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1833,\n        2094\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1833,\n        2124\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        929,\n        176,\n        295\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 abl roar~\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        202,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        640,\n        2543\n      ],\n      \"presentation\": [\n        202,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        640,\n        2573\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        640,\n        2603\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 abl.device.roar~ \\u2014 Live's Roar three-stage saturator\",\n      \"pos\": [\n        30,\n        2543\n      ],\n      \"size\": [\n        600,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.roar~ @mix 1.\",\n      \"pos\": [\n        30,\n        2877\n      ],\n      \"presentation\": [\n        202,\n        1177,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 2,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\"\n      ]\n    },\n    \"f17_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        2613\n      ],\n      \"attrs\": {\n        \"attr\": \"shaper_amount_1\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        959,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shaper_amount_1\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        2639\n      ],\n      \"attrs\": {\n        \"attr\": \"shaper_type_1\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        983,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shaper_type_1\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        2665\n      ],\n      \"attrs\": {\n        \"attr\": \"routing\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1007,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"routing\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        2691\n      ],\n      \"attrs\": {\n        \"attr\": \"filter_frequency_1\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1031,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"filter_frequency_1\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        2717\n      ],\n      \"attrs\": {\n        \"attr\": \"tone_amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1055,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"tone_amount\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        2743\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback_amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1079,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"feedback_amount\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        2769\n      ],\n      \"attrs\": {\n        \"attr\": \"compressor_amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1103,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"compressor_amount\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        300,\n        2795\n      ],\n      \"attrs\": {\n        \"attr\": \"blend\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1127,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"blend\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_c8\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        320,\n        2821\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        202,\n        1151,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f17_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_L\",\n      \"pos\": [\n        30,\n        2922\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_R\",\n      \"pos\": [\n        120,\n        2922\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        510,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        510,\n        2603\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        378,\n        929,\n        176,\n        295\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 abl drumbuss~\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        386,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1390,\n        2543\n      ],\n      \"presentation\": [\n        386,\n        935,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        1390,\n        2573\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1390,\n        2603\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 abl.device.drumbuss~ \\u2014 Live's Drum Buss\",\n      \"pos\": [\n        780,\n        2543\n      ],\n      \"size\": [\n        600,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        780,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        860,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.drumbuss~ @mix 1.\",\n      \"pos\": [\n        780,\n        2877\n      ],\n      \"presentation\": [\n        386,\n        1177,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 5,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f18_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        910,\n        2613\n      ],\n      \"attrs\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        959,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        930,\n        2639\n      ],\n      \"attrs\": {\n        \"attr\": \"distortion\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        983,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"distortion\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        950,\n        2665\n      ],\n      \"attrs\": {\n        \"attr\": \"crunch\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1007,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"crunch\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        970,\n        2691\n      ],\n      \"attrs\": {\n        \"attr\": \"boom\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1031,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"boom\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        990,\n        2717\n      ],\n      \"attrs\": {\n        \"attr\": \"boomfreq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1055,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"boomfreq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1010,\n        2743\n      ],\n      \"attrs\": {\n        \"attr\": \"transients\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1079,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"transients\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1030,\n        2769\n      ],\n      \"attrs\": {\n        \"attr\": \"damping\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1103,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"damping\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1050,\n        2795\n      ],\n      \"attrs\": {\n        \"attr\": \"compressor\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1127,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"compressor\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_c8\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1070,\n        2821\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        386,\n        1151,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f18_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_L\",\n      \"pos\": [\n        780,\n        2922\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_R\",\n      \"pos\": [\n        870,\n        2922\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1260,\n        2573\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1260,\n        2603\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201318 are the effects\",\n      \"pos\": [\n        30,\n        3022\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 18 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3132\n      ],\n      \"inlets\": 19,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_L\",\n      \"pos\": [\n        1200,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_L\",\n      \"pos\": [\n        1290,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_L\",\n      \"pos\": [\n        1380,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_L\",\n      \"pos\": [\n        1470,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_L\",\n      \"pos\": [\n        1560,\n        3082\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 18 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3262\n      ],\n      \"inlets\": 19,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_R\",\n      \"pos\": [\n        1200,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_R\",\n      \"pos\": [\n        1290,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_R\",\n      \"pos\": [\n        1380,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_R\",\n      \"pos\": [\n        1470,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_R\",\n      \"pos\": [\n        1560,\n        3212\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3362\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        3432\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        3432\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        3482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        3482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        3482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        3482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        3542\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        3622\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3362\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        3392\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        3432\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        3472\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        3512\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        3552\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        3552\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        3592\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        3592\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        3632\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        3632\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        439\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        3692\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        439\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        1230\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        1256\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        1282\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        2005,\n        330\n      ],\n      \"text\": \"loadmess embed 1\",\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rM\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c0_lm\",\n      0,\n      \"f02_c0\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rM\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0_lm\",\n      0,\n      \"f03_c0\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_c1_lm\",\n      0,\n      \"f03_c1\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      2\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rM\",\n      0,\n      \"f04_pre\",\n      0\n    ],\n    [\n      \"f04_pre\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c0_lm\",\n      0,\n      \"f04_c0\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_pre\",\n      1\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rM\",\n      0,\n      \"f05_pre\",\n      0\n    ],\n    [\n      \"f05_pre\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0_lm\",\n      0,\n      \"f05_c0\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_pre\",\n      1\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rM\",\n      0,\n      \"f06_pre\",\n      0\n    ],\n    [\n      \"f06_pre\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c0_lm\",\n      0,\n      \"f06_c0\",\n      0\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_pre\",\n      1\n    ],\n    [\n      \"f06_c1\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rM\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c0_lm\",\n      0,\n      \"f07_c0\",\n      0\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rM\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c0_lm\",\n      0,\n      \"f08_c0\",\n      0\n    ],\n    [\n      \"f08_c0\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rM\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c0_lm\",\n      0,\n      \"f09_c0\",\n      0\n    ],\n    [\n      \"f09_c0\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f09_c1_lm\",\n      0,\n      \"f09_c1\",\n      0\n    ],\n    [\n      \"f09_c1\",\n      0,\n      \"f09_obj\",\n      2\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_c0\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c1\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c2\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c3\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c4\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c5\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_c6\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_c0\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c1\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c2\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c3\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c4\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c5\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_c6\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f11_rwo\",\n      0,\n      \"f11_wet\",\n      0\n    ],\n    [\n      \"f11_wet\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_c0\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c1\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c2\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c3\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c4\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c5\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_c6\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f12_rwo\",\n      0,\n      \"f12_wet\",\n      0\n    ],\n    [\n      \"f12_wet\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_c0\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c1\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c2\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c3\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c4\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_c5\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"f13_rwo\",\n      0,\n      \"f13_wet\",\n      0\n    ],\n    [\n      \"f13_wet\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rL\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rR\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f14_c0\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c1\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c2\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c3\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c4\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c5\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c6\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c7\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_c8\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sL\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      1,\n      \"f14_sR\",\n      0\n    ],\n    [\n      \"f14_rwo\",\n      0,\n      \"f14_wet\",\n      0\n    ],\n    [\n      \"f14_wet\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rM\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_c0\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sL\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sR\",\n      0\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_rL\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_rR\",\n      0,\n      \"f16_obj\",\n      1\n    ],\n    [\n      \"f16_c0\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c1\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c2\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c3\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c4\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c5\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_c6\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      0,\n      \"f16_sL\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      1,\n      \"f16_sR\",\n      0\n    ],\n    [\n      \"f16_rwo\",\n      0,\n      \"f16_wet\",\n      0\n    ],\n    [\n      \"f16_wet\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_rL\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_rR\",\n      0,\n      \"f17_obj\",\n      1\n    ],\n    [\n      \"f17_c0\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c1\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c2\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c3\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c4\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c5\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c6\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c7\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_c8\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      0,\n      \"f17_sL\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      1,\n      \"f17_sR\",\n      0\n    ],\n    [\n      \"f17_rwo\",\n      0,\n      \"f17_wet\",\n      0\n    ],\n    [\n      \"f17_wet\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_rL\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_rR\",\n      0,\n      \"f18_obj\",\n      1\n    ],\n    [\n      \"f18_c0\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c1\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c2\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c3\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c4\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c5\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c6\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c7\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_c8\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      0,\n      \"f18_sL\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      1,\n      \"f18_sR\",\n      0\n    ],\n    [\n      \"f18_rwo\",\n      0,\n      \"f18_wet\",\n      0\n    ],\n    [\n      \"f18_wet\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"mx_L_14\",\n      0,\n      \"sel_L\",\n      14\n    ],\n    [\n      \"mx_L_15\",\n      0,\n      \"sel_L\",\n      15\n    ],\n    [\n      \"mx_L_16\",\n      0,\n      \"sel_L\",\n      16\n    ],\n    [\n      \"mx_L_17\",\n      0,\n      \"sel_L\",\n      17\n    ],\n    [\n      \"mx_L_18\",\n      0,\n      \"sel_L\",\n      18\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mx_R_14\",\n      0,\n      \"sel_R\",\n      14\n    ],\n    [\n      \"mx_R_15\",\n      0,\n      \"sel_R\",\n      15\n    ],\n    [\n      \"mx_R_16\",\n      0,\n      \"sel_R\",\n      16\n    ],\n    [\n      \"mx_R_17\",\n      0,\n      \"sel_R\",\n      17\n    ],\n    [\n      \"mx_R_18\",\n      0,\n      \"sel_R\",\n      18\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"hl_v8\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-47",
            1
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
            "obj-52",
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
            "obj-61",
            1
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
            "obj-66",
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
            "obj-61",
            2
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
            "obj-69",
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
            "obj-70",
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
            "obj-79",
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
            "obj-79",
            1
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
            "obj-84",
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
            "obj-85",
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
            "obj-92",
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
            "obj-94",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-96",
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
            1
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
            "obj-99",
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
            "obj-100",
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
            "obj-109",
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
            "obj-108",
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
            "obj-109",
            1
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
            "obj-108",
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
            "obj-115",
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
            "obj-116",
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
            "obj-126",
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
            1
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
            "obj-129",
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
            "obj-130",
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
            "obj-140",
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
            1
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
            "obj-143",
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
            "obj-144",
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
            "obj-149",
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
            "obj-152",
            1
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
            "obj-152",
            2
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
            "obj-160",
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
            "obj-161",
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
            "obj-170",
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
            "obj-170",
            1
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
            "obj-170",
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
            "obj-170",
            0
          ],
          "source": [
            "obj-172",
            0
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
            "obj-173",
            0
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
            "obj-174",
            0
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
            "obj-175",
            0
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
            "obj-176",
            0
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
            "obj-177",
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
            "obj-170",
            0
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
            "obj-170",
            1
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
            "obj-170",
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
            "obj-190",
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
            1
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
            "obj-190",
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
            "obj-190",
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
            "obj-190",
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
            "obj-190",
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
            "obj-190",
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
            "obj-190",
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
            "obj-190",
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
            "obj-198",
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
            "obj-199",
            0
          ],
          "source": [
            "obj-190",
            1
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
            "obj-190",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-210",
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
            "obj-218",
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
            "obj-219",
            0
          ],
          "source": [
            "obj-210",
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
            "obj-210",
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
            "obj-230",
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
            "obj-230",
            1
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
            "obj-231",
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
            "obj-232",
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
            "obj-233",
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
            "obj-234",
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
            "obj-235",
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
            "obj-236",
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
            "obj-230",
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
            "obj-230",
            1
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
            "obj-239",
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
            "obj-240",
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
            "obj-243",
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
            "obj-244",
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
            "obj-247",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-249",
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
            "obj-249",
            0
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
            "obj-249",
            0
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
            "obj-249",
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
            "obj-249",
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
            "obj-249",
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
            "obj-249",
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
            "obj-249",
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
            "obj-249",
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
            "obj-249",
            0
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
            "obj-259",
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
            "obj-260",
            0
          ],
          "source": [
            "obj-249",
            1
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
            "obj-249",
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
            "obj-266",
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
            "obj-267",
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
            "obj-273",
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
            "obj-274",
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
            "obj-283",
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
            "obj-283",
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
            "obj-283",
            0
          ],
          "source": [
            "obj-286",
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
            "obj-287",
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
            "obj-288",
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
            "obj-289",
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
            "obj-290",
            0
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
            "obj-283",
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
            "obj-283",
            1
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
            "obj-293",
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
            "obj-294",
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
            "obj-299",
            0
          ],
          "source": [
            "obj-298",
            0
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
            "obj-301",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-303",
            1
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
            "obj-303",
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
            "obj-303",
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
            "obj-303",
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
            "obj-303",
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
            "obj-303",
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
            "obj-303",
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
            "obj-303",
            0
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
            "obj-303",
            0
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
            "obj-303",
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
            "obj-303",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-314",
            0
          ],
          "source": [
            "obj-303",
            1
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
            "obj-303",
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
            "obj-320",
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
            "obj-320",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-325",
            0
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
            "obj-325",
            1
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
            "obj-325",
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
            "obj-325",
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
            "obj-325",
            0
          ],
          "source": [
            "obj-328",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-325",
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
            "obj-325",
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
            "obj-325",
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
            "obj-325",
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
            "obj-325",
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
            "obj-325",
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
            "obj-335",
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
            "obj-336",
            0
          ],
          "source": [
            "obj-325",
            1
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
            "obj-337",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-325",
            0
          ],
          "source": [
            "obj-338",
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
            "obj-342",
            0
          ],
          "source": [
            "obj-341",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-341",
            2
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
            "obj-341",
            3
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
            "obj-341",
            4
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
            "obj-341",
            5
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
            "obj-341",
            6
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
            "obj-341",
            7
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
            "obj-341",
            8
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
            "obj-341",
            9
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
            "obj-341",
            10
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
            "obj-341",
            11
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
            "obj-341",
            12
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
            "obj-341",
            13
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
            "obj-341",
            14
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
            "obj-341",
            15
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
            "obj-341",
            16
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
            "obj-341",
            17
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
            "obj-341",
            18
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
            "obj-361",
            0
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
            "obj-361",
            2
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
            "obj-361",
            3
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
            "obj-361",
            4
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
            "obj-361",
            5
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
            "obj-361",
            6
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
            "obj-361",
            7
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
            "obj-361",
            8
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
            "obj-361",
            9
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
            "obj-361",
            10
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
            "obj-361",
            11
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
            "obj-361",
            12
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
            "obj-361",
            13
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
            "obj-361",
            14
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
            "obj-361",
            15
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
            "obj-361",
            16
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
            "obj-361",
            17
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
            "obj-361",
            18
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
            "obj-389",
            0
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
            "obj-387",
            0
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
            "obj-390",
            0
          ],
          "source": [
            "obj-383",
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
            "obj-384",
            0
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
            "obj-385",
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
            "obj-386",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-389",
            1
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
            "obj-390",
            1
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
            1
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
            "obj-392",
            1
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
            "obj-393",
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
            "obj-393",
            0
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
            "obj-393",
            1
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
            "obj-394",
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
            "obj-394",
            1
          ],
          "source": [
            "obj-393",
            1
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
            "obj-398",
            0
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
            "obj-399",
            0
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
            "obj-399",
            1
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
            "obj-400",
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
            "obj-401",
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
            0
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
          "source": [
            "obj-421",
            0
          ],
          "destination": [
            "obj-31",
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
