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
          "text": "DYNAMICS SHOOTOUT \u2014 compressors, limiters, companders and gain shapers. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 15, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
                "2 omx.comp~",
                "3 omx.peaklim~",
                "4 omx.4band~",
                "5 omx.5band~",
                "6 limi~",
                "7 abl compressor~",
                "8 abl limiter~",
                "9 abl compander~",
                "10 BEAP Compressor",
                "11 amxd Max Compressor",
                "12 amxd Dynamical",
                "13 AU Dynamics",
                "14 AU PeakLimiter",
                "15 AU Multiband"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 14,
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
          "text": "v8 fx-shootout-highlight.js 15 @embed 1",
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
            118.0,
            20.0
          ],
          "text": "2 \u00b7 omx.comp~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
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
            575.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
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
            575.0,
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
            575.0,
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
            535.0,
            20.0
          ],
          "text": "2 \u00b7 omx.comp~ \u2014 OctiMax broadcast compressor (presets via choosePreset)"
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
          "text": "r~ SRC_L"
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
          "id": "obj-48",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            672.0,
            83.0,
            22.0
          ],
          "text": "omx.comp~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            480.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            220.0,
            550.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            590.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            430.0,
            160.0,
            22.0
          ],
          "items": [
            "Guitar",
            ",",
            "Bass",
            ",",
            "Vocal",
            ",",
            "Drums",
            ",",
            "Program",
            "Material"
          ]
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            620.0,
            125.0,
            22.0
          ],
          "text": "choosePreset $1"
        }
      },
      {
        "box": {
          "id": "obj-52",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            300.0,
            590.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            454.0,
            22.0,
            22.0
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
            300.0,
            620.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            2520.0,
            86.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            46.0,
            456.0,
            132.0,
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
          "id": "obj-55",
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
          "id": "obj-56",
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
          "id": "obj-58",
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
          "text": "3 \u00b7 omx.peaklim~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            406.0,
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
          "id": "obj-59",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1185.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            406.0,
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
          "id": "obj-60",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1185.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1185.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            715.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "3 \u00b7 omx.peaklim~ \u2014 OctiMax peak limiter"
        }
      },
      {
        "box": {
          "id": "obj-63",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            715.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            795.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            715.0,
            672.0,
            104.0,
            22.0
          ],
          "text": "omx.peaklim~",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            480.0,
            160.0,
            22.0
          ]
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
            905.0,
            550.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            845.0,
            590.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            430.0,
            160.0,
            22.0
          ],
          "items": [
            "Punchy",
            ",",
            "Smooth"
          ]
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            845.0,
            620.0,
            69.0,
            22.0
          ],
          "text": "mode $1"
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            985.0,
            590.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            454.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            985.0,
            620.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            138.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            230.0,
            456.0,
            132.0,
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
          "id": "obj-72",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            715.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            805.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
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
            164.0,
            127.0,
            20.0
          ],
          "text": "4 \u00b7 omx.4band~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            406.0,
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
          "id": "obj-76",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1795.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            406.0,
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
          "id": "obj-77",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1795.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
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
            1795.0,
            580.0,
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
            1325.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "4 \u00b7 omx.4band~ \u2014 OctiMax 4-band compressor"
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
            1325.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1405.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-82",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            1325.0,
            672.0,
            90.0,
            22.0
          ],
          "text": "omx.4band~",
          "presentation": 1,
          "presentation_rect": [
            386.0,
            480.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1515.0,
            550.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-84",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1455.0,
            590.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            430.0,
            160.0,
            22.0
          ],
          "items": [
            "Standard",
            ",",
            "Pop",
            ",",
            "Movies"
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
            1455.0,
            620.0,
            125.0,
            22.0
          ],
          "text": "choosePreset $1"
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            1595.0,
            590.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            386.0,
            454.0,
            22.0,
            22.0
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
            1595.0,
            620.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            190.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            414.0,
            456.0,
            132.0,
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
          "id": "obj-89",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1325.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
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
            1415.0,
            717.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            127.0,
            20.0
          ],
          "text": "5 \u00b7 omx.5band~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            406.0,
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
          "id": "obj-93",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            817.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            406.0,
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
            500.0,
            847.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            500.0,
            877.0,
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
            817.0,
            460.0,
            20.0
          ],
          "text": "5 \u00b7 omx.5band~ \u2014 OctiMax 5-band compressor"
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
            847.0,
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
            110.0,
            847.0,
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
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            969.0,
            90.0,
            22.0
          ],
          "text": "omx.5band~",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            480.0,
            160.0,
            22.0
          ]
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
            220.0,
            847.0,
            90.0,
            22.0
          ],
          "text": "loadmess 0"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            887.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            430.0,
            160.0,
            22.0
          ],
          "items": [
            "Universal",
            ",",
            "Pop",
            ",",
            "Hit_Radio",
            ",",
            "FM_Radio"
          ]
        }
      },
      {
        "box": {
          "id": "obj-102",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            917.0,
            125.0,
            22.0
          ],
          "text": "choosePreset $1"
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            300.0,
            887.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            454.0,
            22.0,
            22.0
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
            300.0,
            917.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            242.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            598.0,
            456.0,
            132.0,
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
          "id": "obj-106",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1014.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
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
            120.0,
            1014.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
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
            2520.0,
            268.0,
            84.0,
            20.0
          ],
          "text": "6 \u00b7 limi~",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            406.0,
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
          "id": "obj-110",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            817.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            406.0,
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
          "id": "obj-111",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            847.0,
            40.0,
            22.0
          ],
          "text": "5"
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
            1110.0,
            877.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            817.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 limi~ 2 \u2014 lookahead peak limiter, stereo"
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            847.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            720.0,
            847.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            640.0,
            1073.0,
            69.0,
            22.0
          ],
          "text": "limi~ 2",
          "presentation": 1,
          "presentation_rect": [
            754.0,
            576.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-117",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            770.0,
            887.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            430.0,
            160.0,
            22.0
          ],
          "attr": "threshold",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            790.0,
            913.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            454.0,
            160.0,
            22.0
          ],
          "attr": "preamp",
          "text_width": 82.0
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
            810.0,
            939.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            478.0,
            160.0,
            22.0
          ],
          "attr": "postamp",
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
            830.0,
            965.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            502.0,
            160.0,
            22.0
          ],
          "attr": "release",
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
            850.0,
            991.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            526.0,
            160.0,
            22.0
          ],
          "attr": "lookahead",
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
            870.0,
            1017.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            754.0,
            550.0,
            160.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 82.0
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
            640.0,
            1118.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
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
            730.0,
            1118.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            294.0,
            169.0,
            20.0
          ],
          "text": "7 \u00b7 abl compressor~",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            406.0,
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
          "id": "obj-127",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1968.0,
            817.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            406.0,
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
          "id": "obj-128",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1968.0,
            847.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-129",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1968.0,
            877.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1250.0,
            817.0,
            708.0,
            20.0
          ],
          "text": "7 \u00b7 abl.device.compressor~ \u2014 Live's Compressor (mono; help file's attack / release / threshold)"
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            847.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-132",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1250.0,
            1047.0,
            468.0,
            22.0
          ],
          "text": "abl.device.compressor~ @attack 0.02 @release 0.08 @threshold -20",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            552.0,
            160.0,
            50.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1380.0,
            887.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            430.0,
            160.0,
            22.0
          ],
          "attr": "threshold",
          "text_width": 82.0
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
            1400.0,
            913.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            454.0,
            160.0,
            22.0
          ],
          "attr": "ratio",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-135",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1420.0,
            939.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            478.0,
            160.0,
            22.0
          ],
          "attr": "attack",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-136",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1440.0,
            965.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            502.0,
            160.0,
            22.0
          ],
          "attr": "release",
          "text_width": 82.0
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
            1460.0,
            991.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            938.0,
            526.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
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
            320.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            938.0,
            608.0,
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
          "id": "obj-139",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1092.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            1340.0,
            1092.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
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
            346.0,
            144.0,
            20.0
          ],
          "text": "8 \u00b7 abl limiter~",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            406.0,
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
          "id": "obj-143",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            500.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            406.0,
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
          "id": "obj-144",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1248.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            500.0,
            1278.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1218.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 abl.device.limiter~ \u2014 Live's Limiter"
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
            30.0,
            1248.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-148",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            1248.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-149",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            1474.0,
            153.0,
            22.0
          ],
          "text": "abl.device.limiter~",
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            576.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-150",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            1288.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            430.0,
            160.0,
            22.0
          ],
          "attr": "ceiling",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            1314.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            454.0,
            160.0,
            22.0
          ],
          "attr": "gain",
          "text_width": 82.0
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
            200.0,
            1340.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            478.0,
            160.0,
            22.0
          ],
          "attr": "release",
          "text_width": 82.0
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
            220.0,
            1366.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            502.0,
            160.0,
            22.0
          ],
          "attr": "lookahead",
          "text_width": 82.0
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
            240.0,
            1392.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            526.0,
            160.0,
            22.0
          ],
          "attr": "autorelease",
          "text_width": 82.0
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
            260.0,
            1418.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1122.0,
            550.0,
            160.0,
            22.0
          ],
          "attr": "maximize",
          "text_width": 82.0
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
            1519.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
        }
      },
      {
        "box": {
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            1519.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
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
            372.0,
            161.0,
            20.0
          ],
          "text": "9 \u00b7 abl compander~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            654.0,
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
          "id": "obj-160",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1110.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            654.0,
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
          "id": "obj-161",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            1248.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            1110.0,
            1278.0,
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
            640.0,
            1218.0,
            460.0,
            20.0
          ],
          "text": "9 \u00b7 abl.dsp.compander~ \u2014 compressor / expander (mono)"
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
            640.0,
            1248.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-165",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            640.0,
            1370.0,
            146.0,
            22.0
          ],
          "text": "abl.dsp.compander~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            728.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            770.0,
            1288.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            678.0,
            160.0,
            22.0
          ],
          "attr": "mode",
          "text_width": 82.0
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
            790.0,
            1314.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            702.0,
            160.0,
            22.0
          ],
          "attr": "shape",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-168",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            398.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            756.0,
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
          "id": "obj-169",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            1415.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
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
            730.0,
            1415.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
        }
      },
      {
        "box": {
          "id": "obj-172",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            424.0,
            178.0,
            20.0
          ],
          "text": "10 \u00b7 BEAP Compressor",
          "presentation": 1,
          "presentation_rect": [
            202.0,
            654.0,
            339.0,
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
          "id": "obj-173",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1639.0,
            1218.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            654.0,
            339.0,
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
          "id": "obj-174",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1639.0,
            1248.0,
            40.0,
            22.0
          ],
          "text": "9"
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1639.0,
            1278.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1250.0,
            1218.0,
            379.0,
            20.0
          ],
          "text": "10 \u00b7 bp.Compressor \u2014 BEAP stereo compressor"
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
            1250.0,
            1248.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1330.0,
            1248.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-179",
          "maxclass": "bpatcher",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1250.0,
            1288.0,
            339.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            202.0,
            678.0,
            339.0,
            116.0
          ],
          "varname": "FX_COMPRESSOR",
          "comment": "in 0: signal | in 1: signal | out 0: signal | out 1: signal",
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
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              34.0,
              79.0,
              1612.0,
              937.0
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
            "assistshowspatchername": 0,
            "boxes": [
              {
                "box": {
                  "id": "obj-15",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    1030.5,
                    995.0,
                    67.0,
                    22.0
                  ],
                  "text": "pastebang"
                }
              },
              {
                "box": {
                  "id": "obj-14",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    76.0,
                    136.0,
                    178.0,
                    20.0
                  ],
                  "text": "## Stereo compressor effect ##"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 7,
                  "outlettype": [
                    "bang",
                    "int",
                    "int",
                    "bang",
                    "bang",
                    "bang",
                    "bang"
                  ],
                  "patching_rect": [
                    1030.5,
                    1053.0,
                    82.0,
                    22.0
                  ],
                  "text": "t b i i b b b b"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-63",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    583.0,
                    717.0,
                    92.0,
                    22.0
                  ],
                  "text": "scale 1 48 0 99"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-57",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    411.0,
                    836.0,
                    103.0,
                    22.0
                  ],
                  "text": "scale -36 0 0 100"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-7",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1591.0,
                    1140.0,
                    89.0,
                    23.0
                  ],
                  "text": "limEnabled 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-24",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1483.0,
                    1140.0,
                    84.0,
                    23.0
                  ],
                  "text": "ngEnabled 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-53",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1411.0,
                    1140.0,
                    66.0,
                    23.0
                  ],
                  "text": "meters 1"
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
                    "signal"
                  ],
                  "patching_rect": [
                    337.5,
                    1354.0,
                    52.5,
                    22.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-17",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    263.5,
                    1354.0,
                    52.5,
                    22.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-20",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    289.0,
                    1295.0,
                    41.0,
                    22.0
                  ],
                  "text": "dbtoa"
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
                  "id": "obj-44",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    289.0,
                    1232.0,
                    27.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    43.0,
                    42.578125,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Input",
                      "parameter_mmax": 42.0,
                      "parameter_mmin": -42.0,
                      "parameter_shortname": "Input",
                      "parameter_type": 0,
                      "parameter_unitstyle": 4
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Input"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    638.5,
                    1663.0,
                    52.5,
                    22.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    564.5,
                    1663.0,
                    52.5,
                    22.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    590.0,
                    1604.0,
                    41.0,
                    22.0
                  ],
                  "text": "dbtoa"
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
                    590.0,
                    1541.0,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    259.6343994140625,
                    43.0,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Output",
                      "parameter_mmax": 42.0,
                      "parameter_mmin": -42.0,
                      "parameter_shortname": "Output",
                      "parameter_type": 0,
                      "parameter_unitstyle": 4
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Output"
                }
              },
              {
                "box": {
                  "id": "obj-34",
                  "maxclass": "slider",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "orientation": 2,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    845.0,
                    648.0,
                    18.0,
                    144.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        120
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "slider[3]",
                      "parameter_mmax": 150.0,
                      "parameter_shortname": "slider[3]",
                      "parameter_type": 3
                    }
                  },
                  "size": 151.0,
                  "varname": "slider[3]"
                }
              },
              {
                "box": {
                  "id": "obj-35",
                  "maxclass": "slider",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "orientation": 2,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    759.0,
                    648.0,
                    18.0,
                    144.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        145
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "slider[2]",
                      "parameter_mmax": 150.0,
                      "parameter_shortname": "slider[2]",
                      "parameter_type": 3
                    }
                  },
                  "size": 151.0,
                  "varname": "slider[2]"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-38",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    845.0,
                    836.0,
                    75.0,
                    23.0
                  ],
                  "text": "release $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-39",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    759.0,
                    836.0,
                    70.0,
                    23.0
                  ],
                  "text": "attack $1"
                }
              },
              {
                "box": {
                  "bgcolor": [
                    0.866667,
                    0.866667,
                    0.866667,
                    1.0
                  ],
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "htricolor": [
                    0.87,
                    0.82,
                    0.24,
                    1.0
                  ],
                  "id": "obj-40",
                  "maxclass": "number",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    639.0,
                    940.0,
                    41.0,
                    23.0
                  ],
                  "textcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "tricolor": [
                    0.75,
                    0.75,
                    0.75,
                    1.0
                  ],
                  "triscale": 0.9
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-41",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    639.0,
                    968.0,
                    60.0,
                    23.0
                  ],
                  "text": "ratio $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "hidden": 1,
                  "id": "obj-43",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    400.0,
                    896.0,
                    114.0,
                    23.0
                  ],
                  "text": "agcThreshold $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-22",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    833.588562,
                    1480.5,
                    47.0,
                    23.0
                  ],
                  "text": "$1 $2"
                }
              },
              {
                "box": {
                  "bgcolor": [
                    1.0,
                    0.248882,
                    0.379825,
                    1.0
                  ],
                  "candicane2": [
                    0.145098,
                    0.203922,
                    0.356863,
                    1.0
                  ],
                  "candicane3": [
                    0.290196,
                    0.411765,
                    0.713726,
                    1.0
                  ],
                  "candicane4": [
                    0.439216,
                    0.619608,
                    0.070588,
                    1.0
                  ],
                  "candicane5": [
                    0.584314,
                    0.827451,
                    0.431373,
                    1.0
                  ],
                  "candicane6": [
                    0.733333,
                    0.035294,
                    0.788235,
                    1.0
                  ],
                  "candicane7": [
                    0.878431,
                    0.243137,
                    0.145098,
                    1.0
                  ],
                  "candicane8": [
                    0.027451,
                    0.447059,
                    0.501961,
                    1.0
                  ],
                  "id": "obj-46",
                  "maxclass": "multislider",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    833.588562,
                    1518.0,
                    28.0,
                    98.0
                  ],
                  "peakcolor": [
                    0.498039,
                    0.498039,
                    0.498039,
                    1.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    248.38421630859375,
                    43.0,
                    11.0,
                    47.0
                  ],
                  "setminmax": [
                    0.0,
                    250.0
                  ],
                  "setstyle": 1,
                  "settype": 0,
                  "size": 2,
                  "slidercolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-62",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1310.0,
                    1140.0,
                    89.0,
                    23.0
                  ],
                  "text": "meterRate 25"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    648.5,
                    1699.0,
                    32.5,
                    22.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    564.5,
                    1699.0,
                    32.5,
                    22.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-96",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    654.0,
                    1781.0,
                    33.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    300.16668701171875,
                    97.0,
                    33.0,
                    17.0
                  ],
                  "text": "Right",
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
                  "id": "obj-97",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    345.25,
                    1199.0,
                    33.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    300.16668701171875,
                    0.0,
                    33.0,
                    17.0
                  ],
                  "text": "Right",
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
                  "comment": "",
                  "id": "obj-95",
                  "index": 2,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    648.5,
                    1750.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-94",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    566.588562,
                    1750.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-93",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    342.75,
                    1232.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-92",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    205.0,
                    1225.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "coldcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hotcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-89",
                  "maxclass": "live.meter~",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "int"
                  ],
                  "patching_rect": [
                    725.0,
                    1699.0,
                    21.0,
                    99.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    319.4864807128906,
                    43.0,
                    11.0,
                    47.0
                  ],
                  "warmcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "coldcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hotcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-90",
                  "maxclass": "live.meter~",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "int"
                  ],
                  "patching_rect": [
                    509.411438,
                    1713.0,
                    21.0,
                    99.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    306.3979187011719,
                    43.0,
                    11.0,
                    47.0
                  ],
                  "warmcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "coldcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hotcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-88",
                  "maxclass": "live.meter~",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "int"
                  ],
                  "patching_rect": [
                    312.0,
                    1410.0,
                    21.0,
                    99.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    56.5,
                    43.0,
                    11.0,
                    47.0
                  ],
                  "warmcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-87",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.75,
                    1279.0,
                    42.0,
                    22.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-86",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    213.0,
                    1289.0,
                    42.0,
                    22.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "coldcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hotcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-85",
                  "maxclass": "live.meter~",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "int"
                  ],
                  "patching_rect": [
                    282.499969,
                    1410.0,
                    21.0,
                    99.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    44.578125,
                    43.0,
                    11.0,
                    47.0
                  ],
                  "warmcolor": [
                    0.278431,
                    0.839216,
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
                  "id": "obj-78",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    583.0,
                    611.5,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    116.94407653808594,
                    43.0,
                    49.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        99
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Ratio",
                      "parameter_mmax": 48.0,
                      "parameter_mmin": 1.0,
                      "parameter_shortname": "Ratio",
                      "parameter_type": 1,
                      "parameter_units": ":1",
                      "parameter_unitstyle": 9
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Ratio"
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
                  "id": "obj-52",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    411.0,
                    768.0,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    71.0,
                    43.0,
                    49.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        50
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Threshold",
                      "parameter_mmax": 0.0,
                      "parameter_mmin": -36.0,
                      "parameter_shortname": "Threshold",
                      "parameter_type": 0,
                      "parameter_unitstyle": 4
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Threshold"
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
                  "annotation": "arbitrary units - higher numbers are faster",
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "hint": "arbitrary units - higher numbers are faster",
                  "id": "obj-47",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    844.0,
                    555.0,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    196.8322296142578,
                    43.0,
                    49.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        120
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Release",
                      "parameter_mmax": 150.0,
                      "parameter_shortname": "Release",
                      "parameter_type": 1,
                      "parameter_unitstyle": 0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Release"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-66",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1166.0,
                    1128.0,
                    111.0,
                    22.0
                  ],
                  "text": "channelCoupling 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-67",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    977.411438,
                    1128.0,
                    93.0,
                    22.0
                  ],
                  "text": "smoothGain $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-84",
                  "linecount": 2,
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1076.411377,
                    1128.0,
                    74.0,
                    35.0
                  ],
                  "text": "progressiveRelease $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-114",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    869.411438,
                    1128.0,
                    82.0,
                    22.0
                  ],
                  "text": "agcEnabled 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-115",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    528.411438,
                    1084.0,
                    65.0,
                    22.0
                  ],
                  "text": "bypass $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-73",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 4,
                  "outlettype": [
                    "signal",
                    "signal",
                    "list",
                    "list"
                  ],
                  "patching_rect": [
                    612.911438,
                    1419.5,
                    78.0,
                    23.0
                  ],
                  "text": "omx.comp~"
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
                    84.25,
                    202.0,
                    59.5,
                    22.0
                  ],
                  "restore": {
                    "Attack": [
                      133.0
                    ],
                    "Bypass": [
                      0.0
                    ],
                    "Input": [
                      0.0
                    ],
                    "Output": [
                      9.061418
                    ],
                    "Ratio": [
                      44.0
                    ],
                    "Release": [
                      135.0
                    ],
                    "Threshold": [
                      -26.929134
                    ],
                    "slider[2]": [
                      133
                    ],
                    "slider[3]": [
                      135
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u095008398"
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
                    213.0,
                    1199.0,
                    27.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    97.0,
                    27.0,
                    17.0
                  ],
                  "text": "Left",
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
                  "annotation": "arbitrary units - higher numbers are faster",
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "hint": "arbitrary units - higher numbers are faster",
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
                    759.0,
                    555.0,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    154.88815307617188,
                    43.0,
                    49.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "textcolor": {
                      "expression": ""
                    },
                    "activedialcolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        145
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Attack",
                      "parameter_mmax": 150.0,
                      "parameter_shortname": "Attack",
                      "parameter_type": 1,
                      "parameter_unitstyle": 0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Attack"
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
                    566.588562,
                    1786.883911,
                    27.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
                    27.0,
                    17.0
                  ],
                  "text": "Left",
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
                  "id": "obj-12",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    528.411438,
                    984.0,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    284.16668701171875,
                    19.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "activebgoncolor": {
                      "expression": ""
                    },
                    "activebgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "activetextcolor": {
                      "expression": ""
                    },
                    "bgcolor": {
                      "expression": ""
                    },
                    "activetextoncolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_defer": 1,
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_longname": "Bypass",
                      "parameter_mmax": 1,
                      "parameter_shortname": "Bypass",
                      "parameter_type": 2
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
                  "varname": "Bypass"
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
                    76.0,
                    97.0,
                    76.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    76.0,
                    17.0
                  ],
                  "text": "COMPRESSOR",
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
                  "id": "obj-51",
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    220.0,
                    77.166626,
                    120.0,
                    5.0
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
                    76.0,
                    77.166626,
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
                    120.337189,
                    77.166626,
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
                    163.079285,
                    77.166626,
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
                    "obj-10",
                    1
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
                    "obj-11",
                    1
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
                  "order": 0,
                  "source": [
                    "obj-10",
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
                  "order": 1,
                  "source": [
                    "obj-10",
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
                    "obj-89",
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
                    "obj-73",
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
                    "obj-73",
                    0
                  ],
                  "source": [
                    "obj-115",
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
                    "obj-12",
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
                    "obj-15",
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
                  "order": 0,
                  "source": [
                    "obj-16",
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
                  "order": 1,
                  "source": [
                    "obj-16",
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
                  "order": 0,
                  "source": [
                    "obj-17",
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
                  "order": 1,
                  "source": [
                    "obj-17",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-1",
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
                    "obj-16",
                    1
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
                    "obj-17",
                    1
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
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-46",
                    0
                  ],
                  "midpoints": [
                    843.088562,
                    1508.25,
                    843.088562,
                    1508.25
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
                    "obj-73",
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
                    "obj-35",
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
                    "obj-94",
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
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-38",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-34",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-39",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-35",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-73",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-38",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-73",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-39",
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
                    "obj-4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-41",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-40",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-73",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-41",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "destination": [
                    "obj-73",
                    0
                  ],
                  "hidden": 1,
                  "source": [
                    "obj-43",
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
                    "obj-44",
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
                    "obj-52",
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
                    "obj-53",
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
                    "obj-57",
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
                    "obj-62",
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
                    "obj-63",
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
                    "obj-66",
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
                    "obj-67",
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
                  "source": [
                    "obj-73",
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
                    "obj-73",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-22",
                    0
                  ],
                  "source": [
                    "obj-73",
                    3
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
                    "obj-78",
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
                    "obj-84",
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
                    "obj-86",
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
                    "obj-87",
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
                    "obj-9",
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
                    "obj-9",
                    5
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
                    "obj-9",
                    4
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
                    "obj-9",
                    3
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
                    "obj-9",
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
                    "obj-9",
                    6
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
                    "obj-9",
                    2
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
                    "obj-92",
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
                    "obj-93",
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
          "id": "obj-180",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1250.0,
            1439.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1529.0,
            1439.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            450.0,
            212.0,
            20.0
          ],
          "text": "11 \u00b7 amxd Max Compressor",
          "presentation": 1,
          "presentation_rect": [
            565.0,
            654.0,
            492.0,
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
            608.0,
            1619.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            565.0,
            654.0,
            492.0,
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
            608.0,
            1649.0,
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
            608.0,
            1679.0,
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
            1619.0,
            568.0,
            20.0
          ],
          "text": "11 \u00b7 amxd~ Max Compressor.amxd \u2014 omx.comp~ with a full interface"
        }
      },
      {
        "box": {
          "id": "obj-188",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1649.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1067.0,
            654.0,
            50.0,
            22.0
          ]
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
            100.0,
            1649.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            1649.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-191",
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
            1729.0,
            548.0,
            196.0
          ],
          "text": "amxd~ \"Max Compressor.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            565.0,
            680.0,
            548.0,
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
          "id": "obj-192",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1960.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
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
            170.0,
            1960.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
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
            476.0,
            169.0,
            20.0
          ],
          "text": "12 \u00b7 amxd Dynamical",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            906.0,
            384.0,
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
          "id": "obj-196",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1322.0,
            1619.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            906.0,
            384.0,
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
          "id": "obj-197",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1322.0,
            1649.0,
            40.0,
            22.0
          ],
          "text": "11"
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
            1322.0,
            1679.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            748.0,
            1619.0,
            564.0,
            20.0
          ],
          "text": "12 \u00b7 amxd~ Dynamical.amxd \u2014 drawable dynamics curve: compress, expand, gate"
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            748.0,
            1649.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            412.0,
            906.0,
            50.0,
            22.0
          ]
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
            818.0,
            1649.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            898.0,
            1649.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-203",
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
            748.0,
            1729.0,
            440.0,
            196.0
          ],
          "text": "amxd~ Dynamical.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            932.0,
            440.0,
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
          "id": "obj-204",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            748.0,
            1960.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
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
            888.0,
            1960.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
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
            502.0,
            220.0,
            20.0
          ],
          "text": "13 \u00b7 AU DynamicsProcessor",
          "presentation": 1,
          "presentation_rect": [
            486.0,
            906.0,
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
          "varname": "TITLE_13"
        }
      },
      {
        "box": {
          "id": "obj-208",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1612.0,
            2060.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            906.0,
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
          "id": "obj-209",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1612.0,
            2090.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            1612.0,
            2120.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            2060.0,
            1572.0,
            20.0
          ],
          "text": "13 \u00b7 vst~ + plug_au AUDynamicsProcessor"
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
            30.0,
            2090.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-213",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            2090.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "signal",
            "signal",
            "",
            "list",
            "int",
            "",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2430.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            486.0,
            1086.0,
            214.0,
            22.0
          ],
          "varname": "VST_13"
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            2090.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            2118.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-217",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            2160.0,
            209.0,
            22.0
          ],
          "text": "plug_au AUDynamicsProcessor"
        }
      },
      {
        "box": {
          "id": "obj-218",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            230.0,
            2160.0,
            97.0,
            22.0
          ],
          "text": "s AU13_INIT"
        }
      },
      {
        "box": {
          "id": "obj-219",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            2090.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            486.0,
            930.0,
            50.0,
            22.0
          ]
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
            230.0,
            2200.0,
            97.0,
            22.0
          ],
          "text": "r AU13_INIT"
        }
      },
      {
        "box": {
          "id": "obj-221",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            230.0,
            2345.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST13"
        }
      },
      {
        "box": {
          "id": "obj-222",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2240.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2270.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            544.0,
            930.0,
            22.0,
            22.0
          ]
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
            528.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            570.0,
            932.0,
            60.0,
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
          "id": "obj-225",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2300.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-226",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            452.0,
            2240.0,
            62.0,
            22.0
          ],
          "text": "0.7083"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            452.0,
            2270.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            958.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            554.0,
            195.0,
            20.0
          ],
          "text": "threshold (\u2212100\u201320 dB)",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            960.0,
            158.0,
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
          "id": "obj-229",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            452.0,
            2300.0,
            202.0,
            22.0
          ],
          "text": "\"Compression Threshold\" $1"
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
            674.0,
            2240.0,
            62.0,
            22.0
          ],
          "text": "0.1378"
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            674.0,
            2270.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            982.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            580.0,
            178.0,
            20.0
          ],
          "text": "headroom (0.1\u201340 dB)",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            984.0,
            158.0,
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
          "id": "obj-233",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            674.0,
            2300.0,
            97.0,
            22.0
          ],
          "text": "Headroom $1"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            896.0,
            2240.0,
            62.0,
            22.0
          ],
          "text": "0.1639"
        }
      },
      {
        "box": {
          "id": "obj-235",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            896.0,
            2270.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            1006.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            606.0,
            152.0,
            20.0
          ],
          "text": "attack (1\u2013300 ms)",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1008.0,
            158.0,
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
          "id": "obj-237",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            896.0,
            2300.0,
            132.0,
            22.0
          ],
          "text": "\"Attack Time\" $1"
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
            1118.0,
            2240.0,
            62.0,
            22.0
          ],
          "text": "0.0067"
        }
      },
      {
        "box": {
          "id": "obj-239",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1118.0,
            2270.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            1030.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            632.0,
            169.0,
            20.0
          ],
          "text": "release (10 ms\u20133 s)",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1032.0,
            158.0,
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
          "id": "obj-241",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1118.0,
            2300.0,
            139.0,
            22.0
          ],
          "text": "\"Release Time\" $1"
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
            1340.0,
            2240.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-243",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1340.0,
            2270.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            486.0,
            1054.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            658.0,
            178.0,
            20.0
          ],
          "text": "master gain (\u00b140 dB)",
          "presentation": 1,
          "presentation_rect": [
            542.0,
            1056.0,
            158.0,
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
          "id": "obj-245",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1340.0,
            2300.0,
            132.0,
            22.0
          ],
          "text": "\"Master Gain\" $1"
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
            110.0,
            2390.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST13"
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
            2480.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
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
            120.0,
            2480.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            684.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            486.0,
            1114.0,
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
          "id": "obj-251",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
            169.0,
            20.0
          ],
          "text": "14 \u00b7 AU PeakLimiter",
          "presentation": 1,
          "presentation_rect": [
            724.0,
            906.0,
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
          "varname": "TITLE_14"
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
            916.0,
            2590.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            724.0,
            906.0,
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
          "id": "obj-253",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            916.0,
            2620.0,
            40.0,
            22.0
          ],
          "text": "13"
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
            916.0,
            2650.0,
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
            30.0,
            2590.0,
            876.0,
            20.0
          ],
          "text": "14 \u00b7 vst~ + plug_au AUPeakLimiter"
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
            30.0,
            2620.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            2620.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-258",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "signal",
            "signal",
            "",
            "list",
            "int",
            "",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            2960.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            724.0,
            1038.0,
            214.0,
            22.0
          ],
          "varname": "VST_14"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            2620.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            2648.0,
            55.0,
            22.0
          ],
          "text": "t b b"
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
            330.0,
            2690.0,
            167.0,
            22.0
          ],
          "text": "plug_au AUPeakLimiter"
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
            230.0,
            2690.0,
            97.0,
            22.0
          ],
          "text": "s AU14_INIT"
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
            470.0,
            2620.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            724.0,
            930.0,
            50.0,
            22.0
          ]
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
            230.0,
            2730.0,
            97.0,
            22.0
          ],
          "text": "r AU14_INIT"
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
            230.0,
            2875.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST14"
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
            230.0,
            2770.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-267",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2800.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            782.0,
            930.0,
            22.0,
            22.0
          ]
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
            2520.0,
            736.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            808.0,
            932.0,
            60.0,
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
          "id": "obj-269",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2830.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-270",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            2770.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-271",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            389.0,
            2800.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            724.0,
            958.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            762.0,
            152.0,
            20.0
          ],
          "text": "pre-gain (\u00b140 dB)",
          "presentation": 1,
          "presentation_rect": [
            780.0,
            960.0,
            158.0,
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
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            2830.0,
            97.0,
            22.0
          ],
          "text": "Pre-Gain $1"
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            2770.0,
            62.0,
            22.0
          ],
          "text": "0.0508"
        }
      },
      {
        "box": {
          "id": "obj-275",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            548.0,
            2800.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            724.0,
            982.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            788.0,
            161.0,
            20.0
          ],
          "text": "attack (0.5\u201330 ms)",
          "presentation": 1,
          "presentation_rect": [
            780.0,
            984.0,
            158.0,
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
          "id": "obj-277",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            2830.0,
            132.0,
            22.0
          ],
          "text": "\"Attack Time\" $1"
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
            707.0,
            2770.0,
            62.0,
            22.0
          ],
          "text": "0.1026"
        }
      },
      {
        "box": {
          "id": "obj-279",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            707.0,
            2800.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            724.0,
            1006.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            814.0,
            152.0,
            20.0
          ],
          "text": "release (1\u201340 ms)",
          "presentation": 1,
          "presentation_rect": [
            780.0,
            1008.0,
            158.0,
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
          "id": "obj-281",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            707.0,
            2830.0,
            139.0,
            22.0
          ],
          "text": "\"Release Time\" $1"
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
            110.0,
            2920.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST14"
        }
      },
      {
        "box": {
          "id": "obj-283",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3010.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_L"
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
            120.0,
            3010.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_R"
        }
      },
      {
        "box": {
          "id": "obj-285",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            724.0,
            1066.0,
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
          "id": "obj-287",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
            237.0,
            20.0
          ],
          "text": "15 \u00b7 AU MultibandCompressor",
          "presentation": 1,
          "presentation_rect": [
            962.0,
            906.0,
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
          "varname": "TITLE_15"
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
            1234.0,
            3120.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            906.0,
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
          "id": "obj-289",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1234.0,
            3150.0,
            40.0,
            22.0
          ],
          "text": "14"
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
            1234.0,
            3180.0,
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
            3120.0,
            1194.0,
            20.0
          ],
          "text": "15 \u00b7 vst~ + plug_au AUMultibandCompressor"
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
            30.0,
            3150.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            3150.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "signal",
            "signal",
            "",
            "list",
            "int",
            "",
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            3490.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            962.0,
            1086.0,
            214.0,
            22.0
          ],
          "varname": "VST_15"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            3150.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-296",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            3178.0,
            55.0,
            22.0
          ],
          "text": "t b b"
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
            330.0,
            3220.0,
            223.0,
            22.0
          ],
          "text": "plug_au AUMultibandCompressor"
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
            230.0,
            3220.0,
            97.0,
            22.0
          ],
          "text": "s AU15_INIT"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            3150.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            962.0,
            930.0,
            50.0,
            22.0
          ]
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
            230.0,
            3260.0,
            97.0,
            22.0
          ],
          "text": "r AU15_INIT"
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
            230.0,
            3405.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST15"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            3300.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            3330.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1020.0,
            930.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            1046.0,
            932.0,
            60.0,
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
          "id": "obj-305",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            3360.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            3300.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            389.0,
            3330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            958.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-308",
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
          "text": "pre-gain (\u00b140 dB)",
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            960.0,
            158.0,
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
          "id": "obj-309",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            3360.0,
            97.0,
            22.0
          ],
          "text": "Pre-Gain $1"
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            3300.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-311",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            548.0,
            3330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            982.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-312",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
            161.0,
            20.0
          ],
          "text": "post-gain (\u00b140 dB)",
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            984.0,
            158.0,
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
          "id": "obj-313",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            3360.0,
            104.0,
            22.0
          ],
          "text": "Post-Gain $1"
        }
      },
      {
        "box": {
          "id": "obj-314",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            707.0,
            3300.0,
            48.0,
            22.0
          ],
          "text": "0.78"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            707.0,
            3330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            1006.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-316",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
            203.0,
            20.0
          ],
          "text": "threshold 1 (\u2212100\u20130 dB)",
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            1008.0,
            158.0,
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
          "id": "obj-317",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            707.0,
            3360.0,
            132.0,
            22.0
          ],
          "text": "\"Threshold 1\" $1"
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
            866.0,
            3300.0,
            55.0,
            22.0
          ],
          "text": "0.397"
        }
      },
      {
        "box": {
          "id": "obj-319",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            866.0,
            3330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            1030.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            996.0,
            152.0,
            20.0
          ],
          "text": "attack (1\u2013200 ms)",
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            1032.0,
            158.0,
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
          "id": "obj-321",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            866.0,
            3360.0,
            132.0,
            22.0
          ],
          "text": "\"Attack Time\" $1"
        }
      },
      {
        "box": {
          "id": "obj-322",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1025.0,
            3300.0,
            62.0,
            22.0
          ],
          "text": "0.0368"
        }
      },
      {
        "box": {
          "id": "obj-323",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1025.0,
            3330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            962.0,
            1054.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            1022.0,
            169.0,
            20.0
          ],
          "text": "release (10 ms\u20133 s)",
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            1056.0,
            158.0,
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
          "id": "obj-325",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1025.0,
            3360.0,
            139.0,
            22.0
          ],
          "text": "\"Release Time\" $1"
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
            110.0,
            3450.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST15"
        }
      },
      {
        "box": {
          "id": "obj-327",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3540.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_L"
        }
      },
      {
        "box": {
          "id": "obj-328",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            3540.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_R"
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
            2520.0,
            1048.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            962.0,
            1114.0,
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
          "id": "obj-330",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3650.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201315 are the effects"
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
            30.0,
            3710.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-332",
          "maxclass": "newobj",
          "numinlets": 16,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3760.0,
            209.0,
            22.0
          ],
          "text": "selector~ 15 1 @ramptime 30"
        }
      },
      {
        "box": {
          "id": "obj-333",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3810.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
        }
      },
      {
        "box": {
          "id": "obj-338",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            1110.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
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
            1200.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_L"
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
            1290.0,
            3710.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_L"
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
            30.0,
            3840.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-349",
          "maxclass": "newobj",
          "numinlets": 16,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3890.0,
            209.0,
            22.0
          ],
          "text": "selector~ 15 1 @ramptime 30"
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
            30.0,
            3940.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            1020.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            1110.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
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
            1200.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_R"
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
            1290.0,
            3840.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_R"
        }
      },
      {
        "box": {
          "id": "obj-365",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3990.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            4020.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            4020.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
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
            200.0,
            4020.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            4020.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            410.0,
            4020.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
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
            500.0,
            4020.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-372",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            4060.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-373",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            4060.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-374",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            4110.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-375",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            4110.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-376",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            4110.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-377",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            4110.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-378",
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
            4170.0,
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
          "id": "obj-379",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            4250.0,
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
          "id": "obj-380",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3990.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            4020.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-382",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            4060.0,
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
          "id": "obj-383",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            4100.0,
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
          "id": "obj-384",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            4140.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            4180.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            4180.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
        }
      },
      {
        "box": {
          "id": "obj-387",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            4220.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-388",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            4220.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            780.0,
            4260.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
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
            930.0,
            4260.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-393",
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
          "id": "obj-394",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1100.0,
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
          "id": "obj-395",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1126.0,
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
          "id": "obj-396",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1152.0,
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
          "id": "obj-397",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1178.0,
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
          "id": "obj-398",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1204.0,
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
          "id": "obj-399",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1230.0,
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
          "id": "obj-400",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1256.0,
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
          "id": "obj-401",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1282.0,
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
          "id": "obj-402",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1308.0,
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
          "id": "obj-403",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1334.0,
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
          "id": "obj-404",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1360.0,
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
          "id": "obj-405",
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
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            400.0,
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
          "id": "obj-57",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            400.0,
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
          "id": "obj-74",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            378.0,
            400.0,
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
          "id": "obj-91",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            562.0,
            400.0,
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
          "id": "obj-108",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            746.0,
            400.0,
            176.0,
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
          "id": "obj-125",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            930.0,
            400.0,
            176.0,
            238.0
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
          "id": "obj-141",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1114.0,
            400.0,
            176.0,
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
          "id": "obj-158",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            648.0,
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
          "id": "obj-171",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            194.0,
            648.0,
            355.0,
            160.0
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
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            557.0,
            648.0,
            568.0,
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
          "id": "obj-194",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            900.0,
            460.0,
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
          "id": "obj-206",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            478.0,
            900.0,
            230.0,
            261.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            716.0,
            900.0,
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
          "id": "obj-286",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            954.0,
            900.0,
            230.0,
            261.0
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
          "id": "obj-391",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            600.0,
            380.0
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
          "id": "obj-392",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1080.0,
            4320.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            10.0,
            670.0,
            380.0
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
            4380.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"DYNAMICS SHOOTOUT \\u2014 compressors, limiters, companders and gain shapers. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ]\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ]\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ]\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 15, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ]\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        324\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 15,\n        \"num_lines_presentation\": 15,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 omx.comp~\",\n              \"3 omx.peaklim~\",\n              \"4 omx.4band~\",\n              \"5 omx.5band~\",\n              \"6 limi~\",\n              \"7 abl compressor~\",\n              \"8 abl limiter~\",\n              \"9 abl compander~\",\n              \"10 BEAP Compressor\",\n              \"11 amxd Max Compressor\",\n              \"12 amxd Dynamical\",\n              \"13 AU Dynamics\",\n              \"14 AU PeakLimiter\",\n              \"15 AU Multiband\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 14,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ]\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 15 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        }\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ]\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ]\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ]\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      }\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ]\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        400,\n        176,\n        114.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 omx.comp~\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        18,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      }\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        575,\n        520\n      ],\n      \"presentation\": [\n        18,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        575,\n        550\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        575,\n        580\n      ]\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 omx.comp~ \\u2014 OctiMax broadcast compressor (presets via choosePreset)\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        535,\n        20\n      ]\n    },\n    \"f02_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        550\n      ]\n    },\n    \"f02_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        550\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"omx.comp~\",\n      \"pos\": [\n        30,\n        672\n      ],\n      \"presentation\": [\n        18,\n        480,\n        160,\n        22.0\n      ]\n    },\n    \"f02_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        220,\n        550\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        160,\n        590\n      ],\n      \"size\": [\n        100,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"Guitar\",\n          \",\",\n          \"Bass\",\n          \",\",\n          \"Vocal\",\n          \",\",\n          \"Drums\",\n          \",\",\n          \"Program\",\n          \"Material\"\n        ]\n      },\n      \"presentation\": [\n        18,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f02_c0_m\": {\n      \"type\": \"message\",\n      \"text\": \"choosePreset $1\",\n      \"pos\": [\n        160,\n        620\n      ]\n    },\n    \"f02_c1\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        300,\n        590\n      ],\n      \"presentation\": [\n        18,\n        454,\n        22,\n        22\n      ]\n    },\n    \"f02_c1_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        300,\n        620\n      ]\n    },\n    \"f02_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        46,\n        456,\n        132,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        717\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        717\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        400,\n        176,\n        114.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 omx.peaklim~\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        202,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      }\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1185,\n        520\n      ],\n      \"presentation\": [\n        202,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1185,\n        550\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1185,\n        580\n      ]\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 omx.peaklim~ \\u2014 OctiMax peak limiter\",\n      \"pos\": [\n        715,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f03_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        715,\n        550\n      ]\n    },\n    \"f03_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        795,\n        550\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"omx.peaklim~\",\n      \"pos\": [\n        715,\n        672\n      ],\n      \"presentation\": [\n        202,\n        480,\n        160,\n        22.0\n      ]\n    },\n    \"f03_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        905,\n        550\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        845,\n        590\n      ],\n      \"size\": [\n        100,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"Punchy\",\n          \",\",\n          \"Smooth\"\n        ]\n      },\n      \"presentation\": [\n        202,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f03_c0_m\": {\n      \"type\": \"message\",\n      \"text\": \"mode $1\",\n      \"pos\": [\n        845,\n        620\n      ]\n    },\n    \"f03_c1\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        985,\n        590\n      ],\n      \"presentation\": [\n        202,\n        454,\n        22,\n        22\n      ]\n    },\n    \"f03_c1_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        985,\n        620\n      ]\n    },\n    \"f03_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        230,\n        456,\n        132,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        715,\n        717\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        805,\n        717\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        378,\n        400,\n        176,\n        114.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 omx.4band~\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        386,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      }\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1795,\n        520\n      ],\n      \"presentation\": [\n        386,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1795,\n        550\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1795,\n        580\n      ]\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 omx.4band~ \\u2014 OctiMax 4-band compressor\",\n      \"pos\": [\n        1325,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1325,\n        550\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1405,\n        550\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"omx.4band~\",\n      \"pos\": [\n        1325,\n        672\n      ],\n      \"presentation\": [\n        386,\n        480,\n        160,\n        22.0\n      ]\n    },\n    \"f04_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1515,\n        550\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        1455,\n        590\n      ],\n      \"size\": [\n        100,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"Standard\",\n          \",\",\n          \"Pop\",\n          \",\",\n          \"Movies\"\n        ]\n      },\n      \"presentation\": [\n        386,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f04_c0_m\": {\n      \"type\": \"message\",\n      \"text\": \"choosePreset $1\",\n      \"pos\": [\n        1455,\n        620\n      ]\n    },\n    \"f04_c1\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        1595,\n        590\n      ],\n      \"presentation\": [\n        386,\n        454,\n        22,\n        22\n      ]\n    },\n    \"f04_c1_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        1595,\n        620\n      ]\n    },\n    \"f04_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        414,\n        456,\n        132,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1325,\n        717\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1415,\n        717\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        562,\n        400,\n        176,\n        114.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 omx.5band~\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        570,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      }\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        817\n      ],\n      \"presentation\": [\n        570,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        500,\n        847\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        877\n      ]\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 omx.5band~ \\u2014 OctiMax 5-band compressor\",\n      \"pos\": [\n        30,\n        817\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f05_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        847\n      ]\n    },\n    \"f05_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        847\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"omx.5band~\",\n      \"pos\": [\n        30,\n        969\n      ],\n      \"presentation\": [\n        570,\n        480,\n        160,\n        22.0\n      ]\n    },\n    \"f05_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        220,\n        847\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        160,\n        887\n      ],\n      \"size\": [\n        100,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"Universal\",\n          \",\",\n          \"Pop\",\n          \",\",\n          \"Hit_Radio\",\n          \",\",\n          \"FM_Radio\"\n        ]\n      },\n      \"presentation\": [\n        570,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f05_c0_m\": {\n      \"type\": \"message\",\n      \"text\": \"choosePreset $1\",\n      \"pos\": [\n        160,\n        917\n      ]\n    },\n    \"f05_c1\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        300,\n        887\n      ],\n      \"presentation\": [\n        570,\n        454,\n        22,\n        22\n      ]\n    },\n    \"f05_c1_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        300,\n        917\n      ]\n    },\n    \"f05_c1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        598,\n        456,\n        132,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1014\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        120,\n        1014\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        746,\n        400,\n        176,\n        210.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 limi~\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        84,\n        20\n      ],\n      \"presentation\": [\n        754,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      }\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        817\n      ],\n      \"presentation\": [\n        754,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1110,\n        847\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        877\n      ]\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 limi~ 2 \\u2014 lookahead peak limiter, stereo\",\n      \"pos\": [\n        640,\n        817\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        640,\n        847\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        720,\n        847\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"limi~ 2\",\n      \"pos\": [\n        640,\n        1073\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ],\n      \"presentation\": [\n        754,\n        576,\n        160,\n        22.0\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        770,\n        887\n      ],\n      \"attrs\": {\n        \"attr\": \"threshold\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f06_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        790,\n        913\n      ],\n      \"attrs\": {\n        \"attr\": \"preamp\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        454,\n        160,\n        22\n      ]\n    },\n    \"f06_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        810,\n        939\n      ],\n      \"attrs\": {\n        \"attr\": \"postamp\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        478,\n        160,\n        22\n      ]\n    },\n    \"f06_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        830,\n        965\n      ],\n      \"attrs\": {\n        \"attr\": \"release\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        502,\n        160,\n        22\n      ]\n    },\n    \"f06_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        850,\n        991\n      ],\n      \"attrs\": {\n        \"attr\": \"lookahead\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        526,\n        160,\n        22\n      ]\n    },\n    \"f06_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        870,\n        1017\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        754,\n        550,\n        160,\n        22\n      ]\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        640,\n        1118\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        730,\n        1118\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        930,\n        400,\n        176,\n        238.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl compressor~\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        938,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      }\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1968,\n        817\n      ],\n      \"presentation\": [\n        938,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1968,\n        847\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1968,\n        877\n      ]\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl.device.compressor~ \\u2014 Live's Compressor (mono; help file's attack / release / threshold)\",\n      \"pos\": [\n        1250,\n        817\n      ],\n      \"size\": [\n        708,\n        20\n      ]\n    },\n    \"f07_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        1250,\n        847\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.compressor~ @attack 0.02 @release 0.08 @threshold -20\",\n      \"pos\": [\n        1250,\n        1047\n      ],\n      \"presentation\": [\n        938,\n        552,\n        160,\n        50.0\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1380,\n        887\n      ],\n      \"attrs\": {\n        \"attr\": \"threshold\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f07_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1400,\n        913\n      ],\n      \"attrs\": {\n        \"attr\": \"ratio\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        454,\n        160,\n        22\n      ]\n    },\n    \"f07_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1420,\n        939\n      ],\n      \"attrs\": {\n        \"attr\": \"attack\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        478,\n        160,\n        22\n      ]\n    },\n    \"f07_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1440,\n        965\n      ],\n      \"attrs\": {\n        \"attr\": \"release\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        502,\n        160,\n        22\n      ]\n    },\n    \"f07_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1460,\n        991\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        938,\n        526,\n        160,\n        22\n      ]\n    },\n    \"f07_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        938,\n        608.0,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1250,\n        1092\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1340,\n        1092\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1114,\n        400,\n        176,\n        210.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 abl limiter~\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        1122,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      }\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1218\n      ],\n      \"presentation\": [\n        1122,\n        406,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        500,\n        1248\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1278\n      ]\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 abl.device.limiter~ \\u2014 Live's Limiter\",\n      \"pos\": [\n        30,\n        1218\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f08_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1248\n      ]\n    },\n    \"f08_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1248\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.limiter~\",\n      \"pos\": [\n        30,\n        1474\n      ],\n      \"presentation\": [\n        1122,\n        576,\n        160,\n        22.0\n      ]\n    },\n    \"f08_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        1288\n      ],\n      \"attrs\": {\n        \"attr\": \"ceiling\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        430,\n        160,\n        22\n      ]\n    },\n    \"f08_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        1314\n      ],\n      \"attrs\": {\n        \"attr\": \"gain\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        454,\n        160,\n        22\n      ]\n    },\n    \"f08_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        1340\n      ],\n      \"attrs\": {\n        \"attr\": \"release\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        478,\n        160,\n        22\n      ]\n    },\n    \"f08_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        1366\n      ],\n      \"attrs\": {\n        \"attr\": \"lookahead\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        502,\n        160,\n        22\n      ]\n    },\n    \"f08_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        1392\n      ],\n      \"attrs\": {\n        \"attr\": \"autorelease\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        526,\n        160,\n        22\n      ]\n    },\n    \"f08_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        1418\n      ],\n      \"attrs\": {\n        \"attr\": \"maximize\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        1122,\n        550,\n        160,\n        22\n      ]\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1519\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        120,\n        1519\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        648.0,\n        176,\n        138.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 abl compander~\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        18,\n        654.0,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      }\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1110,\n        1218\n      ],\n      \"presentation\": [\n        18,\n        654.0,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1110,\n        1248\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1110,\n        1278\n      ]\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 abl.dsp.compander~ \\u2014 compressor / expander (mono)\",\n      \"pos\": [\n        640,\n        1218\n      ],\n      \"size\": [\n        460,\n        20\n      ]\n    },\n    \"f09_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        640,\n        1248\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.compander~\",\n      \"pos\": [\n        640,\n        1370\n      ],\n      \"presentation\": [\n        18,\n        728.0,\n        160,\n        22.0\n      ]\n    },\n    \"f09_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        770,\n        1288\n      ],\n      \"attrs\": {\n        \"attr\": \"mode\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        678.0,\n        160,\n        22\n      ]\n    },\n    \"f09_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        790,\n        1314\n      ],\n      \"attrs\": {\n        \"attr\": \"shape\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        702.0,\n        160,\n        22\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        756.0,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        640,\n        1415\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        730,\n        1415\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        194,\n        648.0,\n        355,\n        160\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 BEAP Compressor\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        202,\n        654.0,\n        339,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      }\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1639,\n        1218\n      ],\n      \"presentation\": [\n        202,\n        654.0,\n        339,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1639,\n        1248\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1639,\n        1278\n      ]\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 bp.Compressor \\u2014 BEAP stereo compressor\",\n      \"pos\": [\n        1250,\n        1218\n      ],\n      \"size\": [\n        379,\n        20\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1250,\n        1248\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1330,\n        1248\n      ]\n    },\n    \"f10_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1250,\n        1288\n      ],\n      \"size\": [\n        339,\n        116\n      ],\n      \"presentation\": [\n        202,\n        678.0,\n        339,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_COMPRESSOR\",\n        \"comment\": \"in 0: signal | in 1: signal | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 2,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          34.0,\n          79.0,\n          1612.0,\n          937.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"assistshowspatchername\": 0,\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-15\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                1030.5,\n                995.0,\n                67.0,\n                22.0\n              ],\n              \"text\": \"pastebang\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-14\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                76.0,\n                136.0,\n                178.0,\n                20.0\n              ],\n              \"text\": \"## Stereo compressor effect ##\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 7,\n              \"outlettype\": [\n                \"bang\",\n                \"int\",\n                \"int\",\n                \"bang\",\n                \"bang\",\n                \"bang\",\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                1030.5,\n                1053.0,\n                82.0,\n                22.0\n              ],\n              \"text\": \"t b i i b b b b\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-63\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 6,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                583.0,\n                717.0,\n                92.0,\n                22.0\n              ],\n              \"text\": \"scale 1 48 0 99\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-57\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 6,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                411.0,\n                836.0,\n                103.0,\n                22.0\n              ],\n              \"text\": \"scale -36 0 0 100\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-7\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1591.0,\n                1140.0,\n                89.0,\n                23.0\n              ],\n              \"text\": \"limEnabled 0\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-24\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1483.0,\n                1140.0,\n                84.0,\n                23.0\n              ],\n              \"text\": \"ngEnabled 0\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-53\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1411.0,\n                1140.0,\n                66.0,\n                23.0\n              ],\n              \"text\": \"meters 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-16\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                337.5,\n                1354.0,\n                52.5,\n                22.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-17\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                263.5,\n                1354.0,\n                52.5,\n                22.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-20\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                289.0,\n                1295.0,\n                41.0,\n                22.0\n              ],\n              \"text\": \"dbtoa\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"id\": \"obj-44\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                289.0,\n                1232.0,\n                27.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                43.0,\n                42.578125,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Input\",\n                  \"parameter_mmax\": 42.0,\n                  \"parameter_mmin\": -42.0,\n                  \"parameter_shortname\": \"Input\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 4\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Input\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                638.5,\n                1663.0,\n                52.5,\n                22.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-10\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                564.5,\n                1663.0,\n                52.5,\n                22.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-1\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                590.0,\n                1604.0,\n                41.0,\n                22.0\n              ],\n              \"text\": \"dbtoa\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"id\": \"obj-2\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                590.0,\n                1541.0,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                259.6343994140625,\n                43.0,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Output\",\n                  \"parameter_mmax\": 42.0,\n                  \"parameter_mmin\": -42.0,\n                  \"parameter_shortname\": \"Output\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 4\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Output\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-34\",\n              \"maxclass\": \"slider\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"orientation\": 2,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                845.0,\n                648.0,\n                18.0,\n                144.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    120\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"slider[3]\",\n                  \"parameter_mmax\": 150.0,\n                  \"parameter_shortname\": \"slider[3]\",\n                  \"parameter_type\": 3\n                }\n              },\n              \"size\": 151.0,\n              \"varname\": \"slider[3]\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-35\",\n              \"maxclass\": \"slider\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"orientation\": 2,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                759.0,\n                648.0,\n                18.0,\n                144.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    145\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"slider[2]\",\n                  \"parameter_mmax\": 150.0,\n                  \"parameter_shortname\": \"slider[2]\",\n                  \"parameter_type\": 3\n                }\n              },\n              \"size\": 151.0,\n              \"varname\": \"slider[2]\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-38\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                845.0,\n                836.0,\n                75.0,\n                23.0\n              ],\n              \"text\": \"release $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-39\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                759.0,\n                836.0,\n                70.0,\n                23.0\n              ],\n              \"text\": \"attack $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"bgcolor\": [\n                0.866667,\n                0.866667,\n                0.866667,\n                1.0\n              ],\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"htricolor\": [\n                0.87,\n                0.82,\n                0.24,\n                1.0\n              ],\n              \"id\": \"obj-40\",\n              \"maxclass\": \"number\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"bang\"\n              ],\n              \"parameter_enable\": 0,\n              \"patching_rect\": [\n                639.0,\n                940.0,\n                41.0,\n                23.0\n              ],\n              \"textcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"tricolor\": [\n                0.75,\n                0.75,\n                0.75,\n                1.0\n              ],\n              \"triscale\": 0.9\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-41\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                639.0,\n                968.0,\n                60.0,\n                23.0\n              ],\n              \"text\": \"ratio $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"hidden\": 1,\n              \"id\": \"obj-43\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                400.0,\n                896.0,\n                114.0,\n                23.0\n              ],\n              \"text\": \"agcThreshold $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                833.588562,\n                1480.5,\n                47.0,\n                23.0\n              ],\n              \"text\": \"$1 $2\"\n            }\n          },\n          {\n            \"box\": {\n              \"bgcolor\": [\n                1.0,\n                0.248882,\n                0.379825,\n                1.0\n              ],\n              \"candicane2\": [\n                0.145098,\n                0.203922,\n                0.356863,\n                1.0\n              ],\n              \"candicane3\": [\n                0.290196,\n                0.411765,\n                0.713726,\n                1.0\n              ],\n              \"candicane4\": [\n                0.439216,\n                0.619608,\n                0.070588,\n                1.0\n              ],\n              \"candicane5\": [\n                0.584314,\n                0.827451,\n                0.431373,\n                1.0\n              ],\n              \"candicane6\": [\n                0.733333,\n                0.035294,\n                0.788235,\n                1.0\n              ],\n              \"candicane7\": [\n                0.878431,\n                0.243137,\n                0.145098,\n                1.0\n              ],\n              \"candicane8\": [\n                0.027451,\n                0.447059,\n                0.501961,\n                1.0\n              ],\n              \"id\": \"obj-46\",\n              \"maxclass\": \"multislider\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 0,\n              \"patching_rect\": [\n                833.588562,\n                1518.0,\n                28.0,\n                98.0\n              ],\n              \"peakcolor\": [\n                0.498039,\n                0.498039,\n                0.498039,\n                1.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                248.38421630859375,\n                43.0,\n                11.0,\n                47.0\n              ],\n              \"setminmax\": [\n                0.0,\n                250.0\n              ],\n              \"setstyle\": 1,\n              \"settype\": 0,\n              \"size\": 2,\n              \"slidercolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-62\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1310.0,\n                1140.0,\n                89.0,\n                23.0\n              ],\n              \"text\": \"meterRate 25\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                648.5,\n                1699.0,\n                32.5,\n                22.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-3\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                564.5,\n                1699.0,\n                32.5,\n                22.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-96\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                654.0,\n                1781.0,\n                33.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                300.16668701171875,\n                97.0,\n                33.0,\n                17.0\n              ],\n              \"text\": \"Right\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-97\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                345.25,\n                1199.0,\n                33.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                300.16668701171875,\n                0.0,\n                33.0,\n                17.0\n              ],\n              \"text\": \"Right\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-95\",\n              \"index\": 2,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                648.5,\n                1750.0,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-94\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                566.588562,\n                1750.0,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-93\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                342.75,\n                1232.0,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-92\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                205.0,\n                1225.0,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"coldcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hotcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-89\",\n              \"maxclass\": \"live.meter~\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"float\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                725.0,\n                1699.0,\n                21.0,\n                99.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                319.4864807128906,\n                43.0,\n                11.0,\n                47.0\n              ],\n              \"warmcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"coldcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hotcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-90\",\n              \"maxclass\": \"live.meter~\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"float\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                509.411438,\n                1713.0,\n                21.0,\n                99.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                306.3979187011719,\n                43.0,\n                11.0,\n                47.0\n              ],\n              \"warmcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"coldcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hotcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-88\",\n              \"maxclass\": \"live.meter~\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"float\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                312.0,\n                1410.0,\n                21.0,\n                99.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                56.5,\n                43.0,\n                11.0,\n                47.0\n              ],\n              \"warmcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-87\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.75,\n                1279.0,\n                42.0,\n                22.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-86\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                213.0,\n                1289.0,\n                42.0,\n                22.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"coldcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hotcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-85\",\n              \"maxclass\": \"live.meter~\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"float\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                282.499969,\n                1410.0,\n                21.0,\n                99.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                44.578125,\n                43.0,\n                11.0,\n                47.0\n              ],\n              \"warmcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-78\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                583.0,\n                611.5,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                116.94407653808594,\n                43.0,\n                49.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    99\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Ratio\",\n                  \"parameter_mmax\": 48.0,\n                  \"parameter_mmin\": 1.0,\n                  \"parameter_shortname\": \"Ratio\",\n                  \"parameter_type\": 1,\n                  \"parameter_units\": \":1\",\n                  \"parameter_unitstyle\": 9\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Ratio\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-52\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                411.0,\n                768.0,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                71.0,\n                43.0,\n                49.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    50\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Threshold\",\n                  \"parameter_mmax\": 0.0,\n                  \"parameter_mmin\": -36.0,\n                  \"parameter_shortname\": \"Threshold\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 4\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Threshold\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"annotation\": \"arbitrary units - higher numbers are faster\",\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"hint\": \"arbitrary units - higher numbers are faster\",\n              \"id\": \"obj-47\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                844.0,\n                555.0,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                196.8322296142578,\n                43.0,\n                49.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    120\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Release\",\n                  \"parameter_mmax\": 150.0,\n                  \"parameter_shortname\": \"Release\",\n                  \"parameter_type\": 1,\n                  \"parameter_unitstyle\": 0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Release\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-66\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1166.0,\n                1128.0,\n                111.0,\n                22.0\n              ],\n              \"text\": \"channelCoupling 0\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-67\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                977.411438,\n                1128.0,\n                93.0,\n                22.0\n              ],\n              \"text\": \"smoothGain $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-84\",\n              \"linecount\": 2,\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1076.411377,\n                1128.0,\n                74.0,\n                35.0\n              ],\n              \"text\": \"progressiveRelease $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-114\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                869.411438,\n                1128.0,\n                82.0,\n                22.0\n              ],\n              \"text\": \"agcEnabled 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-115\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                528.411438,\n                1084.0,\n                65.0,\n                22.0\n              ],\n              \"text\": \"bypass $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-73\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\",\n                \"list\",\n                \"list\"\n              ],\n              \"patching_rect\": [\n                612.911438,\n                1419.5,\n                78.0,\n                23.0\n              ],\n              \"text\": \"omx.comp~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                84.25,\n                202.0,\n                59.5,\n                22.0\n              ],\n              \"restore\": {\n                \"Attack\": [\n                  133.0\n                ],\n                \"Bypass\": [\n                  0.0\n                ],\n                \"Input\": [\n                  0.0\n                ],\n                \"Output\": [\n                  9.061418\n                ],\n                \"Ratio\": [\n                  44.0\n                ],\n                \"Release\": [\n                  135.0\n                ],\n                \"Threshold\": [\n                  -26.929134\n                ],\n                \"slider[2]\": [\n                  133\n                ],\n                \"slider[3]\": [\n                  135\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u095008398\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                213.0,\n                1199.0,\n                27.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                27.0,\n                17.0\n              ],\n              \"text\": \"Left\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"annotation\": \"arbitrary units - higher numbers are faster\",\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"hint\": \"arbitrary units - higher numbers are faster\",\n              \"id\": \"obj-28\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                759.0,\n                555.0,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                154.88815307617188,\n                43.0,\n                49.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    145\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Attack\",\n                  \"parameter_mmax\": 150.0,\n                  \"parameter_shortname\": \"Attack\",\n                  \"parameter_type\": 1,\n                  \"parameter_unitstyle\": 0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Attack\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                566.588562,\n                1786.883911,\n                27.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                27.0,\n                17.0\n              ],\n              \"text\": \"Left\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-12\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                528.411438,\n                984.0,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                284.16668701171875,\n                19.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_defer\": 1,\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_longname\": \"Bypass\",\n                  \"parameter_mmax\": 1,\n                  \"parameter_shortname\": \"Bypass\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"Bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                76.0,\n                97.0,\n                76.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                76.0,\n                17.0\n              ],\n              \"text\": \"COMPRESSOR\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-51\",\n              \"maxclass\": \"panel\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                220.0,\n                77.166626,\n                120.0,\n                5.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                76.0,\n                77.166626,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                120.337189,\n                77.166626,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                163.079285,\n                77.166626,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                1\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-3\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-90\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-11\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-89\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-11\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-114\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-115\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-115\",\n                0\n              ],\n              \"source\": [\n                \"obj-12\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-9\",\n                0\n              ],\n              \"source\": [\n                \"obj-15\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                1\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-16\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-88\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-16\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-85\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-1\",\n                0\n              ],\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                1\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-46\",\n                0\n              ],\n              \"midpoints\": [\n                843.088562,\n                1508.25,\n                843.088562,\n                1508.25\n              ],\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-35\",\n                0\n              ],\n              \"source\": [\n                \"obj-28\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-94\",\n                0\n              ],\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-38\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-34\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-39\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-35\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-39\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-95\",\n                0\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-41\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-40\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"hidden\": 1,\n              \"source\": [\n                \"obj-43\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-20\",\n                0\n              ],\n              \"source\": [\n                \"obj-44\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"source\": [\n                \"obj-47\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-57\",\n                0\n              ],\n              \"source\": [\n                \"obj-52\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-53\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                0\n              ],\n              \"source\": [\n                \"obj-57\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-62\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-40\",\n                0\n              ],\n              \"source\": [\n                \"obj-63\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-66\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-67\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"source\": [\n                \"obj-73\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                0\n              ],\n              \"source\": [\n                \"obj-73\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                0\n              ],\n              \"source\": [\n                \"obj-73\",\n                3\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-63\",\n                0\n              ],\n              \"source\": [\n                \"obj-78\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-84\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                0\n              ],\n              \"source\": [\n                \"obj-86\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                0\n              ],\n              \"source\": [\n                \"obj-87\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-114\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-24\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                5\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-53\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                4\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-66\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                3\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-67\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-7\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                6\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-84\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                2\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-86\",\n                0\n              ],\n              \"source\": [\n                \"obj-92\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-87\",\n                0\n              ],\n              \"source\": [\n                \"obj-93\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1250,\n        1439\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1529,\n        1439\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        557,\n        648.0,\n        568,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd Max Compressor\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        565,\n        654.0,\n        492,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      }\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        608,\n        1619\n      ],\n      \"presentation\": [\n        565,\n        654.0,\n        492,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        608,\n        1649\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        608,\n        1679\n      ]\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd~ Max Compressor.amxd \\u2014 omx.comp~ with a full interface\",\n      \"pos\": [\n        30,\n        1619\n      ],\n      \"size\": [\n        568,\n        20\n      ]\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1649\n      ],\n      \"presentation\": [\n        1067,\n        654.0,\n        50,\n        22\n      ]\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1649\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1649\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max Compressor.amxd\\\"\",\n      \"pos\": [\n        30,\n        1729\n      ],\n      \"size\": [\n        548,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        565,\n        680.0,\n        548,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_11\"\n      }\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        1960\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        170,\n        1960\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        900.0,\n        460,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd Dynamical\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        906.0,\n        384,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      }\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1322,\n        1619\n      ],\n      \"presentation\": [\n        18,\n        906.0,\n        384,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1322,\n        1649\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1322,\n        1679\n      ]\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd~ Dynamical.amxd \\u2014 drawable dynamics curve: compress, expand, gate\",\n      \"pos\": [\n        748,\n        1619\n      ],\n      \"size\": [\n        564,\n        20\n      ]\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        748,\n        1649\n      ],\n      \"presentation\": [\n        412,\n        906.0,\n        50,\n        22\n      ]\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        818,\n        1649\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        898,\n        1649\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Dynamical.amxd\",\n      \"pos\": [\n        748,\n        1729\n      ],\n      \"size\": [\n        440,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        932.0,\n        440,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_12\"\n      }\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        748,\n        1960\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        888,\n        1960\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        478,\n        900.0,\n        230,\n        261.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 AU DynamicsProcessor\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        486,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      }\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1612,\n        2060\n      ],\n      \"presentation\": [\n        486,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        1612,\n        2090\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1612,\n        2120\n      ]\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 vst~ + plug_au AUDynamicsProcessor\",\n      \"pos\": [\n        30,\n        2060\n      ],\n      \"size\": [\n        1572,\n        20\n      ]\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2090\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2090\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2430\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        486,\n        1086.0,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_13\"\n      }\n    },\n    \"f13_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        2090\n      ]\n    },\n    \"f13_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        2118\n      ]\n    },\n    \"f13_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUDynamicsProcessor\",\n      \"pos\": [\n        330,\n        2160\n      ]\n    },\n    \"f13_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU13_INIT\",\n      \"pos\": [\n        230,\n        2160\n      ]\n    },\n    \"f13_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        2090\n      ],\n      \"presentation\": [\n        486,\n        930.0,\n        50,\n        22\n      ]\n    },\n    \"f13_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU13_INIT\",\n      \"pos\": [\n        230,\n        2200\n      ]\n    },\n    \"f13_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST13\",\n      \"pos\": [\n        230,\n        2345\n      ]\n    },\n    \"f13_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2240\n      ]\n    },\n    \"f13_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2270\n      ],\n      \"presentation\": [\n        544,\n        930.0,\n        22,\n        22\n      ]\n    },\n    \"f13_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        570,\n        932.0,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        2300\n      ]\n    },\n    \"f13_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.7083\",\n      \"pos\": [\n        452,\n        2240\n      ]\n    },\n    \"f13_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        452,\n        2270\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        486,\n        958.0,\n        50,\n        22\n      ]\n    },\n    \"f13_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"threshold (\\u2212100\\u201320 dB)\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        542,\n        960.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Compression Threshold\\\" $1\",\n      \"pos\": [\n        452,\n        2300\n      ]\n    },\n    \"f13_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.1378\",\n      \"pos\": [\n        674,\n        2240\n      ]\n    },\n    \"f13_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        674,\n        2270\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        486,\n        982.0,\n        50,\n        22\n      ]\n    },\n    \"f13_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"headroom (0.1\\u201340 dB)\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        542,\n        984.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Headroom $1\",\n      \"pos\": [\n        674,\n        2300\n      ]\n    },\n    \"f13_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.1639\",\n      \"pos\": [\n        896,\n        2240\n      ]\n    },\n    \"f13_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        896,\n        2270\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        486,\n        1006.0,\n        50,\n        22\n      ]\n    },\n    \"f13_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"attack (1\\u2013300 ms)\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        542,\n        1008.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Attack Time\\\" $1\",\n      \"pos\": [\n        896,\n        2300\n      ]\n    },\n    \"f13_p4_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0067\",\n      \"pos\": [\n        1118,\n        2240\n      ]\n    },\n    \"f13_p4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1118,\n        2270\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        486,\n        1030.0,\n        50,\n        22\n      ]\n    },\n    \"f13_p4_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"release (10 ms\\u20133 s)\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        542,\n        1032.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p4_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Release Time\\\" $1\",\n      \"pos\": [\n        1118,\n        2300\n      ]\n    },\n    \"f13_p5_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        1340,\n        2240\n      ]\n    },\n    \"f13_p5\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1340,\n        2270\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        486,\n        1054.0,\n        50,\n        22\n      ]\n    },\n    \"f13_p5_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master gain (\\u00b140 dB)\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        542,\n        1056.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_p5_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Master Gain\\\" $1\",\n      \"pos\": [\n        1340,\n        2300\n      ]\n    },\n    \"f13_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST13\",\n      \"pos\": [\n        110,\n        2390\n      ]\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        30,\n        2480\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        120,\n        2480\n      ]\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        486,\n        1114.0,\n        214,\n        37.0\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      }\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        716,\n        900.0,\n        230,\n        213.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 AU PeakLimiter\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        724,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      }\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        916,\n        2590\n      ],\n      \"presentation\": [\n        724,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        916,\n        2620\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        916,\n        2650\n      ]\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 vst~ + plug_au AUPeakLimiter\",\n      \"pos\": [\n        30,\n        2590\n      ],\n      \"size\": [\n        876,\n        20\n      ]\n    },\n    \"f14_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2620\n      ]\n    },\n    \"f14_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2620\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2960\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        724,\n        1038.0,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_14\"\n      }\n    },\n    \"f14_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        2620\n      ]\n    },\n    \"f14_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        2648\n      ]\n    },\n    \"f14_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUPeakLimiter\",\n      \"pos\": [\n        330,\n        2690\n      ]\n    },\n    \"f14_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU14_INIT\",\n      \"pos\": [\n        230,\n        2690\n      ]\n    },\n    \"f14_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        2620\n      ],\n      \"presentation\": [\n        724,\n        930.0,\n        50,\n        22\n      ]\n    },\n    \"f14_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU14_INIT\",\n      \"pos\": [\n        230,\n        2730\n      ]\n    },\n    \"f14_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST14\",\n      \"pos\": [\n        230,\n        2875\n      ]\n    },\n    \"f14_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2770\n      ]\n    },\n    \"f14_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2800\n      ],\n      \"presentation\": [\n        782,\n        930.0,\n        22,\n        22\n      ]\n    },\n    \"f14_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        808,\n        932.0,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        2830\n      ]\n    },\n    \"f14_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        389,\n        2770\n      ]\n    },\n    \"f14_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        389,\n        2800\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        724,\n        958.0,\n        50,\n        22\n      ]\n    },\n    \"f14_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"pre-gain (\\u00b140 dB)\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        780,\n        960.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"Pre-Gain $1\",\n      \"pos\": [\n        389,\n        2830\n      ]\n    },\n    \"f14_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0508\",\n      \"pos\": [\n        548,\n        2770\n      ]\n    },\n    \"f14_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        548,\n        2800\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        724,\n        982.0,\n        50,\n        22\n      ]\n    },\n    \"f14_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"attack (0.5\\u201330 ms)\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        780,\n        984.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Attack Time\\\" $1\",\n      \"pos\": [\n        548,\n        2830\n      ]\n    },\n    \"f14_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.1026\",\n      \"pos\": [\n        707,\n        2770\n      ]\n    },\n    \"f14_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        707,\n        2800\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        724,\n        1006.0,\n        50,\n        22\n      ]\n    },\n    \"f14_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"release (1\\u201340 ms)\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        780,\n        1008.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Release Time\\\" $1\",\n      \"pos\": [\n        707,\n        2830\n      ]\n    },\n    \"f14_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST14\",\n      \"pos\": [\n        110,\n        2920\n      ]\n    },\n    \"f14_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_L\",\n      \"pos\": [\n        30,\n        3010\n      ]\n    },\n    \"f14_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_R\",\n      \"pos\": [\n        120,\n        3010\n      ]\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        724,\n        1066.0,\n        214,\n        37.0\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      }\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        954,\n        900.0,\n        230,\n        261.0\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 AU MultibandCompressor\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        237,\n        20\n      ],\n      \"presentation\": [\n        962,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      }\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1234,\n        3120\n      ],\n      \"presentation\": [\n        962,\n        906.0,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1234,\n        3150\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1234,\n        3180\n      ]\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 vst~ + plug_au AUMultibandCompressor\",\n      \"pos\": [\n        30,\n        3120\n      ],\n      \"size\": [\n        1194,\n        20\n      ]\n    },\n    \"f15_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        3150\n      ]\n    },\n    \"f15_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        3150\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        3490\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        962,\n        1086.0,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_15\"\n      }\n    },\n    \"f15_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        3150\n      ]\n    },\n    \"f15_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        3178\n      ]\n    },\n    \"f15_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUMultibandCompressor\",\n      \"pos\": [\n        330,\n        3220\n      ]\n    },\n    \"f15_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU15_INIT\",\n      \"pos\": [\n        230,\n        3220\n      ]\n    },\n    \"f15_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        3150\n      ],\n      \"presentation\": [\n        962,\n        930.0,\n        50,\n        22\n      ]\n    },\n    \"f15_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU15_INIT\",\n      \"pos\": [\n        230,\n        3260\n      ]\n    },\n    \"f15_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST15\",\n      \"pos\": [\n        230,\n        3405\n      ]\n    },\n    \"f15_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        3300\n      ]\n    },\n    \"f15_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        3330\n      ],\n      \"presentation\": [\n        1020,\n        930.0,\n        22,\n        22\n      ]\n    },\n    \"f15_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        1046,\n        932.0,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        3360\n      ]\n    },\n    \"f15_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        389,\n        3300\n      ]\n    },\n    \"f15_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        389,\n        3330\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        962,\n        958.0,\n        50,\n        22\n      ]\n    },\n    \"f15_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"pre-gain (\\u00b140 dB)\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1018,\n        960.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"Pre-Gain $1\",\n      \"pos\": [\n        389,\n        3360\n      ]\n    },\n    \"f15_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        548,\n        3300\n      ]\n    },\n    \"f15_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        548,\n        3330\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        962,\n        982.0,\n        50,\n        22\n      ]\n    },\n    \"f15_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"post-gain (\\u00b140 dB)\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        1018,\n        984.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Post-Gain $1\",\n      \"pos\": [\n        548,\n        3360\n      ]\n    },\n    \"f15_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.78\",\n      \"pos\": [\n        707,\n        3300\n      ]\n    },\n    \"f15_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        707,\n        3330\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        962,\n        1006.0,\n        50,\n        22\n      ]\n    },\n    \"f15_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"threshold 1 (\\u2212100\\u20130 dB)\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        1018,\n        1008.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Threshold 1\\\" $1\",\n      \"pos\": [\n        707,\n        3360\n      ]\n    },\n    \"f15_p4_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.397\",\n      \"pos\": [\n        866,\n        3300\n      ]\n    },\n    \"f15_p4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        866,\n        3330\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        962,\n        1030.0,\n        50,\n        22\n      ]\n    },\n    \"f15_p4_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"attack (1\\u2013200 ms)\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        1018,\n        1032.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p4_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Attack Time\\\" $1\",\n      \"pos\": [\n        866,\n        3360\n      ]\n    },\n    \"f15_p5_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0368\",\n      \"pos\": [\n        1025,\n        3300\n      ]\n    },\n    \"f15_p5\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1025,\n        3330\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        962,\n        1054.0,\n        50,\n        22\n      ]\n    },\n    \"f15_p5_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"release (10 ms\\u20133 s)\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1018,\n        1056.0,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_p5_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Release Time\\\" $1\",\n      \"pos\": [\n        1025,\n        3360\n      ]\n    },\n    \"f15_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST15\",\n      \"pos\": [\n        110,\n        3450\n      ]\n    },\n    \"f15_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_L\",\n      \"pos\": [\n        30,\n        3540\n      ]\n    },\n    \"f15_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_R\",\n      \"pos\": [\n        120,\n        3540\n      ]\n    },\n    \"f15_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        962,\n        1114.0,\n        214,\n        37.0\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      }\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201315 are the effects\",\n      \"pos\": [\n        30,\n        3650\n      ],\n      \"size\": [\n        1200,\n        34\n      ]\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3710\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 15 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3760\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3810\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        3710\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        3710\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        3710\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        3710\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        3710\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        3710\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        3710\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        3710\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        3710\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        3710\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        3710\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        3710\n      ]\n    },\n    \"mx_L_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_L\",\n      \"pos\": [\n        1200,\n        3710\n      ]\n    },\n    \"mx_L_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_L\",\n      \"pos\": [\n        1290,\n        3710\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3840\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 15 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3890\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3940\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3840\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3840\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3840\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3840\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3840\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3840\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3840\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3840\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3840\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3840\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3840\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3840\n      ]\n    },\n    \"mx_R_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_R\",\n      \"pos\": [\n        1200,\n        3840\n      ]\n    },\n    \"mx_R_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_R\",\n      \"pos\": [\n        1290,\n        3840\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3990\n      ],\n      \"size\": [\n        700,\n        20\n      ]\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        4020\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        4020\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        4020\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        4020\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        4020\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        4020\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        4060\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        4060\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        4110\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        4110\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        4110\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        4110\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        4170\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ]\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        4250\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ]\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3990\n      ],\n      \"size\": [\n        400,\n        20\n      ]\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        4020\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        4060\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ]\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        4100\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ]\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        4140\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        4180\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        4180\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        4220\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        4220\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        4260\n      ]\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        4260\n      ]\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        4320\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37.0\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      }\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        1230\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        1256\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        1282\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        1308\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        1334\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        1360\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rL\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rR\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_c0_lm\",\n      0,\n      \"f02_c0\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_c0_m\",\n      0\n    ],\n    [\n      \"f02_c0_m\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c1\",\n      0,\n      \"f02_c1_m\",\n      0\n    ],\n    [\n      \"f02_c1_m\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      1,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rL\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rR\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_c0_lm\",\n      0,\n      \"f03_c0\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_c0_m\",\n      0\n    ],\n    [\n      \"f03_c0_m\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_c1_m\",\n      0\n    ],\n    [\n      \"f03_c1_m\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      1,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_c0_lm\",\n      0,\n      \"f04_c0\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_c0_m\",\n      0\n    ],\n    [\n      \"f04_c0_m\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_c1_m\",\n      0\n    ],\n    [\n      \"f04_c1_m\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rL\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rR\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f05_c0_lm\",\n      0,\n      \"f05_c0\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_c0_m\",\n      0\n    ],\n    [\n      \"f05_c0_m\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_c1_m\",\n      0\n    ],\n    [\n      \"f05_c1_m\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      1,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c1\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c2\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c3\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c4\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c5\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rM\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c1\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c2\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c3\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c4\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rL\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rR\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f08_c0\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c1\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c2\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c3\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c4\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_c5\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rM\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c0\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_c1\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_bp\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_bp\",\n      1\n    ],\n    [\n      \"f10_bp\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_bp\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_lb\",\n      0,\n      \"f13_t\",\n      0\n    ],\n    [\n      \"f13_t\",\n      1,\n      \"f13_plug\",\n      0\n    ],\n    [\n      \"f13_t\",\n      0,\n      \"f13_sinit\",\n      0\n    ],\n    [\n      \"f13_plug\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_open\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p0_i\",\n      0\n    ],\n    [\n      \"f13_p0_i\",\n      0,\n      \"f13_p0\",\n      0\n    ],\n    [\n      \"f13_p0\",\n      0,\n      \"f13_p0_m\",\n      0\n    ],\n    [\n      \"f13_p0_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p1_i\",\n      0\n    ],\n    [\n      \"f13_p1_i\",\n      0,\n      \"f13_p1\",\n      0\n    ],\n    [\n      \"f13_p1\",\n      0,\n      \"f13_p1_m\",\n      0\n    ],\n    [\n      \"f13_p1_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p2_i\",\n      0\n    ],\n    [\n      \"f13_p2_i\",\n      0,\n      \"f13_p2\",\n      0\n    ],\n    [\n      \"f13_p2\",\n      0,\n      \"f13_p2_m\",\n      0\n    ],\n    [\n      \"f13_p2_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p3_i\",\n      0\n    ],\n    [\n      \"f13_p3_i\",\n      0,\n      \"f13_p3\",\n      0\n    ],\n    [\n      \"f13_p3\",\n      0,\n      \"f13_p3_m\",\n      0\n    ],\n    [\n      \"f13_p3_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p4_i\",\n      0\n    ],\n    [\n      \"f13_p4_i\",\n      0,\n      \"f13_p4\",\n      0\n    ],\n    [\n      \"f13_p4\",\n      0,\n      \"f13_p4_m\",\n      0\n    ],\n    [\n      \"f13_p4_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p5_i\",\n      0\n    ],\n    [\n      \"f13_p5_i\",\n      0,\n      \"f13_p5\",\n      0\n    ],\n    [\n      \"f13_p5\",\n      0,\n      \"f13_p5_m\",\n      0\n    ],\n    [\n      \"f13_p5_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rtov\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_rL\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rR\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f14_lb\",\n      0,\n      \"f14_t\",\n      0\n    ],\n    [\n      \"f14_t\",\n      1,\n      \"f14_plug\",\n      0\n    ],\n    [\n      \"f14_t\",\n      0,\n      \"f14_sinit\",\n      0\n    ],\n    [\n      \"f14_plug\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_open\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p0_i\",\n      0\n    ],\n    [\n      \"f14_p0_i\",\n      0,\n      \"f14_p0\",\n      0\n    ],\n    [\n      \"f14_p0\",\n      0,\n      \"f14_p0_m\",\n      0\n    ],\n    [\n      \"f14_p0_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p1_i\",\n      0\n    ],\n    [\n      \"f14_p1_i\",\n      0,\n      \"f14_p1\",\n      0\n    ],\n    [\n      \"f14_p1\",\n      0,\n      \"f14_p1_m\",\n      0\n    ],\n    [\n      \"f14_p1_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p2_i\",\n      0\n    ],\n    [\n      \"f14_p2_i\",\n      0,\n      \"f14_p2\",\n      0\n    ],\n    [\n      \"f14_p2\",\n      0,\n      \"f14_p2_m\",\n      0\n    ],\n    [\n      \"f14_p2_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p3_i\",\n      0\n    ],\n    [\n      \"f14_p3_i\",\n      0,\n      \"f14_p3\",\n      0\n    ],\n    [\n      \"f14_p3\",\n      0,\n      \"f14_p3_m\",\n      0\n    ],\n    [\n      \"f14_p3_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_rtov\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sL\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      1,\n      \"f14_sR\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_rL\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rR\",\n      0,\n      \"f15_obj\",\n      1\n    ],\n    [\n      \"f15_lb\",\n      0,\n      \"f15_t\",\n      0\n    ],\n    [\n      \"f15_t\",\n      1,\n      \"f15_plug\",\n      0\n    ],\n    [\n      \"f15_t\",\n      0,\n      \"f15_sinit\",\n      0\n    ],\n    [\n      \"f15_plug\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_open\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p0_i\",\n      0\n    ],\n    [\n      \"f15_p0_i\",\n      0,\n      \"f15_p0\",\n      0\n    ],\n    [\n      \"f15_p0\",\n      0,\n      \"f15_p0_m\",\n      0\n    ],\n    [\n      \"f15_p0_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p1_i\",\n      0\n    ],\n    [\n      \"f15_p1_i\",\n      0,\n      \"f15_p1\",\n      0\n    ],\n    [\n      \"f15_p1\",\n      0,\n      \"f15_p1_m\",\n      0\n    ],\n    [\n      \"f15_p1_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p2_i\",\n      0\n    ],\n    [\n      \"f15_p2_i\",\n      0,\n      \"f15_p2\",\n      0\n    ],\n    [\n      \"f15_p2\",\n      0,\n      \"f15_p2_m\",\n      0\n    ],\n    [\n      \"f15_p2_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p3_i\",\n      0\n    ],\n    [\n      \"f15_p3_i\",\n      0,\n      \"f15_p3\",\n      0\n    ],\n    [\n      \"f15_p3\",\n      0,\n      \"f15_p3_m\",\n      0\n    ],\n    [\n      \"f15_p3_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p4_i\",\n      0\n    ],\n    [\n      \"f15_p4_i\",\n      0,\n      \"f15_p4\",\n      0\n    ],\n    [\n      \"f15_p4\",\n      0,\n      \"f15_p4_m\",\n      0\n    ],\n    [\n      \"f15_p4_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rinit\",\n      0,\n      \"f15_p5_i\",\n      0\n    ],\n    [\n      \"f15_p5_i\",\n      0,\n      \"f15_p5\",\n      0\n    ],\n    [\n      \"f15_p5\",\n      0,\n      \"f15_p5_m\",\n      0\n    ],\n    [\n      \"f15_p5_m\",\n      0,\n      \"f15_stov\",\n      0\n    ],\n    [\n      \"f15_rtov\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sL\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      1,\n      \"f15_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"mx_L_14\",\n      0,\n      \"sel_L\",\n      14\n    ],\n    [\n      \"mx_L_15\",\n      0,\n      \"sel_L\",\n      15\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mx_R_14\",\n      0,\n      \"sel_R\",\n      14\n    ],\n    [\n      \"mx_R_15\",\n      0,\n      \"sel_R\",\n      15\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-48",
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
            "obj-48",
            1
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
            "obj-51",
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
            "obj-48",
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
            "obj-48",
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
            "obj-55",
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
            "obj-56",
            0
          ],
          "source": [
            "obj-48",
            1
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
            "obj-65",
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
            1
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
            "obj-67",
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
            "obj-72",
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
            "obj-73",
            0
          ],
          "source": [
            "obj-65",
            1
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
            "obj-82",
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
            "obj-84",
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
            "obj-85",
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
            "obj-82",
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
            "obj-89",
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
            "obj-90",
            0
          ],
          "source": [
            "obj-82",
            1
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
            "obj-116",
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
            1
          ],
          "source": [
            "obj-115",
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
            "obj-117",
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
            "obj-118",
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
            "obj-119",
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
            "obj-120",
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
            "obj-121",
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
            "obj-122",
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
            "obj-116",
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
            "obj-116",
            1
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
            "obj-132",
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
            "obj-132",
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
            "obj-132",
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
            "obj-132",
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
            "obj-132",
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
            "obj-139",
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
            "obj-140",
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
            "obj-144",
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
            "obj-149",
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
            1
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
            "obj-149",
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
            "obj-149",
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
            "obj-149",
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
            "obj-149",
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
            "obj-149",
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
            "obj-149",
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
            "obj-156",
            0
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
            "obj-157",
            0
          ],
          "source": [
            "obj-149",
            1
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
            "obj-165",
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
            "obj-165",
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
            "obj-169",
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
            "obj-165",
            0
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
            "obj-173",
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
            "obj-179",
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
            "obj-179",
            1
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
            "obj-180",
            0
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
            "obj-181",
            0
          ],
          "source": [
            "obj-179",
            1
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
            "obj-191",
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
            "obj-191",
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
            "obj-191",
            1
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
            "obj-193",
            0
          ],
          "source": [
            "obj-191",
            1
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
            "obj-200",
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
            "obj-201",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-203",
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
            "obj-205",
            0
          ],
          "source": [
            "obj-203",
            1
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
            "obj-214",
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
            1
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
            "obj-217",
            0
          ],
          "source": [
            "obj-216",
            1
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
            "obj-216",
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
            "obj-217",
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
            "obj-219",
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
            "obj-220",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-223",
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
            "obj-221",
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
            "obj-226",
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
            "obj-227",
            0
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
            "obj-227",
            0
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
            "obj-220",
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
            "obj-233",
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
            "obj-221",
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
            "obj-220",
            0
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
            "obj-237",
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
            "obj-221",
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
            "obj-238",
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
            "obj-239",
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
            "obj-221",
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
            "obj-242",
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
            "obj-245",
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
            "obj-221",
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
            "obj-214",
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
            "obj-247",
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
            "obj-248",
            0
          ],
          "source": [
            "obj-214",
            1
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
            "obj-258",
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
            "obj-260",
            0
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
            "obj-261",
            0
          ],
          "source": [
            "obj-260",
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
            "obj-260",
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
            "obj-261",
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
            "obj-263",
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
            "obj-264",
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
            "obj-265",
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
            "obj-264",
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
            "obj-273",
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
            "obj-265",
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
            "obj-274",
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
            "obj-277",
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
            "obj-265",
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
            "obj-278",
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
            "obj-281",
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
            "obj-265",
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
            "obj-258",
            0
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
            "obj-258",
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
            "obj-258",
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
            "obj-294",
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
            "obj-294",
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
            "obj-296",
            1
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
            "obj-296",
            0
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
            "obj-297",
            0
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
            "obj-299",
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
            "obj-300",
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
            "obj-302",
            0
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
            "obj-303",
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
            "obj-305",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-306",
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
            "obj-307",
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
            "obj-309",
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
            "obj-301",
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
            "obj-300",
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
            "obj-310",
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
            "obj-311",
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
            "obj-313",
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
            "obj-300",
            0
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
            "obj-317",
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
            "obj-301",
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
            "obj-318",
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
            "obj-319",
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
            "obj-301",
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
            "obj-322",
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
            "obj-323",
            0
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
            "obj-301",
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
            "obj-294",
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
            "obj-327",
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
            "obj-328",
            0
          ],
          "source": [
            "obj-294",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-332",
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
            "obj-332",
            2
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
            "obj-332",
            3
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
            "obj-332",
            4
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
            "obj-332",
            5
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
            "obj-332",
            6
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
            "obj-332",
            7
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
            "obj-332",
            8
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
            "obj-332",
            9
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
            "obj-332",
            10
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
            "obj-332",
            11
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
            "obj-332",
            12
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
            "obj-332",
            13
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
            "obj-332",
            14
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
            "obj-332",
            15
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
            "obj-349",
            0
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
            "obj-350",
            0
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
            "obj-349",
            2
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
            "obj-349",
            3
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
            "obj-349",
            4
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
            "obj-349",
            5
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
            "obj-349",
            6
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
            "obj-349",
            7
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
            "obj-349",
            8
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
            "obj-349",
            9
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
            "obj-349",
            10
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
            "obj-349",
            11
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
            "obj-349",
            12
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
            "obj-349",
            13
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
            "obj-349",
            14
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
            "obj-349",
            15
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
            "obj-374",
            0
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
            "obj-372",
            0
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
            "obj-375",
            0
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
            "obj-376",
            0
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
            "obj-373",
            0
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
            "obj-377",
            0
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
            "obj-374",
            1
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
            "obj-375",
            1
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
            "obj-376",
            1
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
            "obj-377",
            1
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
            "obj-378",
            0
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
            "obj-378",
            0
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
            "obj-378",
            1
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
            "obj-378",
            1
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
            "obj-379",
            0
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
            "obj-379",
            1
          ],
          "source": [
            "obj-378",
            1
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
            "obj-381",
            0
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
            "obj-382",
            0
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
            "obj-383",
            0
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
            "obj-384",
            0
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
            "obj-384",
            1
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
            "obj-385",
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
            "obj-386",
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
            "obj-387",
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
            "obj-388",
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
