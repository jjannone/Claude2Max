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
          "text": "FILTER DEVICES SHOOTOUT \u2014 filter devices: Max for Live package devices and Apple AudioUnit filters. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 13, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
                "2 amxd Phone Filter",
                "3 amxd Mangle Filter",
                "4 amxd Harmonic Filter",
                "5 amxd AutoFilter",
                "6 amxd FilterTaps",
                "7 amxd Spectral Filter",
                "8 amxd Comber",
                "9 amxd CombFilterMulti",
                "10 amxd Cyclotron",
                "11 AU Bandpass",
                "12 AU Hipass",
                "13 AU Lowpass"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 12,
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
          "text": "v8 fx-shootout-highlight.js 13 @embed 1",
          "filename": "fx-shootout-highlight.js",
          "textfile": {
            "filename": "fx-shootout-highlight.js",
            "flags": 0,
            "autowatch": 1,
            "embed": 1,
            "text": "// fx-shootout-highlight.js \u2014 turns the [live.tab] index into the slot\n// number, lights the selected pane's title, dims every other title.\n// Shared by every *-shootout patch; the box arguments size it:\n//\n//     v8 fx-shootout-highlight.js <lastslot> [<rows> <cols>]\n//\n// inlet 0  : int \u2014 the live.tab item index (row-major, 0-based).\n// outlet 0 : int \u2014 the slot number (1 = DRY, 2..lastslot = the panes) \u2192 [s SEL].\n//\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\n// Number UI controls down each column). A tab fills row by row, so for a\n// grid with more than one column the items are stored transposed and this\n// script maps the index back:\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\n// With one column (the default) the stored order is the shown order and the\n// mapping is index + 1. ROWS / COLS must match what Max draws.\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\n// digits (TITLE_02 \u2026 TITLE_nn); patcher.getnamed() reaches them and their\n// colors are set by sending the attribute name as a message.\n\ninlets = 1;\noutlets = 1;\nautowatch = 1;\n\nsetinletassist(0, \"int: live.tab item index (row-major) \u2014 lights TITLE_<slot>\");\nsetoutletassist(0, \"int: slot number (1 = DRY, 2..lastslot = panes) \u2192 s SEL\");\n\nvar FIRST_SLOT = 2;                        // slot 1 is DRY and has no pane\nvar LAST_SLOT  = (jsarguments.length > 1) ? parseInt(jsarguments[1], 10) : 12;\nvar ROWS       = (jsarguments.length > 2) ? parseInt(jsarguments[2], 10) : LAST_SLOT;\nvar COLS       = (jsarguments.length > 3) ? parseInt(jsarguments[3], 10) : 1;\n\n// amber on dark is the panel palette; the selected title inverts it\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\n\nfunction pad2(n) { return (n < 10 ? \"0\" : \"\") + n; }\n\nfunction paint(obj, bg, tx) {\n    obj.message(\"bgcolor\",   bg[0], bg[1], bg[2], bg[3]);\n    obj.message(\"textcolor\", tx[0], tx[1], tx[2], tx[3]);\n}\n\nfunction msg_int(index) {\n    var row = Math.floor(index / COLS), col = index % COLS;\n    var slot = col * ROWS + row + 1;\n    for (var n = FIRST_SLOT; n <= LAST_SLOT; n++) {\n        var obj = this.patcher.getnamed(\"TITLE_\" + pad2(n));\n        if (!obj) {\n            post(\"fx-shootout-highlight: no comment named TITLE_\" + pad2(n) + \"\\n\");\n            continue;\n        }\n        if (n === slot) paint(obj, ON_BG, ON_TX);\n        else            paint(obj, OFF_BG, OFF_TX);\n    }\n    outlet(0, slot);\n}\n"
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
          "text": "TRANSPORT \u2014 the global transport; followed by: Cyclotron (internal sync mode)"
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
            365.0,
            20.0
          ],
          "text": "TRANSPORT \u2014 Cyclotron (internal sync mode)",
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
            186.0,
            20.0
          ],
          "text": "2 \u00b7 amxd Phone Filter",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
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
            500.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
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
          "id": "obj-52",
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
          "id": "obj-53",
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
          "id": "obj-54",
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
          "text": "2 \u00b7 amxd~ Phone Filter.amxd \u2014 telephone bandwidth + hiss"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            550.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            232.0,
            406.0,
            50.0,
            22.0
          ]
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
            100.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-58",
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
            630.0,
            250.0,
            196.0
          ],
          "text": "amxd~ \"Phone Filter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            432.0,
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
          "varname": "DEV_02"
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            330.0,
            590.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            30.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
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
            170.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
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
            195.0,
            20.0
          ],
          "text": "3 \u00b7 amxd Mangle Filter",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            406.0,
            253.0,
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
          "id": "obj-65",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1271.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            406.0,
            253.0,
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
          "id": "obj-66",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1271.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1271.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            640.0,
            520.0,
            621.0,
            20.0
          ],
          "text": "3 \u00b7 amxd~ Mangle Filter.amxd \u2014 amplitude- and delay-modulation from the input level"
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
            640.0,
            550.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            569.0,
            406.0,
            50.0,
            22.0
          ]
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
            710.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            790.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-72",
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
            630.0,
            309.0,
            196.0
          ],
          "text": "amxd~ \"Mangle Filter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            432.0,
            309.0,
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
          "varname": "DEV_03"
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
            940.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            940.0,
            590.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
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
            640.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
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
            780.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            190.0,
            212.0,
            20.0
          ],
          "text": "4 \u00b7 amxd Harmonic Filter",
          "presentation": 1,
          "presentation_rect": [
            643.0,
            406.0,
            681.0,
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
          "id": "obj-79",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2178.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            643.0,
            406.0,
            681.0,
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
          "id": "obj-80",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2178.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
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
            2178.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1411.0,
            520.0,
            757.0,
            20.0
          ],
          "text": "4 \u00b7 amxd~ Harmonic Filter.amxd \u2014 25 bandpasses driven by a cellular automaton"
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1411.0,
            550.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1334.0,
            406.0,
            50.0,
            22.0
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
            1481.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1561.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-86",
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
            1411.0,
            630.0,
            737.0,
            196.0
          ],
          "text": "amxd~ \"Harmonic Filter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            643.0,
            432.0,
            737.0,
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
          "varname": "DEV_04"
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
            1411.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
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
            1551.0,
            861.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            216.0,
            169.0,
            20.0
          ],
          "text": "5 \u00b7 amxd AutoFilter",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            396.0,
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
          "id": "obj-91",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            611.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            396.0,
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
          "id": "obj-92",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            611.0,
            991.0,
            40.0,
            22.0
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "obj-93",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            611.0,
            1021.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-94",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            961.0,
            571.0,
            20.0
          ],
          "text": "5 \u00b7 amxd~ Max AutoFilter.amxd \u2014 one-band filter following the input envelope"
        }
      },
      {
        "box": {
          "id": "obj-95",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            424.0,
            658.0,
            50.0,
            22.0
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
            100.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-98",
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
            1071.0,
            452.0,
            196.0
          ],
          "text": "amxd~ \"Max AutoFilter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            684.0,
            452.0,
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
          "varname": "DEV_05"
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
            330.0,
            991.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-100",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            1031.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            30.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
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
            170.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
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
            169.0,
            20.0
          ],
          "text": "6 \u00b7 amxd FilterTaps",
          "presentation": 1,
          "presentation_rect": [
            498.0,
            658.0,
            366.0,
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
          "id": "obj-105",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1221.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            498.0,
            658.0,
            366.0,
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
          "id": "obj-106",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1221.0,
            991.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1221.0,
            1021.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-108",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            751.0,
            961.0,
            460.0,
            20.0
          ],
          "text": "6 \u00b7 amxd~ FilterTaps.amxd \u2014 filtered delay taps in a poly~"
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
            751.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            874.0,
            658.0,
            50.0,
            22.0
          ]
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
            821.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            901.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-112",
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
            1071.0,
            422.0,
            196.0
          ],
          "text": "amxd~ FilterTaps.amxd",
          "presentation": 1,
          "presentation_rect": [
            498.0,
            684.0,
            422.0,
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
          "varname": "DEV_06"
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
            1051.0,
            991.0,
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
            1051.0,
            1031.0,
            104.0,
            22.0
          ],
          "text": "dry/wet 100."
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
            751.0,
            1302.0,
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
            891.0,
            1302.0,
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
            268.0,
            212.0,
            20.0
          ],
          "text": "7 \u00b7 amxd Spectral Filter",
          "presentation": 1,
          "presentation_rect": [
            948.0,
            658.0,
            294.0,
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
            1848.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            948.0,
            658.0,
            294.0,
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
            1848.0,
            991.0,
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
            1848.0,
            1021.0,
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
            1361.0,
            961.0,
            477.0,
            20.0
          ],
          "text": "7 \u00b7 amxd~ Spectral Filter.amxd \u2014 256-band drawable pfft~ filter"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1361.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1252.0,
            658.0,
            50.0,
            22.0
          ]
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
            1431.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1511.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-126",
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
            1361.0,
            1071.0,
            350.0,
            196.0
          ],
          "text": "amxd~ \"Spectral Filter.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            948.0,
            684.0,
            350.0,
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
          "varname": "DEV_07"
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
            1661.0,
            991.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1661.0,
            1031.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            1361.0,
            1302.0,
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
            1501.0,
            1302.0,
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
            294.0,
            135.0,
            20.0
          ],
          "text": "8 \u00b7 amxd Comber",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            910.0,
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
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            910.0,
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
          "id": "obj-134",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            1432.0,
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
            1462.0,
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
            1402.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 amxd~ Comber.amxd \u2014 two modulated comb filters"
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
            30.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            232.0,
            910.0,
            50.0,
            22.0
          ]
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
            100.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-140",
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
            1512.0,
            252.0,
            196.0
          ],
          "text": "amxd~ Comber.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            936.0,
            252.0,
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
          "varname": "DEV_08"
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
            330.0,
            1432.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            330.0,
            1472.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            1743.0,
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
            170.0,
            1743.0,
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
            320.0,
            212.0,
            20.0
          ],
          "text": "9 \u00b7 amxd CombFilterMulti",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            910.0,
            283.0,
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
            1142.0,
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            910.0,
            283.0,
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
            1142.0,
            1432.0,
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
            1142.0,
            1462.0,
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
            1402.0,
            492.0,
            20.0
          ],
          "text": "9 \u00b7 amxd~ Max CombFilterMulti.amxd \u2014 five comb filters in a poly~"
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
            640.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            599.0,
            910.0,
            50.0,
            22.0
          ]
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
            710.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            790.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-154",
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
            1512.0,
            339.0,
            196.0
          ],
          "text": "amxd~ \"Max CombFilterMulti.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            936.0,
            339.0,
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
          "varname": "DEV_09"
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
            940.0,
            1432.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-156",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            1472.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            640.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
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
            780.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
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
            346.0,
            169.0,
            20.0
          ],
          "text": "10 \u00b7 amxd Cyclotron",
          "presentation": 1,
          "presentation_rect": [
            673.0,
            910.0,
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
          "varname": "TITLE_10"
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
            1978.0,
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            673.0,
            910.0,
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
          "id": "obj-162",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1978.0,
            1432.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1978.0,
            1462.0,
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
            1282.0,
            1402.0,
            686.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Cyclotron.amxd \u2014 step-sequenced lowpass / bandpass (needs its internal sync mode)"
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
            1282.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1067.0,
            910.0,
            50.0,
            22.0
          ]
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
            1352.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1432.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-168",
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
            1282.0,
            1512.0,
            440.0,
            196.0
          ],
          "text": "amxd~ Cyclotron.amxd",
          "presentation": 1,
          "presentation_rect": [
            673.0,
            936.0,
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
          "varname": "DEV_10"
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
            1282.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1422.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            372.0,
            144.0,
            20.0
          ],
          "text": "11 \u00b7 AU Bandpass",
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            910.0,
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
          "varname": "TITLE_11"
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
            841.0,
            1843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            910.0,
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
          "id": "obj-174",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            841.0,
            1873.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            841.0,
            1903.0,
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
            30.0,
            1843.0,
            801.0,
            20.0
          ],
          "text": "11 \u00b7 vst~ + plug_au AUBandpass"
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
            30.0,
            1873.0,
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
            110.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-179",
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
            2213.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            1035.0,
            214.0,
            22.0
          ],
          "varname": "VST_11"
        }
      },
      {
        "box": {
          "id": "obj-180",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-181",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            1901.0,
            55.0,
            22.0
          ],
          "text": "t b b"
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
            330.0,
            1943.0,
            146.0,
            22.0
          ],
          "text": "plug_au AUBandpass"
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
            230.0,
            1943.0,
            97.0,
            22.0
          ],
          "text": "s AU11_INIT"
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            1873.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            934.0,
            50.0,
            22.0
          ]
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
            230.0,
            1983.0,
            97.0,
            22.0
          ],
          "text": "r AU11_INIT"
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
            230.0,
            2128.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST11"
        }
      },
      {
        "box": {
          "id": "obj-187",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2023.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-188",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2053.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1199.0,
            934.0,
            22.0,
            22.0
          ]
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
            398.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            1225.0,
            936.0,
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
          "id": "obj-190",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2083.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            417.0,
            2023.0,
            62.0,
            22.0
          ],
          "text": "0.0445"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            417.0,
            2053.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            962.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            424.0,
            186.0,
            20.0
          ],
          "text": "center (20 Hz\u201322 kHz)",
          "presentation": 1,
          "presentation_rect": [
            1197.0,
            964.0,
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
          "id": "obj-194",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            417.0,
            2083.0,
            167.0,
            22.0
          ],
          "text": "\"Center Frequency\" $1"
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            604.0,
            2023.0,
            55.0,
            22.0
          ],
          "text": "0.042"
        }
      },
      {
        "box": {
          "id": "obj-196",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            604.0,
            2053.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            986.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            450.0,
            237.0,
            20.0
          ],
          "text": "bandwidth (100\u201312000 cents)",
          "presentation": 1,
          "presentation_rect": [
            1197.0,
            988.0,
            158.0,
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
          "id": "obj-198",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            604.0,
            2083.0,
            104.0,
            22.0
          ],
          "text": "Bandwidth $1"
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
            110.0,
            2173.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST11"
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
            30.0,
            2263.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
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
            120.0,
            2263.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
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
            476.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            1141.0,
            1063.0,
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
          "id": "obj-204",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            502.0,
            127.0,
            20.0
          ],
          "text": "12 \u00b7 AU Hipass",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1162.0,
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
          "varname": "TITLE_12"
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
            1792.0,
            1843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1162.0,
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
          "id": "obj-206",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1792.0,
            1873.0,
            40.0,
            22.0
          ],
          "text": "11"
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
            1792.0,
            1903.0,
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
            981.0,
            1843.0,
            801.0,
            20.0
          ],
          "text": "12 \u00b7 vst~ + plug_au AUHipass"
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
            981.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-210",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1061.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-211",
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
            981.0,
            2213.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1270.0,
            214.0,
            22.0
          ],
          "varname": "VST_12"
        }
      },
      {
        "box": {
          "id": "obj-212",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1181.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-213",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            1181.0,
            1901.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-214",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1281.0,
            1943.0,
            132.0,
            22.0
          ],
          "text": "plug_au AUHipass"
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1181.0,
            1943.0,
            97.0,
            22.0
          ],
          "text": "s AU12_INIT"
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
            1421.0,
            1873.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1186.0,
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
            1181.0,
            1983.0,
            97.0,
            22.0
          ],
          "text": "r AU12_INIT"
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
            1181.0,
            2128.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST12"
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
            1181.0,
            2023.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-220",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            1181.0,
            2053.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            76.0,
            1186.0,
            22.0,
            22.0
          ]
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
            528.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            102.0,
            1188.0,
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
          "id": "obj-222",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1181.0,
            2083.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-223",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1368.0,
            2023.0,
            62.0,
            22.0
          ],
          "text": "0.0449"
        }
      },
      {
        "box": {
          "id": "obj-224",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1368.0,
            2053.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1214.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            554.0,
            186.0,
            20.0
          ],
          "text": "cutoff (10 Hz\u201322 kHz)",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            1216.0,
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
          "id": "obj-226",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1368.0,
            2083.0,
            167.0,
            22.0
          ],
          "text": "\"Cutoff Frequency\" $1"
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
            1555.0,
            2023.0,
            62.0,
            22.0
          ],
          "text": "0.3333"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1555.0,
            2053.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1238.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            580.0,
            186.0,
            20.0
          ],
          "text": "resonance (\u221220\u201340 dB)",
          "presentation": 1,
          "presentation_rect": [
            74.0,
            1240.0,
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
          "id": "obj-230",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1555.0,
            2083.0,
            104.0,
            22.0
          ],
          "text": "Resonance $1"
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
            1061.0,
            2173.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST12"
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
            981.0,
            2263.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
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
            1071.0,
            2263.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1298.0,
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
          "id": "obj-236",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
            135.0,
            20.0
          ],
          "text": "13 \u00b7 AU Lowpass",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1162.0,
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
          "id": "obj-237",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            841.0,
            2373.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1162.0,
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
          "id": "obj-238",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            841.0,
            2403.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            841.0,
            2433.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            2373.0,
            801.0,
            20.0
          ],
          "text": "13 \u00b7 vst~ + plug_au AULowpass"
        }
      },
      {
        "box": {
          "id": "obj-241",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2403.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            2403.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-243",
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
            2743.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1270.0,
            214.0,
            22.0
          ],
          "varname": "VST_13"
        }
      },
      {
        "box": {
          "id": "obj-244",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            2403.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-245",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            2431.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-246",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            2473.0,
            139.0,
            22.0
          ],
          "text": "plug_au AULowpass"
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
            230.0,
            2473.0,
            97.0,
            22.0
          ],
          "text": "s AU13_INIT"
        }
      },
      {
        "box": {
          "id": "obj-248",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            2403.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1186.0,
            50.0,
            22.0
          ]
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
            230.0,
            2513.0,
            97.0,
            22.0
          ],
          "text": "r AU13_INIT"
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
            230.0,
            2658.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST13"
        }
      },
      {
        "box": {
          "id": "obj-251",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2553.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2583.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            314.0,
            1186.0,
            22.0,
            22.0
          ]
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
            658.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            340.0,
            1188.0,
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
          "id": "obj-254",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            2613.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            417.0,
            2553.0,
            62.0,
            22.0
          ],
          "text": "0.0454"
        }
      },
      {
        "box": {
          "id": "obj-256",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            417.0,
            2583.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1214.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            684.0,
            186.0,
            20.0
          ],
          "text": "cutoff (10 Hz\u201322 kHz)",
          "presentation": 1,
          "presentation_rect": [
            312.0,
            1216.0,
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
          "id": "obj-258",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            417.0,
            2613.0,
            167.0,
            22.0
          ],
          "text": "\"Cutoff Frequency\" $1"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            604.0,
            2553.0,
            62.0,
            22.0
          ],
          "text": "0.3333"
        }
      },
      {
        "box": {
          "id": "obj-260",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            604.0,
            2583.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1238.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            710.0,
            186.0,
            20.0
          ],
          "text": "resonance (\u221220\u201340 dB)",
          "presentation": 1,
          "presentation_rect": [
            312.0,
            1240.0,
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
          "id": "obj-262",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            604.0,
            2613.0,
            104.0,
            22.0
          ],
          "text": "Resonance $1"
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
            110.0,
            2703.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST13"
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
            2793.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
        }
      },
      {
        "box": {
          "id": "obj-265",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            2793.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            2520.0,
            736.0,
            288.0,
            20.0
          ],
          "text": "AU parameters: 0\u20131 of their range",
          "presentation": 1,
          "presentation_rect": [
            256.0,
            1298.0,
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
          "id": "obj-267",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2903.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201313 are the effects"
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
            30.0,
            2963.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-269",
          "maxclass": "newobj",
          "numinlets": 14,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3013.0,
            209.0,
            22.0
          ],
          "text": "selector~ 13 1 @ramptime 30"
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
            30.0,
            3063.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
        }
      },
      {
        "box": {
          "id": "obj-275",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
        }
      },
      {
        "box": {
          "id": "obj-277",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
        }
      },
      {
        "box": {
          "id": "obj-279",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
        }
      },
      {
        "box": {
          "id": "obj-280",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            1110.0,
            2963.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
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
            3093.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-284",
          "maxclass": "newobj",
          "numinlets": 14,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3143.0,
            209.0,
            22.0
          ],
          "text": "selector~ 13 1 @ramptime 30"
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
            30.0,
            3193.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
        }
      },
      {
        "box": {
          "id": "obj-286",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
        }
      },
      {
        "box": {
          "id": "obj-287",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
        }
      },
      {
        "box": {
          "id": "obj-295",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            930.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            1020.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            1110.0,
            3093.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
        }
      },
      {
        "box": {
          "id": "obj-298",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3243.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            3273.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            3273.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
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
            200.0,
            3273.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            3273.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-303",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            410.0,
            3273.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            3273.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-305",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            3313.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-306",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            3313.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3363.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-308",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            3363.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-309",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            3363.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-310",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            3363.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-311",
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
            3423.0,
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
          "id": "obj-312",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3503.0,
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
          "id": "obj-313",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3243.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            3273.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            3313.0,
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
          "id": "obj-316",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            3353.0,
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
          "id": "obj-317",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            3393.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            3433.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            3433.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
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
            780.0,
            3473.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            930.0,
            3473.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-322",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3513.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
        }
      },
      {
        "box": {
          "id": "obj-323",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            930.0,
            3513.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-326",
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
          "id": "obj-327",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
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
          "id": "obj-328",
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
          "id": "obj-329",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
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
          "id": "obj-330",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
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
          "id": "obj-331",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
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
          "id": "obj-332",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
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
          "id": "obj-333",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            944.0,
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
          "id": "obj-334",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            970.0,
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
          "id": "obj-335",
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
          "id": "obj-336",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1022.0,
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
          "id": "obj-337",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1048.0,
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
          "id": "obj-338",
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
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            400.0,
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
          "id": "obj-63",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            298.0,
            400.0,
            329.0,
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
          "id": "obj-77",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            635.0,
            400.0,
            757.0,
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
          "id": "obj-89",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            652.0,
            472.0,
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
          "id": "obj-103",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            490.0,
            652.0,
            442.0,
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
          "id": "obj-117",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            940.0,
            652.0,
            370.0,
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
          "id": "obj-131",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            904.0,
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
          "id": "obj-145",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            298.0,
            904.0,
            359.0,
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
          "id": "obj-159",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            665.0,
            904.0,
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
          "id": "obj-171",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1133.0,
            904.0,
            230.0,
            206.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1156.0,
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
          "id": "obj-235",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            3573.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            248.0,
            1156.0,
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
          "id": "obj-324",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            3573.0,
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
          "id": "obj-325",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            3573.0,
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
            3633.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"FILTER DEVICES SHOOTOUT \\u2014 filter devices: Max for Live package devices and Apple AudioUnit filters. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 13, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        281\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 13,\n        \"num_lines_presentation\": 13,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 amxd Phone Filter\",\n              \"3 amxd Mangle Filter\",\n              \"4 amxd Harmonic Filter\",\n              \"5 amxd AutoFilter\",\n              \"6 amxd FilterTaps\",\n              \"7 amxd Spectral Filter\",\n              \"8 amxd Comber\",\n              \"9 amxd CombFilterMulti\",\n              \"10 amxd Cyclotron\",\n              \"11 AU Bandpass\",\n              \"12 AU Hipass\",\n              \"13 AU Lowpass\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 12,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 13,\n        \"num_lines_presentation\": 13,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 13 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch; the box arguments size it:\\n//\\n//     v8 fx-shootout-highlight.js <lastslot> [<rows> <cols>]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;                        // slot 1 is DRY and has no pane\\nvar LAST_SLOT  = (jsarguments.length > 1) ? parseInt(jsarguments[1], 10) : 12;\\nvar ROWS       = (jsarguments.length > 2) ? parseInt(jsarguments[2], 10) : LAST_SLOT;\\nvar COLS       = (jsarguments.length > 3) ? parseInt(jsarguments[3], 10) : 1;\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var row = Math.floor(index / COLS), col = index % COLS;\\n    var slot = col * ROWS + row + 1;\\n    for (var n = FIRST_SLOT; n <= LAST_SLOT; n++) {\\n        var obj = this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n));\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_transport\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 the global transport; followed by: Cyclotron (internal sync mode)\",\n      \"pos\": [\n        2000,\n        230\n      ],\n      \"size\": [\n        500,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"tr_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 120.\",\n      \"pos\": [\n        2000,\n        260\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_bpm\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        2000,\n        290\n      ],\n      \"attrs\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      },\n      \"presentation\": [\n        1110,\n        262,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      }\n    },\n    \"tr_tempo\": {\n      \"type\": \"message\",\n      \"text\": \"tempo $1\",\n      \"pos\": [\n        2000,\n        320\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_run\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        2120,\n        290\n      ],\n      \"presentation\": [\n        980,\n        262,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"tr_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"transport\",\n      \"pos\": [\n        2000,\n        360\n      ],\n      \"inlets\": 2,\n      \"outlets\": 9,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"p_tr_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 Cyclotron (internal sync mode)\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        365,\n        20\n      ],\n      \"presentation\": [\n        980,\n        240,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_run\": {\n      \"type\": \"comment\",\n      \"text\": \"start / stop\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        1010,\n        264,\n        90,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_bpm\": {\n      \"type\": \"comment\",\n      \"text\": \"bpm\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1170,\n        264,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        400,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 amxd Phone Filter\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        18,\n        406,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        520\n      ],\n      \"presentation\": [\n        18,\n        406,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        500,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 amxd~ Phone Filter.amxd \\u2014 telephone bandwidth + hiss\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"presentation\": [\n        232,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Phone Filter.amxd\\\"\",\n      \"pos\": [\n        30,\n        630\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        432,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_02\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f02_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        330,\n        590\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        170,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        298,\n        400,\n        329,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 amxd Mangle Filter\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        306,\n        406,\n        253,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1271,\n        520\n      ],\n      \"presentation\": [\n        306,\n        406,\n        253,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1271,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1271,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 amxd~ Mangle Filter.amxd \\u2014 amplitude- and delay-modulation from the input level\",\n      \"pos\": [\n        640,\n        520\n      ],\n      \"size\": [\n        621,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        640,\n        550\n      ],\n      \"presentation\": [\n        569,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        710,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        790,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Mangle Filter.amxd\\\"\",\n      \"pos\": [\n        640,\n        630\n      ],\n      \"size\": [\n        309,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        306,\n        432,\n        309,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_03\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f03_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        940,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        940,\n        590\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        640,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        780,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        635,\n        400,\n        757,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 amxd Harmonic Filter\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        643,\n        406,\n        681,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2178,\n        520\n      ],\n      \"presentation\": [\n        643,\n        406,\n        681,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        2178,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2178,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 amxd~ Harmonic Filter.amxd \\u2014 25 bandpasses driven by a cellular automaton\",\n      \"pos\": [\n        1411,\n        520\n      ],\n      \"size\": [\n        757,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1411,\n        550\n      ],\n      \"presentation\": [\n        1334,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1481,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1561,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Harmonic Filter.amxd\\\"\",\n      \"pos\": [\n        1411,\n        630\n      ],\n      \"size\": [\n        737,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        643,\n        432,\n        737,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_04\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1411,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1551,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        652,\n        472,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 amxd AutoFilter\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        658,\n        396,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        611,\n        961\n      ],\n      \"presentation\": [\n        18,\n        658,\n        396,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        611,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        611,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 amxd~ Max AutoFilter.amxd \\u2014 one-band filter following the input envelope\",\n      \"pos\": [\n        30,\n        961\n      ],\n      \"size\": [\n        571,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        991\n      ],\n      \"presentation\": [\n        424,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max AutoFilter.amxd\\\"\",\n      \"pos\": [\n        30,\n        1071\n      ],\n      \"size\": [\n        452,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        684,\n        452,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_05\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f05_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        330,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        170,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        490,\n        652,\n        442,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd FilterTaps\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        498,\n        658,\n        366,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1221,\n        961\n      ],\n      \"presentation\": [\n        498,\n        658,\n        366,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1221,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1221,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd~ FilterTaps.amxd \\u2014 filtered delay taps in a poly~\",\n      \"pos\": [\n        751,\n        961\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        751,\n        991\n      ],\n      \"presentation\": [\n        874,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        821,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        901,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ FilterTaps.amxd\",\n      \"pos\": [\n        751,\n        1071\n      ],\n      \"size\": [\n        422,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        498,\n        684,\n        422,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_06\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1051,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_wet\": {\n      \"type\": \"message\",\n      \"text\": \"dry/wet 100.\",\n      \"pos\": [\n        1051,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        751,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        891,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        940,\n        652,\n        370,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd Spectral Filter\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        948,\n        658,\n        294,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1848,\n        961\n      ],\n      \"presentation\": [\n        948,\n        658,\n        294,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1848,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1848,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd~ Spectral Filter.amxd \\u2014 256-band drawable pfft~ filter\",\n      \"pos\": [\n        1361,\n        961\n      ],\n      \"size\": [\n        477,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1361,\n        991\n      ],\n      \"presentation\": [\n        1252,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1431,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1511,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Spectral Filter.amxd\\\"\",\n      \"pos\": [\n        1361,\n        1071\n      ],\n      \"size\": [\n        350,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        948,\n        684,\n        350,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_07\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1661,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1661,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1361,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1501,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        904,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd Comber\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        18,\n        910,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        500,\n        1402\n      ],\n      \"presentation\": [\n        18,\n        910,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        500,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        500,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd~ Comber.amxd \\u2014 two modulated comb filters\",\n      \"pos\": [\n        30,\n        1402\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1432\n      ],\n      \"presentation\": [\n        232,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Comber.amxd\",\n      \"pos\": [\n        30,\n        1512\n      ],\n      \"size\": [\n        252,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        936,\n        252,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_08\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        330,\n        1472\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        170,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        298,\n        904,\n        359,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd CombFilterMulti\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        212,\n        20\n      ],\n      \"presentation\": [\n        306,\n        910,\n        283,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1142,\n        1402\n      ],\n      \"presentation\": [\n        306,\n        910,\n        283,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1142,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1142,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd~ Max CombFilterMulti.amxd \\u2014 five comb filters in a poly~\",\n      \"pos\": [\n        640,\n        1402\n      ],\n      \"size\": [\n        492,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        640,\n        1432\n      ],\n      \"presentation\": [\n        599,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        710,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        790,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max CombFilterMulti.amxd\\\"\",\n      \"pos\": [\n        640,\n        1512\n      ],\n      \"size\": [\n        339,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        306,\n        936,\n        339,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_09\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        940,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        940,\n        1472\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        640,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        780,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        665,\n        904,\n        460,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd Cyclotron\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        673,\n        910,\n        384,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1978,\n        1402\n      ],\n      \"presentation\": [\n        673,\n        910,\n        384,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1978,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1978,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Cyclotron.amxd \\u2014 step-sequenced lowpass / bandpass (needs its internal sync mode)\",\n      \"pos\": [\n        1282,\n        1402\n      ],\n      \"size\": [\n        686,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1282,\n        1432\n      ],\n      \"presentation\": [\n        1067,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1352,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1432,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Cyclotron.amxd\",\n      \"pos\": [\n        1282,\n        1512\n      ],\n      \"size\": [\n        440,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        673,\n        936,\n        440,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1282,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1422,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1133,\n        904,\n        230,\n        206\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 AU Bandpass\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        1141,\n        910,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        841,\n        1843\n      ],\n      \"presentation\": [\n        1141,\n        910,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        841,\n        1873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        841,\n        1903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 vst~ + plug_au AUBandpass\",\n      \"pos\": [\n        30,\n        1843\n      ],\n      \"size\": [\n        801,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2213\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        1141,\n        1035,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_11\"\n      }\n    },\n    \"f11_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f11_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        1901\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f11_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUBandpass\",\n      \"pos\": [\n        330,\n        1943\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU11_INIT\",\n      \"pos\": [\n        230,\n        1943\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        1873\n      ],\n      \"presentation\": [\n        1141,\n        934,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU11_INIT\",\n      \"pos\": [\n        230,\n        1983\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST11\",\n      \"pos\": [\n        230,\n        2128\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2053\n      ],\n      \"presentation\": [\n        1199,\n        934,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f11_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        1225,\n        936,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0445\",\n      \"pos\": [\n        417,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        417,\n        2053\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1141,\n        962,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"center (20 Hz\\u201322 kHz)\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        1197,\n        964,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Center Frequency\\\" $1\",\n      \"pos\": [\n        417,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.042\",\n      \"pos\": [\n        604,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        604,\n        2053\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1141,\n        986,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bandwidth (100\\u201312000 cents)\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        237,\n        20\n      ],\n      \"presentation\": [\n        1197,\n        988,\n        158,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Bandwidth $1\",\n      \"pos\": [\n        604,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST11\",\n      \"pos\": [\n        110,\n        2173\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        2263\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        120,\n        2263\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        1141,\n        1063,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1156,\n        230,\n        189\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 AU Hipass\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1162,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1792,\n        1843\n      ],\n      \"presentation\": [\n        18,\n        1162,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1792,\n        1873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1792,\n        1903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 vst~ + plug_au AUHipass\",\n      \"pos\": [\n        981,\n        1843\n      ],\n      \"size\": [\n        801,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        981,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1061,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        981,\n        2213\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1270,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_12\"\n      }\n    },\n    \"f12_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1181,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f12_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        1181,\n        1901\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f12_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUHipass\",\n      \"pos\": [\n        1281,\n        1943\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU12_INIT\",\n      \"pos\": [\n        1181,\n        1943\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1421,\n        1873\n      ],\n      \"presentation\": [\n        18,\n        1186,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU12_INIT\",\n      \"pos\": [\n        1181,\n        1983\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST12\",\n      \"pos\": [\n        1181,\n        2128\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        1181,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        1181,\n        2053\n      ],\n      \"presentation\": [\n        76,\n        1186,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f12_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        102,\n        1188,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        1181,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0449\",\n      \"pos\": [\n        1368,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1368,\n        2053\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        18,\n        1214,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f12_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"cutoff (10 Hz\\u201322 kHz)\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        74,\n        1216,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Cutoff Frequency\\\" $1\",\n      \"pos\": [\n        1368,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.3333\",\n      \"pos\": [\n        1555,\n        2023\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1555,\n        2053\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        18,\n        1238,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f12_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"resonance (\\u221220\\u201340 dB)\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        74,\n        1240,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Resonance $1\",\n      \"pos\": [\n        1555,\n        2083\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST12\",\n      \"pos\": [\n        1061,\n        2173\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        981,\n        2263\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        1071,\n        2263\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1298,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        248,\n        1156,\n        230,\n        189\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 AU Lowpass\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        256,\n        1162,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        841,\n        2373\n      ],\n      \"presentation\": [\n        256,\n        1162,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        841,\n        2403\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        841,\n        2433\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 vst~ + plug_au AULowpass\",\n      \"pos\": [\n        30,\n        2373\n      ],\n      \"size\": [\n        801,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2403\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2403\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2743\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        256,\n        1270,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_13\"\n      }\n    },\n    \"f13_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        2403\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f13_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        2431\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f13_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AULowpass\",\n      \"pos\": [\n        330,\n        2473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU13_INIT\",\n      \"pos\": [\n        230,\n        2473\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        2403\n      ],\n      \"presentation\": [\n        256,\n        1186,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU13_INIT\",\n      \"pos\": [\n        230,\n        2513\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST13\",\n      \"pos\": [\n        230,\n        2658\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2553\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2583\n      ],\n      \"presentation\": [\n        314,\n        1186,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f13_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        340,\n        1188,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        2613\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.0454\",\n      \"pos\": [\n        417,\n        2553\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        417,\n        2583\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        256,\n        1214,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f13_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"cutoff (10 Hz\\u201322 kHz)\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        312,\n        1216,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Cutoff Frequency\\\" $1\",\n      \"pos\": [\n        417,\n        2613\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.3333\",\n      \"pos\": [\n        604,\n        2553\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        604,\n        2583\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        256,\n        1238,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f13_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"resonance (\\u221220\\u201340 dB)\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        312,\n        1240,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Resonance $1\",\n      \"pos\": [\n        604,\n        2613\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST13\",\n      \"pos\": [\n        110,\n        2703\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        30,\n        2793\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        120,\n        2793\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        256,\n        1298,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201313 are the effects\",\n      \"pos\": [\n        30,\n        2903\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 13 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3013\n      ],\n      \"inlets\": 14,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3063\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        2963\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 13 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3143\n      ],\n      \"inlets\": 14,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3193\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3093\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3243\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        3313\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        3313\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        3363\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        3363\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        3363\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        3363\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        3423\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        3503\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3243\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        3273\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        3313\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        3353\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        3393\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        3433\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        3433\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        3473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        3473\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        3513\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        3513\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3573\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"tr_lm\",\n      0,\n      \"tr_bpm\",\n      0\n    ],\n    [\n      \"tr_bpm\",\n      0,\n      \"tr_tempo\",\n      0\n    ],\n    [\n      \"tr_tempo\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"tr_run\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_open\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rL\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rR\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_rwo\",\n      0,\n      \"f02_wet\",\n      0\n    ],\n    [\n      \"f02_wet\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      1,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_open\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rL\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rR\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_rwo\",\n      0,\n      \"f03_wet\",\n      0\n    ],\n    [\n      \"f03_wet\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      1,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_open\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_open\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rL\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rR\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f05_rwo\",\n      0,\n      \"f05_wet\",\n      0\n    ],\n    [\n      \"f05_wet\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      1,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_open\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_rwo\",\n      0,\n      \"f06_wet\",\n      0\n    ],\n    [\n      \"f06_wet\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_open\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_rwo\",\n      0,\n      \"f07_wet\",\n      0\n    ],\n    [\n      \"f07_wet\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_open\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rL\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rR\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f08_rwo\",\n      0,\n      \"f08_wet\",\n      0\n    ],\n    [\n      \"f08_wet\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_open\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rL\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rR\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f09_rwo\",\n      0,\n      \"f09_wet\",\n      0\n    ],\n    [\n      \"f09_wet\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      1,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_lb\",\n      0,\n      \"f11_t\",\n      0\n    ],\n    [\n      \"f11_t\",\n      1,\n      \"f11_plug\",\n      0\n    ],\n    [\n      \"f11_t\",\n      0,\n      \"f11_sinit\",\n      0\n    ],\n    [\n      \"f11_plug\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p0_i\",\n      0\n    ],\n    [\n      \"f11_p0_i\",\n      0,\n      \"f11_p0\",\n      0\n    ],\n    [\n      \"f11_p0\",\n      0,\n      \"f11_p0_m\",\n      0\n    ],\n    [\n      \"f11_p0_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p1_i\",\n      0\n    ],\n    [\n      \"f11_p1_i\",\n      0,\n      \"f11_p1\",\n      0\n    ],\n    [\n      \"f11_p1\",\n      0,\n      \"f11_p1_m\",\n      0\n    ],\n    [\n      \"f11_p1_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p2_i\",\n      0\n    ],\n    [\n      \"f11_p2_i\",\n      0,\n      \"f11_p2\",\n      0\n    ],\n    [\n      \"f11_p2\",\n      0,\n      \"f11_p2_m\",\n      0\n    ],\n    [\n      \"f11_p2_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rtov\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_lb\",\n      0,\n      \"f12_t\",\n      0\n    ],\n    [\n      \"f12_t\",\n      1,\n      \"f12_plug\",\n      0\n    ],\n    [\n      \"f12_t\",\n      0,\n      \"f12_sinit\",\n      0\n    ],\n    [\n      \"f12_plug\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rinit\",\n      0,\n      \"f12_p0_i\",\n      0\n    ],\n    [\n      \"f12_p0_i\",\n      0,\n      \"f12_p0\",\n      0\n    ],\n    [\n      \"f12_p0\",\n      0,\n      \"f12_p0_m\",\n      0\n    ],\n    [\n      \"f12_p0_m\",\n      0,\n      \"f12_stov\",\n      0\n    ],\n    [\n      \"f12_rinit\",\n      0,\n      \"f12_p1_i\",\n      0\n    ],\n    [\n      \"f12_p1_i\",\n      0,\n      \"f12_p1\",\n      0\n    ],\n    [\n      \"f12_p1\",\n      0,\n      \"f12_p1_m\",\n      0\n    ],\n    [\n      \"f12_p1_m\",\n      0,\n      \"f12_stov\",\n      0\n    ],\n    [\n      \"f12_rinit\",\n      0,\n      \"f12_p2_i\",\n      0\n    ],\n    [\n      \"f12_p2_i\",\n      0,\n      \"f12_p2\",\n      0\n    ],\n    [\n      \"f12_p2\",\n      0,\n      \"f12_p2_m\",\n      0\n    ],\n    [\n      \"f12_p2_m\",\n      0,\n      \"f12_stov\",\n      0\n    ],\n    [\n      \"f12_rtov\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_lb\",\n      0,\n      \"f13_t\",\n      0\n    ],\n    [\n      \"f13_t\",\n      1,\n      \"f13_plug\",\n      0\n    ],\n    [\n      \"f13_t\",\n      0,\n      \"f13_sinit\",\n      0\n    ],\n    [\n      \"f13_plug\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_open\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p0_i\",\n      0\n    ],\n    [\n      \"f13_p0_i\",\n      0,\n      \"f13_p0\",\n      0\n    ],\n    [\n      \"f13_p0\",\n      0,\n      \"f13_p0_m\",\n      0\n    ],\n    [\n      \"f13_p0_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p1_i\",\n      0\n    ],\n    [\n      \"f13_p1_i\",\n      0,\n      \"f13_p1\",\n      0\n    ],\n    [\n      \"f13_p1\",\n      0,\n      \"f13_p1_m\",\n      0\n    ],\n    [\n      \"f13_p1_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rinit\",\n      0,\n      \"f13_p2_i\",\n      0\n    ],\n    [\n      \"f13_p2_i\",\n      0,\n      \"f13_p2\",\n      0\n    ],\n    [\n      \"f13_p2\",\n      0,\n      \"f13_p2_m\",\n      0\n    ],\n    [\n      \"f13_p2_m\",\n      0,\n      \"f13_stov\",\n      0\n    ],\n    [\n      \"f13_rtov\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-58",
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
            "obj-58",
            1
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
            "obj-58",
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
            "obj-58",
            1
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
            "obj-72",
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
            "obj-72",
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
            "obj-72",
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
            "obj-75",
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
            "obj-76",
            0
          ],
          "source": [
            "obj-72",
            1
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
            "obj-86",
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
            "obj-86",
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
            1
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
            "obj-88",
            0
          ],
          "source": [
            "obj-86",
            1
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
            "obj-98",
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
            "obj-98",
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
            1
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
            "obj-101",
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
            "obj-102",
            0
          ],
          "source": [
            "obj-98",
            1
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
            "obj-112",
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
            "obj-112",
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
            "obj-115",
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
            "obj-116",
            0
          ],
          "source": [
            "obj-112",
            1
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
            "obj-126",
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
            "obj-124",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-126",
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
            "obj-126",
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
            "obj-129",
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
            "obj-130",
            0
          ],
          "source": [
            "obj-126",
            1
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
            "obj-140",
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
            "obj-138",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-140",
            1
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
            "obj-140",
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
            "obj-143",
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
            "obj-144",
            0
          ],
          "source": [
            "obj-140",
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
            "obj-154",
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
            "obj-152",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-154",
            1
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
            "obj-154",
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
            "obj-154",
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
            "obj-154",
            1
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
            "obj-168",
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
            "obj-168",
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
            1
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
            "obj-168",
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
            1
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
            1
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
            "obj-181",
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
            "obj-182",
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
            "obj-185",
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
            "obj-187",
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
            "obj-186",
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
            "obj-191",
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
            "obj-194",
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
            "obj-186",
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
            "obj-185",
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
      },
      {
        "patchline": {
          "destination": [
            "obj-198",
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
            "obj-186",
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
            "obj-179",
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
            "obj-200",
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
            "obj-201",
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
            "obj-211",
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
            "obj-211",
            1
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
            1
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
            "obj-213",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-211",
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
            "obj-211",
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
            "obj-218",
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
            "obj-223",
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
            "obj-224",
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
            "obj-226",
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
            "obj-218",
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
            "obj-227",
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
            "obj-218",
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
            "obj-211",
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
            "obj-232",
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
            "obj-233",
            0
          ],
          "source": [
            "obj-211",
            1
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
            "obj-243",
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
            1
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
            "obj-244",
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
            1
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
            "obj-243",
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
            "obj-243",
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
            "obj-251",
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
            "obj-252",
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
            "obj-254",
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
            "obj-250",
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
            "obj-255",
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
            "obj-250",
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
            "obj-260",
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
            "obj-262",
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
            "obj-263",
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
            "obj-243",
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
            "obj-243",
            1
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
            "obj-269",
            2
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
            "obj-269",
            3
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
            "obj-269",
            4
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
            "obj-269",
            5
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
            "obj-269",
            6
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
            "obj-269",
            7
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
            "obj-269",
            8
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
            "obj-269",
            9
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
            "obj-269",
            10
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
            "obj-269",
            11
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
            "obj-269",
            12
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
            "obj-269",
            13
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
            "obj-284",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-284",
            2
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
            "obj-284",
            3
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
            "obj-284",
            4
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
            "obj-284",
            5
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
            "obj-284",
            6
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
            "obj-284",
            7
          ],
          "source": [
            "obj-291",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-284",
            8
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
            "obj-284",
            9
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
            "obj-284",
            10
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
            "obj-284",
            11
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
            "obj-284",
            12
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
            "obj-284",
            13
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
            "obj-307",
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
            "obj-305",
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
            "obj-308",
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
            "obj-309",
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
            "obj-306",
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
            "obj-310",
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
            "obj-308",
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
            "obj-310",
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
            "obj-311",
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
            "obj-309",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-311",
            1
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
            1
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
            "obj-312",
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
            1
          ],
          "source": [
            "obj-311",
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
            "obj-318",
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
            "obj-319",
            0
          ],
          "source": [
            "obj-317",
            1
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
            "obj-322",
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
            "obj-323",
            0
          ],
          "source": [
            "obj-321",
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
