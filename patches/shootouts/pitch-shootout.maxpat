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
          "text": "PITCH SHOOTOUT \u2014 ring modulation, frequency shifting, pitch shifting, harmonizers and retuning. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
                "2 cycle~ ring mod",
                "3 freqshift~",
                "4 pitchshift~",
                "5 retune~",
                "6 abl ringmod~",
                "7 abl pitchshifter~",
                "8 BEAP Freq Shifter",
                "9 BEAP Retuner",
                "10 amxd AutoRingMod",
                "11 amxd Simple Pitch Shifter",
                "12 amxd Dual Harmonizer",
                "13 amxd Autotuna",
                "14 amxd Microtuner",
                "15 amxd Speed Shifter",
                "16 amxd SpectralHarm",
                "17 AU Pitch",
                "18 AU NewPitch"
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
            212.0,
            20.0
          ],
          "text": "2 \u00b7 ring mod (cycle~ *~)",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            465.0,
            166.0,
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
            166.0,
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
          "text": "2 \u00b7 cycle~ \u2192 *~ \u2014 classic ring modulation (two objects)"
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
            "signal"
          ],
          "patching_rect": [
            30.0,
            720.0,
            40.0,
            22.0
          ],
          "text": "*~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            515.0,
            166.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            130.0,
            660.0,
            62.0,
            22.0
          ],
          "text": "cycle~"
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
            310.0,
            590.0,
            118.0,
            22.0
          ],
          "text": "loadmess 440.0"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            310.0,
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
          "minimum": 0.1,
          "maximum": 10000.0
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
            86.0,
            110.0,
            20.0
          ],
          "text": "carrier (Hz)",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            491.0,
            110.0,
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
            166.0,
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
          "id": "obj-53",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            765.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            765.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            138.0,
            127.0,
            20.0
          ],
          "text": "3 \u00b7 freqshift~",
          "presentation": 1,
          "presentation_rect": [
            208.0,
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
          "id": "obj-57",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1228.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            208.0,
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
          "id": "obj-58",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1228.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1228.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            640.0,
            520.0,
            578.0,
            20.0
          ],
          "text": "3 \u00b7 freqshift~ \u2014 time-domain frequency shifter (outlet 1 = negative sideband)"
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
          "id": "obj-62",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            640.0,
            672.0,
            90.0,
            22.0
          ],
          "text": "freqshift~",
          "presentation": 1,
          "presentation_rect": [
            208.0,
            515.0,
            160.0,
            22.0
          ]
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
            770.0,
            590.0,
            118.0,
            22.0
          ],
          "text": "loadmess 100.0"
        }
      },
      {
        "box": {
          "id": "obj-64",
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
            208.0,
            489.0,
            50.0,
            22.0
          ],
          "minimum": -5000.0,
          "maximum": 5000.0
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            93.0,
            20.0
          ],
          "text": "shift (Hz)",
          "presentation": 1,
          "presentation_rect": [
            264.0,
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
          "id": "obj-66",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            190.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            208.0,
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
          "id": "obj-67",
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
          "id": "obj-68",
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
          "id": "obj-70",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            135.0,
            20.0
          ],
          "text": "4 \u00b7 pitchshift~",
          "presentation": 1,
          "presentation_rect": [
            392.0,
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
          "id": "obj-71",
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
            392.0,
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
          "id": "obj-72",
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
          "id": "obj-73",
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
          "id": "obj-74",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1368.0,
            520.0,
            542.0,
            20.0
          ],
          "text": "4 \u00b7 pitchshift~ 2 \u2014 Ztx pitch shifter, stereo (outlet 2 reports latency)"
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1368.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1448.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            1368.0,
            698.0,
            321.0,
            22.0
          ],
          "text": "pitchshift~ 2 @pitchshift 1.5 @quality good",
          "presentation": 1,
          "presentation_rect": [
            392.0,
            563.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1498.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            392.0,
            489.0,
            160.0,
            22.0
          ],
          "attr": "pitchshift",
          "text_width": 82.0
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
            1518.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            392.0,
            513.0,
            160.0,
            22.0
          ],
          "attr": "pitchshiftcent",
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
            1538.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            392.0,
            537.0,
            160.0,
            22.0
          ],
          "attr": "quality",
          "text_width": 82.0
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
            1368.0,
            743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
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
            1458.0,
            743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            242.0,
            101.0,
            20.0
          ],
          "text": "5 \u00b7 retune~",
          "presentation": 1,
          "presentation_rect": [
            576.0,
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
          "id": "obj-85",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            553.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
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
          "id": "obj-86",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            553.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "obj-87",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            553.0,
            925.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            865.0,
            513.0,
            20.0
          ],
          "text": "5 \u00b7 retune~ 440 \u2014 Ztx pitch detection + retuning to the nearest note"
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
          "id": "obj-90",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 5,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            30.0,
            1069.0,
            97.0,
            22.0
          ],
          "text": "retune~ 440",
          "presentation": 1,
          "presentation_rect": [
            576.0,
            587.0,
            160.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            935.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
            489.0,
            160.0,
            22.0
          ],
          "attr": "retune",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-92",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            961.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
            513.0,
            160.0,
            22.0
          ],
          "attr": "correction_amount",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            987.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
            537.0,
            160.0,
            22.0
          ],
          "attr": "correction_threshold",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            220.0,
            1013.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            576.0,
            561.0,
            160.0,
            22.0
          ],
          "attr": "quality",
          "text_width": 82.0
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
            268.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            576.0,
            615.0,
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
          "id": "obj-96",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
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
            120.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
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
            294.0,
            144.0,
            20.0
          ],
          "text": "6 \u00b7 abl ringmod~",
          "presentation": 1,
          "presentation_rect": [
            760.0,
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
          "id": "obj-100",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1203.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            760.0,
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
          "id": "obj-101",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1203.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "5"
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
            1203.0,
            925.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            693.0,
            865.0,
            500.0,
            20.0
          ],
          "text": "6 \u00b7 abl.dsp.ringmod~ \u2014 Live's ring modulator with drive"
        }
      },
      {
        "box": {
          "id": "obj-104",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            693.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-105",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            773.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-106",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            693.0,
            1069.0,
            188.0,
            22.0
          ],
          "text": "abl.dsp.ringmod~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            760.0,
            587.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            823.0,
            935.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            760.0,
            489.0,
            160.0,
            22.0
          ],
          "attr": "frequency",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            843.0,
            961.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            760.0,
            513.0,
            160.0,
            22.0
          ],
          "attr": "enable_drive",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            863.0,
            987.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            760.0,
            537.0,
            160.0,
            22.0
          ],
          "attr": "drive",
          "text_width": 82.0
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
            883.0,
            1013.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            760.0,
            561.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-111",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            693.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
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
            783.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            1073.0,
            895.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-114",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1073.0,
            925.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            320.0,
            186.0,
            20.0
          ],
          "text": "7 \u00b7 abl pitchshifter~",
          "presentation": 1,
          "presentation_rect": [
            944.0,
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
          "id": "obj-117",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1853.0,
            865.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            944.0,
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
          "id": "obj-118",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1853.0,
            895.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1853.0,
            925.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-120",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1343.0,
            865.0,
            500.0,
            20.0
          ],
          "text": "7 \u00b7 abl.dsp.pitchshifter~ \u2014 Live's Shifter pitch mode"
        }
      },
      {
        "box": {
          "id": "obj-121",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1343.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1423.0,
            895.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            1343.0,
            1069.0,
            223.0,
            22.0
          ],
          "text": "abl.dsp.pitchshifter~ @mix 1.",
          "presentation": 1,
          "presentation_rect": [
            944.0,
            587.0,
            160.0,
            35.0
          ],
          "presentation_linecount": 2
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
            1473.0,
            935.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            944.0,
            489.0,
            160.0,
            22.0
          ],
          "attr": "shift",
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
            1493.0,
            961.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            944.0,
            513.0,
            160.0,
            22.0
          ],
          "attr": "window",
          "text_width": 82.0
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
            1513.0,
            987.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            944.0,
            537.0,
            160.0,
            22.0
          ],
          "attr": "wide",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-127",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1533.0,
            1013.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            944.0,
            561.0,
            160.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            1343.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            1433.0,
            1114.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
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
            1723.0,
            895.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-131",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1723.0,
            925.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            346.0,
            229.0,
            20.0
          ],
          "text": "8 \u00b7 BEAP Frequency Shifter",
          "presentation": 1,
          "presentation_rect": [
            1128.0,
            465.0,
            230.0,
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
          "id": "obj-134",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            726.0,
            1214.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1128.0,
            465.0,
            230.0,
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
          "id": "obj-135",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            726.0,
            1244.0,
            40.0,
            22.0
          ],
          "text": "7"
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
            726.0,
            1274.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1214.0,
            686.0,
            20.0
          ],
          "text": "8 \u00b7 bp.Frequency Shifter \u2014 BEAP module (out 0 = shifted; out 1 = the other sideband, unused)"
        }
      },
      {
        "box": {
          "id": "obj-138",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1244.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "bpatcher",
          "numinlets": 4,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1284.0,
            230.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1128.0,
            489.0,
            230.0,
            116.0
          ],
          "varname": "FX_FREQSHIFT",
          "comment": "in 0: signal | in 1: CV (unused) | in 2: CV (unused) | in 3: CV (unused) | out 0: signal | out 1: signal",
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
              173.0,
              260.0,
              684.0,
              536.0
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
                  "id": "obj-31",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
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
                    "classnamespace": "box",
                    "rect": [
                      84.0,
                      128.0,
                      640.0,
                      480.0
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
                          "id": "obj-22",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            166.093994,
                            163.924805,
                            63.0,
                            22.0
                          ],
                          "text": "pack f 50."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-21",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            166.093994,
                            134.70752,
                            42.0,
                            22.0
                          ],
                          "text": "* 0.01"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-20",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            270.924805,
                            29.5,
                            22.0
                          ],
                          "text": "+~"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-19",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "signal",
                            "bang"
                          ],
                          "patching_rect": [
                            166.093994,
                            196.924805,
                            50.0,
                            22.0
                          ],
                          "text": "line~ 0."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            90.22406,
                            134.70752,
                            63.0,
                            22.0
                          ],
                          "text": "pack f 50."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "signal",
                            "bang"
                          ],
                          "patching_rect": [
                            90.22406,
                            167.70752,
                            56.0,
                            22.0
                          ],
                          "text": "line~ 0.2"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            90.22406,
                            100.0,
                            49.0,
                            22.0
                          ],
                          "text": "* 0.002"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            200.817505,
                            59.22406,
                            22.0
                          ],
                          "text": "*~"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-23",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            647.477294921875,
                            507.0751953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-27",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            90.22406,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            687.7013549804688,
                            507.0751953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-28",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            166.093994,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            763.5712890625,
                            507.0751953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-29",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            352.924805,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            647.477294921875,
                            820.0,
                            30.0,
                            30.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-20",
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
                            "obj-18",
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
                            "obj-13",
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
                            "obj-17",
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
                            1
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
                            "obj-29",
                            0
                          ],
                          "source": [
                            "obj-20",
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
                          "source": [
                            "obj-21",
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
                            "obj-22",
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
                            "obj-23",
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
                            "obj-27",
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
                            "obj-28",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    647.477295,
                    619.075195,
                    99.44812,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "description": "",
                    "digest": "",
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p Mix"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-9",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    659.477295,
                    540.788574,
                    26.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    97.77592468261719,
                    76.22152709960938,
                    26.0,
                    17.0
                  ],
                  "text": "Mix",
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
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hint": "Attenuator for CV Mix",
                  "id": "obj-10",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    687.701355,
                    540.788574,
                    70.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    123.0,
                    76.22152709960938,
                    46.82677459716797,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_longname": "CV2[2]",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "CV2"
                    }
                  },
                  "textcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "varname": "CV2[1]"
                }
              },
              {
                "box": {
                  "annotation": "",
                  "comment": "Mix CV",
                  "hint": "Mix CV",
                  "id": "obj-5",
                  "index": 4,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    647.477295,
                    496.788574,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-4",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    67.870605,
                    0.0,
                    26.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    200.31781005859375,
                    0.0,
                    26.0,
                    17.0
                  ],
                  "text": "Mix",
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
                    0.4
                  ],
                  "annotation": "Adjusts the dry-wet mix.",
                  "bordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "hint": "Adjusts the dry-wet mix.",
                  "id": "obj-3",
                  "maxclass": "live.dial",
                  "needlecolor": [
                    0.752941,
                    0.784314,
                    0.839216,
                    1.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    763.571289,
                    542.788574,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    174.0,
                    43.221527099609375,
                    44.0,
                    48.0
                  ],
                  "prototypename": "freq",
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_linknames": 1,
                      "parameter_longname": "DryWetMix",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0,
                      "parameter_initial": [
                        100
                      ],
                      "parameter_speedlim": 0.0,
                      "parameter_shortname": "Mix"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "DryWetMix"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.917647,
                    0.94902,
                    0.054902,
                    0.0
                  ],
                  "activebgoncolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextoncolor": [
                    0.137255,
                    0.145098,
                    0.160784,
                    1.0
                  ],
                  "annotation": "Thru-zero: includes negative frequencies in the output.  Only affects negatively shifted frequencies.",
                  "automation": "off",
                  "automationon": "on",
                  "bgcolor": [
                    0.6,
                    0.6,
                    0.6,
                    0.0
                  ],
                  "bordercolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "focusbordercolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hint": "Thru-zero: Passes/blocks frequencies less than zero (created by negative frequency shifts).    ",
                  "id": "obj-38",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    524.672119,
                    558.90332,
                    73.0,
                    18.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    51.0,
                    75.22152709960938,
                    38.0,
                    14.947551727294922
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "off",
                        "on"
                      ],
                      "parameter_type": 2,
                      "parameter_linknames": 1,
                      "parameter_longname": "ThruZero",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0
                      ],
                      "parameter_speedlim": 0.0,
                      "parameter_shortname": "ThruZero"
                    }
                  },
                  "text": "Thru-Z",
                  "textcolor": [
                    0.556863,
                    0.556863,
                    0.556863,
                    1.0
                  ],
                  "texton": "Thru-Z",
                  "varname": "ThruZero"
                }
              },
              {
                "box": {
                  "id": "obj-37",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
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
                    "classnamespace": "box",
                    "rect": [
                      59.0,
                      103.0,
                      640.0,
                      480.0
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
                          "comment": "",
                          "id": "obj-3",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            174.0,
                            36.0,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            80.327881,
                            100.0,
                            41.0,
                            20.0
                          ],
                          "text": "gate~"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-31",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            80.327881,
                            136.1073,
                            86.0,
                            20.0
                          ],
                          "text": "maximum~ 20"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-27",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "signal",
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            182.1073,
                            49.327881,
                            20.0
                          ],
                          "text": "cross~"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-33",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            301.672119140625,
                            534.8927001953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-34",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            102.327881,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            338.0,
                            534.8927001953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            80.327881,
                            246.1073,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            328.672119140625,
                            759.0,
                            30.0,
                            30.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
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
                            "obj-35",
                            0
                          ],
                          "source": [
                            "obj-27",
                            1
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
                            "obj-3",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-27",
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
                            "obj-27",
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
                            "obj-1",
                            1
                          ],
                          "source": [
                            "obj-34",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    446.672119,
                    682.8927,
                    97.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "description": "",
                    "digest": "",
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p BlockNegative"
                }
              },
              {
                "box": {
                  "id": "obj-36",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
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
                    "classnamespace": "box",
                    "rect": [
                      59.0,
                      103.0,
                      640.0,
                      480.0
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
                          "id": "obj-31",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            86.327881,
                            135.1073,
                            86.0,
                            22.0
                          ],
                          "text": "maximum~ 20"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-29",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            86.327881,
                            100.0,
                            40.0,
                            22.0
                          ],
                          "text": "*~ -1."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-27",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "signal",
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            182.1073,
                            46.0,
                            22.0
                          ],
                          "text": "cross~"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-33",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            50.0,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            301.672119140625,
                            534.8927001953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-34",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            86.327881,
                            40.0,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            338.0,
                            534.8927001953125,
                            30.0,
                            30.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            77.0,
                            264.1073,
                            30.0,
                            30.0
                          ],
                          "presentation": 1,
                          "presentation_rect": [
                            328.672119140625,
                            759.0,
                            30.0,
                            30.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-35",
                            0
                          ],
                          "source": [
                            "obj-27",
                            1
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
                            "obj-29",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-27",
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
                            "obj-27",
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
                            "obj-29",
                            0
                          ],
                          "source": [
                            "obj-34",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    301.672119,
                    682.8927,
                    97.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "description": "",
                    "digest": "",
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p BlockNegative"
                }
              },
              {
                "box": {
                  "id": "obj-25",
                  "maxclass": "newobj",
                  "numinlets": 4,
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
                      84.0,
                      128.0,
                      600.0,
                      450.0
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
                          "id": "obj-12",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            123.0,
                            157.0,
                            40.0,
                            22.0
                          ],
                          "text": "mix"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            58.0,
                            157.0,
                            40.0,
                            22.0
                          ],
                          "text": "mix"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            399.0,
                            105.0,
                            123.0,
                            22.0
                          ],
                          "text": "in 4 @min 0 @max 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            58.0,
                            30.0,
                            30.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            123.0,
                            207.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 2"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            308.0,
                            87.0,
                            51.0,
                            22.0
                          ],
                          "text": "dcblock"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            189.0,
                            87.0,
                            51.0,
                            22.0
                          ],
                          "text": "dcblock"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            189.0,
                            30.0,
                            30.0,
                            22.0
                          ],
                          "text": "in 2"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            308.0,
                            30.0,
                            30.0,
                            22.0
                          ],
                          "text": "in 3"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            58.0,
                            207.0,
                            37.0,
                            22.0
                          ],
                          "text": "out 1"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-5",
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
                            "obj-4",
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
                            "obj-7",
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
                            "obj-6",
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
                            "obj-11",
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
                            "obj-12",
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
                            "obj-11",
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
                            "obj-12",
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
                            "obj-11",
                            2
                          ],
                          "order": 1,
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-12",
                            2
                          ],
                          "order": 0,
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ],
                    "editing_bgcolor": [
                      0.9,
                      0.9,
                      0.9,
                      1.0
                    ]
                  },
                  "patching_rect": [
                    275.922119,
                    765.0,
                    164.0,
                    20.0
                  ],
                  "text": "gen~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    69.455986,
                    166.662552,
                    331.0,
                    18.0
                  ],
                  "text": "## Frequency shifter with normal and inverted outputs.  ## "
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-59",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    420.45282,
                    877.992676,
                    50.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    176.31781005859375,
                    97.0,
                    50.0,
                    17.0
                  ],
                  "text": "Neg Shift",
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
                  "comment": "Signal output.  If the frequency shift value is positive, this includes the negatively shifted components; if the frequency shift value is negative, this includes the positively shifted components.",
                  "id": "obj-58",
                  "index": 2,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    390.70282,
                    877.992676,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-56",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    390.422119,
                    839.272705,
                    80.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-32",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
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
                    "classnamespace": "box",
                    "rect": [
                      75.0,
                      119.0,
                      819.0,
                      686.0
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
                          "id": "obj-59",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            254.0,
                            326.29718,
                            43.0,
                            22.0
                          ],
                          "text": "set $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-56",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            254.0,
                            290.0,
                            47.0,
                            22.0
                          ],
                          "text": "mtof 0."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-55",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            362.54126,
                            290.0,
                            35.0,
                            22.0
                          ],
                          "text": "- 60."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-23",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            362.54126,
                            326.29718,
                            43.0,
                            22.0
                          ],
                          "text": "set $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-19",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            720.77063,
                            290.0,
                            41.0,
                            22.0
                          ],
                          "text": "$1 40"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "signal",
                            "bang"
                          ],
                          "patching_rect": [
                            720.77063,
                            326.29718,
                            36.0,
                            22.0
                          ],
                          "text": "line~"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-49",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            362.54126,
                            233.0,
                            47.0,
                            22.0
                          ],
                          "text": "ftom 0."
                        }
                      },
                      {
                        "box": {
                          "fontface": 0,
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-54",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            254.0,
                            233.0,
                            38.0,
                            22.0
                          ],
                          "text": "+ 0."
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
                          "parameter_enable": 0,
                          "patching_rect": [
                            539.0,
                            156.0,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-6",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            539.0,
                            326.29718,
                            57.0,
                            20.0
                          ],
                          "text": "hidden $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            187.0,
                            156.0,
                            32.5,
                            20.0
                          ],
                          "text": "== 0"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-9",
                          "maxclass": "toggle",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            187.0,
                            242.0,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-1",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            187.0,
                            326.29718,
                            57.0,
                            20.0
                          ],
                          "text": "hidden $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            459.0,
                            156.0,
                            32.5,
                            20.0
                          ],
                          "text": "== 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-29",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            483.0,
                            326.29718,
                            53.0,
                            20.0
                          ],
                          "text": "active $1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-30",
                          "maxclass": "button",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            459.0,
                            326.29718,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-33",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            459.0,
                            233.0,
                            47.0,
                            20.0
                          ],
                          "text": "select 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-36",
                          "maxclass": "toggle",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            459.0,
                            201.0,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-24",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            131.0,
                            326.29718,
                            53.0,
                            20.0
                          ],
                          "text": "active $1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-21",
                          "maxclass": "button",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            107.0,
                            326.29718,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            107.0,
                            250.0,
                            47.0,
                            20.0
                          ],
                          "text": "select 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-18",
                          "maxclass": "toggle",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            107.0,
                            156.0,
                            18.0,
                            18.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-25",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            539.0,
                            63.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-26",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            254.0,
                            193.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-27",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            362.54126,
                            193.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-28",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            107.0,
                            431.297241,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-31",
                          "index": 2,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            459.0,
                            431.297241,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-32",
                          "index": 3,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            720.77063,
                            431.297241,
                            25.0,
                            25.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-28",
                            0
                          ],
                          "midpoints": [
                            196.5,
                            386.297211,
                            116.5,
                            386.297211
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
                            "obj-21",
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
                            "obj-10",
                            0
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
                            "obj-24",
                            0
                          ],
                          "midpoints": [
                            116.5,
                            249.64859,
                            140.5,
                            249.64859
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
                            "obj-3",
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
                            "obj-28",
                            0
                          ],
                          "midpoints": [
                            116.5,
                            387.297211,
                            116.5,
                            387.297211
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
                          "midpoints": [
                            372.04126,
                            387.297211,
                            116.5,
                            387.297211
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
                          "midpoints": [
                            140.5,
                            386.297211,
                            116.5,
                            386.297211
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
                            "obj-18",
                            0
                          ],
                          "midpoints": [
                            548.5,
                            121.5,
                            116.5,
                            121.5
                          ],
                          "order": 3,
                          "source": [
                            "obj-25",
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
                            548.5,
                            121.5,
                            196.5,
                            121.5
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
                            "obj-5",
                            0
                          ],
                          "midpoints": [
                            548.5,
                            121.5,
                            548.5,
                            121.5
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
                            "obj-8",
                            0
                          ],
                          "midpoints": [
                            548.5,
                            121.5,
                            468.5,
                            121.5
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
                            "obj-54",
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
                            "obj-49",
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
                            "obj-31",
                            0
                          ],
                          "midpoints": [
                            492.5,
                            386.297211,
                            468.5,
                            386.297211
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
                            "obj-32",
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
                            "obj-31",
                            0
                          ],
                          "midpoints": [
                            468.5,
                            387.297211,
                            468.5,
                            387.297211
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
                            "obj-30",
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
                            "obj-29",
                            0
                          ],
                          "midpoints": [
                            468.5,
                            272.14859,
                            492.5,
                            272.14859
                          ],
                          "order": 0,
                          "source": [
                            "obj-36",
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
                          "order": 1,
                          "source": [
                            "obj-36",
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
                            "obj-4",
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
                          "midpoints": [
                            372.04126,
                            279.558289,
                            730.27063,
                            279.558289
                          ],
                          "order": 0,
                          "source": [
                            "obj-49",
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
                          "order": 1,
                          "source": [
                            "obj-49",
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
                            "obj-19",
                            0
                          ],
                          "midpoints": [
                            263.5,
                            279.558289,
                            730.27063,
                            279.558289
                          ],
                          "order": 0,
                          "source": [
                            "obj-54",
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
                          "order": 1,
                          "source": [
                            "obj-54",
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
                            "obj-56",
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
                          "midpoints": [
                            263.5,
                            387.297211,
                            468.5,
                            387.297211
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
                            "obj-31",
                            0
                          ],
                          "midpoints": [
                            548.5,
                            386.297211,
                            468.5,
                            386.297211
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
                            "obj-36",
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
                            "obj-1",
                            0
                          ],
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    154.672119,
                    318.485474,
                    287.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "description": "",
                    "digest": "",
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p freqmode"
                }
              },
              {
                "box": {
                  "id": "obj-112",
                  "linecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.38
                  ],
                  "maxclass": "live.line",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    51.0,
                    121.711639,
                    5.0,
                    100.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    37.84733581542969,
                    65.976318359375,
                    32.796424865722656,
                    5.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-111",
                  "linecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.38
                  ],
                  "maxclass": "live.line",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    35.0,
                    121.711639,
                    5.0,
                    100.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    69.53726959228516,
                    56.033172607421875,
                    5.0,
                    9.97680377960205
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-110",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    647.477295,
                    373.175171,
                    24.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    97.77592468261719,
                    57.976318359375,
                    24.0,
                    17.0
                  ],
                  "text": "Lin",
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
                  "id": "obj-108",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    629.40625,
                    114.917053,
                    23.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    97.77592468261719,
                    40.6690788269043,
                    23.0,
                    17.0
                  ],
                  "text": "CV",
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
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hint": "Depth of linear input",
                  "id": "obj-107",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    680.977295,
                    373.175171,
                    70.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    123.0,
                    57.976318359375,
                    46.82677459716797,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 3.0,
                      "parameter_longname": "Linear",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 5000.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "Linear"
                    }
                  },
                  "textcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "varname": "Linear"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hint": "Attenuator for CV expo freq modulation input",
                  "id": "obj-129",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    666.40625,
                    114.917053,
                    70.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    123.0,
                    40.6690788269043,
                    46.82677459716797,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_longname": "CV2",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "CV2"
                    }
                  },
                  "textcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "varname": "CV2"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-87",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    559.571289,
                    360.550903,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    129.31781005859375,
                    0.0,
                    38.0,
                    17.0
                  ],
                  "text": "Linear",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "textjustification": 1
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-75",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    559.571289,
                    448.390137,
                    140.406006,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "comment": "Linear frequency input.  The range of this input is controlled by the \"Lin\" control, specified in Hz.  This input is added to the existing Pitch/Freq value and CV input.",
                  "hint": "Linear frequency input.  The range of this input is controlled by the \"Lin\" control, specified in Hz.  This input is added to the existing Pitch/Freq value and CV input.",
                  "id": "obj-77",
                  "index": 3,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    559.571289,
                    385.38855,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-84",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    680.977295,
                    412.550903,
                    31.0,
                    20.0
                  ],
                  "text": "* 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-73",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    422.672119,
                    558.90332,
                    45.561401,
                    20.0
                  ],
                  "text": "+~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-44",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    422.672119,
                    428.485474,
                    79.327881,
                    20.0
                  ],
                  "text": "+~"
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
                    0.4
                  ],
                  "annotation": "",
                  "bordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "id": "obj-51",
                  "maxclass": "live.dial",
                  "needlecolor": [
                    0.752941,
                    0.784314,
                    0.839216,
                    1.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    288.672119,
                    256.075195,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    4.0,
                    43.221527099609375,
                    44.0,
                    48.0
                  ],
                  "prototypename": "freq",
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 3,
                      "parameter_exponent": 4.0,
                      "parameter_longname": "Freq",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 10000.0,
                      "parameter_initial": [
                        8
                      ],
                      "parameter_speedlim": 0.0,
                      "parameter_shortname": "Freq"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Freq"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.917647,
                    0.94902,
                    0.054902,
                    0.0
                  ],
                  "activebgoncolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "activetextoncolor": [
                    0.137255,
                    0.145098,
                    0.160784,
                    1.0
                  ],
                  "annotation": "",
                  "automation": "Freq",
                  "automationon": "Pitch",
                  "bgcolor": [
                    0.6,
                    0.6,
                    0.6,
                    0.0
                  ],
                  "bordercolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "focusbordercolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "hint": "Switches between pitch and Hz frequency modes.",
                  "id": "obj-45",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    422.672119,
                    278.075195,
                    35.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    51.0,
                    41.221527099609375,
                    38.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "Freq",
                        "Pitch"
                      ],
                      "parameter_type": 2,
                      "parameter_longname": "FreqMode",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        1
                      ],
                      "parameter_speedlim": 0.0,
                      "parameter_shortname": "FreqMode"
                    }
                  },
                  "text": "Freq",
                  "textcolor": [
                    0.556863,
                    0.556863,
                    0.556863,
                    1.0
                  ],
                  "texton": "Pitch",
                  "varname": "FreqMode"
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
                    0.4
                  ],
                  "annotation": "",
                  "bordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "focusbordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.2
                  ],
                  "hidden": 1,
                  "id": "obj-46",
                  "maxclass": "live.dial",
                  "needlecolor": [
                    0.752941,
                    0.784314,
                    0.839216,
                    1.0
                  ],
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    154.672119,
                    256.075195,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    4.0,
                    43.221527099609375,
                    44.0,
                    48.0
                  ],
                  "prototypename": "freq",
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 8,
                      "parameter_linknames": 1,
                      "parameter_longname": "Offset",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 120.0,
                      "parameter_initial": [
                        60
                      ],
                      "parameter_shortname": "Offset"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Offset"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-102",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    259.672119,
                    542.788574,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    1.0,
                    0.0,
                    38.0,
                    17.0
                  ],
                  "text": "Signal",
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
                  "id": "obj-103",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    438.0,
                    188.549316,
                    23.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    66.87060546875,
                    0.0,
                    23.0,
                    17.0
                  ],
                  "text": "CV",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "textjustification": 1
                }
              },
              {
                "box": {
                  "annotation": "",
                  "comment": "Input",
                  "hint": "Input",
                  "id": "obj-41",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    301.672119,
                    542.788574,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-52",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    483.0,
                    237.550903,
                    140.406006,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "comment": "CV: pitch modulation input. This input has a built-in attenuator (CV). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV input.",
                  "hint": "CV: pitch modulation input. This input has a built-in attenuator (CV). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV input.",
                  "id": "obj-65",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    483.0,
                    188.549316,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-66",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    604.40625,
                    154.953247,
                    45.0,
                    21.0
                  ],
                  "text": "sig~ 2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-67",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    604.40625,
                    197.894531,
                    81.0,
                    21.0
                  ],
                  "text": "pow~"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-68",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    666.40625,
                    163.71167,
                    37.0,
                    20.0
                  ],
                  "text": "* 0.01"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-69",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    483.0,
                    355.550903,
                    38.0,
                    20.0
                  ],
                  "text": "-~ 60"
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-91",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "signal"
                  ],
                  "patching_rect": [
                    301.672119,
                    636.782715,
                    164.0,
                    20.0
                  ],
                  "text": "poly~ bp.freqshift.poly 1 up 2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-81",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    483.0,
                    326.21167,
                    39.0,
                    20.0
                  ],
                  "text": "*~ 12"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-82",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    483.0,
                    288.21167,
                    35.0,
                    20.0
                  ],
                  "text": "+~ 5"
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    245.422119,
                    640.312744,
                    29.5,
                    20.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-1",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    245.422119,
                    835.272705,
                    80.0,
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
                  "automation": "off",
                  "automationon": "on",
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
                  "id": "obj-53",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    245.422119,
                    594.8927,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    174.31781005859375,
                    19.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "off",
                        "on"
                      ],
                      "parameter_type": 2,
                      "parameter_longname": "Mute",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "Mute"
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
                  "varname": "Mute"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-24",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    282.672119,
                    877.992676,
                    50.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    97.0,
                    50.0,
                    17.0
                  ],
                  "text": "Pos Shift",
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
                  "id": "obj-57",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    69.455986,
                    137.788605,
                    108.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    108.0,
                    17.0
                  ],
                  "text": "FREQUENCY SHIFTER",
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
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-26",
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
                    69.455986,
                    226.211639,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "CV2": [
                      0.0
                    ],
                    "CV2[1]": [
                      100.0
                    ],
                    "DryWetMix": [
                      50.0
                    ],
                    "Freq": [
                      100.0
                    ],
                    "FreqMode": [
                      0.0
                    ],
                    "Linear": [
                      0.0
                    ],
                    "Mute": [
                      0.0
                    ],
                    "Offset": [
                      0.0
                    ],
                    "ThruZero": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u062000499"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    422.672119,
                    468.782715,
                    41.0,
                    20.0
                  ],
                  "text": "mtof~"
                }
              },
              {
                "box": {
                  "comment": "Signal output.  If the frequency shift value is positive, this includes the positively shifted components; if the frequency shift value is negative, this includes the negatively shifted components.",
                  "id": "obj-50",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    245.422119,
                    877.992676,
                    25.0,
                    25.0
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
                    69.455986,
                    121.711639,
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
                    115.657448,
                    121.711639,
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
                    161.858902,
                    121.711639,
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
                    "obj-50",
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
                    1
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
                    "obj-84",
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
                    "obj-68",
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
                    "obj-1",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-2",
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
                  "order": 0,
                  "source": [
                    "obj-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-1",
                    1
                  ],
                  "source": [
                    "obj-25",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-56",
                    1
                  ],
                  "source": [
                    "obj-25",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-31",
                    2
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
                    "obj-73",
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
                    "obj-25",
                    3
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
                    "obj-44",
                    0
                  ],
                  "source": [
                    "obj-32",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-46",
                    0
                  ],
                  "midpoints": [
                    164.172119,
                    350.485535,
                    133.172119,
                    350.485535,
                    133.172119,
                    244.075256,
                    164.172119,
                    244.075256
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
                    "obj-51",
                    0
                  ],
                  "midpoints": [
                    298.172119,
                    362.485535,
                    116.422119,
                    362.485535,
                    116.422119,
                    228.075256,
                    298.172119,
                    228.075256
                  ],
                  "source": [
                    "obj-32",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-25",
                    1
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
                    "obj-25",
                    2
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
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-38",
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
                  "order": 1,
                  "source": [
                    "obj-38",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-1",
                    2
                  ],
                  "order": 1,
                  "source": [
                    "obj-41",
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
                  "order": 3,
                  "source": [
                    "obj-41",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-56",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-41",
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
                  "order": 2,
                  "source": [
                    "obj-41",
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
                  "source": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-32",
                    2
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
                    "obj-32",
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
                    "obj-31",
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
                    "obj-32",
                    1
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
                    "obj-82",
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
                    "obj-2",
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
                    "obj-58",
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
                    "obj-52",
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
                  "color": [
                    0.501961,
                    0.501961,
                    0.501961,
                    0.901961
                  ],
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
                    "obj-52",
                    1
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
                    "obj-67",
                    1
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
                    "obj-44",
                    1
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
                    "obj-36",
                    1
                  ],
                  "order": 2,
                  "source": [
                    "obj-73",
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
                  "order": 0,
                  "source": [
                    "obj-73",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-91",
                    1
                  ],
                  "order": 1,
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
                    "obj-75",
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
                    "obj-77",
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
                    "obj-81",
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
                    "obj-82",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-75",
                    1
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
                    "obj-36",
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
                    "obj-37",
                    0
                  ],
                  "source": [
                    "obj-91",
                    1
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
          "id": "obj-140",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1435.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
        }
      },
      {
        "box": {
          "id": "obj-141",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            1435.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
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
            372.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            1128.0,
            611.0,
            230.0,
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
          "id": "obj-144",
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
          "text": "9 \u00b7 BEAP Retuner",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            661.0,
            289.0,
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
          "id": "obj-145",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1209.0,
            1214.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            661.0,
            289.0,
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
          "id": "obj-146",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1209.0,
            1244.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            1209.0,
            1274.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            866.0,
            1214.0,
            333.0,
            20.0
          ],
          "text": "9 \u00b7 bp.Retuner \u2014 BEAP module around retune~"
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
            866.0,
            1244.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-150",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            866.0,
            1284.0,
            289.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            685.0,
            289.0,
            116.0
          ],
          "varname": "FX_RETUNER",
          "comment": "in 0: signal | in 1: CV (unused) | in 2: CV (unused) | out 0: signal",
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
              34.0,
              357.0,
              669.0,
              485.0
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
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    202.0,
                    582.422485,
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
                  "id": "obj-17",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    202.0,
                    627.422485,
                    129.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-20",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    202.0,
                    675.422485,
                    25.0,
                    25.0
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
                  "id": "obj-55",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    202.0,
                    540.922485,
                    43.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    229.5,
                    18.0,
                    52.0,
                    17.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_defer": 1,
                      "parameter_type": 2,
                      "parameter_longname": "power",
                      "parameter_mmax": 1.0,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "power"
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
                  "varname": "power[1]"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 5,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
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
                    "classnamespace": "box",
                    "rect": [
                      84.0,
                      128.0,
                      423.0,
                      273.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 10.0,
                    "default_fontface": 0,
                    "default_fontname": "Ableton Sans Bold Regular",
                    "gridonopen": 1,
                    "gridsize": [
                      8.0,
                      8.0
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
                          "fontsize": 11.0,
                          "id": "obj-4",
                          "linecount": 2,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            256.0,
                            32.0,
                            72.0,
                            31.0
                          ],
                          "text": "Retune~ parameters"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-58",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            144.0,
                            104.0,
                            124.0,
                            20.0
                          ],
                          "text": "correction_threshold $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-56",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            176.0,
                            128.0,
                            113.0,
                            20.0
                          ],
                          "text": "correction_bypass $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-55",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            112.0,
                            80.0,
                            115.0,
                            20.0
                          ],
                          "text": "correction_amount $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-3",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            208.0,
                            152.0,
                            176.0,
                            20.0
                          ],
                          "text": "correction_ambience_threshold $1"
                        }
                      },
                      {
                        "box": {
                          "fontface": 0,
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-9",
                          "items": [
                            "basic",
                            ",",
                            "good",
                            ",",
                            "better",
                            ",",
                            "best"
                          ],
                          "maxclass": "umenu",
                          "numinlets": 1,
                          "numoutlets": 3,
                          "outlettype": [
                            "int",
                            "",
                            ""
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            32.0,
                            80.0,
                            67.0,
                            20.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Ableton Sans Bold Regular",
                          "fontsize": 10.0,
                          "id": "obj-76",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            56.0,
                            104.0,
                            57.0,
                            20.0
                          ],
                          "text": "quality $1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            32.0,
                            32.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-36",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            112.0,
                            32.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-37",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            144.0,
                            32.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-38",
                          "index": 4,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            176.0,
                            32.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-39",
                          "index": 5,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            208.0,
                            32.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-40",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            112.0,
                            208.0,
                            25.0,
                            25.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-40",
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
                            "obj-9",
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
                            "obj-55",
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
                            "obj-58",
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
                            "obj-56",
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
                            "obj-3",
                            0
                          ],
                          "source": [
                            "obj-39",
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
                            "obj-55",
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
                            "obj-56",
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
                            "obj-58",
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
                            "obj-76",
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
                            "obj-9",
                            1
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    28.0,
                    399.847168,
                    83.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "description": "",
                    "digest": "",
                    "fontname": "Ableton Sans Bold Regular",
                    "fontsize": 10.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p Settings"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-34",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    124.0,
                    351.847168,
                    47.0,
                    16.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    188.0,
                    56.5,
                    47.0,
                    16.0
                  ],
                  "text": "Sibilan.",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701960980892181
                  ]
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "annotation": "Sets the automatic bypass when the signal contains too much noise or background ambience (reverb). A value between 0.2 and 0.4 is usually a good starting point ",
                  "appearance": 1,
                  "id": "obj-27",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    92.0,
                    375.847168,
                    48.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    234.0,
                    73.0,
                    48.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_linknames": 1,
                      "parameter_units": "ct",
                      "parameter_mmin": -10.0,
                      "parameter_longname": "AmbienceThreshold",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 10.0,
                      "parameter_initial": [
                        0
                      ],
                      "parameter_shortname": "Threshold"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701961
                  ],
                  "varname": "AmbienceThreshold"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-23",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    140.0,
                    375.847168,
                    51.0,
                    16.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    188.0,
                    73.0,
                    51.0,
                    16.0
                  ],
                  "text": "Ambien.",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701960980892181
                  ]
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "annotation": "Defines the sibilance threshold at which the original signal is passed through unaffected. This bypass switch is required to make sure that sibilancies in vocal recordings don\u2019t sound too processed. A default setting of 100 is a good tradeoff.",
                  "appearance": 1,
                  "id": "obj-21",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    76.0,
                    351.847168,
                    48.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    234.0,
                    56.5,
                    48.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_linknames": 1,
                      "parameter_units": "ct",
                      "parameter_longname": "SibilanceThreshold",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 500.0,
                      "parameter_initial": [
                        100
                      ],
                      "parameter_shortname": "Sibilance"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701961
                  ],
                  "varname": "SibilanceThreshold"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-22",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    108.0,
                    327.847168,
                    50.0,
                    16.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    188.0,
                    40.5,
                    50.0,
                    16.0
                  ],
                  "text": "Correct.",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701960980892181
                  ]
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "annotation": "Defines the threshold at which the correction takes effect. For most applications this should be set to 0 as this will correct notes that are more that 0 cent off (ideal pitch). A setting of 10 will allow a pitch deviation of 10 cents in either direction before the correction takes effect.",
                  "appearance": 1,
                  "id": "obj-24",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    60.0,
                    327.847168,
                    48.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    234.0,
                    40.5,
                    48.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 9,
                      "parameter_linknames": 1,
                      "parameter_units": "ct",
                      "parameter_longname": "CorrectionThreshold",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 99.0,
                      "parameter_initial": [
                        0
                      ],
                      "parameter_shortname": "Threshold"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701961
                  ],
                  "varname": "CorrectionThreshold"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-25",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    92.0,
                    287.847168,
                    30.0,
                    16.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    98.0,
                    56.5,
                    30.0,
                    16.0
                  ],
                  "text": "Amt",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701960980892181
                  ]
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "annotation": "Defines the amount of the correction applied. 0 means no correction, 100 means full correction.",
                  "appearance": 1,
                  "id": "obj-26",
                  "maxclass": "live.numbox",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    44.0,
                    287.847168,
                    48.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    138.0,
                    56.5,
                    48.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_linknames": 1,
                      "parameter_longname": "CorrectionAmount",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0,
                      "parameter_initial": [
                        100
                      ],
                      "parameter_shortname": "Amount"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701961
                  ],
                  "varname": "CorrectionAmount"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-29",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    84.0,
                    247.847168,
                    45.0,
                    16.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    98.0,
                    40.5,
                    45.0,
                    16.0
                  ],
                  "text": "Quality",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701960980892181
                  ]
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "annotation": "Sets a quality factor to the transposition engine. As quality increases, CPU may increase accordingly.",
                  "id": "obj-74",
                  "maxclass": "live.menu",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    28.0,
                    247.847168,
                    50.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    138.0,
                    40.5,
                    48.0,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_enum": [
                        "basic",
                        "good",
                        "better",
                        "best"
                      ],
                      "parameter_type": 2,
                      "parameter_linknames": 1,
                      "parameter_longname": "Quality",
                      "parameter_initial_enable": 1,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "Quality"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.701961
                  ],
                  "varname": "Quality"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-12",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    145.0,
                    683.422485,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    97.0,
                    38.0,
                    17.0
                  ],
                  "text": "Signal",
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
                  "id": "obj-11",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    462.5,
                    118.422485,
                    28.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    256.5,
                    0.0,
                    28.0,
                    17.0
                  ],
                  "text": "CV2",
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
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-10",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    298.0,
                    150.924194,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    126.5,
                    0.0,
                    38.0,
                    17.0
                  ],
                  "text": "1v/oct",
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "textjustification": 1
                }
              },
              {
                "box": {
                  "id": "obj-1",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    40.25,
                    94.036255,
                    172.0,
                    30.0
                  ],
                  "text": "## Tune any monophonic input to a specific pitch ##"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
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
                    40.25,
                    133.519485,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "AmbienceThreshold": [
                      0.0
                    ],
                    "CV2": [
                      0.0
                    ],
                    "CorrectionAmount": [
                      100.0
                    ],
                    "CorrectionThreshold": [
                      0.0
                    ],
                    "Offset": [
                      0.0
                    ],
                    "Quality": [
                      0.0
                    ],
                    "SibilanceThreshold": [
                      100.0
                    ],
                    "power[1]": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u041001333"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-7",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    208.0,
                    396.847168,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
                    38.0,
                    17.0
                  ],
                  "text": "Signal",
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
                    40.25,
                    69.019485,
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
                  "text": "RETUNER",
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
                  "id": "obj-15",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    257.0,
                    396.847168,
                    30.0,
                    30.0
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
                  "id": "obj-19",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    683.406372,
                    31.241577,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    53.75,
                    42.5,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_units": "ST",
                      "parameter_mmin": -100.0,
                      "parameter_longname": "CV2",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0,
                      "parameter_initial": [
                        0
                      ],
                      "parameter_shortname": "CV2"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "CV2"
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
                    421.0,
                    231.847168,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    7.0,
                    42.5,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_type": 0,
                      "parameter_unitstyle": 9,
                      "parameter_units": "ST",
                      "parameter_mmin": -36.0,
                      "parameter_longname": "Offset",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 36.0,
                      "parameter_initial": [
                        0
                      ],
                      "parameter_shortname": "Offset"
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Offset"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-33",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.0,
                    294.633911,
                    98.0,
                    20.0
                  ],
                  "text": "+~"
                }
              },
              {
                "box": {
                  "annotation": "",
                  "comment": "CV1: 1v/oct pitch modulation input. This input is typically used for keyboard tracking since there is no attenuator.",
                  "hint": "",
                  "id": "obj-41",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    342.0,
                    150.924194,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-8",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    500.0,
                    179.845459,
                    140.406006,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "comment": "CV2: pitch modulation input. This input has a built-in attenuator (CV2). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV2 input.",
                  "hint": "",
                  "id": "obj-65",
                  "index": 3,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    500.0,
                    118.422485,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-66",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    621.406372,
                    94.036255,
                    45.0,
                    21.0
                  ],
                  "text": "sig~ 2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-67",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    621.406372,
                    136.977417,
                    81.0,
                    21.0
                  ],
                  "text": "pow~"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-68",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    683.406372,
                    94.036255,
                    37.0,
                    20.0
                  ],
                  "text": "* 0.01"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-69",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    500.0,
                    294.633911,
                    38.0,
                    20.0
                  ],
                  "text": "-~ 60"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-91",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.0,
                    354.633911,
                    177.0,
                    20.0
                  ],
                  "text": "+~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-81",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    500.0,
                    261.633911,
                    39.0,
                    20.0
                  ],
                  "text": "*~ 12"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-39",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    500.0,
                    231.847168,
                    35.0,
                    20.0
                  ],
                  "text": "+~ 5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-78",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.0,
                    244.347168,
                    39.0,
                    20.0
                  ],
                  "text": "*~ 12"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-76",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.0,
                    201.847168,
                    35.0,
                    20.0
                  ],
                  "text": "+~ 5"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    342.0,
                    457.422485,
                    41.0,
                    20.0
                  ],
                  "text": "mtof~"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    257.0,
                    552.422485,
                    32.0,
                    20.0
                  ],
                  "text": "*~ 5"
                }
              },
              {
                "box": {
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    257.0,
                    457.422485,
                    42.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 5,
                  "outlettype": [
                    "signal",
                    "signal",
                    "signal",
                    "signal",
                    "list"
                  ],
                  "patching_rect": [
                    257.0,
                    504.422485,
                    189.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "correction_ambience_threshold": [
                      0.0
                    ],
                    "notebase": 0,
                    "notelist": [
                      100,
                      200,
                      300,
                      400,
                      500,
                      600,
                      700,
                      800,
                      900,
                      1000,
                      1100
                    ],
                    "pitchdetection": 0,
                    "quality": "basic",
                    "reportlatency": 0,
                    "retune": 1,
                    "use_16bit": [
                      0
                    ],
                    "windowsize": [
                      64
                    ]
                  },
                  "text": "retune~"
                }
              },
              {
                "box": {
                  "background": 1,
                  "bgmode": 0,
                  "border": 0,
                  "clickthrough": 0,
                  "enablehscroll": 0,
                  "enablevscroll": 0,
                  "id": "obj-9",
                  "lockeddragscroll": 0,
                  "maxclass": "bpatcher",
                  "name": "background_sm.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "offset": [
                    0.0,
                    0.0
                  ],
                  "patching_rect": [
                    40.25,
                    49.038956,
                    239.0,
                    10.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    0.0,
                    359.0,
                    132.0
                  ],
                  "viewvisibility": 1
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-17",
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
                    "obj-17",
                    2
                  ],
                  "midpoints": [
                    266.5,
                    446.634827,
                    321.5,
                    446.634827
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
                    "obj-3",
                    0
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
                    "obj-20",
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
                    "obj-2",
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
                    "obj-68",
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
                    "obj-4",
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
                    3
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
                    "obj-18",
                    2
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
                    "obj-18",
                    1
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
                    "obj-18",
                    4
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
                    "obj-33",
                    1
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
                    "obj-2",
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
                    "obj-91",
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
                    "obj-81",
                    0
                  ],
                  "source": [
                    "obj-39",
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
                  "source": [
                    "obj-4",
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
                    "obj-41",
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
                    "obj-55",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-2",
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
                    "obj-8",
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
                  "color": [
                    0.501961,
                    0.501961,
                    0.501961,
                    0.901961
                  ],
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
                    "obj-8",
                    1
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
                    "obj-67",
                    1
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
                    "obj-91",
                    1
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
                    "obj-18",
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
                    "obj-33",
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
                    "obj-39",
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
                    "obj-69",
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
                    "obj-6",
                    0
                  ],
                  "source": [
                    "obj-91",
                    0
                  ]
                }
              }
            ]
          },
          "embed": 1
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
            866.0,
            1435.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1095.0,
            1435.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
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
            424.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            807.0,
            289.0,
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
            450.0,
            186.0,
            20.0
          ],
          "text": "10 \u00b7 amxd AutoRingMod",
          "presentation": 1,
          "presentation_rect": [
            331.0,
            661.0,
            292.0,
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
          "id": "obj-156",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1995.0,
            1214.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            331.0,
            661.0,
            292.0,
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
            1995.0,
            1244.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1995.0,
            1274.0,
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
            1349.0,
            1214.0,
            636.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Max AutoRingMod.amxd \u2014 ring mod whose frequency follows the input envelope"
        }
      },
      {
        "box": {
          "id": "obj-160",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1349.0,
            1244.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            633.0,
            661.0,
            50.0,
            22.0
          ]
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
            1419.0,
            1244.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-162",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1499.0,
            1244.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-163",
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
            1349.0,
            1324.0,
            348.0,
            196.0
          ],
          "text": "amxd~ \"Max AutoRingMod.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            331.0,
            687.0,
            348.0,
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
          "id": "obj-164",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1649.0,
            1244.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1649.0,
            1284.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            1349.0,
            1555.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
        }
      },
      {
        "box": {
          "id": "obj-167",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1489.0,
            1555.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            476.0,
            263.0,
            20.0
          ],
          "text": "11 \u00b7 amxd Simple Pitch Shifter",
          "presentation": 1,
          "presentation_rect": [
            707.0,
            661.0,
            205.0,
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
          "id": "obj-170",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            611.0,
            1655.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            707.0,
            661.0,
            205.0,
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
            611.0,
            1685.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            611.0,
            1715.0,
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
            1655.0,
            571.0,
            20.0
          ],
          "text": "11 \u00b7 amxd~ Simple Pitch Shifter.amxd \u2014 pitchshift~ with latency compensation"
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
            30.0,
            1685.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            922.0,
            661.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-175",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            1685.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1685.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-177",
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
            1765.0,
            128.0,
            196.0
          ],
          "text": "amxd~ \"Simple Pitch Shifter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            707.0,
            687.0,
            128.0,
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
          "varname": "DEV_11",
          "presentation_linecount": 2
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
            330.0,
            1685.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-179",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            1725.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
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
            170.0,
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
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
            502.0,
            220.0,
            20.0
          ],
          "text": "12 \u00b7 amxd Dual Harmonizer",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            913.0,
            382.0,
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
          "id": "obj-184",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1382.0,
            1655.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            913.0,
            382.0,
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
            1382.0,
            1685.0,
            40.0,
            22.0
          ],
          "text": "11"
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
            1382.0,
            1715.0,
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
            751.0,
            1655.0,
            621.0,
            20.0
          ],
          "text": "12 \u00b7 amxd~ Dual Harmonizer.amxd \u2014 two mono pitch shifters with vibrato and feedback"
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
            751.0,
            1685.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            410.0,
            913.0,
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
            821.0,
            1685.0,
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
            901.0,
            1685.0,
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
            751.0,
            1765.0,
            438.0,
            196.0
          ],
          "text": "amxd~ \"Dual Harmonizer.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            939.0,
            438.0,
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
          "id": "obj-192",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1051.0,
            1685.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1051.0,
            1725.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            751.0,
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
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
            891.0,
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
        }
      },
      {
        "box": {
          "id": "obj-197",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
            161.0,
            20.0
          ],
          "text": "13 \u00b7 amxd Autotuna",
          "presentation": 1,
          "presentation_rect": [
            484.0,
            913.0,
            322.0,
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
          "id": "obj-198",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2045.0,
            1655.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            484.0,
            913.0,
            322.0,
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
          "id": "obj-199",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2045.0,
            1685.0,
            40.0,
            22.0
          ],
          "text": "12"
        }
      },
      {
        "box": {
          "id": "obj-200",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2045.0,
            1715.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1522.0,
            1655.0,
            513.0,
            20.0
          ],
          "text": "13 \u00b7 amxd~ Autotuna.amxd \u2014 retune~ auto-tuner with Scala scale files"
        }
      },
      {
        "box": {
          "id": "obj-202",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1522.0,
            1685.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            816.0,
            913.0,
            50.0,
            22.0
          ]
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
            1592.0,
            1685.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1672.0,
            1685.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-205",
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
            1522.0,
            1765.0,
            378.0,
            196.0
          ],
          "text": "amxd~ Autotuna.amxd",
          "presentation": 1,
          "presentation_rect": [
            484.0,
            939.0,
            378.0,
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
          "id": "obj-206",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1822.0,
            1685.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1822.0,
            1725.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            1522.0,
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
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
            1662.0,
            1996.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            554.0,
            178.0,
            20.0
          ],
          "text": "14 \u00b7 amxd Microtuner",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1165.0,
            550.0,
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
          "id": "obj-212",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            666.0,
            2096.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1165.0,
            550.0,
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
            666.0,
            2126.0,
            40.0,
            22.0
          ],
          "text": "13"
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
            666.0,
            2156.0,
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
            30.0,
            2096.0,
            626.0,
            20.0
          ],
          "text": "14 \u00b7 amxd~ Microtuner.amxd \u2014 table-based microtonal auto-tuner"
        }
      },
      {
        "box": {
          "id": "obj-216",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2126.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            578.0,
            1165.0,
            50.0,
            22.0
          ]
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
            100.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-219",
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
            2206.0,
            606.0,
            196.0
          ],
          "text": "amxd~ Microtuner.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1191.0,
            606.0,
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
          "id": "obj-220",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            2126.0,
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
            330.0,
            2166.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
        }
      },
      {
        "box": {
          "id": "obj-222",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_L"
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_R"
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
            580.0,
            203.0,
            20.0
          ],
          "text": "15 \u00b7 amxd Speed Shifter",
          "presentation": 1,
          "presentation_rect": [
            652.0,
            1165.0,
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
          "id": "obj-226",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1408.0,
            2096.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            652.0,
            1165.0,
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
          "id": "obj-227",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1408.0,
            2126.0,
            40.0,
            22.0
          ],
          "text": "14"
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
            1408.0,
            2156.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            806.0,
            2096.0,
            592.0,
            20.0
          ],
          "text": "15 \u00b7 amxd~ Speed Shifter.amxd \u2014 two tape loops at different speeds feeding back"
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
            806.0,
            2126.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            866.0,
            1165.0,
            50.0,
            22.0
          ]
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
            876.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-232",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            956.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-233",
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
            806.0,
            2206.0,
            250.0,
            196.0
          ],
          "text": "amxd~ \"Speed Shifter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            652.0,
            1191.0,
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
          "varname": "DEV_15"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1106.0,
            2126.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1106.0,
            2166.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            806.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_L"
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
            946.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX15_R"
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
            2520.0,
            606.0,
            195.0,
            20.0
          ],
          "text": "16 \u00b7 amxd SpectralHarm",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1417.0,
            400.0,
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
          "id": "obj-240",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2034.0,
            2096.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1417.0,
            400.0,
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
          "id": "obj-241",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2034.0,
            2126.0,
            40.0,
            22.0
          ],
          "text": "15"
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
            2034.0,
            2156.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1548.0,
            2096.0,
            476.0,
            20.0
          ],
          "text": "16 \u00b7 amxd~ Max SpectralHarm.amxd \u2014 pfft~ spectral harmonizer"
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
            1548.0,
            2126.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            428.0,
            1417.0,
            50.0,
            22.0
          ]
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
            1618.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1698.0,
            2126.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-247",
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
            1548.0,
            2206.0,
            456.0,
            196.0
          ],
          "text": "amxd~ \"Max SpectralHarm.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1443.0,
            456.0,
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
          "id": "obj-248",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1848.0,
            2126.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1848.0,
            2166.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            1548.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_L"
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
            1688.0,
            2437.0,
            83.0,
            22.0
          ],
          "text": "s~ FX16_R"
        }
      },
      {
        "box": {
          "id": "obj-253",
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
          "text": "17 \u00b7 AU Pitch",
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1417.0,
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
          "varname": "TITLE_17"
        }
      },
      {
        "box": {
          "id": "obj-254",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1075.0,
            2537.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1417.0,
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
          "id": "obj-255",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1075.0,
            2567.0,
            40.0,
            22.0
          ],
          "text": "16"
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
            1075.0,
            2597.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-257",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2537.0,
            1035.0,
            20.0
          ],
          "text": "17 \u00b7 vst~ + plug_au AUPitch \u2014 Apple's pitch shifter"
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
            2567.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            2567.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-260",
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
            2907.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1573.0,
            214.0,
            22.0
          ],
          "varname": "VST_17"
        }
      },
      {
        "box": {
          "id": "obj-261",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            2567.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-262",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            2595.0,
            55.0,
            22.0
          ],
          "text": "t b b"
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
            330.0,
            2637.0,
            125.0,
            22.0
          ],
          "text": "plug_au AUPitch"
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
            230.0,
            2637.0,
            97.0,
            22.0
          ],
          "text": "s AU17_INIT"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            2567.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1441.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-266",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2677.0,
            97.0,
            22.0
          ],
          "text": "r AU17_INIT"
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
            230.0,
            2822.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST17"
        }
      },
      {
        "box": {
          "id": "obj-268",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2717.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2747.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            560.0,
            1441.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-270",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            658.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            586.0,
            1443.0,
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
          "id": "obj-271",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2777.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-272",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            2717.0,
            62.0,
            22.0
          ],
          "text": "0.6458"
        }
      },
      {
        "box": {
          "id": "obj-273",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            389.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1469.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-274",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
            169.0,
            20.0
          ],
          "text": "pitch (\u00b12400 cents)",
          "presentation": 1,
          "presentation_rect": [
            558.0,
            1471.0,
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
          "id": "obj-275",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            389.0,
            2777.0,
            76.0,
            22.0
          ],
          "text": "Pitch $1"
        }
      },
      {
        "box": {
          "id": "obj-276",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            2717.0,
            40.0,
            22.0
          ],
          "text": "1."
        }
      },
      {
        "box": {
          "id": "obj-277",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            548.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1493.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            710.0,
            118.0,
            20.0
          ],
          "text": "blend (\u2192 wet)",
          "presentation": 1,
          "presentation_rect": [
            558.0,
            1495.0,
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
          "id": "obj-279",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            548.0,
            2777.0,
            139.0,
            22.0
          ],
          "text": "\"Effect Blend\" $1"
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
            707.0,
            2717.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-281",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            707.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1517.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            736.0,
            93.0,
            20.0
          ],
          "text": "smoothness",
          "presentation": 1,
          "presentation_rect": [
            558.0,
            1519.0,
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
          "id": "obj-283",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            707.0,
            2777.0,
            111.0,
            22.0
          ],
          "text": "Smoothness $1"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            866.0,
            2717.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-285",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            866.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1541.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-286",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
            84.0,
            20.0
          ],
          "text": "tightness",
          "presentation": 1,
          "presentation_rect": [
            558.0,
            1543.0,
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
          "id": "obj-287",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            866.0,
            2777.0,
            104.0,
            22.0
          ],
          "text": "Tightness $1"
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
            110.0,
            2867.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST17"
        }
      },
      {
        "box": {
          "id": "obj-289",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2957.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_L"
        }
      },
      {
        "box": {
          "id": "obj-290",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            2957.0,
            83.0,
            22.0
          ],
          "text": "s~ FX17_R"
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
            788.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            502.0,
            1601.0,
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
          "id": "obj-293",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            814.0,
            144.0,
            20.0
          ],
          "text": "18 \u00b7 AU NewPitch",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1417.0,
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
          "varname": "TITLE_18"
        }
      },
      {
        "box": {
          "id": "obj-294",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1921.0,
            2537.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1417.0,
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
          "id": "obj-295",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1921.0,
            2567.0,
            40.0,
            22.0
          ],
          "text": "17"
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
            1921.0,
            2597.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1215.0,
            2537.0,
            696.0,
            20.0
          ],
          "text": "18 \u00b7 vst~ + plug_au AUNewPitch \u2014 Apple's newer pitch shifter"
        }
      },
      {
        "box": {
          "id": "obj-298",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1215.0,
            2567.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1295.0,
            2567.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-300",
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
            1215.0,
            2907.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1525.0,
            214.0,
            22.0
          ],
          "varname": "VST_18"
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1415.0,
            2567.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1415.0,
            2595.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1515.0,
            2637.0,
            146.0,
            22.0
          ],
          "text": "plug_au AUNewPitch"
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
            1415.0,
            2637.0,
            97.0,
            22.0
          ],
          "text": "s AU18_INIT"
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
            1655.0,
            2567.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1441.0,
            50.0,
            22.0
          ]
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
            1415.0,
            2677.0,
            97.0,
            22.0
          ],
          "text": "r AU18_INIT"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1415.0,
            2822.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST18"
        }
      },
      {
        "box": {
          "id": "obj-308",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1415.0,
            2717.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-309",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            1415.0,
            2747.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            798.0,
            1441.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            824.0,
            1443.0,
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
          "id": "obj-311",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1415.0,
            2777.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-312",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1567.0,
            2717.0,
            62.0,
            22.0
          ],
          "text": "0.6458"
        }
      },
      {
        "box": {
          "id": "obj-313",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1567.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1469.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
        }
      },
      {
        "box": {
          "id": "obj-314",
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
          "text": "pitch (\u00b12400 cents)",
          "presentation": 1,
          "presentation_rect": [
            796.0,
            1471.0,
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
          "id": "obj-315",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1567.0,
            2777.0,
            132.0,
            22.0
          ],
          "text": "\"Pitch Scale\" $1"
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
            1719.0,
            2717.0,
            62.0,
            22.0
          ],
          "text": "0.1724"
        }
      },
      {
        "box": {
          "id": "obj-317",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1719.0,
            2747.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1493.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            892.0,
            152.0,
            20.0
          ],
          "text": "smoothness (3\u201332)",
          "presentation": 1,
          "presentation_rect": [
            796.0,
            1495.0,
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
          "id": "obj-319",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1719.0,
            2777.0,
            111.0,
            22.0
          ],
          "text": "Smoothness $1"
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
            1295.0,
            2867.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST18"
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
            1215.0,
            2957.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_L"
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
            1305.0,
            2957.0,
            83.0,
            22.0
          ],
          "text": "s~ FX18_R"
        }
      },
      {
        "box": {
          "id": "obj-323",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            1553.0,
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
          "id": "obj-324",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3067.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201318 are the effects"
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
            30.0,
            3127.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-326",
          "maxclass": "newobj",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3177.0,
            209.0,
            22.0
          ],
          "text": "selector~ 18 1 @ramptime 30"
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
            3227.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            1110.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
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
            1200.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_L"
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
            1290.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_L"
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
            1380.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_L"
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
            1470.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_L"
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
            1560.0,
            3127.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_L"
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
            30.0,
            3257.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-346",
          "maxclass": "newobj",
          "numinlets": 19,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3307.0,
            209.0,
            22.0
          ],
          "text": "selector~ 18 1 @ramptime 30"
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
            30.0,
            3357.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            1020.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            1110.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
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
            1200.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_R"
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
            1290.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX15_R"
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
            1380.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX16_R"
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
            1470.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX17_R"
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
            1560.0,
            3257.0,
            83.0,
            22.0
          ],
          "text": "r~ FX18_R"
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
            3407.0,
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
            3437.0,
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
            3437.0,
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
            3437.0,
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
            3437.0,
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
            3437.0,
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
            3437.0,
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
            3477.0,
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
            3477.0,
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
            3527.0,
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
            3527.0,
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
            3527.0,
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
            3527.0,
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
            3587.0,
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
            3667.0,
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
            3407.0,
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
            3437.0,
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
            3477.0,
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
            3517.0,
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
            3557.0,
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
            3597.0,
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
            3597.0,
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
            3637.0,
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
            3637.0,
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
            3677.0,
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
            3677.0,
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
            944.0,
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
            970.0,
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
            996.0,
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
            1022.0,
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
            1048.0,
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
            1074.0,
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
            1100.0,
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
            1126.0,
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
            1152.0,
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
            1178.0,
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
            1204.0,
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
            1230.0,
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
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            459.0,
            182.0,
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
          "id": "obj-55",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
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
          "id": "obj-69",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            384.0,
            459.0,
            176.0,
            151.0
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
          "id": "obj-83",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            568.0,
            459.0,
            176.0,
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
          "id": "obj-98",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            752.0,
            459.0,
            176.0,
            175.0
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
          "id": "obj-115",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            936.0,
            459.0,
            176.0,
            175.0
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
          "id": "obj-132",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1120.0,
            459.0,
            246.0,
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
          "id": "obj-143",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            655.0,
            305.0,
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
          "id": "obj-154",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            323.0,
            655.0,
            368.0,
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
          "id": "obj-168",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            699.0,
            655.0,
            281.0,
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
          "id": "obj-182",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            907.0,
            458.0,
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
          "id": "obj-196",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            476.0,
            907.0,
            398.0,
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
          "id": "obj-210",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1159.0,
            626.0,
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
          "id": "obj-224",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            644.0,
            1159.0,
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
          "id": "obj-238",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1411.0,
            476.0,
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
          "id": "obj-252",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1080.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            494.0,
            1411.0,
            230.0,
            237.0
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
          "id": "obj-292",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            3737.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            732.0,
            1411.0,
            230.0,
            189.0
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
            1220.0,
            3737.0,
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
          "id": "obj-392",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1290.0,
            3737.0,
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
          "id": "obj-406",
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
            3797.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"PITCH SHOOTOUT \\u2014 ring modulation, frequency shifting, pitch shifting, harmonizers and retuning. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 18, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        389\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 18,\n        \"num_lines_presentation\": 18,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 cycle~ ring mod\",\n              \"3 freqshift~\",\n              \"4 pitchshift~\",\n              \"5 retune~\",\n              \"6 abl ringmod~\",\n              \"7 abl pitchshifter~\",\n              \"8 BEAP Freq Shifter\",\n              \"9 BEAP Retuner\",\n              \"10 amxd AutoRingMod\",\n              \"11 amxd Simple Pitch Shifter\",\n              \"12 amxd Dual Harmonizer\",\n              \"13 amxd Autotuna\",\n              \"14 amxd Microtuner\",\n              \"15 amxd Speed Shifter\",\n              \"16 amxd SpectralHarm\",\n              \"17 AU Pitch\",\n              \"18 AU NewPitch\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 17,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 18,\n        \"num_lines_presentation\": 18,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 18 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        459,\n        182,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 ring mod (cycle~ *~)\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        18,\n        465,\n        166,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        520\n      ],\n      \"presentation\": [\n        18,\n        465,\n        166,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        500,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 cycle~ \\u2192 *~ \\u2014 classic ring modulation (two objects)\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        720\n      ],\n      \"presentation\": [\n        18,\n        515,\n        166,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f02_side\": {\n      \"type\": \"newobj\",\n      \"text\": \"cycle~\",\n      \"pos\": [\n        130,\n        660\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"f02_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 440.0\",\n      \"pos\": [\n        310,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        310,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": 0.1,\n        \"maximum\": 10000.0\n      },\n      \"presentation\": [\n        18,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.1,\n        \"maximum\": 10000.0\n      }\n    },\n    \"f02_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"carrier (Hz)\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        74,\n        491,\n        110,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        543,\n        166,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        765\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        765\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        200,\n        459,\n        176,\n        114\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 freqshift~\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        208,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1228,\n        520\n      ],\n      \"presentation\": [\n        208,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1228,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1228,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 freqshift~ \\u2014 time-domain frequency shifter (outlet 1 = negative sideband)\",\n      \"pos\": [\n        640,\n        520\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        640,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"freqshift~\",\n      \"pos\": [\n        640,\n        672\n      ],\n      \"presentation\": [\n        208,\n        515,\n        160,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f03_c0_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 100.0\",\n      \"pos\": [\n        770,\n        590\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        770,\n        620\n      ],\n      \"attrs\": {\n        \"minimum\": -5000.0,\n        \"maximum\": 5000.0\n      },\n      \"presentation\": [\n        208,\n        489,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": -5000.0,\n        \"maximum\": 5000.0\n      }\n    },\n    \"f03_c0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"shift (Hz)\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        93,\n        20\n      ],\n      \"presentation\": [\n        264,\n        491,\n        104,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        208,\n        543,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        640,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        730,\n        717\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        384,\n        459,\n        176,\n        151\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 pitchshift~\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        392,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1920,\n        520\n      ],\n      \"presentation\": [\n        392,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1920,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1920,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 pitchshift~ 2 \\u2014 Ztx pitch shifter, stereo (outlet 2 reports latency)\",\n      \"pos\": [\n        1368,\n        520\n      ],\n      \"size\": [\n        542,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1368,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1448,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"pitchshift~ 2 @pitchshift 1.5 @quality good\",\n      \"pos\": [\n        1368,\n        698\n      ],\n      \"inlets\": 3,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\"\n      ],\n      \"presentation\": [\n        392,\n        563,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      }\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1498,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"pitchshift\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        392,\n        489,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"pitchshift\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1518,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"pitchshiftcent\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        392,\n        513,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"pitchshiftcent\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1538,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"quality\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        392,\n        537,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"quality\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1368,\n        743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1458,\n        743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        568,\n        459,\n        176,\n        186\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 retune~\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        101,\n        20\n      ],\n      \"presentation\": [\n        576,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        553,\n        865\n      ],\n      \"presentation\": [\n        576,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        553,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        553,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 retune~ 440 \\u2014 Ztx pitch detection + retuning to the nearest note\",\n      \"pos\": [\n        30,\n        865\n      ],\n      \"size\": [\n        513,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"retune~ 440\",\n      \"pos\": [\n        30,\n        1069\n      ],\n      \"presentation\": [\n        576,\n        587,\n        160,\n        22\n      ],\n      \"inlets\": 3,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\"\n      ]\n    },\n    \"f05_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        935\n      ],\n      \"attrs\": {\n        \"attr\": \"retune\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        576,\n        489,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"retune\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f05_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        961\n      ],\n      \"attrs\": {\n        \"attr\": \"correction_amount\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        576,\n        513,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"correction_amount\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f05_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        987\n      ],\n      \"attrs\": {\n        \"attr\": \"correction_threshold\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        576,\n        537,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"correction_threshold\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f05_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        1013\n      ],\n      \"attrs\": {\n        \"attr\": \"quality\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        576,\n        561,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"quality\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        576,\n        615,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        120,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        752,\n        459,\n        176,\n        175\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 abl ringmod~\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        760,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1203,\n        865\n      ],\n      \"presentation\": [\n        760,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1203,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1203,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 abl.dsp.ringmod~ \\u2014 Live's ring modulator with drive\",\n      \"pos\": [\n        693,\n        865\n      ],\n      \"size\": [\n        500,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        693,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        773,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.ringmod~ @mix 1.\",\n      \"pos\": [\n        693,\n        1069\n      ],\n      \"presentation\": [\n        760,\n        587,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f06_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        823,\n        935\n      ],\n      \"attrs\": {\n        \"attr\": \"frequency\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        760,\n        489,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"frequency\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f06_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        843,\n        961\n      ],\n      \"attrs\": {\n        \"attr\": \"enable_drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        760,\n        513,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"enable_drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f06_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        863,\n        987\n      ],\n      \"attrs\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        760,\n        537,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"drive\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f06_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        883,\n        1013\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        760,\n        561,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        693,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        783,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1073,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1073,\n        925\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        936,\n        459,\n        176,\n        175\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl pitchshifter~\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        944,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1853,\n        865\n      ],\n      \"presentation\": [\n        944,\n        465,\n        160,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1853,\n        895\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1853,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 abl.dsp.pitchshifter~ \\u2014 Live's Shifter pitch mode\",\n      \"pos\": [\n        1343,\n        865\n      ],\n      \"size\": [\n        500,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1343,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1423,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.dsp.pitchshifter~ @mix 1.\",\n      \"pos\": [\n        1343,\n        1069\n      ],\n      \"presentation\": [\n        944,\n        587,\n        160,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f07_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1473,\n        935\n      ],\n      \"attrs\": {\n        \"attr\": \"shift\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        944,\n        489,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shift\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f07_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1493,\n        961\n      ],\n      \"attrs\": {\n        \"attr\": \"window\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        944,\n        513,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"window\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f07_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1513,\n        987\n      ],\n      \"attrs\": {\n        \"attr\": \"wide\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        944,\n        537,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"wide\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f07_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1533,\n        1013\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        944,\n        561,\n        160,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1343,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1433,\n        1114\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1723,\n        895\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1723,\n        925\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1120,\n        459,\n        246,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 BEAP Frequency Shifter\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        1128,\n        465,\n        230,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        726,\n        1214\n      ],\n      \"presentation\": [\n        1128,\n        465,\n        230,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        726,\n        1244\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        726,\n        1274\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 bp.Frequency Shifter \\u2014 BEAP module (out 0 = shifted; out 1 = the other sideband, unused)\",\n      \"pos\": [\n        30,\n        1214\n      ],\n      \"size\": [\n        686,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        1244\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1284\n      ],\n      \"size\": [\n        230,\n        116\n      ],\n      \"presentation\": [\n        1128,\n        489,\n        230,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_FREQSHIFT\",\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | in 3: CV (unused) | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          173.0,\n          260.0,\n          684.0,\n          536.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-31\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  84.0,\n                  128.0,\n                  640.0,\n                  480.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-22\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        166.093994,\n                        163.924805,\n                        63.0,\n                        22.0\n                      ],\n                      \"text\": \"pack f 50.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-21\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"float\"\n                      ],\n                      \"patching_rect\": [\n                        166.093994,\n                        134.70752,\n                        42.0,\n                        22.0\n                      ],\n                      \"text\": \"* 0.01\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-20\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        270.924805,\n                        29.5,\n                        22.0\n                      ],\n                      \"text\": \"+~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-19\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"signal\",\n                        \"bang\"\n                      ],\n                      \"patching_rect\": [\n                        166.093994,\n                        196.924805,\n                        50.0,\n                        22.0\n                      ],\n                      \"text\": \"line~ 0.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        90.22406,\n                        134.70752,\n                        63.0,\n                        22.0\n                      ],\n                      \"text\": \"pack f 50.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-17\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"signal\",\n                        \"bang\"\n                      ],\n                      \"patching_rect\": [\n                        90.22406,\n                        167.70752,\n                        56.0,\n                        22.0\n                      ],\n                      \"text\": \"line~ 0.2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-14\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"float\"\n                      ],\n                      \"patching_rect\": [\n                        90.22406,\n                        100.0,\n                        49.0,\n                        22.0\n                      ],\n                      \"text\": \"* 0.002\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-13\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        200.817505,\n                        59.22406,\n                        22.0\n                      ],\n                      \"text\": \"*~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-23\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        647.477294921875,\n                        507.0751953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-27\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        90.22406,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        687.7013549804688,\n                        507.0751953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-28\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        166.093994,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        763.5712890625,\n                        507.0751953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-29\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        50.0,\n                        352.924805,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        647.477294921875,\n                        820.0,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-20\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-13\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-14\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-13\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-17\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-17\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-20\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-19\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-29\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-20\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-22\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-21\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-19\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-22\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-13\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-23\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-14\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-27\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-21\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-28\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                647.477295,\n                619.075195,\n                99.44812,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"globalpatchername\": \"\",\n                \"tags\": \"\"\n              },\n              \"text\": \"p Mix\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                659.477295,\n                540.788574,\n                26.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                97.77592468261719,\n                76.22152709960938,\n                26.0,\n                17.0\n              ],\n              \"text\": \"Mix\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"hint\": \"Attenuator for CV Mix\",\n              \"id\": \"obj-10\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                687.701355,\n                540.788574,\n                70.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                123.0,\n                76.22152709960938,\n                46.82677459716797,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_longname\": \"CV2[2]\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"CV2\"\n                }\n              },\n              \"textcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"varname\": \"CV2[1]\"\n            }\n          },\n          {\n            \"box\": {\n              \"annotation\": \"\",\n              \"comment\": \"Mix CV\",\n              \"hint\": \"Mix CV\",\n              \"id\": \"obj-5\",\n              \"index\": 4,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                647.477295,\n                496.788574,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                67.870605,\n                0.0,\n                26.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                200.31781005859375,\n                0.0,\n                26.0,\n                17.0\n              ],\n              \"text\": \"Mix\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"Adjusts the dry-wet mix.\",\n              \"bordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"hint\": \"Adjusts the dry-wet mix.\",\n              \"id\": \"obj-3\",\n              \"maxclass\": \"live.dial\",\n              \"needlecolor\": [\n                0.752941,\n                0.784314,\n                0.839216,\n                1.0\n              ],\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                763.571289,\n                542.788574,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                174.0,\n                43.221527099609375,\n                44.0,\n                48.0\n              ],\n              \"prototypename\": \"freq\",\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_linknames\": 1,\n                  \"parameter_longname\": \"DryWetMix\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_initial\": [\n                    100\n                  ],\n                  \"parameter_speedlim\": 0.0,\n                  \"parameter_shortname\": \"Mix\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"DryWetMix\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.917647,\n                0.94902,\n                0.054902,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextoncolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                1.0\n              ],\n              \"annotation\": \"Thru-zero: includes negative frequencies in the output.  Only affects negatively shifted frequencies.\",\n              \"automation\": \"off\",\n              \"automationon\": \"on\",\n              \"bgcolor\": [\n                0.6,\n                0.6,\n                0.6,\n                0.0\n              ],\n              \"bordercolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"focusbordercolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hint\": \"Thru-zero: Passes/blocks frequencies less than zero (created by negative frequency shifts).    \",\n              \"id\": \"obj-38\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                524.672119,\n                558.90332,\n                73.0,\n                18.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                51.0,\n                75.22152709960938,\n                38.0,\n                14.947551727294922\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"off\",\n                    \"on\"\n                  ],\n                  \"parameter_type\": 2,\n                  \"parameter_linknames\": 1,\n                  \"parameter_longname\": \"ThruZero\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_speedlim\": 0.0,\n                  \"parameter_shortname\": \"ThruZero\"\n                }\n              },\n              \"text\": \"Thru-Z\",\n              \"textcolor\": [\n                0.556863,\n                0.556863,\n                0.556863,\n                1.0\n              ],\n              \"texton\": \"Thru-Z\",\n              \"varname\": \"ThruZero\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-37\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  59.0,\n                  103.0,\n                  640.0,\n                  480.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-3\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.0,\n                        36.0,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-1\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        80.327881,\n                        100.0,\n                        41.0,\n                        20.0\n                      ],\n                      \"text\": \"gate~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-31\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        80.327881,\n                        136.1073,\n                        86.0,\n                        20.0\n                      ],\n                      \"text\": \"maximum~ 20\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-27\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"signal\",\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        182.1073,\n                        49.327881,\n                        20.0\n                      ],\n                      \"text\": \"cross~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-33\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        301.672119140625,\n                        534.8927001953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-34\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        102.327881,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        338.0,\n                        534.8927001953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        80.327881,\n                        246.1073,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        328.672119140625,\n                        759.0,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-35\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-27\",\n                        1\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-1\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-27\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-31\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-27\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-33\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-1\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-34\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                446.672119,\n                682.8927,\n                97.0,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"globalpatchername\": \"\",\n                \"tags\": \"\"\n              },\n              \"text\": \"p BlockNegative\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-36\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  59.0,\n                  103.0,\n                  640.0,\n                  480.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-31\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        86.327881,\n                        135.1073,\n                        86.0,\n                        22.0\n                      ],\n                      \"text\": \"maximum~ 20\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-29\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        86.327881,\n                        100.0,\n                        40.0,\n                        22.0\n                      ],\n                      \"text\": \"*~ -1.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-27\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"signal\",\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        182.1073,\n                        46.0,\n                        22.0\n                      ],\n                      \"text\": \"cross~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-33\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        50.0,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        301.672119140625,\n                        534.8927001953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-34\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        86.327881,\n                        40.0,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        338.0,\n                        534.8927001953125,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        77.0,\n                        264.1073,\n                        30.0,\n                        30.0\n                      ],\n                      \"presentation\": 1,\n                      \"presentation_rect\": [\n                        328.672119140625,\n                        759.0,\n                        30.0,\n                        30.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-35\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-27\",\n                        1\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-29\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-27\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-31\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-27\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-33\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-29\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-34\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                301.672119,\n                682.8927,\n                97.0,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"globalpatchername\": \"\",\n                \"tags\": \"\"\n              },\n              \"text\": \"p BlockNegative\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-25\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 4,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"dsp.gen\",\n                \"rect\": [\n                  84.0,\n                  128.0,\n                  600.0,\n                  450.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-12\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 3,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        123.0,\n                        157.0,\n                        40.0,\n                        22.0\n                      ],\n                      \"text\": \"mix\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-11\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 3,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        58.0,\n                        157.0,\n                        40.0,\n                        22.0\n                      ],\n                      \"text\": \"mix\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-9\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        399.0,\n                        105.0,\n                        123.0,\n                        22.0\n                      ],\n                      \"text\": \"in 4 @min 0 @max 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        58.0,\n                        30.0,\n                        30.0,\n                        22.0\n                      ],\n                      \"text\": \"in 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-7\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        123.0,\n                        207.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-6\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        308.0,\n                        87.0,\n                        51.0,\n                        22.0\n                      ],\n                      \"text\": \"dcblock\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        189.0,\n                        87.0,\n                        51.0,\n                        22.0\n                      ],\n                      \"text\": \"dcblock\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-1\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        189.0,\n                        30.0,\n                        30.0,\n                        22.0\n                      ],\n                      \"text\": \"in 2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-2\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        308.0,\n                        30.0,\n                        30.0,\n                        22.0\n                      ],\n                      \"text\": \"in 3\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        58.0,\n                        207.0,\n                        37.0,\n                        22.0\n                      ],\n                      \"text\": \"out 1\"\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-11\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-12\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-2\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-11\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-12\",\n                        0\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-11\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-12\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-6\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-11\",\n                        2\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-9\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-12\",\n                        2\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-9\",\n                        0\n                      ]\n                    }\n                  }\n                ],\n                \"editing_bgcolor\": [\n                  0.9,\n                  0.9,\n                  0.9,\n                  1.0\n                ]\n              },\n              \"patching_rect\": [\n                275.922119,\n                765.0,\n                164.0,\n                20.0\n              ],\n              \"text\": \"gen~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                69.455986,\n                166.662552,\n                331.0,\n                18.0\n              ],\n              \"text\": \"## Frequency shifter with normal and inverted outputs.  ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-59\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                420.45282,\n                877.992676,\n                50.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                176.31781005859375,\n                97.0,\n                50.0,\n                17.0\n              ],\n              \"text\": \"Neg Shift\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"Signal output.  If the frequency shift value is positive, this includes the negatively shifted components; if the frequency shift value is negative, this includes the positively shifted components.\",\n              \"id\": \"obj-58\",\n              \"index\": 2,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                390.70282,\n                877.992676,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-56\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                390.422119,\n                839.272705,\n                80.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-32\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  75.0,\n                  119.0,\n                  819.0,\n                  686.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 12.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Arial\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  15.0,\n                  15.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-59\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        254.0,\n                        326.29718,\n                        43.0,\n                        22.0\n                      ],\n                      \"text\": \"set $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-56\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        254.0,\n                        290.0,\n                        47.0,\n                        22.0\n                      ],\n                      \"text\": \"mtof 0.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-55\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"float\"\n                      ],\n                      \"patching_rect\": [\n                        362.54126,\n                        290.0,\n                        35.0,\n                        22.0\n                      ],\n                      \"text\": \"- 60.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-23\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        362.54126,\n                        326.29718,\n                        43.0,\n                        22.0\n                      ],\n                      \"text\": \"set $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-19\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        720.77063,\n                        290.0,\n                        41.0,\n                        22.0\n                      ],\n                      \"text\": \"$1 40\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"signal\",\n                        \"bang\"\n                      ],\n                      \"patching_rect\": [\n                        720.77063,\n                        326.29718,\n                        36.0,\n                        22.0\n                      ],\n                      \"text\": \"line~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-49\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        362.54126,\n                        233.0,\n                        47.0,\n                        22.0\n                      ],\n                      \"text\": \"ftom 0.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-54\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"float\"\n                      ],\n                      \"patching_rect\": [\n                        254.0,\n                        233.0,\n                        38.0,\n                        22.0\n                      ],\n                      \"text\": \"+ 0.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"toggle\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        539.0,\n                        156.0,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-6\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        539.0,\n                        326.29718,\n                        57.0,\n                        20.0\n                      ],\n                      \"text\": \"hidden $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"patching_rect\": [\n                        187.0,\n                        156.0,\n                        32.5,\n                        20.0\n                      ],\n                      \"text\": \"== 0\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-9\",\n                      \"maxclass\": \"toggle\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        187.0,\n                        242.0,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-1\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        187.0,\n                        326.29718,\n                        57.0,\n                        20.0\n                      ],\n                      \"text\": \"hidden $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-8\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"patching_rect\": [\n                        459.0,\n                        156.0,\n                        32.5,\n                        20.0\n                      ],\n                      \"text\": \"== 0\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-29\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        483.0,\n                        326.29718,\n                        53.0,\n                        20.0\n                      ],\n                      \"text\": \"active $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-30\",\n                      \"maxclass\": \"button\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        459.0,\n                        326.29718,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-33\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"bang\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        459.0,\n                        233.0,\n                        47.0,\n                        20.0\n                      ],\n                      \"text\": \"select 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-36\",\n                      \"maxclass\": \"toggle\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        459.0,\n                        201.0,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-24\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        131.0,\n                        326.29718,\n                        53.0,\n                        20.0\n                      ],\n                      \"text\": \"active $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-21\",\n                      \"maxclass\": \"button\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        107.0,\n                        326.29718,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-10\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"bang\",\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        107.0,\n                        250.0,\n                        47.0,\n                        20.0\n                      ],\n                      \"text\": \"select 1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"toggle\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        107.0,\n                        156.0,\n                        18.0,\n                        18.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-25\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        539.0,\n                        63.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-26\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        254.0,\n                        193.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-27\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        362.54126,\n                        193.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-28\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        107.0,\n                        431.297241,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-31\",\n                      \"index\": 2,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        459.0,\n                        431.297241,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-32\",\n                      \"index\": 3,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        720.77063,\n                        431.297241,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-28\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        196.5,\n                        386.297211,\n                        116.5,\n                        386.297211\n                      ],\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-21\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-10\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-10\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-24\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        116.5,\n                        249.64859,\n                        140.5,\n                        249.64859\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-19\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-28\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        116.5,\n                        387.297211,\n                        116.5,\n                        387.297211\n                      ],\n                      \"source\": [\n                        \"obj-21\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-28\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        372.04126,\n                        387.297211,\n                        116.5,\n                        387.297211\n                      ],\n                      \"source\": [\n                        \"obj-23\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-28\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        140.5,\n                        386.297211,\n                        116.5,\n                        386.297211\n                      ],\n                      \"source\": [\n                        \"obj-24\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        548.5,\n                        121.5,\n                        116.5,\n                        121.5\n                      ],\n                      \"order\": 3,\n                      \"source\": [\n                        \"obj-25\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        548.5,\n                        121.5,\n                        196.5,\n                        121.5\n                      ],\n                      \"order\": 2,\n                      \"source\": [\n                        \"obj-25\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        548.5,\n                        121.5,\n                        548.5,\n                        121.5\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-25\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-8\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        548.5,\n                        121.5,\n                        468.5,\n                        121.5\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-25\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-54\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-26\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-49\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-27\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        492.5,\n                        386.297211,\n                        468.5,\n                        386.297211\n                      ],\n                      \"source\": [\n                        \"obj-29\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-32\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        468.5,\n                        387.297211,\n                        468.5,\n                        387.297211\n                      ],\n                      \"source\": [\n                        \"obj-30\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-30\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-33\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-29\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        468.5,\n                        272.14859,\n                        492.5,\n                        272.14859\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-36\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-33\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-36\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-4\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-19\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        372.04126,\n                        279.558289,\n                        730.27063,\n                        279.558289\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-49\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-55\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-49\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-19\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        263.5,\n                        279.558289,\n                        730.27063,\n                        279.558289\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-54\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-56\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-54\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-23\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-55\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-59\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-56\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        263.5,\n                        387.297211,\n                        468.5,\n                        387.297211\n                      ],\n                      \"source\": [\n                        \"obj-59\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-31\",\n                        0\n                      ],\n                      \"midpoints\": [\n                        548.5,\n                        386.297211,\n                        468.5,\n                        386.297211\n                      ],\n                      \"source\": [\n                        \"obj-6\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-36\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-8\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-1\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-9\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                154.672119,\n                318.485474,\n                287.0,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"globalpatchername\": \"\",\n                \"tags\": \"\"\n              },\n              \"text\": \"p freqmode\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-112\",\n              \"linecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.38\n              ],\n              \"maxclass\": \"live.line\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                51.0,\n                121.711639,\n                5.0,\n                100.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                37.84733581542969,\n                65.976318359375,\n                32.796424865722656,\n                5.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-111\",\n              \"linecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.38\n              ],\n              \"maxclass\": \"live.line\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                35.0,\n                121.711639,\n                5.0,\n                100.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                69.53726959228516,\n                56.033172607421875,\n                5.0,\n                9.97680377960205\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-110\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                647.477295,\n                373.175171,\n                24.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                97.77592468261719,\n                57.976318359375,\n                24.0,\n                17.0\n              ],\n              \"text\": \"Lin\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-108\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                629.40625,\n                114.917053,\n                23.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                97.77592468261719,\n                40.6690788269043,\n                23.0,\n                17.0\n              ],\n              \"text\": \"CV\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"hint\": \"Depth of linear input\",\n              \"id\": \"obj-107\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                680.977295,\n                373.175171,\n                70.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                123.0,\n                57.976318359375,\n                46.82677459716797,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 3.0,\n                  \"parameter_longname\": \"Linear\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 5000.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"Linear\"\n                }\n              },\n              \"textcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"varname\": \"Linear\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"hint\": \"Attenuator for CV expo freq modulation input\",\n              \"id\": \"obj-129\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                666.40625,\n                114.917053,\n                70.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                123.0,\n                40.6690788269043,\n                46.82677459716797,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_longname\": \"CV2\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"CV2\"\n                }\n              },\n              \"textcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"varname\": \"CV2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-87\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                559.571289,\n                360.550903,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                129.31781005859375,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Linear\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 1\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-75\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                559.571289,\n                448.390137,\n                140.406006,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"Linear frequency input.  The range of this input is controlled by the \\\"Lin\\\" control, specified in Hz.  This input is added to the existing Pitch/Freq value and CV input.\",\n              \"hint\": \"Linear frequency input.  The range of this input is controlled by the \\\"Lin\\\" control, specified in Hz.  This input is added to the existing Pitch/Freq value and CV input.\",\n              \"id\": \"obj-77\",\n              \"index\": 3,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                559.571289,\n                385.38855,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-84\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                680.977295,\n                412.550903,\n                31.0,\n                20.0\n              ],\n              \"text\": \"* 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-73\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                422.672119,\n                558.90332,\n                45.561401,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-44\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                422.672119,\n                428.485474,\n                79.327881,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"bordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"id\": \"obj-51\",\n              \"maxclass\": \"live.dial\",\n              \"needlecolor\": [\n                0.752941,\n                0.784314,\n                0.839216,\n                1.0\n              ],\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                288.672119,\n                256.075195,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                4.0,\n                43.221527099609375,\n                44.0,\n                48.0\n              ],\n              \"prototypename\": \"freq\",\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3,\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_longname\": \"Freq\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 10000.0,\n                  \"parameter_initial\": [\n                    8\n                  ],\n                  \"parameter_speedlim\": 0.0,\n                  \"parameter_shortname\": \"Freq\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Freq\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.917647,\n                0.94902,\n                0.054902,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextoncolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                1.0\n              ],\n              \"annotation\": \"\",\n              \"automation\": \"Freq\",\n              \"automationon\": \"Pitch\",\n              \"bgcolor\": [\n                0.6,\n                0.6,\n                0.6,\n                0.0\n              ],\n              \"bordercolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"focusbordercolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"hint\": \"Switches between pitch and Hz frequency modes.\",\n              \"id\": \"obj-45\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                422.672119,\n                278.075195,\n                35.0,\n                19.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                51.0,\n                41.221527099609375,\n                38.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"Freq\",\n                    \"Pitch\"\n                  ],\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"FreqMode\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    1\n                  ],\n                  \"parameter_speedlim\": 0.0,\n                  \"parameter_shortname\": \"FreqMode\"\n                }\n              },\n              \"text\": \"Freq\",\n              \"textcolor\": [\n                0.556863,\n                0.556863,\n                0.556863,\n                1.0\n              ],\n              \"texton\": \"Pitch\",\n              \"varname\": \"FreqMode\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"bordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.2\n              ],\n              \"hidden\": 1,\n              \"id\": \"obj-46\",\n              \"maxclass\": \"live.dial\",\n              \"needlecolor\": [\n                0.752941,\n                0.784314,\n                0.839216,\n                1.0\n              ],\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                154.672119,\n                256.075195,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                4.0,\n                43.221527099609375,\n                44.0,\n                48.0\n              ],\n              \"prototypename\": \"freq\",\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 8,\n                  \"parameter_linknames\": 1,\n                  \"parameter_longname\": \"Offset\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 120.0,\n                  \"parameter_initial\": [\n                    60\n                  ],\n                  \"parameter_shortname\": \"Offset\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Offset\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-102\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                259.672119,\n                542.788574,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                1.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-103\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                438.0,\n                188.549316,\n                23.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                66.87060546875,\n                0.0,\n                23.0,\n                17.0\n              ],\n              \"text\": \"CV\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 1\n            }\n          },\n          {\n            \"box\": {\n              \"annotation\": \"\",\n              \"comment\": \"Input\",\n              \"hint\": \"Input\",\n              \"id\": \"obj-41\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                301.672119,\n                542.788574,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-52\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                483.0,\n                237.550903,\n                140.406006,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"CV: pitch modulation input. This input has a built-in attenuator (CV). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV input.\",\n              \"hint\": \"CV: pitch modulation input. This input has a built-in attenuator (CV). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV input.\",\n              \"id\": \"obj-65\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                483.0,\n                188.549316,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-66\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                604.40625,\n                154.953247,\n                45.0,\n                21.0\n              ],\n              \"text\": \"sig~ 2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-67\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                604.40625,\n                197.894531,\n                81.0,\n                21.0\n              ],\n              \"text\": \"pow~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-68\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                666.40625,\n                163.71167,\n                37.0,\n                20.0\n              ],\n              \"text\": \"* 0.01\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-69\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                483.0,\n                355.550903,\n                38.0,\n                20.0\n              ],\n              \"text\": \"-~ 60\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-91\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                301.672119,\n                636.782715,\n                164.0,\n                20.0\n              ],\n              \"text\": \"poly~ bp.freqshift.poly 1 up 2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-81\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                483.0,\n                326.21167,\n                39.0,\n                20.0\n              ],\n              \"text\": \"*~ 12\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-82\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                483.0,\n                288.21167,\n                35.0,\n                20.0\n              ],\n              \"text\": \"+~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-2\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                245.422119,\n                640.312744,\n                29.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-1\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                245.422119,\n                835.272705,\n                80.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"automation\": \"off\",\n              \"automationon\": \"on\",\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-53\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                245.422119,\n                594.8927,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                174.31781005859375,\n                19.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"off\",\n                    \"on\"\n                  ],\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"Mute\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"Mute\"\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"Mute\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-24\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                282.672119,\n                877.992676,\n                50.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                50.0,\n                17.0\n              ],\n              \"text\": \"Pos Shift\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-57\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                69.455986,\n                137.788605,\n                108.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                108.0,\n                17.0\n              ],\n              \"text\": \"FREQUENCY SHIFTER\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-26\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                69.455986,\n                226.211639,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"CV2\": [\n                  0.0\n                ],\n                \"CV2[1]\": [\n                  100.0\n                ],\n                \"DryWetMix\": [\n                  50.0\n                ],\n                \"Freq\": [\n                  100.0\n                ],\n                \"FreqMode\": [\n                  0.0\n                ],\n                \"Linear\": [\n                  0.0\n                ],\n                \"Mute\": [\n                  0.0\n                ],\n                \"Offset\": [\n                  0.0\n                ],\n                \"ThruZero\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u062000499\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-30\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                422.672119,\n                468.782715,\n                41.0,\n                20.0\n              ],\n              \"text\": \"mtof~\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"Signal output.  If the frequency shift value is positive, this includes the positively shifted components; if the frequency shift value is negative, this includes the negatively shifted components.\",\n              \"id\": \"obj-50\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                245.422119,\n                877.992676,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                69.455986,\n                121.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                115.657448,\n                121.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                161.858902,\n                121.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                -0.5,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-50\",\n                0\n              ],\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-31\",\n                1\n              ],\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-84\",\n                0\n              ],\n              \"source\": [\n                \"obj-107\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-68\",\n                0\n              ],\n              \"source\": [\n                \"obj-129\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-1\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-56\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-1\",\n                1\n              ],\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-56\",\n                1\n              ],\n              \"source\": [\n                \"obj-25\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-31\",\n                2\n              ],\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                0\n              ],\n              \"source\": [\n                \"obj-30\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                3\n              ],\n              \"source\": [\n                \"obj-31\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-44\",\n                0\n              ],\n              \"source\": [\n                \"obj-32\",\n                2\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-46\",\n                0\n              ],\n              \"midpoints\": [\n                164.172119,\n                350.485535,\n                133.172119,\n                350.485535,\n                133.172119,\n                244.075256,\n                164.172119,\n                244.075256\n              ],\n              \"source\": [\n                \"obj-32\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-51\",\n                0\n              ],\n              \"midpoints\": [\n                298.172119,\n                362.485535,\n                116.422119,\n                362.485535,\n                116.422119,\n                228.075256,\n                298.172119,\n                228.075256\n              ],\n              \"source\": [\n                \"obj-32\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                1\n              ],\n              \"source\": [\n                \"obj-36\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                2\n              ],\n              \"source\": [\n                \"obj-37\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-37\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-91\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-1\",\n                2\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                0\n              ],\n              \"order\": 3,\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-56\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-91\",\n                0\n              ],\n              \"order\": 2,\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-30\",\n                0\n              ],\n              \"source\": [\n                \"obj-44\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                2\n              ],\n              \"source\": [\n                \"obj-45\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                0\n              ],\n              \"source\": [\n                \"obj-46\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-31\",\n                0\n              ],\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                1\n              ],\n              \"source\": [\n                \"obj-51\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-82\",\n                0\n              ],\n              \"source\": [\n                \"obj-52\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-2\",\n                0\n              ],\n              \"source\": [\n                \"obj-53\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-58\",\n                0\n              ],\n              \"source\": [\n                \"obj-56\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-52\",\n                0\n              ],\n              \"source\": [\n                \"obj-65\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.501961,\n                0.501961,\n                0.501961,\n                0.901961\n              ],\n              \"destination\": [\n                \"obj-67\",\n                0\n              ],\n              \"source\": [\n                \"obj-66\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-52\",\n                1\n              ],\n              \"source\": [\n                \"obj-67\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-67\",\n                1\n              ],\n              \"source\": [\n                \"obj-68\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-44\",\n                1\n              ],\n              \"source\": [\n                \"obj-69\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-36\",\n                1\n              ],\n              \"order\": 2,\n              \"source\": [\n                \"obj-73\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-37\",\n                1\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-73\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-91\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-73\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-73\",\n                1\n              ],\n              \"source\": [\n                \"obj-75\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-75\",\n                0\n              ],\n              \"source\": [\n                \"obj-77\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-69\",\n                0\n              ],\n              \"source\": [\n                \"obj-81\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-81\",\n                0\n              ],\n              \"source\": [\n                \"obj-82\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-75\",\n                1\n              ],\n              \"source\": [\n                \"obj-84\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-36\",\n                0\n              ],\n              \"source\": [\n                \"obj-91\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-37\",\n                0\n              ],\n              \"source\": [\n                \"obj-91\",\n                1\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 4,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | in 3: CV (unused) | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1435\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        200,\n        1435\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        1128,\n        611,\n        230,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        655,\n        305,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 BEAP Retuner\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        18,\n        661,\n        289,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1209,\n        1214\n      ],\n      \"presentation\": [\n        18,\n        661,\n        289,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1209,\n        1244\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1209,\n        1274\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 bp.Retuner \\u2014 BEAP module around retune~\",\n      \"pos\": [\n        866,\n        1214\n      ],\n      \"size\": [\n        333,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        866,\n        1244\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        866,\n        1284\n      ],\n      \"size\": [\n        289,\n        116\n      ],\n      \"presentation\": [\n        18,\n        685,\n        289,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_RETUNER\",\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          34.0,\n          357.0,\n          669.0,\n          485.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 2,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-14\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                202.0,\n                582.422485,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-17\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                202.0,\n                627.422485,\n                129.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-20\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                202.0,\n                675.422485,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-55\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                202.0,\n                540.922485,\n                43.0,\n                19.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                229.5,\n                18.0,\n                52.0,\n                17.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_defer\": 1,\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"power\",\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"power\"\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"power[1]\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-18\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 5,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 8,\n                  \"minor\": 0,\n                  \"revision\": 0,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  84.0,\n                  128.0,\n                  423.0,\n                  273.0\n                ],\n                \"bglocked\": 0,\n                \"openinpresentation\": 0,\n                \"default_fontsize\": 10.0,\n                \"default_fontface\": 0,\n                \"default_fontname\": \"Ableton Sans Bold Regular\",\n                \"gridonopen\": 1,\n                \"gridsize\": [\n                  8.0,\n                  8.0\n                ],\n                \"gridsnaponopen\": 1,\n                \"objectsnaponopen\": 1,\n                \"statusbarvisible\": 2,\n                \"toolbarvisible\": 1,\n                \"lefttoolbarpinned\": 0,\n                \"toptoolbarpinned\": 0,\n                \"righttoolbarpinned\": 0,\n                \"bottomtoolbarpinned\": 0,\n                \"toolbars_unpinned_last_save\": 0,\n                \"tallnewobj\": 0,\n                \"boxanimatetime\": 200,\n                \"enablehscroll\": 1,\n                \"enablevscroll\": 1,\n                \"devicewidth\": 0.0,\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"tags\": \"\",\n                \"style\": \"\",\n                \"subpatcher_template\": \"\",\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 11.0,\n                      \"id\": \"obj-4\",\n                      \"linecount\": 2,\n                      \"maxclass\": \"comment\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        256.0,\n                        32.0,\n                        72.0,\n                        31.0\n                      ],\n                      \"text\": \"Retune~ parameters\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-58\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        144.0,\n                        104.0,\n                        124.0,\n                        20.0\n                      ],\n                      \"text\": \"correction_threshold $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-56\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        176.0,\n                        128.0,\n                        113.0,\n                        20.0\n                      ],\n                      \"text\": \"correction_bypass $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-55\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        112.0,\n                        80.0,\n                        115.0,\n                        20.0\n                      ],\n                      \"text\": \"correction_amount $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        208.0,\n                        152.0,\n                        176.0,\n                        20.0\n                      ],\n                      \"text\": \"correction_ambience_threshold $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontface\": 0,\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-9\",\n                      \"items\": [\n                        \"basic\",\n                        \",\",\n                        \"good\",\n                        \",\",\n                        \"better\",\n                        \",\",\n                        \"best\"\n                      ],\n                      \"maxclass\": \"umenu\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 3,\n                      \"outlettype\": [\n                        \"int\",\n                        \"\",\n                        \"\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        32.0,\n                        80.0,\n                        67.0,\n                        20.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Ableton Sans Bold Regular\",\n                      \"fontsize\": 10.0,\n                      \"id\": \"obj-76\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        56.0,\n                        104.0,\n                        57.0,\n                        20.0\n                      ],\n                      \"text\": \"quality $1\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        32.0,\n                        32.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-36\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        112.0,\n                        32.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-37\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        144.0,\n                        32.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-38\",\n                      \"index\": 4,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        176.0,\n                        32.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-39\",\n                      \"index\": 5,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        208.0,\n                        32.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-40\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        112.0,\n                        208.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-40\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-9\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-35\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-55\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-36\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-58\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-37\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-56\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-38\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-39\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-40\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-55\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-40\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-56\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-40\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-58\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-40\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-76\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-76\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-9\",\n                        1\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                28.0,\n                399.847168,\n                83.0,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"description\": \"\",\n                \"digest\": \"\",\n                \"fontname\": \"Ableton Sans Bold Regular\",\n                \"fontsize\": 10.0,\n                \"globalpatchername\": \"\",\n                \"tags\": \"\"\n              },\n              \"text\": \"p Settings\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-34\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                124.0,\n                351.847168,\n                47.0,\n                16.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                188.0,\n                56.5,\n                47.0,\n                16.0\n              ],\n              \"text\": \"Sibilan.\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701960980892181\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"annotation\": \"Sets the automatic bypass when the signal contains too much noise or background ambience (reverb). A value between 0.2 and 0.4 is usually a good starting point \",\n              \"appearance\": 1,\n              \"id\": \"obj-27\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                92.0,\n                375.847168,\n                48.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                234.0,\n                73.0,\n                48.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_linknames\": 1,\n                  \"parameter_units\": \"ct\",\n                  \"parameter_mmin\": -10.0,\n                  \"parameter_longname\": \"AmbienceThreshold\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 10.0,\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_shortname\": \"Threshold\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701961\n              ],\n              \"varname\": \"AmbienceThreshold\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-23\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                140.0,\n                375.847168,\n                51.0,\n                16.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                188.0,\n                73.0,\n                51.0,\n                16.0\n              ],\n              \"text\": \"Ambien.\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701960980892181\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"annotation\": \"Defines the sibilance threshold at which the original signal is passed through unaffected. This bypass switch is required to make sure that sibilancies in vocal recordings don\\u2019t sound too processed. A default setting of 100 is a good tradeoff.\",\n              \"appearance\": 1,\n              \"id\": \"obj-21\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                76.0,\n                351.847168,\n                48.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                234.0,\n                56.5,\n                48.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_linknames\": 1,\n                  \"parameter_units\": \"ct\",\n                  \"parameter_longname\": \"SibilanceThreshold\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 500.0,\n                  \"parameter_initial\": [\n                    100\n                  ],\n                  \"parameter_shortname\": \"Sibilance\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701961\n              ],\n              \"varname\": \"SibilanceThreshold\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                108.0,\n                327.847168,\n                50.0,\n                16.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                188.0,\n                40.5,\n                50.0,\n                16.0\n              ],\n              \"text\": \"Correct.\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701960980892181\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"annotation\": \"Defines the threshold at which the correction takes effect. For most applications this should be set to 0 as this will correct notes that are more that 0 cent off (ideal pitch). A setting of 10 will allow a pitch deviation of 10 cents in either direction before the correction takes effect.\",\n              \"appearance\": 1,\n              \"id\": \"obj-24\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                60.0,\n                327.847168,\n                48.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                234.0,\n                40.5,\n                48.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 9,\n                  \"parameter_linknames\": 1,\n                  \"parameter_units\": \"ct\",\n                  \"parameter_longname\": \"CorrectionThreshold\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 99.0,\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_shortname\": \"Threshold\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701961\n              ],\n              \"varname\": \"CorrectionThreshold\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-25\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                92.0,\n                287.847168,\n                30.0,\n                16.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                98.0,\n                56.5,\n                30.0,\n                16.0\n              ],\n              \"text\": \"Amt\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701960980892181\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"annotation\": \"Defines the amount of the correction applied. 0 means no correction, 100 means full correction.\",\n              \"appearance\": 1,\n              \"id\": \"obj-26\",\n              \"maxclass\": \"live.numbox\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                44.0,\n                287.847168,\n                48.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                138.0,\n                56.5,\n                48.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_linknames\": 1,\n                  \"parameter_longname\": \"CorrectionAmount\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_initial\": [\n                    100\n                  ],\n                  \"parameter_shortname\": \"Amount\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701961\n              ],\n              \"varname\": \"CorrectionAmount\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-29\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                84.0,\n                247.847168,\n                45.0,\n                16.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                98.0,\n                40.5,\n                45.0,\n                16.0\n              ],\n              \"text\": \"Quality\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701960980892181\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"annotation\": \"Sets a quality factor to the transposition engine. As quality increases, CPU may increase accordingly.\",\n              \"id\": \"obj-74\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                28.0,\n                247.847168,\n                50.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                138.0,\n                40.5,\n                48.0,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"basic\",\n                    \"good\",\n                    \"better\",\n                    \"best\"\n                  ],\n                  \"parameter_type\": 2,\n                  \"parameter_linknames\": 1,\n                  \"parameter_longname\": \"Quality\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"Quality\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.701961\n              ],\n              \"varname\": \"Quality\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-12\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                145.0,\n                683.422485,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                97.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                462.5,\n                118.422485,\n                28.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                256.5,\n                0.0,\n                28.0,\n                17.0\n              ],\n              \"text\": \"CV2\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-10\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                298.0,\n                150.924194,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                126.5,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"1v/oct\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 1\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-1\",\n              \"linecount\": 2,\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                40.25,\n                94.036255,\n                172.0,\n                30.0\n              ],\n              \"text\": \"## Tune any monophonic input to a specific pitch ##\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                40.25,\n                133.519485,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"AmbienceThreshold\": [\n                  0.0\n                ],\n                \"CV2\": [\n                  0.0\n                ],\n                \"CorrectionAmount\": [\n                  100.0\n                ],\n                \"CorrectionThreshold\": [\n                  0.0\n                ],\n                \"Offset\": [\n                  0.0\n                ],\n                \"Quality\": [\n                  0.0\n                ],\n                \"SibilanceThreshold\": [\n                  100.0\n                ],\n                \"power[1]\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u041001333\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-7\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                208.0,\n                396.847168,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                40.25,\n                69.019485,\n                54.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                54.0,\n                17.0\n              ],\n              \"text\": \"RETUNER\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-15\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                257.0,\n                396.847168,\n                30.0,\n                30.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-19\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                683.406372,\n                31.241577,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                53.75,\n                42.5,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_units\": \"ST\",\n                  \"parameter_mmin\": -100.0,\n                  \"parameter_longname\": \"CV2\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_shortname\": \"CV2\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"CV2\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-28\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                421.0,\n                231.847168,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                7.0,\n                42.5,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 9,\n                  \"parameter_units\": \"ST\",\n                  \"parameter_mmin\": -36.0,\n                  \"parameter_longname\": \"Offset\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 36.0,\n                  \"parameter_initial\": [\n                    0\n                  ],\n                  \"parameter_shortname\": \"Offset\"\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Offset\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-33\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                294.633911,\n                98.0,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"annotation\": \"\",\n              \"comment\": \"CV1: 1v/oct pitch modulation input. This input is typically used for keyboard tracking since there is no attenuator.\",\n              \"hint\": \"\",\n              \"id\": \"obj-41\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                150.924194,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                500.0,\n                179.845459,\n                140.406006,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"CV2: pitch modulation input. This input has a built-in attenuator (CV2). At 100%, this will track 1v/oct. At 0%, no modulation will occur, even if something is connected to the CV2 input.\",\n              \"hint\": \"\",\n              \"id\": \"obj-65\",\n              \"index\": 3,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                500.0,\n                118.422485,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-66\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                621.406372,\n                94.036255,\n                45.0,\n                21.0\n              ],\n              \"text\": \"sig~ 2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-67\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                621.406372,\n                136.977417,\n                81.0,\n                21.0\n              ],\n              \"text\": \"pow~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-68\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                683.406372,\n                94.036255,\n                37.0,\n                20.0\n              ],\n              \"text\": \"* 0.01\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-69\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                500.0,\n                294.633911,\n                38.0,\n                20.0\n              ],\n              \"text\": \"-~ 60\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-91\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                354.633911,\n                177.0,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-81\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                500.0,\n                261.633911,\n                39.0,\n                20.0\n              ],\n              \"text\": \"*~ 12\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-39\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                500.0,\n                231.847168,\n                35.0,\n                20.0\n              ],\n              \"text\": \"+~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-78\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                244.347168,\n                39.0,\n                20.0\n              ],\n              \"text\": \"*~ 12\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-76\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                201.847168,\n                35.0,\n                20.0\n              ],\n              \"text\": \"+~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                342.0,\n                457.422485,\n                41.0,\n                20.0\n              ],\n              \"text\": \"mtof~\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-4\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                257.0,\n                552.422485,\n                32.0,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-3\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                257.0,\n                457.422485,\n                42.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-2\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 5,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\",\n                \"signal\",\n                \"signal\",\n                \"list\"\n              ],\n              \"patching_rect\": [\n                257.0,\n                504.422485,\n                189.0,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"correction_ambience_threshold\": [\n                  0.0\n                ],\n                \"notebase\": 0,\n                \"notelist\": [\n                  100,\n                  200,\n                  300,\n                  400,\n                  500,\n                  600,\n                  700,\n                  800,\n                  900,\n                  1000,\n                  1100\n                ],\n                \"pitchdetection\": 0,\n                \"quality\": \"basic\",\n                \"reportlatency\": 0,\n                \"retune\": 1,\n                \"use_16bit\": [\n                  0\n                ],\n                \"windowsize\": [\n                  64\n                ]\n              },\n              \"text\": \"retune~\"\n            }\n          },\n          {\n            \"box\": {\n              \"background\": 1,\n              \"bgmode\": 0,\n              \"border\": 0,\n              \"clickthrough\": 0,\n              \"enablehscroll\": 0,\n              \"enablevscroll\": 0,\n              \"id\": \"obj-9\",\n              \"lockeddragscroll\": 0,\n              \"maxclass\": \"bpatcher\",\n              \"name\": \"background_sm.maxpat\",\n              \"numinlets\": 0,\n              \"numoutlets\": 0,\n              \"offset\": [\n                0.0,\n                0.0\n              ],\n              \"patching_rect\": [\n                40.25,\n                49.038956,\n                239.0,\n                10.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                359.0,\n                132.0\n              ],\n              \"viewvisibility\": 1\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                0\n              ],\n              \"source\": [\n                \"obj-14\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                2\n              ],\n              \"midpoints\": [\n                266.5,\n                446.634827,\n                321.5,\n                446.634827\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-15\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-3\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-15\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-20\",\n                0\n              ],\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-2\",\n                0\n              ],\n              \"source\": [\n                \"obj-18\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-68\",\n                0\n              ],\n              \"source\": [\n                \"obj-19\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"source\": [\n                \"obj-2\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                3\n              ],\n              \"source\": [\n                \"obj-21\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                2\n              ],\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                1\n              ],\n              \"source\": [\n                \"obj-26\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                4\n              ],\n              \"source\": [\n                \"obj-27\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-33\",\n                1\n              ],\n              \"source\": [\n                \"obj-28\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-2\",\n                0\n              ],\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-91\",\n                0\n              ],\n              \"source\": [\n                \"obj-33\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-81\",\n                0\n              ],\n              \"source\": [\n                \"obj-39\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                1\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-76\",\n                0\n              ],\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-14\",\n                0\n              ],\n              \"source\": [\n                \"obj-55\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-2\",\n                1\n              ],\n              \"source\": [\n                \"obj-6\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-8\",\n                0\n              ],\n              \"source\": [\n                \"obj-65\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.501961,\n                0.501961,\n                0.501961,\n                0.901961\n              ],\n              \"destination\": [\n                \"obj-67\",\n                0\n              ],\n              \"source\": [\n                \"obj-66\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-8\",\n                1\n              ],\n              \"source\": [\n                \"obj-67\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-67\",\n                1\n              ],\n              \"source\": [\n                \"obj-68\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-91\",\n                1\n              ],\n              \"source\": [\n                \"obj-69\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                0\n              ],\n              \"source\": [\n                \"obj-74\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-78\",\n                0\n              ],\n              \"source\": [\n                \"obj-76\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-33\",\n                0\n              ],\n              \"source\": [\n                \"obj-78\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-39\",\n                0\n              ],\n              \"source\": [\n                \"obj-8\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-69\",\n                0\n              ],\n              \"source\": [\n                \"obj-81\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-6\",\n                0\n              ],\n              \"source\": [\n                \"obj-91\",\n                0\n              ]\n            }\n          }\n        ]\n      },\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        866,\n        1435\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        1095,\n        1435\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        807,\n        289,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        323,\n        655,\n        368,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd AutoRingMod\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        331,\n        661,\n        292,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1995,\n        1214\n      ],\n      \"presentation\": [\n        331,\n        661,\n        292,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1995,\n        1244\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1995,\n        1274\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Max AutoRingMod.amxd \\u2014 ring mod whose frequency follows the input envelope\",\n      \"pos\": [\n        1349,\n        1214\n      ],\n      \"size\": [\n        636,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1349,\n        1244\n      ],\n      \"presentation\": [\n        633,\n        661,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1419,\n        1244\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1499,\n        1244\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max AutoRingMod.amxd\\\"\",\n      \"pos\": [\n        1349,\n        1324\n      ],\n      \"size\": [\n        348,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        331,\n        687,\n        348,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1649,\n        1244\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        1649,\n        1284\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1349,\n        1555\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1489,\n        1555\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        699,\n        655,\n        281,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd Simple Pitch Shifter\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        263,\n        20\n      ],\n      \"presentation\": [\n        707,\n        661,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        611,\n        1655\n      ],\n      \"presentation\": [\n        707,\n        661,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        611,\n        1685\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        611,\n        1715\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd~ Simple Pitch Shifter.amxd \\u2014 pitchshift~ with latency compensation\",\n      \"pos\": [\n        30,\n        1655\n      ],\n      \"size\": [\n        571,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1685\n      ],\n      \"presentation\": [\n        922,\n        661,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Simple Pitch Shifter.amxd\\\"\",\n      \"pos\": [\n        30,\n        1765\n      ],\n      \"size\": [\n        128,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        707,\n        687,\n        128,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_11\",\n        \"presentation_linecount\": 2\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        330,\n        1725\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        170,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        907,\n        458,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd Dual Harmonizer\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        220,\n        20\n      ],\n      \"presentation\": [\n        18,\n        913,\n        382,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1382,\n        1655\n      ],\n      \"presentation\": [\n        18,\n        913,\n        382,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1382,\n        1685\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1382,\n        1715\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd~ Dual Harmonizer.amxd \\u2014 two mono pitch shifters with vibrato and feedback\",\n      \"pos\": [\n        751,\n        1655\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        751,\n        1685\n      ],\n      \"presentation\": [\n        410,\n        913,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        821,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        901,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Dual Harmonizer.amxd\\\"\",\n      \"pos\": [\n        751,\n        1765\n      ],\n      \"size\": [\n        438,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        939,\n        438,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_12\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1051,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        1051,\n        1725\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        751,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        891,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        476,\n        907,\n        398,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd Autotuna\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        484,\n        913,\n        322,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2045,\n        1655\n      ],\n      \"presentation\": [\n        484,\n        913,\n        322,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        2045,\n        1685\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2045,\n        1715\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd~ Autotuna.amxd \\u2014 retune~ auto-tuner with Scala scale files\",\n      \"pos\": [\n        1522,\n        1655\n      ],\n      \"size\": [\n        513,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1522,\n        1685\n      ],\n      \"presentation\": [\n        816,\n        913,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1592,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1672,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Autotuna.amxd\",\n      \"pos\": [\n        1522,\n        1765\n      ],\n      \"size\": [\n        378,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        484,\n        939,\n        378,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_13\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f13_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1822,\n        1685\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        1822,\n        1725\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        1522,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        1662,\n        1996\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1159,\n        626,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 amxd Microtuner\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1165,\n        550,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        666,\n        2096\n      ],\n      \"presentation\": [\n        18,\n        1165,\n        550,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        666,\n        2126\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        666,\n        2156\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 amxd~ Microtuner.amxd \\u2014 table-based microtonal auto-tuner\",\n      \"pos\": [\n        30,\n        2096\n      ],\n      \"size\": [\n        626,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        2126\n      ],\n      \"presentation\": [\n        578,\n        1165,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Microtuner.amxd\",\n      \"pos\": [\n        30,\n        2206\n      ],\n      \"size\": [\n        606,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1191,\n        606,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_14\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f14_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        330,\n        2166\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_L\",\n      \"pos\": [\n        30,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_R\",\n      \"pos\": [\n        170,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        644,\n        1159,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f15_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 amxd Speed Shifter\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        652,\n        1165,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_15\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1408,\n        2096\n      ],\n      \"presentation\": [\n        652,\n        1165,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f15_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"14\",\n      \"pos\": [\n        1408,\n        2126\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1408,\n        2156\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"15 \\u00b7 amxd~ Speed Shifter.amxd \\u2014 two tape loops at different speeds feeding back\",\n      \"pos\": [\n        806,\n        2096\n      ],\n      \"size\": [\n        592,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f15_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        806,\n        2126\n      ],\n      \"presentation\": [\n        866,\n        1165,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        876,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        956,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Speed Shifter.amxd\\\"\",\n      \"pos\": [\n        806,\n        2206\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        652,\n        1191,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_15\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f15_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1106,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1106,\n        2166\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_L\",\n      \"pos\": [\n        806,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f15_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX15_R\",\n      \"pos\": [\n        946,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1411,\n        476,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f16_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 amxd SpectralHarm\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1417,\n        400,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_16\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2034,\n        2096\n      ],\n      \"presentation\": [\n        18,\n        1417,\n        400,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f16_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"15\",\n      \"pos\": [\n        2034,\n        2126\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2034,\n        2156\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"16 \\u00b7 amxd~ Max SpectralHarm.amxd \\u2014 pfft~ spectral harmonizer\",\n      \"pos\": [\n        1548,\n        2096\n      ],\n      \"size\": [\n        476,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f16_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1548,\n        2126\n      ],\n      \"presentation\": [\n        428,\n        1417,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1618,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1698,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max SpectralHarm.amxd\\\"\",\n      \"pos\": [\n        1548,\n        2206\n      ],\n      \"size\": [\n        456,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1443,\n        456,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_16\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f16_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1848,\n        2126\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        1848,\n        2166\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_L\",\n      \"pos\": [\n        1548,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f16_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX16_R\",\n      \"pos\": [\n        1688,\n        2437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1080,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        494,\n        1411,\n        230,\n        237\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f17_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 AU Pitch\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        502,\n        1417,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_17\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1075,\n        2537\n      ],\n      \"presentation\": [\n        502,\n        1417,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f17_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"16\",\n      \"pos\": [\n        1075,\n        2567\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1075,\n        2597\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"17 \\u00b7 vst~ + plug_au AUPitch \\u2014 Apple's pitch shifter\",\n      \"pos\": [\n        30,\n        2537\n      ],\n      \"size\": [\n        1035,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2907\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        502,\n        1573,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_17\"\n      }\n    },\n    \"f17_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f17_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        2595\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f17_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUPitch\",\n      \"pos\": [\n        330,\n        2637\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU17_INIT\",\n      \"pos\": [\n        230,\n        2637\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        2567\n      ],\n      \"presentation\": [\n        502,\n        1441,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU17_INIT\",\n      \"pos\": [\n        230,\n        2677\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST17\",\n      \"pos\": [\n        230,\n        2822\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2747\n      ],\n      \"presentation\": [\n        560,\n        1441,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f17_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        586,\n        1443,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.6458\",\n      \"pos\": [\n        389,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        389,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        502,\n        1469,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f17_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (\\u00b12400 cents)\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        558,\n        1471,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"Pitch $1\",\n      \"pos\": [\n        389,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"1.\",\n      \"pos\": [\n        548,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        548,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        502,\n        1493,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f17_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"blend (\\u2192 wet)\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        558,\n        1495,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Effect Blend\\\" $1\",\n      \"pos\": [\n        548,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        707,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        707,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        502,\n        1517,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f17_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"smoothness\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        93,\n        20\n      ],\n      \"presentation\": [\n        558,\n        1519,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"Smoothness $1\",\n      \"pos\": [\n        707,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p4_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        866,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_p4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        866,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        502,\n        1541,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f17_p4_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"tightness\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        84,\n        20\n      ],\n      \"presentation\": [\n        558,\n        1543,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f17_p4_m\": {\n      \"type\": \"message\",\n      \"text\": \"Tightness $1\",\n      \"pos\": [\n        866,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST17\",\n      \"pos\": [\n        110,\n        2867\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_L\",\n      \"pos\": [\n        30,\n        2957\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX17_R\",\n      \"pos\": [\n        120,\n        2957\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f17_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        502,\n        1601,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1150,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        732,\n        1411,\n        230,\n        189\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f18_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 AU NewPitch\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        740,\n        1417,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_18\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1921,\n        2537\n      ],\n      \"presentation\": [\n        740,\n        1417,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f18_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"17\",\n      \"pos\": [\n        1921,\n        2567\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1921,\n        2597\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"18 \\u00b7 vst~ + plug_au AUNewPitch \\u2014 Apple's newer pitch shifter\",\n      \"pos\": [\n        1215,\n        2537\n      ],\n      \"size\": [\n        696,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1215,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1295,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        1215,\n        2907\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        740,\n        1525,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_18\"\n      }\n    },\n    \"f18_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1415,\n        2567\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f18_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        1415,\n        2595\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f18_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUNewPitch\",\n      \"pos\": [\n        1515,\n        2637\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU18_INIT\",\n      \"pos\": [\n        1415,\n        2637\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1655,\n        2567\n      ],\n      \"presentation\": [\n        740,\n        1441,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU18_INIT\",\n      \"pos\": [\n        1415,\n        2677\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST18\",\n      \"pos\": [\n        1415,\n        2822\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        1415,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        1415,\n        2747\n      ],\n      \"presentation\": [\n        798,\n        1441,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f18_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        824,\n        1443,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        1415,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.6458\",\n      \"pos\": [\n        1567,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1567,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        740,\n        1469,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f18_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (\\u00b12400 cents)\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        796,\n        1471,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Pitch Scale\\\" $1\",\n      \"pos\": [\n        1567,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.1724\",\n      \"pos\": [\n        1719,\n        2717\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1719,\n        2747\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        740,\n        1493,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f18_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"smoothness (3\\u201332)\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        152,\n        20\n      ],\n      \"presentation\": [\n        796,\n        1495,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f18_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Smoothness $1\",\n      \"pos\": [\n        1719,\n        2777\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST18\",\n      \"pos\": [\n        1295,\n        2867\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_L\",\n      \"pos\": [\n        1215,\n        2957\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX18_R\",\n      \"pos\": [\n        1305,\n        2957\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f18_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        740,\n        1553,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201318 are the effects\",\n      \"pos\": [\n        30,\n        3067\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 18 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3177\n      ],\n      \"inlets\": 19,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3227\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_L\",\n      \"pos\": [\n        1200,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_L\",\n      \"pos\": [\n        1290,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_L\",\n      \"pos\": [\n        1380,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_L\",\n      \"pos\": [\n        1470,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_L\",\n      \"pos\": [\n        1560,\n        3127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 18 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3307\n      ],\n      \"inlets\": 19,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3357\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_R\",\n      \"pos\": [\n        1200,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_15\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX15_R\",\n      \"pos\": [\n        1290,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_16\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX16_R\",\n      \"pos\": [\n        1380,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_17\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX17_R\",\n      \"pos\": [\n        1470,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_18\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX18_R\",\n      \"pos\": [\n        1560,\n        3257\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3407\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        3477\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        3477\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        3527\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        3527\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        3527\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        3527\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        3587\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        3667\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3407\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        3437\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        3477\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        3517\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        3557\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        3597\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        3597\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        3637\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        3637\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        3677\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        3677\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1220,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        439\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1290,\n        3737\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        439\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        1230\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        2005,\n        330\n      ],\n      \"text\": \"loadmess embed 1\",\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rM\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_side\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_c0_lm\",\n      0,\n      \"f02_c0\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_side\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rM\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c0_lm\",\n      0,\n      \"f03_c0\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c2\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rM\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c0\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c1\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c2\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_c3\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_c0\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c1\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c2\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_c3\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f06_rwo\",\n      0,\n      \"f06_wet\",\n      0\n    ],\n    [\n      \"f06_wet\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_c0\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c1\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c2\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_c3\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f07_rwo\",\n      0,\n      \"f07_wet\",\n      0\n    ],\n    [\n      \"f07_wet\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_rM\",\n      0,\n      \"f08_bp\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_bp\",\n      0,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_rM\",\n      0,\n      \"f09_bp\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_bp\",\n      0,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_rwo\",\n      0,\n      \"f11_wet\",\n      0\n    ],\n    [\n      \"f11_wet\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_rwo\",\n      0,\n      \"f12_wet\",\n      0\n    ],\n    [\n      \"f12_wet\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_open\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_rwo\",\n      0,\n      \"f13_wet\",\n      0\n    ],\n    [\n      \"f13_wet\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"f14_open\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rL\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rR\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f14_rwo\",\n      0,\n      \"f14_wet\",\n      0\n    ],\n    [\n      \"f14_wet\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sL\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      1,\n      \"f14_sR\",\n      0\n    ],\n    [\n      \"f15_tbtn\",\n      0,\n      \"f15_tsel\",\n      0\n    ],\n    [\n      \"f15_tsel\",\n      0,\n      \"f15_tsend\",\n      0\n    ],\n    [\n      \"f15_open\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rL\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_rR\",\n      0,\n      \"f15_obj\",\n      1\n    ],\n    [\n      \"f15_rwo\",\n      0,\n      \"f15_wet\",\n      0\n    ],\n    [\n      \"f15_wet\",\n      0,\n      \"f15_obj\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      0,\n      \"f15_sL\",\n      0\n    ],\n    [\n      \"f15_obj\",\n      1,\n      \"f15_sR\",\n      0\n    ],\n    [\n      \"f16_tbtn\",\n      0,\n      \"f16_tsel\",\n      0\n    ],\n    [\n      \"f16_tsel\",\n      0,\n      \"f16_tsend\",\n      0\n    ],\n    [\n      \"f16_open\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_rL\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_rR\",\n      0,\n      \"f16_obj\",\n      1\n    ],\n    [\n      \"f16_rwo\",\n      0,\n      \"f16_wet\",\n      0\n    ],\n    [\n      \"f16_wet\",\n      0,\n      \"f16_obj\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      0,\n      \"f16_sL\",\n      0\n    ],\n    [\n      \"f16_obj\",\n      1,\n      \"f16_sR\",\n      0\n    ],\n    [\n      \"f17_tbtn\",\n      0,\n      \"f17_tsel\",\n      0\n    ],\n    [\n      \"f17_tsel\",\n      0,\n      \"f17_tsend\",\n      0\n    ],\n    [\n      \"f17_rL\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_rR\",\n      0,\n      \"f17_obj\",\n      1\n    ],\n    [\n      \"f17_lb\",\n      0,\n      \"f17_t\",\n      0\n    ],\n    [\n      \"f17_t\",\n      1,\n      \"f17_plug\",\n      0\n    ],\n    [\n      \"f17_t\",\n      0,\n      \"f17_sinit\",\n      0\n    ],\n    [\n      \"f17_plug\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_open\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_rinit\",\n      0,\n      \"f17_p0_i\",\n      0\n    ],\n    [\n      \"f17_p0_i\",\n      0,\n      \"f17_p0\",\n      0\n    ],\n    [\n      \"f17_p0\",\n      0,\n      \"f17_p0_m\",\n      0\n    ],\n    [\n      \"f17_p0_m\",\n      0,\n      \"f17_stov\",\n      0\n    ],\n    [\n      \"f17_rinit\",\n      0,\n      \"f17_p1_i\",\n      0\n    ],\n    [\n      \"f17_p1_i\",\n      0,\n      \"f17_p1\",\n      0\n    ],\n    [\n      \"f17_p1\",\n      0,\n      \"f17_p1_m\",\n      0\n    ],\n    [\n      \"f17_p1_m\",\n      0,\n      \"f17_stov\",\n      0\n    ],\n    [\n      \"f17_rinit\",\n      0,\n      \"f17_p2_i\",\n      0\n    ],\n    [\n      \"f17_p2_i\",\n      0,\n      \"f17_p2\",\n      0\n    ],\n    [\n      \"f17_p2\",\n      0,\n      \"f17_p2_m\",\n      0\n    ],\n    [\n      \"f17_p2_m\",\n      0,\n      \"f17_stov\",\n      0\n    ],\n    [\n      \"f17_rinit\",\n      0,\n      \"f17_p3_i\",\n      0\n    ],\n    [\n      \"f17_p3_i\",\n      0,\n      \"f17_p3\",\n      0\n    ],\n    [\n      \"f17_p3\",\n      0,\n      \"f17_p3_m\",\n      0\n    ],\n    [\n      \"f17_p3_m\",\n      0,\n      \"f17_stov\",\n      0\n    ],\n    [\n      \"f17_rinit\",\n      0,\n      \"f17_p4_i\",\n      0\n    ],\n    [\n      \"f17_p4_i\",\n      0,\n      \"f17_p4\",\n      0\n    ],\n    [\n      \"f17_p4\",\n      0,\n      \"f17_p4_m\",\n      0\n    ],\n    [\n      \"f17_p4_m\",\n      0,\n      \"f17_stov\",\n      0\n    ],\n    [\n      \"f17_rtov\",\n      0,\n      \"f17_obj\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      0,\n      \"f17_sL\",\n      0\n    ],\n    [\n      \"f17_obj\",\n      1,\n      \"f17_sR\",\n      0\n    ],\n    [\n      \"f18_tbtn\",\n      0,\n      \"f18_tsel\",\n      0\n    ],\n    [\n      \"f18_tsel\",\n      0,\n      \"f18_tsend\",\n      0\n    ],\n    [\n      \"f18_rL\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_rR\",\n      0,\n      \"f18_obj\",\n      1\n    ],\n    [\n      \"f18_lb\",\n      0,\n      \"f18_t\",\n      0\n    ],\n    [\n      \"f18_t\",\n      1,\n      \"f18_plug\",\n      0\n    ],\n    [\n      \"f18_t\",\n      0,\n      \"f18_sinit\",\n      0\n    ],\n    [\n      \"f18_plug\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_open\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_rinit\",\n      0,\n      \"f18_p0_i\",\n      0\n    ],\n    [\n      \"f18_p0_i\",\n      0,\n      \"f18_p0\",\n      0\n    ],\n    [\n      \"f18_p0\",\n      0,\n      \"f18_p0_m\",\n      0\n    ],\n    [\n      \"f18_p0_m\",\n      0,\n      \"f18_stov\",\n      0\n    ],\n    [\n      \"f18_rinit\",\n      0,\n      \"f18_p1_i\",\n      0\n    ],\n    [\n      \"f18_p1_i\",\n      0,\n      \"f18_p1\",\n      0\n    ],\n    [\n      \"f18_p1\",\n      0,\n      \"f18_p1_m\",\n      0\n    ],\n    [\n      \"f18_p1_m\",\n      0,\n      \"f18_stov\",\n      0\n    ],\n    [\n      \"f18_rinit\",\n      0,\n      \"f18_p2_i\",\n      0\n    ],\n    [\n      \"f18_p2_i\",\n      0,\n      \"f18_p2\",\n      0\n    ],\n    [\n      \"f18_p2\",\n      0,\n      \"f18_p2_m\",\n      0\n    ],\n    [\n      \"f18_p2_m\",\n      0,\n      \"f18_stov\",\n      0\n    ],\n    [\n      \"f18_rtov\",\n      0,\n      \"f18_obj\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      0,\n      \"f18_sL\",\n      0\n    ],\n    [\n      \"f18_obj\",\n      1,\n      \"f18_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"mx_L_14\",\n      0,\n      \"sel_L\",\n      14\n    ],\n    [\n      \"mx_L_15\",\n      0,\n      \"sel_L\",\n      15\n    ],\n    [\n      \"mx_L_16\",\n      0,\n      \"sel_L\",\n      16\n    ],\n    [\n      \"mx_L_17\",\n      0,\n      \"sel_L\",\n      17\n    ],\n    [\n      \"mx_L_18\",\n      0,\n      \"sel_L\",\n      18\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mx_R_14\",\n      0,\n      \"sel_R\",\n      14\n    ],\n    [\n      \"mx_R_15\",\n      0,\n      \"sel_R\",\n      15\n    ],\n    [\n      \"mx_R_16\",\n      0,\n      \"sel_R\",\n      16\n    ],\n    [\n      \"mx_R_17\",\n      0,\n      \"sel_R\",\n      17\n    ],\n    [\n      \"mx_R_18\",\n      0,\n      \"sel_R\",\n      18\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"hl_v8\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-47",
            1
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
            "obj-48",
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
            "obj-54",
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
            "obj-62",
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
            "obj-62",
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
            "obj-62",
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
            "obj-72",
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
            "obj-75",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-77",
            1
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
            "obj-77",
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
            "obj-77",
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
            "obj-77",
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
            "obj-77",
            1
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
            "obj-90",
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
            "obj-90",
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
            "obj-90",
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
            "obj-90",
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
            "obj-90",
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
            "obj-90",
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
            "obj-106",
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
            1
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
            "obj-107",
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
            "obj-108",
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
            "obj-109",
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
            "obj-110",
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
            "obj-106",
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
            "obj-106",
            1
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
            "obj-106",
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
            "obj-123",
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
            "obj-123",
            1
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
            "obj-124",
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
            "obj-125",
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
            "obj-126",
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
            "obj-127",
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
            "obj-123",
            1
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
            "obj-123",
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
            "obj-139",
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
            "obj-141",
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
            "obj-150",
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
            "obj-150",
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
            "obj-163",
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
            "obj-163",
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
            1
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
            "obj-163",
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
            "obj-163",
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
            "obj-163",
            1
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
            "obj-174",
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
            "obj-179",
            0
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
            "obj-177",
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
            "obj-180",
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
            "obj-177",
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
            "obj-191",
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
            "obj-194",
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
            "obj-191",
            1
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
            "obj-198",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-200",
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
            "obj-205",
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
            "obj-205",
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
            1
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
            "obj-205",
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
            "obj-209",
            0
          ],
          "source": [
            "obj-205",
            1
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
            "obj-219",
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
            "obj-219",
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
            1
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
            "obj-219",
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
            "obj-219",
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
            "obj-219",
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
            "obj-226",
            0
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
            "obj-227",
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
            "obj-233",
            1
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
            "obj-233",
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
            "obj-236",
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
            "obj-237",
            0
          ],
          "source": [
            "obj-233",
            1
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
            "obj-247",
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
            "obj-247",
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
            1
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
            "obj-247",
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
            "obj-250",
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
            "obj-251",
            0
          ],
          "source": [
            "obj-247",
            1
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
            "obj-255",
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
            "obj-258",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-260",
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
            "obj-263",
            0
          ],
          "source": [
            "obj-262",
            1
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
            "obj-262",
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
            "obj-263",
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
            "obj-265",
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
            "obj-269",
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
            "obj-266",
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
            "obj-275",
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
            "obj-267",
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
            "obj-276",
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
            "obj-279",
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
            "obj-267",
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
            "obj-280",
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
            "obj-281",
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
            "obj-267",
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
            "obj-284",
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
            "obj-287",
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
            "obj-267",
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
            "obj-260",
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
            "obj-260",
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
            "obj-260",
            1
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
            "obj-300",
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
            "obj-300",
            1
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
            "obj-301",
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
            1
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
            "obj-302",
            0
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
            "obj-303",
            0
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
            "obj-305",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-308",
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
            "obj-308",
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
            "obj-309",
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
            "obj-311",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-312",
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
            "obj-315",
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
            "obj-307",
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
            "obj-316",
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
            "obj-317",
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
            "obj-319",
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
            "obj-307",
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
            "obj-300",
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
            "obj-321",
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
            "obj-322",
            0
          ],
          "source": [
            "obj-300",
            1
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
            "obj-326",
            2
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
            "obj-326",
            3
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
            "obj-326",
            4
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
            "obj-326",
            5
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
            "obj-326",
            6
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
            "obj-326",
            7
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
            "obj-326",
            8
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
            "obj-326",
            9
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
            "obj-326",
            10
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
            "obj-326",
            11
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
            "obj-326",
            12
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
            "obj-326",
            13
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
            "obj-326",
            14
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
            "obj-326",
            15
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
            "obj-326",
            16
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
            "obj-326",
            17
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
            "obj-326",
            18
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
            "obj-346",
            0
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
            "obj-346",
            2
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
            "obj-346",
            3
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
            "obj-346",
            4
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
            "obj-346",
            5
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
            "obj-346",
            6
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
            "obj-346",
            7
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
            "obj-346",
            8
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
            "obj-346",
            9
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
            "obj-346",
            10
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
            "obj-346",
            11
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
            "obj-346",
            12
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
            "obj-346",
            13
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
            "obj-346",
            14
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
            "obj-346",
            15
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
            "obj-346",
            16
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
            "obj-346",
            17
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
            "obj-346",
            18
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
      },
      {
        "patchline": {
          "source": [
            "obj-406",
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
