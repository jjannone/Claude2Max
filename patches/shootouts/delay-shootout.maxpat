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
      852.0
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
          "text": "DELAY SHOOTOUT \u2014 delay lines: Ableton delays, BEAP modules, Max for Live devices and Apple's AudioUnit delay. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          ],
          "data": {
            "clips": [
              {
                "absolutepath": "/Users/johnjannone/Library/CloudStorage/Dropbox-JohnJannone/john jannone/_Dropbox Drive/Sample Libraries/YURT/AntonioSanchezV2_WAV/Loops/Varied Double Time Feel Straight 8ths 165bpm/GrooveA_DblTime_165_2.wav",
                "filename": "GrooveA_DblTime_165_2.wav",
                "filekind": "audiofile",
                "id": "u686001082",
                "loop": 1,
                "content_state": {
                  "loop": 1
                }
              }
            ]
          },
          "saved_attribute_attributes": {
            "candicane2": {
              "expression": ""
            },
            "candicane3": {
              "expression": ""
            },
            "candicane4": {
              "expression": ""
            },
            "candicane5": {
              "expression": ""
            },
            "candicane6": {
              "expression": ""
            },
            "candicane7": {
              "expression": ""
            },
            "candicane8": {
              "expression": ""
            }
          }
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 14, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
            303.0
          ],
          "num_lines_patching": 14,
          "num_lines_presentation": 14,
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
                "2 abl delay~",
                "3 abl echo~",
                "4 abl spectraltime~",
                "5 BEAP Feedback Delay",
                "6 BEAP Sync Delay",
                "7 amxd Tapped Delay",
                "8 amxd DelayTaps",
                "9 amxd DelayMultiBand",
                "10 amxd Space Echo",
                "11 amxd SpectralDelay",
                "12 amxd Pitch & Echo",
                "13 amxd Feedback Network",
                "14 AU Delay"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 13,
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
            272.0,
            22.0
          ],
          "text": "v8 fx-shootout-highlight.js @embed 1",
          "filename": "fx-shootout-highlight.js",
          "textfile": {
            "filename": "fx-shootout-highlight.js",
            "flags": 0,
            "embed": 1,
            "autowatch": 1,
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
            634.0,
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
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            683.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "1"
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            683.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-42",
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
          "text": "2 \u00b7 abl delay~",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            244.0,
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
          "id": "obj-43",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            683.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            244.0,
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
          "id": "obj-44",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            520.0,
            643.0,
            20.0
          ],
          "text": "2 \u00b7 abl.device.delay~ \u2014 Live's Delay device (ableton-dsp package); delay is in seconds"
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
          "id": "obj-46",
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
          "id": "obj-47",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            854.0,
            419.0,
            22.0
          ],
          "text": "abl.device.delay~ @mix 1. @delay 0.25 0.375 @feedback 0.4",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            672.0,
            244.0,
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
            160.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            430.0,
            244.0,
            22.0
          ],
          "attr": "delay",
          "text_width": 82.0
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
            180.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            478.0,
            244.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            200.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            502.0,
            244.0,
            22.0
          ],
          "attr": "pingpong",
          "text_width": 82.0
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
            220.0,
            668.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            526.0,
            244.0,
            22.0
          ],
          "attr": "filter",
          "text_width": 82.0
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
            240.0,
            694.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            550.0,
            244.0,
            22.0
          ],
          "attr": "filter_frequency",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-53",
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
            574.0,
            244.0,
            22.0
          ],
          "attr": "filter_width",
          "text_width": 82.0
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
            280.0,
            746.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            598.0,
            244.0,
            22.0
          ],
          "attr": "modtime",
          "text_width": 82.0
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
            300.0,
            772.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            622.0,
            244.0,
            22.0
          ],
          "attr": "modfreq",
          "text_width": 82.0
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
            320.0,
            798.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            646.0,
            244.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            30.0,
            899.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            120.0,
            899.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
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
            510.0,
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
            510.0,
            580.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            1526.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
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
            1526.0,
            580.0,
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
            2520.0,
            86.0,
            118.0,
            20.0
          ],
          "text": "3 \u00b7 abl echo~",
          "presentation": 1,
          "presentation_rect": [
            286.0,
            406.0,
            244.0,
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
          "id": "obj-64",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1526.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            406.0,
            244.0,
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
          "id": "obj-65",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            823.0,
            520.0,
            693.0,
            20.0
          ],
          "text": "3 \u00b7 abl.device.echo~ \u2014 Live's Echo device (modulation delay with reverb); delay is in seconds"
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
            823.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            903.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            823.0,
            828.0,
            496.0,
            22.0
          ],
          "text": "abl.device.echo~ @mix 1. @delay 0.25 0.375 @feedback 0.4 @reverb 0.5",
          "presentation": 1,
          "presentation_rect": [
            286.0,
            648.0,
            216.0,
            50.0
          ],
          "presentation_linecount": 3
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
            953.0,
            590.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            430.0,
            244.0,
            22.0
          ],
          "attr": "delay",
          "text_width": 82.0
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
            973.0,
            616.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            478.0,
            244.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            993.0,
            642.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            502.0,
            244.0,
            22.0
          ],
          "attr": "mod_delay",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1013.0,
            668.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            526.0,
            244.0,
            22.0
          ],
          "attr": "mod_freq",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1033.0,
            694.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            550.0,
            244.0,
            22.0
          ],
          "attr": "reverb",
          "text_width": 82.0
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
            1053.0,
            720.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            574.0,
            244.0,
            22.0
          ],
          "attr": "width",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1073.0,
            746.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            598.0,
            244.0,
            22.0
          ],
          "attr": "channel_mode",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1093.0,
            772.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            286.0,
            622.0,
            244.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            823.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
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
            913.0,
            873.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1283.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1283.0,
            580.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            784.0,
            1029.0,
            40.0,
            22.0
          ],
          "text": "3"
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
            784.0,
            1059.0,
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
            2520.0,
            112.0,
            186.0,
            20.0
          ],
          "text": "4 \u00b7 abl spectraltime~",
          "presentation": 1,
          "presentation_rect": [
            554.0,
            406.0,
            244.0,
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
          "id": "obj-84",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            784.0,
            999.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            406.0,
            244.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            999.0,
            744.0,
            20.0
          ],
          "text": "4 \u00b7 abl.device.spectraltime~ \u2014 Live's Spectral Time (spectral delay / freeze); delay_time in seconds"
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
            30.0,
            1029.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            1029.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            1307.0,
            559.0,
            22.0
          ],
          "text": "abl.device.spectraltime~ @mix 1. @delay_mix 1. @delay_time 0.25 @feedback 0.4",
          "presentation": 1,
          "presentation_rect": [
            554.0,
            672.0,
            244.0,
            50.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            160.0,
            1069.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            430.0,
            244.0,
            22.0
          ],
          "attr": "delay_time",
          "text_width": 82.0
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            1095.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            478.0,
            244.0,
            22.0
          ],
          "attr": "feedback",
          "text_width": 82.0
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
            220.0,
            1147.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            526.0,
            244.0,
            22.0
          ],
          "attr": "freeze",
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
            240.0,
            1173.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            550.0,
            244.0,
            22.0
          ],
          "attr": "spray",
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
            260.0,
            1199.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            574.0,
            244.0,
            22.0
          ],
          "attr": "shift",
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
            280.0,
            1225.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            598.0,
            244.0,
            22.0
          ],
          "attr": "tilt",
          "text_width": 82.0
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
            300.0,
            1251.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            622.0,
            244.0,
            22.0
          ],
          "attr": "resolution",
          "text_width": 82.0
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
            320.0,
            1277.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            646.0,
            244.0,
            22.0
          ],
          "attr": "mix",
          "text_width": 82.0
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
            1352.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
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
            120.0,
            1352.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            490.0,
            1029.0,
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
            490.0,
            1059.0,
            62.0,
            22.0
          ],
          "text": "mix 1."
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
            1584.0,
            1029.0,
            40.0,
            22.0
          ],
          "text": "4"
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
            1584.0,
            1059.0,
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
            2520.0,
            138.0,
            203.0,
            20.0
          ],
          "text": "5 \u00b7 BEAP Feedback Delay",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            406.0,
            279.0,
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
          "id": "obj-104",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1584.0,
            999.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            406.0,
            279.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            924.0,
            999.0,
            650.0,
            20.0
          ],
          "text": "5 \u00b7 bp.Feedback Delay \u2014 BEAP module, mono, Mix dial; Feedback dial set to -6 dB on load"
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
            924.0,
            1029.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "bpatcher",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            924.0,
            1069.0,
            279.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            822.0,
            430.0,
            279.0,
            116.0
          ],
          "varname": "FX_FBDELAY",
          "comment": "in 0: signal | out 0: signal",
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
          "embed": 1,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 5,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              40.0,
              79.0,
              775.0,
              639.0
            ],
            "openinpresentation": 1,
            "statusbarvisible": 1,
            "boxes": [
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 9.0,
                  "id": "obj-14",
                  "linecount": 5,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    436.173828,
                    67.907501,
                    407.0,
                    57.0
                  ],
                  "text": "changes 2015-02-12:\n- fixed strange behaviour of LPF / HPF dials (sent 0 values, caused filter crash)\n- logic to keep HPF freq below HPF freq in p filter (otherwise cascade~ crashes)\n- wet output to mix after filter (otherwise first delay was without filtering)\n- feedback after filter, not after tapout~ (otherwise no delay with feedback set to 0)"
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
                  "fgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
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
                    807.828979,
                    641.797852,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    225.78897094726562,
                    43.20896530151367,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "fgdialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        100.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Mix[1]",
                      "parameter_mmax": 100.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "Mix",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Mix"
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
                  "appearance": 1,
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "fgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
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
                    146.143219,
                    301.067871,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    61.177757263183594,
                    43.20896530151367,
                    58.322242736816406,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "fgdialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_exponent": 0.5,
                      "parameter_initial": [
                        -72.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Feedback[1]",
                      "parameter_mmax": 0.0,
                      "parameter_mmin": -72.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "Feedback",
                      "parameter_type": 0,
                      "parameter_unitstyle": 4
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Feedback"
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
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "fgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "id": "obj-25",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    598.781311,
                    553.910889,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    171.46673583984375,
                    43.20896530151367,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "fgdialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_exponent": 2.0,
                      "parameter_initial": [
                        20000.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "LPF[1]",
                      "parameter_mmax": 20000.0,
                      "parameter_mmin": 20.0,
                      "parameter_modmax": 20000.0,
                      "parameter_modmin": 20.0,
                      "parameter_modmode": 4,
                      "parameter_shortname": "LPF",
                      "parameter_type": 0,
                      "parameter_unitstyle": 3
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "LPF"
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
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "fgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "id": "obj-21",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    485.781311,
                    553.910889,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    119.5,
                    43.20896530151367,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "fgdialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_exponent": 5.0,
                      "parameter_initial": [
                        20.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "HPF[1]",
                      "parameter_mmax": 20000.0,
                      "parameter_mmin": 20.0,
                      "parameter_modmax": 20000.0,
                      "parameter_modmin": 20.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "HPF",
                      "parameter_type": 0,
                      "parameter_unitstyle": 3
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "HPF"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-2",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    39.173828,
                    98.0,
                    154.0,
                    33.0
                  ],
                  "text": "## Mono feedback delay ##"
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
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "fgdialcolor": [
                    0.65098,
                    0.666667,
                    0.662745,
                    1.0
                  ],
                  "id": "obj-9",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    372.781311,
                    338.910889,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.5,
                    43.20896530151367,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "fgdialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_enum": [
                        "whole",
                        "1/2",
                        "1/4",
                        "1/8",
                        "1/16",
                        "1/32",
                        "--",
                        "1/2 dotted",
                        "1/4 dotted",
                        "1/8 dotted",
                        "1/16 dotted",
                        "1/32 dotted",
                        "--",
                        "1/2 triplet",
                        "1/4 triplet",
                        "1/8 triplet",
                        "1/16 triplet",
                        "1/32 triplet"
                      ],
                      "parameter_initial": [
                        200.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "time",
                      "parameter_mmax": 2000.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "Time",
                      "parameter_type": 0,
                      "parameter_unitstyle": 2
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "time"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-23",
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
                    39.173828,
                    132.0,
                    87.5,
                    22.0
                  ],
                  "restore": {
                    "Feedback": [
                      -12.06617822859966
                    ],
                    "HPF": [
                      20.0
                    ],
                    "LPF": [
                      20000.0
                    ],
                    "Mix": [
                      100.0
                    ],
                    "bypass": [
                      0.0
                    ],
                    "time": [
                      200.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u205009630"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    208.380157,
                    829.0,
                    36.0,
                    22.0
                  ],
                  "text": "*~ 5."
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
                    "int"
                  ],
                  "patching_rect": [
                    115.880157,
                    809.754272,
                    32.5,
                    22.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    115.880157,
                    864.754272,
                    204.0,
                    22.0
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
                  "id": "obj-7",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    115.880157,
                    764.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    221.78897094726562,
                    20.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "activebgoncolor": {
                      "expression": ""
                    },
                    "activetextcolor": {
                      "expression": ""
                    },
                    "activetextoncolor": {
                      "expression": ""
                    },
                    "bgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "textcolor": {
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
                      "parameter_initial_enable": 1,
                      "parameter_longname": "bypass[1]",
                      "parameter_mmax": 1,
                      "parameter_modmode": 0,
                      "parameter_shortname": "bypass",
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
                  "varname": "bypass"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-10",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    115.880157,
                    910.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-24",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    300.880157,
                    119.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    218.6698,
                    224.533264,
                    37.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 5,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "signal"
                  ],
                  "patching_rect": [
                    699.828979,
                    701.297852,
                    127.0,
                    20.0
                  ],
                  "text": "M4L.bal2~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-519",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    146.143219,
                    363.335205,
                    36.0,
                    20.0
                  ],
                  "text": "dbtoa"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-958",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 1,
                      "revision": 5,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "box",
                    "rect": [
                      266.0,
                      155.0,
                      1212.0,
                      645.0
                    ],
                    "statusbarvisible": 1,
                    "boxes": [
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            352.0,
                            112.0,
                            38.0,
                            20.0
                          ],
                          "text": "- 100"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 9.0,
                          "id": "obj-9",
                          "linecount": 3,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            247.0,
                            140.0,
                            150.0,
                            38.0
                          ],
                          "text": "make sure lower freq is always 100Hz below upper freq; otherwise cascade~ crashes"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-7",
                          "maxclass": "button",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            317.214294,
                            96.0,
                            20.0,
                            20.0
                          ]
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
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            174.714279,
                            140.0,
                            64.0,
                            20.0
                          ],
                          "text": "minimum"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            174.714279,
                            190.0,
                            305.0,
                            20.0
                          ],
                          "text": "pak f f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 13.0,
                          "id": "obj-1",
                          "linecount": 3,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "dictionary"
                          ],
                          "patching_rect": [
                            174.714279,
                            335.0,
                            183.0,
                            51.0
                          ],
                          "text": "filterdesign @order 4 @response bandpass @frequency 4000. 10000."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "format": 6,
                          "id": "obj-15",
                          "maxclass": "flonum",
                          "maximum": 30000.0,
                          "minimum": 10.0,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            174.714279,
                            96.0,
                            50.0,
                            20.0
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
                            174.714279,
                            244.0,
                            97.0,
                            32.0
                          ],
                          "text": "frequency $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "maxclass": "number",
                          "maximum": 30000,
                          "minimum": 10,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            460.714203,
                            96.0,
                            50.0,
                            20.0
                          ]
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
                            26.0,
                            551.0,
                            298.0,
                            20.0
                          ],
                          "text": "cascade~"
                        }
                      },
                      {
                        "box": {
                          "comment": "high pass \u0192",
                          "id": "obj-55",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            174.714279,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "low pass \u0192",
                          "id": "obj-52",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            460.714203,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-41",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            27.0,
                            726.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "signal",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            26.0,
                            19.0,
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
                            "obj-3",
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
                            "obj-5",
                            0
                          ],
                          "source": [
                            "obj-18",
                            0
                          ],
                          "watchpoint_flags": 1,
                          "watchpoint_id": 3
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-18",
                            1
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
                            "obj-6",
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
                            "obj-7",
                            0
                          ],
                          "order": 2,
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
                            0
                          ],
                          "source": [
                            "obj-3",
                            0
                          ],
                          "watchpoint_flags": 1,
                          "watchpoint_id": 4
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-4",
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
                            "obj-41",
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
                            "obj-1",
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
                            "obj-2",
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
                            "obj-15",
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
                            "obj-3",
                            0
                          ],
                          "source": [
                            "obj-7",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    372.781311,
                    631.798462,
                    245.0,
                    20.0
                  ],
                  "text": "p filter"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-896",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    101.617096,
                    398.910889,
                    63.526123,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-906",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    372.781311,
                    420.885498,
                    70.0,
                    20.0
                  ],
                  "text": "tapout~ 125."
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-908",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "tapconnect"
                  ],
                  "patching_rect": [
                    218.6698,
                    365.910889,
                    66.0,
                    20.0
                  ],
                  "text": "tapin~ 4000"
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
                    153.099976,
                    910.754272,
                    38.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    97.0,
                    33.0,
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
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    353.307373,
                    119.754272,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
                    33.0,
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
                    39.173828,
                    67.907501,
                    93.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    93.0,
                    17.0
                  ],
                  "text": "FEEDBACK DELAY",
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
                    39.173828,
                    48.529999,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    37.0,
                    283.0,
                    60.338157653808594
                  ],
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
                    83.854248,
                    48.529999,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    17.0,
                    283.0,
                    80.3381576538086
                  ],
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
                    128.534668,
                    48.529999,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    0.0,
                    283.0,
                    133.0
                  ],
                  "rounded": 0
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-11",
                    4
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
                    "obj-12",
                    0
                  ],
                  "midpoints": [
                    709.328979,
                    750.526123,
                    217.880157,
                    750.526123
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
                    "obj-5",
                    1
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
                    "obj-958",
                    1
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
                    "obj-5",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-24",
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
                  "midpoints": [
                    310.380157,
                    181.143799,
                    228.1698,
                    181.143799
                  ],
                  "order": 1,
                  "source": [
                    "obj-24",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-958",
                    2
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
                    "obj-519",
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
                    "obj-5",
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
                    "obj-10",
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
                    "obj-896",
                    1
                  ],
                  "source": [
                    "obj-519",
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
                  "midpoints": [
                    228.1698,
                    283.526123,
                    709.328979,
                    283.526123
                  ],
                  "order": 0,
                  "source": [
                    "obj-6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-908",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-6",
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
                    "obj-7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-908",
                    0
                  ],
                  "midpoints": [
                    111.117096,
                    426.0,
                    204.0,
                    426.0,
                    204.0,
                    360.0,
                    228.1698,
                    360.0
                  ],
                  "source": [
                    "obj-896",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-906",
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
                    "obj-958",
                    0
                  ],
                  "source": [
                    "obj-906",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-906",
                    0
                  ],
                  "midpoints": [
                    228.1698,
                    402.898193,
                    382.281311,
                    402.898193
                  ],
                  "source": [
                    "obj-908",
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
                  "midpoints": [
                    382.281311,
                    668.091553,
                    763.328979,
                    668.091553
                  ],
                  "order": 0,
                  "source": [
                    "obj-958",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-896",
                    0
                  ],
                  "midpoints": [
                    382.281311,
                    658.0,
                    78.0,
                    658.0,
                    78.0,
                    382.0,
                    111.117096,
                    382.0
                  ],
                  "order": 1,
                  "source": [
                    "obj-958",
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
          }
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
            924.0,
            1220.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1143.0,
            1220.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
        }
      },
      {
        "box": {
          "id": "obj-110",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            822.0,
            552.0,
            279.0,
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
          "id": "obj-111",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1243.0,
            1029.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-112",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1243.0,
            1059.0,
            41.0,
            22.0
          ],
          "text": "100"
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
            1243.0,
            1089.0,
            216.0,
            22.0
          ],
          "text": "pattrforward FX_FBDELAY::Mix"
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
            924.0,
            1260.0,
            300.0,
            47.0
          ],
          "text": "Mix \u2192 100 on load (the dial's initial value inside the module) and on the wet-only button; the other dials come from the patch's Snapshot"
        }
      },
      {
        "box": {
          "id": "obj-115",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            668.0,
            1482.0,
            40.0,
            22.0
          ],
          "text": "5"
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
            668.0,
            1512.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            190.0,
            169.0,
            20.0
          ],
          "text": "6 \u00b7 BEAP Sync Delay",
          "presentation": 1,
          "presentation_rect": [
            1125.0,
            406.0,
            265.0,
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
          "id": "obj-118",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            668.0,
            1452.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1125.0,
            406.0,
            265.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1452.0,
            628.0,
            20.0
          ],
          "text": "6 \u00b7 bp.Sync Delay \u2014 BEAP module, stereo, note-value delays from the global transport"
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
            1482.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            1482.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-122",
          "maxclass": "bpatcher",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            1522.0,
            265.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1125.0,
            430.0,
            265.0,
            116.0
          ],
          "varname": "FX_SYNCDELAY",
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
          "embed": 1,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 5,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              173.0,
              349.0,
              815.0,
              662.0
            ],
            "openinpresentation": 1,
            "statusbarvisible": 1,
            "boxes": [
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
                    711.807373,
                    724.0,
                    31.0,
                    22.0
                  ],
                  "text": "+ 1."
                }
              },
              {
                "box": {
                  "id": "obj-45",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    563.807373,
                    762.0,
                    89.0,
                    22.0
                  ],
                  "text": "clip 20. 20000."
                }
              },
              {
                "box": {
                  "id": "obj-44",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    676.807373,
                    762.0,
                    89.0,
                    22.0
                  ],
                  "text": "clip 20. 20000."
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
                    495.333435,
                    724.0,
                    41.0,
                    22.0
                  ],
                  "text": "dbtoa"
                }
              },
              {
                "box": {
                  "id": "obj-14",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    29.0,
                    66.0,
                    298.0,
                    20.0
                  ],
                  "text": "## Stereo feedback delay, beat-synced to transport ##"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-23",
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
                    29.0,
                    101.254272,
                    59.5,
                    22.0
                  ],
                  "restore": {
                    "Feedback": [
                      -12.094488188976484
                    ],
                    "HPF": [
                      20.0
                    ],
                    "LPF": [
                      20000.0
                    ],
                    "Mix": [
                      100.0
                    ],
                    "bypass": [
                      0.0
                    ],
                    "delay_left": [
                      9.0
                    ],
                    "delay_right": [
                      3.0
                    ],
                    "durationl": [
                      13.0
                    ],
                    "durationr": [
                      13.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u549003714"
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
                    "signal"
                  ],
                  "patching_rect": [
                    752.380127,
                    1079.754272,
                    36.0,
                    22.0
                  ],
                  "text": "*~ 5."
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    290.380157,
                    1079.754272,
                    36.0,
                    22.0
                  ],
                  "text": "*~ 5."
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-25",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    658.880127,
                    1079.754272,
                    32.5,
                    22.0
                  ],
                  "text": "+ 1"
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
                    658.880127,
                    1116.754272,
                    204.0,
                    22.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-28",
                  "index": 2,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    658.880127,
                    1180.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-29",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    826.880127,
                    99.754272,
                    25.0,
                    25.0
                  ]
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
                    "int"
                  ],
                  "patching_rect": [
                    197.880157,
                    1079.754272,
                    32.5,
                    22.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    197.880157,
                    1134.754272,
                    204.0,
                    22.0
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
                  "id": "obj-7",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    197.880157,
                    1013.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    209.78897094726562,
                    20.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "activebgoncolor": {
                      "expression": ""
                    },
                    "activetextcolor": {
                      "expression": ""
                    },
                    "activetextoncolor": {
                      "expression": ""
                    },
                    "bgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "textcolor": {
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
                      "parameter_initial_enable": 1,
                      "parameter_longname": "bypass",
                      "parameter_mmax": 1,
                      "parameter_modmode": 0,
                      "parameter_shortname": "bypass",
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
                  "varname": "bypass"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-10",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    197.880157,
                    1180.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-24",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    365.880127,
                    99.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontface": 0,
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-1",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    693.0,
                    1180.754272,
                    20.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    242.78897094726562,
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
                  "fontface": 0,
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-2",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    862.53833,
                    99.754272,
                    20.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    242.78897094726562,
                    0.0,
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
                  "annotation": "Sets number of steps in the sequence.",
                  "appearance": 1,
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-50",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    676.807373,
                    656.910889,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    176.0,
                    43.20896530151367,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_exponent": 4.0,
                      "parameter_initial": [
                        20000
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "LPF",
                      "parameter_mmax": 20000.0,
                      "parameter_mmin": 20.0,
                      "parameter_modmax": 20000.0,
                      "parameter_modmin": 20.0,
                      "parameter_modmode": 4,
                      "parameter_shortname": "LPF",
                      "parameter_type": 0,
                      "parameter_unitstyle": 3
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "LPF"
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
                  "annotation": "Sets number of steps in the sequence.",
                  "appearance": 1,
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-49",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    563.807373,
                    656.910889,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    128.0,
                    43.20896530151367,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_exponent": 4.0,
                      "parameter_initial": [
                        20
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "HPF",
                      "parameter_mmax": 20000.0,
                      "parameter_mmin": 20.0,
                      "parameter_modmax": 20000.0,
                      "parameter_modmin": 20.0,
                      "parameter_modmode": 4,
                      "parameter_shortname": "HPF",
                      "parameter_type": 0,
                      "parameter_unitstyle": 3
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "HPF"
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
                  "annotation": "Sets number of steps in the sequence.",
                  "appearance": 1,
                  "dialcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-27",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    495.333435,
                    658.673218,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    80.27445983886719,
                    43.20896530151367,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "dialcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        16
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Feedback",
                      "parameter_mmax": 0.0,
                      "parameter_mmin": -96.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "Feedback",
                      "parameter_type": 0,
                      "parameter_unitstyle": 4
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Feedback"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    1126.885254,
                    274.533264,
                    37.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    318.6698,
                    266.533264,
                    37.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    0.0
                  ],
                  "annotation": "Delay time right",
                  "bordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "hltcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-9",
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
                    997.385254,
                    329.297791,
                    71.944458,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.001606941223145,
                    72.1454086303711,
                    67.01643371582031,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "hltcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_enum": [
                        "whole",
                        "1/2",
                        "1/4",
                        "1/8",
                        "1/16",
                        "1/32",
                        "--",
                        "1/2 dotted",
                        "1/4 dotted",
                        "1/8 dotted",
                        "1/16 dotted",
                        "1/32 dotted",
                        "--",
                        "1/2 triplet",
                        "1/4 triplet",
                        "1/8 triplet",
                        "1/16 triplet",
                        "1/32 triplet"
                      ],
                      "parameter_initial": [
                        3
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "delay_right",
                      "parameter_mmax": 17,
                      "parameter_modmode": 0,
                      "parameter_shortname": "delay_right",
                      "parameter_type": 2
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "delay_right"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.0,
                    0.0,
                    0.0,
                    0.0
                  ],
                  "annotation": "Delay time left",
                  "bordercolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "hltcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-96",
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
                    435.307373,
                    329.297791,
                    71.944458,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.001606941223145,
                    46.70896530151367,
                    67.01643371582031,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "hltcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_enum": [
                        "whole",
                        "1/2",
                        "1/4",
                        "1/8",
                        "1/16",
                        "1/32",
                        "--",
                        "1/2 dotted",
                        "1/4 dotted",
                        "1/8 dotted",
                        "1/16 dotted",
                        "1/32 dotted",
                        "--",
                        "1/2 triplet",
                        "1/4 triplet",
                        "1/8 triplet",
                        "1/16 triplet",
                        "1/32 triplet"
                      ],
                      "parameter_initial": [
                        9
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 1,
                      "parameter_longname": "delay_left",
                      "parameter_mmax": 17,
                      "parameter_modmode": 0,
                      "parameter_shortname": "delay_left",
                      "parameter_type": 2
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "delay_left"
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
                  "annotation": "Sets number of steps in the sequence.",
                  "id": "obj-118",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    1039.828979,
                    900.033325,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    217.78897094726562,
                    43.20896530151367,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "activedialcolor": {
                      "expression": ""
                    },
                    "activefgdialcolor": {
                      "expression": ""
                    },
                    "activeneedlecolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_initial": [
                        100.0
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_longname": "Mix",
                      "parameter_mmax": 100.0,
                      "parameter_modmode": 0,
                      "parameter_shortname": "Mix",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.6
                  ],
                  "varname": "Mix"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 5,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "signal"
                  ],
                  "patching_rect": [
                    931.828979,
                    971.297852,
                    127.0,
                    20.0
                  ],
                  "text": "M4L.bal2~"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-16",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    997.385254,
                    418.28595,
                    62.0,
                    20.0
                  ],
                  "text": "unpack i i i"
                }
              },
              {
                "box": {
                  "coll_data": {
                    "count": 16,
                    "data": [
                      {
                        "key": 0,
                        "value": [
                          1,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 1,
                        "value": [
                          4,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 2,
                        "value": [
                          7,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 3,
                        "value": [
                          10,
                          1,
                          2
                        ]
                      },
                      {
                        "key": 4,
                        "value": [
                          13,
                          1,
                          1
                        ]
                      },
                      {
                        "key": 5,
                        "value": [
                          16,
                          1,
                          0
                        ]
                      },
                      {
                        "key": 7,
                        "value": [
                          3,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 8,
                        "value": [
                          6,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 9,
                        "value": [
                          9,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 10,
                        "value": [
                          12,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 11,
                        "value": [
                          15,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 13,
                        "value": [
                          5,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 14,
                        "value": [
                          8,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 15,
                        "value": [
                          11,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 16,
                        "value": [
                          14,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 17,
                        "value": [
                          17,
                          0,
                          -1
                        ]
                      }
                    ]
                  },
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-17",
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
                    997.385254,
                    364.745422,
                    59.5,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "embed": 1,
                    "precision": 6
                  },
                  "text": "coll"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-124",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    435.307373,
                    418.28595,
                    62.0,
                    20.0
                  ],
                  "text": "unpack i i i"
                }
              },
              {
                "box": {
                  "coll_data": {
                    "count": 16,
                    "data": [
                      {
                        "key": 0,
                        "value": [
                          1,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 1,
                        "value": [
                          4,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 2,
                        "value": [
                          7,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 3,
                        "value": [
                          10,
                          1,
                          2
                        ]
                      },
                      {
                        "key": 4,
                        "value": [
                          13,
                          1,
                          1
                        ]
                      },
                      {
                        "key": 5,
                        "value": [
                          16,
                          1,
                          0
                        ]
                      },
                      {
                        "key": 7,
                        "value": [
                          3,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 8,
                        "value": [
                          6,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 9,
                        "value": [
                          9,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 10,
                        "value": [
                          12,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 11,
                        "value": [
                          15,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 13,
                        "value": [
                          5,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 14,
                        "value": [
                          8,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 15,
                        "value": [
                          11,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 16,
                        "value": [
                          14,
                          0,
                          -1
                        ]
                      },
                      {
                        "key": 17,
                        "value": [
                          17,
                          0,
                          -1
                        ]
                      }
                    ]
                  },
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-116",
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
                    435.307373,
                    364.745422,
                    59.5,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "embed": 1,
                    "precision": 6
                  },
                  "text": "coll"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "annotation": "",
                  "bordercolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "focusbordercolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "fontname": "Helvetica",
                  "fontsize": 24.0,
                  "hltcolor": [
                    0.862745,
                    0.207843,
                    0.133333,
                    0.0
                  ],
                  "id": "obj-708",
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
                    997.385254,
                    462.825867,
                    50.0,
                    27.0
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "hltcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "tricolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_enum": [
                        "1nd",
                        "1n",
                        "1nt",
                        "2nd",
                        "2n",
                        "2nt",
                        "4nd",
                        "4n",
                        "4nt",
                        "8nd",
                        "8n",
                        "8nt",
                        "16nd",
                        "16n",
                        "16nt",
                        "32nd",
                        "32n",
                        "32nt",
                        "64nd",
                        "64n",
                        "128nd",
                        "128n"
                      ],
                      "parameter_initial": [
                        13
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 2,
                      "parameter_longname": "duration.r",
                      "parameter_mmax": 21,
                      "parameter_modmode": 0,
                      "parameter_shortname": "duration.r",
                      "parameter_type": 2
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "tricolor": [
                    0.945098,
                    0.835294,
                    1.0,
                    0.47
                  ],
                  "varname": "durationr"
                }
              },
              {
                "box": {
                  "activebgcolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "annotation": "",
                  "bordercolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "focusbordercolor": [
                    0.164706,
                    0.172549,
                    0.168627,
                    0.0
                  ],
                  "fontname": "Helvetica",
                  "fontsize": 24.0,
                  "hltcolor": [
                    0.862745,
                    0.207843,
                    0.133333,
                    0.0
                  ],
                  "id": "obj-957",
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
                    435.307373,
                    462.825867,
                    50.0,
                    27.0
                  ],
                  "saved_attribute_attributes": {
                    "activebgcolor": {
                      "expression": ""
                    },
                    "bordercolor": {
                      "expression": ""
                    },
                    "focusbordercolor": {
                      "expression": ""
                    },
                    "hltcolor": {
                      "expression": ""
                    },
                    "textcolor": {
                      "expression": ""
                    },
                    "tricolor": {
                      "expression": ""
                    },
                    "valueof": {
                      "parameter_enum": [
                        "1nd",
                        "1n",
                        "1nt",
                        "2nd",
                        "2n",
                        "2nt",
                        "4nd",
                        "4n",
                        "4nt",
                        "8nd",
                        "8n",
                        "8nt",
                        "16nd",
                        "16n",
                        "16nt",
                        "32nd",
                        "32n",
                        "32nt",
                        "64nd",
                        "64n",
                        "128nd",
                        "128n"
                      ],
                      "parameter_initial": [
                        13
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_invisible": 2,
                      "parameter_longname": "duration.l",
                      "parameter_mmax": 21,
                      "parameter_modmode": 0,
                      "parameter_shortname": "duration.l",
                      "parameter_type": 2
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    1.0
                  ],
                  "tricolor": [
                    0.945098,
                    0.835294,
                    1.0,
                    0.47
                  ],
                  "varname": "durationl"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-176",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 1,
                      "revision": 5,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "box",
                    "rect": [
                      34.0,
                      129.0,
                      1212.0,
                      645.0
                    ],
                    "statusbarvisible": 1,
                    "boxes": [
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
                            150.0,
                            187.0,
                            305.0,
                            22.0
                          ],
                          "text": "pak f f"
                        }
                      },
                      {
                        "box": {
                          "fontface": 0,
                          "fontname": "Arial",
                          "fontsize": 13.0,
                          "id": "obj-16",
                          "linecount": 3,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "dictionary"
                          ],
                          "patching_rect": [
                            150.0,
                            332.0,
                            183.0,
                            52.0
                          ],
                          "text": "filterdesign @order 4 @response bandpass @frequency 4000. 10000."
                        }
                      },
                      {
                        "box": {
                          "format": 6,
                          "id": "obj-15",
                          "maxclass": "flonum",
                          "maximum": 30000.0,
                          "minimum": 10.0,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            150.0,
                            109.0,
                            50.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            150.0,
                            241.0,
                            97.0,
                            22.0
                          ],
                          "text": "frequency $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-24",
                          "maxclass": "number",
                          "maximum": 30000,
                          "minimum": 10,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            436.0,
                            109.0,
                            50.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "attr": "frequency",
                          "fontface": 0,
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "attrui",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            348.0,
                            267.0,
                            265.0,
                            22.0
                          ]
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
                            26.0,
                            551.0,
                            298.0,
                            22.0
                          ],
                          "text": "cascade~"
                        }
                      },
                      {
                        "box": {
                          "comment": "high pass \u0192",
                          "id": "obj-55",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            150.0,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "low pass \u0192",
                          "id": "obj-52",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            436.0,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-41",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            27.0,
                            726.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "signal",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            26.0,
                            19.0,
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
                            "obj-18",
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
                            "obj-4",
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
                            "obj-5",
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
                            "obj-18",
                            1
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
                            "obj-4",
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
                            "obj-41",
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
                            "obj-16",
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
                            "obj-24",
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
                            "obj-15",
                            0
                          ],
                          "source": [
                            "obj-55",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    1075.049194,
                    810.798462,
                    241.0,
                    20.0
                  ],
                  "text": "p filter"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-178",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1012.885254,
                    515.490417,
                    92.0,
                    20.0
                  ],
                  "text": "translate bbu ms"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-181",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    1075.049194,
                    756.516235,
                    55.0,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-188",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    1012.885254,
                    599.885498,
                    70.0,
                    20.0
                  ],
                  "text": "tapout~ 125."
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-190",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "tapconnect"
                  ],
                  "patching_rect": [
                    1126.885254,
                    553.910889,
                    66.0,
                    20.0
                  ],
                  "text": "tapin~ 4000"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-958",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 1,
                      "revision": 5,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "box",
                    "rect": [
                      84.0,
                      129.0,
                      930.0,
                      645.0
                    ],
                    "statusbarvisible": 1,
                    "boxes": [
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
                            174.714279,
                            172.0,
                            305.0,
                            22.0
                          ],
                          "text": "pak f f"
                        }
                      },
                      {
                        "box": {
                          "fontface": 0,
                          "fontname": "Arial",
                          "fontsize": 13.0,
                          "id": "obj-16",
                          "linecount": 3,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "dictionary"
                          ],
                          "patching_rect": [
                            174.714279,
                            317.0,
                            183.0,
                            52.0
                          ],
                          "text": "filterdesign @order 4 @response bandpass @frequency 4000. 10000."
                        }
                      },
                      {
                        "box": {
                          "format": 6,
                          "id": "obj-15",
                          "maxclass": "flonum",
                          "maximum": 30000.0,
                          "minimum": 10.0,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            174.714279,
                            94.0,
                            50.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            174.714279,
                            226.0,
                            97.0,
                            22.0
                          ],
                          "text": "frequency $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-24",
                          "maxclass": "number",
                          "maximum": 30000,
                          "minimum": 10,
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            460.714294,
                            94.0,
                            50.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontface": 0,
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
                            26.0,
                            415.0,
                            62.0,
                            22.0
                          ],
                          "text": "cascade~"
                        }
                      },
                      {
                        "box": {
                          "comment": "high pass \u0192",
                          "id": "obj-55",
                          "index": 2,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            174.714279,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "low pass \u0192",
                          "id": "obj-52",
                          "index": 3,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            460.714294,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-41",
                          "index": 1,
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            26.0,
                            469.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "signal",
                          "id": "obj-35",
                          "index": 1,
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "signal"
                          ],
                          "patching_rect": [
                            26.0,
                            19.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "attr": "frequency",
                          "fontface": 0,
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "attrui",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            385.714264,
                            239.0,
                            265.0,
                            22.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-18",
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
                            "obj-4",
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
                            "obj-5",
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
                            "obj-18",
                            1
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
                            "obj-4",
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
                            "obj-41",
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
                            "obj-16",
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
                            "obj-24",
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
                            "obj-15",
                            0
                          ],
                          "source": [
                            "obj-55",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    450.807373,
                    810.798462,
                    245.0,
                    20.0
                  ],
                  "text": "p filter"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-954",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    450.807373,
                    515.490417,
                    92.0,
                    20.0
                  ],
                  "text": "translate bbu ms"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-896",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    450.807373,
                    771.516235,
                    63.526123,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-906",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    450.807373,
                    599.885498,
                    70.0,
                    20.0
                  ],
                  "text": "tapout~ 125."
                }
              },
              {
                "box": {
                  "fontface": 1,
                  "fontname": "Arial",
                  "fontsize": 10.0,
                  "id": "obj-908",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "tapconnect"
                  ],
                  "patching_rect": [
                    318.6698,
                    553.910889,
                    66.0,
                    20.0
                  ],
                  "text": "tapin~ 4000"
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
                    239.0,
                    1180.754272,
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
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    399.538391,
                    99.754272,
                    19.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
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
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-13",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    29.0,
                    35.907501,
                    68.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    68.0,
                    17.0
                  ],
                  "text": "SYNC DELAY",
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
                    29.0,
                    22.711639,
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
                    73.337189,
                    22.711639,
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
                    116.079285,
                    22.711639,
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
                    "obj-12",
                    0
                  ],
                  "midpoints": [
                    941.328979,
                    1020.526123,
                    299.880157,
                    1020.526123
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
                    "obj-20",
                    0
                  ],
                  "midpoints": [
                    1049.328979,
                    1052.526123,
                    761.880127,
                    1052.526123
                  ],
                  "source": [
                    "obj-11",
                    1
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
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-11",
                    4
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
                    "obj-5",
                    1
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
                    "obj-957",
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
                    "obj-708",
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
                    "obj-190",
                    0
                  ],
                  "midpoints": [
                    1084.549194,
                    862.874756,
                    1341.800373,
                    862.874756,
                    1341.800373,
                    508.737488,
                    1136.385254,
                    508.737488
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
                    "obj-188",
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
                    "obj-176",
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
                    "obj-11",
                    3
                  ],
                  "order": 1,
                  "source": [
                    "obj-188",
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
                  "midpoints": [
                    1022.385254,
                    686.700928,
                    1084.549194,
                    686.700928
                  ],
                  "order": 0,
                  "source": [
                    "obj-188",
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
                  "midpoints": [
                    1136.385254,
                    586.398193,
                    1022.385254,
                    586.398193
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
                    "obj-26",
                    1
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
                    "obj-44",
                    1
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
                    "obj-11",
                    1
                  ],
                  "midpoints": [
                    1136.385254,
                    313.526123,
                    968.328979,
                    313.526123
                  ],
                  "order": 1,
                  "source": [
                    "obj-22",
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
                  "order": 0,
                  "source": [
                    "obj-22",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-5",
                    2
                  ],
                  "midpoints": [
                    375.380127,
                    629.254272,
                    392.380157,
                    629.254272
                  ],
                  "order": 0,
                  "source": [
                    "obj-24",
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
                  "midpoints": [
                    375.380127,
                    195.143799,
                    328.1698,
                    195.143799
                  ],
                  "order": 1,
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
                    "obj-25",
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
                    "obj-3",
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
                    "obj-22",
                    0
                  ],
                  "midpoints": [
                    836.380127,
                    256.283264,
                    1136.385254,
                    256.283264
                  ],
                  "order": 0,
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
                    2
                  ],
                  "midpoints": [
                    836.380127,
                    611.254272,
                    853.380127,
                    611.254272
                  ],
                  "order": 1,
                  "source": [
                    "obj-29",
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
                    "obj-896",
                    1
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
                    "obj-5",
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
                    "obj-176",
                    2
                  ],
                  "midpoints": [
                    686.307373,
                    789.354736,
                    1306.549194,
                    789.354736
                  ],
                  "order": 0,
                  "source": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-958",
                    2
                  ],
                  "order": 1,
                  "source": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-176",
                    1
                  ],
                  "midpoints": [
                    573.307373,
                    789.354736,
                    1195.549194,
                    789.354736
                  ],
                  "order": 0,
                  "source": [
                    "obj-45",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-958",
                    1
                  ],
                  "order": 1,
                  "source": [
                    "obj-45",
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
                    "obj-45",
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
                    "obj-10",
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
                    "obj-44",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-50",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-45",
                    2
                  ],
                  "order": 1,
                  "source": [
                    "obj-50",
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
                  "midpoints": [
                    328.1698,
                    305.526123,
                    941.328979,
                    305.526123
                  ],
                  "order": 0,
                  "source": [
                    "obj-6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-908",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-6",
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
                  "midpoints": [
                    207.380157,
                    1057.723022,
                    668.380127,
                    1057.723022
                  ],
                  "order": 0,
                  "source": [
                    "obj-7",
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
                    "obj-7",
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
                    "obj-708",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-958",
                    0
                  ],
                  "source": [
                    "obj-896",
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
                    "obj-9",
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
                  "midpoints": [
                    460.307373,
                    652.091553,
                    995.328979,
                    652.091553
                  ],
                  "order": 0,
                  "source": [
                    "obj-906",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-896",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-906",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-906",
                    0
                  ],
                  "midpoints": [
                    328.1698,
                    586.398193,
                    460.307373,
                    586.398193
                  ],
                  "source": [
                    "obj-908",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-906",
                    0
                  ],
                  "source": [
                    "obj-954",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-954",
                    0
                  ],
                  "source": [
                    "obj-957",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-908",
                    0
                  ],
                  "midpoints": [
                    460.307373,
                    870.79834,
                    269.501099,
                    870.79834,
                    269.501099,
                    518.414246,
                    328.1698,
                    518.414246
                  ],
                  "source": [
                    "obj-958",
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
                    "obj-96",
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
          }
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
            30.0,
            1673.0,
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
            235.0,
            1673.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            335.0,
            1482.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            335.0,
            1512.0,
            41.0,
            22.0
          ],
          "text": "100"
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
            335.0,
            1542.0,
            230.0,
            22.0
          ],
          "text": "pattrforward FX_SYNCDELAY::Mix"
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
            30.0,
            1713.0,
            300.0,
            47.0
          ],
          "text": "Mix \u2192 100 on load (the dial's initial value inside the module) and on the wet-only button; the other dials come from the patch's Snapshot"
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
            1518.0,
            1482.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            1518.0,
            1512.0,
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
            2520.0,
            216.0,
            186.0,
            20.0
          ],
          "text": "7 \u00b7 amxd Tapped Delay",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            750.0,
            370.0,
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
          "id": "obj-132",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1518.0,
            1452.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            750.0,
            370.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            808.0,
            1452.0,
            700.0,
            20.0
          ],
          "text": "7 \u00b7 amxd~ Tapped Delay.amxd \u2014 16 equally spaced taps with level and pan (Max for Live package)"
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
            808.0,
            1482.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            398.0,
            750.0,
            50.0,
            22.0
          ]
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
            878.0,
            1482.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            958.0,
            1482.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-137",
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
            808.0,
            1562.0,
            426.0,
            196.0
          ],
          "text": "amxd~ \"Tapped Delay.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            776.0,
            426.0,
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
          "varname": "DEV_07",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_07",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_07",
              "parameter_type": 3
            }
          }
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
            1108.0,
            1482.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-139",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1108.0,
            1522.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            808.0,
            1793.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            948.0,
            1793.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
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
            644.0,
            1923.0,
            40.0,
            22.0
          ],
          "text": "7"
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
            644.0,
            1953.0,
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
            2520.0,
            268.0,
            161.0,
            20.0
          ],
          "text": "8 \u00b7 amxd DelayTaps",
          "presentation": 1,
          "presentation_rect": [
            472.0,
            750.0,
            543.0,
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
          "id": "obj-145",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            644.0,
            1893.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            472.0,
            750.0,
            543.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            1893.0,
            604.0,
            20.0
          ],
          "text": "8 \u00b7 amxd~ Max DelayTaps.amxd \u2014 multi-tap delay, taps drawn as multislider shapes"
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
            30.0,
            1923.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1025.0,
            750.0,
            50.0,
            22.0
          ]
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
            100.0,
            1923.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1923.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-150",
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
            2003.0,
            599.0,
            196.0
          ],
          "text": "amxd~ \"Max DelayTaps.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            472.0,
            776.0,
            599.0,
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
          "varname": "DEV_08",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_08",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_08",
              "parameter_type": 3
            }
          }
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
            330.0,
            1923.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            330.0,
            1963.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            30.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
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
            170.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
        }
      },
      {
        "box": {
          "id": "obj-155",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1372.0,
            1923.0,
            40.0,
            22.0
          ],
          "text": "8"
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
            1372.0,
            1953.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            320.0,
            203.0,
            20.0
          ],
          "text": "9 \u00b7 amxd DelayMultiBand",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1026.0,
            335.0,
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
          "id": "obj-158",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1372.0,
            1893.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1026.0,
            335.0,
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
          "id": "obj-159",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            784.0,
            1893.0,
            578.0,
            20.0
          ],
          "text": "9 \u00b7 amxd~ Max DelayMultiBand.amxd \u2014 cascaded cross~ split, one delay per band"
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
            784.0,
            1923.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            363.0,
            1026.0,
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
            854.0,
            1923.0,
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
            934.0,
            1923.0,
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
            784.0,
            2003.0,
            391.0,
            196.0
          ],
          "text": "amxd~ \"Max DelayMultiBand.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1052.0,
            391.0,
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
          "varname": "DEV_09",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_09",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_09",
              "parameter_type": 3
            }
          }
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
            784.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
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
            924.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2093.0,
            1923.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            2093.0,
            1953.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            372.0,
            178.0,
            20.0
          ],
          "text": "10 \u00b7 amxd Space Echo",
          "presentation": 1,
          "presentation_rect": [
            437.0,
            1026.0,
            229.0,
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
          "id": "obj-169",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2093.0,
            1893.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            437.0,
            1026.0,
            229.0,
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
          "id": "obj-170",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1512.0,
            1893.0,
            571.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Space Echo.amxd \u2014 RE-201-style tape delay with warble and inertia"
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
            1512.0,
            1923.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            676.0,
            1026.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-172",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1582.0,
            1923.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1662.0,
            1923.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-174",
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
            1512.0,
            2003.0,
            285.0,
            196.0
          ],
          "text": "amxd~ \"Space Echo.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            437.0,
            1052.0,
            285.0,
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
          "varname": "DEV_10",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_10",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_10",
              "parameter_type": 3
            }
          }
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
            1812.0,
            1923.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-176",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1812.0,
            1963.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            1512.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1652.0,
            2234.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            564.0,
            2364.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            564.0,
            2394.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-181",
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
          "text": "11 \u00b7 amxd SpectralDelay",
          "presentation": 1,
          "presentation_rect": [
            750.0,
            1026.0,
            465.0,
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
          "id": "obj-182",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            564.0,
            2334.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            750.0,
            1026.0,
            465.0,
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
          "id": "obj-183",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2334.0,
            524.0,
            20.0
          ],
          "text": "11 \u00b7 amxd~ Max SpectralDelay.amxd \u2014 pfft~ per-bin delay"
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
            30.0,
            2364.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1225.0,
            1026.0,
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
            100.0,
            2364.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            2364.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-187",
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
            2444.0,
            521.0,
            196.0
          ],
          "text": "amxd~ \"Max SpectralDelay.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            750.0,
            1052.0,
            521.0,
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
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_11",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_11",
              "parameter_type": 3
            }
          }
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
            330.0,
            2364.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            330.0,
            2404.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            30.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
        }
      },
      {
        "box": {
          "id": "obj-191",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
        }
      },
      {
        "box": {
          "id": "obj-192",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1350.0,
            2364.0,
            40.0,
            22.0
          ],
          "text": "11"
        }
      },
      {
        "box": {
          "id": "obj-193",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1350.0,
            2394.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-194",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
            195.0,
            20.0
          ],
          "text": "12 \u00b7 amxd Pitch & Echo",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1302.0,
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
          "fontface": 1,
          "varname": "TITLE_12"
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1350.0,
            2334.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1302.0,
            274.0,
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
          "id": "obj-196",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            704.0,
            2334.0,
            636.0,
            20.0
          ],
          "text": "12 \u00b7 amxd~ Pitch & Echo.amxd \u2014 pitch transposer inside a delay line (harmonizer echo)"
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
            704.0,
            2364.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            302.0,
            1302.0,
            50.0,
            22.0
          ]
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
            774.0,
            2364.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            854.0,
            2364.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-200",
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
            704.0,
            2444.0,
            330.0,
            196.0
          ],
          "text": "amxd~ \"Pitch & Echo.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1328.0,
            330.0,
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
          "varname": "DEV_12",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_12",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_12",
              "parameter_type": 3
            }
          }
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
            1004.0,
            2364.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1004.0,
            2404.0,
            104.0,
            22.0
          ],
          "text": "Dry/Wet 100."
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
            704.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
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
            844.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
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
            2128.0,
            2364.0,
            40.0,
            22.0
          ],
          "text": "12"
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
            2128.0,
            2394.0,
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
            2520.0,
            528.0,
            229.0,
            20.0
          ],
          "text": "13 \u00b7 amxd Feedback Network",
          "presentation": 1,
          "presentation_rect": [
            376.0,
            1302.0,
            500.0,
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
            2128.0,
            2334.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            376.0,
            1302.0,
            500.0,
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1490.0,
            2334.0,
            628.0,
            20.0
          ],
          "text": "13 \u00b7 amxd~ Feedback Network.amxd \u2014 five bandpass + delay units cross-fed, randomised"
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
            1490.0,
            2364.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            886.0,
            1302.0,
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
            1560.0,
            2364.0,
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
            1640.0,
            2364.0,
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
            1490.0,
            2444.0,
            556.0,
            196.0
          ],
          "text": "amxd~ \"Feedback Network.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            376.0,
            1328.0,
            556.0,
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
          "varname": "DEV_13",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "DEV_13",
              "parameter_modmode": 0,
              "parameter_shortname": "DEV_13",
              "parameter_type": 3
            }
          }
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
            1790.0,
            2364.0,
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
            1790.0,
            2404.0,
            90.0,
            22.0
          ],
          "text": "wet/dry 1."
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
            1490.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_L"
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
            1630.0,
            2675.0,
            83.0,
            22.0
          ],
          "text": "s~ FX13_R"
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
            1495.0,
            2805.0,
            40.0,
            22.0
          ],
          "text": "13"
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
            1495.0,
            2835.0,
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
            2520.0,
            580.0,
            118.0,
            20.0
          ],
          "text": "14 \u00b7 AU Delay",
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1302.0,
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
          "id": "obj-221",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1495.0,
            2775.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1302.0,
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
          "id": "obj-222",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2775.0,
            1455.0,
            20.0
          ],
          "text": "14 \u00b7 vst~ + plug_au AUDelay \u2014 Apple's AudioUnit delay"
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
            30.0,
            2805.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            110.0,
            2805.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-225",
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
            3145.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1458.0,
            214.0,
            22.0
          ],
          "varname": "VST_14",
          "viewvisibility": 0,
          "border": 0,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_invisible": 1,
              "parameter_longname": "VST_14",
              "parameter_modmode": 0,
              "parameter_shortname": "VST_14",
              "parameter_type": 3
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-226",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            2805.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            2833.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            2875.0,
            125.0,
            22.0
          ],
          "text": "plug_au AUDelay"
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
            230.0,
            2875.0,
            97.0,
            22.0
          ],
          "text": "s AU14_INIT"
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
            470.0,
            2805.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1326.0,
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
            230.0,
            2915.0,
            97.0,
            22.0
          ],
          "text": "r AU14_INIT"
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
            230.0,
            3060.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST14"
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
            230.0,
            2955.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-234",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            2985.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1018.0,
            1326.0,
            22.0,
            22.0
          ]
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
            606.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            1044.0,
            1328.0,
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
          "id": "obj-236",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            3015.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
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
            473.0,
            2955.0,
            55.0,
            22.0
          ],
          "text": "0.125"
        }
      },
      {
        "box": {
          "id": "obj-238",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            473.0,
            2985.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1354.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            632.0,
            161.0,
            20.0
          ],
          "text": "delay time (0\u20132 s)",
          "presentation": 1,
          "presentation_rect": [
            1016.0,
            1356.0,
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
          "id": "obj-240",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            473.0,
            3015.0,
            125.0,
            22.0
          ],
          "text": "\"Delay Time\" $1"
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
            716.0,
            2955.0,
            62.0,
            22.0
          ],
          "text": "0.7503"
        }
      },
      {
        "box": {
          "id": "obj-242",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            716.0,
            2985.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1378.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            658.0,
            161.0,
            20.0
          ],
          "text": "feedback (\u00b199.9 %)",
          "presentation": 1,
          "presentation_rect": [
            1016.0,
            1380.0,
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
          "id": "obj-244",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            716.0,
            3015.0,
            97.0,
            22.0
          ],
          "text": "Feedback $1"
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
            959.0,
            2955.0,
            40.0,
            22.0
          ],
          "text": "1."
        }
      },
      {
        "box": {
          "id": "obj-246",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            959.0,
            2985.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1402.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            684.0,
            135.0,
            20.0
          ],
          "text": "dry/wet (\u2192 wet)",
          "presentation": 1,
          "presentation_rect": [
            1016.0,
            1404.0,
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
          "id": "obj-248",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            959.0,
            3015.0,
            132.0,
            22.0
          ],
          "text": "\"Dry/Wet Mix\" $1"
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
            1202.0,
            2955.0,
            62.0,
            22.0
          ],
          "text": "0.6801"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1202.0,
            2985.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            960.0,
            1426.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            195.0,
            20.0
          ],
          "text": "lowpass (10 Hz\u201322 kHz)",
          "presentation": 1,
          "presentation_rect": [
            1016.0,
            1428.0,
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
          "id": "obj-252",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1202.0,
            3015.0,
            223.0,
            22.0
          ],
          "text": "\"Lowpass Cutoff Frequency\" $1"
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
            110.0,
            3105.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST14"
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
            30.0,
            3195.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_L"
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
            120.0,
            3195.0,
            83.0,
            22.0
          ],
          "text": "s~ FX14_R"
        }
      },
      {
        "box": {
          "id": "obj-256",
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
            960.0,
            1486.0,
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
          "id": "obj-257",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3305.0,
            1200.0,
            20.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201314 are the effects"
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
            3365.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-259",
          "maxclass": "newobj",
          "numinlets": 15,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3415.0,
            209.0,
            22.0
          ],
          "text": "selector~ 14 1 @ramptime 30"
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
            30.0,
            3465.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            1110.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_L"
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
            1200.0,
            3365.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_L"
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
            30.0,
            3495.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-275",
          "maxclass": "newobj",
          "numinlets": 15,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3545.0,
            209.0,
            22.0
          ],
          "text": "selector~ 14 1 @ramptime 30"
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
            30.0,
            3595.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            1020.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            1110.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX13_R"
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
            1200.0,
            3495.0,
            83.0,
            22.0
          ],
          "text": "r~ FX14_R"
        }
      },
      {
        "box": {
          "id": "obj-290",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3645.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            3675.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            3675.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
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
            200.0,
            3675.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            3675.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            410.0,
            3675.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
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
            500.0,
            3675.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-297",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            3715.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-298",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            3715.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-299",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            3765.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-300",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            3765.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-301",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            3765.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-302",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            3765.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-303",
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
            3825.0,
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
          "orientation": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "live.gain~",
              "parameter_mmax": 6.0,
              "parameter_mmin": -70.0,
              "parameter_modmode": 0,
              "parameter_shortname": "live.gain~",
              "parameter_type": 0,
              "parameter_unitstyle": 4
            }
          },
          "varname": "live.gain~"
        }
      },
      {
        "box": {
          "id": "obj-304",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            3905.0,
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
          "id": "obj-305",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3645.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            3675.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-307",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            3715.0,
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
          "id": "obj-308",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            3755.0,
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
          "id": "obj-309",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            3795.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            3835.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            3835.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
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
            780.0,
            3875.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            930.0,
            3875.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-314",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            3915.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
        }
      },
      {
        "box": {
          "id": "obj-315",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            930.0,
            3915.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
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
          "id": "obj-317",
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
          "id": "obj-318",
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
          "id": "obj-319",
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
          "id": "obj-320",
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
          "id": "obj-321",
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
          "id": "obj-322",
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
          "id": "obj-323",
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
          "id": "obj-324",
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
          "id": "obj-325",
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
          "id": "obj-326",
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
          "id": "obj-327",
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
          "id": "obj-328",
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
          "id": "obj-329",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1074.0,
            169.0,
            20.0
          ],
          "text": "delay_time: seconds",
          "presentation": 1,
          "presentation_rect": [
            554.0,
            454.0,
            244.0,
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
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            1121.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            554.0,
            502.0,
            244.0,
            22.0
          ],
          "attr": "delay_mix",
          "text_width": 82.0
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
            1100.0,
            229.0,
            20.0
          ],
          "text": "delay: seconds, left right",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            454.0,
            244.0,
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
            1126.0,
            229.0,
            20.0
          ],
          "text": "delay: seconds, left right",
          "presentation": 1,
          "presentation_rect": [
            286.0,
            454.0,
            244.0,
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
          "id": "obj-333",
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
          "text": "TRANSPORT \u2014 the global transport; followed by: BEAP Sync Delay"
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
          "id": "obj-335",
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
          "id": "obj-336",
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
          "id": "obj-337",
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
          "id": "obj-338",
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
          "id": "obj-339",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1152.0,
            237.0,
            20.0
          ],
          "text": "TRANSPORT \u2014 BEAP Sync Delay",
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
          "id": "obj-340",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            1178.0,
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
          "id": "obj-341",
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
          "id": "obj-342",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            400.0,
            260.0,
            334.0
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
          "id": "obj-343",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            278.0,
            400.0,
            260.0,
            310.0
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
          "id": "obj-344",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            546.0,
            400.0,
            260.0,
            334.0
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
          "id": "obj-345",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            814.0,
            400.0,
            295.0,
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
          "id": "obj-346",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1117.0,
            400.0,
            281.0,
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
          "id": "obj-347",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            744.0,
            446.0,
            266.0
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
          "id": "obj-348",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            464.0,
            744.0,
            619.0,
            266.0
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
          "id": "obj-349",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1020.0,
            411.0,
            266.0
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
          "id": "obj-350",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            429.0,
            1020.0,
            305.0,
            266.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            742.0,
            1020.0,
            541.0,
            266.0
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
          "id": "obj-352",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1296.0,
            350.0,
            266.0
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
          "id": "obj-353",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            368.0,
            1296.0,
            576.0,
            266.0
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
          "id": "obj-354",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            3975.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            952.0,
            1296.0,
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
          "id": "obj-355",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            940.0,
            3975.0,
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
          "id": "obj-356",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            3975.0,
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
            4035.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 852,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"DELAY SHOOTOUT \\u2014 delay lines: Ableton delays, BEAP modules, Max for Live devices and Apple's AudioUnit delay. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ],\n      \"attrs\": {\n        \"data\": {\n          \"clips\": [\n            {\n              \"absolutepath\": \"/Users/johnjannone/Library/CloudStorage/Dropbox-JohnJannone/john jannone/_Dropbox Drive/Sample Libraries/YURT/AntonioSanchezV2_WAV/Loops/Varied Double Time Feel Straight 8ths 165bpm/GrooveA_DblTime_165_2.wav\",\n              \"filename\": \"GrooveA_DblTime_165_2.wav\",\n              \"filekind\": \"audiofile\",\n              \"id\": \"u686001082\",\n              \"loop\": 1,\n              \"content_state\": {\n                \"loop\": 1\n              }\n            }\n          ]\n        },\n        \"saved_attribute_attributes\": {\n          \"candicane2\": {\n            \"expression\": \"\"\n          },\n          \"candicane3\": {\n            \"expression\": \"\"\n          },\n          \"candicane4\": {\n            \"expression\": \"\"\n          },\n          \"candicane5\": {\n            \"expression\": \"\"\n          },\n          \"candicane6\": {\n            \"expression\": \"\"\n          },\n          \"candicane7\": {\n            \"expression\": \"\"\n          },\n          \"candicane8\": {\n            \"expression\": \"\"\n          }\n        }\n      }\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 14, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        303\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 14,\n        \"num_lines_presentation\": 14,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 abl delay~\",\n              \"3 abl echo~\",\n              \"4 abl spectraltime~\",\n              \"5 BEAP Feedback Delay\",\n              \"6 BEAP Sync Delay\",\n              \"7 amxd Tapped Delay\",\n              \"8 amxd DelayTaps\",\n              \"9 amxd DelayMultiBand\",\n              \"10 amxd Space Echo\",\n              \"11 amxd SpectralDelay\",\n              \"12 amxd Pitch & Echo\",\n              \"13 amxd Feedback Network\",\n              \"14 AU Delay\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 13,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 14,\n        \"num_lines_presentation\": 14,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"filename\": \"fx-shootout-highlight.js\",\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"embed\": 1,\n          \"autowatch\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch. It needs no arguments: it finds the\\n// panes itself by probing for comments named TITLE_02, TITLE_03, \\u2026 until\\n// one is missing. Optional box arguments override that:\\n//\\n//     v8 fx-shootout-highlight.js [<lastslot> [<rows> <cols>]]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;          // slot 1 is DRY and has no pane\\nvar ARG_LAST = 0, ARG_ROWS = 0, ARG_COLS = 0;   // 0 = not given, probe instead\\nif (typeof jsarguments !== \\\"undefined\\\" && jsarguments.length > 1) {\\n    ARG_LAST = parseInt(jsarguments[1], 10) || 0;\\n    if (jsarguments.length > 3) {\\n        ARG_ROWS = parseInt(jsarguments[2], 10) || 0;\\n        ARG_COLS = parseInt(jsarguments[3], 10) || 0;\\n    }\\n}\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nvar reported = false;\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction title(n) { return this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n)); }\\n\\nfunction lastSlot() {\\n    if (ARG_LAST) return ARG_LAST;\\n    var n = FIRST_SLOT;\\n    while (title(n)) n++;\\n    return n - 1;\\n}\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var last = lastSlot();\\n    var rows = ARG_ROWS || last, cols = ARG_COLS || 1;\\n    var row = Math.floor(index / cols), col = index % cols;\\n    var slot = col * rows + row + 1;\\n    if (!reported) {\\n        post(\\\"fx-shootout-highlight: \\\" + (last - FIRST_SLOT + 1) + \\\" panes (TITLE_02 \\u2026 TITLE_\\\" + pad2(last) + \\\"), \\\"\\n             + rows + \\\" rows \\u00d7 \\\" + cols + \\\" cols\\\\n\\\");\\n        reported = true;\\n    }\\n    for (var n = FIRST_SLOT; n <= last; n++) {\\n        var obj = title(n);\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        }\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        634,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        683,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        683,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 abl delay~\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        18,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        683,\n        520\n      ],\n      \"presentation\": [\n        18,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 abl.device.delay~ \\u2014 Live's Delay device (ableton-dsp package); delay is in seconds\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        643,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.delay~ @mix 1. @delay 0.25 0.375 @feedback 0.4\",\n      \"pos\": [\n        30,\n        854\n      ],\n      \"presentation\": [\n        18,\n        672,\n        244,\n        35\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f02_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"delay\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        430,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"delay\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        478,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"pingpong\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        502,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"pingpong\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"filter\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        526,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"filter\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"filter_frequency\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        550,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"filter_frequency\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        720\n      ],\n      \"attrs\": {\n        \"attr\": \"filter_width\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        574,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"filter_width\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        746\n      ],\n      \"attrs\": {\n        \"attr\": \"modtime\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        598,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"modtime\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        300,\n        772\n      ],\n      \"attrs\": {\n        \"attr\": \"modfreq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        622,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"modfreq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c8\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        320,\n        798\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        18,\n        646,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        899\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        899\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        510,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        510,\n        580\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1526,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1526,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 abl echo~\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        286,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1526,\n        520\n      ],\n      \"presentation\": [\n        286,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 abl.device.echo~ \\u2014 Live's Echo device (modulation delay with reverb); delay is in seconds\",\n      \"pos\": [\n        823,\n        520\n      ],\n      \"size\": [\n        693,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        823,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        903,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.echo~ @mix 1. @delay 0.25 0.375 @feedback 0.4 @reverb 0.5\",\n      \"pos\": [\n        823,\n        828\n      ],\n      \"presentation\": [\n        286,\n        648,\n        216,\n        50\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 5,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f03_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        953,\n        590\n      ],\n      \"attrs\": {\n        \"attr\": \"delay\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        430,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"delay\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        973,\n        616\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        478,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        993,\n        642\n      ],\n      \"attrs\": {\n        \"attr\": \"mod_delay\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        502,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mod_delay\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1013,\n        668\n      ],\n      \"attrs\": {\n        \"attr\": \"mod_freq\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        526,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mod_freq\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1033,\n        694\n      ],\n      \"attrs\": {\n        \"attr\": \"reverb\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        550,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"reverb\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1053,\n        720\n      ],\n      \"attrs\": {\n        \"attr\": \"width\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        574,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"width\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1073,\n        746\n      ],\n      \"attrs\": {\n        \"attr\": \"channel_mode\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        598,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"channel_mode\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        1093,\n        772\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        286,\n        622,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        823,\n        873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        913,\n        873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1283,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        1283,\n        580\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        784,\n        1029\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        784,\n        1059\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 abl spectraltime~\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        554,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        784,\n        999\n      ],\n      \"presentation\": [\n        554,\n        406,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 abl.device.spectraltime~ \\u2014 Live's Spectral Time (spectral delay / freeze); delay_time in seconds\",\n      \"pos\": [\n        30,\n        999\n      ],\n      \"size\": [\n        744,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.spectraltime~ @mix 1. @delay_mix 1. @delay_time 0.25 @feedback 0.4\",\n      \"pos\": [\n        30,\n        1307\n      ],\n      \"presentation\": [\n        554,\n        672,\n        244,\n        50\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"f04_c0\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        160,\n        1069\n      ],\n      \"attrs\": {\n        \"attr\": \"delay_time\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        430,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"delay_time\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c1\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        180,\n        1095\n      ],\n      \"attrs\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        478,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"feedback\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        220,\n        1147\n      ],\n      \"attrs\": {\n        \"attr\": \"freeze\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        526,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"freeze\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        240,\n        1173\n      ],\n      \"attrs\": {\n        \"attr\": \"spray\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        550,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"spray\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        260,\n        1199\n      ],\n      \"attrs\": {\n        \"attr\": \"shift\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        574,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"shift\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        280,\n        1225\n      ],\n      \"attrs\": {\n        \"attr\": \"tilt\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        598,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"tilt\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        300,\n        1251\n      ],\n      \"attrs\": {\n        \"attr\": \"resolution\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        622,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"resolution\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_c7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        320,\n        1277\n      ],\n      \"attrs\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        646,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        30,\n        1352\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        120,\n        1352\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        490,\n        1029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_wet\": {\n      \"type\": \"message\",\n      \"text\": \"mix 1.\",\n      \"pos\": [\n        490,\n        1059\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        1584,\n        1029\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1584,\n        1059\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 BEAP Feedback Delay\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        822,\n        406,\n        279,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1584,\n        999\n      ],\n      \"presentation\": [\n        822,\n        406,\n        279,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 bp.Feedback Delay \\u2014 BEAP module, mono, Mix dial; Feedback dial set to -6 dB on load\",\n      \"pos\": [\n        924,\n        999\n      ],\n      \"size\": [\n        650,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        924,\n        1029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        924,\n        1069\n      ],\n      \"size\": [\n        279,\n        116\n      ],\n      \"presentation\": [\n        822,\n        430,\n        279,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_FBDELAY\",\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 9,\n          \"minor\": 1,\n          \"revision\": 5,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          40.0,\n          79.0,\n          775.0,\n          639.0\n        ],\n        \"openinpresentation\": 1,\n        \"statusbarvisible\": 1,\n        \"boxes\": [\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-14\",\n              \"linecount\": 5,\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                436.173828,\n                67.907501,\n                407.0,\n                57.0\n              ],\n              \"text\": \"changes 2015-02-12:\\n- fixed strange behaviour of LPF / HPF dials (sent 0 values, caused filter crash)\\n- logic to keep HPF freq below HPF freq in p filter (otherwise cascade~ crashes)\\n- wet output to mix after filter (otherwise first delay was without filtering)\\n- feedback after filter, not after tapout~ (otherwise no delay with feedback set to 0)\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"fgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"id\": \"obj-1\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                807.828979,\n                641.797852,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                225.78897094726562,\n                43.20896530151367,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"fgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    100.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Mix[1]\",\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"Mix\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Mix\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"appearance\": 1,\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"fgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"id\": \"obj-28\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                146.143219,\n                301.067871,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                61.177757263183594,\n                43.20896530151367,\n                58.322242736816406,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"fgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_exponent\": 0.5,\n                  \"parameter_initial\": [\n                    -72.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Feedback[1]\",\n                  \"parameter_mmax\": 0.0,\n                  \"parameter_mmin\": -72.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"Feedback\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 4\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Feedback\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"fgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"id\": \"obj-25\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                598.781311,\n                553.910889,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                171.46673583984375,\n                43.20896530151367,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"fgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_exponent\": 2.0,\n                  \"parameter_initial\": [\n                    20000.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"LPF[1]\",\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_mmin\": 20.0,\n                  \"parameter_modmax\": 20000.0,\n                  \"parameter_modmin\": 20.0,\n                  \"parameter_modmode\": 4,\n                  \"parameter_shortname\": \"LPF\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"LPF\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"fgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"id\": \"obj-21\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                485.781311,\n                553.910889,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                119.5,\n                43.20896530151367,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"fgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_exponent\": 5.0,\n                  \"parameter_initial\": [\n                    20.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"HPF[1]\",\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_mmin\": 20.0,\n                  \"parameter_modmax\": 20000.0,\n                  \"parameter_modmin\": 20.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"HPF\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"HPF\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-2\",\n              \"linecount\": 2,\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                39.173828,\n                98.0,\n                154.0,\n                33.0\n              ],\n              \"text\": \"## Mono feedback delay ##\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"\",\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"fgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"id\": \"obj-9\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                372.781311,\n                338.910889,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.5,\n                43.20896530151367,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"fgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"whole\",\n                    \"1/2\",\n                    \"1/4\",\n                    \"1/8\",\n                    \"1/16\",\n                    \"1/32\",\n                    \"--\",\n                    \"1/2 dotted\",\n                    \"1/4 dotted\",\n                    \"1/8 dotted\",\n                    \"1/16 dotted\",\n                    \"1/32 dotted\",\n                    \"--\",\n                    \"1/2 triplet\",\n                    \"1/4 triplet\",\n                    \"1/8 triplet\",\n                    \"1/16 triplet\",\n                    \"1/32 triplet\"\n                  ],\n                  \"parameter_initial\": [\n                    200.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"time\",\n                  \"parameter_mmax\": 2000.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"Time\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 2\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"time\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-23\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                39.173828,\n                132.0,\n                87.5,\n                22.0\n              ],\n              \"restore\": {\n                \"Feedback\": [\n                  -12.06617822859966\n                ],\n                \"HPF\": [\n                  20.0\n                ],\n                \"LPF\": [\n                  20000.0\n                ],\n                \"Mix\": [\n                  100.0\n                ],\n                \"bypass\": [\n                  0.0\n                ],\n                \"time\": [\n                  200.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u205009630\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-12\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                208.380157,\n                829.0,\n                36.0,\n                22.0\n              ],\n              \"text\": \"*~ 5.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                115.880157,\n                809.754272,\n                32.5,\n                22.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                115.880157,\n                864.754272,\n                204.0,\n                22.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-7\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                115.880157,\n                764.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                221.78897094726562,\n                20.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activebgoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"bgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_defer\": 1,\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"bypass[1]\",\n                  \"parameter_mmax\": 1,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"bypass\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-10\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                115.880157,\n                910.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-24\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                300.880157,\n                119.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                218.6698,\n                224.533264,\n                37.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 5,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                699.828979,\n                701.297852,\n                127.0,\n                20.0\n              ],\n              \"text\": \"M4L.bal2~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-519\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                146.143219,\n                363.335205,\n                36.0,\n                20.0\n              ],\n              \"text\": \"dbtoa\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-958\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 9,\n                  \"minor\": 1,\n                  \"revision\": 5,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  266.0,\n                  155.0,\n                  1212.0,\n                  645.0\n                ],\n                \"statusbarvisible\": 1,\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-6\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"int\"\n                      ],\n                      \"patching_rect\": [\n                        352.0,\n                        112.0,\n                        38.0,\n                        20.0\n                      ],\n                      \"text\": \"- 100\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 9.0,\n                      \"id\": \"obj-9\",\n                      \"linecount\": 3,\n                      \"maxclass\": \"comment\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        247.0,\n                        140.0,\n                        150.0,\n                        38.0\n                      ],\n                      \"text\": \"make sure lower freq is always 100Hz below upper freq; otherwise cascade~ crashes\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-7\",\n                      \"maxclass\": \"button\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        317.214294,\n                        96.0,\n                        20.0,\n                        20.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-3\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"int\",\n                        \"int\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        140.0,\n                        64.0,\n                        20.0\n                      ],\n                      \"text\": \"minimum\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        190.0,\n                        305.0,\n                        20.0\n                      ],\n                      \"text\": \"pak f f\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 13.0,\n                      \"id\": \"obj-1\",\n                      \"linecount\": 3,\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"dictionary\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        335.0,\n                        183.0,\n                        51.0\n                      ],\n                      \"text\": \"filterdesign @order 4 @response bandpass @frequency 4000. 10000.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"format\": 6,\n                      \"id\": \"obj-15\",\n                      \"maxclass\": \"flonum\",\n                      \"maximum\": 30000.0,\n                      \"minimum\": 10.0,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        174.714279,\n                        96.0,\n                        50.0,\n                        20.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        244.0,\n                        97.0,\n                        32.0\n                      ],\n                      \"text\": \"frequency $1 $2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-2\",\n                      \"maxclass\": \"number\",\n                      \"maximum\": 30000,\n                      \"minimum\": 10,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        460.714203,\n                        96.0,\n                        50.0,\n                        20.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        551.0,\n                        298.0,\n                        20.0\n                      ],\n                      \"text\": \"cascade~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"high pass \\u0192\",\n                      \"id\": \"obj-55\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"low pass \\u0192\",\n                      \"id\": \"obj-52\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        460.714203,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-41\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        27.0,\n                        726.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"signal\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-1\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-15\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"watchpoint_flags\": 1,\n                      \"watchpoint_id\": 3\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        1\n                      ],\n                      \"order\": 0,\n                      \"source\": [\n                        \"obj-2\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-6\",\n                        0\n                      ],\n                      \"order\": 1,\n                      \"source\": [\n                        \"obj-2\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-7\",\n                        0\n                      ],\n                      \"order\": 2,\n                      \"source\": [\n                        \"obj-2\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"watchpoint_flags\": 1,\n                      \"watchpoint_id\": 4\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-35\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-41\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-4\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-1\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-2\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-52\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-55\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-6\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-3\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-7\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                372.781311,\n                631.798462,\n                245.0,\n                20.0\n              ],\n              \"text\": \"p filter\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-896\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                101.617096,\n                398.910889,\n                63.526123,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-906\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                372.781311,\n                420.885498,\n                70.0,\n                20.0\n              ],\n              \"text\": \"tapout~ 125.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-908\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"tapconnect\"\n              ],\n              \"patching_rect\": [\n                218.6698,\n                365.910889,\n                66.0,\n                20.0\n              ],\n              \"text\": \"tapin~ 4000\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                153.099976,\n                910.754272,\n                38.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                33.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                353.307373,\n                119.754272,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                33.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                39.173828,\n                67.907501,\n                93.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                93.0,\n                17.0\n              ],\n              \"text\": \"FEEDBACK DELAY\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                39.173828,\n                48.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                283.0,\n                60.338157653808594\n              ],\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                83.854248,\n                48.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                283.0,\n                80.3381576538086\n              ],\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                128.534668,\n                48.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                283.0,\n                133.0\n              ],\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                4\n              ],\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-12\",\n                0\n              ],\n              \"midpoints\": [\n                709.328979,\n                750.526123,\n                217.880157,\n                750.526123\n              ],\n              \"source\": [\n                \"obj-11\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                1\n              ],\n              \"source\": [\n                \"obj-12\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                1\n              ],\n              \"source\": [\n                \"obj-21\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-6\",\n                0\n              ],\n              \"midpoints\": [\n                310.380157,\n                181.143799,\n                228.1698,\n                181.143799\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                2\n              ],\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-519\",\n                0\n              ],\n              \"source\": [\n                \"obj-28\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                0\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-896\",\n                1\n              ],\n              \"source\": [\n                \"obj-519\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                0\n              ],\n              \"midpoints\": [\n                228.1698,\n                283.526123,\n                709.328979,\n                283.526123\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-6\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-908\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-6\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-908\",\n                0\n              ],\n              \"midpoints\": [\n                111.117096,\n                426.0,\n                204.0,\n                426.0,\n                204.0,\n                360.0,\n                228.1698,\n                360.0\n              ],\n              \"source\": [\n                \"obj-896\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-906\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                0\n              ],\n              \"source\": [\n                \"obj-906\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-906\",\n                0\n              ],\n              \"midpoints\": [\n                228.1698,\n                402.898193,\n                382.281311,\n                402.898193\n              ],\n              \"source\": [\n                \"obj-908\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                2\n              ],\n              \"midpoints\": [\n                382.281311,\n                668.091553,\n                763.328979,\n                668.091553\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-958\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-896\",\n                0\n              ],\n              \"midpoints\": [\n                382.281311,\n                658.0,\n                78.0,\n                658.0,\n                78.0,\n                382.0,\n                111.117096,\n                382.0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-958\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        924,\n        1220\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        1143,\n        1220\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        822,\n        552,\n        279,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1243,\n        1029\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_wet\": {\n      \"type\": \"message\",\n      \"text\": \"100\",\n      \"pos\": [\n        1243,\n        1059\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_fwd\": {\n      \"type\": \"newobj\",\n      \"text\": \"pattrforward FX_FBDELAY::Mix\",\n      \"pos\": [\n        1243,\n        1089\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_wnote\": {\n      \"type\": \"comment\",\n      \"text\": \"Mix \\u2192 100 on load (the dial's initial value inside the module) and on the wet-only button; the other dials come from the patch's Snapshot\",\n      \"pos\": [\n        924,\n        1260\n      ],\n      \"size\": [\n        300,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        668,\n        1482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        668,\n        1512\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 BEAP Sync Delay\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        1125,\n        406,\n        265,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        668,\n        1452\n      ],\n      \"presentation\": [\n        1125,\n        406,\n        265,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 bp.Sync Delay \\u2014 BEAP module, stereo, note-value delays from the global transport\",\n      \"pos\": [\n        30,\n        1452\n      ],\n      \"size\": [\n        628,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        1522\n      ],\n      \"size\": [\n        265,\n        116\n      ],\n      \"presentation\": [\n        1125,\n        430,\n        265,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_SYNCDELAY\",\n        \"comment\": \"in 0: signal | in 1: signal | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 9,\n          \"minor\": 1,\n          \"revision\": 5,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          173.0,\n          349.0,\n          815.0,\n          662.0\n        ],\n        \"openinpresentation\": 1,\n        \"statusbarvisible\": 1,\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-21\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                711.807373,\n                724.0,\n                31.0,\n                22.0\n              ],\n              \"text\": \"+ 1.\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-45\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                563.807373,\n                762.0,\n                89.0,\n                22.0\n              ],\n              \"text\": \"clip 20. 20000.\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-44\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                676.807373,\n                762.0,\n                89.0,\n                22.0\n              ],\n              \"text\": \"clip 20. 20000.\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-3\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                495.333435,\n                724.0,\n                41.0,\n                22.0\n              ],\n              \"text\": \"dbtoa\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-14\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                29.0,\n                66.0,\n                298.0,\n                20.0\n              ],\n              \"text\": \"## Stereo feedback delay, beat-synced to transport ##\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-23\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                29.0,\n                101.254272,\n                59.5,\n                22.0\n              ],\n              \"restore\": {\n                \"Feedback\": [\n                  -12.094488188976484\n                ],\n                \"HPF\": [\n                  20.0\n                ],\n                \"LPF\": [\n                  20000.0\n                ],\n                \"Mix\": [\n                  100.0\n                ],\n                \"bypass\": [\n                  0.0\n                ],\n                \"delay_left\": [\n                  9.0\n                ],\n                \"delay_right\": [\n                  3.0\n                ],\n                \"durationl\": [\n                  13.0\n                ],\n                \"durationr\": [\n                  13.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u549003714\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-20\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                752.380127,\n                1079.754272,\n                36.0,\n                22.0\n              ],\n              \"text\": \"*~ 5.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-12\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                290.380157,\n                1079.754272,\n                36.0,\n                22.0\n              ],\n              \"text\": \"*~ 5.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-25\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                658.880127,\n                1079.754272,\n                32.5,\n                22.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-26\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                658.880127,\n                1116.754272,\n                204.0,\n                22.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-28\",\n              \"index\": 2,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                658.880127,\n                1180.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-29\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                826.880127,\n                99.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-4\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                197.880157,\n                1079.754272,\n                32.5,\n                22.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                197.880157,\n                1134.754272,\n                204.0,\n                22.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-7\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                197.880157,\n                1013.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                209.78897094726562,\n                20.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activebgoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activetextoncolor\": {\n                  \"expression\": \"\"\n                },\n                \"bgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_defer\": 1,\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"bypass\",\n                  \"parameter_mmax\": 1,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"bypass\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-10\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                197.880157,\n                1180.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-24\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                365.880127,\n                99.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-1\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                693.0,\n                1180.754272,\n                20.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                242.78897094726562,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"R\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 0,\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-2\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                862.53833,\n                99.754272,\n                20.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                242.78897094726562,\n                0.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"R\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"textjustification\": 2\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"Sets number of steps in the sequence.\",\n              \"appearance\": 1,\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-50\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                676.807373,\n                656.910889,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                176.0,\n                43.20896530151367,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_initial\": [\n                    20000\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"LPF\",\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_mmin\": 20.0,\n                  \"parameter_modmax\": 20000.0,\n                  \"parameter_modmin\": 20.0,\n                  \"parameter_modmode\": 4,\n                  \"parameter_shortname\": \"LPF\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"LPF\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"Sets number of steps in the sequence.\",\n              \"appearance\": 1,\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-49\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                563.807373,\n                656.910889,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                128.0,\n                43.20896530151367,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_exponent\": 4.0,\n                  \"parameter_initial\": [\n                    20\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"HPF\",\n                  \"parameter_mmax\": 20000.0,\n                  \"parameter_mmin\": 20.0,\n                  \"parameter_modmax\": 20000.0,\n                  \"parameter_modmin\": 20.0,\n                  \"parameter_modmode\": 4,\n                  \"parameter_shortname\": \"HPF\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 3\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"HPF\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"Sets number of steps in the sequence.\",\n              \"appearance\": 1,\n              \"dialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-27\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                495.333435,\n                658.673218,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                80.27445983886719,\n                43.20896530151367,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"dialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    16\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Feedback\",\n                  \"parameter_mmax\": 0.0,\n                  \"parameter_mmin\": -96.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"Feedback\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 4\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Feedback\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                1126.885254,\n                274.533264,\n                37.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                318.6698,\n                266.533264,\n                37.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                0.0\n              ],\n              \"annotation\": \"Delay time right\",\n              \"bordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"hltcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-9\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                997.385254,\n                329.297791,\n                71.944458,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                8.001606941223145,\n                72.1454086303711,\n                67.01643371582031,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"hltcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"whole\",\n                    \"1/2\",\n                    \"1/4\",\n                    \"1/8\",\n                    \"1/16\",\n                    \"1/32\",\n                    \"--\",\n                    \"1/2 dotted\",\n                    \"1/4 dotted\",\n                    \"1/8 dotted\",\n                    \"1/16 dotted\",\n                    \"1/32 dotted\",\n                    \"--\",\n                    \"1/2 triplet\",\n                    \"1/4 triplet\",\n                    \"1/8 triplet\",\n                    \"1/16 triplet\",\n                    \"1/32 triplet\"\n                  ],\n                  \"parameter_initial\": [\n                    3\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"delay_right\",\n                  \"parameter_mmax\": 17,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"delay_right\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"delay_right\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                0.0\n              ],\n              \"annotation\": \"Delay time left\",\n              \"bordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"hltcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-96\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                435.307373,\n                329.297791,\n                71.944458,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                8.001606941223145,\n                46.70896530151367,\n                67.01643371582031,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"hltcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"whole\",\n                    \"1/2\",\n                    \"1/4\",\n                    \"1/8\",\n                    \"1/16\",\n                    \"1/32\",\n                    \"--\",\n                    \"1/2 dotted\",\n                    \"1/4 dotted\",\n                    \"1/8 dotted\",\n                    \"1/16 dotted\",\n                    \"1/32 dotted\",\n                    \"--\",\n                    \"1/2 triplet\",\n                    \"1/4 triplet\",\n                    \"1/8 triplet\",\n                    \"1/16 triplet\",\n                    \"1/32 triplet\"\n                  ],\n                  \"parameter_initial\": [\n                    9\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 1,\n                  \"parameter_longname\": \"delay_left\",\n                  \"parameter_mmax\": 17,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"delay_left\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"delay_left\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.4\n              ],\n              \"annotation\": \"Sets number of steps in the sequence.\",\n              \"id\": \"obj-118\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                1039.828979,\n                900.033325,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                217.78897094726562,\n                43.20896530151367,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activedialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activefgdialcolor\": {\n                  \"expression\": \"\"\n                },\n                \"activeneedlecolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    100.0\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_longname\": \"Mix\",\n                  \"parameter_mmax\": 100.0,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"Mix\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.6\n              ],\n              \"varname\": \"Mix\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 5,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                931.828979,\n                971.297852,\n                127.0,\n                20.0\n              ],\n              \"text\": \"M4L.bal2~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-16\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"int\",\n                \"int\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                997.385254,\n                418.28595,\n                62.0,\n                20.0\n              ],\n              \"text\": \"unpack i i i\"\n            }\n          },\n          {\n            \"box\": {\n              \"coll_data\": {\n                \"count\": 16,\n                \"data\": [\n                  {\n                    \"key\": 0,\n                    \"value\": [\n                      1,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 1,\n                    \"value\": [\n                      4,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 2,\n                    \"value\": [\n                      7,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 3,\n                    \"value\": [\n                      10,\n                      1,\n                      2\n                    ]\n                  },\n                  {\n                    \"key\": 4,\n                    \"value\": [\n                      13,\n                      1,\n                      1\n                    ]\n                  },\n                  {\n                    \"key\": 5,\n                    \"value\": [\n                      16,\n                      1,\n                      0\n                    ]\n                  },\n                  {\n                    \"key\": 7,\n                    \"value\": [\n                      3,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 8,\n                    \"value\": [\n                      6,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 9,\n                    \"value\": [\n                      9,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 10,\n                    \"value\": [\n                      12,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 11,\n                    \"value\": [\n                      15,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 13,\n                    \"value\": [\n                      5,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 14,\n                    \"value\": [\n                      8,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 15,\n                    \"value\": [\n                      11,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 16,\n                    \"value\": [\n                      14,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 17,\n                    \"value\": [\n                      17,\n                      0,\n                      -1\n                    ]\n                  }\n                ]\n              },\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-17\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                997.385254,\n                364.745422,\n                59.5,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"embed\": 1,\n                \"precision\": 6\n              },\n              \"text\": \"coll\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-124\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"int\",\n                \"int\",\n                \"int\"\n              ],\n              \"patching_rect\": [\n                435.307373,\n                418.28595,\n                62.0,\n                20.0\n              ],\n              \"text\": \"unpack i i i\"\n            }\n          },\n          {\n            \"box\": {\n              \"coll_data\": {\n                \"count\": 16,\n                \"data\": [\n                  {\n                    \"key\": 0,\n                    \"value\": [\n                      1,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 1,\n                    \"value\": [\n                      4,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 2,\n                    \"value\": [\n                      7,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 3,\n                    \"value\": [\n                      10,\n                      1,\n                      2\n                    ]\n                  },\n                  {\n                    \"key\": 4,\n                    \"value\": [\n                      13,\n                      1,\n                      1\n                    ]\n                  },\n                  {\n                    \"key\": 5,\n                    \"value\": [\n                      16,\n                      1,\n                      0\n                    ]\n                  },\n                  {\n                    \"key\": 7,\n                    \"value\": [\n                      3,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 8,\n                    \"value\": [\n                      6,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 9,\n                    \"value\": [\n                      9,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 10,\n                    \"value\": [\n                      12,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 11,\n                    \"value\": [\n                      15,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 13,\n                    \"value\": [\n                      5,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 14,\n                    \"value\": [\n                      8,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 15,\n                    \"value\": [\n                      11,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 16,\n                    \"value\": [\n                      14,\n                      0,\n                      -1\n                    ]\n                  },\n                  {\n                    \"key\": 17,\n                    \"value\": [\n                      17,\n                      0,\n                      -1\n                    ]\n                  }\n                ]\n              },\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-116\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                435.307373,\n                364.745422,\n                59.5,\n                20.0\n              ],\n              \"saved_object_attributes\": {\n                \"embed\": 1,\n                \"precision\": 6\n              },\n              \"text\": \"coll\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"annotation\": \"\",\n              \"bordercolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"focusbordercolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"fontname\": \"Helvetica\",\n              \"fontsize\": 24.0,\n              \"hltcolor\": [\n                0.862745,\n                0.207843,\n                0.133333,\n                0.0\n              ],\n              \"id\": \"obj-708\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                997.385254,\n                462.825867,\n                50.0,\n                27.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"hltcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"tricolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"1nd\",\n                    \"1n\",\n                    \"1nt\",\n                    \"2nd\",\n                    \"2n\",\n                    \"2nt\",\n                    \"4nd\",\n                    \"4n\",\n                    \"4nt\",\n                    \"8nd\",\n                    \"8n\",\n                    \"8nt\",\n                    \"16nd\",\n                    \"16n\",\n                    \"16nt\",\n                    \"32nd\",\n                    \"32n\",\n                    \"32nt\",\n                    \"64nd\",\n                    \"64n\",\n                    \"128nd\",\n                    \"128n\"\n                  ],\n                  \"parameter_initial\": [\n                    13\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 2,\n                  \"parameter_longname\": \"duration.r\",\n                  \"parameter_mmax\": 21,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"duration.r\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"tricolor\": [\n                0.945098,\n                0.835294,\n                1.0,\n                0.47\n              ],\n              \"varname\": \"durationr\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"annotation\": \"\",\n              \"bordercolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"focusbordercolor\": [\n                0.164706,\n                0.172549,\n                0.168627,\n                0.0\n              ],\n              \"fontname\": \"Helvetica\",\n              \"fontsize\": 24.0,\n              \"hltcolor\": [\n                0.862745,\n                0.207843,\n                0.133333,\n                0.0\n              ],\n              \"id\": \"obj-957\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                435.307373,\n                462.825867,\n                50.0,\n                27.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"activebgcolor\": {\n                  \"expression\": \"\"\n                },\n                \"bordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"focusbordercolor\": {\n                  \"expression\": \"\"\n                },\n                \"hltcolor\": {\n                  \"expression\": \"\"\n                },\n                \"textcolor\": {\n                  \"expression\": \"\"\n                },\n                \"tricolor\": {\n                  \"expression\": \"\"\n                },\n                \"valueof\": {\n                  \"parameter_enum\": [\n                    \"1nd\",\n                    \"1n\",\n                    \"1nt\",\n                    \"2nd\",\n                    \"2n\",\n                    \"2nt\",\n                    \"4nd\",\n                    \"4n\",\n                    \"4nt\",\n                    \"8nd\",\n                    \"8n\",\n                    \"8nt\",\n                    \"16nd\",\n                    \"16n\",\n                    \"16nt\",\n                    \"32nd\",\n                    \"32n\",\n                    \"32nt\",\n                    \"64nd\",\n                    \"64n\",\n                    \"128nd\",\n                    \"128n\"\n                  ],\n                  \"parameter_initial\": [\n                    13\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_invisible\": 2,\n                  \"parameter_longname\": \"duration.l\",\n                  \"parameter_mmax\": 21,\n                  \"parameter_modmode\": 0,\n                  \"parameter_shortname\": \"duration.l\",\n                  \"parameter_type\": 2\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"tricolor\": [\n                0.945098,\n                0.835294,\n                1.0,\n                0.47\n              ],\n              \"varname\": \"durationl\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-176\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 9,\n                  \"minor\": 1,\n                  \"revision\": 5,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  34.0,\n                  129.0,\n                  1212.0,\n                  645.0\n                ],\n                \"statusbarvisible\": 1,\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        150.0,\n                        187.0,\n                        305.0,\n                        22.0\n                      ],\n                      \"text\": \"pak f f\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 13.0,\n                      \"id\": \"obj-16\",\n                      \"linecount\": 3,\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"dictionary\"\n                      ],\n                      \"patching_rect\": [\n                        150.0,\n                        332.0,\n                        183.0,\n                        52.0\n                      ],\n                      \"text\": \"filterdesign @order 4 @response bandpass @frequency 4000. 10000.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"format\": 6,\n                      \"id\": \"obj-15\",\n                      \"maxclass\": \"flonum\",\n                      \"maximum\": 30000.0,\n                      \"minimum\": 10.0,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        150.0,\n                        109.0,\n                        50.0,\n                        22.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        150.0,\n                        241.0,\n                        97.0,\n                        22.0\n                      ],\n                      \"text\": \"frequency $1 $2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-24\",\n                      \"maxclass\": \"number\",\n                      \"maximum\": 30000,\n                      \"minimum\": 10,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        436.0,\n                        109.0,\n                        50.0,\n                        22.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"attr\": \"frequency\",\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-17\",\n                      \"maxclass\": \"attrui\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        348.0,\n                        267.0,\n                        265.0,\n                        22.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        551.0,\n                        298.0,\n                        22.0\n                      ],\n                      \"text\": \"cascade~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"high pass \\u0192\",\n                      \"id\": \"obj-55\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        150.0,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"low pass \\u0192\",\n                      \"id\": \"obj-52\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        436.0,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-41\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        27.0,\n                        726.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"signal\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-15\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-16\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-17\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-24\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-35\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-41\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-4\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-24\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-52\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-55\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                1075.049194,\n                810.798462,\n                241.0,\n                20.0\n              ],\n              \"text\": \"p filter\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-178\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                1012.885254,\n                515.490417,\n                92.0,\n                20.0\n              ],\n              \"text\": \"translate bbu ms\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-181\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                1075.049194,\n                756.516235,\n                55.0,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-188\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                1012.885254,\n                599.885498,\n                70.0,\n                20.0\n              ],\n              \"text\": \"tapout~ 125.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-190\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"tapconnect\"\n              ],\n              \"patching_rect\": [\n                1126.885254,\n                553.910889,\n                66.0,\n                20.0\n              ],\n              \"text\": \"tapin~ 4000\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-958\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patcher\": {\n                \"fileversion\": 1,\n                \"appversion\": {\n                  \"major\": 9,\n                  \"minor\": 1,\n                  \"revision\": 5,\n                  \"architecture\": \"x64\",\n                  \"modernui\": 1\n                },\n                \"classnamespace\": \"box\",\n                \"rect\": [\n                  84.0,\n                  129.0,\n                  930.0,\n                  645.0\n                ],\n                \"statusbarvisible\": 1,\n                \"boxes\": [\n                  {\n                    \"box\": {\n                      \"id\": \"obj-18\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        172.0,\n                        305.0,\n                        22.0\n                      ],\n                      \"text\": \"pak f f\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 13.0,\n                      \"id\": \"obj-16\",\n                      \"linecount\": 3,\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"dictionary\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        317.0,\n                        183.0,\n                        52.0\n                      ],\n                      \"text\": \"filterdesign @order 4 @response bandpass @frequency 4000. 10000.\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"format\": 6,\n                      \"id\": \"obj-15\",\n                      \"maxclass\": \"flonum\",\n                      \"maximum\": 30000.0,\n                      \"minimum\": 10.0,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        174.714279,\n                        94.0,\n                        50.0,\n                        22.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"id\": \"obj-5\",\n                      \"maxclass\": \"message\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        226.0,\n                        97.0,\n                        22.0\n                      ],\n                      \"text\": \"frequency $1 $2\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-24\",\n                      \"maxclass\": \"number\",\n                      \"maximum\": 30000,\n                      \"minimum\": 10,\n                      \"numinlets\": 1,\n                      \"numoutlets\": 2,\n                      \"outlettype\": [\n                        \"\",\n                        \"bang\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        460.714294,\n                        94.0,\n                        50.0,\n                        22.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-4\",\n                      \"maxclass\": \"newobj\",\n                      \"numinlets\": 2,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        415.0,\n                        62.0,\n                        22.0\n                      ],\n                      \"text\": \"cascade~\"\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"high pass \\u0192\",\n                      \"id\": \"obj-55\",\n                      \"index\": 2,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        174.714279,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"low pass \\u0192\",\n                      \"id\": \"obj-52\",\n                      \"index\": 3,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"patching_rect\": [\n                        460.714294,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"\",\n                      \"id\": \"obj-41\",\n                      \"index\": 1,\n                      \"maxclass\": \"outlet\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 0,\n                      \"patching_rect\": [\n                        26.0,\n                        469.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"comment\": \"signal\",\n                      \"id\": \"obj-35\",\n                      \"index\": 1,\n                      \"maxclass\": \"inlet\",\n                      \"numinlets\": 0,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"signal\"\n                      ],\n                      \"patching_rect\": [\n                        26.0,\n                        19.0,\n                        25.0,\n                        25.0\n                      ]\n                    }\n                  },\n                  {\n                    \"box\": {\n                      \"attr\": \"frequency\",\n                      \"fontface\": 0,\n                      \"fontname\": \"Arial\",\n                      \"fontsize\": 12.0,\n                      \"id\": \"obj-17\",\n                      \"maxclass\": \"attrui\",\n                      \"numinlets\": 1,\n                      \"numoutlets\": 1,\n                      \"outlettype\": [\n                        \"\"\n                      ],\n                      \"parameter_enable\": 0,\n                      \"patching_rect\": [\n                        385.714264,\n                        239.0,\n                        265.0,\n                        22.0\n                      ]\n                    }\n                  }\n                ],\n                \"lines\": [\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-15\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-16\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-17\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-5\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-18\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-18\",\n                        1\n                      ],\n                      \"source\": [\n                        \"obj-24\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-4\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-35\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-41\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-4\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-16\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-5\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-24\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-52\",\n                        0\n                      ]\n                    }\n                  },\n                  {\n                    \"patchline\": {\n                      \"destination\": [\n                        \"obj-15\",\n                        0\n                      ],\n                      \"source\": [\n                        \"obj-55\",\n                        0\n                      ]\n                    }\n                  }\n                ]\n              },\n              \"patching_rect\": [\n                450.807373,\n                810.798462,\n                245.0,\n                20.0\n              ],\n              \"text\": \"p filter\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-954\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                450.807373,\n                515.490417,\n                92.0,\n                20.0\n              ],\n              \"text\": \"translate bbu ms\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-896\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                450.807373,\n                771.516235,\n                63.526123,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-906\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                450.807373,\n                599.885498,\n                70.0,\n                20.0\n              ],\n              \"text\": \"tapout~ 125.\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontface\": 1,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-908\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"tapconnect\"\n              ],\n              \"patching_rect\": [\n                318.6698,\n                553.910889,\n                66.0,\n                20.0\n              ],\n              \"text\": \"tapin~ 4000\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                239.0,\n                1180.754272,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"L\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                399.538391,\n                99.754272,\n                19.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                19.0,\n                17.0\n              ],\n              \"text\": \"L\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                29.0,\n                35.907501,\n                68.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                68.0,\n                17.0\n              ],\n              \"text\": \"SYNC DELAY\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                29.0,\n                22.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                73.337189,\n                22.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                116.079285,\n                22.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-12\",\n                0\n              ],\n              \"midpoints\": [\n                941.328979,\n                1020.526123,\n                299.880157,\n                1020.526123\n              ],\n              \"source\": [\n                \"obj-11\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-20\",\n                0\n              ],\n              \"midpoints\": [\n                1049.328979,\n                1052.526123,\n                761.880127,\n                1052.526123\n              ],\n              \"source\": [\n                \"obj-11\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-124\",\n                0\n              ],\n              \"source\": [\n                \"obj-116\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                4\n              ],\n              \"source\": [\n                \"obj-118\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                1\n              ],\n              \"source\": [\n                \"obj-12\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-957\",\n                0\n              ],\n              \"source\": [\n                \"obj-124\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-708\",\n                0\n              ],\n              \"source\": [\n                \"obj-16\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                0\n              ],\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-190\",\n                0\n              ],\n              \"midpoints\": [\n                1084.549194,\n                862.874756,\n                1341.800373,\n                862.874756,\n                1341.800373,\n                508.737488,\n                1136.385254,\n                508.737488\n              ],\n              \"source\": [\n                \"obj-176\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-188\",\n                0\n              ],\n              \"source\": [\n                \"obj-178\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-176\",\n                0\n              ],\n              \"source\": [\n                \"obj-181\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                3\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-188\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-181\",\n                0\n              ],\n              \"midpoints\": [\n                1022.385254,\n                686.700928,\n                1084.549194,\n                686.700928\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-188\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-188\",\n                0\n              ],\n              \"midpoints\": [\n                1136.385254,\n                586.398193,\n                1022.385254,\n                586.398193\n              ],\n              \"source\": [\n                \"obj-190\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                1\n              ],\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-44\",\n                1\n              ],\n              \"source\": [\n                \"obj-21\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                1\n              ],\n              \"midpoints\": [\n                1136.385254,\n                313.526123,\n                968.328979,\n                313.526123\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-190\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                2\n              ],\n              \"midpoints\": [\n                375.380127,\n                629.254272,\n                392.380157,\n                629.254272\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-6\",\n                0\n              ],\n              \"midpoints\": [\n                375.380127,\n                195.143799,\n                328.1698,\n                195.143799\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-24\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                0\n              ],\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-28\",\n                0\n              ],\n              \"source\": [\n                \"obj-26\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-3\",\n                0\n              ],\n              \"source\": [\n                \"obj-27\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                0\n              ],\n              \"midpoints\": [\n                836.380127,\n                256.283264,\n                1136.385254,\n                256.283264\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-29\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-26\",\n                2\n              ],\n              \"midpoints\": [\n                836.380127,\n                611.254272,\n                853.380127,\n                611.254272\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-29\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-181\",\n                1\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-896\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-3\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                0\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-176\",\n                2\n              ],\n              \"midpoints\": [\n                686.307373,\n                789.354736,\n                1306.549194,\n                789.354736\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-44\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                2\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-44\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-176\",\n                1\n              ],\n              \"midpoints\": [\n                573.307373,\n                789.354736,\n                1195.549194,\n                789.354736\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-45\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-45\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-21\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-49\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-45\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-49\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-44\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-50\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-45\",\n                2\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-50\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                0\n              ],\n              \"midpoints\": [\n                328.1698,\n                305.526123,\n                941.328979,\n                305.526123\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-6\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-908\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-6\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                0\n              ],\n              \"midpoints\": [\n                207.380157,\n                1057.723022,\n                668.380127,\n                1057.723022\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-4\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-178\",\n                0\n              ],\n              \"source\": [\n                \"obj-708\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-958\",\n                0\n              ],\n              \"source\": [\n                \"obj-896\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                2\n              ],\n              \"midpoints\": [\n                460.307373,\n                652.091553,\n                995.328979,\n                652.091553\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-906\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-896\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-906\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-906\",\n                0\n              ],\n              \"midpoints\": [\n                328.1698,\n                586.398193,\n                460.307373,\n                586.398193\n              ],\n              \"source\": [\n                \"obj-908\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-906\",\n                0\n              ],\n              \"source\": [\n                \"obj-954\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-954\",\n                0\n              ],\n              \"source\": [\n                \"obj-957\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-908\",\n                0\n              ],\n              \"midpoints\": [\n                460.307373,\n                870.79834,\n                269.501099,\n                870.79834,\n                269.501099,\n                518.414246,\n                328.1698,\n                518.414246\n              ],\n              \"source\": [\n                \"obj-958\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-116\",\n                0\n              ],\n              \"source\": [\n                \"obj-96\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | in 1: signal | out 0: signal | out 1: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        30,\n        1673\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        235,\n        1673\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        335,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_wet\": {\n      \"type\": \"message\",\n      \"text\": \"100\",\n      \"pos\": [\n        335,\n        1512\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_fwd\": {\n      \"type\": \"newobj\",\n      \"text\": \"pattrforward FX_SYNCDELAY::Mix\",\n      \"pos\": [\n        335,\n        1542\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_wnote\": {\n      \"type\": \"comment\",\n      \"text\": \"Mix \\u2192 100 on load (the dial's initial value inside the module) and on the wet-only button; the other dials come from the patch's Snapshot\",\n      \"pos\": [\n        30,\n        1713\n      ],\n      \"size\": [\n        300,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1518,\n        1482\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1518,\n        1512\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd Tapped Delay\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        186,\n        20\n      ],\n      \"presentation\": [\n        18,\n        750,\n        370,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1518,\n        1452\n      ],\n      \"presentation\": [\n        18,\n        750,\n        370,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd~ Tapped Delay.amxd \\u2014 16 equally spaced taps with level and pan (Max for Live package)\",\n      \"pos\": [\n        808,\n        1452\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        808,\n        1482\n      ],\n      \"presentation\": [\n        398,\n        750,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        878,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        958,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Tapped Delay.amxd\\\"\",\n      \"pos\": [\n        808,\n        1562\n      ],\n      \"size\": [\n        426,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        776,\n        426,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_07\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_07\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_07\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1108,\n        1482\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1108,\n        1522\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        808,\n        1793\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        948,\n        1793\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        644,\n        1923\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        644,\n        1953\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd DelayTaps\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        472,\n        750,\n        543,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        644,\n        1893\n      ],\n      \"presentation\": [\n        472,\n        750,\n        543,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd~ Max DelayTaps.amxd \\u2014 multi-tap delay, taps drawn as multislider shapes\",\n      \"pos\": [\n        30,\n        1893\n      ],\n      \"size\": [\n        604,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1923\n      ],\n      \"presentation\": [\n        1025,\n        750,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max DelayTaps.amxd\\\"\",\n      \"pos\": [\n        30,\n        2003\n      ],\n      \"size\": [\n        599,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        472,\n        776,\n        599,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_08\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_08\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_08\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        330,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        170,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1372,\n        1923\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1372,\n        1953\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd DelayMultiBand\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1026,\n        335,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1372,\n        1893\n      ],\n      \"presentation\": [\n        18,\n        1026,\n        335,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd~ Max DelayMultiBand.amxd \\u2014 cascaded cross~ split, one delay per band\",\n      \"pos\": [\n        784,\n        1893\n      ],\n      \"size\": [\n        578,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        784,\n        1923\n      ],\n      \"presentation\": [\n        363,\n        1026,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        854,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        934,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max DelayMultiBand.amxd\\\"\",\n      \"pos\": [\n        784,\n        2003\n      ],\n      \"size\": [\n        391,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1052,\n        391,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_09\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_09\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_09\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        784,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        924,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        2093,\n        1923\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2093,\n        1953\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd Space Echo\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        437,\n        1026,\n        229,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2093,\n        1893\n      ],\n      \"presentation\": [\n        437,\n        1026,\n        229,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Space Echo.amxd \\u2014 RE-201-style tape delay with warble and inertia\",\n      \"pos\": [\n        1512,\n        1893\n      ],\n      \"size\": [\n        571,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1512,\n        1923\n      ],\n      \"presentation\": [\n        676,\n        1026,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1582,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1662,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Space Echo.amxd\\\"\",\n      \"pos\": [\n        1512,\n        2003\n      ],\n      \"size\": [\n        285,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        437,\n        1052,\n        285,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_10\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_10\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1812,\n        1923\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1812,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1512,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1652,\n        2234\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        564,\n        2364\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        564,\n        2394\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd SpectralDelay\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        750,\n        1026,\n        465,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        564,\n        2334\n      ],\n      \"presentation\": [\n        750,\n        1026,\n        465,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd~ Max SpectralDelay.amxd \\u2014 pfft~ per-bin delay\",\n      \"pos\": [\n        30,\n        2334\n      ],\n      \"size\": [\n        524,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        2364\n      ],\n      \"presentation\": [\n        1225,\n        1026,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max SpectralDelay.amxd\\\"\",\n      \"pos\": [\n        30,\n        2444\n      ],\n      \"size\": [\n        521,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        750,\n        1052,\n        521,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_11\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_11\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_11\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        330,\n        2404\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        170,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1350,\n        2364\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1350,\n        2394\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd Pitch & Echo\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1302,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1350,\n        2334\n      ],\n      \"presentation\": [\n        18,\n        1302,\n        274,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd~ Pitch & Echo.amxd \\u2014 pitch transposer inside a delay line (harmonizer echo)\",\n      \"pos\": [\n        704,\n        2334\n      ],\n      \"size\": [\n        636,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        704,\n        2364\n      ],\n      \"presentation\": [\n        302,\n        1302,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        774,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        854,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Pitch & Echo.amxd\\\"\",\n      \"pos\": [\n        704,\n        2444\n      ],\n      \"size\": [\n        330,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1328,\n        330,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_12\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_12\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_12\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1004,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/Wet 100.\",\n      \"pos\": [\n        1004,\n        2404\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        704,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        844,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"12\",\n      \"pos\": [\n        2128,\n        2364\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2128,\n        2394\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd Feedback Network\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        376,\n        1302,\n        500,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_13\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2128,\n        2334\n      ],\n      \"presentation\": [\n        376,\n        1302,\n        500,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f13_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"13 \\u00b7 amxd~ Feedback Network.amxd \\u2014 five bandpass + delay units cross-fed, randomised\",\n      \"pos\": [\n        1490,\n        2334\n      ],\n      \"size\": [\n        628,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f13_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1490,\n        2364\n      ],\n      \"presentation\": [\n        886,\n        1302,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1560,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1640,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Feedback Network.amxd\\\"\",\n      \"pos\": [\n        1490,\n        2444\n      ],\n      \"size\": [\n        556,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        376,\n        1328,\n        556,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_13\",\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"DEV_13\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"DEV_13\",\n            \"parameter_type\": 3\n          }\n        }\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f13_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1790,\n        2364\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 1.\",\n      \"pos\": [\n        1790,\n        2404\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_L\",\n      \"pos\": [\n        1490,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f13_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX13_R\",\n      \"pos\": [\n        1630,\n        2675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"13\",\n      \"pos\": [\n        1495,\n        2805\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1495,\n        2835\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 AU Delay\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        118,\n        20\n      ],\n      \"presentation\": [\n        960,\n        1302,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_14\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1495,\n        2775\n      ],\n      \"presentation\": [\n        960,\n        1302,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f14_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"14 \\u00b7 vst~ + plug_au AUDelay \\u2014 Apple's AudioUnit delay\",\n      \"pos\": [\n        30,\n        2775\n      ],\n      \"size\": [\n        1455,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        2805\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        2805\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        3145\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        960,\n        1458,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_14\",\n        \"viewvisibility\": 0,\n        \"border\": 0,\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_invisible\": 1,\n            \"parameter_longname\": \"VST_14\",\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"VST_14\",\n            \"parameter_type\": 3\n          }\n        }\n      }\n    },\n    \"f14_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        2805\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f14_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        2833\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f14_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUDelay\",\n      \"pos\": [\n        330,\n        2875\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU14_INIT\",\n      \"pos\": [\n        230,\n        2875\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        2805\n      ],\n      \"presentation\": [\n        960,\n        1326,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU14_INIT\",\n      \"pos\": [\n        230,\n        2915\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST14\",\n      \"pos\": [\n        230,\n        3060\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        2955\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        2985\n      ],\n      \"presentation\": [\n        1018,\n        1326,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f14_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        1044,\n        1328,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        3015\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.125\",\n      \"pos\": [\n        473,\n        2955\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        473,\n        2985\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        960,\n        1354,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f14_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"delay time (0\\u20132 s)\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        1016,\n        1356,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Delay Time\\\" $1\",\n      \"pos\": [\n        473,\n        3015\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.7503\",\n      \"pos\": [\n        716,\n        2955\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        716,\n        2985\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        960,\n        1378,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f14_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"feedback (\\u00b199.9 %)\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        1016,\n        1380,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"Feedback $1\",\n      \"pos\": [\n        716,\n        3015\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"1.\",\n      \"pos\": [\n        959,\n        2955\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        959,\n        2985\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        960,\n        1402,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f14_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dry/wet (\\u2192 wet)\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        1016,\n        1404,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Dry/Wet Mix\\\" $1\",\n      \"pos\": [\n        959,\n        3015\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p4_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.6801\",\n      \"pos\": [\n        1202,\n        2955\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_p4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1202,\n        2985\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        960,\n        1426,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f14_p4_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"lowpass (10 Hz\\u201322 kHz)\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        1016,\n        1428,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f14_p4_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Lowpass Cutoff Frequency\\\" $1\",\n      \"pos\": [\n        1202,\n        3015\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST14\",\n      \"pos\": [\n        110,\n        3105\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_L\",\n      \"pos\": [\n        30,\n        3195\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX14_R\",\n      \"pos\": [\n        120,\n        3195\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f14_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        960,\n        1486,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201314 are the effects\",\n      \"pos\": [\n        30,\n        3305\n      ],\n      \"size\": [\n        1200,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 14 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3415\n      ],\n      \"inlets\": 15,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        3465\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_L\",\n      \"pos\": [\n        1110,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_L\",\n      \"pos\": [\n        1200,\n        3365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 14 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        3545\n      ],\n      \"inlets\": 15,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        3595\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_13\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX13_R\",\n      \"pos\": [\n        1110,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_14\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX14_R\",\n      \"pos\": [\n        1200,\n        3495\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        3645\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        3715\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        3715\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        3765\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        3765\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        3765\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        3765\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        3825\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1,\n        \"saved_attribute_attributes\": {\n          \"valueof\": {\n            \"parameter_longname\": \"live.gain~\",\n            \"parameter_mmax\": 6.0,\n            \"parameter_mmin\": -70.0,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"live.gain~\",\n            \"parameter_type\": 0,\n            \"parameter_unitstyle\": 4\n          }\n        },\n        \"varname\": \"live.gain~\"\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        3905\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        3645\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        3675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        3715\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        3755\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        3795\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        3835\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        3835\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        3875\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        3875\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        3915\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        3915\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        944\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        970\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        996\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        1022\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        1048\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_c0_cap\": {\n      \"type\": \"comment\",\n      \"text\": \"delay_time: seconds\",\n      \"pos\": [\n        2520,\n        1074\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        554,\n        454,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_dmix\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        200,\n        1121\n      ],\n      \"attrs\": {\n        \"attr\": \"delay_mix\",\n        \"text_width\": 82.0\n      },\n      \"presentation\": [\n        554,\n        502,\n        244,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"attr\": \"delay_mix\",\n        \"text_width\": 82.0\n      }\n    },\n    \"f02_c0_cap\": {\n      \"type\": \"comment\",\n      \"text\": \"delay: seconds, left right\",\n      \"pos\": [\n        2520,\n        1100\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        18,\n        454,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_c0_cap\": {\n      \"type\": \"comment\",\n      \"text\": \"delay: seconds, left right\",\n      \"pos\": [\n        2520,\n        1126\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        286,\n        454,\n        244,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_transport\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 the global transport; followed by: BEAP Sync Delay\",\n      \"pos\": [\n        2000,\n        230\n      ],\n      \"size\": [\n        500,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"tr_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 120.\",\n      \"pos\": [\n        2000,\n        260\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_bpm\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        2000,\n        290\n      ],\n      \"attrs\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      },\n      \"presentation\": [\n        1110,\n        262,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      }\n    },\n    \"tr_tempo\": {\n      \"type\": \"message\",\n      \"text\": \"tempo $1\",\n      \"pos\": [\n        2000,\n        320\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_run\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        2120,\n        290\n      ],\n      \"presentation\": [\n        980,\n        262,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"tr_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"transport\",\n      \"pos\": [\n        2000,\n        360\n      ],\n      \"inlets\": 2,\n      \"outlets\": 9,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"p_tr_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 BEAP Sync Delay\",\n      \"pos\": [\n        2520,\n        1152\n      ],\n      \"size\": [\n        237,\n        20\n      ],\n      \"presentation\": [\n        980,\n        240,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_run\": {\n      \"type\": \"comment\",\n      \"text\": \"start / stop\",\n      \"pos\": [\n        2520,\n        1178\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        1010,\n        264,\n        90,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_bpm\": {\n      \"type\": \"comment\",\n      \"text\": \"bpm\",\n      \"pos\": [\n        2520,\n        1204\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1170,\n        264,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        400,\n        260,\n        334\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        278,\n        400,\n        260,\n        310\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        546,\n        400,\n        260,\n        334\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        814,\n        400,\n        295,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        1117,\n        400,\n        281,\n        160\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        744,\n        446,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        464,\n        744,\n        619,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1020,\n        411,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        429,\n        1020,\n        305,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        742,\n        1020,\n        541,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1296,\n        350,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f13_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        368,\n        1296,\n        576,\n        266\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f14_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        952,\n        1296,\n        230,\n        237\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        940,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        1010,\n        3975\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"f04_wet\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rM\",\n      0,\n      \"f05_bp\",\n      0\n    ],\n    [\n      \"f05_bp\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_bp\",\n      0,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f05_rwo\",\n      0,\n      \"f05_wet\",\n      0\n    ],\n    [\n      \"f05_wet\",\n      0,\n      \"f05_fwd\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_bp\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_bp\",\n      1\n    ],\n    [\n      \"f06_bp\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_bp\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f06_rwo\",\n      0,\n      \"f06_wet\",\n      0\n    ],\n    [\n      \"f06_wet\",\n      0,\n      \"f06_fwd\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_open\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f07_rwo\",\n      0,\n      \"f07_wet\",\n      0\n    ],\n    [\n      \"f07_wet\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_open\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rL\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rR\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f08_rwo\",\n      0,\n      \"f08_wet\",\n      0\n    ],\n    [\n      \"f08_wet\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"f09_open\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rL\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rR\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      1,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f11_rwo\",\n      0,\n      \"f11_wet\",\n      0\n    ],\n    [\n      \"f11_wet\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"f12_rwo\",\n      0,\n      \"f12_wet\",\n      0\n    ],\n    [\n      \"f12_wet\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f13_tbtn\",\n      0,\n      \"f13_tsel\",\n      0\n    ],\n    [\n      \"f13_tsel\",\n      0,\n      \"f13_tsend\",\n      0\n    ],\n    [\n      \"f13_open\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rL\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f13_rR\",\n      0,\n      \"f13_obj\",\n      1\n    ],\n    [\n      \"f13_obj\",\n      0,\n      \"f13_sL\",\n      0\n    ],\n    [\n      \"f13_obj\",\n      1,\n      \"f13_sR\",\n      0\n    ],\n    [\n      \"f13_rwo\",\n      0,\n      \"f13_wet\",\n      0\n    ],\n    [\n      \"f13_wet\",\n      0,\n      \"f13_obj\",\n      0\n    ],\n    [\n      \"f14_tbtn\",\n      0,\n      \"f14_tsel\",\n      0\n    ],\n    [\n      \"f14_tsel\",\n      0,\n      \"f14_tsend\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"f14_rL\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rR\",\n      0,\n      \"f14_obj\",\n      1\n    ],\n    [\n      \"f14_obj\",\n      0,\n      \"f14_sL\",\n      0\n    ],\n    [\n      \"f14_obj\",\n      1,\n      \"f14_sR\",\n      0\n    ],\n    [\n      \"f14_lb\",\n      0,\n      \"f14_t\",\n      0\n    ],\n    [\n      \"f14_t\",\n      1,\n      \"f14_plug\",\n      0\n    ],\n    [\n      \"f14_t\",\n      0,\n      \"f14_sinit\",\n      0\n    ],\n    [\n      \"f14_plug\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"f14_open\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p0_i\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p1_i\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p2_i\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p3_i\",\n      0\n    ],\n    [\n      \"f14_rinit\",\n      0,\n      \"f14_p4_i\",\n      0\n    ],\n    [\n      \"f14_p0_i\",\n      0,\n      \"f14_p0\",\n      0\n    ],\n    [\n      \"f14_p0\",\n      0,\n      \"f14_p0_m\",\n      0\n    ],\n    [\n      \"f14_p0_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_p1_i\",\n      0,\n      \"f14_p1\",\n      0\n    ],\n    [\n      \"f14_p1\",\n      0,\n      \"f14_p1_m\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"f14_p1_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_p2_i\",\n      0,\n      \"f14_p2\",\n      0\n    ],\n    [\n      \"f14_p2\",\n      0,\n      \"f14_p2_m\",\n      0\n    ],\n    [\n      \"f14_p2_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_p3_i\",\n      0,\n      \"f14_p3\",\n      0\n    ],\n    [\n      \"f14_p3\",\n      0,\n      \"f14_p3_m\",\n      0\n    ],\n    [\n      \"f14_p3_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_p4_i\",\n      0,\n      \"f14_p4\",\n      0\n    ],\n    [\n      \"f14_p4\",\n      0,\n      \"f14_p4_m\",\n      0\n    ],\n    [\n      \"f14_p4_m\",\n      0,\n      \"f14_stov\",\n      0\n    ],\n    [\n      \"f14_rtov\",\n      0,\n      \"f14_obj\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"mx_L_13\",\n      0,\n      \"sel_L\",\n      13\n    ],\n    [\n      \"mx_L_14\",\n      0,\n      \"sel_L\",\n      14\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mx_R_13\",\n      0,\n      \"sel_R\",\n      13\n    ],\n    [\n      \"mx_R_14\",\n      0,\n      \"sel_R\",\n      14\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ],\n    [\n      \"f04_dmix\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"tr_lm\",\n      0,\n      \"tr_bpm\",\n      0\n    ],\n    [\n      \"tr_bpm\",\n      0,\n      \"tr_tempo\",\n      0\n    ],\n    [\n      \"tr_tempo\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"tr_run\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rL\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rR\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      1,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f02_c0\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c1\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"f02_c2\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c3\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c4\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c5\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c6\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c7\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_c8\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rwo\",\n      0,\n      \"f02_wet\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"f02_wet\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rL\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rR\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      1,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f03_c0\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"f03_c1\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c2\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c3\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c4\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c5\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c6\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_c7\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rwo\",\n      0,\n      \"f03_wet\",\n      0\n    ],\n    [\n      \"f03_wet\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f04_c0\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"f04_c1\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c2\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c3\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c4\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c5\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c6\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_c7\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rwo\",\n      0,\n      \"f04_wet\",\n      0\n    ]\n  ],\n  \"patcher_extras\": {\n    \"snapshot\": {\n      \"filetype\": \"C74Snapshot\",\n      \"version\": 2,\n      \"minorversion\": 0,\n      \"name\": \"snapshotlist\",\n      \"origin\": \"jpatcher\",\n      \"type\": \"list\",\n      \"subtype\": \"Undefined\",\n      \"embed\": 1,\n      \"snapshot\": {\n        \"valuedictionary\": {\n          \"parameter_values\": {\n            \"FX_SELECT\": 1.0,\n            \"Feedback\": -12.094488188976484,\n            \"Feedback[1]\": -22.11023622047248,\n            \"HPF\": 20.0,\n            \"LPF\": 20000.0,\n            \"LPF[1]\": 20000.0,\n            \"Mix\": 100.0,\n            \"Mix[1]\": 100.0,\n            \"bypass\": 0.0,\n            \"bypass[1]\": 0.0,\n            \"live.gain~\": 0.0,\n            \"blob\": {\n              \"DEV_07\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Tapped Delay.amxd\",\n                  \"origin\": \"Tapped Delay.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Tapped Delay.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Tapped Delay/Tapped Delay.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"bpm\": 120.0,\n                        \"centerPan\": 0.0,\n                        \"feedback\": 18.4,\n                        \"randDelay\": 0.0,\n                        \"randPan\": 0.0,\n                        \"tempo\": 0.0,\n                        \"time\": 13.0,\n                        \"wet/dry\": 100.0,\n                        \"blob\": {\n                          \"levels\": [\n                            0.71,\n                            0.05,\n                            0.622222,\n                            0.666667,\n                            0.722222,\n                            0.766667,\n                            0.833333,\n                            0.811111,\n                            0.722222,\n                            0.588889,\n                            0.455556,\n                            0.388889,\n                            0.366667,\n                            0.333333,\n                            0.311111,\n                            0.222222\n                          ],\n                          \"positions\": [\n                            0.0,\n                            0.242718,\n                            0.029126,\n                            -0.203883,\n                            -0.398058,\n                            -0.436893,\n                            -0.029126,\n                            0.320388,\n                            0.572816,\n                            0.572816,\n                            0.514563,\n                            0.184466,\n                            -0.165049,\n                            -0.165049,\n                            -0.087379,\n                            0.0\n                          ]\n                        }\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_08\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Max DelayTaps.amxd\",\n                  \"origin\": \"Max DelayTaps.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Max DelayTaps.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max DelayTaps/Max DelayTaps.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"DelaysMax\": 5000.0,\n                        \"DelaysMin\": 0.0,\n                        \"Dry/Wet\": 100.0,\n                        \"Feedback\": 31.181102362204697,\n                        \"LevelsMax\": 100.0,\n                        \"LevelsMin\": 0.0,\n                        \"MasterGain\": 0.0,\n                        \"PansMax\": 17.999999999999993,\n                        \"PansMin\": -50.0,\n                        \"blob\": {\n                          \"Taps\": [\n                            8\n                          ],\n                          \"Delays\": [\n                            0.09375,\n                            -0.17634033306210264,\n                            -0.3243747828025601,\n                            -0.42281622373462524,\n                            -0.4985673919530951,\n                            -0.560950577951363,\n                            -0.6144037494668978,\n                            -0.6614173228346454\n                          ],\n                          \"Levels\": [\n                            0.614173228346456,\n                            0.6030444859987246,\n                            0.5547258413249657,\n                            0.4557560798686663,\n                            0.2966178646531575,\n                            0.0695674562504157,\n                            -0.23205766119514856,\n                            -0.614173228346456\n                          ],\n                          \"Pans\": [\n                            -0.4566929133858266,\n                            -0.3718791813239333,\n                            -0.27223636626067743,\n                            -0.13919605008556257,\n                            0.13919605008556246,\n                            0.2722363662606773,\n                            0.37187918132393327,\n                            0.4566929133858266\n                          ]\n                        }\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_09\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Max DelayMultiBand.amxd\",\n                  \"origin\": \"Max DelayMultiBand.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Max DelayMultiBand.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max DelayMultiBand/Max DelayMultiBand.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"DirectGain\": -70.0,\n                        \"EffectGain\": 0.0,\n                        \"HighDelL\": 750.0,\n                        \"HighDelR\": 0.0,\n                        \"HighEnable\": 1.0,\n                        \"HighFB\": 0.0,\n                        \"HighGain\": 0.0,\n                        \"HighXFreq\": 4000.0,\n                        \"LowDelL\": 1200.0,\n                        \"LowDelR\": 0.0,\n                        \"LowEnable\": 1.0,\n                        \"LowFB\": 0.0,\n                        \"LowXFreq\": 1000.0,\n                        \"Lowgain\": 0.0,\n                        \"MidDelL\": 900.0,\n                        \"MidDelR\": 1350.0,\n                        \"MidEnable\": 1.0,\n                        \"MidFB\": 45.212598425196816,\n                        \"MidGain\": 0.0\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_10\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Space Echo.amxd\",\n                  \"origin\": \"Space Echo.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Space Echo.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Space Echo/Space Echo.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"WarbleAmount\": 14.0,\n                        \"WarbleSpeed\": 43.0,\n                        \"bpm\": 120.0,\n                        \"clipping\": 0.63,\n                        \"feedback\": 47.0,\n                        \"highpass\": 220.0,\n                        \"inertia\": 2.687,\n                        \"live.menu\": 13.0,\n                        \"lowpass\": 3280.0,\n                        \"reverb_wetdry\": 27.200001,\n                        \"revtime\": 2800.0,\n                        \"tempo\": 0.0,\n                        \"wet/dry\": 100.0\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_11\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Max SpectralDelay.amxd\",\n                  \"origin\": \"Max SpectralDelay.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Max SpectralDelay.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max SpectralDelay/Max SpectralDelay.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"DelayRandStep\": 10.0,\n                        \"DelayRange\": 2000.0,\n                        \"Dry/Wet\": 100.0,\n                        \"FeedbackRandStep\": 10.0,\n                        \"FeedbackRange\": 50.0,\n                        \"Gain\": 0.0,\n                        \"blob\": {\n                          \"Delays\": [\n                            0.464844,\n                            0.488281,\n                            0.519531,\n                            0.542969,\n                            0.519531,\n                            0.484375,\n                            0.488281,\n                            0.46875,\n                            0.453125,\n                            0.488281,\n                            0.464844,\n                            0.433594,\n                            0.453125,\n                            0.464844,\n                            0.429688,\n                            0.421875,\n                            0.441406,\n                            0.429688,\n                            0.433594,\n                            0.457031,\n                            0.472656,\n                            0.445312,\n                            0.476562,\n                            0.457031,\n                            0.445312,\n                            0.464844,\n                            0.464844,\n                            0.429688,\n                            0.429688,\n                            0.40625,\n                            0.417969,\n                            0.453125,\n                            0.457031,\n                            0.472656,\n                            0.496094,\n                            0.488281,\n                            0.46875,\n                            0.496094,\n                            0.460938,\n                            0.464844,\n                            0.445312,\n                            0.417969,\n                            0.441406,\n                            0.40625,\n                            0.429688,\n                            0.429688,\n                            0.441406,\n                            0.414062,\n                            0.386719,\n                            0.363281,\n                            0.378906,\n                            0.414062,\n                            0.445312,\n                            0.421875,\n                            0.417969,\n                            0.382812,\n                            0.347656,\n                            0.363281,\n                            0.339844,\n                            0.359375,\n                            0.371094,\n                            0.359375,\n                            0.390625,\n                            0.402344,\n                            0.425781,\n                            0.398438,\n                            0.375,\n                            0.375,\n                            0.367188,\n                            0.371094,\n                            0.402344,\n                            0.414062,\n                            0.410156,\n                            0.414062,\n                            0.402344,\n                            0.378906,\n                            0.347656,\n                            0.34375,\n                            0.363281,\n                            0.394531,\n                            0.429688,\n                            0.457031,\n                            0.484375,\n                            0.519531,\n                            0.550781,\n                            0.582031,\n                            0.570312,\n                            0.570312,\n                            0.582031,\n                            0.585938,\n                            0.5625,\n                            0.589844,\n                            0.578125,\n                            0.558594,\n                            0.5625,\n                            0.550781,\n                            0.558594,\n                            0.585938,\n                            0.601562,\n                            0.597656,\n                            0.5625,\n                            0.570312,\n                            0.539062,\n                            0.515625,\n                            0.527344,\n                            0.550781,\n                            0.554688,\n                            0.535156,\n                            0.503906,\n                            0.539062,\n                            0.566406,\n                            0.585938,\n                            0.613281,\n                            0.636719,\n                            0.664062,\n                            0.667969,\n                            0.667969,\n                            0.695312,\n                            0.714844,\n                            0.730469,\n                            0.722656,\n                            0.746094,\n                            0.777344,\n                            0.773438,\n                            0.796875,\n                            0.808594,\n                            0.785156,\n                            0.808594,\n                            0.84375,\n                            0.839844,\n                            0.863281,\n                            0.890625,\n                            0.882812,\n                            0.894531,\n                            0.871094,\n                            0.90625,\n                            0.917969,\n                            0.882812,\n                            0.882812,\n                            0.902344,\n                            0.871094,\n                            0.855469,\n                            0.886719,\n                            0.878906,\n                            0.878906,\n                            0.878906,\n                            0.859375,\n                            0.878906,\n                            0.855469,\n                            0.851562,\n                            0.820312,\n                            0.84375,\n                            0.8125,\n                            0.816406,\n                            0.800781,\n                            0.804688,\n                            0.777344,\n                            0.765625,\n                            0.789062,\n                            0.761719,\n                            0.761719,\n                            0.726562,\n                            0.699219,\n                            0.730469,\n                            0.75,\n                            0.738281,\n                            0.730469,\n                            0.714844,\n                            0.730469,\n                            0.761719,\n                            0.75,\n                            0.734375,\n                            0.703125,\n                            0.738281,\n                            0.707031,\n                            0.695312,\n                            0.675781,\n                            0.679688,\n                            0.667969,\n                            0.640625,\n                            0.675781,\n                            0.667969,\n                            0.699219,\n                            0.703125,\n                            0.675781,\n                            0.691406,\n                            0.691406,\n                            0.683594,\n                            0.703125,\n                            0.703125,\n                            0.71875,\n                            0.71875,\n                            0.726562,\n                            0.761719,\n                            0.738281,\n                            0.773438,\n                            0.777344,\n                            0.765625,\n                            0.738281,\n                            0.742188,\n                            0.769531,\n                            0.769531,\n                            0.765625,\n                            0.792969,\n                            0.765625,\n                            0.785156,\n                            0.761719,\n                            0.734375,\n                            0.699219,\n                            0.667969,\n                            0.6875,\n                            0.703125,\n                            0.699219,\n                            0.664062,\n                            0.644531,\n                            0.636719,\n                            0.621094,\n                            0.652344,\n                            0.6875,\n                            0.671875,\n                            0.644531,\n                            0.664062,\n                            0.636719,\n                            0.652344,\n                            0.628906,\n                            0.648438,\n                            0.617188,\n                            0.625,\n                            0.652344,\n                            0.621094,\n                            0.601562,\n                            0.582031,\n                            0.597656,\n                            0.5625,\n                            0.539062,\n                            0.574219,\n                            0.582031,\n                            0.574219,\n                            0.589844,\n                            0.621094,\n                            0.652344,\n                            0.632812,\n                            0.617188,\n                            0.636719,\n                            0.660156,\n                            0.652344,\n                            0.632812,\n                            0.65625,\n                            0.675781,\n                            0.679688,\n                            0.679688,\n                            0.6875,\n                            0.65625,\n                            0.648438,\n                            0.675781,\n                            0.679688\n                          ],\n                          \"Feedbacks\": [\n                            0.710938,\n                            0.746094,\n                            0.71875,\n                            0.71875,\n                            0.753906,\n                            0.734375,\n                            0.707031,\n                            0.734375,\n                            0.746094,\n                            0.742188,\n                            0.753906,\n                            0.773438,\n                            0.753906,\n                            0.789062,\n                            0.792969,\n                            0.796875,\n                            0.796875,\n                            0.820312,\n                            0.820312,\n                            0.804688,\n                            0.808594,\n                            0.832031,\n                            0.8125,\n                            0.816406,\n                            0.796875,\n                            0.808594,\n                            0.789062,\n                            0.765625,\n                            0.738281,\n                            0.738281,\n                            0.71875,\n                            0.710938,\n                            0.703125,\n                            0.710938,\n                            0.699219,\n                            0.675781,\n                            0.675781,\n                            0.6875,\n                            0.652344,\n                            0.667969,\n                            0.644531,\n                            0.664062,\n                            0.648438,\n                            0.628906,\n                            0.648438,\n                            0.664062,\n                            0.636719,\n                            0.664062,\n                            0.671875,\n                            0.683594,\n                            0.714844,\n                            0.679688,\n                            0.707031,\n                            0.742188,\n                            0.734375,\n                            0.742188,\n                            0.726562,\n                            0.71875,\n                            0.742188,\n                            0.714844,\n                            0.730469,\n                            0.695312,\n                            0.671875,\n                            0.652344,\n                            0.6875,\n                            0.71875,\n                            0.738281,\n                            0.746094,\n                            0.722656,\n                            0.726562,\n                            0.742188,\n                            0.722656,\n                            0.707031,\n                            0.730469,\n                            0.710938,\n                            0.675781,\n                            0.691406,\n                            0.703125,\n                            0.722656,\n                            0.699219,\n                            0.703125,\n                            0.714844,\n                            0.738281,\n                            0.773438,\n                            0.789062,\n                            0.796875,\n                            0.78125,\n                            0.804688,\n                            0.804688,\n                            0.835938,\n                            0.871094,\n                            0.898438,\n                            0.882812,\n                            0.851562,\n                            0.875,\n                            0.851562,\n                            0.835938,\n                            0.8125,\n                            0.84375,\n                            0.84375,\n                            0.875,\n                            0.863281,\n                            0.84375,\n                            0.8125,\n                            0.828125,\n                            0.828125,\n                            0.835938,\n                            0.839844,\n                            0.875,\n                            0.851562,\n                            0.832031,\n                            0.839844,\n                            0.808594,\n                            0.785156,\n                            0.757812,\n                            0.746094,\n                            0.75,\n                            0.773438,\n                            0.804688,\n                            0.800781,\n                            0.804688,\n                            0.773438,\n                            0.742188,\n                            0.722656,\n                            0.722656,\n                            0.746094,\n                            0.734375,\n                            0.722656,\n                            0.695312,\n                            0.703125,\n                            0.683594,\n                            0.667969,\n                            0.65625,\n                            0.644531,\n                            0.632812,\n                            0.640625,\n                            0.65625,\n                            0.691406,\n                            0.726562,\n                            0.75,\n                            0.734375,\n                            0.765625,\n                            0.75,\n                            0.742188,\n                            0.761719,\n                            0.734375,\n                            0.734375,\n                            0.730469,\n                            0.726562,\n                            0.695312,\n                            0.679688,\n                            0.679688,\n                            0.660156,\n                            0.648438,\n                            0.683594,\n                            0.667969,\n                            0.6875,\n                            0.683594,\n                            0.648438,\n                            0.632812,\n                            0.628906,\n                            0.609375,\n                            0.59375,\n                            0.597656,\n                            0.574219,\n                            0.609375,\n                            0.617188,\n                            0.644531,\n                            0.625,\n                            0.652344,\n                            0.648438,\n                            0.625,\n                            0.660156,\n                            0.640625,\n                            0.613281,\n                            0.644531,\n                            0.617188,\n                            0.644531,\n                            0.625,\n                            0.625,\n                            0.625,\n                            0.660156,\n                            0.648438,\n                            0.632812,\n                            0.664062,\n                            0.664062,\n                            0.636719,\n                            0.613281,\n                            0.617188,\n                            0.617188,\n                            0.617188,\n                            0.605469,\n                            0.613281,\n                            0.59375,\n                            0.625,\n                            0.648438,\n                            0.664062,\n                            0.664062,\n                            0.695312,\n                            0.695312,\n                            0.664062,\n                            0.691406,\n                            0.660156,\n                            0.636719,\n                            0.605469,\n                            0.625,\n                            0.660156,\n                            0.683594,\n                            0.664062,\n                            0.691406,\n                            0.660156,\n                            0.65625,\n                            0.644531,\n                            0.628906,\n                            0.648438,\n                            0.683594,\n                            0.675781,\n                            0.65625,\n                            0.664062,\n                            0.664062,\n                            0.660156,\n                            0.640625,\n                            0.605469,\n                            0.574219,\n                            0.585938,\n                            0.609375,\n                            0.59375,\n                            0.601562,\n                            0.589844,\n                            0.589844,\n                            0.582031,\n                            0.578125,\n                            0.570312,\n                            0.539062,\n                            0.511719,\n                            0.511719,\n                            0.515625,\n                            0.527344,\n                            0.5,\n                            0.535156,\n                            0.558594,\n                            0.574219,\n                            0.546875,\n                            0.574219,\n                            0.550781,\n                            0.574219,\n                            0.570312,\n                            0.558594,\n                            0.539062,\n                            0.519531,\n                            0.492188,\n                            0.492188,\n                            0.46875,\n                            0.496094,\n                            0.496094,\n                            0.507812\n                          ]\n                        }\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_12\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Pitch & Echo.amxd\",\n                  \"origin\": \"Pitch & Echo.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Pitch & Echo.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Pitch & Echo.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"Dry/Wet\": 100.0,\n                        \"EchoEnable\": 1.0,\n                        \"EchoFeedback\": 50.0,\n                        \"EchoMode\": 0.0,\n                        \"EchoSync\": 13.0,\n                        \"EchoTime\": 1248.031496062988,\n                        \"Gain\": 0.0,\n                        \"Glide\": 50.0,\n                        \"Latency\": 1.0,\n                        \"Quality\": 3.0,\n                        \"Transp\": 935.0,\n                        \"VibDepth\": 25.0,\n                        \"VibDirection\": 0.0,\n                        \"VibEnable\": 0.0,\n                        \"VibNoiseAmount\": 50.0,\n                        \"VibNoiseEnable\": 0.0,\n                        \"VibOscAmount\": 50.0,\n                        \"VibOscEnable\": 1.0,\n                        \"VibRate\": 4.0\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"DEV_13\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"Feedback Network.amxd\",\n                  \"origin\": \"Feedback Network.amxd\",\n                  \"type\": \"amxd\",\n                  \"subtype\": \"Undefined\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"name\": \"Feedback Network.amxd\",\n                    \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Feedback Network/Feedback Network.amxd\",\n                    \"valuedictionary\": {\n                      \"parameter_values\": {\n                        \"AFB-Clip\": 24.12000300000008,\n                        \"AFB-Rate\": 34.48799900000007,\n                        \"AFB-Sens\": 34.992001000000066,\n                        \"Auto-FB\": 1.0,\n                        \"AutoGainRate\": 57.568001000000066,\n                        \"AutoNetRate\": 71.37599900000001,\n                        \"AutoRandNetwork\": 1.0,\n                        \"GL-Delay\": 58.928001,\n                        \"GL-Freq\": 15.0,\n                        \"GL-Q\": 24.56000100000001,\n                        \"RandInLevels\": 1.0,\n                        \"RandSmooth\": 1.0,\n                        \"randTrig\": 0.0,\n                        \"wet/dry\": 1.0,\n                        \"blob\": {\n                          \"FB-Gain\": [\n                            127.0\n                          ],\n                          \"FB-level\": [\n                            127.0\n                          ],\n                          \"InLevelMinMax\": [\n                            41,\n                            81\n                          ],\n                          \"modIn-1\": [\n                            75.92614238468549\n                          ],\n                          \"modIn-2\": [\n                            64.13841661273909\n                          ],\n                          \"modIn-3\": [\n                            72.35393831406222\n                          ],\n                          \"modIn-4\": [\n                            70.02691888411783\n                          ],\n                          \"modIn-5\": [\n                            74.40014880973827\n                          ]\n                        }\n                      }\n                    },\n                    \"active\": 1\n                  }\n                }\n              ],\n              \"HPF[1]\": [\n                20.0\n              ],\n              \"VST_14\": [\n                {\n                  \"filetype\": \"C74Snapshot\",\n                  \"version\": 2,\n                  \"minorversion\": 0,\n                  \"name\": \"AUDelay\",\n                  \"origin\": \"AUDelay.auinfo\",\n                  \"type\": \"AudioUnit\",\n                  \"subtype\": \"AudioEffect\",\n                  \"embed\": 1,\n                  \"snapshot\": {\n                    \"pluginname\": \"AUDelay.auinfo\",\n                    \"plugindisplayname\": \"AUDelay\",\n                    \"pluginsavedname\": \"\",\n                    \"pluginsaveduniqueid\": 1684368505,\n                    \"version\": 1,\n                    \"isbank\": 0,\n                    \"isbase64\": 1,\n                    \"blob\": \"183.hAGaoMGcv.i0AHv.DTfAGfPBJr.CT4VXsUFWsEla0YVXiQWcxUlbTQVXzEFUzkGbkc0b0IFc4AWYWYWYxMWZu4FVU4FcoQGakQlDgAGbr8DDr...............D.....fPHC......A3CfKfG...f.BgjBs....LfQp0kmRDVclgmDjUFa4AA.HTgFmvRL4DjRO42fHB.......DP..........z....................fh\"\n                  }\n                }\n              ],\n              \"delay_left\": [\n                9\n              ],\n              \"delay_right\": [\n                3\n              ],\n              \"time\": [\n                200.0\n              ]\n            }\n          }\n        }\n      },\n      \"snapshotlist\": {\n        \"current_snapshot\": 0,\n        \"entries\": [\n          {\n            \"filetype\": \"C74Snapshot\",\n            \"version\": 2,\n            \"minorversion\": 0,\n            \"name\": \"delay-shootout\",\n            \"origin\": \"delay-shootout\",\n            \"type\": \"patcher\",\n            \"subtype\": \"Undefined\",\n            \"embed\": 1,\n            \"snapshot\": {\n              \"valuedictionary\": {\n                \"parameter_values\": {\n                  \"FX_SELECT\": 1.0,\n                  \"Feedback\": -12.094488188976484,\n                  \"Feedback[1]\": -22.11023622047248,\n                  \"HPF\": 20.0,\n                  \"LPF\": 20000.0,\n                  \"LPF[1]\": 20000.0,\n                  \"Mix\": 100.0,\n                  \"Mix[1]\": 100.0,\n                  \"bypass\": 0.0,\n                  \"bypass[1]\": 0.0,\n                  \"live.gain~\": 0.0,\n                  \"blob\": {\n                    \"DEV_07\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Tapped Delay.amxd\",\n                        \"origin\": \"Tapped Delay.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Tapped Delay.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Tapped Delay/Tapped Delay.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"bpm\": 120.0,\n                              \"centerPan\": 0.0,\n                              \"feedback\": 18.4,\n                              \"randDelay\": 0.0,\n                              \"randPan\": 0.0,\n                              \"tempo\": 0.0,\n                              \"time\": 13.0,\n                              \"wet/dry\": 100.0,\n                              \"blob\": {\n                                \"levels\": [\n                                  0.71,\n                                  0.05,\n                                  0.622222,\n                                  0.666667,\n                                  0.722222,\n                                  0.766667,\n                                  0.833333,\n                                  0.811111,\n                                  0.722222,\n                                  0.588889,\n                                  0.455556,\n                                  0.388889,\n                                  0.366667,\n                                  0.333333,\n                                  0.311111,\n                                  0.222222\n                                ],\n                                \"positions\": [\n                                  0.0,\n                                  0.242718,\n                                  0.029126,\n                                  -0.203883,\n                                  -0.398058,\n                                  -0.436893,\n                                  -0.029126,\n                                  0.320388,\n                                  0.572816,\n                                  0.572816,\n                                  0.514563,\n                                  0.184466,\n                                  -0.165049,\n                                  -0.165049,\n                                  -0.087379,\n                                  0.0\n                                ]\n                              }\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_08\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Max DelayTaps.amxd\",\n                        \"origin\": \"Max DelayTaps.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Max DelayTaps.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max DelayTaps/Max DelayTaps.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"DelaysMax\": 5000.0,\n                              \"DelaysMin\": 0.0,\n                              \"Dry/Wet\": 100.0,\n                              \"Feedback\": 31.181102362204697,\n                              \"LevelsMax\": 100.0,\n                              \"LevelsMin\": 0.0,\n                              \"MasterGain\": 0.0,\n                              \"PansMax\": 17.999999999999993,\n                              \"PansMin\": -50.0,\n                              \"blob\": {\n                                \"Taps\": [\n                                  8\n                                ],\n                                \"Delays\": [\n                                  0.09375,\n                                  -0.17634033306210264,\n                                  -0.3243747828025601,\n                                  -0.42281622373462524,\n                                  -0.4985673919530951,\n                                  -0.560950577951363,\n                                  -0.6144037494668978,\n                                  -0.6614173228346454\n                                ],\n                                \"Levels\": [\n                                  0.614173228346456,\n                                  0.6030444859987246,\n                                  0.5547258413249657,\n                                  0.4557560798686663,\n                                  0.2966178646531575,\n                                  0.0695674562504157,\n                                  -0.23205766119514856,\n                                  -0.614173228346456\n                                ],\n                                \"Pans\": [\n                                  -0.4566929133858266,\n                                  -0.3718791813239333,\n                                  -0.27223636626067743,\n                                  -0.13919605008556257,\n                                  0.13919605008556246,\n                                  0.2722363662606773,\n                                  0.37187918132393327,\n                                  0.4566929133858266\n                                ]\n                              }\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_09\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Max DelayMultiBand.amxd\",\n                        \"origin\": \"Max DelayMultiBand.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Max DelayMultiBand.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max DelayMultiBand/Max DelayMultiBand.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"DirectGain\": -70.0,\n                              \"EffectGain\": 0.0,\n                              \"HighDelL\": 750.0,\n                              \"HighDelR\": 0.0,\n                              \"HighEnable\": 1.0,\n                              \"HighFB\": 0.0,\n                              \"HighGain\": 0.0,\n                              \"HighXFreq\": 4000.0,\n                              \"LowDelL\": 1200.0,\n                              \"LowDelR\": 0.0,\n                              \"LowEnable\": 1.0,\n                              \"LowFB\": 0.0,\n                              \"LowXFreq\": 1000.0,\n                              \"Lowgain\": 0.0,\n                              \"MidDelL\": 900.0,\n                              \"MidDelR\": 1350.0,\n                              \"MidEnable\": 1.0,\n                              \"MidFB\": 45.212598425196816,\n                              \"MidGain\": 0.0\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_10\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Space Echo.amxd\",\n                        \"origin\": \"Space Echo.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Space Echo.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Space Echo/Space Echo.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"WarbleAmount\": 14.0,\n                              \"WarbleSpeed\": 43.0,\n                              \"bpm\": 120.0,\n                              \"clipping\": 0.63,\n                              \"feedback\": 47.0,\n                              \"highpass\": 220.0,\n                              \"inertia\": 2.687,\n                              \"live.menu\": 13.0,\n                              \"lowpass\": 3280.0,\n                              \"reverb_wetdry\": 27.200001,\n                              \"revtime\": 2800.0,\n                              \"tempo\": 0.0,\n                              \"wet/dry\": 100.0\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_11\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Max SpectralDelay.amxd\",\n                        \"origin\": \"Max SpectralDelay.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Max SpectralDelay.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Max SpectralDelay/Max SpectralDelay.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"DelayRandStep\": 10.0,\n                              \"DelayRange\": 2000.0,\n                              \"Dry/Wet\": 100.0,\n                              \"FeedbackRandStep\": 10.0,\n                              \"FeedbackRange\": 50.0,\n                              \"Gain\": 0.0,\n                              \"blob\": {\n                                \"Delays\": [\n                                  0.464844,\n                                  0.488281,\n                                  0.519531,\n                                  0.542969,\n                                  0.519531,\n                                  0.484375,\n                                  0.488281,\n                                  0.46875,\n                                  0.453125,\n                                  0.488281,\n                                  0.464844,\n                                  0.433594,\n                                  0.453125,\n                                  0.464844,\n                                  0.429688,\n                                  0.421875,\n                                  0.441406,\n                                  0.429688,\n                                  0.433594,\n                                  0.457031,\n                                  0.472656,\n                                  0.445312,\n                                  0.476562,\n                                  0.457031,\n                                  0.445312,\n                                  0.464844,\n                                  0.464844,\n                                  0.429688,\n                                  0.429688,\n                                  0.40625,\n                                  0.417969,\n                                  0.453125,\n                                  0.457031,\n                                  0.472656,\n                                  0.496094,\n                                  0.488281,\n                                  0.46875,\n                                  0.496094,\n                                  0.460938,\n                                  0.464844,\n                                  0.445312,\n                                  0.417969,\n                                  0.441406,\n                                  0.40625,\n                                  0.429688,\n                                  0.429688,\n                                  0.441406,\n                                  0.414062,\n                                  0.386719,\n                                  0.363281,\n                                  0.378906,\n                                  0.414062,\n                                  0.445312,\n                                  0.421875,\n                                  0.417969,\n                                  0.382812,\n                                  0.347656,\n                                  0.363281,\n                                  0.339844,\n                                  0.359375,\n                                  0.371094,\n                                  0.359375,\n                                  0.390625,\n                                  0.402344,\n                                  0.425781,\n                                  0.398438,\n                                  0.375,\n                                  0.375,\n                                  0.367188,\n                                  0.371094,\n                                  0.402344,\n                                  0.414062,\n                                  0.410156,\n                                  0.414062,\n                                  0.402344,\n                                  0.378906,\n                                  0.347656,\n                                  0.34375,\n                                  0.363281,\n                                  0.394531,\n                                  0.429688,\n                                  0.457031,\n                                  0.484375,\n                                  0.519531,\n                                  0.550781,\n                                  0.582031,\n                                  0.570312,\n                                  0.570312,\n                                  0.582031,\n                                  0.585938,\n                                  0.5625,\n                                  0.589844,\n                                  0.578125,\n                                  0.558594,\n                                  0.5625,\n                                  0.550781,\n                                  0.558594,\n                                  0.585938,\n                                  0.601562,\n                                  0.597656,\n                                  0.5625,\n                                  0.570312,\n                                  0.539062,\n                                  0.515625,\n                                  0.527344,\n                                  0.550781,\n                                  0.554688,\n                                  0.535156,\n                                  0.503906,\n                                  0.539062,\n                                  0.566406,\n                                  0.585938,\n                                  0.613281,\n                                  0.636719,\n                                  0.664062,\n                                  0.667969,\n                                  0.667969,\n                                  0.695312,\n                                  0.714844,\n                                  0.730469,\n                                  0.722656,\n                                  0.746094,\n                                  0.777344,\n                                  0.773438,\n                                  0.796875,\n                                  0.808594,\n                                  0.785156,\n                                  0.808594,\n                                  0.84375,\n                                  0.839844,\n                                  0.863281,\n                                  0.890625,\n                                  0.882812,\n                                  0.894531,\n                                  0.871094,\n                                  0.90625,\n                                  0.917969,\n                                  0.882812,\n                                  0.882812,\n                                  0.902344,\n                                  0.871094,\n                                  0.855469,\n                                  0.886719,\n                                  0.878906,\n                                  0.878906,\n                                  0.878906,\n                                  0.859375,\n                                  0.878906,\n                                  0.855469,\n                                  0.851562,\n                                  0.820312,\n                                  0.84375,\n                                  0.8125,\n                                  0.816406,\n                                  0.800781,\n                                  0.804688,\n                                  0.777344,\n                                  0.765625,\n                                  0.789062,\n                                  0.761719,\n                                  0.761719,\n                                  0.726562,\n                                  0.699219,\n                                  0.730469,\n                                  0.75,\n                                  0.738281,\n                                  0.730469,\n                                  0.714844,\n                                  0.730469,\n                                  0.761719,\n                                  0.75,\n                                  0.734375,\n                                  0.703125,\n                                  0.738281,\n                                  0.707031,\n                                  0.695312,\n                                  0.675781,\n                                  0.679688,\n                                  0.667969,\n                                  0.640625,\n                                  0.675781,\n                                  0.667969,\n                                  0.699219,\n                                  0.703125,\n                                  0.675781,\n                                  0.691406,\n                                  0.691406,\n                                  0.683594,\n                                  0.703125,\n                                  0.703125,\n                                  0.71875,\n                                  0.71875,\n                                  0.726562,\n                                  0.761719,\n                                  0.738281,\n                                  0.773438,\n                                  0.777344,\n                                  0.765625,\n                                  0.738281,\n                                  0.742188,\n                                  0.769531,\n                                  0.769531,\n                                  0.765625,\n                                  0.792969,\n                                  0.765625,\n                                  0.785156,\n                                  0.761719,\n                                  0.734375,\n                                  0.699219,\n                                  0.667969,\n                                  0.6875,\n                                  0.703125,\n                                  0.699219,\n                                  0.664062,\n                                  0.644531,\n                                  0.636719,\n                                  0.621094,\n                                  0.652344,\n                                  0.6875,\n                                  0.671875,\n                                  0.644531,\n                                  0.664062,\n                                  0.636719,\n                                  0.652344,\n                                  0.628906,\n                                  0.648438,\n                                  0.617188,\n                                  0.625,\n                                  0.652344,\n                                  0.621094,\n                                  0.601562,\n                                  0.582031,\n                                  0.597656,\n                                  0.5625,\n                                  0.539062,\n                                  0.574219,\n                                  0.582031,\n                                  0.574219,\n                                  0.589844,\n                                  0.621094,\n                                  0.652344,\n                                  0.632812,\n                                  0.617188,\n                                  0.636719,\n                                  0.660156,\n                                  0.652344,\n                                  0.632812,\n                                  0.65625,\n                                  0.675781,\n                                  0.679688,\n                                  0.679688,\n                                  0.6875,\n                                  0.65625,\n                                  0.648438,\n                                  0.675781,\n                                  0.679688\n                                ],\n                                \"Feedbacks\": [\n                                  0.710938,\n                                  0.746094,\n                                  0.71875,\n                                  0.71875,\n                                  0.753906,\n                                  0.734375,\n                                  0.707031,\n                                  0.734375,\n                                  0.746094,\n                                  0.742188,\n                                  0.753906,\n                                  0.773438,\n                                  0.753906,\n                                  0.789062,\n                                  0.792969,\n                                  0.796875,\n                                  0.796875,\n                                  0.820312,\n                                  0.820312,\n                                  0.804688,\n                                  0.808594,\n                                  0.832031,\n                                  0.8125,\n                                  0.816406,\n                                  0.796875,\n                                  0.808594,\n                                  0.789062,\n                                  0.765625,\n                                  0.738281,\n                                  0.738281,\n                                  0.71875,\n                                  0.710938,\n                                  0.703125,\n                                  0.710938,\n                                  0.699219,\n                                  0.675781,\n                                  0.675781,\n                                  0.6875,\n                                  0.652344,\n                                  0.667969,\n                                  0.644531,\n                                  0.664062,\n                                  0.648438,\n                                  0.628906,\n                                  0.648438,\n                                  0.664062,\n                                  0.636719,\n                                  0.664062,\n                                  0.671875,\n                                  0.683594,\n                                  0.714844,\n                                  0.679688,\n                                  0.707031,\n                                  0.742188,\n                                  0.734375,\n                                  0.742188,\n                                  0.726562,\n                                  0.71875,\n                                  0.742188,\n                                  0.714844,\n                                  0.730469,\n                                  0.695312,\n                                  0.671875,\n                                  0.652344,\n                                  0.6875,\n                                  0.71875,\n                                  0.738281,\n                                  0.746094,\n                                  0.722656,\n                                  0.726562,\n                                  0.742188,\n                                  0.722656,\n                                  0.707031,\n                                  0.730469,\n                                  0.710938,\n                                  0.675781,\n                                  0.691406,\n                                  0.703125,\n                                  0.722656,\n                                  0.699219,\n                                  0.703125,\n                                  0.714844,\n                                  0.738281,\n                                  0.773438,\n                                  0.789062,\n                                  0.796875,\n                                  0.78125,\n                                  0.804688,\n                                  0.804688,\n                                  0.835938,\n                                  0.871094,\n                                  0.898438,\n                                  0.882812,\n                                  0.851562,\n                                  0.875,\n                                  0.851562,\n                                  0.835938,\n                                  0.8125,\n                                  0.84375,\n                                  0.84375,\n                                  0.875,\n                                  0.863281,\n                                  0.84375,\n                                  0.8125,\n                                  0.828125,\n                                  0.828125,\n                                  0.835938,\n                                  0.839844,\n                                  0.875,\n                                  0.851562,\n                                  0.832031,\n                                  0.839844,\n                                  0.808594,\n                                  0.785156,\n                                  0.757812,\n                                  0.746094,\n                                  0.75,\n                                  0.773438,\n                                  0.804688,\n                                  0.800781,\n                                  0.804688,\n                                  0.773438,\n                                  0.742188,\n                                  0.722656,\n                                  0.722656,\n                                  0.746094,\n                                  0.734375,\n                                  0.722656,\n                                  0.695312,\n                                  0.703125,\n                                  0.683594,\n                                  0.667969,\n                                  0.65625,\n                                  0.644531,\n                                  0.632812,\n                                  0.640625,\n                                  0.65625,\n                                  0.691406,\n                                  0.726562,\n                                  0.75,\n                                  0.734375,\n                                  0.765625,\n                                  0.75,\n                                  0.742188,\n                                  0.761719,\n                                  0.734375,\n                                  0.734375,\n                                  0.730469,\n                                  0.726562,\n                                  0.695312,\n                                  0.679688,\n                                  0.679688,\n                                  0.660156,\n                                  0.648438,\n                                  0.683594,\n                                  0.667969,\n                                  0.6875,\n                                  0.683594,\n                                  0.648438,\n                                  0.632812,\n                                  0.628906,\n                                  0.609375,\n                                  0.59375,\n                                  0.597656,\n                                  0.574219,\n                                  0.609375,\n                                  0.617188,\n                                  0.644531,\n                                  0.625,\n                                  0.652344,\n                                  0.648438,\n                                  0.625,\n                                  0.660156,\n                                  0.640625,\n                                  0.613281,\n                                  0.644531,\n                                  0.617188,\n                                  0.644531,\n                                  0.625,\n                                  0.625,\n                                  0.625,\n                                  0.660156,\n                                  0.648438,\n                                  0.632812,\n                                  0.664062,\n                                  0.664062,\n                                  0.636719,\n                                  0.613281,\n                                  0.617188,\n                                  0.617188,\n                                  0.617188,\n                                  0.605469,\n                                  0.613281,\n                                  0.59375,\n                                  0.625,\n                                  0.648438,\n                                  0.664062,\n                                  0.664062,\n                                  0.695312,\n                                  0.695312,\n                                  0.664062,\n                                  0.691406,\n                                  0.660156,\n                                  0.636719,\n                                  0.605469,\n                                  0.625,\n                                  0.660156,\n                                  0.683594,\n                                  0.664062,\n                                  0.691406,\n                                  0.660156,\n                                  0.65625,\n                                  0.644531,\n                                  0.628906,\n                                  0.648438,\n                                  0.683594,\n                                  0.675781,\n                                  0.65625,\n                                  0.664062,\n                                  0.664062,\n                                  0.660156,\n                                  0.640625,\n                                  0.605469,\n                                  0.574219,\n                                  0.585938,\n                                  0.609375,\n                                  0.59375,\n                                  0.601562,\n                                  0.589844,\n                                  0.589844,\n                                  0.582031,\n                                  0.578125,\n                                  0.570312,\n                                  0.539062,\n                                  0.511719,\n                                  0.511719,\n                                  0.515625,\n                                  0.527344,\n                                  0.5,\n                                  0.535156,\n                                  0.558594,\n                                  0.574219,\n                                  0.546875,\n                                  0.574219,\n                                  0.550781,\n                                  0.574219,\n                                  0.570312,\n                                  0.558594,\n                                  0.539062,\n                                  0.519531,\n                                  0.492188,\n                                  0.492188,\n                                  0.46875,\n                                  0.496094,\n                                  0.496094,\n                                  0.507812\n                                ]\n                              }\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_12\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Pitch & Echo.amxd\",\n                        \"origin\": \"Pitch & Echo.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Pitch & Echo.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Pitch & Echo.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"Dry/Wet\": 100.0,\n                              \"EchoEnable\": 1.0,\n                              \"EchoFeedback\": 50.0,\n                              \"EchoMode\": 0.0,\n                              \"EchoSync\": 13.0,\n                              \"EchoTime\": 1248.031496062988,\n                              \"Gain\": 0.0,\n                              \"Glide\": 50.0,\n                              \"Latency\": 1.0,\n                              \"Quality\": 3.0,\n                              \"Transp\": 935.0,\n                              \"VibDepth\": 25.0,\n                              \"VibDirection\": 0.0,\n                              \"VibEnable\": 0.0,\n                              \"VibNoiseAmount\": 50.0,\n                              \"VibNoiseEnable\": 0.0,\n                              \"VibOscAmount\": 50.0,\n                              \"VibOscEnable\": 1.0,\n                              \"VibRate\": 4.0\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"DEV_13\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"Feedback Network.amxd\",\n                        \"origin\": \"Feedback Network.amxd\",\n                        \"type\": \"amxd\",\n                        \"subtype\": \"Undefined\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"name\": \"Feedback Network.amxd\",\n                          \"origname\": \"Package:/Max for Live/patchers/Max Audio Effect/Feedback Network/Feedback Network.amxd\",\n                          \"valuedictionary\": {\n                            \"parameter_values\": {\n                              \"AFB-Clip\": 24.12000300000008,\n                              \"AFB-Rate\": 34.48799900000007,\n                              \"AFB-Sens\": 34.992001000000066,\n                              \"Auto-FB\": 1.0,\n                              \"AutoGainRate\": 57.568001000000066,\n                              \"AutoNetRate\": 71.37599900000001,\n                              \"AutoRandNetwork\": 1.0,\n                              \"GL-Delay\": 58.928001,\n                              \"GL-Freq\": 15.0,\n                              \"GL-Q\": 24.56000100000001,\n                              \"RandInLevels\": 1.0,\n                              \"RandSmooth\": 1.0,\n                              \"randTrig\": 0.0,\n                              \"wet/dry\": 1.0,\n                              \"blob\": {\n                                \"FB-Gain\": [\n                                  127.0\n                                ],\n                                \"FB-level\": [\n                                  127.0\n                                ],\n                                \"InLevelMinMax\": [\n                                  41,\n                                  81\n                                ],\n                                \"modIn-1\": [\n                                  75.92614238468549\n                                ],\n                                \"modIn-2\": [\n                                  64.13841661273909\n                                ],\n                                \"modIn-3\": [\n                                  72.35393831406222\n                                ],\n                                \"modIn-4\": [\n                                  70.02691888411783\n                                ],\n                                \"modIn-5\": [\n                                  74.40014880973827\n                                ]\n                              }\n                            }\n                          },\n                          \"active\": 1\n                        }\n                      }\n                    ],\n                    \"HPF[1]\": [\n                      20.0\n                    ],\n                    \"VST_14\": [\n                      {\n                        \"filetype\": \"C74Snapshot\",\n                        \"version\": 2,\n                        \"minorversion\": 0,\n                        \"name\": \"AUDelay\",\n                        \"origin\": \"AUDelay.auinfo\",\n                        \"type\": \"AudioUnit\",\n                        \"subtype\": \"AudioEffect\",\n                        \"embed\": 1,\n                        \"snapshot\": {\n                          \"pluginname\": \"AUDelay.auinfo\",\n                          \"plugindisplayname\": \"AUDelay\",\n                          \"pluginsavedname\": \"\",\n                          \"pluginsaveduniqueid\": 1684368505,\n                          \"version\": 1,\n                          \"isbank\": 0,\n                          \"isbase64\": 1,\n                          \"blob\": \"183.hAGaoMGcv.i0AHv.DTfAGfPBJr.CT4VXsUFWsEla0YVXiQWcxUlbTQVXzEFUzkGbkc0b0IFc4AWYWYWYxMWZu4FVU4FcoQGakQlDgAGbr8DDr...............D.....fPHC......A3CfKfG...f.BgjBs....LfQp0kmRDVclgmDjUFa4AA.HTgFmvRL4DjRO42fHB.......DP..........z....................fh\"\n                        }\n                      }\n                    ],\n                    \"delay_left\": [\n                      9\n                    ],\n                    \"delay_right\": [\n                      3\n                    ],\n                    \"time\": [\n                      200.0\n                    ]\n                  }\n                }\n              }\n            },\n            \"fileref\": {\n              \"name\": \"delay-shootout\",\n              \"filename\": \"delay-shootout.maxsnap\",\n              \"filepath\": \"~/Documents/Max 9/Snapshots\",\n              \"filepos\": -1,\n              \"snapshotfileid\": \"de8041caeec067fa75e78b3d2d1db366\"\n            }\n          }\n        ]\n      }\n    },\n    \"parameters\": {\n      \"obj-107::obj-1\": [\n        \"Mix[1]\",\n        \"Mix\",\n        0\n      ],\n      \"obj-107::obj-21\": [\n        \"HPF[1]\",\n        \"HPF\",\n        0\n      ],\n      \"obj-107::obj-25\": [\n        \"LPF[1]\",\n        \"LPF\",\n        0\n      ],\n      \"obj-107::obj-28\": [\n        \"Feedback[1]\",\n        \"Feedback\",\n        0\n      ],\n      \"obj-107::obj-7\": [\n        \"bypass[1]\",\n        \"bypass\",\n        0\n      ],\n      \"obj-107::obj-9\": [\n        \"time\",\n        \"Time\",\n        0\n      ],\n      \"obj-122::obj-118\": [\n        \"Mix\",\n        \"Mix\",\n        0\n      ],\n      \"obj-122::obj-27\": [\n        \"Feedback\",\n        \"Feedback\",\n        0\n      ],\n      \"obj-122::obj-49\": [\n        \"HPF\",\n        \"HPF\",\n        0\n      ],\n      \"obj-122::obj-50\": [\n        \"LPF\",\n        \"LPF\",\n        0\n      ],\n      \"obj-122::obj-7\": [\n        \"bypass\",\n        \"bypass\",\n        0\n      ],\n      \"obj-122::obj-708\": [\n        \"duration.r\",\n        \"duration.r\",\n        0\n      ],\n      \"obj-122::obj-9\": [\n        \"delay_right\",\n        \"delay_right\",\n        0\n      ],\n      \"obj-122::obj-957\": [\n        \"duration.l\",\n        \"duration.l\",\n        0\n      ],\n      \"obj-122::obj-96\": [\n        \"delay_left\",\n        \"delay_left\",\n        0\n      ],\n      \"obj-137\": [\n        \"DEV_07\",\n        \"DEV_07\",\n        0\n      ],\n      \"obj-150\": [\n        \"DEV_08\",\n        \"DEV_08\",\n        0\n      ],\n      \"obj-163\": [\n        \"DEV_09\",\n        \"DEV_09\",\n        0\n      ],\n      \"obj-174\": [\n        \"DEV_10\",\n        \"DEV_10\",\n        0\n      ],\n      \"obj-187\": [\n        \"DEV_11\",\n        \"DEV_11\",\n        0\n      ],\n      \"obj-200\": [\n        \"DEV_12\",\n        \"DEV_12\",\n        0\n      ],\n      \"obj-213\": [\n        \"DEV_13\",\n        \"DEV_13\",\n        0\n      ],\n      \"obj-225\": [\n        \"VST_14\",\n        \"VST_14\",\n        0\n      ],\n      \"obj-28\": [\n        \"FX_SELECT\",\n        \"FX\",\n        0\n      ],\n      \"obj-303\": [\n        \"live.gain~\",\n        \"live.gain~\",\n        0\n      ],\n      \"parameterbanks\": {\n        \"0\": {\n          \"index\": 0,\n          \"name\": \"\",\n          \"parameters\": [\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\"\n          ],\n          \"buttons\": [\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\",\n            \"-\"\n          ]\n        }\n      },\n      \"inherited_shortname\": 1\n    }\n  }\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
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
            "obj-88",
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
            "obj-104",
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
            "obj-115",
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
            "obj-115",
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
            "obj-122",
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
            1
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
            "obj-122",
            1
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
            "obj-129",
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
            "obj-137",
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
            "obj-137",
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
            1
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
            "obj-141",
            0
          ],
          "source": [
            "obj-137",
            1
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
            "obj-137",
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
            "obj-142",
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
            "obj-150",
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
            "obj-150",
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
            "obj-150",
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
            "obj-153",
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
            "obj-154",
            0
          ],
          "source": [
            "obj-150",
            1
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
            "obj-150",
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
            "obj-155",
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
            "obj-164",
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
            "obj-165",
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
            "obj-174",
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
            "obj-174",
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
            "obj-174",
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
            "obj-174",
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
            "obj-174",
            1
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
            "obj-174",
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
            "obj-187",
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
            "obj-187",
            1
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
            "obj-190",
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
            "obj-191",
            0
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
            "obj-187",
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
            "obj-192",
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
            "obj-200",
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
            "obj-200",
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
            1
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
            "obj-200",
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
            "obj-200",
            1
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
            "obj-200",
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
            "obj-208",
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
            "obj-218",
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
            "obj-254",
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
            "obj-255",
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
            1
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
            "obj-225",
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
            "obj-225",
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
            "obj-237",
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
            "obj-241",
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
            "obj-245",
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
            "obj-249",
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
            "obj-236",
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
            "obj-232",
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
            "obj-240",
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
            "obj-232",
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
            "obj-244",
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
            "obj-232",
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
            "obj-246",
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
            "obj-252",
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
            "obj-232",
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
            "obj-225",
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
            "obj-259",
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
            "obj-259",
            2
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
            "obj-259",
            3
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
            "obj-259",
            4
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
            "obj-259",
            5
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
            "obj-259",
            6
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
            "obj-259",
            7
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
            "obj-259",
            8
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
            "obj-259",
            9
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
            "obj-259",
            10
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
            "obj-259",
            11
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
            "obj-259",
            12
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
            "obj-259",
            13
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
            "obj-259",
            14
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
            "obj-275",
            2
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
            "obj-275",
            3
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
            "obj-275",
            4
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
            "obj-275",
            5
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
            "obj-275",
            6
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
            "obj-275",
            7
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
            "obj-275",
            8
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
            "obj-275",
            9
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
            "obj-275",
            10
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
            "obj-275",
            11
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
            "obj-275",
            12
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
            "obj-275",
            13
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
            "obj-275",
            14
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
            "obj-299",
            0
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
            "obj-297",
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
            "obj-300",
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
            "obj-301",
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
            "obj-295",
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
            "obj-296",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-299",
            1
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
            "obj-300",
            1
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
            1
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
            "obj-302",
            1
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
            "obj-299",
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
            "obj-303",
            1
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
            "obj-304",
            1
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
            "obj-304",
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
            "obj-308",
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
            "obj-311",
            0
          ],
          "source": [
            "obj-309",
            1
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
            "obj-312",
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
            "obj-314",
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
            "obj-88",
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
            "obj-336",
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
            "obj-338",
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
            "obj-337",
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
            "obj-40",
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
            "obj-41",
            0
          ],
          "source": [
            "obj-40",
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
            "obj-45",
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
            "obj-46",
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
            "obj-47",
            1
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
            "obj-47",
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
            "obj-47",
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
            "obj-47",
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
            "obj-47",
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
            "obj-47",
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
            "obj-64",
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
            "obj-68",
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
            "obj-77",
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
            "obj-78",
            0
          ],
          "source": [
            "obj-68",
            1
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
            "obj-68",
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
            "obj-68",
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
            "obj-68",
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
            "obj-68",
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
            "obj-68",
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
            "obj-68",
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
            "obj-81",
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
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-88",
            1
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
            "obj-97",
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
            "obj-98",
            0
          ],
          "source": [
            "obj-88",
            1
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
            "obj-89",
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
            "obj-88",
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
            "obj-88",
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
            "obj-88",
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
            "obj-88",
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
            "obj-88",
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
            "obj-88",
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
            "obj-88",
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
            "obj-100",
            0
          ],
          "source": [
            "obj-99",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1,
    "bglocked": 1,
    "snapshot": {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "snapshotlist",
      "origin": "jpatcher",
      "type": "list",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
        "valuedictionary": {
          "parameter_values": {
            "FX_SELECT": 1.0,
            "Feedback": -12.094488188976484,
            "Feedback[1]": -22.11023622047248,
            "HPF": 20.0,
            "LPF": 20000.0,
            "LPF[1]": 20000.0,
            "Mix": 100.0,
            "Mix[1]": 100.0,
            "bypass": 0.0,
            "bypass[1]": 0.0,
            "live.gain~": 0.0,
            "blob": {
              "DEV_07": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Tapped Delay.amxd",
                  "origin": "Tapped Delay.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Tapped Delay.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Tapped Delay/Tapped Delay.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "bpm": 120.0,
                        "centerPan": 0.0,
                        "feedback": 18.4,
                        "randDelay": 0.0,
                        "randPan": 0.0,
                        "tempo": 0.0,
                        "time": 13.0,
                        "wet/dry": 100.0,
                        "blob": {
                          "levels": [
                            0.71,
                            0.05,
                            0.622222,
                            0.666667,
                            0.722222,
                            0.766667,
                            0.833333,
                            0.811111,
                            0.722222,
                            0.588889,
                            0.455556,
                            0.388889,
                            0.366667,
                            0.333333,
                            0.311111,
                            0.222222
                          ],
                          "positions": [
                            0.0,
                            0.242718,
                            0.029126,
                            -0.203883,
                            -0.398058,
                            -0.436893,
                            -0.029126,
                            0.320388,
                            0.572816,
                            0.572816,
                            0.514563,
                            0.184466,
                            -0.165049,
                            -0.165049,
                            -0.087379,
                            0.0
                          ]
                        }
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_08": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Max DelayTaps.amxd",
                  "origin": "Max DelayTaps.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Max DelayTaps.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max DelayTaps/Max DelayTaps.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "DelaysMax": 5000.0,
                        "DelaysMin": 0.0,
                        "Dry/Wet": 100.0,
                        "Feedback": 31.181102362204697,
                        "LevelsMax": 100.0,
                        "LevelsMin": 0.0,
                        "MasterGain": 0.0,
                        "PansMax": 17.999999999999993,
                        "PansMin": -50.0,
                        "blob": {
                          "Taps": [
                            8
                          ],
                          "Delays": [
                            0.09375,
                            -0.17634033306210264,
                            -0.3243747828025601,
                            -0.42281622373462524,
                            -0.4985673919530951,
                            -0.560950577951363,
                            -0.6144037494668978,
                            -0.6614173228346454
                          ],
                          "Levels": [
                            0.614173228346456,
                            0.6030444859987246,
                            0.5547258413249657,
                            0.4557560798686663,
                            0.2966178646531575,
                            0.0695674562504157,
                            -0.23205766119514856,
                            -0.614173228346456
                          ],
                          "Pans": [
                            -0.4566929133858266,
                            -0.3718791813239333,
                            -0.27223636626067743,
                            -0.13919605008556257,
                            0.13919605008556246,
                            0.2722363662606773,
                            0.37187918132393327,
                            0.4566929133858266
                          ]
                        }
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_09": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Max DelayMultiBand.amxd",
                  "origin": "Max DelayMultiBand.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Max DelayMultiBand.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max DelayMultiBand/Max DelayMultiBand.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "DirectGain": -70.0,
                        "EffectGain": 0.0,
                        "HighDelL": 750.0,
                        "HighDelR": 0.0,
                        "HighEnable": 1.0,
                        "HighFB": 0.0,
                        "HighGain": 0.0,
                        "HighXFreq": 4000.0,
                        "LowDelL": 1200.0,
                        "LowDelR": 0.0,
                        "LowEnable": 1.0,
                        "LowFB": 0.0,
                        "LowXFreq": 1000.0,
                        "Lowgain": 0.0,
                        "MidDelL": 900.0,
                        "MidDelR": 1350.0,
                        "MidEnable": 1.0,
                        "MidFB": 45.212598425196816,
                        "MidGain": 0.0
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_10": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Space Echo.amxd",
                  "origin": "Space Echo.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Space Echo.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Space Echo/Space Echo.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "WarbleAmount": 14.0,
                        "WarbleSpeed": 43.0,
                        "bpm": 120.0,
                        "clipping": 0.63,
                        "feedback": 47.0,
                        "highpass": 220.0,
                        "inertia": 2.687,
                        "live.menu": 13.0,
                        "lowpass": 3280.0,
                        "reverb_wetdry": 27.200001,
                        "revtime": 2800.0,
                        "tempo": 0.0,
                        "wet/dry": 100.0
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_11": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Max SpectralDelay.amxd",
                  "origin": "Max SpectralDelay.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Max SpectralDelay.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max SpectralDelay/Max SpectralDelay.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "DelayRandStep": 10.0,
                        "DelayRange": 2000.0,
                        "Dry/Wet": 100.0,
                        "FeedbackRandStep": 10.0,
                        "FeedbackRange": 50.0,
                        "Gain": 0.0,
                        "blob": {
                          "Delays": [
                            0.464844,
                            0.488281,
                            0.519531,
                            0.542969,
                            0.519531,
                            0.484375,
                            0.488281,
                            0.46875,
                            0.453125,
                            0.488281,
                            0.464844,
                            0.433594,
                            0.453125,
                            0.464844,
                            0.429688,
                            0.421875,
                            0.441406,
                            0.429688,
                            0.433594,
                            0.457031,
                            0.472656,
                            0.445312,
                            0.476562,
                            0.457031,
                            0.445312,
                            0.464844,
                            0.464844,
                            0.429688,
                            0.429688,
                            0.40625,
                            0.417969,
                            0.453125,
                            0.457031,
                            0.472656,
                            0.496094,
                            0.488281,
                            0.46875,
                            0.496094,
                            0.460938,
                            0.464844,
                            0.445312,
                            0.417969,
                            0.441406,
                            0.40625,
                            0.429688,
                            0.429688,
                            0.441406,
                            0.414062,
                            0.386719,
                            0.363281,
                            0.378906,
                            0.414062,
                            0.445312,
                            0.421875,
                            0.417969,
                            0.382812,
                            0.347656,
                            0.363281,
                            0.339844,
                            0.359375,
                            0.371094,
                            0.359375,
                            0.390625,
                            0.402344,
                            0.425781,
                            0.398438,
                            0.375,
                            0.375,
                            0.367188,
                            0.371094,
                            0.402344,
                            0.414062,
                            0.410156,
                            0.414062,
                            0.402344,
                            0.378906,
                            0.347656,
                            0.34375,
                            0.363281,
                            0.394531,
                            0.429688,
                            0.457031,
                            0.484375,
                            0.519531,
                            0.550781,
                            0.582031,
                            0.570312,
                            0.570312,
                            0.582031,
                            0.585938,
                            0.5625,
                            0.589844,
                            0.578125,
                            0.558594,
                            0.5625,
                            0.550781,
                            0.558594,
                            0.585938,
                            0.601562,
                            0.597656,
                            0.5625,
                            0.570312,
                            0.539062,
                            0.515625,
                            0.527344,
                            0.550781,
                            0.554688,
                            0.535156,
                            0.503906,
                            0.539062,
                            0.566406,
                            0.585938,
                            0.613281,
                            0.636719,
                            0.664062,
                            0.667969,
                            0.667969,
                            0.695312,
                            0.714844,
                            0.730469,
                            0.722656,
                            0.746094,
                            0.777344,
                            0.773438,
                            0.796875,
                            0.808594,
                            0.785156,
                            0.808594,
                            0.84375,
                            0.839844,
                            0.863281,
                            0.890625,
                            0.882812,
                            0.894531,
                            0.871094,
                            0.90625,
                            0.917969,
                            0.882812,
                            0.882812,
                            0.902344,
                            0.871094,
                            0.855469,
                            0.886719,
                            0.878906,
                            0.878906,
                            0.878906,
                            0.859375,
                            0.878906,
                            0.855469,
                            0.851562,
                            0.820312,
                            0.84375,
                            0.8125,
                            0.816406,
                            0.800781,
                            0.804688,
                            0.777344,
                            0.765625,
                            0.789062,
                            0.761719,
                            0.761719,
                            0.726562,
                            0.699219,
                            0.730469,
                            0.75,
                            0.738281,
                            0.730469,
                            0.714844,
                            0.730469,
                            0.761719,
                            0.75,
                            0.734375,
                            0.703125,
                            0.738281,
                            0.707031,
                            0.695312,
                            0.675781,
                            0.679688,
                            0.667969,
                            0.640625,
                            0.675781,
                            0.667969,
                            0.699219,
                            0.703125,
                            0.675781,
                            0.691406,
                            0.691406,
                            0.683594,
                            0.703125,
                            0.703125,
                            0.71875,
                            0.71875,
                            0.726562,
                            0.761719,
                            0.738281,
                            0.773438,
                            0.777344,
                            0.765625,
                            0.738281,
                            0.742188,
                            0.769531,
                            0.769531,
                            0.765625,
                            0.792969,
                            0.765625,
                            0.785156,
                            0.761719,
                            0.734375,
                            0.699219,
                            0.667969,
                            0.6875,
                            0.703125,
                            0.699219,
                            0.664062,
                            0.644531,
                            0.636719,
                            0.621094,
                            0.652344,
                            0.6875,
                            0.671875,
                            0.644531,
                            0.664062,
                            0.636719,
                            0.652344,
                            0.628906,
                            0.648438,
                            0.617188,
                            0.625,
                            0.652344,
                            0.621094,
                            0.601562,
                            0.582031,
                            0.597656,
                            0.5625,
                            0.539062,
                            0.574219,
                            0.582031,
                            0.574219,
                            0.589844,
                            0.621094,
                            0.652344,
                            0.632812,
                            0.617188,
                            0.636719,
                            0.660156,
                            0.652344,
                            0.632812,
                            0.65625,
                            0.675781,
                            0.679688,
                            0.679688,
                            0.6875,
                            0.65625,
                            0.648438,
                            0.675781,
                            0.679688
                          ],
                          "Feedbacks": [
                            0.710938,
                            0.746094,
                            0.71875,
                            0.71875,
                            0.753906,
                            0.734375,
                            0.707031,
                            0.734375,
                            0.746094,
                            0.742188,
                            0.753906,
                            0.773438,
                            0.753906,
                            0.789062,
                            0.792969,
                            0.796875,
                            0.796875,
                            0.820312,
                            0.820312,
                            0.804688,
                            0.808594,
                            0.832031,
                            0.8125,
                            0.816406,
                            0.796875,
                            0.808594,
                            0.789062,
                            0.765625,
                            0.738281,
                            0.738281,
                            0.71875,
                            0.710938,
                            0.703125,
                            0.710938,
                            0.699219,
                            0.675781,
                            0.675781,
                            0.6875,
                            0.652344,
                            0.667969,
                            0.644531,
                            0.664062,
                            0.648438,
                            0.628906,
                            0.648438,
                            0.664062,
                            0.636719,
                            0.664062,
                            0.671875,
                            0.683594,
                            0.714844,
                            0.679688,
                            0.707031,
                            0.742188,
                            0.734375,
                            0.742188,
                            0.726562,
                            0.71875,
                            0.742188,
                            0.714844,
                            0.730469,
                            0.695312,
                            0.671875,
                            0.652344,
                            0.6875,
                            0.71875,
                            0.738281,
                            0.746094,
                            0.722656,
                            0.726562,
                            0.742188,
                            0.722656,
                            0.707031,
                            0.730469,
                            0.710938,
                            0.675781,
                            0.691406,
                            0.703125,
                            0.722656,
                            0.699219,
                            0.703125,
                            0.714844,
                            0.738281,
                            0.773438,
                            0.789062,
                            0.796875,
                            0.78125,
                            0.804688,
                            0.804688,
                            0.835938,
                            0.871094,
                            0.898438,
                            0.882812,
                            0.851562,
                            0.875,
                            0.851562,
                            0.835938,
                            0.8125,
                            0.84375,
                            0.84375,
                            0.875,
                            0.863281,
                            0.84375,
                            0.8125,
                            0.828125,
                            0.828125,
                            0.835938,
                            0.839844,
                            0.875,
                            0.851562,
                            0.832031,
                            0.839844,
                            0.808594,
                            0.785156,
                            0.757812,
                            0.746094,
                            0.75,
                            0.773438,
                            0.804688,
                            0.800781,
                            0.804688,
                            0.773438,
                            0.742188,
                            0.722656,
                            0.722656,
                            0.746094,
                            0.734375,
                            0.722656,
                            0.695312,
                            0.703125,
                            0.683594,
                            0.667969,
                            0.65625,
                            0.644531,
                            0.632812,
                            0.640625,
                            0.65625,
                            0.691406,
                            0.726562,
                            0.75,
                            0.734375,
                            0.765625,
                            0.75,
                            0.742188,
                            0.761719,
                            0.734375,
                            0.734375,
                            0.730469,
                            0.726562,
                            0.695312,
                            0.679688,
                            0.679688,
                            0.660156,
                            0.648438,
                            0.683594,
                            0.667969,
                            0.6875,
                            0.683594,
                            0.648438,
                            0.632812,
                            0.628906,
                            0.609375,
                            0.59375,
                            0.597656,
                            0.574219,
                            0.609375,
                            0.617188,
                            0.644531,
                            0.625,
                            0.652344,
                            0.648438,
                            0.625,
                            0.660156,
                            0.640625,
                            0.613281,
                            0.644531,
                            0.617188,
                            0.644531,
                            0.625,
                            0.625,
                            0.625,
                            0.660156,
                            0.648438,
                            0.632812,
                            0.664062,
                            0.664062,
                            0.636719,
                            0.613281,
                            0.617188,
                            0.617188,
                            0.617188,
                            0.605469,
                            0.613281,
                            0.59375,
                            0.625,
                            0.648438,
                            0.664062,
                            0.664062,
                            0.695312,
                            0.695312,
                            0.664062,
                            0.691406,
                            0.660156,
                            0.636719,
                            0.605469,
                            0.625,
                            0.660156,
                            0.683594,
                            0.664062,
                            0.691406,
                            0.660156,
                            0.65625,
                            0.644531,
                            0.628906,
                            0.648438,
                            0.683594,
                            0.675781,
                            0.65625,
                            0.664062,
                            0.664062,
                            0.660156,
                            0.640625,
                            0.605469,
                            0.574219,
                            0.585938,
                            0.609375,
                            0.59375,
                            0.601562,
                            0.589844,
                            0.589844,
                            0.582031,
                            0.578125,
                            0.570312,
                            0.539062,
                            0.511719,
                            0.511719,
                            0.515625,
                            0.527344,
                            0.5,
                            0.535156,
                            0.558594,
                            0.574219,
                            0.546875,
                            0.574219,
                            0.550781,
                            0.574219,
                            0.570312,
                            0.558594,
                            0.539062,
                            0.519531,
                            0.492188,
                            0.492188,
                            0.46875,
                            0.496094,
                            0.496094,
                            0.507812
                          ]
                        }
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_12": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Pitch & Echo.amxd",
                  "origin": "Pitch & Echo.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Pitch & Echo.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Pitch & Echo.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "Dry/Wet": 100.0,
                        "EchoEnable": 1.0,
                        "EchoFeedback": 50.0,
                        "EchoMode": 0.0,
                        "EchoSync": 13.0,
                        "EchoTime": 1248.031496062988,
                        "Gain": 0.0,
                        "Glide": 50.0,
                        "Latency": 1.0,
                        "Quality": 3.0,
                        "Transp": 935.0,
                        "VibDepth": 25.0,
                        "VibDirection": 0.0,
                        "VibEnable": 0.0,
                        "VibNoiseAmount": 50.0,
                        "VibNoiseEnable": 0.0,
                        "VibOscAmount": 50.0,
                        "VibOscEnable": 1.0,
                        "VibRate": 4.0
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "DEV_13": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "Feedback Network.amxd",
                  "origin": "Feedback Network.amxd",
                  "type": "amxd",
                  "subtype": "Undefined",
                  "embed": 1,
                  "snapshot": {
                    "name": "Feedback Network.amxd",
                    "origname": "Package:/Max for Live/patchers/Max Audio Effect/Feedback Network/Feedback Network.amxd",
                    "valuedictionary": {
                      "parameter_values": {
                        "AFB-Clip": 24.12000300000008,
                        "AFB-Rate": 34.48799900000007,
                        "AFB-Sens": 34.992001000000066,
                        "Auto-FB": 1.0,
                        "AutoGainRate": 57.568001000000066,
                        "AutoNetRate": 71.37599900000001,
                        "AutoRandNetwork": 1.0,
                        "GL-Delay": 58.928001,
                        "GL-Freq": 15.0,
                        "GL-Q": 24.56000100000001,
                        "RandInLevels": 1.0,
                        "RandSmooth": 1.0,
                        "randTrig": 0.0,
                        "wet/dry": 1.0,
                        "blob": {
                          "FB-Gain": [
                            127.0
                          ],
                          "FB-level": [
                            127.0
                          ],
                          "InLevelMinMax": [
                            41,
                            81
                          ],
                          "modIn-1": [
                            75.92614238468549
                          ],
                          "modIn-2": [
                            64.13841661273909
                          ],
                          "modIn-3": [
                            72.35393831406222
                          ],
                          "modIn-4": [
                            70.02691888411783
                          ],
                          "modIn-5": [
                            74.40014880973827
                          ]
                        }
                      }
                    },
                    "active": 1
                  }
                }
              ],
              "HPF[1]": [
                20.0
              ],
              "VST_14": [
                {
                  "filetype": "C74Snapshot",
                  "version": 2,
                  "minorversion": 0,
                  "name": "AUDelay",
                  "origin": "AUDelay.auinfo",
                  "type": "AudioUnit",
                  "subtype": "AudioEffect",
                  "embed": 1,
                  "snapshot": {
                    "pluginname": "AUDelay.auinfo",
                    "plugindisplayname": "AUDelay",
                    "pluginsavedname": "",
                    "pluginsaveduniqueid": 1684368505,
                    "version": 1,
                    "isbank": 0,
                    "isbase64": 1,
                    "blob": "183.hAGaoMGcv.i0AHv.DTfAGfPBJr.CT4VXsUFWsEla0YVXiQWcxUlbTQVXzEFUzkGbkc0b0IFc4AWYWYWYxMWZu4FVU4FcoQGakQlDgAGbr8DDr...............D.....fPHC......A3CfKfG...f.BgjBs....LfQp0kmRDVclgmDjUFa4AA.HTgFmvRL4DjRO42fHB.......DP..........z....................fh"
                  }
                }
              ],
              "delay_left": [
                9
              ],
              "delay_right": [
                3
              ],
              "time": [
                200.0
              ]
            }
          }
        }
      },
      "snapshotlist": {
        "current_snapshot": 0,
        "entries": [
          {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "delay-shootout",
            "origin": "delay-shootout",
            "type": "patcher",
            "subtype": "Undefined",
            "embed": 1,
            "snapshot": {
              "valuedictionary": {
                "parameter_values": {
                  "FX_SELECT": 1.0,
                  "Feedback": -12.094488188976484,
                  "Feedback[1]": -22.11023622047248,
                  "HPF": 20.0,
                  "LPF": 20000.0,
                  "LPF[1]": 20000.0,
                  "Mix": 100.0,
                  "Mix[1]": 100.0,
                  "bypass": 0.0,
                  "bypass[1]": 0.0,
                  "live.gain~": 0.0,
                  "blob": {
                    "DEV_07": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Tapped Delay.amxd",
                        "origin": "Tapped Delay.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Tapped Delay.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Tapped Delay/Tapped Delay.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "bpm": 120.0,
                              "centerPan": 0.0,
                              "feedback": 18.4,
                              "randDelay": 0.0,
                              "randPan": 0.0,
                              "tempo": 0.0,
                              "time": 13.0,
                              "wet/dry": 100.0,
                              "blob": {
                                "levels": [
                                  0.71,
                                  0.05,
                                  0.622222,
                                  0.666667,
                                  0.722222,
                                  0.766667,
                                  0.833333,
                                  0.811111,
                                  0.722222,
                                  0.588889,
                                  0.455556,
                                  0.388889,
                                  0.366667,
                                  0.333333,
                                  0.311111,
                                  0.222222
                                ],
                                "positions": [
                                  0.0,
                                  0.242718,
                                  0.029126,
                                  -0.203883,
                                  -0.398058,
                                  -0.436893,
                                  -0.029126,
                                  0.320388,
                                  0.572816,
                                  0.572816,
                                  0.514563,
                                  0.184466,
                                  -0.165049,
                                  -0.165049,
                                  -0.087379,
                                  0.0
                                ]
                              }
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_08": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Max DelayTaps.amxd",
                        "origin": "Max DelayTaps.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Max DelayTaps.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max DelayTaps/Max DelayTaps.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "DelaysMax": 5000.0,
                              "DelaysMin": 0.0,
                              "Dry/Wet": 100.0,
                              "Feedback": 31.181102362204697,
                              "LevelsMax": 100.0,
                              "LevelsMin": 0.0,
                              "MasterGain": 0.0,
                              "PansMax": 17.999999999999993,
                              "PansMin": -50.0,
                              "blob": {
                                "Taps": [
                                  8
                                ],
                                "Delays": [
                                  0.09375,
                                  -0.17634033306210264,
                                  -0.3243747828025601,
                                  -0.42281622373462524,
                                  -0.4985673919530951,
                                  -0.560950577951363,
                                  -0.6144037494668978,
                                  -0.6614173228346454
                                ],
                                "Levels": [
                                  0.614173228346456,
                                  0.6030444859987246,
                                  0.5547258413249657,
                                  0.4557560798686663,
                                  0.2966178646531575,
                                  0.0695674562504157,
                                  -0.23205766119514856,
                                  -0.614173228346456
                                ],
                                "Pans": [
                                  -0.4566929133858266,
                                  -0.3718791813239333,
                                  -0.27223636626067743,
                                  -0.13919605008556257,
                                  0.13919605008556246,
                                  0.2722363662606773,
                                  0.37187918132393327,
                                  0.4566929133858266
                                ]
                              }
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_09": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Max DelayMultiBand.amxd",
                        "origin": "Max DelayMultiBand.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Max DelayMultiBand.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max DelayMultiBand/Max DelayMultiBand.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "DirectGain": -70.0,
                              "EffectGain": 0.0,
                              "HighDelL": 750.0,
                              "HighDelR": 0.0,
                              "HighEnable": 1.0,
                              "HighFB": 0.0,
                              "HighGain": 0.0,
                              "HighXFreq": 4000.0,
                              "LowDelL": 1200.0,
                              "LowDelR": 0.0,
                              "LowEnable": 1.0,
                              "LowFB": 0.0,
                              "LowXFreq": 1000.0,
                              "Lowgain": 0.0,
                              "MidDelL": 900.0,
                              "MidDelR": 1350.0,
                              "MidEnable": 1.0,
                              "MidFB": 45.212598425196816,
                              "MidGain": 0.0
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_10": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Space Echo.amxd",
                        "origin": "Space Echo.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Space Echo.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Space Echo/Space Echo.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "WarbleAmount": 14.0,
                              "WarbleSpeed": 43.0,
                              "bpm": 120.0,
                              "clipping": 0.63,
                              "feedback": 47.0,
                              "highpass": 220.0,
                              "inertia": 2.687,
                              "live.menu": 13.0,
                              "lowpass": 3280.0,
                              "reverb_wetdry": 27.200001,
                              "revtime": 2800.0,
                              "tempo": 0.0,
                              "wet/dry": 100.0
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_11": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Max SpectralDelay.amxd",
                        "origin": "Max SpectralDelay.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Max SpectralDelay.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Max SpectralDelay/Max SpectralDelay.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "DelayRandStep": 10.0,
                              "DelayRange": 2000.0,
                              "Dry/Wet": 100.0,
                              "FeedbackRandStep": 10.0,
                              "FeedbackRange": 50.0,
                              "Gain": 0.0,
                              "blob": {
                                "Delays": [
                                  0.464844,
                                  0.488281,
                                  0.519531,
                                  0.542969,
                                  0.519531,
                                  0.484375,
                                  0.488281,
                                  0.46875,
                                  0.453125,
                                  0.488281,
                                  0.464844,
                                  0.433594,
                                  0.453125,
                                  0.464844,
                                  0.429688,
                                  0.421875,
                                  0.441406,
                                  0.429688,
                                  0.433594,
                                  0.457031,
                                  0.472656,
                                  0.445312,
                                  0.476562,
                                  0.457031,
                                  0.445312,
                                  0.464844,
                                  0.464844,
                                  0.429688,
                                  0.429688,
                                  0.40625,
                                  0.417969,
                                  0.453125,
                                  0.457031,
                                  0.472656,
                                  0.496094,
                                  0.488281,
                                  0.46875,
                                  0.496094,
                                  0.460938,
                                  0.464844,
                                  0.445312,
                                  0.417969,
                                  0.441406,
                                  0.40625,
                                  0.429688,
                                  0.429688,
                                  0.441406,
                                  0.414062,
                                  0.386719,
                                  0.363281,
                                  0.378906,
                                  0.414062,
                                  0.445312,
                                  0.421875,
                                  0.417969,
                                  0.382812,
                                  0.347656,
                                  0.363281,
                                  0.339844,
                                  0.359375,
                                  0.371094,
                                  0.359375,
                                  0.390625,
                                  0.402344,
                                  0.425781,
                                  0.398438,
                                  0.375,
                                  0.375,
                                  0.367188,
                                  0.371094,
                                  0.402344,
                                  0.414062,
                                  0.410156,
                                  0.414062,
                                  0.402344,
                                  0.378906,
                                  0.347656,
                                  0.34375,
                                  0.363281,
                                  0.394531,
                                  0.429688,
                                  0.457031,
                                  0.484375,
                                  0.519531,
                                  0.550781,
                                  0.582031,
                                  0.570312,
                                  0.570312,
                                  0.582031,
                                  0.585938,
                                  0.5625,
                                  0.589844,
                                  0.578125,
                                  0.558594,
                                  0.5625,
                                  0.550781,
                                  0.558594,
                                  0.585938,
                                  0.601562,
                                  0.597656,
                                  0.5625,
                                  0.570312,
                                  0.539062,
                                  0.515625,
                                  0.527344,
                                  0.550781,
                                  0.554688,
                                  0.535156,
                                  0.503906,
                                  0.539062,
                                  0.566406,
                                  0.585938,
                                  0.613281,
                                  0.636719,
                                  0.664062,
                                  0.667969,
                                  0.667969,
                                  0.695312,
                                  0.714844,
                                  0.730469,
                                  0.722656,
                                  0.746094,
                                  0.777344,
                                  0.773438,
                                  0.796875,
                                  0.808594,
                                  0.785156,
                                  0.808594,
                                  0.84375,
                                  0.839844,
                                  0.863281,
                                  0.890625,
                                  0.882812,
                                  0.894531,
                                  0.871094,
                                  0.90625,
                                  0.917969,
                                  0.882812,
                                  0.882812,
                                  0.902344,
                                  0.871094,
                                  0.855469,
                                  0.886719,
                                  0.878906,
                                  0.878906,
                                  0.878906,
                                  0.859375,
                                  0.878906,
                                  0.855469,
                                  0.851562,
                                  0.820312,
                                  0.84375,
                                  0.8125,
                                  0.816406,
                                  0.800781,
                                  0.804688,
                                  0.777344,
                                  0.765625,
                                  0.789062,
                                  0.761719,
                                  0.761719,
                                  0.726562,
                                  0.699219,
                                  0.730469,
                                  0.75,
                                  0.738281,
                                  0.730469,
                                  0.714844,
                                  0.730469,
                                  0.761719,
                                  0.75,
                                  0.734375,
                                  0.703125,
                                  0.738281,
                                  0.707031,
                                  0.695312,
                                  0.675781,
                                  0.679688,
                                  0.667969,
                                  0.640625,
                                  0.675781,
                                  0.667969,
                                  0.699219,
                                  0.703125,
                                  0.675781,
                                  0.691406,
                                  0.691406,
                                  0.683594,
                                  0.703125,
                                  0.703125,
                                  0.71875,
                                  0.71875,
                                  0.726562,
                                  0.761719,
                                  0.738281,
                                  0.773438,
                                  0.777344,
                                  0.765625,
                                  0.738281,
                                  0.742188,
                                  0.769531,
                                  0.769531,
                                  0.765625,
                                  0.792969,
                                  0.765625,
                                  0.785156,
                                  0.761719,
                                  0.734375,
                                  0.699219,
                                  0.667969,
                                  0.6875,
                                  0.703125,
                                  0.699219,
                                  0.664062,
                                  0.644531,
                                  0.636719,
                                  0.621094,
                                  0.652344,
                                  0.6875,
                                  0.671875,
                                  0.644531,
                                  0.664062,
                                  0.636719,
                                  0.652344,
                                  0.628906,
                                  0.648438,
                                  0.617188,
                                  0.625,
                                  0.652344,
                                  0.621094,
                                  0.601562,
                                  0.582031,
                                  0.597656,
                                  0.5625,
                                  0.539062,
                                  0.574219,
                                  0.582031,
                                  0.574219,
                                  0.589844,
                                  0.621094,
                                  0.652344,
                                  0.632812,
                                  0.617188,
                                  0.636719,
                                  0.660156,
                                  0.652344,
                                  0.632812,
                                  0.65625,
                                  0.675781,
                                  0.679688,
                                  0.679688,
                                  0.6875,
                                  0.65625,
                                  0.648438,
                                  0.675781,
                                  0.679688
                                ],
                                "Feedbacks": [
                                  0.710938,
                                  0.746094,
                                  0.71875,
                                  0.71875,
                                  0.753906,
                                  0.734375,
                                  0.707031,
                                  0.734375,
                                  0.746094,
                                  0.742188,
                                  0.753906,
                                  0.773438,
                                  0.753906,
                                  0.789062,
                                  0.792969,
                                  0.796875,
                                  0.796875,
                                  0.820312,
                                  0.820312,
                                  0.804688,
                                  0.808594,
                                  0.832031,
                                  0.8125,
                                  0.816406,
                                  0.796875,
                                  0.808594,
                                  0.789062,
                                  0.765625,
                                  0.738281,
                                  0.738281,
                                  0.71875,
                                  0.710938,
                                  0.703125,
                                  0.710938,
                                  0.699219,
                                  0.675781,
                                  0.675781,
                                  0.6875,
                                  0.652344,
                                  0.667969,
                                  0.644531,
                                  0.664062,
                                  0.648438,
                                  0.628906,
                                  0.648438,
                                  0.664062,
                                  0.636719,
                                  0.664062,
                                  0.671875,
                                  0.683594,
                                  0.714844,
                                  0.679688,
                                  0.707031,
                                  0.742188,
                                  0.734375,
                                  0.742188,
                                  0.726562,
                                  0.71875,
                                  0.742188,
                                  0.714844,
                                  0.730469,
                                  0.695312,
                                  0.671875,
                                  0.652344,
                                  0.6875,
                                  0.71875,
                                  0.738281,
                                  0.746094,
                                  0.722656,
                                  0.726562,
                                  0.742188,
                                  0.722656,
                                  0.707031,
                                  0.730469,
                                  0.710938,
                                  0.675781,
                                  0.691406,
                                  0.703125,
                                  0.722656,
                                  0.699219,
                                  0.703125,
                                  0.714844,
                                  0.738281,
                                  0.773438,
                                  0.789062,
                                  0.796875,
                                  0.78125,
                                  0.804688,
                                  0.804688,
                                  0.835938,
                                  0.871094,
                                  0.898438,
                                  0.882812,
                                  0.851562,
                                  0.875,
                                  0.851562,
                                  0.835938,
                                  0.8125,
                                  0.84375,
                                  0.84375,
                                  0.875,
                                  0.863281,
                                  0.84375,
                                  0.8125,
                                  0.828125,
                                  0.828125,
                                  0.835938,
                                  0.839844,
                                  0.875,
                                  0.851562,
                                  0.832031,
                                  0.839844,
                                  0.808594,
                                  0.785156,
                                  0.757812,
                                  0.746094,
                                  0.75,
                                  0.773438,
                                  0.804688,
                                  0.800781,
                                  0.804688,
                                  0.773438,
                                  0.742188,
                                  0.722656,
                                  0.722656,
                                  0.746094,
                                  0.734375,
                                  0.722656,
                                  0.695312,
                                  0.703125,
                                  0.683594,
                                  0.667969,
                                  0.65625,
                                  0.644531,
                                  0.632812,
                                  0.640625,
                                  0.65625,
                                  0.691406,
                                  0.726562,
                                  0.75,
                                  0.734375,
                                  0.765625,
                                  0.75,
                                  0.742188,
                                  0.761719,
                                  0.734375,
                                  0.734375,
                                  0.730469,
                                  0.726562,
                                  0.695312,
                                  0.679688,
                                  0.679688,
                                  0.660156,
                                  0.648438,
                                  0.683594,
                                  0.667969,
                                  0.6875,
                                  0.683594,
                                  0.648438,
                                  0.632812,
                                  0.628906,
                                  0.609375,
                                  0.59375,
                                  0.597656,
                                  0.574219,
                                  0.609375,
                                  0.617188,
                                  0.644531,
                                  0.625,
                                  0.652344,
                                  0.648438,
                                  0.625,
                                  0.660156,
                                  0.640625,
                                  0.613281,
                                  0.644531,
                                  0.617188,
                                  0.644531,
                                  0.625,
                                  0.625,
                                  0.625,
                                  0.660156,
                                  0.648438,
                                  0.632812,
                                  0.664062,
                                  0.664062,
                                  0.636719,
                                  0.613281,
                                  0.617188,
                                  0.617188,
                                  0.617188,
                                  0.605469,
                                  0.613281,
                                  0.59375,
                                  0.625,
                                  0.648438,
                                  0.664062,
                                  0.664062,
                                  0.695312,
                                  0.695312,
                                  0.664062,
                                  0.691406,
                                  0.660156,
                                  0.636719,
                                  0.605469,
                                  0.625,
                                  0.660156,
                                  0.683594,
                                  0.664062,
                                  0.691406,
                                  0.660156,
                                  0.65625,
                                  0.644531,
                                  0.628906,
                                  0.648438,
                                  0.683594,
                                  0.675781,
                                  0.65625,
                                  0.664062,
                                  0.664062,
                                  0.660156,
                                  0.640625,
                                  0.605469,
                                  0.574219,
                                  0.585938,
                                  0.609375,
                                  0.59375,
                                  0.601562,
                                  0.589844,
                                  0.589844,
                                  0.582031,
                                  0.578125,
                                  0.570312,
                                  0.539062,
                                  0.511719,
                                  0.511719,
                                  0.515625,
                                  0.527344,
                                  0.5,
                                  0.535156,
                                  0.558594,
                                  0.574219,
                                  0.546875,
                                  0.574219,
                                  0.550781,
                                  0.574219,
                                  0.570312,
                                  0.558594,
                                  0.539062,
                                  0.519531,
                                  0.492188,
                                  0.492188,
                                  0.46875,
                                  0.496094,
                                  0.496094,
                                  0.507812
                                ]
                              }
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_12": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Pitch & Echo.amxd",
                        "origin": "Pitch & Echo.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Pitch & Echo.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Pitch & Echo.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "Dry/Wet": 100.0,
                              "EchoEnable": 1.0,
                              "EchoFeedback": 50.0,
                              "EchoMode": 0.0,
                              "EchoSync": 13.0,
                              "EchoTime": 1248.031496062988,
                              "Gain": 0.0,
                              "Glide": 50.0,
                              "Latency": 1.0,
                              "Quality": 3.0,
                              "Transp": 935.0,
                              "VibDepth": 25.0,
                              "VibDirection": 0.0,
                              "VibEnable": 0.0,
                              "VibNoiseAmount": 50.0,
                              "VibNoiseEnable": 0.0,
                              "VibOscAmount": 50.0,
                              "VibOscEnable": 1.0,
                              "VibRate": 4.0
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "DEV_13": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Feedback Network.amxd",
                        "origin": "Feedback Network.amxd",
                        "type": "amxd",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                          "name": "Feedback Network.amxd",
                          "origname": "Package:/Max for Live/patchers/Max Audio Effect/Feedback Network/Feedback Network.amxd",
                          "valuedictionary": {
                            "parameter_values": {
                              "AFB-Clip": 24.12000300000008,
                              "AFB-Rate": 34.48799900000007,
                              "AFB-Sens": 34.992001000000066,
                              "Auto-FB": 1.0,
                              "AutoGainRate": 57.568001000000066,
                              "AutoNetRate": 71.37599900000001,
                              "AutoRandNetwork": 1.0,
                              "GL-Delay": 58.928001,
                              "GL-Freq": 15.0,
                              "GL-Q": 24.56000100000001,
                              "RandInLevels": 1.0,
                              "RandSmooth": 1.0,
                              "randTrig": 0.0,
                              "wet/dry": 1.0,
                              "blob": {
                                "FB-Gain": [
                                  127.0
                                ],
                                "FB-level": [
                                  127.0
                                ],
                                "InLevelMinMax": [
                                  41,
                                  81
                                ],
                                "modIn-1": [
                                  75.92614238468549
                                ],
                                "modIn-2": [
                                  64.13841661273909
                                ],
                                "modIn-3": [
                                  72.35393831406222
                                ],
                                "modIn-4": [
                                  70.02691888411783
                                ],
                                "modIn-5": [
                                  74.40014880973827
                                ]
                              }
                            }
                          },
                          "active": 1
                        }
                      }
                    ],
                    "HPF[1]": [
                      20.0
                    ],
                    "VST_14": [
                      {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "AUDelay",
                        "origin": "AUDelay.auinfo",
                        "type": "AudioUnit",
                        "subtype": "AudioEffect",
                        "embed": 1,
                        "snapshot": {
                          "pluginname": "AUDelay.auinfo",
                          "plugindisplayname": "AUDelay",
                          "pluginsavedname": "",
                          "pluginsaveduniqueid": 1684368505,
                          "version": 1,
                          "isbank": 0,
                          "isbase64": 1,
                          "blob": "183.hAGaoMGcv.i0AHv.DTfAGfPBJr.CT4VXsUFWsEla0YVXiQWcxUlbTQVXzEFUzkGbkc0b0IFc4AWYWYWYxMWZu4FVU4FcoQGakQlDgAGbr8DDr...............D.....fPHC......A3CfKfG...f.BgjBs....LfQp0kmRDVclgmDjUFa4AA.HTgFmvRL4DjRO42fHB.......DP..........z....................fh"
                        }
                      }
                    ],
                    "delay_left": [
                      9
                    ],
                    "delay_right": [
                      3
                    ],
                    "time": [
                      200.0
                    ]
                  }
                }
              }
            },
            "fileref": {
              "name": "delay-shootout",
              "filename": "delay-shootout.maxsnap",
              "filepath": "~/Documents/Max 9/Snapshots",
              "filepos": -1,
              "snapshotfileid": "de8041caeec067fa75e78b3d2d1db366"
            }
          }
        ]
      }
    },
    "parameters": {
      "obj-107::obj-1": [
        "Mix[1]",
        "Mix",
        0
      ],
      "obj-107::obj-21": [
        "HPF[1]",
        "HPF",
        0
      ],
      "obj-107::obj-25": [
        "LPF[1]",
        "LPF",
        0
      ],
      "obj-107::obj-28": [
        "Feedback[1]",
        "Feedback",
        0
      ],
      "obj-107::obj-7": [
        "bypass[1]",
        "bypass",
        0
      ],
      "obj-107::obj-9": [
        "time",
        "Time",
        0
      ],
      "obj-122::obj-118": [
        "Mix",
        "Mix",
        0
      ],
      "obj-122::obj-27": [
        "Feedback",
        "Feedback",
        0
      ],
      "obj-122::obj-49": [
        "HPF",
        "HPF",
        0
      ],
      "obj-122::obj-50": [
        "LPF",
        "LPF",
        0
      ],
      "obj-122::obj-7": [
        "bypass",
        "bypass",
        0
      ],
      "obj-122::obj-708": [
        "duration.r",
        "duration.r",
        0
      ],
      "obj-122::obj-9": [
        "delay_right",
        "delay_right",
        0
      ],
      "obj-122::obj-957": [
        "duration.l",
        "duration.l",
        0
      ],
      "obj-122::obj-96": [
        "delay_left",
        "delay_left",
        0
      ],
      "obj-137": [
        "DEV_07",
        "DEV_07",
        0
      ],
      "obj-150": [
        "DEV_08",
        "DEV_08",
        0
      ],
      "obj-163": [
        "DEV_09",
        "DEV_09",
        0
      ],
      "obj-174": [
        "DEV_10",
        "DEV_10",
        0
      ],
      "obj-187": [
        "DEV_11",
        "DEV_11",
        0
      ],
      "obj-200": [
        "DEV_12",
        "DEV_12",
        0
      ],
      "obj-213": [
        "DEV_13",
        "DEV_13",
        0
      ],
      "obj-225": [
        "VST_14",
        "VST_14",
        0
      ],
      "obj-28": [
        "FX_SELECT",
        "FX",
        0
      ],
      "obj-303": [
        "live.gain~",
        "live.gain~",
        0
      ],
      "parameterbanks": {
        "0": {
          "index": 0,
          "name": "",
          "parameters": [
            "-",
            "-",
            "-",
            "-",
            "-",
            "-",
            "-",
            "-"
          ],
          "buttons": [
            "-",
            "-",
            "-",
            "-",
            "-",
            "-",
            "-",
            "-"
          ]
        }
      },
      "inherited_shortname": 1
    }
  }
}
